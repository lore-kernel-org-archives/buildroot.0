From: Christian Stewart <christian@paral.in>
Date: Mon,  4 Jul 2016 12:26:20 -0700
Subject: [Buildroot] [PATCH v6 3/5] docker-engine: new package
In-Reply-To: <1467660382-6317-1-git-send-email-christian@paral.in>
References: <1467660382-6317-1-git-send-email-christian@paral.in>
Message-ID: <1467660382-6317-3-git-send-email-christian@paral.in>
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
Changes since v3:
 - fix help indentation in Config.in
 - use HOST_GO_TARGET_ENV as a base for build env vars
 - cleanup build commands
 - cleanup GOPATH and vendor directory setup
 - Remove selections for graph drivers. Docker will gracefully degrade
   at runtime to the best available graphdriver. It is unnecessary to
   disable these at build time, or to pull in any other dependencies
   like aufs-util or btrfs tools. The daemon will use whatever is
   available at runtime.
Changes since v4:
 - remove commit hash from version scheme
Changes since v5:
 - re-introduce graphdriver selections
 - these selections are required for btrfs and devicemapper
 - there are buildtime dependencies on headers.
 - bump to v1.12.0-rc3
 - remove hack/vendor.sh call, it is unnecessary, dependencies are
   pre-vendored into the source tree.

---

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                        |   1 +
 package/docker-engine/Config.in          |  69 ++++++++++++++++++
 package/docker-engine/docker-engine.hash |   2 +
 package/docker-engine/docker-engine.mk   | 116 +++++++++++++++++++++++++++++++
 4 files changed, 188 insertions(+)
 create mode 100644 package/docker-engine/Config.in
 create mode 100644 package/docker-engine/docker-engine.hash
 create mode 100644 package/docker-engine/docker-engine.mk

diff --git a/package/Config.in b/package/Config.in
index 01c0811..fee59a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1637,6 +1637,7 @@ menu "System tools"
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
 	source "package/docker-containerd/Config.in"
+	source "package/docker-engine/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/efibootmgr/Config.in"
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
new file mode 100644
index 0000000..bbf56b1
--- /dev/null
+++ b/package/docker-engine/Config.in
@@ -0,0 +1,69 @@
+config BR2_PACKAGE_DOCKER_ENGINE
+	bool "docker-engine"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_DOCKER_CONTAINERD
+	select BR2_PACKAGE_RUNC
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	help
+	  Docker is a platform to build, ship,
+	  and run applications as lightweight containers.
+
+	  https://github.com/docker/docker
+
+comment "docker-engine needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_DOCKER_ENGINE
+
+config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
+	bool "docker daemon"
+	default y
+	help
+	  Build the Docker system daemon.
+	  If not selected, will build client only.
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
+	  Build the btrfs filesystem driver for Docker.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
+	bool "devicemapper filesystem driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
+	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_LVM2_APP_LIBRARY
+	help
+	  Build the devicemapper filesystem driver for Docker.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
+	bool "vfs filesystem driver"
+	depends on BR2_USE_WCHAR # gvfs
+	depends on BR2_USE_MMU # gvfs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
+	select BR2_PACKAGE_GVFS
+	help
+	  Build the vfs filesystem driver for Docker.
+
+endif
+
+endif
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
new file mode 100644
index 0000000..ac90ee6
--- /dev/null
+++ b/package/docker-engine/docker-engine.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3f030c4f084ed518efeb00f21f3fdfb25252dd9c153b1d42da953e59bb41c582  docker-engine-v1.12.0-rc3.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
new file mode 100644
index 0000000..501afbc
--- /dev/null
+++ b/package/docker-engine/docker-engine.mk
@@ -0,0 +1,116 @@
+################################################################################
+#
+# docker-engine
+#
+################################################################################
+
+DOCKER_ENGINE_VERSION = v1.12.0-rc3
+DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
+
+DOCKER_ENGINE_LICENSE = Apache-2.0
+DOCKER_ENGINE_LICENSE_FILES = LICENSE
+
+DOCKER_ENGINE_DEPENDENCIES = host-go docker-containerd
+
+DOCKER_ENGINE_GOPATH = "$(@D)/vendor"
+DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
+	CGO_ENABLED=1 \
+	CGO_NO_EMULATION=1 \
+	GOBIN="$(@D)/bin" \
+	GOPATH="$(DOCKER_ENGINE_GOPATH)"
+
+DOCKER_ENGINE_GLDFLAGS = \
+	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
+	-X main.Version=$(DOCKER_ENGINE_VERSION) \
+	-extldflags '-static'
+
+DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
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
+	mkdir -p $(DOCKER_ENGINE_GOPATH)/src/github.com/docker
+	ln -fs $(@D) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
+	ln -fs $(DOCKER_CONTAINERD_SRCDIR) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/containerd
+	mkdir -p $(DOCKER_ENGINE_GOPATH)/src/github.com/opencontainers
+	ln -fs $(RUNC_SRCDIR) $(DOCKER_ENGINE_GOPATH)/src/github.com/opencontainers/runc
+	cd $(@D) && \
+		GITCOMMIT="unknown" BUILDTIME="$$(date)" VERSION="$(DOCKER_ENGINE_VERSION)" \
+		bash ./hack/make/.go-autogen
+endef
+
+define DOCKER_ENGINE_BUILD_CLIENT_CMDS
+	cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/docker -tags "$(DOCKER_ENGINE_BUILD_TAGS)" -ldflags "$(DOCKER_ENGINE_GLDFLAGS)" ./cmd/docker
+endef
+
+define DOCKER_ENGINE_BUILD_DAEMON_CMDS
+	cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/dockerd -tags "$(DOCKER_ENGINE_BUILD_TAGS)" -ldflags "$(DOCKER_ENGINE_GLDFLAGS)" ./cmd/dockerd
+endef
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
+define DOCKER_ENGINE_BUILD_CMDS
+	$(DOCKER_ENGINE_BUILD_CLIENT_CMDS)
+	$(DOCKER_ENGINE_BUILD_DAEMON_CMDS)
+endef
+else
+define DOCKER_ENGINE_BUILD_CMDS
+	$(DOCKER_ENGINE_BUILD_CLIENT_CMDS)
+endef
+endif
+
+define DOCKER_ENGINE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/docker $(TARGET_DIR)/usr/bin/docker
+	$(INSTALL) -D -m 0755 $(@D)/bin/dockerd $(TARGET_DIR)/usr/bin/dockerd
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
