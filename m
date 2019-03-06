From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed,  6 Mar 2019 11:11:35 +0100
Subject: [Buildroot] [PATCH 1/6] boot/arm-trusted-firmware: support 32bit
 Arm targets
Message-ID: <7f15bfd5388e2171b13b44722b84149d9f361551.1551866509.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change allows one to build the TF-A (Trusted Firmware A) for
32bit Armv7 and Armv8 platforms which arm-trusted-firmware supports
since release v1.5.

BR2_aarch64 is changed to BR2_ARM_CPU_ARMV8A as the later complemented
by BR2_ARM_CPU_ARMV7A better represents to architectures that can
support Arm Trusted Firmware A.

When BR2_arm is enabled, TF-A is built in Aarch32 mode.
Selection between Armv8-A (default) and Armv7-A (ARM_ARCH_MAJOR=7) is
expected from BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/arm-trusted-firmware/Config.in               | 3 ++-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 823a351..428a4ce 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -1,6 +1,7 @@
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE
 	bool "ARM Trusted Firmware (ATF)"
-	depends on BR2_aarch64 && BR2_TARGET_UBOOT
+	depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A) && \
+		   BR2_TARGET_UBOOT
 	help
 	  Enable this option if you want to build the ATF for your ARM
 	  based embedded device.
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 8ca3864..3e8df1d 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -35,6 +35,10 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
 
+ifeq ($(BR2_arm),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch32
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
-- 
1.9.1
