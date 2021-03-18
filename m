From: Dick Olsson <hi@senzilla.io>
Date: Thu, 18 Mar 2021 15:42:49 +0000
Subject: [Buildroot] [PATCH v4 03/10] boot/arm-trusted-firmware: Integrate
 with EDK2 as BL33 payload
Message-ID: <THvwh6tvDv2RUIT2KB06w1XqxT1MFcniyo1ZGjAfE@cp3-web-012.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support the use of EDK2 UEFI payloads as BL33 in ARM Trusted Firmware.
This integrates with the newly introduced boot/edk2 package.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 boot/arm-trusted-firmware/Config.in               | 13 +++++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  9 +++++++++
 2 files changed, 22 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b11dd67931..9d347550a4 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -135,6 +135,19 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
 
 endif
 
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
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS
 	string "Additional ATF make targets"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 0597cecf71..279658712b 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -79,6 +79,15 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += AARCH32_SP=optee
 endif
 endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += edk2
+# Since the flash device name vary between platforms, we use the variable
+# provided by the EDK2 package for this. Using this variable here is OK
+# as it will expand after all dependencies are resolved, inside _BUILD_CMDS.
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	BL33=$(BINARIES_DIR)/$(call qstrip,$(BR2_TARGET_EDK2_FD_NAME).fd)
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
 ARM_TRUSTED_FIRMWARE_UBOOT_BIN = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE))
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN)
-- 
2.24.3 (Apple Git-128)
