From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 12:15:00 +0100
Subject: [Buildroot] [git commit] arm-trusted-firmware: add
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
Message-ID: <20171208123728.AAD8D81250@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f64b08ff0fa601b61b93a7c9f0553d34196dcfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ATF can be used in different ways:

 - ATF encapsulates U-Boot as the BL33, which is what is done on ARM
   Juno (currently supported in Buildroot) and Marvell platforms (soon
   to be supported)

 - U-Boot encapsulates ATF's BL31, which is what is done on Allwinner
   ARM64 platforms.

Until now we were assumming the former was always the case, but
obviously it isn't. Therefore, this patch adds an option that allows
to explicitly tell ATF that it encapsulates U-Boot as its BL33.

We adapt the only defconfig that uses ATF so that it enables this
option as appropriate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/Config.in               | 9 +++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 +++++---
 configs/arm_juno_defconfig                        | 1 +
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 0560046..b8b9269 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -64,6 +64,15 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
 	  platforms were ATF encapsulates the second stage bootloader
 	  (such as U-Boot).
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
+	bool "Use U-Boot as BL33"
+	depends on BR2_TARGET_UBOOT
+	help
+	  This option allows to embed u-boot.bin as the BL33 part of
+	  the ARM Trusted Firmware. It ensures that the u-boot package
+	  gets built before ATF, and that the appropriate BL33
+	  variable pointing to u-boot.bin is passed when building ATF.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
 	string "Additional ATF build variables"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index bdffb1d..3731829 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -8,8 +8,6 @@ ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_V
 ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
 ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
 
-ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
-
 ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
 # Handle custom ATF tarballs as specified by the configuration
 ARM_TRUSTED_FIRMWARE_TARBALL = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))
@@ -30,10 +28,14 @@ ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_
 
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	BL33=$(BINARIES_DIR)/u-boot.bin \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot.bin
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
+endif
+
 ifeq ($(BR2_TARGET_VEXPRESS_FIRMWARE),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 1fb5587..54506d8 100644
--- a/configs/arm_juno_defconfig
+++ b/configs/arm_juno_defconfig
@@ -15,6 +15,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
