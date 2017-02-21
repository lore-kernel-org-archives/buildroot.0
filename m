From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Feb 2017 23:04:27 +0100
Subject: [Buildroot] [PATCH 1/2] libmediaart: new package
Message-ID: <1487714668-73512-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Library tasked with managing, extracting and handling media art caches

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/Config.in                    |  1 +
 package/libmediaart/Config.in        | 42 ++++++++++++++++++++++++++++++++++++
 package/libmediaart/libmediaart.hash |  2 ++
 package/libmediaart/libmediaart.mk   | 40 ++++++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 package/libmediaart/Config.in
 create mode 100644 package/libmediaart/libmediaart.hash
 create mode 100644 package/libmediaart/libmediaart.mk

diff --git a/package/Config.in b/package/Config.in
index 81bf3f4..57494e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1017,6 +1017,7 @@ menu "Graphics"
 	source "package/libglu/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
+	source "package/libmediaart/Config.in"
 	source "package/libmng/Config.in"
 	source "package/libpng/Config.in"
 	source "package/libqrencode/Config.in"
diff --git a/package/libmediaart/Config.in b/package/libmediaart/Config.in
new file mode 100644
index 0000000..ef0631d
--- /dev/null
+++ b/package/libmediaart/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_LIBMEDIAART
+	bool "libmediaart"
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Library tasked with managing, extracting and handling media
+	  art caches
+
+comment "libmediaart needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_LIBMEDIAART
+
+choice
+	prompt "media art backend"
+	default BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
+
+config BR2_PACKAGE_MEDIAART_BACKEND_NONE
+	bool "none"
+	help
+	  With no backend, libmediaart will not be able to process MP3
+	  album art.
+
+config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
+	bool "gdk-pixbuf"
+	select BR2_PACKAGE_GDK_PIXBUF
+
+config BR2_PACKAGE_MEDIAART_BACKEND_QT
+	bool "Qt"
+	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+
+comment "Qt backend depends on Qt or Qt5"
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+
+endchoice
+
+endif # BR2_PACKAGE_MEDIAART
diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
new file mode 100644
index 0000000..a4f6e32
--- /dev/null
+++ b/package/libmediaart/libmediaart.hash
@@ -0,0 +1,2 @@
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.0.sha256sum:
+sha256	94668adb29d4dc3115b0fd105942ebd5ca6f5f9dbb2afa8a191a73a747dd506f	libmediaart-1.9.0.tar.xz
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
new file mode 100644
index 0000000..06ab96a
--- /dev/null
+++ b/package/libmediaart/libmediaart.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# libmediaart
+#
+################################################################################
+
+LIBMEDIAART_VERSION_MAJOR = 1.9
+LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).0
+LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
+LIBMEDIAART_SITE = \
+	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
+LIBMEDIAART_LICENSE = LGPLv2+
+LIBMEDIAART_LICENSE_FILES = COPYING
+LIBMEDIAART_INSTALL_STAGING = YES
+LIBMEDIAART_DEPENDENCIES = libglib2
+LIBMEDIAART_CONF_OPTS = --disable-unit-tests
+
+ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF),y)
+LIBMEDIAART_DEPENDENCIES += gdk-pixbuf
+LIBMEDIAART_CONF_OPTS += \
+	--enable-gdkpixbuf \
+	--disable-qt
+else ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_QT),y)
+# qt5 needs c++11 (since qt-5.7)
+ifeq ($(BR2_QT5_VERSION_LATEST),y)
+LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+endif
+LIBMEDIAART_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_QT),qt) \
+	$(if $(BR2_PACKAGE_QT5),qt5base)
+LIBMEDIAART_CONF_OPTS += \
+	--disable-gdkpixbuf \
+	--enable-qt
+else ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_NONE),y)
+LIBMEDIAART_CONF_OPTS += \
+	--disable-gdkpixbuf \
+	--disable-qt
+endif
+
+$(eval $(autotools-package))
-- 
2.5.0
