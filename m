From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  1 Feb 2017 08:18:53 -0500
Subject: [Buildroot] [PATCH 1/2] gst1-vaapi: new package.
Message-ID: <20170201131854.3046-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gstreamer-vaapi consists in a collection of VA-API based plugins for
GStreamer and helper libraries.  These libraries are used for hardware
decoding and encoding of several video formats.

decoding formats:
JPEG, MPEG-2, MPEG-4:2, H.264 AVC, H.264 MVC, VP8, VC-1, WMV3, and HEVC.

encoding formats:
MPEG-2, H.264 AVC, H.264 MVC, JPEG, VP8, HEVC

The package won't compile without at least one renderer enabled, so I
chose to enable DRM by default, as X11, GLX, and wayland are heavy
handed with the dependencies.  As such, I have disabled every option
defaulting to yes except for DRM for the first patch.

Also, these codecs are only for x86 and require a Intel CPU (See Hardware
Requirements on line 82 of the README file.)

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gstreamer1/Config.in                  |  1 +
 package/gstreamer1/gst1-vaapi/Config.in       | 39 +++++++++++++++++++++++++++
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  2 ++
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 28 +++++++++++++++++++
 4 files changed, 70 insertions(+)
 create mode 100644 package/gstreamer1/gst1-vaapi/Config.in
 create mode 100644 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
 create mode 100644 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 23862bd..aef75b5 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -10,5 +10,6 @@ source "package/gstreamer1/gst1-imx/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
+source "package/gstreamer1/gst1-vaapi/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
 endif
diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
new file mode 100644
index 0000000..44461e3
--- /dev/null
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_GST1_VAAPI
+	bool "gst1-vaapi"
+	select BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers
+	depends on BR2_i386 || BR2_x86_64 # Only relevant for x86
+	depends on !BR2_STATIC_LIBS
+	help
+	  gstreamer-vaapi consists in a collection of VA-API based plugins for
+	  GStreamer and helper libraries.
+
+  	  vaapi<CODEC>dec is used to decode JPEG, MPEG-2, MPEG-4:2, H.264
+  	  AVC, H.264 MVC, VP8, VC-1, WMV3, HEVC videos to VA surfaces,
+  	  depending on the actual value of <CODEC> and the underlying
+  	  hardware capabilities.  This plugin is also able to implicitly
+  	  download the decoded surface to raw YUV buffers.
+  	  
+  	  vaapi<CODEC>enc is used to encode into MPEG-2, H.264 AVC, H.264
+  	  MVC, JPEG, VP8, HEVC videos, depending on the actual value of
+  	  <CODEC> (mpeg2, h264, etc.) and the hardware capabilities. By
+  	  default, raw format bitstreams are generated, so the result may be
+  	  piped to a muxer, e.g. qtmux for MP4 containers.
+  	  
+  	  vaapipostproc is used to filter VA surfaces, for e.g. scaling,
+  	  deinterlacing (bob, motion-adaptive, motion-compensated), noise
+  	  reduction or sharpening. This plugin is also used to upload raw
+  	  YUV pixels into VA surfaces.
+  	  
+  	  vaapisink is used to render VA surfaces to an X11 or Wayland
+  	  display. This plugin also features a "headless" mode (DRM) more
+  	  suited to remote transcode scenarios, with faster throughput.
+  	  
+	  https://cgit.freedesktop.org/gstreamer/gstreamer-vaapi
+
+comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+	!BR2_PACKAGE_HAS_UDEV
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
new file mode 100644
index 0000000..f3c6252
--- /dev/null
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -0,0 +1,2 @@
+# from https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.10.3.tar.xz.sha256sum
+sha256 cea827066a152a6afa1d0c43544dfbda285238156d4c3b77f9d4037bbe79361e  gstreamer-vaapi-1.10.3.tar.xz
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
new file mode 100644
index 0000000..470d95f
--- /dev/null
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# gst1-vaapi
+#
+################################################################################
+
+GST1_VAAPI_VERSION = 1.10.3
+GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
+GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
+GST1_VAAPI_LICENSE = LGPLv2.1+
+GST1_VAAPI_LICENSE_FILES = COPYING.LIB
+
+GST1_VAAPI_DEPENDENCIES += \
+	gstreamer1 \
+	gst1-plugins-base \
+	gst1-plugins-bad \
+	libva \
+	libdrm
+	
+GST1_VAAPI_CONF_OPTS += \
+	--disable-encoders \
+	--disable-x11 \
+	--disable-glx \
+	--disable-wayland \
+	--disable-egl \
+	--disable-gtk-doc-html
+
+$(eval $(autotools-package))
-- 
2.9.3
