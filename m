From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 12:14:42 +0100
Subject: [Buildroot] [git commit] arm-trusted-firmware: add option to
 enable/disable building FIP image
Message-ID: <20171208123728.988CC81455@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=543dbf2d01325d0352d9b4b2d69996bf072c906e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, our arm-trusted-firmware unconditionally builds a FIP
(Firmware Image Package). While this is often needed on platforms
where ATF encapsulates U-Boot, it is not the case on some other
platforms where it's U-Boot that encapsulates parts of ATF.

In order to prepare the support for the later platforms, we make
building the FIP image optional, and update the only defconfig we have
that uses ARM Trusted Firmware.

Note: we considered adding a "default y" here to preserve backward
compatibility, but there really isn't any default that is sane:
whether a FIP image needs to be built or not is purely platform
specific.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/Config.in               | 8 ++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 +++++++-
 configs/arm_juno_defconfig                        | 1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 799370c..0560046 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -56,6 +56,14 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
 	help
 	  Target plaform to build for.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
+	bool "Build FIP image"
+	help
+	  This option enables building the FIP image (Firmware Image
+	  Package). This is typically the image format used by
+	  platforms were ATF encapsulates the second stage bootloader
+	  (such as U-Boot).
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
 	string "Additional ATF build variables"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 7b1cc6e..bdffb1d 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -39,10 +39,16 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
 endif
 
+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
+
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
+endif
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
-			all fip
+			$(ARM_TRUSTED_FIRMWARE_MAKE_TARGETS)
 endef
 
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 811524f..1fb5587 100644
--- a/configs/arm_juno_defconfig
+++ b/configs/arm_juno_defconfig
@@ -14,6 +14,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
