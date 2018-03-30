From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:18:59 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] docker-engine: add
 dependency on docker-proxy
Message-ID: <20180330213159.DDF6A83EBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16a52502ae9f327745d0fe65ab1b3d4f0bd6a6e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

docker-proxy is needed by docker-engine at runtime, and was
previously not included. This leads to the following error
when attempting to port-map ports to a container:

  $ docker run -p 8080:8080 nginx
  docker: Error response from daemon: driver failed programming external
  connectivity on endpoint:
  exec: "docker-proxy": executable file not found in $PATH.

Docker expects the docker-proxy binary to exist in the PATH.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8d125cd9f646420467aa1426ebb45078eb815ef7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 05670a716e..8feb11b48c 100644
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
