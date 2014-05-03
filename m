From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 21:33:32 +0200
Subject: [Buildroot] [git commit] boot/syslinux: prepare to install non-core
	images
Message-ID: <20140503200855.C9BC99CACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b8f9004f475d29c14347af3764dd766417e0ee9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we hard-code the path to the images we install, and
expect them to be from the core/ sub-dir.

Not all images we can install are located in core/. For example,
the efi boot images (to come later) are not located in core/.

Prepare the upcoming installation of extlinux by not expecting
images be in core/.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Lundquist <lists@zelow.no>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/syslinux.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 0faa81f..a1eb394 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -28,12 +28,12 @@ define SYSLINUX_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
 endef
 
-SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += isolinux.bin
-SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += pxelinux.bin
+SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += core/isolinux.bin
+SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += core/pxelinux.bin
 
 define SYSLINUX_INSTALL_IMAGES_CMDS
 	for i in $(SYSLINUX_IMAGES-y); do \
-		$(INSTALL) -D -m 0755 $(@D)/core/$$i $(BINARIES_DIR)/$$i; \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/$${i##*/}; \
 	done
 endef
 
