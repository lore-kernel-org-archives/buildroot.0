From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed,  6 Mar 2019 11:11:36 +0100
Subject: [Buildroot] [PATCH 2/6] boot/arm-trusted-firmware: in-tree and
 OP-TEE BL32
In-Reply-To: <7f15bfd5388e2171b13b44722b84149d9f361551.1551866509.git.etienne.carriere@linaro.org>
References: <7f15bfd5388e2171b13b44722b84149d9f361551.1551866509.git.etienne.carriere@linaro.org>
Message-ID: <6cd65139f8512433cfa0133b7d2cc8990fad6ee9.1551866509.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change allows one to build trusted firmware (TF-A) with OP-TEE
as BL32 secure payload.

When BR2_TARGET_ARM_TRUSTED_FIRMWARE_INTREE_BL32 is enabled TF-A
builds a BL32 stage according the TF-A configuration directive.
If these specify no BL3 stage then TF-A will build without BL32
support. This is the default configuration and reflects TF-A legacy
integration in BR.

When BR2_TARGET_ARM_TRUSTED_FIRMWARE_OPTEE_AS_BL32 is enabled
TF-A builds with support for the OP-TEE OS as BL32.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/arm-trusted-firmware/Config.in               | 30 +++++++++++++++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 13 ++++++++++
 2 files changed, 43 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 428a4ce..a1a0c54 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -91,6 +91,36 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT
 	  bl31.bin.  This is used for example by the Xilinx version of
 	  U-Boot SPL to load ATF on the ZynqMP SoC.
 
+choice
+	prompt "Select BL32 stage"
+	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_INTREE_BL32
+	help
+	  Select BL32 stage for the trusted firmware
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_INTREE_BL32
+	bool "Intree or no BL32 stage"
+	help
+	  This option shall be set if the BL32 image is built from
+	  trusted firmware sources (i.e sp_min, tsp) or when no BL32
+	  is expected.
+
+	  When the BL32 stage shall be built from ATF source tree,
+	  the target BL32 payload shall be defined from configuration
+	  BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES, either
+	  using directive SPD=<bl32_id> (Aarch64 platforms,
+	  i.e SPD=tspd) or AARCH32_SP=<bl32_id> (Aarch32 and Armv7
+	  platforms, i.e "AARCH32_SP=sp_min"). If no SPD or AARCH32_SP
+	  directive is specified, ATF will build without BL32 support.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_OPTEE_AS_BL32
+	bool "OP-TEE OS as BL32"
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
index 3e8df1d..0f67d10 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -39,6 +39,19 @@ ifeq ($(BR2_arm),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch32
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_OPTEE_AS_BL32),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += optee-os
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL32=$(BINARIES_DIR)/tee-header_v2.bin
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL32_EXTRA1=$(BINARIES_DIR)/tee-pager_v2.bin
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL32_EXTRA2=$(BINARIES_DIR)/tee-pageable_v2.bin
+ifeq ($(BR2_aarch64),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SPD=opteed
+endif
+ifeq ($(BR2_arm),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += AARCH32_SP=optee
+endif
+endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_OPTEE_AS_BL32
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
-- 
1.9.1
