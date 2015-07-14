From: Christian Stewart <christian@paral.in>
Date: Tue, 14 Jul 2015 10:27:40 -0700
Subject: [Buildroot] [PATCH 1/1] Add rtl8821au, lxcdocker, go, host-go,
	aufs-util packages
Message-ID: <1436894860-9458-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                                  |  3 ++
 package/Config.in.host                             |  1 +
 package/aufs-util/Config.in                        |  6 +++
 package/aufs-util/aufs-util.mk                     | 38 +++++++++++++++++
 package/go/0001-add-no-march-option-gccp.patch     | 19 +++++++++
 .../go/0002-remove-unnecessary-march-ld-flag.patch | 29 +++++++++++++
 package/go/Config.in                               |  6 +++
 package/go/Config.in.host                          |  6 +++
 package/go/go.mk                                   | 40 ++++++++++++++++++
 package/lxcdocker/Config.in                        | 15 +++++++
 package/lxcdocker/lxcdocker.mk                     | 47 ++++++++++++++++++++++
 package/rtl8821au/Config.in                        |  6 +++
 package/rtl8821au/rtl8821au.mk                     | 25 ++++++++++++
 13 files changed, 241 insertions(+)
 create mode 100644 package/aufs-util/Config.in
 create mode 100644 package/aufs-util/aufs-util.mk
 create mode 100644 package/go/0001-add-no-march-option-gccp.patch
 create mode 100644 package/go/0002-remove-unnecessary-march-ld-flag.patch
 create mode 100644 package/go/Config.in
 create mode 100644 package/go/Config.in.host
 create mode 100644 package/go/go.mk
 create mode 100644 package/lxcdocker/Config.in
 create mode 100644 package/lxcdocker/lxcdocker.mk
 create mode 100644 package/rtl8821au/Config.in
 create mode 100644 package/rtl8821au/rtl8821au.mk

diff --git a/package/Config.in b/package/Config.in
index 5beb450..19c59cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -149,6 +149,7 @@ endif
 endmenu
 
 menu "Filesystem and flash utilities"
+	source "package/aufs-util/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cramfs/Config.in"
@@ -455,6 +456,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
+	source "package/go/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
@@ -1423,6 +1425,7 @@ endif
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
 	source "package/lxc/Config.in"
