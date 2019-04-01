From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  1 Apr 2019 20:23:47 +0200
Subject: [Buildroot] [PATCH 3/7] Revert "runc: depend on linux headers >=
 3.11 for O_TMPFILE"
In-Reply-To: <20190401182352.26342-1-peter@korsgaard.com>
References: <20190401182352.26342-1-peter@korsgaard.com>
Message-ID: <20190401182352.26342-4-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 905e976a6af224b3ed015c46fcea2d717c155f55.

With the bump to 1.0.0-rc7, runc no longer needs O_TMPFILE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/Config.in | 4 +---
 package/docker-engine/Config.in     | 6 ++----
 package/runc/Config.in              | 6 ++----
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 8d80d8623b..35867df21a 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # runc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_RUNC # runtime dependency
@@ -33,5 +32,4 @@ comment "docker-containerd needs a glibc or musl toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 8364759ae1..1fd229fcbb 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # docker-containerd -> runc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # docker-containerd -> runc
 	depends on BR2_USE_MMU # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
@@ -51,9 +50,8 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 
 endif
 
-comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.11"
+comment "docker-engine needs a glibc or musl toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_USE_MMU
diff --git a/package/runc/Config.in b/package/runc/Config.in
index 2f32bce207..f181ee334f 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_RUNC
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # O_TMPFILE
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	help
 	  runC is a CLI tool for spawning and running containers
@@ -11,8 +10,7 @@ config BR2_PACKAGE_RUNC
 
 	  https://github.com/opencontainers/runc
 
-comment "runc needs a glibc or musl toolchain w/ threads, headers >= 3.11"
+comment "runc needs a glibc or musl toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
 		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAN_USES_UCLIBC
-- 
2.11.0
