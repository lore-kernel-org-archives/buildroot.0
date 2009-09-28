From: Emmanuel Riou <riou.emmanuel@googlemail.com>
Date: Mon, 28 Sep 2009 12:03:43 +0100
Subject: [Buildroot] [PATCH] Add Swfdec Free flash library
Message-ID: <1254135823-15969-1-git-send-email-riou.emmanuel@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Emmanuel Riou <riou.emmanuel@googlemail.com>
---
 package/multimedia/Config.in        |    1 +
 package/multimedia/swfdec/Config.in |   27 +++++++++++++++++++++++++++
 package/multimedia/swfdec/swfdec.mk |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/swfdec/Config.in
 create mode 100644 package/multimedia/swfdec/swfdec.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index c7160a6..49932d0 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -21,6 +21,7 @@ source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/speex/Config.in"
+source "package/multimedia/swfdec/Config.in"
 source "package/multimedia/festival/Config.in"
 source "package/multimedia/taglib/Config.in"
 source "package/multimedia/vlc/Config.in"
diff --git a/package/multimedia/swfdec/Config.in b/package/multimedia/swfdec/Config.in
new file mode 100644
index 0000000..9b1d03d
--- /dev/null
+++ b/package/multimedia/swfdec/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_SWFDEC
+	bool "swfdec"
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBOIL
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  Library to play Flash Files
+
+	  http://swfdec.freedesktop.org/
+
+config BR2_PACKAGE_SWFDEC_GTK_SUPPORT
+	bool "swfdec gtk"
+	depends on BR2_PACKAGE_SWFDEC
+	depends on BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_CAIRO_PNG
+	help
+	  Swfdec-gtk library is used for easy integration
+	  of swfdec in GTK applications
+
+config BR2_PACKAGE_SWFDEC_GSTREAMER
+	bool "swfdec gstreamer"
+	depends on BR2_PACKAGE_SWFDEC	
+	select BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	help
+	  Enables GStreamer support
+
diff --git a/package/multimedia/swfdec/swfdec.mk b/package/multimedia/swfdec/swfdec.mk
new file mode 100644
index 0000000..23ba7b7
--- /dev/null
+++ b/package/multimedia/swfdec/swfdec.mk
@@ -0,0 +1,32 @@
+#############################################################
+#
+# Swfdec
+#
+#############################################################
+SWFDEC_VERSION_MAJOR = 0.8
+SWFDEC_VERSION_MINOR = 4
+SWFDEC_VERSION = $(SWFDEC_VERSION_MAJOR).$(SWFDEC_VERSION_MINOR)
+SWFDEC_SOURCE = swfdec-$(SWFDEC_VERSION).tar.gz
+SWFDEC_SITE = http://swfdec.freedesktop.org/download/swfdec/$(SWFDEC_VERSION_MAJOR)
+
+SWFDEC_LIBTOOL_PATCH = NO
+SWFDEC_INSTALL_STAGING = YES
+SWFDEC_INSTALL_TARGET = YES
+
+SWFDEC_DEPENDENCIES = libsoup liboil alsa-lib ohost-pkgconfig
+
+ifeq ($(BR2_PACKAGE_SWFDEC_GSTREAMER),y)
+SWFDEC_DEPENDENCIES += gstreamer gst-plugins-base
+else
+SWFDEC_CONF_OPT += --disable-gstreamer
+endif
+
+ifeq ($(BR2_PACKAGE_SWFDEC_GTK_SUPPORT),y)
+SWFDEC_DEPENDENCIES += libgtk2
+else
+SWFDEC_CONF_OPT += --disable-gtk
+endif
+
+
+
+$(eval $(call AUTOTARGETS,package/multimedia,swfdec))
-- 
1.6.0.4
