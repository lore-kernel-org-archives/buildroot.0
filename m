From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 13:36:11 +0200
Subject: [Buildroot] [git commit] raspberrypi,
	raspberrypi2: add a serial console
Message-ID: <20160418113616.4C41D817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20878a1017e2bf7eb8c5f870dc6d2641493cb0f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current Buildroot defconfigs for Raspberry Pi and Raspberry Pi 2
instantiate a console on tty1, which appears on HDMI. Add a console on
the serial port (ttyAMA0) to be more consistent with other defconfigs
and provide a better out-of-the-box experience to users used to have a
serial console from Buildroot defconfigs.

This requires three changes:
 1. have two 'console=' entries in the kernel command line: tty1,
    then ttyAMA0;
 2. change BR2_TARGET_GENERIC_GETTY_PORT to "console", so it starts
    a getty on the last console= passed to the kernel, ttyAMA0;
 3. add a new getty on tty1 to the generated inittab.

Step 2 is actually obtained by removing BR2_TARGET_GENERIC_GETTY_PORT
entirely from the defconfigs, since "console" is the default value.

Step 3 requires a post-build script since the Buildroot makefiles can
configure only one console.

Note: instead of simply adding a new getty on ttyAMA0 (which would
work) this patch actually changes BR2_TARGET_GENERIC_GETTY_PORT to
instantiate a console on UART, then adds back tty1 via
post-build.sh. This is done only to avoid the "GENERIC_SERIAL" comment
where we instantiate an HDMI console, then instantiate a really-serial
console on another line.

The result is these two inittab lines:

  console::respawn:/sbin/getty -L  console 0 vt100 # GENERIC_SERIAL
  tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/raspberrypi/post-build.sh  | 9 +++++++++
 configs/raspberrypi2_defconfig   | 2 +-
 configs/raspberrypi_defconfig    | 2 +-
 package/rpi-firmware/cmdline.txt | 2 +-
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
new file mode 100755
index 0000000..7eae14a
--- /dev/null
+++ b/board/raspberrypi/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+set -u
+set -e
+
+# Add a console on tty1
+grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
+sed -i '/GENERIC_SERIAL/a\
+tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 506330c..7fc39c2 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -5,7 +5,6 @@ BR2_ARM_FPU_NEON_VFPV4=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
-BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 4.1 series
@@ -33,4 +32,5 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 1795b2c..8d13381 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -2,7 +2,6 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
-BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 4.1 series
@@ -32,4 +31,5 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
diff --git a/package/rpi-firmware/cmdline.txt b/package/rpi-firmware/cmdline.txt
index 38aa378..155a546 100644
--- a/package/rpi-firmware/cmdline.txt
+++ b/package/rpi-firmware/cmdline.txt
@@ -1 +1 @@
-root=/dev/mmcblk0p2 rootwait
+root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
