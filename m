From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 15:50:47 +0200
Subject: [Buildroot] [git commit] package/librsvg: bump to version 2.48.8
Message-ID: <20200913134546.C037882B49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df20e4546384d1c249a6a0541183590671e83d77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add a dependency to host-rustc
- libcroco is not a dependency since
  https://gitlab.gnome.org/GNOME/librsvg/-/commit/03ce9bd7875ef2a91979bc4f7d6fa5188cfd785c
- gtk3 is not a dependency since
  https://gitlab.gnome.org/GNOME/librsvg/-/commit/522aeee0ca9b4ff3940bea2d13ebb77ec6c064a6
- cairo script is mandatory since switch to rust

This bump is needed to remove libcroco which has been archived and won't
get any security updates anymore:
https://gitlab.gnome.org/Archive/libcroco/-/issues/8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/efl/Config.in                              |  2 ++
 package/enlightenment/Config.in                    |  2 ++
 package/gstreamer1/gst1-plugins-bad/Config.in      |  2 ++
 package/imagemagick/Config.in.host                 |  1 +
 package/libgtk3/Config.in                          |  2 ++
 ...vg.pc.in-add-libcroco-to-Requires.Private.patch | 35 ----------------------
 package/librsvg/Config.in                          |  5 +++-
 package/librsvg/librsvg.hash                       |  5 ++--
 package/librsvg/librsvg.mk                         | 13 ++++----
 package/midori/Config.in                           |  2 ++
 package/vte/Config.in                              |  3 ++
 11 files changed, 28 insertions(+), 44 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 031bff7ad6..c1b19770bb 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -267,6 +267,7 @@ config BR2_PACKAGE_EFL_LIBRAW
 
 config BR2_PACKAGE_EFL_SVG
 	bool "SVG loader"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
@@ -275,6 +276,7 @@ config BR2_PACKAGE_EFL_SVG
 	  This option enables the Evas generic SVG loader
 
 comment "SVG loader needs a toolchain w/ gcc >= 4.8"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 1630416718..91cdd896f6 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ENLIGHTENMENT
 	bool "enlightenment"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # efl svg -> librsvg
 	# libevas-generic-loaders-svg -> librsvg -> glib2 / pango
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -29,6 +30,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	  http://www.enlightenment.org/
 
 comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 4.8"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_EFL && BR2_PACKAGE_XORG7 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 5a066cb179..d387709de2 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -531,6 +531,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # librsvg -> pango -> harfbuzz
@@ -539,6 +540,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	  RSVG plugin library
 
 comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.8"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index bbe23baa6f..e12d82939a 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_IMAGEMAGICK
 	bool "host imagemagick"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
 	help
 	  ImageMagick(R) is a software suite to create, edit, and
 	  compose bitmap images. It can read, convert and write images
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 6b8f5abff6..8a59fc31e7 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,4 +1,5 @@
 comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
@@ -13,6 +14,7 @@ comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
 
 config BR2_PACKAGE_LIBGTK3
 	bool "libgtk3"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-libgtk3 -> host-librsvg
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
diff --git a/package/librsvg/0001-librsvg.pc.in-add-libcroco-to-Requires.Private.patch b/package/librsvg/0001-librsvg.pc.in-add-libcroco-to-Requires.Private.patch
deleted file mode 100644
index 0eea5b995b..0000000000
--- a/package/librsvg/0001-librsvg.pc.in-add-libcroco-to-Requires.Private.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 322b415f92d4dcd36824eef83bd617bac6e5c8c7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 24 Dec 2019 16:38:35 +0100
-Subject: [PATCH] librsvg.pc.in: add libcroco to Requires.private
-
-libcroco is a mandatory dependency since version 2.35.0 so add it to
-Requires.Private to fix a static build failure with imagemagick
-
-This patch is not upstreamable as librsvg no longer depends on libcroco
-since version 2.47.1. It now does all CSS processing using Rust crates
-from Mozilla Servo.
-
-Fixes:
- - http://autobuild.buildroot.org/results/42f4b4881569779162d3efe4628b934f965913b9
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- librsvg.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/librsvg.pc.in b/librsvg.pc.in
-index a451de05..4b09984a 100644
---- a/librsvg.pc.in
-+++ b/librsvg.pc.in
-@@ -10,6 +10,6 @@ Name: librsvg
- Description: library that renders svg files
- Version: @VERSION@
- Requires: glib-2.0 gio-2.0 gdk-pixbuf-2.0 cairo
--Requires.private:
-+Requires.private: libcroco-0.6
- Libs: -L${libdir} -lrsvg- at RSVG_API_MAJOR_VERSION@ -lm
- Cflags: -I${includedir}/librsvg- at RSVG_API_VERSION@
--- 
-2.24.0
-
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 735bf61259..3272ecd773 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBRSVG
 	bool "librsvg"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
@@ -8,8 +9,9 @@ config BR2_PACKAGE_LIBRSVG
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_CAIRO_SCRIPT
 	select BR2_PACKAGE_GDK_PIXBUF
-	select BR2_PACKAGE_LIBCROCO
+	select BR2_PACKAGE_HOST_RUSTC
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PANGO
@@ -20,6 +22,7 @@ config BR2_PACKAGE_LIBRSVG
 	  https://wiki.gnome.org/Projects/LibRsvg
 
 comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 366d9b0db6..899c5ea760 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,4 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/librsvg-2.40.20.sha256sum
-sha256	cff4dd3c3b78bfe99d8fcfad3b8ba1eee3289a0823c0e118d78106be6b84c92b	librsvg-2.40.20.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.48/librsvg-2.48.8.sha256sum
+sha256  f480a325bbdf26d1874eb6fb330ebc5920ba64e3e08de61931bb4506dfef2692  librsvg-2.48.8.tar.xz
+
 # Locally computed
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index e124fdd5d3..00be501e93 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -4,18 +4,19 @@
 #
 ################################################################################
 
-LIBRSVG_VERSION_MAJOR = 2.40
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).20
+LIBRSVG_VERSION_MAJOR = 2.48
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).8
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
-LIBRSVG_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+LIBRSVG_CONF_ENV = \
+	LIBS=$(TARGET_NLS_LIBS) \
+	RUST_TARGET=$(RUSTC_TARGET_NAME)
 LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
-LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
-	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3) \
+LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf host-rustc libglib2 libxml2 pango \
 	$(TARGET_NLS_DEPENDENCIES)
-HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libglib2 host-libxml2 host-pango
+HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libglib2 host-libxml2 host-pango host-rustc
 LIBRSVG_LICENSE = LGPL-2.0+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
 
diff --git a/package/midori/Config.in b/package/midori/Config.in
index f4b8905c85..e2cc2ac612 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,4 +1,5 @@
 comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7, host gcc >= 4.9"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
@@ -7,6 +8,7 @@ comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7, host gcc >
 
 config BR2_PACKAGE_MIDORI
 	bool "midori"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # webkitgtk
diff --git a/package/vte/Config.in b/package/vte/Config.in
index fa29de8c71..96de3d38cc 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VTE
 	bool "vte"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3 -> host-libgtk3 -> host-librsvg
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
@@ -22,6 +23,7 @@ config BR2_PACKAGE_VTE
 	  http://github.com/GNOME/vte
 
 comment "vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
@@ -29,6 +31,7 @@ comment "vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
