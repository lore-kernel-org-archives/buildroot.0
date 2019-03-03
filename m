From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  3 Mar 2019 21:38:45 +0100
Subject: [Buildroot] [PATCH] package/runc: blacklist Codesourcery ARM
 toolchain
Message-ID: <20190303203845.30335-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/018e309caa0fc662aa2993e47b2037fb6c569011/

This toolchain uses glibc 2.18, which does not provide O_TMPFILE support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/Config.in | 2 ++
 package/docker-engine/Config.in     | 2 ++
 package/runc/Config.in              | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 3de3dc6da2..4a4db1cde1 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # runc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # runc
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_RUNC # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
@@ -35,3 +36,4 @@ comment "docker-containerd needs a glibc or musl toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index cd878880ae..08f30e434a 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # docker-containerd -> runc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # docker-containerd -> runc
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # docker-containerd -> runc
 	depends on BR2_USE_MMU # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
@@ -56,4 +57,5 @@ comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	depends on BR2_USE_MMU
diff --git a/package/runc/Config.in b/package/runc/Config.in
index 5b08b91032..cfd26e9813 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_RUNC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # O_TMPFILE
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # glibc < 2.19
 	help
 	  runC is a CLI tool for spawning and running containers
 	  according to the OCP specification.
@@ -16,3 +17,4 @@ comment "runc needs a glibc or musl toolchain w/ threads, headers >= 3.11"
 		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
-- 
2.11.0
