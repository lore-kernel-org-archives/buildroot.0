From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 29 Apr 2016 23:29:40 +0200
Subject: [Buildroot] [RFC v1] raspberrypi3: fix serial console (load
	pi3-disable-bt overlay)
Message-ID: <1461965380-2763-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- enable BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS in raspberrypi3_defconfig
- add copy of rpi-firmware/overlays directory to boot partition in genimage-raspberrypi3.cfg
- enhance post-image.sh script to add 'dtoverlay=pi3-disable-bt' on request
- add BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-disable-bt-overlay" in raspberrypi3_defconfig

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
ToDo:
- post-image.sh does add the overlay lines on every invocation
- add alternative solution (disable serial console in cmdline.txt and /etc/inittab)
  to readme.txt an/or config.txt
---
 board/raspberrypi/genimage-raspberrypi3.cfg |  1 +
 board/raspberrypi/post-image.sh             | 11 +++++++++++
 configs/raspberrypi3_defconfig              |  3 ++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/genimage-raspberrypi3.cfg b/board/raspberrypi/genimage-raspberrypi3.cfg
index 7ba89c5..baab0c4 100644
--- a/board/raspberrypi/genimage-raspberrypi3.cfg
+++ b/board/raspberrypi/genimage-raspberrypi3.cfg
@@ -7,6 +7,7 @@ image boot.vfat {
       "rpi-firmware/config.txt",
       "rpi-firmware/fixup.dat",
       "rpi-firmware/start.elf",
+      "rpi-firmware/overlays",
       "kernel-marked/zImage"
     }
   }
diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 73ffd65..0426ae5 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -5,6 +5,17 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
+case "${2}" in
+	--add-pi3-disable-bt-overlay)
+	echo "Adding 'dtoverlay=pi3-disable-bt' to config.txt (fixes ttyAMA0 serial console)."
+	cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+
+# fixes rpi3 ttyAMA0 serial console
+dtoverlay=pi3-disable-bt
+__EOF__
+	;;
+esac
+
 # Mark the kernel as DT-enabled
 mkdir -p "${BINARIES_DIR}/kernel-marked"
 ${HOST_DIR}/usr/bin/mkknlimg "${BINARIES_DIR}/zImage" \
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 4eb5333..5e97b88 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
-# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
+BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -34,3 +34,4 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-disable-bt-overlay"
-- 
2.8.1
