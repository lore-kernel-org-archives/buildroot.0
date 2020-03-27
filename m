From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 23:03:48 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 boot/arm-trusted-firmware: add optional host-dtc dependency
Message-ID: <20200327215218.32F398869E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbac8a048c184fa5f0f512e60fe8a8b04382ace6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Some ATF configurations, such as the ones for the STM32MP1 processor
family, require DTC during the build as Device Tree files are
used. Without dtc, the build fails:

/bin/sh: 1: dtc: not found
dtc version too old (), you need at least version 1.4.4
plat/st/stm32mp1/platform.mk:239: recipe for target 'check_dtc_version' failed
make[1]: *** [check_dtc_version] Error 1

To solve this, this commit implements a
BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC option, in a way that mimics
the BR2_TARGET_UBOOT_NEEDS_DTC option we already have for the U-Boot
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ddbb5dbd83170a71f92d3d54e5f8b288cb80871e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/Config.in               | 7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 373591d497..737dc587e5 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -160,4 +160,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES
 	  Names of generated image files that are installed in the
 	  output images/ directory.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC
+	bool "Needs dtc"
+	select BR2_PACKAGE_HOST_DTC
+	help
+	  Select this option if your ATF board configuration
+	  requires the Device Tree compiler to be available.
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 34737018aa..27f63a87fe 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -29,6 +29,10 @@ endif
 
 ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-dtc
+endif
+
 ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG),y)
