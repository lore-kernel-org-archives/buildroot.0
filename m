From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri,  9 Jul 2021 11:49:24 +0200
Subject: [Buildroot] [PATCH 1/2] boot/arm-trusted-firmware: Update FIP image
 generation with BL33_CFG option
Message-ID: <20210709094925.1605675-1-kory.maincent@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the FIP image generation by adding the BL33_CFG parameter.
This is needed for the ST version of ATF.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in               | 9 +++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 7e46a10270..80f6161597 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -133,6 +133,15 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
 	  Name of the U-Boot BL33 image to include in ATF, it must
 	  have been installed to BINARIES_DIR by the U-Boot package.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE_CFG
+	string "U-Boot BL33 image devicetree name"
+	default ""
+	help
+	  Name of the U-Boot BL33 image devicetree to include in ATF.
+	  It must have been installed to BINARIES_DIR by the U-Boot
+	  package.
+	  Needed for the stm32mp1 platform.
+
 endif
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 1f08f5dabb..9fc8b51a80 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -92,6 +92,10 @@ endif
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
 ARM_TRUSTED_FIRMWARE_UBOOT_BIN = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE))
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN)
+ARM_TRUSTED_FIRMWARE_UBOOT_BIN_CFG = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE_CFG))
+ifneq ($(ARM_TRUSTED_FIRMWARE_UBOOT_BIN_CFG),)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33_CFG=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN_CFG)
+endif
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
 endif
 
-- 
2.25.1
