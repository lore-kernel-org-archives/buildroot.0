From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 15:20:44 +0200
Subject: [Buildroot] [git commit] Revert "package/runc: blacklist
 Codesourcery ARM toolchain"
Message-ID: <20190407131803.DEC648004A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18fb2167f7f41bd5702860d35459a0f498d941a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ce76a989022baa6395b874ed44b9246bba053f8a.

With the bump to 1.0.0-rc7, runc no longer needs O_TMPFILE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/Config.in | 2 --
 package/docker-engine/Config.in     | 2 --
 package/runc/Config.in              | 2 --
 3 files changed, 6 deletions(-)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index ffa2b208f2..8d80d8623b 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # runc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # runc
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_RUNC # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
@@ -36,4 +35,3 @@ comment "docker-containerd needs a glibc or musl toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index bc36b05bed..8364759ae1 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # docker-containerd -> runc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # docker-containerd -> runc
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # docker-containerd -> runc
 	depends on BR2_USE_MMU # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
@@ -57,5 +56,4 @@ comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	depends on BR2_USE_MMU
diff --git a/package/runc/Config.in b/package/runc/Config.in
index 8939193048..2f32bce207 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_RUNC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # O_TMPFILE
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # glibc < 2.19
 	help
 	  runC is a CLI tool for spawning and running containers
 	  according to the OCP specification.
@@ -17,4 +16,3 @@ comment "runc needs a glibc or musl toolchain w/ threads, headers >= 3.11"
 		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAN_USES_UCLIBC
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
