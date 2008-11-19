From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 19 Nov 2008 02:51:19 +0100
Subject: [Buildroot] [PATCH 4/7] package/multimedia: add gst-plugins-base
	package
In-Reply-To: <200811190244.44817.markus.heidelberg@web.de>
References: <200811190244.44817.markus.heidelberg@web.de>
Message-ID: <200811190251.20096.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A basic set of well-supported plug-ins for GStreamer.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-plugins-base/Config.in      |   81 ++++++++++++
 ...ins-base-0.10.21-build_fix_missing_gtkdoc.patch |   31 +++++
 .../gst-plugins-base/gst-plugins-base.mk           |  137 ++++++++++++++++++++
 4 files changed, 250 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gst-plugins-base/Config.in
 create mode 100644 package/multimedia/gst-plugins-base/gst-plugins-base-0.10.21-build_fix_missing_gtkdoc.patch
 create mode 100644 package/multimedia/gst-plugins-base/gst-plugins-base.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 36676e5..1d7abb1 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -4,6 +4,7 @@ source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/asterisk/Config.in"
 source "package/multimedia/aumix/Config.in"
 source "package/multimedia/gstreamer/Config.in"
+source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libogg/Config.in"
diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
new file mode 100644
index 0000000..5e267f2
--- /dev/null
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -0,0 +1,81 @@
+menuconfig BR2_PACKAGE_GST_PLUGINS_BASE
+	bool "gst-plugins-base"
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_LIBOIL
+	help
+	  A basic set of well-supported plug-ins for GStreamer.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GST_PLUGINS_BASE
+
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER
+	bool "adder"
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
+	bool "audioconvert (mandatory for audio playback)"
+	default y
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORATE
+	bool "audiorate"
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
+	bool "audioresample (mandatory for audio playback)"
+	default y
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC
+	bool "audiotestsrc"
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_FFMPEGCOLORSPACE
+	bool "ffmpegcolorspace (mandatory for video playback)"
+	default y
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_GDP
+	bool "gdp"
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PLAYBACK
+	bool "playback (mandatory)"
+	default y
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE
+	bool "subparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TCP
+	bool "tcp"
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TYPEFIND
+	bool "typefind (mandatory)"
+	default y
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC
+	bool "videotestsrc"
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEORATE
+	bool "videorate"
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOSCALE
+	bool "videoscale (mandatory for video playback)"
+	default y
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VOLUME
+	bool "volume (mandatory for audio playback)"
+	default y
+
+comment "plugins with external dependencies (there may be more available)"
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
+	bool "ogg (*.ogg audio/video)"
+	select BR2_PACKAGE_LIBOGG
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
+	bool "theora (*.ogg video)"
+	select BR2_PACKAGE_LIBTHEORA
+
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS
+	bool "vorbis (*.ogg audio)"
+	select BR2_PACKAGE_LIBVORBIS
+
+endif
+
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.21-build_fix_missing_gtkdoc.patch b/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.21-build_fix_missing_gtkdoc.patch
new file mode 100644
index 0000000..34bf061
--- /dev/null
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.21-build_fix_missing_gtkdoc.patch
@@ -0,0 +1,31 @@
+Submitted By: Ken Moffat <ken@linuxfromscratch dot org>
+Date: 2008-10-15
+Initial Package Version: 0.10.21
+Upstream Status: Not yet known, just raised as gnome bug 556444.
+Origin: Self
+Description: Allows 'make install' to succeed if gtkdoc-rebase is not present.
+
+diff -Naur gst-plugins-base-0.10.21.orig/common/gtk-doc.mak gst-plugins-base-0.10.21/common/gtk-doc.mak
+--- gst-plugins-base-0.10.21.orig/common/gtk-doc.mak	2008-09-10 10:13:25.000000000 +0100
++++ gst-plugins-base-0.10.21/common/gtk-doc.mak	2008-10-15 18:39:02.000000000 +0100
+@@ -201,7 +201,7 @@
+ 	           $(DESTDIR)$(TARGET_DIR)/$(DOC_MODULE)- at GST_MAJORMINOR@.devhelp2; \
+ 	  fi; \
+ 	  which gtkdoc-rebase >/dev/null && \
+-	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
++	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) || true ; \
+ 	fi) 
+ uninstall-local:
+ 	(installfiles=`echo ./html/*.html`; \
+diff -Naur gst-plugins-base-0.10.21.orig/docs/libs/Makefile.in gst-plugins-base-0.10.21/docs/libs/Makefile.in
+--- gst-plugins-base-0.10.21.orig/docs/libs/Makefile.in	2008-10-02 23:46:08.000000000 +0100
++++ gst-plugins-base-0.10.21/docs/libs/Makefile.in	2008-10-15 18:38:42.000000000 +0100
+@@ -822,7 +822,7 @@
+ 	           $(DESTDIR)$(TARGET_DIR)/$(DOC_MODULE)- at GST_MAJORMINOR@.devhelp2; \
+ 	  fi; \
+ 	  which gtkdoc-rebase >/dev/null && \
+-	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
++	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) || true ; \
+ 	fi) 
+ uninstall-local:
+ 	(installfiles=`echo ./html/*.html`; \
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
new file mode 100644
index 0000000..ac8f94b
--- /dev/null
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -0,0 +1,137 @@
+#############################################################
+#
+# gst-plugins-base
+#
+#############################################################
+GST_PLUGINS_BASE_VERSION = 0.10.21
+GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
+GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
+GST_PLUGINS_BASE_AUTORECONF = NO
+GST_PLUGINS_BASE_INSTALL_STAGING = YES
+GST_PLUGINS_BASE_INSTALL_TARGET = YES
+
+GST_PLUGINS_BASE_CONF_OPT = \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
+		--disable-examples \
+		--disable-x \
+		--disable-xvideo \
+		--disable-xshm \
+		--disable-oggtest \
+		--disable-vorbistest \
+		--disable-freetypetest
+
+GST_PLUGINS_BASE_DEPENDENCIES = uclibc gstreamer liboil
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-adder
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-adder
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOCONVERT),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-audioconvert
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-audioconvert
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORATE),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-audiorate
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-audiorate
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-audioresample
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-audioresample
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-audiotestsrc
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-audiotestsrc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_FFMPEGCOLORSPACE),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-ffmpegcolorspace
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-ffmpegcolorspace
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_GDP),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-gdp
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-gdp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PLAYBACK),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-playback
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-playback
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-subparse
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-subparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TCP),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-tcp
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-tcp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TYPEFIND),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-typefind
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-typefind
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-videotestsrc
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-videotestsrc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEORATE),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-videorate
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-videorate
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOSCALE),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-videoscale
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-videoscale
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VOLUME),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-volume
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-volume
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-ogg
+GST_PLUGINS_BASE_DEPENDENCIES += libogg
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-ogg
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-theora
+GST_PLUGINS_BASE_DEPENDENCIES += libtheora
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-theora
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-vorbis
+GST_PLUGINS_BASE_DEPENDENCIES += libvorbis
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-vorbis
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-base))
-- 
1.6.0.4.762.g0567f
