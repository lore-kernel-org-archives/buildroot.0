From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Feb 2019 12:06:03 +0100
Subject: [Buildroot] [git commit] package/docker-engine: drop unused _DAEMON
 option
Message-ID: <20190202110512.A04C0825CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c47edee82c556b01153bc8f6e440d50f782f50e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit de336584d2 (package/docker-engine: split docker-{cli, engine},
bump to v18.09.0), the docker-engine package only builds the daemon part,
and the .mk file no longer use the _DAEMON option, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/Config.in | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 11f17820a7..2a0c130fce 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -3,6 +3,11 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # docker-containerd
+	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
+	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
+	select BR2_PACKAGE_IPTABLES # runtime dependency
+	select BR2_PACKAGE_SQLITE # runtime dependency
 	help
 	  Docker is a platform to build, ship,
 	  and run applications as lightweight containers.
@@ -11,23 +16,9 @@ config BR2_PACKAGE_DOCKER_ENGINE
 
 if BR2_PACKAGE_DOCKER_ENGINE
 
-config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
-	bool "docker daemon"
-	default y
-	depends on BR2_USE_MMU # docker-containerd
-	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
-	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
-	select BR2_PACKAGE_IPTABLES # runtime dependency
-	select BR2_PACKAGE_SQLITE # runtime dependency
-	help
-	  Build the Docker system daemon.
-	  If not selected, will build client only.
-
 config BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL
 	bool "build experimental features"
 
-if BR2_PACKAGE_DOCKER_ENGINE_DAEMON
-
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
 	bool "btrfs filesystem driver"
 	depends on BR2_USE_MMU # btrfs-progs
@@ -58,9 +49,8 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 
 endif
 
-endif
-
 comment "docker-engine needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
