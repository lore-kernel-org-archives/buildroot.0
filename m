From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 19 Mar 2019 00:21:02 +0100
Subject: [Buildroot] [PATCH v2 1/8] boot/arm-trusted-firmware: support 32bit
 Arm targets
Message-ID: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change allows one to build the TF-A (Trusted Firmware A) for
32bit architectures Armv7 and Armv8 platforms. TF-A supports these
configuration since release v1.5.

Change dependency on BR2_aarch64 into a dependency on either
BR2_ARM_CPU_ARMV8A/BR2_ARM_CPU_ARMV7A to better define
the target architectures supported by the package.

Set package configuration directive ARM_ARCH_MAJOR according to
BR2_ARM_CPU_ARMV8A/BR2_ARM_CPU_ARMV7A. Set package configuration
directive ARCH based on BR2_aarch64/BR2_arm.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v1 -> v2:
  - Set ARM_ARCH_MAJOR and ARCH according to Buildroot directives
    BR2_ARM_CPU_ARMV8A/BR2_ARM_CPU_ARMV7A and BR2_aarch64/BR2_arm.

---
 boot/arm-trusted-firmware/Config.in               |  3 ++-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

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
index 8ca3864..fb80bd1 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -35,6 +35,18 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
 
+ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARM_ARCH_MAJOR=7
+else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARM_ARCH_MAJOR=8
+endif
+
+ifeq ($(BR2_arm),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch32
+else ifeq ($(BR2_aarch64),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch64
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
-- 
1.9.1
