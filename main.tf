terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "~> 3.0"
    }
    }
  }
provider "docker" {
    host = "unix:///var/run/docker.sock"
}
resource "docker_imgage" "nginx" {
    name = "nginx:alpine"
    keep_locally = true
}

resource "docker_container" "nginx" {
    name = "it7027c-cicd-nginx"
    image = docker_image.nginx.image_id
    
    ports {
        internal = 80
        external = 8080
    }
}

output = "container_name" {
    value = docker_container.nginx.name
}