From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Thu, 20 Dec 2012 13:47:17 +0100
Subject: [Buildroot] [PATCH 1/2] uboot-tools: install mkenvimage.
Message-ID: <1356007638-18476-1-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tool mkenvimage generates a valid binary environment image from
a text file describing the key=value pairs of the environment.
This commit allows installation on target and host.

Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
 package/uboot-tools/Config.in      |    7 +++++++
 package/uboot-tools/uboot-tools.mk |    8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 9cc837c..7c8f17c 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -13,6 +13,13 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 	  The mkimage tool from Das U-Boot bootloader, which allows
 	  generation of U-Boot images in various formats.
 
+config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
+	bool "mkenvimage"
+	help
+	  The mkenvimage tool from Das U-Boot bootloader, which allows
+	  generation of a valid binary environment image from a text file
+	  describing the key=value pairs of the environment.
+
 config BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
 	bool "fw_printenv"
 	default y
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 75cda8e..e1739be 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -24,6 +24,12 @@ define UBOOT_TOOLS_INSTALL_MKIMAGE
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE),y)
+define UBOOT_TOOLS_INSTALL_MKENVIMAGE
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(TARGET_DIR)/usr/bin/mkenvimage
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)
 define UBOOT_TOOLS_INSTALL_FWPRINTENV
 	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(TARGET_DIR)/usr/sbin/fw_printenv
@@ -33,6 +39,7 @@ endif
 
 define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_MKIMAGE)
+	$(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
 	$(UBOOT_TOOLS_INSTALL_FWPRINTENV)
 endef
 
@@ -51,6 +58,7 @@ endef
 
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin/mkimage
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/usr/bin/mkenvimage
 endef
 
 $(eval $(generic-package))
-- 
1.7.10.4
