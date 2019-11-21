From: Changming Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 18:23:19 +0800
Subject: [Buildroot] [PATCH v2 05/10] boot/arm-trusted-firmware: Add option
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
In-Reply-To: <20191121102324.35225-1-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
Message-ID: <20191121102324.35225-6-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerry Huang <jerry.huang@nxp.com>

Add option BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE to define the U-Boot BIN.
The default setting is u-boot.bin, customer can change it to anything via defconfig.

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
---
changes since v1:
1. add BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE for uboot binary file
2. default of new option is u-boot.bin.
3. use the new option for U-Boot BL33
---
 boot/arm-trusted-firmware/Config.in               | 12 ++++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 78c03019d5..3e83590776 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -124,6 +124,18 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	  gets built before ATF, and that the appropriate BL33
 	  variable pointing to u-boot.bin is passed when building ATF.
 
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
+	string "U-Boot BL33 Image for ATF"
+	default "u-boot.bin"
+	help
+	  The U-Boot BL33 image for ATF, u-boot.bin is the default setting,
+	  this setting can be changed to any U-Boot binary file that used,
+	  for example, u-boot-dtb.bin.
+
+endif
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
 	string "Additional ATF build variables"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index e528686aa1..2133d39e6d 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -70,7 +70,8 @@ endif
 endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
-ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot.bin
+ARM_TRUSTED_FIRMWARE_UBOOT_BIN = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE))
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
 endif
 
-- 
2.17.1
