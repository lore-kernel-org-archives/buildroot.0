From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Thu, 26 Oct 2017 20:11:41 +0200
Subject: [Buildroot] [PATCH v4 01/11] arm-trusted-firmware: Build FIP for
	BL33
In-Reply-To: <1509041511-30956-1-git-send-email-jagan@amarulasolutions.com>
References: <1509041511-30956-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <1509041511-30956-2-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To build FIP for Juno, we need to set BL33 for non-BL33
there is no need to build the FIP, so this patch adjust
the make to handle both scenarios.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 7b1cc6e..5b4e3b0 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -28,21 +28,25 @@ ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
 
 ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
 
+ARM_TRUSTED_FIRMWARE_CMDS += all
+
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	BL33=$(BINARIES_DIR)/u-boot.bin \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
 
 ifeq ($(BR2_TARGET_VEXPRESS_FIRMWARE),y)
-ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	BL33=$(BINARIES_DIR)/u-boot.bin \
+	SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
+ARM_TRUSTED_FIRMWARE_CMDS += fip
 endif
 
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
-			all fip
+			$(ARM_TRUSTED_FIRMWARE_CMDS)
 endef
 
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
-- 
1.9.1
