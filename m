From: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
Date: Tue, 29 Nov 2016 16:53:32 -0200
Subject: [Buildroot] [PATCH 1/1] uboot: support -b option for mkenvimage
Message-ID: <1480445612-6188-1-git-send-email-tiago.brusamarello@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When generating the environment image the target endianess should
be taken in account for CRC calculation purposes. For big endian
targets the -b flag should be passed to the mkenvimage tool.

Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 3e347c1..17b80cc 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -223,6 +223,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
 		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
 			$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 			$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
+			$(if $(findstring "BIG", $(BR2_ENDIAN)),-b) \
 			-o $(BINARIES_DIR)/uboot-env.bin -)
 endef
 
-- 
1.9.1
