From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Mar 2019 22:49:14 +0100
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add support for
 using OP-TEE as BL32
Message-ID: <20190320214920.F1E5281507@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6959d628d421d88e7b12bb1cbbaaadaa0a2e20f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change allows one to build trusted firmware (TF-A) with OP-TEE as
BL32 secure payload.

When BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_DEFAULT is enabled TF-A
builds a BL32 stage according the TF-A configuration directive.  If
these specify no BL32 stage then TF-A will build without BL32
support. This is the default configuration and reflects TF-A legacy
integration in BR.

When BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE is enabled TF-A builds
with support for the OP-TEE OS as BL32.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[Thomas: rename config options, simplify option prompts, and rework
option description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in               | 24 +++++++++++++++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 14 +++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 428a4ce155..92cd6e5642 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -91,6 +91,30 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT
 	  bl31.bin.  This is used for example by the Xilinx version of
 	  U-Boot SPL to load ATF on the ZynqMP SoC.
 
+choice
+	prompt "BL32"
+	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_DEFAULT
+	help
+	  Select BL32 stage for the trusted firmware
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_DEFAULT
+	bool "Default"
+	help
+	  With this option selected, ATF will not use any BL32 stage,
+	  unless if one is explicitly chosen using the SPD (for
+	  AArch64) or AARCH32_SP (for AArch32) variables, which can be
+	  passed through
+	  BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
+	bool "OP-TEE OS"
+	depends on BR2_TARGET_OPTEE_OS
+	help
+	  This option allows to embed OP-TEE OS as the BL32 part of
+	  the ARM Trusted Firmware boot sequence.
+
+endchoice
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	bool "Use U-Boot as BL33"
 	depends on BR2_TARGET_UBOOT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index fb80bd1fbe..f35e91eefe 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -47,6 +47,20 @@ else ifeq ($(BR2_aarch64),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch64
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += optee-os
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	BL32=$(BINARIES_DIR)/tee-header_v2.bin \
+	BL32_EXTRA1=$(BINARIES_DIR)/tee-pager_v2.bin \
+	BL32_EXTRA2=$(BINARIES_DIR)/tee-pageable_v2.bin
+ifeq ($(BR2_aarch64),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SPD=opteed
+endif
+ifeq ($(BR2_arm),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += AARCH32_SP=optee
+endif
+endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
