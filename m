From: Christian Stewart <christian@paral.in>
Date: Mon, 20 Jul 2015 14:28:18 -0700
Subject: [Buildroot] [PATCH v3 3/3] lxcdocker: new package
In-Reply-To: <1437427698-5553-1-git-send-email-christian@paral.in>
References: <1437427698-5553-1-git-send-email-christian@paral.in>
Message-ID: <1437427698-5553-3-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce docker daemon and client.

[Maxime:
 - add options for daemon or client only
 - add configurable filesystem driver type
 - add user definitions
 - remove unnecessary dependencies
 - update docker to 1.7.1 from the rc
Thanks for the review]

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                |  1 +
 package/lxcdocker/Config.in      | 44 ++++++++++++++++++++++
 package/lxcdocker/lxcdocker.hash |  1 +
 package/lxcdocker/lxcdocker.mk   | 79 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 125 insertions(+)
 create mode 100644 package/lxcdocker/Config.in
 create mode 100644 package/lxcdocker/lxcdocker.hash
 create mode 100644 package/lxcdocker/lxcdocker.mk

diff --git a/package/Config.in b/package/Config.in
index 126a272..25ce444 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1431,6 +1431,7 @@ endif
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
 	source "package/lxc/Config.in"
+	source "package/lxcdocker/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
diff --git a/package/lxcdocker/Config.in b/package/lxcdocker/Config.in
new file mode 100644
index 0000000..8f6d0d0
--- /dev/null
+++ b/package/lxcdocker/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_LXCDOCKER
+	bool "lxcdocker"
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	help
+		Application container engine.
+
+		https://github.com/docker/docker
+
+if BR2_PACKAGE_LXCDOCKER
+
+config BR2_PACKAGE_LXCDOCKER_DAEMON
+  bool "docker build system daemon"
+  default y
+
+config BR2_PACKAGE_LXCDOCKER_EXPERIMENTAL
+  bool "docker build experimental features"
+
+if BR2_PACKAGE_LXCDOCKER_DAEMON
+
+config BR2_PACKAGE_LXCDOCKER_DRIVER_BTRFS
+  bool "docker btrfs filesystem driver"
+  default y
+	select BR2_PACKAGE_BTRFS_PROGS
+
+config BR2_PACKAGE_LXCDOCKER_DRIVER_AUFS
+  bool "docker aufs filesystem driver"
+  select BR2_PACKAGE_AUFS_UTIL
+
+config BR2_PACKAGE_LXCDOCKER_DRIVER_DEVICEMAPPER
+  bool "docker devicemapper filesystem driver"
+	select BR2_PACKAGE_LVM2
+
+config BR2_PACKAGE_LXCDOCKER_DRIVER_VFS
+  bool "docker vfs filesystem driver"
+	select BR2_PACKAGE_GVFS
+
+endif
+
+endif
diff --git a/package/lxcdocker/lxcdocker.hash b/package/lxcdocker/lxcdocker.hash
new file mode 100644
index 0000000..d1ffe58
--- /dev/null
+++ b/package/lxcdocker/lxcdocker.hash
@@ -0,0 +1 @@
+sha256 9cd26415d68a88d3cf576e7e78c2fe97f42af795404f552728acc5b41dccf4ef  lxcdocker-1.7.1.tar.gz
diff --git a/package/lxcdocker/lxcdocker.mk b/package/lxcdocker/lxcdocker.mk
new file mode 100644
index 0000000..a4ebb3d
--- /dev/null
+++ b/package/lxcdocker/lxcdocker.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# lxcdocker
+#
+################################################################################
+
+LXCDOCKER_VERSION = 1.7.1
+LXCDOCKER_SITE = $(call github,docker,docker,v$(LXCDOCKER_VERSION))
+LXCDOCKER_DEPENDENCIES = linux-headers sqlite host-golang
+LXCDOCKER_LICENSE = Apache
+LXCDOCKER_LICENSE_FILES = LICENSE
+LXCDOCKER_BUILD_TAGS = exclude_graphdriver_overlayfs
+
+ifeq ($(BR2_PACKAGE_LXCDOCKER_DAEMON),y)
+LXCDOCKER_BUILD_TAGS += daemon
+endif
+
+ifeq ($(BR2_PACKAGE_LXCDOCKER_EXPERIMENTAL),y)
+LXCDOCKER_BUILD_TAGS += experimental
+endif
+
+ifeq ($(BR2_PACKAGE_LXCDOCKER_DRIVER_BTRFS),y)
+LXCDOCKER_DEPENDENCIES += btrfs-progs
+else
+LXCDOCKER_BUILD_TAGS += exclude_graphdriver_btrfs
+endif
+
+ifeq ($(BR2_PACKAGE_LXCDOCKER_DRIVER_AUFS),y)
+LXCDOCKER_DEPENDENCIES += aufs-util
+else
+LXCDOCKER_BUILD_TAGS += exclude_graphdriver_aufs
+endif
+
+ifeq ($(BR2_PACKAGE_LXCDOCKER_DRIVER_DEVICEMAPPER),y)
+LXCDOCKER_DEPENDENCIES += lvm2
+else
+LXCDOCKER_BUILD_TAGS += exclude_graphdriver_devicemapper
+endif
+
+ifeq ($(BR2_PACKAGE_LXCDOCKER_DRIVER_VFS),y)
+LXCDOCKER_DEPENDENCIES += gvfs
+else
+LXCDOCKER_BUILD_TAGS += exclude_graphdriver_vfs
+endif
+
+define LXCDOCKER_CONFIGURE_CMDS
+	export GITCOMMIT=$(LXCDOCKER_VERSION) && \
+	export VERSION=$(LXCDOCKER_VERSION_ID) && \
+	export GOPATH=$(TARGET_DIR)/usr/src/go/ && \
+	echo "clone git github.com/golang/protobuf ab974be44dc3b7b8a1fb306fb32fe9b9f3864b3d" >> $(@D)/hack/vendor.sh && \
+	cd $(@D) && ./hack/vendor.sh
+	ln -fs $(@D) $(@D)/vendor/src/github.com/docker/docker
+endef
+
+define LXCDOCKER_BUILD_CMDS
+	export GOPATH="$(@D)/.gopath:$(@D)/vendor"; \
+	export GOOS=linux; \
+	export GOARCH=$(ARCH); \
+	export CGO_ENABLED=1; \
+	export CGO_NO_EMULATION=1; \
+	export CGO_CFLAGS='-I$(STAGING_DIR)/usr/include/ -I$(TARGET_DIR)/usr/include -I$(LINUX_HEADERS_DIR)/fs/'; \
+	export LDFLAGS="-X main.GITCOMMIT $(LXCDOCKER_VERSION) -X main.VERSION $(LXCDOCKER_VERSION_ID) -w -linkmode external -extldflags '-Wl,--unresolved-symbols=ignore-in-shared-libs' -extld '$(TARGET_CC_NOCCACHE)'"; \
+	export CC="$(TARGET_CC_NOCCACHE)"; \
+	export LD="$(TARGET_LD)"; \
+	cd $(@D); \
+ 	mkdir -p bin; \
+	bash ./hack/make/.go-autogen; \
+	$(GOLANG) build -v -o "$(@D)/bin/docker" -a -tags "$(LXCDOCKER_BUILD_TAGS)" -ldflags "$$LDFLAGS" ./docker
+endef
+
+define LXCDOCKER_INSTALL_TARGET_CMDS
+	cp -L $(@D)/bin/docker $(TARGET_DIR)/usr/bin/docker
+endef
+
+define LXCDOCKER_USERS
+	- - docker -1 * - - - Docker Application Container Framework
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
