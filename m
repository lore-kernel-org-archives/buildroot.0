From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Wed, 29 Jul 2015 08:41:29 +0000
Subject: [Buildroot] [PATCH] Build El Torito for i386 PC
Message-ID: <1438159289.2675.5.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building Grub2 El Torito for i386 EFI errors complaining it cannot find cdboot.img

        cdboot.img: No such file or directory

This commit builds El Torito for i386 EFI only
---
 boot/grub2/grub2.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 280b4d6..7e0f31f 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -67,6 +67,14 @@ GRUB2_CONF_OPTS = \
 
 GRUB2_INSTALL_TARGET_OPTS = DESTDIR=$(HOST_DIR) install
 
+ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
+define GRUB2_IMAGE_INSTALL_ELTORITO
+	cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
+		$(BINARIES_DIR)/grub-eltorito.img
+endef
+GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_IMAGE_INSTALL_ELTORITO
+endif
+
 define GRUB2_IMAGE_INSTALLATION
 	mkdir -p $(dir $(GRUB2_IMAGE))
 	$(HOST_DIR)/usr/bin/grub-mkimage \
@@ -76,8 +84,6 @@ define GRUB2_IMAGE_INSTALLATION
 		-p "$(GRUB2_PREFIX)" \
 		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
 		$(GRUB2_BUILTIN_MODULES)
-	cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
-		$(BINARIES_DIR)/grub-eltorito.img
 	mkdir -p $(dir $(GRUB2_CFG))
 	$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG)
 endef
-- 
2.1.0
