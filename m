From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 26 Jan 2021 13:42:11 -0600
Subject: [Buildroot] [RFC 1/2] appstream-glib: new package
Message-ID: <20210126194212.20688-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christian Stewart <christian@paral.in>

AppStream-GLib is a library providing serialization and deserialization support
for the AppStream metadata format.

This is a dependency of Flatpak.

DO NOT MERGE, this patch is being provided as an example that was used
for some prototyping that wasn't completed.


Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in                             |  1 +
 ...necessary-gtk-dependency-for-builder.patch | 30 +++++++++++++++++
 package/appstream-glib/Config.in              | 22 +++++++++++++
 package/appstream-glib/appstream-glib.mk      | 32 +++++++++++++++++++
 package/appstream-glib/json-glib.hash         |  5 +++
 5 files changed, 90 insertions(+)
 create mode 100644 package/appstream-glib/0001-build-Remove-unnecessary-gtk-dependency-for-builder.patch
 create mode 100644 package/appstream-glib/Config.in
 create mode 100644 package/appstream-glib/appstream-glib.mk
 create mode 100644 package/appstream-glib/json-glib.hash

diff --git a/package/Config.in b/package/Config.in
index 12bd0608e3..735c080989 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1840,6 +1840,7 @@ menu "Networking"
 endmenu
 
 menu "Other"
+	source "package/appstream-glib/Config.in"
 	source "package/apr/Config.in"
 	source "package/apr-util/Config.in"
 	source "package/argp-standalone/Config.in"
diff --git a/package/appstream-glib/0001-build-Remove-unnecessary-gtk-dependency-for-builder.patch b/package/appstream-glib/0001-build-Remove-unnecessary-gtk-dependency-for-builder.patch
new file mode 100644
index 0000000000..38cce9342e
--- /dev/null
+++ b/package/appstream-glib/0001-build-Remove-unnecessary-gtk-dependency-for-builder.patch
@@ -0,0 +1,30 @@
+From c2ea2b38da6fd4f2dbfb1a26980edd3e3faf5876 Mon Sep 17 00:00:00 2001
+From: Mart Raudsepp <leio@gentoo.org>
+Date: Wed, 5 Dec 2018 18:06:53 +0200
+Subject: [PATCH] build: Remove unnecessary gtk dependency for builder
+
+Builder checks for gtk+, but the result isn't used anywhere, thus
+introducing an unnecessary gtk+ dependency.
+-Dbuilder=true -Dfonts=true would still depend on gdk, but a
+-Dbuilder=true -Dfonts=false build doesn't anymore.
+
+Closes: #274
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a26b88a..a8649d5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -60,7 +60,6 @@ gdkpixbuf = dependency('gdk-pixbuf-2.0', version : '>= 2.31.5')
+ 
+ # builder (default enabled)
+ if get_option('builder')
+-  gtk = dependency('gtk+-3.0')
+   gmodule = dependency('gmodule-2.0')
+   if get_option('rpm')
+     rpm = dependency('rpm')
+-- 
+2.18.1
+
diff --git a/package/appstream-glib/Config.in b/package/appstream-glib/Config.in
new file mode 100644
index 0000000000..3a148cdc5b
--- /dev/null
+++ b/package/appstream-glib/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_APPSTREAM_GLIB
+	bool "appstream-glib"
+	depends on !BR2_STATIC_LIBS # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBYAML
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE # gdk-pixbuf
+	help
+	  AppStream-GLib is a library providing serialization and
+	  deserialization support for the AppStream metadata format.
+
+	  https://github.com/hughsie/appstream-glib
+
+comment "appstream-glib needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/appstream-glib/appstream-glib.mk b/package/appstream-glib/appstream-glib.mk
new file mode 100644
index 0000000000..536a375ef5
--- /dev/null
+++ b/package/appstream-glib/appstream-glib.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# appstream-glib
+#
+################################################################################
+
+APPSTREAM_GLIB_VERSION = appstream_glib_0_7_14
+APPSTREAM_GLIB_SITE = $(call github,hughsie,appstream-glib,$(APPSTREAM_GLIB_VERSION))
+APPSTREAM_GLIB_LICENSE = LGPL-2.0+
+APPSTREAM_GLIB_LICENSE_FILES = COPYING
+APPSTREAM_GLIB_INSTALL_STAGING = YES
+
+# RPM has a cross-dependency failure
+APPSTREAM_GLIB_CONF_OPTS = \
+	-Dintrospection=false \
+	-Drpm=false \
+	-Dstemmer=false \
+	-Dfonts=false
+APPSTREAM_GLIB_DEPENDENCIES = \
+	$(TARGET_NLS_DEPENDENCIES) \
+	host-gperf \
+	host-libglib2 \
+	host-pkgconf \
+	gdk-pixbuf \
+	json-glib \
+  libarchive \
+	libglib2 \
+	libsoup \
+	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
+	libyaml
+
+$(eval $(meson-package))
diff --git a/package/appstream-glib/json-glib.hash b/package/appstream-glib/json-glib.hash
new file mode 100644
index 0000000000..fae4df36d4
--- /dev/null
+++ b/package/appstream-glib/json-glib.hash
@@ -0,0 +1,5 @@
+# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.4/json-glib-1.4.2.sha256sum
+sha256 2d7709a44749c7318599a6829322e081915bdc73f5be5045882ed120bb686dc8  json-glib-1.4.2.tar.xz
+
+# Hash for license file:
+sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
-- 
2.17.1
