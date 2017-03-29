From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 23:46:32 +0200
Subject: [Buildroot] [git commit] libmediaart: new package
Message-ID: <20170329214937.1527A82207@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c443830a571076a019b008db6524979456c7c59a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Library tasked with managing, extracting and handling media art caches

https://github.com/GNOME/libmediaart

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: add entry to DEVELOPERS file, fix license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libmediaart/Config.in        | 44 ++++++++++++++++++++++++++++++++++++
 package/libmediaart/libmediaart.hash |  2 ++
 package/libmediaart/libmediaart.mk   | 40 ++++++++++++++++++++++++++++++++
 5 files changed, 88 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5293de0..ffd233e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -507,6 +507,7 @@ F:	package/netsurf-buildsystem/
 
 N:	Fabrice Fontaine <fabrice.fontaine@orange.com>
 F:	package/domoticz/
+F:	package/libmediaart/
 F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 1d9d2ac..12fb1a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1036,6 +1036,7 @@ menu "Graphics"
 	source "package/libglu/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
+	source "package/libmediaart/Config.in"
 	source "package/libmng/Config.in"
 	source "package/libpng/Config.in"
 	source "package/libqrencode/Config.in"
diff --git a/package/libmediaart/Config.in b/package/libmediaart/Config.in
new file mode 100644
index 0000000..e5e770d
--- /dev/null
+++ b/package/libmediaart/Config.in
@@ -0,0 +1,44 @@
+comment "libmediaart needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
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
+	  https://github.com/GNOME/libmediaart
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
index 0000000..46e4035
--- /dev/null
+++ b/package/libmediaart/libmediaart.hash
@@ -0,0 +1,2 @@
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.1.sha256sum:
+sha256	5b14aa4e0cc84eaec57b6cb28f39092d503fdaecf36d5d165fac37583b7fe949	libmediaart-1.9.1.tar.xz
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
new file mode 100644
index 0000000..31f5675
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
+LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).1
+LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
+LIBMEDIAART_SITE = \
+	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
+LIBMEDIAART_LICENSE = LGPLv2.1+
+LIBMEDIAART_LICENSE_FILES = COPYING.LESSER
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
