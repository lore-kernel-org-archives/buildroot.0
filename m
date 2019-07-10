From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 10 Jul 2019 18:26:54 -0400
Subject: [Buildroot] [PATCH v3 3/4] package/gstreamer1/gst1-plugins-ugly:
 convert package type to meson
In-Reply-To: <20190710222655.31023-1-aduskett@gmail.com>
References: <20190710222655.31023-1-aduskett@gmail.com>
Message-ID: <20190710222655.31023-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Remove --disable-twolame as this plugin is now in gst1-plugins-good.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v3:
  - revert the flipped order of tests and examples. (Peter)

  - Add missing gobject-cast-checks, glib-asserts, and glib-checks in
    gst1-plugins-bad.mk (Peter)

  - Add a line in the commit message explaining the removal of disable-twolame.

 .../gst1-plugins-ugly/gst1-plugins-ugly.mk    | 55 ++++++++++---------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index f3ac2f79d3..e428444400 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -11,79 +11,82 @@ GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
 # GPL licensed plugins will append to GST1_PLUGINS_UGLY_LICENSE if enabled.
 GST1_PLUGINS_UGLY_LICENSE = LGPL-2.1+
 
-GST1_PLUGINS_UGLY_CONF_OPTS = --disable-examples --disable-valgrind
+GST1_PLUGINS_UGLY_CONF_OPTS += \
+	-Dexamples=disabled \
+	-Dtests=disabled
 
 GST1_PLUGINS_UGLY_CONF_OPTS += \
-	--disable-a52dec \
-	--disable-amrnb \
-	--disable-amrwb \
-	--disable-cdio \
-	--disable-sidplay \
-	--disable-twolame
+	-Da52dec=disabled \
+	-Damrnb=disabled \
+	-Damrwbdec=disabled \
+	-Dcdio=disabled \
+	-Dsidplay=disabled
 
 GST1_PLUGINS_UGLY_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
 ifeq ($(BR2_PACKAGE_ORC),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-orc
+GST1_PLUGINS_UGLY_CONF_OPTS += -Dorc=enabled
 GST1_PLUGINS_UGLY_DEPENDENCIES += orc
+else
+GST1_PLUGINS_UGLY_CONF_OPTS += -Dorc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_ASFDEMUX),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-asfdemux
+GST1_PLUGINS_UGLY_CONF_OPTS += -Dasfdemux=enabled
 else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-asfdemux
+GST1_PLUGINS_UGLY_CONF_OPTS += -Dasfdemux=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdlpcmdec
+GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdlpcmdec=enabled
 else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdlpcmdec
+GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdlpcmdec=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDSUB),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdsub
+GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdsub=enabled
 else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdsub
+GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdsub=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-xingmux
+GST1_PLUGINS_UGLY_CONF_OPTS += -Dxingmux=enabled
 else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-xingmux
+GST1_PLUGINS_UGLY_CONF_OPTS += -Dxingmux=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-realmedia
+GST1_PLUGINS_UGLY_CONF_OPTS += -Drealmedia=enabled
 else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-realmedia
+GST1_PLUGINS_UGLY_CONF_OPTS += -Drealmedia=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD),y)
 # configure does not use pkg-config to detect libdvdread
 ifeq ($(BR2_PACKAGE_LIBDVDCSS)$(BR2_STATIC_LIBS),yy)
-GST1_PLUGINS_UGLY_CONF_ENV += LIBS="-ldvdcss"
+GST1_PLUGINS_UGLY_LDFLAGS += "-ldvdcss"
 endif
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdread
+GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdread=enabled
 GST1_PLUGINS_UGLY_DEPENDENCIES += libdvdread
 GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdread
+GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdread=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpeg2dec
+GST1_PLUGINS_UGLY_CONF_OPTS += -Dmpeg2dec=enabled
 GST1_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
 GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mpeg2dec
+GST1_PLUGINS_UGLY_CONF_OPTS += -Dmpeg2dec=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_X264),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-x264
+GST1_PLUGINS_UGLY_CONF_OPTS += -Dx264=enabled
 GST1_PLUGINS_UGLY_DEPENDENCIES += x264
 GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-x264
+GST1_PLUGINS_UGLY_CONF_OPTS += -Dx264=disabled
 endif
 
 # Add GPL license if GPL plugins enabled.
@@ -94,4 +97,4 @@ endif
 # Use the following command to extract license info for plugins.
 # # find . -name 'plugin-*.xml' | xargs grep license
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.21.0
