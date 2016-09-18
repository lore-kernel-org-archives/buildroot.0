From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 19:21:18 +0200
Subject: [Buildroot] [git commit] raspberrypi3: fix serial console (load
	pi3-miniuart-bt overlay)
Message-ID: <20160918172148.22A00818D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e03cc2290f98fc7434254d2abd9afd504de8360
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- enable BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS in raspberrypi3_defconfig
- add copy of rpi-firmware/overlays directory to boot partition in genimage-raspberrypi3.cfg
- enhance post-image.sh script to add 'dtoverlay=pi3-miniuart-bt' on request
- add BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay" in raspberrypi3_defconfig

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/raspberrypi/genimage-raspberrypi3.cfg |  1 +
 board/raspberrypi/post-image.sh             | 13 +++++++++++++
 board/raspberrypi/readme.txt                |  8 +++++++-
 configs/raspberrypi3_defconfig              |  3 ++-
 4 files changed, 23 insertions(+), 2 deletions(-)

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
index 73ffd65..c009752 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -5,6 +5,19 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
+case "${2}" in
+	--add-pi3-miniuart-bt-overlay)
+	if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+		echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
+		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+
+# fixes rpi3 ttyAMA0 serial console
+dtoverlay=pi3-miniuart-bt
+__EOF__
+	fi
+	;;
+esac
+
 # Mark the kernel as DT-enabled
 mkdir -p "${BINARIES_DIR}/kernel-marked"
 ${HOST_DIR}/usr/bin/mkknlimg "${BINARIES_DIR}/zImage" \
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index a170f8f..03178ff 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -60,7 +60,8 @@ After building, you should obtain this tree:
     |   +-- cmdline.txt
     |   +-- config.txt
     |   +-- fixup.dat
-    |   `-- start.elf
+    |   +-- start.elf
+    |   `-- overlays/               [3]
     +-- sdcard.img
     `-- zImage
 
@@ -69,6 +70,11 @@ After building, you should obtain this tree:
 
 [2] This is the mkknlimg DT-marked kernel.
 
+[3] Only for the Raspberry Pi 3 Model (overlay pi3-miniuart-bt is needed
+    to enable the RPi3 serial console otherwise occupied by the bluetooth
+    chip). Alternative would be to disable the serial console in cmdline.txt
+    and /etc/inittab.
+
 How to write the SD card
 ========================
 
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 4eb5333..8600cd8 100644
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
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
