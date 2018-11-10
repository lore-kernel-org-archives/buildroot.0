From: kaplan2539 at gmail.com <kaplan2539@gmail.com>
Date: Sat, 10 Nov 2018 15:58:46 -0800
Subject: [Buildroot] [PATCH 1/1] package/sunxi-tools: add tool selection
Message-ID: <1541894326-2838-1-git-send-email-kaplan2539@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alex Kaplan <kaplan2539@gmail.com>

This patch allows to select which of the sunxi-tools are built and installed in host and target diretories.
This way it is possible to have e.g. sunxi-nand-image-builder among the host tools, or to install sunxi-fel on the target device.
The corresponding config options have been added to Config.in and Config.in.host and the sunxi-tools.mk has been adapted respectively.
The defaults have been selected to produce the same output as without this patch.

Signed-off-by: Alex Kaplan <kaplan2539@gmail.com>
---
 package/sunxi-tools/Config.in      | 51 +++++++++++++++++++++++++++++++++++---
 package/sunxi-tools/Config.in.host | 40 ++++++++++++++++++++++++++++++
 package/sunxi-tools/sunxi-tools.mk | 51 ++++++++++++++++++++++++++++++++------
 3 files changed, 130 insertions(+), 12 deletions(-)

diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
index 02eba95..83eb982 100644
--- a/package/sunxi-tools/Config.in
+++ b/package/sunxi-tools/Config.in
@@ -1,9 +1,52 @@
 config BR2_PACKAGE_SUNXI_TOOLS
-	bool "sunxi nand-part"
+	bool "sunxi-tools"
 	depends on BR2_arm
 	help
-	  nand-part is part of sunxi-tools for Allwinner A10 (aka
-	  sun4i) and A13 (aka sun5i) based devices. It is a tool to
-	  repartition the internal NAND on sunxi devices.
+	  Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i)
+	  based devices. This includes fex2bin which can be used to
+	  compile .fex board definition files to the binary script.bin
+	  format required by the linux-sunxi kernel. These tools are
+	  specific for linux-sunxi kernel and do not apply to the
+	  mainline Linux kernel version.
 
 	  http://linux-sunxi.org/Sunxi-tools
+
+if BR2_PACKAGE_SUNXI_TOOLS
+
+# from the "tools" make target
+config BR2_PACKAGE_SUNXI_TOOLS_FEXC
+    bool "sunxi-fexc"
+    default n
+
+config BR2_PACKAGE_SUNXI_TOOLS_BOOTINFO
+    bool "sunxi-bootinfo"
+    default n
+
+config BR2_PACKAGE_SUNXI_TOOLS_FEL
+    bool "sunxi-fel"
+    default n
+
+config BR2_PACKAGE_SUNXI_TOOLS_NAND_PART
+    bool "sunxi-nand-part"
+    default y
+
+config BR2_PACKAGE_SUNXI_TOOLS_PIO
+    bool "sunxi-pio"
+    default n
+
+# from the "target-tools" make target
+config BR2_PACKAGE_SUNXI_TOOLS_MEMINFO
+    bool "sunxi-meminfo"
+    default n
+
+# from the "misc" make target
+config BR2_PACKAGE_SUNXI_TOOLS_PHOENIX_INFO
+    bool "phoenix_info"
+    default n
+
+config BR2_PACKAGE_SUNXI_TOOLS_NAND_IMAGE_BUILDER
+    bool "sunxi-nand-image-builder"
+    default n
+
+endif #BR2_PACKAGE_SUNXI_TOOLS
+
diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
index 5fab5e6..f02fd40 100644
--- a/package/sunxi-tools/Config.in.host
+++ b/package/sunxi-tools/Config.in.host
@@ -10,3 +10,43 @@ config BR2_PACKAGE_HOST_SUNXI_TOOLS
 	  mainline Linux kernel version.
 
 	  http://linux-sunxi.org/Sunxi-tools
