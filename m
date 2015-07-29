From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 17:03:15 +0200
Subject: [Buildroot] [git commit] grub2: build El Torito image only for i386
	PC platform
Message-ID: <20150729150335.528DD81817@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f609ed603220e0ac0ef9a45b0214eb87ab85d1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building Grub2 El Torito for i386 EFI errors complaining it cannot
find cdboot.img

        cdboot.img: No such file or directory

This commit builds El Torito for i386 PC only.

[Thomas: fix installation ordering.]

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/grub2.mk |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 280b4d6..1fc910e 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -67,6 +67,13 @@ GRUB2_CONF_OPTS = \
 
 GRUB2_INSTALL_TARGET_OPTS = DESTDIR=$(HOST_DIR) install
 
+ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
+define GRUB2_IMAGE_INSTALL_ELTORITO
+	cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
+		$(BINARIES_DIR)/grub-eltorito.img
+endef
+endif
+
 define GRUB2_IMAGE_INSTALLATION
 	mkdir -p $(dir $(GRUB2_IMAGE))
 	$(HOST_DIR)/usr/bin/grub-mkimage \
@@ -76,10 +83,9 @@ define GRUB2_IMAGE_INSTALLATION
 		-p "$(GRUB2_PREFIX)" \
 		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
 		$(GRUB2_BUILTIN_MODULES)
-	cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
-		$(BINARIES_DIR)/grub-eltorito.img
 	mkdir -p $(dir $(GRUB2_CFG))
 	$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG)
+	$(GRUB2_IMAGE_INSTALL_ELTORITO)
 endef
 GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_IMAGE_INSTALLATION
 
