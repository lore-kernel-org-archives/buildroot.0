From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:51:57 +0100
Subject: [Buildroot] [git commit] gst1-imx: bump to version 0.12.0
Message-ID: <20160302202755.A547F80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f233f3c5ff533af7232fd046e7351abfe44cf84e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
* vpu:
  - Completely rewritten plugin code; elements now based on libimxvpuapi
    instead of libfslvpuwrap
  - imxvpuenc_h264 inserts SPS/PPS data in front of I/IDR frames
  - imxvpuenc_mjpeg's quality factor actually has an effect, and is
    equivalent to the libjpeg's quality factor (it is used in exactly
    the same way to scale the quantization matrix' coefficients)
  - the encoder's output buffers no longer have to use DMA memory; they
    use regular system memory instead
  - new support in imxvpudec (referred to as "chroma interleaving") for
    NV12, NV16, NV24 as output formats as an alternative to the I420,
    Y42B, Y444 formats
  - removed all of the system frame number tracking code, since it is
    unnecessary; Instead, the libimxvpuapi's context fields are used to
    associate input/output frames with GstVideoCodecFrame system frame
    numbers
  - fix memory leaks related to missing buffer pool unref'ing

* imxv4l2videosrc:
  - support for crop metadata
  - element uses the width, height, etc. of the format that the device
    actually uses during operation (instead of default values)
  - autofocus control support via GstPhotography
  - fix incorrect GLib warnings
  - fix segmentation fault when shutting down the element

* eglvivsink:
  - remove extra g_free() calls, which lead to runtime errors
  - remove GLESv2 VIVANTE link dependencies
  - add Android platform
  - manually retrieve VIV direct texture functions
    with this and the link dependency elimination, this means that for
    platforms except the framebuffer one, no Vivante specific headers
    and libraries are needed anymore
  - fix blocking issue in the Wayland platform mainloop

* improved and expanded documentation

* pxp: NV16 *is* supported after all (it was actually a bug in GStreamer
pre-1.5.91)
NOTE: this does not break compatibility with GStreamer versions older
than 1.5.91

* compositor: Update backported aggregator code to GStreamer 1.6

* blitter:
  - error handling improvements
  - add missing buffer pool unref'ing, which lead to memory leaks
  - add missing compositor dependency to blitter base

* uniaudio:
  - only build the uniaudio plugin if at least one codec was found
    during configuration
  - disable plugin if the gstaudio library is not available
  - add AAC profile field to the sink caps with GStreamer >= 1.4.4 to
    ensure the uniaudio decoder is only used for AAC-LC data

* ipu: increase fill frame width from 8 to 64 pixels to make IPU fill
operations work with pre-3.14 Freescale kernels

* g2d: use padding pixels when setting surface parameters, fixing G2D
failures with frame sizes that aren't aligned

* wscript:
  - improve Android support
  - fix installation paths for the common, blitter, compositor libraries

This is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/cf7a088

However this package now offers a more flexible approach because it can
be built without the GPU or VPU elements for devices based on SoCs that
lack those features like the new i.MX7.

Tested with the following commands on i.MX6Q (IPU):
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxeglvivsink

Tested with the following commands on i.MX6SX (PXP):
 # gst-launch-1.0 imxv4l2videosrc device=/dev/video1 ! imxpxpvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-imx/Config.in     | 18 +++++++-----------
 package/gstreamer1/gst1-imx/gst1-imx.hash |  2 ++
 package/gstreamer1/gst1-imx/gst1-imx.mk   | 20 +++++++++++++++++---
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index f7284f4..0084483 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -1,27 +1,23 @@
 comment "gst1-imx needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm && !BR2_LINUX_KERNEL
 
-# Required by imx-gpu-viv
-comment "gst1-imx needs an (e)glibc toolchain"
-	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
 config BR2_PACKAGE_GST1_IMX
 	bool "gst1-imx"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
-	depends on BR2_TOOLCHAIN_USES_GLIBC # imx-gpu-viv
-	depends on BR2_PACKAGE_IMX_GPU_VIV
-	depends on BR2_PACKAGE_LIBFSLVPUWRAP
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  This is a set of GStreamer 1.0 plugins for plugins for Freescale's
-	  i.MX6 platforms, with emphasis on video en/decoding using the VPU
-	  engine.
+	  i.MX platforms, which make use of the i.MX multimedia capabilities.
 
 	  This software supports only the i.MX6 SoC family and requires a
 	  kernel that includes the i.MX6 specific headers to be built.
 
-	  The software as a whole is currently in beta stage.
+	  The IPU and PXP plugins are always built.
+	  The V4L2 plugin is built when BR2_PACKAGE_GST1_PLUGINS_BAD is enabled.
+	  The VPU plugin is built when BR2_PACKAGE_LIBIMXVPUAPI is enabled.
+	  The EGL plugin is built when BR2_PACKAGE_IMX_GPU_VIV is enabled.
+	  The G2D plugin is built when BR2_PACKAGE_IMX_GPU_VIV_G2D is enabled.
+	  The MP3 plugin is built when BR2_PACKAGE_LIBFSLCODEC is enabled.
 
 	  https://github.com/Freescale/gstreamer-imx
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.hash b/package/gstreamer1/gst1-imx/gst1-imx.hash
new file mode 100644
index 0000000..03e1729
--- /dev/null
+++ b/package/gstreamer1/gst1-imx/gst1-imx.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 df34f080e24ac8f1619780aa5ad4e6ab1333f822cd2bf5fcb380b28c97248810  gst1-imx-0.12.0.tar.gz
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 8ede8ad..ca6bc49 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_IMX_VERSION = 0.11.1
+GST1_IMX_VERSION = 0.12.0
 GST1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GST1_IMX_VERSION))
 
 GST1_IMX_LICENSE = LGPLv2+
@@ -12,14 +12,27 @@ GST1_IMX_LICENSE_FILES = LICENSE
 
 GST1_IMX_INSTALL_STAGING = YES
 
-GST1_IMX_DEPENDENCIES += host-pkgconf host-python \
-	imx-gpu-viv gstreamer1 gst1-plugins-base libfslvpuwrap
+GST1_IMX_DEPENDENCIES += \
+	host-pkgconf \
+	host-python \
+	gstreamer1 \
+	gst1-plugins-base
 
 # needs access to imx-specific kernel headers
 GST1_IMX_DEPENDENCIES += linux
 GST1_IMX_CONF_OPTS += --prefix="/usr" \
 	--kernel-headers="$(LINUX_DIR)/include"
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
+GST1_IMX_DEPENDENCIES += gst1-plugins-bad
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIMXVPUAPI),y)
+GST1_IMX_DEPENDENCIES += libimxvpuapi
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
+GST1_IMX_DEPENDENCIES += imx-gpu-viv
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 GST1_IMX_DEPENDENCIES += xlib_libX11
 GST1_IMX_CONF_OPTS += --egl-platform=x11
@@ -31,6 +44,7 @@ else
 GST1_IMX_CONF_OPTS += --egl-platform=fb
 endif
 endif
+endif
 
 define GST1_IMX_CONFIGURE_CMDS
 	cd $(@D); \
