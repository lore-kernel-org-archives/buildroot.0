From: Emmanuel Riou <riou.emmanuel@googlemail.com>
Date: Tue, 29 Sep 2009 11:45:50 +0200
Subject: [Buildroot] [git commit master] Add Swfdec Free flash library
Message-ID: <20090929094613.D9BD077778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=19dde3a7aa987f4522caa235152c77bf10e90b9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Peter: fixed kconfig (missing/wrong dependencies, text, trailing spaces)
and makefile typo (ohost-pkgconfig).

Signed-off-by: Emmanuel Riou <riou.emmanuel@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in        |    1 +
 package/multimedia/swfdec/Config.in |   29 +++++++++++++++++++++++++++++
 package/multimedia/swfdec/swfdec.mk |   30 ++++++++++++++++++++++++++++++
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
index 0000000..7a51e2e
--- /dev/null
+++ b/package/multimedia/swfdec/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_SWFDEC
+	bool "swfdec"
+	select BR2_PACKAGE_LIBOIL
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	help
+	  Library to play Flash files
+
+	  http://swfdec.freedesktop.org/
+
+config BR2_PACKAGE_SWFDEC_GTK_SUPPORT
+	bool "gtk support"
+	depends on BR2_PACKAGE_SWFDEC
+	depends on BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBSOUP
+	help
+	  Swfdec-gtk library is used for easy integration
+	  of swfdec in GTK applications
+
+config BR2_PACKAGE_SWFDEC_GSTREAMER
+	bool "gstreamer support"
+	depends on BR2_PACKAGE_SWFDEC
+	select BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	help
+	  Enables GStreamer support
+
diff --git a/package/multimedia/swfdec/swfdec.mk b/package/multimedia/swfdec/swfdec.mk
new file mode 100644
index 0000000..015d32e
--- /dev/null
+++ b/package/multimedia/swfdec/swfdec.mk
@@ -0,0 +1,30 @@
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
+SWFDEC_DEPENDENCIES = liboil alsa-lib pango cairo host-pkgconfig
+
+ifeq ($(BR2_PACKAGE_SWFDEC_GSTREAMER),y)
+SWFDEC_DEPENDENCIES += gstreamer gst-plugins-base
+else
+SWFDEC_CONF_OPT += --disable-gstreamer
+endif
+
+ifeq ($(BR2_PACKAGE_SWFDEC_GTK_SUPPORT),y)
+SWFDEC_DEPENDENCIES += libgtk2 libsoup
+else
+SWFDEC_CONF_OPT += --disable-gtk
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,swfdec))
-- 
1.6.3.3
