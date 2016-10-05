From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  5 Oct 2016 18:48:16 -0300
Subject: [Buildroot] [PATCH] boot/uboot: Fix SPL binary installation
Message-ID: <1475704096-22801-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit fad58cefa4a392b ("boot/uboot: allow to build multiple U-Boot images")
broke U-Boot SPL binary installation. Taking mx6cubox_defconfig target as an example:

  LD      u-boot
  OBJCOPY u-boot-nodtb.bin
  COPY    u-boot.bin
  MKIMAGE u-boot.img
>>> uboot 2016.09.01 Installing to target
>>> uboot 2016.09.01 Installing to images directory
cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/u-boot.bin /home/fabio/buildroot/output/images/
cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/u-boot.img /home/fabio/buildroot/output/images/
cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/SPL /home/fabio/buildroot/output/images/
cp: cannot stat '/home/fabio/buildroot/output/build/uboot-2016.09.01/SPL': No such file or directory

Fix this problem by adding the SPL binary into UBOOT_BINS and UBOOT_MAKE_TARGET
variables.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 boot/uboot/uboot.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7379a4d..237ef26 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -71,6 +71,11 @@ UBOOT_BINS += u-boot-dtb.img
 UBOOT_MAKE_TARGET += all u-boot-dtb.img
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_SPL),y)
+UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
+UBOOT_MAKE_TARGET += $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
 UBOOT_BINS += u-boot.img
 UBOOT_MAKE_TARGET += u-boot.img
@@ -201,11 +206,6 @@ define UBOOT_INSTALL_IMAGES_CMDS
 	)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
 		cp -dpf $(@D)/u-boot.sb $(BINARIES_DIR))
-	$(if $(BR2_TARGET_UBOOT_SPL),
-		$(foreach f,$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)), \
-			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
-		)
-	)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
 		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
 			$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
-- 
2.7.4
