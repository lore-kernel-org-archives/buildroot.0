From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 12:07:20 +0800
Subject: [Buildroot] [PATCH 4/9] boot/arm-trusted-firmware: Add RCW support
In-Reply-To: <20191120040725.32207-1-jerry.huang@nxp.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
Message-ID: <20191120040725.32207-5-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NXP Layerscape platforms use RCW (Reset Configure Word) to
setup clocking and IO allocations and then launches the next stage of boot.
RCW needs ATF as well as uboot.
BR2_PACKAGE_HOST_RCW_BOOT_MODE is used to determine if ATF is used for RCW.

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 70d36fff73..6896d9a7aa 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -95,6 +95,15 @@ endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
+RCW_BOOT_MODE = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BOOT_MODE))
+ifneq ($(RCW_BOOT_MODE),)
+RCW_PATH = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BIN))
+RCW_FILE = $(lastword $(subst /, ,$(RCW_PATH)))
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BOOT_MODE=$(RCW_BOOT_MODE) RCW=$(BINARIES_DIR)/$(RCW_FILE)
+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-rcw
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl
-- 
2.17.1
