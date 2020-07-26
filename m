From: D. Olsson <hi@senzilla.io>
Date: Sun, 26 Jul 2020 10:07:28 +0000
Subject: [Buildroot] [PATCH v2 5/6] boot/arm-trusted-firmware: add EDK2 as
 BL33 option
Message-ID: <20200726100541.7710-6-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Dick Olsson <hi@senzilla.io>

ARM Trusted Firmware (ATF) has the ability to load EDK2 UEFI when dropping
into EL2. This is done via a new configuration option that build the BL33
payload with EDK2 images that will run in the EL2 context.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 2:

 * It was concluded that relying on variables from EDK2 is ok
  since they are expanded inside _BUILD_CMDS
 * Now relying on the more specific variable EDK2_EL2_NAME for BL33
---
 boot/arm-trusted-firmware/Config.in               | 15 ++++++++++++++-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  8 ++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

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
index a3553e36cf..51a5877ba1 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -79,6 +79,14 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += AARCH32_SP=optee
 endif
 endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += edk2
+# Since the flash device name vary between platforms, we use the variable
+# provided by the EDK2 package for this. Using this variable here is OK
+# as it will expand after all dependencies are resolved, inside _BUILD_CMDS.
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(EDK2_EL2_NAME).fd
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
 ARM_TRUSTED_FIRMWARE_UBOOT_BIN = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE))
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN)
-- 
2.20.1
