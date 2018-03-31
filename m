From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 31 Mar 2018 12:31:32 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi0w_defconfig: new
 defconfig for Raspberry Pi Zero W
Message-ID: <20180331103226.1961F83F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=650818fb3a6fb7b9bd9fcefabbc187c1bbe95e0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Up to now, Raspberry Pi Zero W (rpi0w) could be built with the normal
raspberrypi0_defconfig. However, then you don't have support for the
Bluetooth out-of-the-box, which makes using a W a bit pointless.

Therefore, create a separate defconfig for the W. It is a copy of
raspberrypi0_defconfig with the following changes:
 - Add DT overlays (from rpi-firmware) to support Bluetooth.
 - Pass --add-pi3-miniuart-bt-overlay to post-image.sh.

Since there is now a separate raspberrypi0w_defconfig, the W support
can be removed from raspberrypi0_defconfig.

Signed-off-by: Yves Deweerdt <yves.deweerdt.linux@gmail.com>
[Arnout:
 - Bump to same kernel version as raspberrypi0.
 - Remove redundant comment.
 - Remove redundant default BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y.
 - Improve commit log.
 - Refresh .gitlab-ci.yml.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml                                                |  1 +
 board/raspberrypi/genimage-raspberrypi0.cfg                   |  1 -
 .../{genimage-raspberrypi0.cfg => genimage-raspberrypi0w.cfg} |  2 +-
 board/raspberrypi0w                                           |  1 +
 configs/raspberrypi0_defconfig                                |  2 +-
 configs/{raspberrypi0_defconfig => raspberrypi0w_defconfig}   | 11 ++++-------
 6 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 952fffaf88..20a5a6521a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -212,6 +212,7 @@ qemu_x86_defconfig: *defconfig
 qemu_xtensa_lx60_defconfig: *defconfig
 qemu_xtensa_lx60_nommu_defconfig: *defconfig
 raspberrypi0_defconfig: *defconfig
+raspberrypi0w_defconfig: *defconfig
 raspberrypi2_defconfig: *defconfig
 raspberrypi3_64_defconfig: *defconfig
 raspberrypi3_defconfig: *defconfig
diff --git a/board/raspberrypi/genimage-raspberrypi0.cfg b/board/raspberrypi/genimage-raspberrypi0.cfg
index 212c30607e..a9d4c4501f 100644
--- a/board/raspberrypi/genimage-raspberrypi0.cfg
+++ b/board/raspberrypi/genimage-raspberrypi0.cfg
@@ -2,7 +2,6 @@ image boot.vfat {
   vfat {
     files = {
       "bcm2708-rpi-b-plus.dtb",
-      "bcm2708-rpi-0-w.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
diff --git a/board/raspberrypi/genimage-raspberrypi0.cfg b/board/raspberrypi/genimage-raspberrypi0w.cfg
similarity index 93%
copy from board/raspberrypi/genimage-raspberrypi0.cfg
copy to board/raspberrypi/genimage-raspberrypi0w.cfg
index 212c30607e..3aafd9b6fc 100644
--- a/board/raspberrypi/genimage-raspberrypi0.cfg
+++ b/board/raspberrypi/genimage-raspberrypi0w.cfg
@@ -1,13 +1,13 @@
 image boot.vfat {
   vfat {
     files = {
-      "bcm2708-rpi-b-plus.dtb",
       "bcm2708-rpi-0-w.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
       "rpi-firmware/fixup.dat",
       "rpi-firmware/start.elf",
+      "rpi-firmware/overlays",
       "zImage"
     }
   }
diff --git a/board/raspberrypi0w b/board/raspberrypi0w
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypi0w
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 0fb8a99465..8a213fc4b1 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -16,7 +16,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 # Build the DTBs for A/B from the kernel sources: the zero is the same
 # as the A+ model, just in a different form-factor
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b-plus bcm2708-rpi-0-w"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b-plus"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0w_defconfig
similarity index 64%
copy from configs/raspberrypi0_defconfig
copy to configs/raspberrypi0w_defconfig
index 0fb8a99465..973412380d 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -12,14 +12,10 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="33ee56d5927ceff630fbc87e3f5caa409b6ae114"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
-
-# Build the DTBs for A/B from the kernel sources: the zero is the same
-# as the A+ model, just in a different form-factor
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b-plus bcm2708-rpi-0-w"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-0-w"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
-# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -30,5 +26,6 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
