From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 17 Jan 2014 22:35:44 -0500
Subject: [Buildroot] [PATCH 1/1] gst-ffmpeg: add option for LGPL build
Message-ID: <1390016145-1865-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add option to build a LGPL licensed gst-ffmpeg.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/gstreamer/gst-ffmpeg/Config.in     |   13 ++++++++++++-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk |   11 ++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index d879f5e..220f4d7 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_GST_FFMPEG
+menuconfig BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	depends on BR2_LARGEFILE
@@ -8,5 +8,16 @@ config BR2_PACKAGE_GST_FFMPEG
 
 	  http://gstreamer.freedesktop.org/
 
+if BR2_PACKAGE_GST_FFMPEG
+
+config BR2_PACKAGE_GST_FFMPEG_LGPL_BUILD
+	bool "Build a LGPL licensed gst-ffmpeg"
+	help
+	  This removes --enable-gpl and --enable-postproc from the
+	  ffmpeg configure line, and disables building the postproc
+	  gstreamer plugin.
+
+endif
+
 comment "gst-ffmpeg needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 6534f93..48a586f 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -14,6 +14,15 @@ GST_FFMPEG_CONF_EXTRA_OPT = \
 		--cross-prefix=$(TARGET_CROSS) \
 		--target-os=linux
 
+ifeq ($(BR2_PACKAGE_GST_FFMPEG_LGPL_BUILD),y)
+GST_FFMPEG_CONF_OPT += --enable-lgpl
+GST_FFMPEG_LICENSE = LGPL2+ (gst-ffmpeg), LGPLv2.1+/LGPL3+ (libav)
+GST_FFMPEG_LICENSE_FILES = COPYING.LIB gst-libs/ext/libav/COPYING.LGPLv2.1 gst-libs/ext/libav/COPYING.LGPLv3
+else
+GST_FFMPEG_LICENSE = GPLv2+ (gst-ffmpeg), GPLv2+/GPL3+ (libav)
+GST_FFMPEG_LICENSE_FILES = COPYING gst-libs/ext/libav/COPYING.GPLv2 gst-libs/ext/libav/COPYING.GPLv3
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GST_FFMPEG_CONF_EXTRA_OPT += --enable-zlib
 GST_FFMPEG_DEPENDENCIES += zlib
@@ -76,6 +85,6 @@ ifeq ($(BR2_PREFER_STATIC_LIB),)
 GST_FFMPEG_CONF_EXTRA_OPT += --enable-pic
 endif
 
-GST_FFMPEG_CONF_OPT = --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPT)"
+GST_FFMPEG_CONF_OPT += --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPT)"
 
 $(eval $(autotools-package))
-- 
1.7.9.5
