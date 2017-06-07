From: Christian Stewart <christian@paral.in>
Date: Wed,  7 Jun 2017 15:56:28 -0700
Subject: [Buildroot] [PATCH 2/2] docker-engine: add dependency on
	docker-proxy
In-Reply-To: <20170607225628.31423-1-christian@paral.in>
References: <20170607225628.31423-1-christian@paral.in>
Message-ID: <20170607225628.31423-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

docker-proxy is needed by docker-engine at runtime, and was
previously not included. This leads to the following error
when attempting to port-map ports to a container:

  $ docker run -p 8080:8080 nginx
  docker: Error response from daemon: driver failed programming external
  connectivity on endpoint:
  exec: "docker-proxy": executable file not found in $PATH.

Docker expects the docker-proxy binary to exist in the PATH.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 05670a7..8feb11b 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 	default y
 	depends on BR2_USE_MMU # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
+	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
 	select BR2_PACKAGE_SQLITE # runtime dependency
 	help
-- 
2.10.2
