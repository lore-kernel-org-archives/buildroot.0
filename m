From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 May 2014 19:10:28 +0200
Subject: [Buildroot] [PATCH 02/12] boot/syslinux: prepare to install
	non-core images
In-Reply-To: <cover.1399050467.git.yann.morin.1998@free.fr>
References: <cover.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <a97459285686cf125f65342845e09771ac51f0d3.1399050467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

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
---
 boot/syslinux/syslinux.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
 
-- 
1.8.3.2
