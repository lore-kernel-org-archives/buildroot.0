From: Nicolas Dechesne <n-dechesne@ti.com>
Date: Wed, 15 Feb 2012 23:04:13 +0100
Subject: [Buildroot] [PATCH 1/3 v2] uboot: Add support for U-Boot SPL
In-Reply-To: <1329343455-32714-1-git-send-email-n-dechesne@ti.com>
References: <1329343455-32714-1-git-send-email-n-dechesne@ti.com>
Message-ID: <1329343455-32714-2-git-send-email-n-dechesne@ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SPL is a first stage bootloader. On pandaboard it supercedes x-loader,
and should now be used.

This patch ensures that either SPL or xloader can be selected

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
---
 boot/uboot/Config.in |    6 ++++++
 boot/uboot/uboot.mk  |    2 ++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c8db9fb..3661407 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -137,4 +137,10 @@ config BR2_TARGET_UBOOT_ETH1ADDR
 
 endif # BR2_TARGET_UBOOT_NETWORK
 
+config BR2_TARGET_UBOOT_SPL
+	bool "U-Boot SPL support"
+	depends on !BR2_TARGET_XLOADER
+	help
+	  Enable the U-Boot SPL support
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index db9de8d..41745c9 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -88,6 +88,8 @@ endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
+	$(if $(BR2_TARGET_UBOOT_SPL),
+		cp -dpf $(@D)/MLO $(BINARIES_DIR)/)
 endef
 
 $(eval $(call GENTARGETS))
-- 
1.7.9