+
+if BR2_PACKAGE_HOST_SUNXI_TOOLS
+
+# from the "tools" make target
+config BR2_PACKAGE_HOST_SUNXI_TOOLS_FEXC
+    bool "sunxi-fexc"
+    default y
+
+config BR2_PACKAGE_HOST_SUNXI_TOOLS_BOOTINFO
+    bool "sunxi-bootinfo"
+    default y
+
+config BR2_PACKAGE_HOST_SUNXI_TOOLS_FEL
+    bool "sunxi-fel"
+    default y
+
+config BR2_PACKAGE_HOST_SUNXI_TOOLS_NAND_PART
+    bool "sunxi-nand-part"
+    default y
+
+config BR2_PACKAGE_HOST_SUNXI_TOOLS_PIO
+    bool "sunxi-pio"
+    default y
+
+# from the "target-tools" make target
+config BR2_PACKAGE_HOST_SUNXI_TOOLS_MEMINFO
+    bool "sunxi-meminfo"
+    default n
+
+# from the "misc" make target
+config BR2_PACKAGE_HOST_SUNXI_TOOLS_PHOENIX_INFO
+    bool "phoenix_info"
+    default n
+
+config BR2_PACKAGE_HOST_SUNXI_TOOLS_NAND_IMAGE_BUILDER
+    bool "sunxi-nand-image-builder"
+    default n
+
+endif #BR2_PACKAGE_HOST_SUNXI_TOOLS
+
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 3a44cf6..2cc4443 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -4,6 +4,11 @@
 #
 ################################################################################
 
+#SUNXI_TOOLS_VERSION = 24be7518cbc3622b65d3fc29f892e06bb4800ab9
+
+#v 1.4.2 not officially released yet?!?
+#SUNXI_TOOLS_VERSION = 60ea132fccce2dda22987da6f1694095fb33cb53
+
 SUNXI_TOOLS_VERSION = v1.4.1
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPL-2.0+
@@ -11,25 +16,55 @@ SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
 HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
 FEX2BIN = $(HOST_DIR)/bin/fex2bin
 
+HOST_SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_FEXC)               += sunxi-fexc
+HOST_SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_BOOTINFO)           += sunxi-bootinfo
+HOST_SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_FEL)                += sunxi-fel
+HOST_SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_NAND_PART)          += sunxi-nand-part
+HOST_SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_PIO)                += sunxi-pio
+HOST_SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_MEMINFO)            += sunxi-meminfo
+HOST_SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_PHOENIX_INFO)       += phoenix_info
+HOST_SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_NAND_IMAGE_BUILDER) += sunxi-nand-image-builder
+
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_FEXC)               += sunxi-fexc
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_BOOTINFO)           += sunxi-bootinfo
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_FEL)                += sunxi-fel
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_NAND_PART)          += sunxi-nand-part
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_PIO)                += sunxi-pio
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_MEMINFO)            += sunxi-meminfo
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_PHOENIX_INFO)       += phoenix_info
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_HOST_SUNXI_TOOLS_NAND_IMAGE_BUILDER) += sunxi-nand-image-builder
+
+ifeq ($(BR2_PACKAGE_SUNXI_TOOLS_FEL),y)
+	SUNXI_TOOLS_DEPENDENCIES += libusb host-pkgconf
+endif
+
+
 define HOST_SUNXI_TOOLS_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" PREFIX=$(HOST_DIR) \
+	$(foreach t,$(HOST_SUNXI_TOOLS_TARGETS_y), \
+	    $(HOST_MAKE_ENV) $(MAKE) CROSS_COMPILE="" CC="$(HOSTCC)" PREFIX=$(HOST_DIR) \
 		EXTRA_CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" \
-		-C $(@D) tools
+		-C $(@D) $(t)
+	)
 endef
 
 define HOST_SUNXI_TOOLS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) PREFIX=$(HOST_DIR) \
-		-C $(@D) install-tools
+	$(foreach t,$(HOST_SUNXI_TOOLS_TARGETS_y), \
+		$(INSTALL) -D -m 0755 $(@D)/$(t) $(HOST_DIR)/usr/bin/$(t)
+	)
 endef
 
 define SUNXI_TOOLS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" PREFIX=/usr \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
-		-C $(@D) sunxi-nand-part
+	$(foreach t,$(SUNXI_TOOLS_TARGETS_y), \
+		$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" CC="$(TARGET_CC)" PREFIX=/usr \
+			EXTRA_CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
+			-C $(@D) $(t)
+	)
 endef
 
 define SUNXI_TOOLS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/sunxi-nand-part $(TARGET_DIR)/usr/bin/sunxi-nand-part
+	$(foreach t,$(SUNXI_TOOLS_TARGETS_y), \
+		$(INSTALL) -D -m 0755 $(@D)/$(t) $(TARGET_DIR)/usr/bin/$(t)
+	)
 endef
 
 $(eval $(generic-package))
-- 
2.7.4
