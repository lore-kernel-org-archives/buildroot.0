From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 14:49:00 +0200
Subject: [Buildroot] [PATCH 08/24 v4] cairo: add dependency on atomic
	operations
In-Reply-To: <cover.1408279142.git.yann.morin.1998@free.fr>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
Message-ID: <99dca80325359c3f5003260bc3d564fab241189b.1408279142.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Anton Kolesov <anton.kolesov@synopsys.com>

This fixes:
http://autobuild.buildroot.net/results/fadfaa9916724d310d0dda555a1db31bee1601d0/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
[yann.morin.1998 at free.fr: use the new symbol; remove comment strings;
 fix weston's comment]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/cairo/Config.in                        | 1 +
 package/efl/libevas-generic-loaders/Config.in  | 2 ++
 package/gstreamer/gst-plugins-good/Config.in   | 1 +
 package/gstreamer1/gst1-plugins-good/Config.in | 1 +
 package/libgtk2/Config.in                      | 2 ++
 package/librsvg/Config.in                      | 2 ++
 package/libsvg-cairo/Config.in                 | 1 +
 package/pango/Config.in                        | 2 ++
 package/webkit/Config.in                       | 2 ++
 package/weston/Config.in                       | 2 ++
 10 files changed, 16 insertions(+)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 0c87a29..38570d6 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CAIRO
 	bool "cairo"
+	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
diff --git a/package/efl/libevas-generic-loaders/Config.in b/package/efl/libevas-generic-loaders/Config.in
index 23b9f77..30fb88b 100644
--- a/package/efl/libevas-generic-loaders/Config.in
+++ b/package/efl/libevas-generic-loaders/Config.in
@@ -17,10 +17,12 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	depends on BR2_USE_WCHAR # librsvg -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	help
 	  This option enables the Evas generic SVG loader
 
 comment "SVG loader needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 
 endif
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 3ec93cf..36b15a8 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -178,6 +178,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CAIRO
 	bool "cairo"
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 65dc7b1..f44690c 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -278,6 +278,7 @@ comment "v4l2 needs toolchain w/ headers >= 3.0"
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO
 	bool "cairo"
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	help
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 5239c25..9326f44 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	help
 	  The GTK+ version 2 graphical user interface library
 
@@ -34,6 +35,7 @@ endif
 
 comment "libgtk2 needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 5dd4c58..94ef2ed 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBRSVG
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	help
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
@@ -18,4 +19,5 @@ config BR2_PACKAGE_LIBRSVG
 
 comment "librsvg needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsvg-cairo/Config.in b/package/libsvg-cairo/Config.in
index 9577c69..d69a6b9 100644
--- a/package/libsvg-cairo/Config.in
+++ b/package/libsvg-cairo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSVG_CAIRO
 	bool "libsvg-cairo"
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_SVG
 	select BR2_PACKAGE_LIBSVG
diff --git a/package/pango/Config.in b/package/pango/Config.in
index 70f4fd3..e9c3040 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PANGO
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
@@ -23,5 +24,6 @@ config BR2_PACKAGE_PANGO
 
 comment "pango needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 8cd1a36..fcb61b6 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
@@ -44,6 +45,7 @@ config BR2_PACKAGE_WEBKIT
 
 comment "webkit needs libgtk2 and a toolchain w/ C++, wchar, threads"
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/weston/Config.in b/package/weston/Config.in
index aaef405..dc7e235 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,5 +1,6 @@
 comment "weston needs udev and a toolchain w/ threads, headers >= 3.0"
 	depends on !BR2_avr32
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 config BR2_PACKAGE_WESTON
@@ -15,6 +16,7 @@ config BR2_PACKAGE_WESTON
 	depends on !BR2_avr32 # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	# Make sure at least one compositor is selected.
-- 
1.9.1
