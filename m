From: Nicolas Dechesne <n-dechesne@ti.com>
Date: Sun,  5 Feb 2012 01:35:46 +0100
Subject: [Buildroot] [PATCH 1/2] Add support for U-Boot SPL
In-Reply-To: <1328402147-21404-1-git-send-email-n-dechesne@ti.com>
References: <1328402147-21404-1-git-send-email-n-dechesne@ti.com>
Message-ID: <1328402147-21404-2-git-send-email-n-dechesne@ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SPL is a first stage bootloader. On pandaboard it supercedes x-loader,
and should now be used.

- this patch ensures that either SPL or xloader can be selected
- SPL will load 'u-boot.img' instead of 'u-boot.bin, so the name
  is updated accordingly

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
---
 boot/uboot/Config.in |    6 ++++++
 boot/uboot/uboot.mk  |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c8db9fb..1b94803 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -137,4 +137,10 @@ config BR2_TARGET_UBOOT_ETH1ADDR
 
 endif # BR2_TARGET_UBOOT_NETWORK
 
+config BR2_TARGET_UBOOT_SPL
+	bool "U-Boot SPL suport"
+	depends on !BR2_TARGET_XLOADER
+	help
+	  Enable the U-Boot SPL support
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index db9de8d..b327f4b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -29,6 +29,8 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
 UBOOT_BIN          = u-boot.ldr
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BIN          = u-boot-nand.bin
+else ifeq ($(BR2_TARGET_UBOOT_SPL),y)
+UBOOT_BIN          = u-boot.img
 else
 UBOOT_BIN          = u-boot.bin
 endif
@@ -88,6 +90,8 @@ endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
+	$(if $(BR2_TARGET_UBOOT_SPL),
+		cp -dpf $(@D)/MLO $(BINARIES_DIR)/)
 endef
 
 $(eval $(call GENTARGETS))
-- 
1.7.8.3
