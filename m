From: Carlo Caione <carlo.caione@gmail.com>
Date: Thu, 14 Mar 2013 20:31:36 +0100
Subject: [Buildroot] [PATCH 1/3] sunxi-tools: new host/taget package
Message-ID: <1363289498-20993-1-git-send-email-carlo.caione@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
---
 package/Config.in                  |  1 +
 package/Config.in.host             |  1 +
 package/sunxi-tools/Config.in      |  8 ++++++++
 package/sunxi-tools/Config.in.host |  9 ++++++++
 package/sunxi-tools/sunxi-tools.mk | 42 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/sunxi-tools/Config.in
 create mode 100644 package/sunxi-tools/Config.in.host
 create mode 100644 package/sunxi-tools/sunxi-tools.mk

diff --git a/package/Config.in b/package/Config.in
index b8b1e60..4bb8c77 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -203,6 +203,7 @@ source "package/ntfs-3g/Config.in"
 source "package/squashfs/Config.in"
 source "package/squashfs3/Config.in"
 source "package/sshfs/Config.in"
+source "package/sunxi-tools/Config.in"
 source "package/unionfs/Config.in"
 source "package/xfsprogs/Config.in"
 endmenu
diff --git a/package/Config.in.host b/package/Config.in.host
index 79050f2..b2b9fbd 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -5,6 +5,7 @@ source "package/lpc3250loader/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/sam-ba/Config.in.host"
+source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
 
 endmenu
diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
new file mode 100644
index 0000000..d151a74
--- /dev/null
+++ b/package/sunxi-tools/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SUNXI_TOOLS
+	bool "sunxi nand-part"
+	help
+	  nand-part is a tool to repartition the internal NAND on sunxi
+	  devices
+
+	  http://linux-sunxi.org/Sunxi-tools
+
diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
new file mode 100644
index 0000000..0208adb
--- /dev/null
+++ b/package/sunxi-tools/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_SUNXI_TOOLS
+	bool "host sunxi-tools"
+	help
+	  Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i) based devices.
+	  This includes fexc which can be used to compile .fex board definition files to
+	  the binary script.bin format required by the linux-sunxi kernel.
+
+	  http://linux-sunxi.org/Sunxi-tools
+
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
new file mode 100644
index 0000000..cfb88d7
--- /dev/null
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -0,0 +1,42 @@
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
+
+define HOST_SUNXI_TOOLS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) CFLAGS="$(HOST_CFLAGS) -std=c99 \
+	  -D_POSIX_C_SOURCE=200112L -Iinclude/" LDFLAGS="$(HOST_LDFLAGS)" -C $(@D)
+endef
+
+define HOST_SUNXI_TOOLS_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/fexc $(HOST_DIR)/usr/bin/fexc
+	$(INSTALL) -D -m 0755 $(@D)/bin2fex $(HOST_DIR)/usr/bin/bin2fex
+	$(INSTALL) -D -m 0755 $(@D)/fex2bin $(HOST_DIR)/usr/bin/fex2bin
+	$(INSTALL) -D -m 0755 $(@D)/bootinfo $(HOST_DIR)/usr/bin/bootinfo
+	$(INSTALL) -D -m 0755 $(@D)/fel $(HOST_DIR)/usr/bin/fel
+	$(INSTALL) -D -m 0755 $(@D)/pio $(HOST_DIR)/usr/bin/pio
+	$(INSTALL) -D -m 0755 $(@D)/nand-part $(HOST_DIR)/usr/bin/nand-part
+endef
+
+define SUNXI_TOOLS_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)"                               \
+		LDFLAGS="$(TARGET_LDFLAGS)"                     \
+		CFLAGS="$(TARGET_CFLAGS)                        \
+		 -std=c99 -D_POSIX_C_SOURCE=200112L -Iinclude/" \
+		 -C $(@D)					\
+		nand-part
+endef
+
+define SUNXI_TOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/nand-part $(TARGET_DIR)/usr/bin/nand-part
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.8.1.5
