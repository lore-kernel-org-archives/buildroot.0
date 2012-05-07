From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:32:04 +0200
Subject: [Buildroot] [PATCH v5 2/2] u-boot: build signed image for OMAP
	processors
In-Reply-To: <1336422724-7384-1-git-send-email-luca@lucaceresoli.net>
References: <1336422724-7384-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336422724-7384-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 boot/uboot/Config.in |   32 ++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  |   25 +++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f83cf4b..afc2f91 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -99,6 +99,38 @@ config BR2_TARGET_UBOOT_FORMAT_LDR
 
 endchoice
 
+config BR2_TARGET_UBOOT_OMAP_IFT
+	depends on BR2_TARGET_UBOOT_FORMAT_BIN
+	depends on BR2_arm || BR2_armeb
+	select BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
+	bool "produce a .ift signed image (OMAP)"
+	help
+	  Use gpsign to produce an image of u-boot.bin signed with
+	  a Configuration Header for booting on OMAP processors.
+	  This allows U-Boot to boot without the need for an
+	  intermediate bootloader (e.g. x-loader) if it is written
+	  on the first sector of the boot medium.
+	  This only works for some media, such as NAND. Check your
+	  chip documentation for details. You might also want to
+	  read the documentation of gpsign, the tool that generates
+	  the .ift image, at:
+	  https://github.com/nmenon/omap-u-boot-utils/blob/master/README
+
+if BR2_TARGET_UBOOT_OMAP_IFT
+
+config BR2_TARGET_UBOOT_OMAP_IFT_CONFIG
+	string "gpsign Configuration Header config file"
+	help
+	  The Configuration Header (CH) config file defines the
+	  desired content of the CH for the signed image.
+	  It usually contains external RAM settings and
+	  possibly other external devices initialization.
+	  The omap-u-boot-utils software contains example
+	  configuration files for some boards:
+	  https://github.com/nmenon/omap-u-boot-utils/tree/master/configs
+
+endif
+
 menuconfig BR2_TARGET_UBOOT_NETWORK
 	bool "Custom Network Settings"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 3119092..9c85e69 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -33,6 +33,7 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
 UBOOT_BIN          = u-boot.img
 else
 UBOOT_BIN          = u-boot.bin
+UBOOT_BIN_IFT      = ${UBOOT_BIN}.ift
 endif
 
 UBOOT_ARCH=$(KERNEL_ARCH)
@@ -88,12 +89,36 @@ define UBOOT_BUILD_CMDS
 		$(UBOOT_MAKE_TARGET)
 endef
 
+define UBOOT_BUILD_OMAP_IFT
+	${HOST_DIR}/usr/bin/gpsign -f $(@D)/u-boot.bin \
+		-c $(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG))
+endef
+
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
 	$(if $(BR2_TARGET_UBOOT_SPL),
 		cp -dpf $(@D)/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
 endef
 
+define UBOOT_INSTALL_OMAP_IFT_IMAGE
+	cp -dpf $(@D)/$(UBOOT_BIN_IFT) $(BINARIES_DIR)/
+endef
+
+ifeq ($(BR2_TARGET_UBOOT_OMAP_IFT),y)
+# we NEED a config file unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG)),)
+$(error No gpsign config file. Check your BR2_TARGET_UBOOT_OMAP_IFT_CONFIG setting)
+endif
+ifeq ($(wildcard $(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG))),)
+$(error gpsign config file $(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG) not found. Check your BR2_TARGET_UBOOT_OMAP_IFT_CONFIG setting)
+endif
+endif
+UBOOT_DEPENDENCIES += host-omap-u-boot-utils
+UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
+endif
+
 $(eval $(call GENTARGETS))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
-- 
1.7.5.4
