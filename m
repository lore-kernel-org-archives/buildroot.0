From: Matt Flax <flatmax@flatmax.org>
Date: Thu,  3 Jan 2019 22:00:36 +1100
Subject: [Buildroot] [PATCH 1/1] Fix rasberry Pi 64bit firmware overlay
 inclusion
Message-ID: <20190103110036.14604-1-flatmax@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch enables the inclusion of the Pi's overlays. Previously
the overlays were not included in the genimage configuration.
This patch ensures overlays are included in the sdcard (when
enabled) by defaulting to the inclusion of an empty
output/images/rpi-firmware/overlays directory in genimage cfg.

The Pi's overlays are built with the following config
variables:
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
BR2_LINUX_KERNEL_IMAGE_NAME="Image"
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image modules dtbs"

After building, the dtbo files are present in the
output/images/rpi-firmware/overlays directory but not added
to the sdcard because they are missing from the genimage cfg
file.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
---
 board/raspberrypi/genimage-raspberrypi3-64.cfg | 1 +
 package/rpi-firmware/rpi-firmware.mk           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/board/raspberrypi/genimage-raspberrypi3-64.cfg b/board/raspberrypi/genimage-raspberrypi3-64.cfg
index 0d0ca750a7..af1d17cde7 100644
--- a/board/raspberrypi/genimage-raspberrypi3-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypi3-64.cfg
@@ -9,6 +9,7 @@ image boot.vfat {
       "rpi-firmware/config.txt",
       "rpi-firmware/fixup.dat",
       "rpi-firmware/start.elf",
+      "rpi-firmware/overlays",
       "Image"
     }
   }
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index bb54904ae6..0df7b17cbd 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -24,6 +24,10 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
 	done
 endef
+else
+define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
+		$(INSTALL) -d $(BINARIES_DIR)/rpi-firmware/overlays || exit 1;
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
-- 
2.19.1
