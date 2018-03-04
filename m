From: Christian Stewart <christian@paral.in>
Date: Sat,  3 Mar 2018 19:43:43 -0500
Subject: [Buildroot] [PATCH v3 5/8] docker-engine: add dependency on
 docker-proxy
In-Reply-To: <20180304004346.331-1-christian@paral.in>
References: <20180304004346.331-1-christian@paral.in>
Message-ID: <20180304004346.331-6-christian@paral.in>
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
index 7d9a87f7bb..a76940b6c0 100644
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
2.13.6
