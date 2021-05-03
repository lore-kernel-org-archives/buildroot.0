From: Christian Stewart <christian@paral.in>
Date: Sun,  2 May 2021 20:12:50 -0700
Subject: [Buildroot] [PATCH v1 1/2] package/docker-containerd: rename
 package to containerd
Message-ID: <20210503031251.200043-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

containerd is now an independent project from Docker.

This commit renames the Buildroot package from docker-containerd to containerd,
adding a entry in Config.in.legacy accordingly.

containerd is an industry-standard container runtime with an emphasis on
simplicity, robustness and portability. It is available as a daemon for Linux
and Windows, which can manage the complete container lifecycle of its host
system: image transfer and storage, container execution and supervision,
low-level storage and network attachments, etc.

https://containerd.io

Signed-off-by: Christian Stewart <christian@paral.in>
---
 Config.in.legacy                              |  8 ++++
 package/Config.in                             |  2 +-
 .../Config.in                                 | 10 ++---
 .../containerd.hash}                          |  2 +-
 package/containerd/containerd.mk              | 44 +++++++++++++++++++
 .../docker-containerd/docker-containerd.mk    | 44 -------------------
 6 files changed, 59 insertions(+), 51 deletions(-)
 rename package/{docker-containerd => containerd}/Config.in (82%)
 rename package/{docker-containerd/docker-containerd.hash => containerd/containerd.hash} (80%)
 create mode 100644 package/containerd/containerd.mk
 delete mode 100644 package/docker-containerd/docker-containerd.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 05b0e0d0da..d583f3b603 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_DOCKER_CONTAINERD
+	bool "docker-containerd package was renamed to containerd"
+	select BR2_LEGACY
+	select BR2_PACKAGE_CONTAINERD
+	help
+	  The containerd project is now independent from Docker.
+	  The package was renamed to containerd accordingly.
+
 config BR2_PACKAGE_IOSTAT
 	bool "iostat removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 7ac10b9d42..5c28d46ed2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2427,6 +2427,7 @@ menu "System tools"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/coreutils/Config.in"
+	source "package/containerd/Config.in"
 	source "package/cpuload/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
@@ -2435,7 +2436,6 @@ menu "System tools"
 	source "package/debianutils/Config.in"
 	source "package/docker-cli/Config.in"
 	source "package/docker-compose/Config.in"
-	source "package/docker-containerd/Config.in"
 	source "package/docker-engine/Config.in"
 	source "package/docker-proxy/Config.in"
 	source "package/earlyoom/Config.in"
diff --git a/package/docker-containerd/Config.in b/package/containerd/Config.in
similarity index 82%
rename from package/docker-containerd/Config.in
rename to package/containerd/Config.in
index 9568dd0a2a..0e3a55ef39 100644
--- a/package/docker-containerd/Config.in
+++ b/package/containerd/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_DOCKER_CONTAINERD
-	bool "docker-containerd"
+config BR2_PACKAGE_CONTAINERD
+	bool "containerd"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -16,9 +16,9 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 
 	  https://containerd.io/
 
-if BR2_PACKAGE_DOCKER_CONTAINERD
+if BR2_PACKAGE_CONTAINERD
 
-config BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS
+config BR2_PACKAGE_CONTAINERD_DRIVER_BTRFS
 	bool "btrfs snapshot driver"
 	depends on BR2_USE_MMU # btrfs-progs
 	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
@@ -28,7 +28,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS
 
 endif
 
-comment "docker-containerd needs a glibc or musl toolchain w/ threads"
+comment "containerd needs a glibc or musl toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
diff --git a/package/docker-containerd/docker-containerd.hash b/package/containerd/containerd.hash
similarity index 80%
rename from package/docker-containerd/docker-containerd.hash
rename to package/containerd/containerd.hash
index bb544e8d60..b3cb3e47ad 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  ac62c64664bf62fd44df0891c896eecdb6d93def3438271d7892dca75bc069d1  docker-containerd-1.4.4.tar.gz
+sha256  ac62c64664bf62fd44df0891c896eecdb6d93def3438271d7892dca75bc069d1  containerd-1.4.4.tar.gz
 sha256	4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
new file mode 100644
index 0000000000..761e08003c
--- /dev/null
+++ b/package/containerd/containerd.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# containerd
+#
+################################################################################
+
+CONTAINERD_VERSION = 1.4.4
+CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
+CONTAINERD_LICENSE = Apache-2.0
+CONTAINERD_LICENSE_FILES = LICENSE
+CONTAINERD_CPE_ID_VENDOR = linuxfoundation
+CONTAINERD_CPE_ID_PRODUCT = containerd
+
+CONTAINERD_GOMOD = github.com/containerd/containerd
+
+CONTAINERD_LDFLAGS = \
+	-X $(CONTAINERD_GOMOD)/version.Version=$(CONTAINERD_VERSION)
+
+CONTAINERD_BUILD_TARGETS = \
+	cmd/containerd \
+	cmd/containerd-shim \
+	cmd/containerd-shim-runc-v1 \
+	cmd/containerd-shim-runc-v2 \
+	cmd/ctr
+
+CONTAINERD_INSTALL_BINS = $(notdir $(CONTAINERD_BUILD_TARGETS))
+
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+CONTAINERD_DEPENDENCIES += libapparmor
+CONTAINERD_TAGS += apparmor
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf
+CONTAINERD_TAGS += seccomp
+endif
+
+ifeq ($(BR2_PACKAGE_CONTAINERD_DRIVER_BTRFS),y)
+CONTAINERD_DEPENDENCIES += btrfs-progs
+else
+CONTAINERD_TAGS += no_btrfs
+endif
+
+$(eval $(golang-package))
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
deleted file mode 100644
index e229d9cb54..0000000000
--- a/package/docker-containerd/docker-containerd.mk
+++ /dev/null
@@ -1,44 +0,0 @@
-################################################################################
-#
-# docker-containerd
-#
-################################################################################
-
-DOCKER_CONTAINERD_VERSION = 1.4.4
-DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
-DOCKER_CONTAINERD_LICENSE = Apache-2.0
-DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
-DOCKER_CONTAINERD_CPE_ID_VENDOR = linuxfoundation
-DOCKER_CONTAINERD_CPE_ID_PRODUCT = containerd
-
-DOCKER_CONTAINERD_GOMOD = github.com/containerd/containerd
-
-DOCKER_CONTAINERD_LDFLAGS = \
-	-X $(DOCKER_CONTAINERD_GOMOD)/version.Version=$(DOCKER_CONTAINERD_VERSION)
-
-DOCKER_CONTAINERD_BUILD_TARGETS = \
-	cmd/containerd \
-	cmd/containerd-shim \
-	cmd/containerd-shim-runc-v1 \
-	cmd/containerd-shim-runc-v2 \
-	cmd/ctr
-
-DOCKER_CONTAINERD_INSTALL_BINS = $(notdir $(DOCKER_CONTAINERD_BUILD_TARGETS))
-
-ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
-DOCKER_CONTAINERD_DEPENDENCIES += libapparmor
-DOCKER_CONTAINERD_TAGS += apparmor
-endif
-
-ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-DOCKER_CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf
-DOCKER_CONTAINERD_TAGS += seccomp
-endif
-
-ifeq ($(BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS),y)
-DOCKER_CONTAINERD_DEPENDENCIES += btrfs-progs
-else
-DOCKER_CONTAINERD_TAGS += no_btrfs
-endif
-
-$(eval $(golang-package))
-- 
2.31.1
