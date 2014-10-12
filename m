From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 12 Oct 2014 15:30:04 -0400
Subject: [Buildroot] [PATCH v3 1/3] gst-ffmpeg: add option to select GPL vs
	LGPL build
Message-ID: <1413142206-30581-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

v2 -> v3:
 - Change enable-LGPL option to an enable-GPL, like the ffmpeg
   option, per recommendation from Luca Ceresoli.

v1 -> v2:
 - Move GST_FFMPEG_CONF_OPT adjustment (introduced by this patch)
   higher in the file, so that GST_FFMPEG_CONF_EXTRA_OPT lines
   don't get split.
---
 package/gstreamer/gst-ffmpeg/Config.in     | 12 +++++++++++-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 12 +++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index d879f5e..00c3471 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_GST_FFMPEG
+menuconfig BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	depends on BR2_LARGEFILE
@@ -8,5 +8,15 @@ config BR2_PACKAGE_GST_FFMPEG
 
 	  http://gstreamer.freedesktop.org/
 
+if BR2_PACKAGE_GST_FFMPEG
+
+config BR2_PACKAGE_GST_FFMPEG_GPL
+	bool "Enable GPL code"
+	help
+	  Allow use of GPL code.  The resulting libs and binaries will
+	  be under GPL.
+
+endif
+
 comment "gst-ffmpeg needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index b94fb0f..af3e880 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -10,6 +10,16 @@ GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
 GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base
 
+ifeq ($(BR2_PACKAGE_GST_FFMPEG_GPL),y)
+GST_FFMPEG_CONF_OPTS += --disable-lgpl
+GST_FFMPEG_LICENSE = GPLv2+ (gst-ffmpeg), GPLv2+/GPL3+ (libav)
+GST_FFMPEG_LICENSE_FILES = COPYING gst-libs/ext/libav/COPYING.GPLv2 gst-libs/ext/libav/COPYING.GPLv3
+else
+GST_FFMPEG_CONF_OPTS += --enable-lgpl
+GST_FFMPEG_LICENSE = LGPL2+ (gst-ffmpeg), LGPLv2.1+/LGPL3+ (libav)
+GST_FFMPEG_LICENSE_FILES = COPYING.LIB gst-libs/ext/libav/COPYING.LGPLv2.1 gst-libs/ext/libav/COPYING.LGPLv3
+endif
+
 GST_FFMPEG_CONF_EXTRA_OPTS = \
 		--cross-prefix=$(TARGET_CROSS) \
 		--target-os=linux
@@ -73,6 +83,6 @@ ifeq ($(BR2_PREFER_STATIC_LIB),)
 GST_FFMPEG_CONF_EXTRA_OPTS += --enable-pic
 endif
 
-GST_FFMPEG_CONF_OPTS = --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPTS)"
+GST_FFMPEG_CONF_OPTS += --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPTS)"
 
 $(eval $(autotools-package))
-- 
1.9.1
