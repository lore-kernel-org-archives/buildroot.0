From: Christian Stewart <christian@paral.in>
Date: Tue, 14 Jul 2015 11:42:02 -0700
Subject: [Buildroot] [PATCH 3/3] lxcdocker: new package
In-Reply-To: <1436899322-19731-1-git-send-email-christian@paral.in>
References: <1436899322-19731-1-git-send-email-christian@paral.in>
Message-ID: <1436899322-19731-3-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce docker daemon and client.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in              |  1 +
 package/lxcdocker/Config.in    | 15 ++++++++++++++
 package/lxcdocker/lxcdocker.mk | 47 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 package/lxcdocker/Config.in
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
index 0000000..188c370
--- /dev/null
+++ b/package/lxcdocker/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LXCDOCKER
+	bool "lxcdocker"
+	select BR2_PACKAGE_HOST_GO
+	select BR2_PACKAGE_BTRFS_PROGS
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	help
+		Container management system for LXC.
+
+		https://github.com/docker/docker
diff --git a/package/lxcdocker/lxcdocker.mk b/package/lxcdocker/lxcdocker.mk
new file mode 100644
index 0000000..f2fdf0a
--- /dev/null
+++ b/package/lxcdocker/lxcdocker.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# lxcdocker
+#
+################################################################################
+
+LXCDOCKER_VERSION = f8f912ac2a10ae81bbc6274dd1fb203269260263
+LXCDOCKER_VERSION_ID = "1.7.1-rc1"
+LXCDOCKER_SITE = $(call github,docker,docker,$(LXCDOCKER_VERSION))
+LXCDOCKER_INSTALL_STAGING = NO
+LXCDOCKER_INSTALL_TARGET = YES
+
+# Perhaps suboptimal to let something in the tree clone subrepos.
+# Not exactly sure what a better solution here would be.
+# In Go, you need the source for these packages.
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
+LXCDOCKER_DEPENDENCIES = lxc linux-headers btrfs-progs sqlite lvm2 host-golang
+
+$(eval $(generic-package))
-- 
2.1.4
