From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed,  6 Feb 2013 14:45:08 +0100
Subject: [Buildroot] [PATCH] New host package: sunxi-tools
Message-ID: <1360158308-16233-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i) based devices.
This includes fexc which can be used to compile .fex board definition files to
the binary script.bin format required by the linux-sunxi kernel.

http://linux-sunxi.org/Sunxi-tools

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/Config.in.host             |    1 +
 package/sunxi-tools/Config.in.host |    9 +++++++++
 package/sunxi-tools/sunxi-tools.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 package/sunxi-tools/Config.in.host
 create mode 100644 package/sunxi-tools/sunxi-tools.mk

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
index 0000000..6146d5d
--- /dev/null
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# sunxi-tools
+#
+#############################################################
+
+SUNXI_TOOLS_VERSION = 3a94e721dd8d1e13d0b25da0a83463891e8e9ee0
+SUNXI_TOOLS_SITE = git://github.com/linux-sunxi/sunxi-tools.git
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
+$(eval $(host-generic-package))
-- 
1.7.10.4
