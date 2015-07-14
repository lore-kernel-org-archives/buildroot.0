From: Christian Stewart <christian@paral.in>
Date: Tue, 14 Jul 2015 14:10:44 -0700
Subject: [Buildroot] [PATCH vX 3/3] lxcdocker: new package
In-Reply-To: <1436908244-10390-1-git-send-email-christian@paral.in>
References: <1436908244-10390-1-git-send-email-christian@paral.in>
Message-ID: <1436908244-10390-3-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce docker daemon and client.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                |  1 +
 package/lxcdocker/Config.in      | 16 ++++++++++++++
 package/lxcdocker/lxcdocker.hash |  1 +
 package/lxcdocker/lxcdocker.mk   | 47 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/lxcdocker/Config.in
 create mode 100644 package/lxcdocker/lxcdocker.hash
 create mode 100644 package/lxcdocker/lxcdocker.mk

diff --git a/package/Config.in b/package/Config.in
index 5500564..58bc49e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1425,6 +1425,7 @@ endif
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
 	source "package/lxc/Config.in"
+	source "package/lxcdocker/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
diff --git a/package/lxcdocker/Config.in b/package/lxcdocker/Config.in
new file mode 100644
index 0000000..be6db0a
--- /dev/null
+++ b/package/lxcdocker/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LXCDOCKER
+	bool "lxcdocker"
+	select BR2_PACKAGE_BTRFS_PROGS
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+		Container management system for LXC.
+
+		https://github.com/docker/docker
diff --git a/package/lxcdocker/lxcdocker.hash b/package/lxcdocker/lxcdocker.hash
new file mode 100644
index 0000000..c0244e7
--- /dev/null
+++ b/package/lxcdocker/lxcdocker.hash
@@ -0,0 +1 @@
+sha256 34416118a5d04eae511267fbfab044a927c36434b96dc6fcd705be35a32e01f9  lxcdocker-1.7.1-rc3.tar.gz
diff --git a/package/lxcdocker/lxcdocker.mk b/package/lxcdocker/lxcdocker.mk
new file mode 100644
index 0000000..c7a5983
--- /dev/null
+++ b/package/lxcdocker/lxcdocker.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# lxcdocker
+#
+################################################################################
+
+LXCDOCKER_VERSION = 1.7.1-rc3
+LXCDOCKER_SITE = $(call github,docker,docker,v$(LXCDOCKER_VERSION))
+LXCDOCKER_DEPENDENCIES = lxc linux-headers btrfs-progs sqlite lvm2 host-golang
+LXCDOCKER_LICENSE = Apache
+LXCDOCKER_LICENSE_FILES = LICENSE
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
+	$(GOLANG) build -v -o "$(@D)/bin/docker" -a -tags "daemon" -ldflags "$$LDFLAGS" ./docker
+endef
+
+define LXCDOCKER_INSTALL_TARGET_CMDS
+	cp -L $(@D)/bin/docker $(TARGET_DIR)/usr/bin/docker
+endef
+
+define LXCDOCKER_USERS
+	- - docker -1 * - - - Docker Application Container Framework
+	dockroot 502 dockroot 502 * - - - Unprivileged container root
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
