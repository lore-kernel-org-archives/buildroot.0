From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 14 Jun 2017 13:22:27 +0200
Subject: [Buildroot] [PATCH] arm-trusted-firmware: cleanup make target
	handling
Message-ID: <1497439347-10579-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARM_TRUSTED_FIRMWARE_MAKE_TARGET is expanded, but it's never assigned
so it is always empty. On the other hand the make targets are defined
in ARM_TRUSTED_FIRMWARE_MAKE_OPTS, which should contain options, not
targets.

Clean it all up by moving the targets in the proper place, replacing
the useless $(ARM_TRUSTED_FIRMWARE_MAKE_TARGET).

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index b5ee516ec6d8..9bd3bfce6c7d 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -32,8 +32,7 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	BL33=$(BINARIES_DIR)/u-boot.bin \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
-	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
-	all fip
+	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
 
 ifeq ($(BR2_TARGET_VEXPRESS_FIRMWARE),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
@@ -43,7 +42,7 @@ endif
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
-			$(ARM_TRUSTED_FIRMWARE_MAKE_TARGET)
+			all fip
 endef
 
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
-- 
2.7.4
