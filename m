From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:20:53 +0100
Subject: [Buildroot] [git commit] package/go: rename
 BR2_PACKAGE_HOST_GO_{ARCH_SUPPORTS, CGO_LINKING_SUPPORTS}
Message-ID: <20190317162403.0DCB48E999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8291bc77930a5ef87f98d1ff97c486dddfcdb244
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hidden Config.in option BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS name is
not very clear as to whether it says whether Go is available for the
target architecture or the host architecture.

Until now, this was fine since there was support for host Go
packages. But as we are about to introduce support for building host
Go packages, we need to clarify the meaning of
BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS. Since it says whether the target
architecture has support for Go or not, we rename it to
BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS.

And since BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS is tightly related,
we rename it to BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
[Thomas: entirely rewrite commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-golang.txt | 8 +++++---
 package/docker-cli/Config.in           | 8 ++++----
 package/docker-containerd/Config.in    | 8 ++++----
 package/docker-engine/Config.in        | 8 ++++----
 package/docker-proxy/Config.in         | 8 ++++----
 package/flannel/Config.in              | 8 ++++----
 package/go/Config.in.host              | 7 ++++---
 package/mender/Config.in               | 8 ++++----
 package/runc/Config.in                 | 8 ++++----
 9 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/docs/manual/adding-packages-golang.txt b/docs/manual/adding-packages-golang.txt
index efcf696867..ae90eb7d4f 100644
--- a/docs/manual/adding-packages-golang.txt
+++ b/docs/manual/adding-packages-golang.txt
@@ -45,9 +45,11 @@ built.
 ==== +golang-package+ reference
 
 In their +Config.in+ file, packages using the +golang-package+
-infrastructure should depend on +BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS+
-and +BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS+ because Buildroot will
-automatically add a dependency on +host-go+ to such packages.
+infrastructure should depend on +BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS+
+because Buildroot will automatically add a dependency on +host-go+
+to such packages.
+If you need CGO support in your package, you must add a dependency on
++BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS+.
 
 The main macro of the Go package infrastructure is
 +golang-package+. It is similar to the +generic-package+ macro. Only
diff --git a/package/docker-cli/Config.in b/package/docker-cli/Config.in
index 82c35c453d..6f187c9d22 100644
--- a/package/docker-cli/Config.in
+++ b/package/docker-cli/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DOCKER_CLI
 	bool "docker-cli"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Docker is a platform to build, ship,
@@ -20,6 +20,6 @@ config BR2_PACKAGE_DOCKER_CLI_STATIC
 endif
 
 comment "docker-cli needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 4a4db1cde1..ffa2b208f2 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DOCKER_CONTAINERD
 	bool "docker-containerd"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # runc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
@@ -31,8 +31,8 @@ config BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS
 endif
 
 comment "docker-containerd needs a glibc or musl toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 08f30e434a..bc36b05bed 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DOCKER_ENGINE
 	bool "docker-engine"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # docker-containerd -> runc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # docker-containerd -> runc
@@ -53,8 +53,8 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 endif
 
 comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.11"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
diff --git a/package/docker-proxy/Config.in b/package/docker-proxy/Config.in
index 596e18a3f3..7e40536537 100644
--- a/package/docker-proxy/Config.in
+++ b/package/docker-proxy/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DOCKER_PROXY
 	bool "docker-proxy"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Libnetwork is a Container Network Model that provides a
@@ -14,6 +14,6 @@ config BR2_PACKAGE_DOCKER_PROXY
 	  https://github.com/docker/libnetwork
 
 comment "docker-proxy needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index 134111b1c0..326361080f 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -1,12 +1,12 @@
 comment "flannel needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
-		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_FLANNEL
 	bool "flannel"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Flannel is a virtual network that gives a subnet to each
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index f619ca0073..893a448709 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -1,4 +1,5 @@
-config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+# Target go packages should depend on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
@@ -10,10 +11,10 @@ config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	# MIPS R6 support in Go has not yet been developed.
 	depends on !BR2_MIPS_CPU_MIPS64R6
 
-config BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	# Go doesn't support CGO linking on MIPS64x platforms
 	# See: https://github.com/karalabe/xgo/issues/46
 	depends on !BR2_mips64 && !BR2_mips64el
diff --git a/package/mender/Config.in b/package/mender/Config.in
index aeb0b2694f..5ab2304e49 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MENDER
 	bool "mender"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UBOOT_TOOLS # runtime
 	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
@@ -14,6 +14,6 @@ config BR2_PACKAGE_MENDER
 	  https://github.com/mendersoftware/mender
 
 comment "mender needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/runc/Config.in b/package/runc/Config.in
index cfd26e9813..8939193048 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_RUNC
 	bool "runc"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # O_TMPFILE
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
@@ -13,8 +13,8 @@ config BR2_PACKAGE_RUNC
 	  https://github.com/opencontainers/runc
 
 comment "runc needs a glibc or musl toolchain w/ threads, headers >= 3.11"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
-		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAN_USES_UCLIBC
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
