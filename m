From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 20:49:00 +0100
Subject: [Buildroot] [git commit] uboot-tools: add option for mkenvimage
Message-ID: <20130324194908.AF6109B290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8694c3cb5711023fcce911bb673c01b36d48d64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tool mkenvimage generates a valid binary environment image from
a text file describing the key=value pairs of the environment.
This commit allows installation on target and host.

Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uboot-tools/Config.in      |    7 +++++++
 package/uboot-tools/uboot-tools.mk |    8 ++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

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
index 9d7596a..f03ff91 100644
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
