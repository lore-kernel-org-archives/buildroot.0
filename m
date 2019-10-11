From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:37:34 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-ugly:
 convert package type to meson
Message-ID: <20191011224157.2B76C8D4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=908eebd363ab1a0867007610ca5e945e81db7e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Remove --disable-twolame as this plugin is now in gst1-plugins-good.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         | 57 ++++++++++++----------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index be40a86793..b4b6de0685 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -11,79 +11,84 @@ GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
 # GPL licensed plugins will append to GST1_PLUGINS_UGLY_LICENSE if enabled.
 GST1_PLUGINS_UGLY_LICENSE = LGPL-2.1+
 
-GST1_PLUGINS_UGLY_CONF_OPTS = --disable-examples --disable-valgrind
+GST1_PLUGINS_UGLY_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_UGLY_CONF_OPTS += \
-	--disable-a52dec \
-	--disable-amrnb \
-	--disable-amrwb \
-	--disable-cdio \
-	--disable-sidplay \
-	--disable-twolame
+	-Dexamples=disabled \
+	-Dtests=disabled
+
+GST1_PLUGINS_UGLY_CONF_OPTS += \
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
@@ -94,4 +99,4 @@ endif
 # Use the following command to extract license info for plugins.
 # # find . -name 'plugin-*.xml' | xargs grep license
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
