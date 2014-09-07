From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Sep 2014 23:03:58 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: bump version
Message-ID: <20140909205923.ADD509D64D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfa666265df38c50f79fb3a4f8bb177a21fb8faf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And cleanup X11 handling while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in     |    3 +++
 .../gst1-plugins-good/gst1-plugins-good.mk         |    8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 22980dc..73c633f 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -1,6 +1,9 @@
 menuconfig BR2_PACKAGE_GST1_PLUGINS_GOOD
 	bool "gst1-plugins-good"
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXV if BR2_PACKAGE_XORG7
 	help
 	  A set of well-supported plug-ins for GStreamer under the preferred
 	  license.
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 2cf8ca8..23d3876 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.2.4
+GST1_PLUGINS_GOOD_VERSION = 1.4.1
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
@@ -322,12 +322,12 @@ GST1_PLUGINS_GOOD_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
 GST1_PLUGINS_GOOD_CONF_OPT += \
 	--enable-x \
 	--enable-xshm \
-	--enable-xvideo
+	$(if $(BR2_PACKAGE_XLIB_LIBXFIXES),xlib_libXfixes) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)
 else
 GST1_PLUGINS_GOOD_CONF_OPT += \
 	--disable-x \
-	--disable-xshm \
-	--disable-xvideo
+	--disable-xshm
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO),y)
