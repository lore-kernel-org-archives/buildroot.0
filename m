From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Oct 2011 11:38:30 -0300
Subject: [Buildroot] [PATCH 4/6] swfdec: remove deprecated
In-Reply-To: <1318343912-5480-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318343912-5480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318343912-5480-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/Config.in        |    1 -
 package/multimedia/swfdec/Config.in |   36 ----------------------------------
 package/multimedia/swfdec/swfdec.mk |   37 -----------------------------------
 3 files changed, 0 insertions(+), 74 deletions(-)
 delete mode 100644 package/multimedia/swfdec/Config.in
 delete mode 100644 package/multimedia/swfdec/swfdec.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 7b63c14..d29754a 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -41,7 +41,6 @@ source "package/multimedia/musepack/Config.in"
 source "package/multimedia/portaudio/Config.in"
 source "package/multimedia/python-mad/Config.in"
 source "package/multimedia/speex/Config.in"
-source "package/multimedia/swfdec/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/taglib/Config.in"
 source "package/multimedia/tremor/Config.in"
diff --git a/package/multimedia/swfdec/Config.in b/package/multimedia/swfdec/Config.in
deleted file mode 100644
index 46119fc..0000000
--- a/package/multimedia/swfdec/Config.in
+++ /dev/null
@@ -1,36 +0,0 @@
-config BR2_PACKAGE_SWFDEC
-	bool "swfdec"
-	depends on BR2_DEPRECATED
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
-	select BR2_PACKAGE_LIBOIL
-	select BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_PANGO
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_CAIRO_PNG
-	help
-	  Library to play Flash files
-
-	  http://swfdec.freedesktop.org/
-
-config BR2_PACKAGE_SWFDEC_GTK_SUPPORT
-	bool "gtk support"
-	depends on BR2_PACKAGE_SWFDEC
-	depends on BR2_PACKAGE_LIBGTK2
-	select BR2_PACKAGE_LIBSOUP
-	default y
-	help
-	  Swfdec-gtk library is used for easy integration
-	  of swfdec in GTK applications
-
-config BR2_PACKAGE_SWFDEC_GSTREAMER
-	bool "gstreamer support"
-	depends on BR2_PACKAGE_SWFDEC
-	depends on BR2_PACKAGE_GSTREAMER
-	select BR2_PACKAGE_GST_PLUGINS_BASE
-	default y
-	help
-	  Enables GStreamer support
-
-comment "swfdec requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/multimedia/swfdec/swfdec.mk b/package/multimedia/swfdec/swfdec.mk
deleted file mode 100644
index f88d7db..0000000
--- a/package/multimedia/swfdec/swfdec.mk
+++ /dev/null
@@ -1,37 +0,0 @@
-#############################################################
-#
-# Swfdec
-#
-#############################################################
-SWFDEC_VERSION_MAJOR = 0.8
-SWFDEC_VERSION_MINOR = 4
-SWFDEC_VERSION = $(SWFDEC_VERSION_MAJOR).$(SWFDEC_VERSION_MINOR)
-SWFDEC_SOURCE = swfdec-$(SWFDEC_VERSION).tar.gz
-SWFDEC_SITE = http://swfdec.freedesktop.org/download/swfdec/$(SWFDEC_VERSION_MAJOR)
-SWFDEC_MAKE_OPT = \
-	GLIB_MKENUMS=$(HOST_DIR)/usr/bin/glib-mkenums \
-	GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal
-
-SWFDEC_INSTALL_STAGING = YES
-SWFDEC_INSTALL_TARGET = YES
-
-SWFDEC_DEPENDENCIES = liboil alsa-lib pango cairo host-pkg-config
-
-ifeq ($(BR2_PACKAGE_SWFDEC_GSTREAMER),y)
-SWFDEC_DEPENDENCIES += gstreamer gst-plugins-base
-else
-SWFDEC_CONF_OPT += --disable-gstreamer
-endif
-
-ifeq ($(BR2_PACKAGE_SWFDEC_GTK_SUPPORT),y)
-SWFDEC_DEPENDENCIES += libgtk2 libsoup
-else
-SWFDEC_CONF_OPT += --disable-gtk
-endif
-
-$(eval $(call AUTOTARGETS))
-
-# swfdec uses glib-* at install time
-# Notice: must come after AUTOTARGETS as that's where these variables gets set
-SWFDEC_INSTALL_TARGET_OPT += $(SWFDEC_MAKE_OPT)
-SWFDEC_INSTALL_STAGING_OPT += $(SWFDEC_MAKE_OPT)
-- 
1.7.3.4
