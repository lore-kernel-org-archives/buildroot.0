From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Mar 2019 17:54:51 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] runc: depend on linux
 headers >= 3.11 for O_TMPFILE
Message-ID: <20190317165245.9EC9B8371F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82d40d87b0441ae4d88c05737f8d9322668b14da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes:
http://autobuild.buildroot.net/results/63e9d88ae5177541be463f1e2aafec59aa410479

Add dependency on headers >= 3.11 for O_TMPFILE, used by runc after the
fix for CVE-2019-5736 and propagate to the reverse dependencies of runc.

Notice that C library support for O_TMPFILE is also needed, which was added
in glibc 2.19 and musl 0.9.15.

Signed-off-by: Christian Stewart <christian@paral.in>
[Peter: squash series, extend commit message, mention C library dependency,
	fix indentation]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 905e976a6af224b3ed015c46fcea2d717c155f55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/Config.in | 4 +++-
 package/docker-engine/Config.in     | 6 ++++--
 package/runc/Config.in              | 6 ++++--
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 5e0cc1e877..3de3dc6da2 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # runc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_RUNC # runtime dependency
@@ -32,4 +33,5 @@ comment "docker-containerd needs a glibc or musl toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 3c97310484..cd878880ae 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # docker-containerd -> runc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # docker-containerd -> runc
 	depends on BR2_USE_MMU # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
@@ -50,8 +51,9 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 
 endif
 
-comment "docker-engine needs a glibc or musl toolchain w/ threads"
+comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.11"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_USE_MMU
diff --git a/package/runc/Config.in b/package/runc/Config.in
index 47c850ef30..5b08b91032 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RUNC
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # O_TMPFILE
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	help
 	  runC is a CLI tool for spawning and running containers
@@ -10,7 +11,8 @@ config BR2_PACKAGE_RUNC
 
 	  https://github.com/opencontainers/runc
 
-comment "runc needs a glibc or musl toolchain toolchain w/ threads"
+comment "runc needs a glibc or musl toolchain w/ threads, headers >= 3.11"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
 		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAN_USES_UCLIBC
