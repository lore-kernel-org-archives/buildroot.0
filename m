From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Jan 2015 21:23:53 +0100
Subject: [Buildroot] [PATCH 7/7] package/rpi-firmware: append the DTOK
	footer for DT-aware kernel
In-Reply-To: <cover.1420142707.git.yann.morin.1998@free.fr>
References: <cover.1420142707.git.yann.morin.1998@free.fr>
Message-ID: <0c0f5c97634b438044f09c32bdc42edcd878feb0.1420142707.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building a DT-aware kernel, we need to append a footer that tells
the bootloader that the kernel has DT support.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index dedfbc5..7a35e99 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -22,6 +22,16 @@ define RPI_FIRMWARE_INSTALL_DTB
 		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
 	done
 endef
+
+ifeq ($(BR2_LINUX_KERNEL),y)
+RPI_FIRMWARE_DEPENDENCIES += linux
+define RPI_FIRMWARE_KERNEL_APPEND_DTOK_FOOTER
+	$(HOST_DIR)/usr/bin/mkknlimg --dtok \
+		$(BINARIES_DIR)/$(notdir $(LINUX_IMAGE_PATH)) \
+		$(BINARIES_DIR)/$(notdir $(LINUX_IMAGE_PATH)).dtok
+endef
+endif
+
 endif
 
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
@@ -30,6 +40,8 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
 	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
+	$(RPI_FIRMWARE_INSTALL_DTB)
+	$(RPI_FIRMWARE_KERNEL_APPEND_DTOK_FOOTER)
 endef
 
 # We have no host sources to get, since we already
-- 
1.9.1
