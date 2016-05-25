From: Christian Stewart <christian@paral.in>
Date: Wed, 25 May 2016 16:31:22 -0700
Subject: [Buildroot] [PATCH v3 3/3] docker-engine: new package
In-Reply-To: <1464219082-3818-1-git-send-email-christian@paral.in>
References: <1464219082-3818-1-git-send-email-christian@paral.in>
Message-ID: <1464219082-3818-4-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Docker is a platform to build, ship, and run applications in portable
containers.

Signed-off-by: Christian Stewart <christian@paral.in>

---

Changes since v1:
 - use call github to build source URL
Changes since v2:
 - fix hashes

---
 package/Config.in                        |   1 +
 package/docker-engine/Config.in          |  70 ++++++++++++++++++++
 package/docker-engine/docker-engine.hash |   2 +
 package/docker-engine/docker-engine.mk   | 110 +++++++++++++++++++++++++++++++
 4 files changed, 183 insertions(+)
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
index 0000000..e25b16b
--- /dev/null
+++ b/package/docker-engine/Config.in
@@ -0,0 +1,70 @@
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
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_AUFS
+	bool "aufs filesystem driver"
+	depends on BR2_USE_WCHAR # aufs-util
+	depends on BR2_USE_MMU # aufs-util
+	depends on BR2_TOOLCHAIN_HAS_THREADS # aufs-util
+	select BR2_PACKAGE_AUFS_UTIL
+	help
+	  Build the aufs filesystem driver for Docker.
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
index 0000000..7b93669
--- /dev/null
+++ b/package/docker-engine/docker-engine.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 04de3750738b6f888f03520fb67db22e95e8a8e016ae901428e6c5791c9841cc  docker-engine-v1.11.1.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
new file mode 100644
index 0000000..0dc6b46
--- /dev/null
+++ b/package/docker-engine/docker-engine.mk
@@ -0,0 +1,110 @@
+################################################################################
+#
+# docker-engine
+#
+################################################################################
+
+DOCKER_ENGINE_VERSION = v1.11.1
+DOCKER_ENGINE_VERSION_COMMIT = 5604cbed50d51c4039b1abcb1cf87c4e01bce924
+DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
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
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_AUFS),y)
+DOCKER_ENGINE_DEPENDENCIES += aufs-util
+else
+DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_aufs
+endif
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
+		$(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/docker -tags "$(DOCKER_ENGINE_BUILD_TAGS)" -ldflags "$(DOCKER_ENGINE_GLDFLAGS)" ./docker
+endef
+
+define DOCKER_ENGINE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/docker $(TARGET_DIR)/usr/bin/docker
+endef
+
+define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
+	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/docker.socket
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
+	ln -fs ../../../../usr/lib/systemd/system/docker.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/docker.service
+endef
+
+define DOCKER_ENGINE_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 $(@D)/contrib/init/sysvinit-redhat/docker \
+		$(TARGET_DIR)/etc/init.d/S61docker
+	mkdir -p $(TARGET_DIR)/etc/sysconfig
+	$(INSTALL) -D -m 644 $(@D)/contrib/init/sysvinit-redhat/docker.sysconfig \
+		$(TARGET_DIR)/etc/sysconfig/docker.sysconfig
+endef
+
+define DOCKER_ENGINE_USERS
+	- - docker -1 * - - - Docker Application Container Framework
+endef
+
+$(eval $(generic-package))
-- 
2.7.3
