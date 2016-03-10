From: Jason Abele <jason.abele@gmail.com>
Date: Thu, 10 Mar 2016 14:23:03 -0800
Subject: [Buildroot] [PATCH] uboot: install multiple spl images
Message-ID: <1457648583-25071-1-git-send-email-jason.abele@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jason Abele <jason@nextthing.co>

For some platforms, there are multiple generated spl images.  Extend
BR2_TARGET_UBOOT_SPL_NAME to allow these multiple images to be installed
after uboot build completes.

Signed-off-by: Jason Abele <jason@nextthing.co>
---
For example, the NextThingCo C.H.I.P. uses two binaries from uboot,
spl/sunxi-spl.bin and spl/sunxi-spl-with-ecc.bin.

This patch allows them to be listed explicitly.

 boot/uboot/Config.in |  2 +-
 boot/uboot/uboot.mk  | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 4a6dc56..d4f9445 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -322,7 +322,7 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	default "spl/u-boot-spl.bin"
 	depends on BR2_TARGET_UBOOT_SPL
 	help
-	  This is the name of the SPL binary, generated during
+	  A space-separated list of SPL binaries, generated during
 	  u-boot build. For most platform it is spl/u-boot-spl.bin
 	  but not always. It is MLO on OMAP for example.
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d539b31..aae99f8 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -169,7 +169,9 @@ define UBOOT_INSTALL_IMAGES_CMDS
 	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
 		cp -dpf $(@D)/$(UBOOT_MAKE_TARGET) $(BINARIES_DIR))
 	$(if $(BR2_TARGET_UBOOT_SPL),
-		cp -dpf $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) $(BINARIES_DIR)/)
+		for p in $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)); do \
+			cp -dpf $(@D)/$$p $(BINARIES_DIR)/; \
+		done)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
 		$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
@@ -196,9 +198,11 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
 define UBOOT_GENERATE_ZYNQ_IMAGE
-	$(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/zynq-boot-bin.py \
-		-u $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))     \
-		-o $(BINARIES_DIR)/BOOT.BIN
+	for p in $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)); do \
+		$(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/zynq-boot-bin.py \
+			-u $(@D)/$$p -o $(BINARIES_DIR)/BOOT.BIN; \
+		fi; \
+	done
 endef
 UBOOT_DEPENDENCIES += host-zynq-boot-bin
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_GENERATE_ZYNQ_IMAGE
-- 
2.1.4
