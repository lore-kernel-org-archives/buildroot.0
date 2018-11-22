From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 22 Nov 2018 16:22:28 +0100
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: use prebuilt
 BL33 images
Message-ID: <1542900148-17204-1-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change allows one to build ATF with an externally built
BL33 image or with the U-boot as BL33 boot stage.

This change introduces a new configuration directive for TF-A to
specify when BL33 stage is provided as a prebuilt image:
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PREBUILT_BL33.

If BR2_TARGET_ARM_TRUSTED_FIRMWARE_PREBUILT_BL33 is enabled, the
buildroot configuration shall specify the BL33 binary image location:
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL33_IMAGE.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/arm-trusted-firmware/Config.in               | 22 +++++++++++++++++++++-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  4 ++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 885d93e..679153d 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE
 	bool "ARM Trusted Firmware (ATF)"
-	depends on BR2_aarch64 && BR2_TARGET_UBOOT
+	depends on BR2_aarch64
 	help
 	  Enable this option if you want to build the ATF for your ARM
 	  based embedded device.
@@ -73,12 +73,18 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT
 	bool "Build BL31 U-Boot image"
+	depends on BR2_TARGET_UBOOT
 	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
 	help
 	  Generates a U-Boot image named atf-uboot.ub containing
 	  bl31.bin.  This is used for example by the Xilinx version of
 	  U-Boot SPL to load ATF on the ZynqMP SoC.
 
+choice
+	prompt "Select BL33 stage for the trusted firmware"
+	help
+	  Select BL33 stage for the trusted firmware.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	bool "Use U-Boot as BL33"
 	depends on BR2_TARGET_UBOOT
@@ -88,6 +94,20 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	  gets built before ATF, and that the appropriate BL33
 	  variable pointing to u-boot.bin is passed when building ATF.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PREBUILT_BL33
+	bool "Use an externally built BL33 image set"
+	help
+	  This option allows to use an prebuilt BL33 boot stage with
+	  the Arm trusted firmware.
+
+endchoice
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL33_IMAGE
+	string "File path of the externally built BL33 image"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_PREBUILT_BL33
+	help
+	  Path of the prebuilt BL33 image if any.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
 	string "Additional ATF build variables"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 23f4936..913b2fa 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -37,6 +37,10 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
 endif
 
+ifneq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL33_IMAGE),)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL33_IMAGE))
+endif
+
 ifeq ($(BR2_TARGET_VEXPRESS_FIRMWARE),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
-- 
1.9.1
