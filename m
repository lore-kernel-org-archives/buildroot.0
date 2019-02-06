From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  6 Feb 2019 14:23:57 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/go: refactor host/target
 dependencies
In-Reply-To: <1549459439-2260-1-git-send-email-angelo@amarulasolutions.com>
References: <1549459439-2260-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549459439-2260-2-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to better handling the host/target dependencies of packages, we
need to add the new configuration option
BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS.
All golang target packages should depends on this options.
Host packages needs to depend instead on
BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
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
index efcf696..1b46778 100644
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
+If you need CGO support in your package, you can add a dependency on
++BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS+.
 
 The main macro of the Go package infrastructure is
 +golang-package+. It is similar to the +generic-package+ macro. Only
diff --git a/package/docker-cli/Config.in b/package/docker-cli/Config.in
index 82c35c4..6f187c9 100644
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
index 851345f..5c0897d 100644
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
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_RUNC # runtime dependency
@@ -28,7 +28,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS
 endif
 
 comment "docker-containerd needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 2a0c130..6780769 100644
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
 	depends on BR2_USE_MMU # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
@@ -50,7 +50,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 endif
 
 comment "docker-engine needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/docker-proxy/Config.in b/package/docker-proxy/Config.in
index 596e18a..7e40536 100644
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
index 134111b..3263610 100644
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
index f619ca0..893a448 100644
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
index aeb0b26..5ab2304 100644
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
index fd5dee7..9e06d2b 100644
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
 	help
 	  runC is a CLI tool for spawning and running containers
@@ -10,6 +10,6 @@ config BR2_PACKAGE_RUNC
 	  https://github.com/opencontainers/runc
 
 comment "runc needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
-		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.7.4
