From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 22:57:13 +0100
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add option
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
Message-ID: <20191202083935.81AA781350@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ef18c3b810752d30b69c8cb8f96e76060893bd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33 is
enabled, the arm-trusted-firmware package assumes that the BL33 image
provided by U-Boot is u-boot.bin. However for some platforms, the name
may be different (for example u-boot-dtb.bin). To support such use
cases, this commit adds a string option
BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE to configure the
U-Boot image name, which defaults to u-boot.bin to preserve backward
compatibility.

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
Reviewed-by: Sergey Matyukevich <geomatsi@mail.com>
[Thomas: rewrite commit log and Config.in help text]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in               | 11 +++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 78c03019d5..96861c3f4d 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -124,6 +124,17 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	  gets built before ATF, and that the appropriate BL33
 	  variable pointing to u-boot.bin is passed when building ATF.
 
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
+	string "U-Boot BL33 image name"
+	default "u-boot.bin"
+	help
+	  Name of the U-Boot BL33 image to include in ATF, it must
+	  have been installed to BINARIES_DIR by the U-Boot package.
+
+endif
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
 	string "Additional ATF build variables"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index e528686aa1..2133d39e6d 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -70,7 +70,8 @@ endif
 endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
-ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot.bin
+ARM_TRUSTED_FIRMWARE_UBOOT_BIN = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE))
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
 endif
 
