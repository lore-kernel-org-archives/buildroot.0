From: Dick Olsson <hi@senzilla.io>
Date: Sun, 19 Jul 2020 18:10:03 +0000
Subject: [Buildroot] [PATCH 4/8] boot/arm-trusted-firmware: add EDK2 as BL33
 option
In-Reply-To: <20200719180727.28202-1-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
Message-ID: <20200719180727.28202-5-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARM Trusted Firmware (ATF) has the ability to load EDK2 UEFI as the BL33 payload,
instead of more commonly used U-Boot.
The platform description as configured by the EDK2 bootloader package will be
included when ATF is configured to build the Firmware Image Package (fip) target.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 boot/arm-trusted-firmware/Config.in               | 15 ++++++++++++++-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  7 +++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 7d0f6aa4e0..f24813f8e6 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE
 	bool "ARM Trusted Firmware (ATF)"
 	depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A) && \
-           BR2_TARGET_UBOOT
+           (BR2_TARGET_UBOOT || BR2_TARGET_EDK2)
 	help
 	  Enable this option if you want to build the ATF for your ARM
 	  based embedded device.
@@ -115,6 +115,19 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
 endchoice
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
+	bool "Use EDK2 as BL33"
+	depends on BR2_TARGET_EDK2
+	help
+	  This option allows to embed EDK2 as the BL33 part of
+	  the ARM Trusted Firmware. It ensures that the EDK2 package
+	  gets built before ATF, and that the appropriate BL33
+	  variable pointing to the EDK2 is passed when building ATF.
+
+	  Do not choose this option if you intend to build ATF and EDK2
+	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
+	  build system, the dependency between ATF and EDK is reversed.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	bool "Use U-Boot as BL33"
 	depends on BR2_TARGET_UBOOT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index a3553e36cf..58b48df5d8 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -79,6 +79,13 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += AARCH32_SP=optee
 endif
 endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += edk2
+# Since the flash device names vary between platforms, we use the variable
+# provided by the EDK2 package this.
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(EDK2_FD_NAME).fd
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
 ARM_TRUSTED_FIRMWARE_UBOOT_BIN = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE))
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN)
-- 
2.20.1
