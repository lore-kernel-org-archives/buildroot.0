From: Chakra Divi <2chakrass@gmail.com>
Date: Sat, 30 Sep 2017 00:41:51 +0530
Subject: [Buildroot] [PATCH] board: icorem6: Add qt5 and gst1 support
Message-ID: <1506712311-10613-1-git-send-email-chakra.divi@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

This patch adds qt5 and steamer support for Engicam i.CoreM6 boards,
test both video and audio with below formats
- MP4
- WebM
- wav

Since few audio patches still under review on Linux mailinglist, this
patch is using custom kernel which is on top of linux-next.

Signed-off-by: Chakra Divi <chakra.divi@openedev.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
--
Note:
This patch is created on top of icorem6 qt5 patch set, so previous
qt5 patche may remove and make use this for both qt5 and gst1 if all agree.

 .gitlab-ci.yml                                   |   1 +
 DEVELOPERS                                       |   1 +
 board/engicam/icorem6/readme.txt                 |  19 ++++
 configs/engicam_imx6qdl_icore_qt5_gst1_defconfig | 122 +++++++++++++++++++++++
 4 files changed, 143 insertions(+)
 create mode 100644 configs/engicam_imx6qdl_icore_qt5_gst1_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 045441d..081c61e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -98,6 +98,7 @@ csky_gx6605s_defconfig: *defconfig
 cubieboard2_defconfig: *defconfig
 engicam_imx6qdl_icore_defconfig: *defconfig
 engicam_imx6qdl_icore_qt5_defconfig: *defconfig
+engicam_imx6qdl_icore_qt5_gst1_defconfig: *defconfig
 engicam_imx6qdl_icore_rqs_defconfig: *defconfig
 engicam_imx6ul_geam_defconfig: *defconfig
 engicam_imx6ul_isiot_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 9d5bf30..fb6b345 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -869,6 +869,7 @@ N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/engicam/
 F:	configs/engicam_imx6qdl_icore_defconfig
 F:	configs/engicam_imx6qdl_icore_qt5_defconfig
+F:	configs/engicam_imx6qdl_icore_qt5_gst1_defconfig
 F:	configs/engicam_imx6qdl_icore_rqs_defconfig
 F:	configs/engicam_imx6ul_geam_defconfig
 F:	configs/engicam_imx6ul_isiot_defconfig
diff --git a/board/engicam/icorem6/readme.txt b/board/engicam/icorem6/readme.txt
index 4fcc9fd..11327bd 100644
--- a/board/engicam/icorem6/readme.txt
+++ b/board/engicam/icorem6/readme.txt
@@ -90,4 +90,23 @@ Running Qt5 Cinematic Demo:
 # export QT_QPA_EGLFS_KMS_CONFIG=/root/imx6qdl-icore-ofcap12.json
 # CinematicExperience-demo
 
+Testing VPU on i.CoreM6:
+=======================
+
+Find connector id using modetest
+# modetest -c
+
+Download video file and copy /mnt
+# wget http://media.xiph.org/mango/tears_of_steel_1080p.webm -P /mnt/
+# gst-launch-1.0 uridecodebin uri=file:///mnt/tears_of_steel_1080p.webm ! \
+> videoscale ! \
+> videoconvert ! \
+> video/x-raw,width=1280,height=800,pixel-aspect-ratio=1/1 ! \
+> kmssink connector-id=38 driver-name="imx-drm"  sync=false
+
+Play Video and Audio:
+
+# youtube-dl -f 136 https://www.youtube.com/watch?v=G6ruSHJgbPM -o Baahubali_Hamsa.mp4
+# gst-play-1.0 Baahubali_Hamsa.mp4 
+
 Enjoy!
diff --git a/configs/engicam_imx6qdl_icore_qt5_gst1_defconfig b/configs/engicam_imx6qdl_icore_qt5_gst1_defconfig
new file mode 100644
index 0000000..c1181a6
--- /dev/null
+++ b/configs/engicam_imx6qdl_icore_qt5_gst1_defconfig
@@ -0,0 +1,122 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/openedev/linux-openedev"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="engicam"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore imx6q-icore-ofcap10 imx6q-icore-ofcap12"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
+BR2_ROOTFS_OVERLAY="board/engicam/icorem6/rootfs_overlay"
+
+# qt5 dependencies
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# qt5
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
+BR2_PACKAGE_QT5BASE_LINUXFB=y
+BR2_PACKAGE_QT5BASE_FONTCONFIG=y
+BR2_PACKAGE_QT5BASE_GIF=y
+BR2_PACKAGE_QT5BASE_JPEG=y
+
+# mesa3d
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_OPENGL_ES=y
+
+# qt5 demo packages
+BR2_PACKAGE_GLMARK2=y
+BR2_PACKAGE_MESA3D_DEMOS=y
+BR2_PACKAGE_KMSCUBE=y
+BR2_PACKAGE_QT5CINEX=y
+BR2_PACKAGE_QT5CINEX_HD=y
+
+# fonts
+BR2_PACKAGE_BITSTREAM_VERA=y
+BR2_PACKAGE_CANTARELL=y
+BR2_PACKAGE_DEJAVU=y
+BR2_PACKAGE_FONT_AWESOME=y
+BR2_PACKAGE_GHOSTSCRIPT_FONTS=y
+BR2_PACKAGE_INCONSOLATA=y
+BR2_PACKAGE_LIBERATION=y
+
+# libdrm tests
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+
+# NXP packages
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+
+# gstreamer-1.0
+BR2_PACKAGE_GSTREAMER1=y
+BR2_PACKAGE_GST1_LIBAV=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_RAWPARSE=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEINTERLACE=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2=y
+BR2_PACKAGE_GST1_PLUGINS_BAD=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUTOCONVERT=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGDEMUX=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SMOOTH=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264=y
+BR2_PACKAGE_GST1_PLUGINS_UGLY=y
+BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123=y
+BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_X264=y
-- 
2.7.4
