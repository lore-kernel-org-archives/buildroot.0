From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 26 Sep 2016 10:15:59 +0200
Subject: [Buildroot] [PATCH v2] gst1-imx: add menuconfig to select each
	plugin individually
Message-ID: <20160926081559.2062-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also making it clearer as for what each plugin dependencies are.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

Here is a v2 with the following changes:
- Add a comment stating that --enable-foo option doesn't exist
- Add dependencies inside the plugin ifdef statement when possible
  - Kept linux/imx-gpu-viv/imx-codec outside since shared between
    several plugins

The Config.in ended up being the same since any select to a Freescale
package creates a "recursive dependency".

Regards,
Gary
---
 package/gstreamer1/gst1-imx/Config.in   | 89 ++++++++++++++++++++++++++++-----
 package/gstreamer1/gst1-imx/gst1-imx.mk | 58 ++++++++++++++++++---
 2 files changed, 126 insertions(+), 21 deletions(-)

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
index 3c6b1b6..e90de0f 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -26,20 +26,16 @@ GST1_IMX_DEPENDENCIES += linux
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
@@ -51,6 +47,52 @@ else
 GST1_IMX_CONF_OPTS += --egl-platform=fb
 endif
 endif
+else
+GST1_IMX_CONF_OPTS += --disable-eglvivsink
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_IMX_G2D),y)
+# There's no --enable-g2d option
+else
+GST1_IMX_CONF_OPTS += --disable-g2d
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_IMX_IPU),y)
+# There's no --enable-ipu option
+else
+GST1_IMX_CONF_OPTS += --disable-ipu
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_IMX_MP3ENCODER),y)
+# There's no --enable-mp3encoder option
+else
+GST1_IMX_CONF_OPTS += --disable-mp3encoder
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_IMX_PXP),y)
+# There's no --enable-pxp option
+else
+GST1_IMX_CONF_OPTS += --disable-pxp
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_IMX_UNIAUDIODEC),y)
+# There's no --enable-uniaudiodec option
+else
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
 
 define GST1_IMX_CONFIGURE_CMDS
-- 
2.9.3
