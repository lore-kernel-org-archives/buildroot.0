From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:35:52 +0100
Subject: [Buildroot] [git commit] gst1-imx: add menuconfig to select each
	plugin individually
Message-ID: <20170206183634.7AAF98213B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee5bbc8cf087943cb1e8575327d44727139c4e65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also making it clearer as for what each plugin dependencies are.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
[Thomas: invert conditions to avoid empty ifeq ... else statements.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-imx/Config.in   | 89 ++++++++++++++++++++++++++++-----
 package/gstreamer1/gst1-imx/gst1-imx.mk | 53 +++++++++++++++++---
 2 files changed, 121 insertions(+), 21 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index efd5086..9f792d1 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -1,4 +1,8 @@
-config BR2_PACKAGE_GST1_IMX
+comment "gst1-imx needs a toolchain w/ dynamic library"
+	depends on BR2_arm
+	depends on BR2_STATIC_LIBS
+
+menuconfig BR2_PACKAGE_GST1_IMX
 	bool "gst1-imx"
 	depends on BR2_arm # Only relevant for i.MX
 	depends on !BR2_STATIC_LIBS
@@ -7,18 +11,77 @@ config BR2_PACKAGE_GST1_IMX
 	  This is a set of GStreamer 1.0 plugins for plugins for Freescale's
 	  i.MX platforms, which make use of the i.MX multimedia capabilities.
 
-	  This software supports only the i.MX6 SoC family.
+	  https://github.com/Freescale/gstreamer-imx
 
-	  The IPU and PXP plugins are built when an imx-specific kernel is
-	  enabled.
-	  The V4L2 plugin is built when BR2_PACKAGE_GST1_PLUGINS_BAD is enabled.
-	  The VPU plugin is built when BR2_PACKAGE_LIBIMXVPUAPI is enabled.
-	  The EGL plugin is built when BR2_PACKAGE_IMX_GPU_VIV is enabled.
-	  The G2D plugin is built when BR2_PACKAGE_IMX_GPU_VIV_G2D is enabled.
-	  The MP3 plugin is built when BR2_PACKAGE_IMX_CODEC is enabled.
+if BR2_PACKAGE_GST1_IMX
 
-	  https://github.com/Freescale/gstreamer-imx
+config BR2_PACKAGE_GST1_IMX_EGLVISINK
+	bool "imxeglvivsink"
+	depends on BR2_PACKAGE_IMX_GPU_VIV
+	help
+	  Elements leveraging the 3D GPU
 
-comment "gst1-imx needs a toolchain w/ dynamic library"
-	depends on BR2_arm
-	depends on BR2_STATIC_LIBS
+comment "imxeglvivsink needs the Vivante 3D libraries"
+	depends on !BR2_PACKAGE_IMX_GPU_VIV
+
+config BR2_PACKAGE_GST1_IMX_G2D
+	bool "imxg2d"
+	depends on BR2_PACKAGE_IMX_GPU_VIV_G2D
+	help
+	  Elements leveraging the 2D GPU
+
+comment "imxg2d needs the Vivante 2D libraries"
+	depends on !BR2_PACKAGE_IMX_GPU_VIV_G2D
+
+config BR2_PACKAGE_GST1_IMX_IPU
+	bool "imxipu"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Elements leveraging the IPU
+
+comment "imxipu needs an imx-specific Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_GST1_IMX_MP3ENCODER
+	bool "mp3encoder"
+	depends on BR2_PACKAGE_IMX_CODEC
+	help
+	  Elements for MP3 encoding
+
+comment "mp3encoder needs the i.MX codec binaries"
+	depends on !BR2_PACKAGE_IMX_CODEC
+
+config BR2_PACKAGE_GST1_IMX_PXP
+	bool "imxpxp"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Elements leveraging the PXP
+
+comment "imxpxp needs an imx-specific Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_GST1_IMX_UNIAUDIODEC
+	bool "uniaudiodec"
+	depends on BR2_PACKAGE_IMX_CODEC
+	help
+	  Elements for audio decoding
+
+comment "uniaudiodec needs the i.MX codec binaries"
+	depends on !BR2_PACKAGE_IMX_CODEC
+
+config BR2_PACKAGE_GST1_IMX_VPU
+	bool "imxvpu"
+	depends on BR2_PACKAGE_LIBIMXVPUAPI
+	help
+	  Elements leveraging the VPU
+
+comment "imxvpu needs the VPU imxvpuapi library"
+	depends on !BR2_PACKAGE_LIBIMXVPUAPI
+
+config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC
+	bool "imxv4l2videosrc"
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	help
+	  Elements for V4L2 capture
+
+endif
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index b1d01bb..88429ae 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -25,20 +25,16 @@ GST1_IMX_DEPENDENCIES += linux
 GST1_IMX_CONF_OPTS += --kernel-headers="$(LINUX_DIR)/include"
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
-GST1_IMX_DEPENDENCIES += gst1-plugins-bad
-endif
-
 ifeq ($(BR2_PACKAGE_IMX_CODEC),y)
 GST1_IMX_DEPENDENCIES += imx-codec
 endif
 
-ifeq ($(BR2_PACKAGE_LIBIMXVPUAPI),y)
-GST1_IMX_DEPENDENCIES += libimxvpuapi
-endif
-
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 GST1_IMX_DEPENDENCIES += imx-gpu-viv
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_IMX_EGLVISINK),y)
+# There's no --enable-eglvivsink option
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 GST1_IMX_DEPENDENCIES += xlib_libX11
 GST1_IMX_CONF_OPTS += --egl-platform=x11
@@ -50,6 +46,47 @@ else
 GST1_IMX_CONF_OPTS += --egl-platform=fb
 endif
 endif
+else
+GST1_IMX_CONF_OPTS += --disable-eglvivsink
+endif
+
+# There's no --enable-g2d option
+ifeq ($(BR2_PACKAGE_GST1_IMX_G2D),)
+GST1_IMX_CONF_OPTS += --disable-g2d
+endif
+
+# There's no --enable-ipu option
+ifeq ($(BR2_PACKAGE_GST1_IMX_IPU),)
+GST1_IMX_CONF_OPTS += --disable-ipu
+endif
+
+# There's no --enable-mp3encoder option
+ifeq ($(BR2_PACKAGE_GST1_IMX_MP3ENCODER),)
+GST1_IMX_CONF_OPTS += --disable-mp3encoder
+endif
+
+# There's no --enable-pxp option
+ifeq ($(BR2_PACKAGE_GST1_IMX_PXP),)
+GST1_IMX_CONF_OPTS += --disable-pxp
+endif
+
+# There's no --enable-uniaudiodec option
+ifeq ($(BR2_PACKAGE_GST1_IMX_UNIAUDIODEC),)
+GST1_IMX_CONF_OPTS += --disable-uniaudiodec
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_IMX_VPU),y)
+# There's no --enable-vpu option
+GST1_IMX_DEPENDENCIES += libimxvpuapi
+else
+GST1_IMX_CONF_OPTS += --disable-vpu
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC),y)
+# There's no --enable-v4l2src option
+GST1_IMX_DEPENDENCIES += gst1-plugins-bad
+else
+GST1_IMX_CONF_OPTS += --disable-v4l2src
 endif
 
 $(eval $(waf-package))
