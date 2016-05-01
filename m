From: Christian Stewart <christian@paral.in>
Date: Sun,  1 May 2016 03:04:15 -0400
Subject: [Buildroot] [PATCH v2 3/3] docker-engine: new package
In-Reply-To: <1462086255-17151-1-git-send-email-christian@paral.in>
References: <1462086255-17151-1-git-send-email-christian@paral.in>
Message-ID: <1462086255-17151-4-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Docker is a platform to build, ship, and run applications in portable
containers.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                        |  1 +
 package/docker-engine/Config.in          | 61 +++++++++++++++++++++
 package/docker-engine/docker-engine.hash |  2 +
 package/docker-engine/docker-engine.mk   | 94 ++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+)
 create mode 100644 package/docker-engine/Config.in
 create mode 100644 package/docker-engine/docker-engine.hash
 create mode 100644 package/docker-engine/docker-engine.mk

diff --git a/package/Config.in b/package/Config.in
index c8365f8..b54c5b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1631,6 +1631,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
 endif
+	source "package/docker-engine/Config.in"
 	source "package/docker-containerd/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
new file mode 100644
index 0000000..101ab0c
--- /dev/null
+++ b/package/docker-engine/Config.in
@@ -0,0 +1,61 @@
+config BR2_PACKAGE_DOCKER_ENGINE
+	bool "docker-engine"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	select BR2_PACKAGE_DOCKER_CONTAINERD
+	select BR2_PACKAGE_RUNC
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	help
+		Docker is a platform to build, ship,
+		and run applications as lightweight containers.
+
+		https://github.com/docker/docker
+
+if BR2_PACKAGE_DOCKER_ENGINE
+
+config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
+	bool "docker daemon"
+	default y
+	help
+		Build the Docker system daemon. If not selected, will build client only.
+
+config BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL
+	bool "build experimental features"
+
+if BR2_PACKAGE_DOCKER_ENGINE_DAEMON
+
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
+	bool "btrfs filesystem driver"
+	depends on BR2_USE_WCHAR # btrfs-progs
+	depends on BR2_USE_MMU # btrfs-progs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
+	select BR2_PACKAGE_BTRFS_PROGS
+	help
+		Build the btrfs filesystem driver for Docker.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
+	bool "devicemapper filesystem driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
+	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_LVM2_APP_LIBRARY
+	help
+		Build the devicemapper filesystem driver for Docker.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
+	bool "vfs filesystem driver"
+	depends on BR2_USE_WCHAR # gvfs
+	depends on BR2_USE_MMU # gvfs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
+	select BR2_PACKAGE_GVFS
+	help
+		Build the vfs filesystem driver for Docker.
+
+endif
+
+endif
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
new file mode 100644
index 0000000..d8125af
--- /dev/null
+++ b/package/docker-engine/docker-engine.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 04de3750738b6f888f03520fb67db22e95e8a8e016ae901428e6c5791c9841cc  v1.11.1.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
new file mode 100644
index 0000000..df49120
--- /dev/null
+++ b/package/docker-engine/docker-engine.mk
@@ -0,0 +1,94 @@
+################################################################################
+#
+# docker-engine
+#
+################################################################################
+
+DOCKER_ENGINE_VERSION = v1.11.1
+DOCKER_ENGINE_VERSION_COMMIT = 5604cbed50d51c4039b1abcb1cf87c4e01bce924
+DOCKER_ENGINE_SITE = https://github.com/docker/docker/archive
+DOCKER_ENGINE_SOURCE = $(DOCKER_ENGINE_VERSION).tar.gz
+
+DOCKER_ENGINE_LICENSE = Apache-2.0
+DOCKER_ENGINE_LICENSE_FILES = LICENSE
+
+DOCKER_ENGINE_DEPENDENCIES = host-go docker-containerd
+
+DOCKER_ENGINE_MAKE_ENV = \
+	GOBIN="$(@D)/bin" \
+	GOPATH="$(@D)/vendor" \
+	GOARCH=$(GO_GOARCH) \
+	CGO_ENABLED=1 \
+	CGO_NO_EMULATION=1
+
+DOCKER_ENGINE_GLDFLAGS = \
+	-X main.GitCommit=$(DOCKER_ENGINE_VERSION_COMMIT) \
+	-X main.Version=$(DOCKER_ENGINE_VERSION) \
+	-extldflags '-static'
+
+DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+DOCKER_ENGINE_BUILD_TAGS += seccomp
+DOCKER_ENGINE_DEPENDENCIES += libseccomp
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
+DOCKER_ENGINE_BUILD_TAGS += daemon
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
+DOCKER_ENGINE_BUILD_TAGS += experimental
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
+DOCKER_ENGINE_DEPENDENCIES += btrfs-progs
+else
+DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_btrfs
+endif
+
+# Waiting on aufs-utils package series merge.
+# ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_AUFS),y)
+# DOCKER_ENGINE_DEPENDENCIES += aufs-util
+# else
+DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_aufs
+# endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER),y)
+DOCKER_ENGINE_DEPENDENCIES += lvm2
+else
+DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_devicemapper
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS),y)
+DOCKER_ENGINE_DEPENDENCIES += gvfs
+else
+DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_vfs
+endif
+
+define DOCKER_ENGINE_CONFIGURE_CMDS
+	# Put sources at prescribed GOPATH location.
+	export $(DOCKER_ENGINE_MAKE_ENV) && \
+		$(SED) '/^clean$$/d' $(@D)/hack/vendor.sh && \
+		cd $(@D) && bash ./hack/vendor.sh && \
+		mkdir -p $(@D)/vendor/src/github.com/docker && \
+		ln -s $(@D) $(@D)/vendor/src/github.com/docker/docker && \
+		ln -s $(DOCKER_CONTAINERD_SRCDIR) $(@D)/vendor/src/github.com/docker/containerd && \
+		mkdir -p $$GOPATH/src/github.com/opencontainers && \
+		ln -s $(RUNC_SRCDIR) $(@D)/vendor/src/github.com/opencontainers/runc
+endef
+
+define DOCKER_ENGINE_BUILD_CMDS
+	cd $(@D) && export $(DOCKER_ENGINE_MAKE_ENV) && \
+		$(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/docker -ldflags "$(DOCKER_ENGINE_GLDFLAGS)" ./docker
+endef
+
+define DOCKER_ENGINE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/docker $(TARGET_DIR)/usr/bin/docker
+endef
+
+define DOCKER_ENGINE_USERS
+	- - docker -1 * - - - Docker Application Container Framework
+endef
+
+$(eval $(generic-package))
-- 
2.7.3
