From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:14:25 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] Fix rasberry Pi 64bit
 firmware overlay inclusion
Message-ID: <20190424201024.7A476802FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b05381cbb5ea427f54fe381e64faace536ff6bb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout: fix indentation, and add comment explaining why an empty
         directory is created.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(cherry picked from commit 51d6d6c580432435f2b2f95ed35e22a5ecbe9dcb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/genimage-raspberrypi3-64.cfg | 1 +
 package/rpi-firmware/rpi-firmware.mk           | 6 ++++++
 2 files changed, 7 insertions(+)

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
index e41b3442e6..630bc670ca 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -24,6 +24,12 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
 	done
 endef
+else
+# Still create the directory, so a genimage.cfg can include it independently of
+# whether _INSTALL_DTB_OVERLAYS is selected or not.
+define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
+	$(INSTALL) -d $(BINARIES_DIR)/rpi-firmware/overlays
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
