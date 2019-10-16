From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Oct 2019 18:55:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/gst1-plugins-good: fix xlib
 dependencies
Message-ID: <20191016165512.2283-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xlib_libXfixes and xlib_libXdamage must be added to dependencies

Fixes:
 - http://autobuild.buildroot.org/results/efc1052807f94b1013cc8c13bdd790a01ed7255d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../gst1-plugins-good/gst1-plugins-good.mk          | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index a8dae1b7bb..e11f9c213e 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -366,10 +366,15 @@ endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 GST1_PLUGINS_GOOD_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
-GST1_PLUGINS_GOOD_CONF_OPTS += \
-	-Dximagesrc=enabled \
-	$(if $(BR2_PACKAGE_XLIB_LIBXFIXES),-Dximagesrc-xfixes=enabled) \
-	$(if $(BR2_PACKAGE_XLIB_LIBXDAMAGE),-Dximagesrc-xdamage=enabled)
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dximagesrc=enabled
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+GST1_PLUGINS_GOOD_DEPENDENCIES += xlib_libXfixes
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dximagesrc-xfixes=enabled
+endif
+ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
+GST1_PLUGINS_GOOD_DEPENDENCIES += xlib_libXdamage
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dximagesrc-xdamage=enabled
+endif
 else
 GST1_PLUGINS_GOOD_CONF_OPTS += \
 	-Dximagesrc=disabled \
-- 
2.23.0
