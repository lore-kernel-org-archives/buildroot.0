From: Gervais, Francois <FGervais@distech-controls.com>
Date: Wed, 29 Jan 2020 16:58:23 +0000
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: allow additional
 make targets
Message-ID: <DM6PR01MB5849372393A77DCA1C7DDE78F3050@DM6PR01MB5849.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow specifying additional build targets for ATF.

This might be more useful when using a custom git repository.

For example, when using with the ATF repository from NXP QorIQ,
there is a new build target 'pbl' which is used to build the
pbl binary image. Note that in the specific case of the 'pbl'
target, additional build variables also need to be specified
through BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES.

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
---
 boot/arm-trusted-firmware/Config.in               | 7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 96861c3f4d..440df34db6 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -135,6 +135,13 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE

 endif

+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS
+       string "Additional ATF make targets"
+       help
+         Additional targets for the ATF build
+         E.G. When using the QorIQ custom atf repository from NXP,
+         the target 'pbl' can be used to build the pbl binary.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
        string "Additional ATF build variables"
        help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 2133d39e6d..bf1ac46cf6 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -139,6 +139,9 @@ define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF
 endef
 endif

+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += \
+       $(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS)
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
        $(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
-- 
2.20.1
