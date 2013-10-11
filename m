From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 11 Oct 2013 08:57:49 +0100
Subject: [Buildroot] [PATCH] uboot: support -r option for mkenvimage
Message-ID: <1381478269-29943-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Some boards are configured in u-boot to store multiple redundant copies of
the environment image in flash. For these boards, it is required to pass the -r
flag, when generating a boot environment image using mkenvimage.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 boot/uboot/Config.in | 5 +++++
 boot/uboot/uboot.mk  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 998cda2..d33e8e1 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -242,6 +242,11 @@ config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
 	  Size of envronment, can be prefixed with 0x for hexadecimal
 	  values.
 
+config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
+	bool "Redundant environment"
+	help
+	  The environment has multiple copies in flash.
+
 endif # BR2_TARGET_UBOOT_ENVIMAGE
 
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dc8e26f..330c177 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -117,6 +117,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
 		cp -dpf $(@D)/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
 		$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
+		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
 		-o $(BINARIES_DIR)/uboot-env.bin $(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
 endef
 
-- 
1.8.1.2
