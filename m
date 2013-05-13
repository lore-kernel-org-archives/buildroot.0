From: Carlo Caione <carlo.caione@gmail.com>
Date: Mon, 13 May 2013 07:52:26 +0200
Subject: [Buildroot] [PATCH 1/3] sunxi-tools: new host/target package
Message-ID: <1368424348-9853-1-git-send-email-carlo.caione@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
---
Changelog:
	- Fix typos
	- FIx package description
	- Several changes to .mk file
---
 package/Config.in                  |  1 +
 package/Config.in.host             |  1 +
 package/sunxi-tools/Config.in      | 10 ++++++++++
 package/sunxi-tools/Config.in.host | 12 ++++++++++++
 package/sunxi-tools/sunxi-tools.mk | 37 +++++++++++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/sunxi-tools/Config.in
 create mode 100644 package/sunxi-tools/Config.in.host
 create mode 100644 package/sunxi-tools/sunxi-tools.mk

diff --git a/package/Config.in b/package/Config.in
index d980871..26440a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -207,6 +207,7 @@ source "package/ntfs-3g/Config.in"
 source "package/squashfs/Config.in"
 source "package/squashfs3/Config.in"
 source "package/sshfs/Config.in"
+source "package/sunxi-tools/Config.in"
 source "package/unionfs/Config.in"
 source "package/xfsprogs/Config.in"
 endmenu
diff --git a/package/Config.in.host b/package/Config.in.host
index 7c0dd20..54178ea 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -10,6 +10,7 @@ source "package/mtools/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/sam-ba/Config.in.host"
+source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
 
 endmenu
diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
new file mode 100644
index 0000000..a085aeb
--- /dev/null
+++ b/package/sunxi-tools/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SUNXI_TOOLS
+	bool "sunxi nand-part"
+	depends on BR2_arm
+	help
+	  nand-part is part of sunxi-tools for Allwinner A10 (aka sun4i) and
+	  A13 (aka sun5i) based devices. It is a tool to repartition the
+	  internal NAND on sunxi devices.
+
+	  http://linux-sunxi.org/Sunxi-tools
+
diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
new file mode 100644
index 0000000..b5e4193
--- /dev/null
+++ b/package/sunxi-tools/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_SUNXI_TOOLS
+	bool "host sunxi-tools"
+	depends on BR2_arm
+	help
+	  Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i) based devices.
+	  This includes fex2bin  which can be used to compile .fex board definition
+	  files to the binary script.bin format required by the linux-sunxi kernel.
+	  These tools are specific for linux-sunxi kernel and do not apply to
+	  the mainline Linux kernel version.
+
+	  http://linux-sunxi.org/Sunxi-tools
+
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
new file mode 100644
index 0000000..a97dfcb
--- /dev/null
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -0,0 +1,37 @@
+#############################################################
+#
+# sunxi-tools
+#
+#############################################################
+
+SUNXI_TOOLS_VERSION = 3a94e721dd8d1e13d0b25da0a83463891e8e9ee0
+SUNXI_TOOLS_SITE = http://github.com/linux-sunxi/sunxi-tools/tarball/master
+SUNXI_TOOLS_LICENSE = GPLv2+
+SUNXI_TOOLS_LICENSE_FILES = COPYING
+HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb
+FEX2BIN = $(HOST_DIR)/usr/bin/fex2bin
+
+define HOST_SUNXI_TOOLS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS) -std=c99 -D_POSIX_C_SOURCE=200112L -Iinclude/" \
+		-C $(@D)
+endef
+
+define HOST_SUNXI_TOOLS_INSTALL_CMDS
+	for i in fexc bin2fex fex2bin bootinfo fel pio; do \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(HOST_DIR)/usr/bin/$$i ; \
+	done
+endef
+
+define SUNXI_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=c99 -D_POSIX_C_SOURCE=200112L -Iinclude/" \
+		-C $(@D) nand-part
+endef
+
+define SUNXI_TOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/nand-part $(TARGET_DIR)/usr/bin/nand-part
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.8.2.3