+	source "package/lxcdocker/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 1e047aa..b124b9b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -11,6 +11,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/go/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/mke2img/Config.in.host"
diff --git a/package/aufs-util/Config.in b/package/aufs-util/Config.in
new file mode 100644
index 0000000..1afb79b
--- /dev/null
+++ b/package/aufs-util/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_AUFS_UTIL
+	bool "aufs-util"
+	help
+	  Aufs command line utilities.
+
+	  http://sourceforge.net/p/aufs/aufs-util/
diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
new file mode 100644
index 0000000..ef2ca21
--- /dev/null
+++ b/package/aufs-util/aufs-util.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# aufs-util
+#
+################################################################################
+
+
+# Version depends on the kernel version.
+# todo: find an effective way of detecting the right version to use
+AUFS_UTIL_VERSION = a25c0d434889cab53df62fc0a6f9e9d679470990
+AUFS_UTIL_DEPENDENCIES = linux linux-headers
+AUFS_UTIL_SITE = $(call github,morfoh,aufs-util,$(AUFS_UTIL_VERSION))
+AUFS_UTIL_LICENSE = GNU
+AUFS_UTIL_INSTALL_STAGING = NO
+AUFS_UTIL_INSTALL_TARGET = YES
+
+# Force it to build for any kernel, even if it might not work
+#define AUFS_UTIL_CONFIGURE_CMDS
+#	$(SED) 's/7/0/' $(@D)/ver.c
+#endef
+
+# Slight hack for a bug with aufsmvdown
+# Remove user setting from install command
+define AUFS_UTIL_CONFIGURE_CMDS
+	$(SED) 's/\.a\[/\.stbr\[/g' $(@D)/aumvdown.c
+	$(SED) 's/\-o root \-g root //g' $(@D)/Makefile
+endef
+
+define AUFS_UTIL_BUILD_CMDS
+	$(MAKE) -C $(LINUX_BUILDDIR) headers_install
+	$(MAKE) -C $(@D) CPPFLAGS="-I $(LINUX_BUILDDIR)/usr/include/" HOSTCC="$(CC)" HOSTLD="$(LD)" INSTALL="$(INSTALL)" all
+endef
+
+define AUFS_UTIL_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) INSTALL="$(INSTALL)" DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
diff --git a/package/go/0001-add-no-march-option-gccp.patch b/package/go/0001-add-no-march-option-gccp.patch
new file mode 100644
index 0000000..26c3542
--- /dev/null
+++ b/package/go/0001-add-no-march-option-gccp.patch
@@ -0,0 +1,19 @@
+Adds an option to not add the problematic -m parameter to GCC.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+
+diff -Nau go.orig/src/cmd/cgo/gcc.go go/src/cmd/cgo/gcc.go
+--- go.orig/src/cmd/cgo/gcc.go.orig	2015-07-09 15:53:55.720794139 -0700
++++ go/src/cmd/cgo/gcc.go	2015-07-09 17:46:43.664496374 -0700
+@@ -736,6 +736,11 @@
+ 
+ // gccMachine returns the gcc -m flag to use, either "-m32", "-m64" or "-marm".
+ func (p *Package) gccMachine() []string {
++
++	if os.Getenv("CGO_NO_EMULATION") == "1" {
++		return nil
++	}
++
+ 	switch goarch {
+ 	case "amd64":
+ 		return []string{"-m64"}
diff --git a/package/go/0002-remove-unnecessary-march-ld-flag.patch b/package/go/0002-remove-unnecessary-march-ld-flag.patch
new file mode 100644
index 0000000..e63c9f9
--- /dev/null
+++ b/package/go/0002-remove-unnecessary-march-ld-flag.patch
@@ -0,0 +1,29 @@
+Removes defining -m parameter to LD, which is unnecessary in buildroot.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+
+diff -Nau go.orig/src/cmd/ld/lib.c go/src/cmd/ld/lib.c
+--- go.orig/src/cmd/ld/lib.c.orig	2015-07-09 18:38:44.192359082 -0700
++++ go/src/cmd/ld/lib.c	2015-07-09 18:39:02.108358294 -0700
+@@ -589,20 +589,7 @@
+ 	if(extld == nil)
+ 		extld = "gcc";
+ 	argv[argc++] = extld;
+-	switch(thechar){
+-	case '8':
+-		argv[argc++] = "-m32";
+-		break;
+-	case '6':
+-		argv[argc++] = "-m64";
+-		break;
+-	case '5':
+-		argv[argc++] = "-marm";
+-		break;
+-	}
+-	if(!debug['s'] && !debug_s) {
+-		argv[argc++] = "-gdwarf-2"; 
+-	} else {
++	if(debug['s'] || debug_s) {
+ 		argv[argc++] = "-s";
+ 	}
+ 	if(HEADTYPE == Hdarwin)
diff --git a/package/go/Config.in b/package/go/Config.in
new file mode 100644
index 0000000..9abf895
--- /dev/null
+++ b/package/go/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_GO
+	bool "go"
+	help
+	  Go compiler and cli tool.
+
+	  http://golang.org/
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
new file mode 100644
index 0000000..5496706
--- /dev/null
+++ b/package/go/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_GO
+	bool "host go"
+	help
+	  Go for the host system.
+
+	  http://golang.org/
diff --git a/package/go/go.mk b/package/go/go.mk
new file mode 100644
index 0000000..fbf69d4
--- /dev/null
+++ b/package/go/go.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# GO
+#
+################################################################################
+
+GO_VERSION = 883bc6ed0ea815293fe6309d66f967ea60630e87
+GO_SITE = $(call github,golang,go,$(GO_VERSION))
+GO_LICENSE_FILES = LICENSE
+GO_INSTALL_STAGING = NO
+GO_INSTALL_TARGET = YES
+
+HOST_GO_DEPENDENCIES =
+GO_DEPENDENCIES =
+
+GO = $(HOST_DIR)/usr/bin/go
+GOFMT = $(HOST_DIR)/usr/bin/gofmt
+
+define GO_BUILD_CMDS
+	cd $(@D)/src/ && CC_FOR_TARGET="$(TARGET_CC)" LD_FOR_TARGET="$(TARGET_LD)" GOOS=linux GOARCH=$(ARCH) GOROOT_FINAL="/usr/src/go" ./make.bash
+endef
+
+define GO_INSTALL_TARGET_CMDS
+	cp $(@D)/bin/linux_$(ARCH)/* $(TARGET_DIR)/usr/bin/
+	mkdir -p $(TARGET_DIR)/usr/src/go/
+	cp -r $(@D)/* $(TARGET_DIR)/usr/src/go/
+endef
+
+define HOST_GO_BUILD_CMDS
+	cd $(@D)/src/ && CC_FOR_TARGET="$(TARGET_CC)" GOOS=linux GOARCH=$(ARCH) GOROOT_FINAL=$(HOST_DIR)/usr/src/go/ bash ./make.bash
+endef
+
+define HOST_GO_INSTALL_CMDS
+	cp $(@D)/bin/go $(@D)/bin/gofmt $(HOST_DIR)/usr/bin/
+	mkdir -p $(HOST_DIR)/usr/src/go/
+	cp -r $(@D)/* $(HOST_DIR)/usr/src/go/
+endef
+
+$(eval $(host-generic-package))
+$(eval $(generic-package))
diff --git a/package/lxcdocker/Config.in b/package/lxcdocker/Config.in
new file mode 100644
index 0000000..a8a32ba
--- /dev/null
+++ b/package/lxcdocker/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LXCDOCKER
+	bool "lxcdocker"
+  select BR2_PACKAGE_HOST_GO
+  select BR2_PACKAGE_BTRFS_PROGS
+  select BR2_PACKAGE_SQLITE
+  select BR2_PACKAGE_LVM2
+  select BR2_PACKAGE_UTIL_LINUX
+  select BR2_PACKAGE_UTIL_LINUX_BINARIES
+  select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
+  select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
+  select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	help
+	  Container management system for LXC.
+
+	  https://github.com/docker/docker
diff --git a/package/lxcdocker/lxcdocker.mk b/package/lxcdocker/lxcdocker.mk
new file mode 100644
index 0000000..86d7d3d
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
+	export CGO_CFLAGS='-I$(TARGET_DIR)/usr/include/'; \
+	export LDFLAGS="-X main.GITCOMMIT $(LXCDOCKER_VERSION) -X main.VERSION $(LXCDOCKER_VERSION_ID) -w -linkmode external -extldflags '-Wl,--unresolved-symbols=ignore-in-shared-libs' -extld '$(TARGET_CC_NOCCACHE)'"; \
+	export CC="$(TARGET_CC_NOCCACHE)"; \
+	export LD="$(TARGET_LD)"; \
+	cd $(@D); \
+ 	mkdir -p bin; \
+	bash ./hack/make/.go-autogen; \
+	$(GO) build -v -o "$(@D)/bin/docker" -a -tags "daemon" -ldflags "$$LDFLAGS" ./docker
+endef
+
+define LXCDOCKER_INSTALL_TARGET_CMDS
+	cp -L $(@D)/bin/docker $(TARGET_DIR)/usr/bin/docker
+endef
+
+LXCDOCKER_DEPENDENCIES = lxc btrfs-progs sqlite lvm2 host-go
+
+$(eval $(generic-package))
diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
new file mode 100644
index 0000000..1269bc6
--- /dev/null
+++ b/package/rtl8821au/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RTL8821AU
+	bool "rtl8821au"
+	help
+	  rtl8821au wireless driver
+
+	  https://github.com/abperiasamy/rtl8812AU_8821AU_linux
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
new file mode 100644
index 0000000..d80fd28
--- /dev/null
+++ b/package/rtl8821au/rtl8821au.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# rtl8821au
+#
+################################################################################
+
+RTL8821AU_VERSION = ac82a3077933789686cdb1e0a4b026fa8da91b34
+RTL8821AU_SITE = $(call github,paralin,rtl8821au,$(RTL8821AU_VERSION))
+RTL8821AU_INSTALL_STAGING = NO
+RTL8821AU_INSTALL_TARGET = YES
+
+define RTL8821AU_BUILD_CMDS
+	$(SED) "s/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g" -i $(@D)/Makefile
+	$(MAKE) -C $(@D) ARCH="$(ARCH)" KVER="$(LINUX_VERSION_PROBED)" USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" CROSS_COMPILE="$(CROSS_COMPILE)" KSRC="$(LINUX_BUILDDIR)" CC="$(TARGET_CC)" LD="$(TARGET_LD)" modules
+endef
+
+define RTL8821AU_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/drivers/net/wireless/
+	$(INSTALL) -p -m 644 $(@D)/8821au.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/drivers/net/wireless/
+	$(HOST_DIR)/sbin/depmod -a --basedir=$(TARGET_DIR) $(LINUX_VERSION_PROBED)
+endef
+
+RTL8821AU_DEPENDENCIES = linux
+
+$(eval $(generic-package))
-- 
2.1.4
