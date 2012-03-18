From: Nicolas Dechesne <n-dechesne@ti.com>
Date: Sun, 18 Mar 2012 23:04:50 +0100
Subject: [Buildroot] [PATCH 1/3 v4] uboot: Add support for U-Boot SPL
In-Reply-To: <1332108292-28094-1-git-send-email-n-dechesne@ti.com>
References: <1332108292-28094-1-git-send-email-n-dechesne@ti.com>
Message-ID: <1332108292-28094-2-git-send-email-n-dechesne@ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SPL is a first stage bootloader. On pandaboard it supercedes x-loader,
and should now be used.

This patch ensures that either SPL or xloader can be selected.

A config variable has been added for the name of the SPL binary generated
during u-boot build. For most platform it is u-boot-spl.bin but not always.
It is MLO on OMAP for example.

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/uboot/Config.in |   18 ++++++++++++++++++
 boot/uboot/uboot.mk  |    2 ++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c8db9fb..4873e62 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -137,4 +137,22 @@ config BR2_TARGET_UBOOT_ETH1ADDR
 
 endif # BR2_TARGET_UBOOT_NETWORK
 
+config BR2_TARGET_UBOOT_SPL
+	bool "U-Boot SPL support"
+	depends on !BR2_TARGET_XLOADER
+	help
+	  Enable the U-Boot SPL support. SPL is a first stage
+	  bootloader loaded into internal memory in charge of 
+	  enabling and configuring the external memory (DDR), 
+	  and load the u-boot program into DDR.
+
+config BR2_TARGET_UBOOT_SPL_NAME
+	string "U-Boot SPL target name"
+	default "u-boot-spl.bin"
+	depends on BR2_TARGET_UBOOT_SPL
+	help
+	  This is the name of the SPL binary, generated during
+	  u-boot build. For most platform it is u-boot-spl.bin
+	  but not always. It is MLO on OMAP for example.
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index db9de8d..f64964c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -88,6 +88,8 @@ endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
+	$(if $(BR2_TARGET_UBOOT_SPL),
+		cp -dpf $(@D)/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
 endef
 
 $(eval $(call GENTARGETS))
-- 
1.7.9.1
