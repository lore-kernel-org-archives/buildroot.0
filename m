From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 23:47:33 +0100
Subject: [Buildroot] [PATCH v2 09/17] cairo,
	harfbuzz: rework atomic dependencies
In-Reply-To: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453934861-26364-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit handles the reverse dependency tree of cairo in terms of
atomic dependencies. There are two main changes:

 - cairo in fact no longer needs atomic operations. It can perfectly
   build without any __sync built-in, as was tested using an ARC
   toolchain without atomics, and a SPARC toolchain. Optionally, Cairo
   can use the __atomic builtins provided by gcc >= 4.7, so support
   for this is added as well. Thanks to this change, the
   BR2_ARCH_HAS_ATOMICS dependency is removed from cairo and all its
   reverse dependencies.

 - harfbuzz does require the __sync built-in for 4 bytes integers, so
   we add a dependency on BR2_TOOLCHAIN_HAS_SYNC_4 to harfbuzz and all
   its reverse dependency, the main one being the pango package. Due
   to this, the vast majority of gtk-related packages are moved to a
   dependency on BR2_ARCH_HAS_ATOMICS (which used to be due to cairo)
   to a dependency on BR2_TOOLCHAIN_HAS_SYNC_4 (due to pango ->
   harfbuzz).

In detail:

 - cairo

   Remove BR2_ARCH_HAS_ATOMICS dependency, link against -latomic when
   gcc >= 4.7 in order to use the __atomic functions.

 - harfbuzz

   Add dependency on BR2_TOOLCHAIN_HAS_SYNC_4

 - cairomm, gst-plugins-good, gst1-plugins-good, libgdiplus,
   libsvg-cairo, weston

   Remove BR2_ARCH_HAS_ATOMICS dependency (since cairo no longer needs
   atomics)

 - enlightenment, cwiid, gst-plugins-bad, gst-plugins-base,
   gst1-plugins-bad, gst1-plugins-base, gtkmm3,
   libevas-generic-loaders, libfm, libgail, libgtk2, libgtk3, librsvg,
   openbox, opencv, opencv3, pango, pangomm, pcmanfm, pinentry,
   rrdtool, webkit, webkitgtk24, xscreensaver

   Switch from a BR2_ARCH_HAS_ATOMICS dependency to a
   BR2_TOOLCHAIN_HAS_SYNC_4 (they depend on pango, harfbuzz, gtk, or
   some other related package)

 - directfb

   Remove BR2_ARCH_ATOMICS dependency of the BR2_PACKAGE_DIRECTFB_SVG
   (since cairo can build without atomics), but add a
   BR2_TOOLCHAIN_HAS_SYNC_4 dependency on BR2_PACKAGE_DIRECTFB itself
   since it does use __sync built-ins. This replaces the !BR2_sparc
   dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/Config.in                        | 1 -
 package/cairo/cairo.mk                         | 6 ++++++
 package/cairomm/Config.in                      | 2 --
 package/cwiid/Config.in                        | 2 +-
 package/directfb/Config.in                     | 5 ++---
 package/enlightenment/Config.in                | 6 +++---
 package/gstreamer/gst-plugins-bad/Config.in    | 4 ++--
 package/gstreamer/gst-plugins-base/Config.in   | 4 ++--
 package/gstreamer/gst-plugins-good/Config.in   | 1 -
 package/gstreamer1/gst1-plugins-bad/Config.in  | 4 ++--
 package/gstreamer1/gst1-plugins-base/Config.in | 4 ++--
 package/gstreamer1/gst1-plugins-good/Config.in | 1 -
 package/gtkmm3/Config.in                       | 4 ++--
 package/harfbuzz/Config.in                     | 2 ++
 package/libevas-generic-loaders/Config.in      | 4 ++--
 package/libfm/Config.in                        | 4 ++--
 package/libgail/Config.in                      | 4 ++--
 package/libgdiplus/Config.in                   | 2 --
 package/libgtk2/Config.in                      | 4 ++--
 package/libgtk3/Config.in                      | 4 ++--
 package/librsvg/Config.in                      | 4 ++--
 package/libsvg-cairo/Config.in                 | 1 -
 package/openbox/Config.in                      | 4 ++--
 package/opencv/Config.in                       | 2 +-
 package/opencv3/Config.in                      | 4 ++--
 package/pango/Config.in                        | 4 ++--
 package/pangomm/Config.in                      | 4 ++--
 package/pcmanfm/Config.in                      | 4 ++--
 package/pinentry/Config.in                     | 4 ++--
 package/rrdtool/Config.in                      | 2 +-
 package/webkit/Config.in                       | 4 ++--
 package/webkitgtk24/Config.in                  | 4 ++--
 package/weston/Config.in                       | 2 --
 package/xscreensaver/Config.in                 | 4 ++--
 34 files changed, 56 insertions(+), 59 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 38570d6..0c87a29 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_CAIRO
 	bool "cairo"
-	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index d80d068..5e48546 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -16,6 +16,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
 endif
 
+# cairo can use C++11 atomics when available, so we need to link with
+# libatomic for the architectures who need libatomic.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
+CAIRO_CONF_ENV += LIBS="-latomic"
+endif
+
 CAIRO_CONF_OPTS = \
 	--enable-trace=no \
 	--enable-interpreter=no
diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
index 4477b37..c0d5ccd 100644
--- a/package/cairomm/Config.in
+++ b/package/cairomm/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_CAIROMM
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBSIGC
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
@@ -16,6 +15,5 @@ config BR2_PACKAGE_CAIROMM
 
 comment "cairomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 1b64f0a..03b7dbb 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_CWIID
 if BR2_PACKAGE_CWIID
 config BR2_PACKAGE_CWIID_WMGUI
 	bool "wmgui"
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3 -> pango -> harfbuzz
 	depends on BR2_PACKAGE_XORG7 # libgtk2
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 73425d3..7c5f66b 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_DIRECTFB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on !BR2_TOOLCHAIN_USES_MUSL # sigval_t issue
-	depends on !BR2_sparc # needs atomic operation __sync_fetch_and_add
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ZLIB
 	help
@@ -141,7 +141,6 @@ config BR2_PACKAGE_DIRECTFB_PNG
 
 config BR2_PACKAGE_DIRECTFB_SVG
 	bool "enable SVG support"
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	default y
 	select BR2_PACKAGE_LIBSVG_CAIRO
 
@@ -157,6 +156,6 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 endif # BR2_PACKAGE_DIRECTFB
 
 comment "directfb needs a (e)glibc or uClibc toolchain w/ C++, threads, gcc >= 4.5"
-	depends on !BR2_sparc # needs atomic operation __sync_fetch_and_add
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index fc1f469..05ee6fc 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -10,8 +10,8 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_EFL
 	depends on BR2_PACKAGE_XORG7
-	# libevas-generic-loaders-svg -> librsvg -> pango -> cairo
-	depends on BR2_ARCH_HAS_ATOMICS
+	# libevas-generic-loaders-svg -> librsvg -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
 	select BR2_PACKAGE_EFL_PNG # needed at runtime by enlightenment_start
@@ -31,4 +31,4 @@ config BR2_PACKAGE_ENLIGHTENMENT
 comment "enlightenment needs a toolchain w/ wchar, C++, threads"
 	depends on BR2_PACKAGE_EFL && BR2_PACKAGE_XORG7 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 43849e2..d95edaa 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -298,12 +298,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OPUS
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
-	depends on BR2_ARCH_HAS_ATOMICS # librsvg -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 
 comment "rsvg plugin needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
index 8ececea..8ad9a8e 100644
--- a/package/gstreamer/gst-plugins-base/Config.in
+++ b/package/gstreamer/gst-plugins-base/Config.in
@@ -85,12 +85,12 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
-	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	select BR2_PACKAGE_PANGO
 
 comment "pango plugin needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 36ab6cb..65f74e8 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -174,7 +174,6 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CAIRO
 	bool "cairo"
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0aafea0..f02be34 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -623,14 +623,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
-	depends on BR2_ARCH_HAS_ATOMICS # librsvg -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 	help
 	  RSVG plugin library
 
 comment "rsvg plugin needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
 	bool "gl"
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 44367eb..b19fa59 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -129,14 +129,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
-	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	select BR2_PACKAGE_PANGO
 	help
 	  Pango-based text rendering and overlay
 
 comment "pango plugin needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 2606b86..a59033a 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -281,7 +281,6 @@ comment "v4l2 needs a toolchain w/ headers >= 3.0"
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO
 	bool "cairo"
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	help
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 80dbbde..238a8cd 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_GTKMM3
 	# and GCC >= 5.3.
 	# https://sourceware.org/bugzilla/show_bug.cgi?id=19405
 	depends on !BR2_nios2
-	depends on BR2_ARCH_HAS_ATOMICS # libcairomm/libgtk3/libpangomm -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
@@ -24,6 +24,6 @@ config BR2_PACKAGE_GTKMM3
 
 comment "gtkmm3 needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index 7a864e9..a6db984 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HARFBUZZ
 	bool "harfbuzz"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  HarfBuzz is an OpenType text shaping engine
 
@@ -10,4 +11,5 @@ config BR2_PACKAGE_HARFBUZZ
 	  glib2 and icu packages if they are selected.
 
 comment "harfbuzz needs a toolchain w/ C++"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
index 1d5b717..c171d47 100644
--- a/package/libevas-generic-loaders/Config.in
+++ b/package/libevas-generic-loaders/Config.in
@@ -27,14 +27,14 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	depends on BR2_USE_WCHAR # librsvg -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
 	help
 	  This option enables the Evas generic SVG loader
 
 comment "SVG loader needs a toolchain w/ wchar, threads, C++"
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index c6cfcf6..603b4d5 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBFM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	help
 	  A glib/gio-based library providing some file management
 	  utilities and related-widgets missing in gtk+/glib. This is
@@ -23,6 +23,6 @@ config BR2_PACKAGE_LIBFM
 
 comment "libfm needs X.org and a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_XORG7
diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index 5e4f03b..821a922 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBGAIL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
 	depends on BR2_USE_MMU # pango -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
-	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_DEPRECATED_SINCE_2015_08
 	select BR2_PACKAGE_PANGO
@@ -27,5 +27,5 @@ comment "libgail needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_DEPRECATED_SINCE_2015_08
diff --git a/package/libgdiplus/Config.in b/package/libgdiplus/Config.in
index f860ab3..6862503 100644
--- a/package/libgdiplus/Config.in
+++ b/package/libgdiplus/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_LIBGDIPLUS
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	help
 	  An Open Source implementation of the GDI+ API.
 
@@ -16,6 +15,5 @@ config BR2_PACKAGE_LIBGDIPLUS
 
 comment "libgdiplus needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 9326f44..b6cf37e 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	help
 	  The GTK+ version 2 graphical user interface library
 
@@ -35,7 +35,7 @@ endif
 
 comment "libgtk2 needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 02c7aaf..ac56b85 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	help
 	  The GTK+ version 3 graphical user interface library
 
@@ -84,6 +84,6 @@ endif
 
 comment "libgtk3 needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 03e5cf3..7ce9d06 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LIBRSVG
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	help
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
@@ -20,5 +20,5 @@ config BR2_PACKAGE_LIBRSVG
 
 comment "librsvg needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsvg-cairo/Config.in b/package/libsvg-cairo/Config.in
index d69a6b9..9577c69 100644
--- a/package/libsvg-cairo/Config.in
+++ b/package/libsvg-cairo/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBSVG_CAIRO
 	bool "libsvg-cairo"
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_SVG
 	select BR2_PACKAGE_LIBSVG
diff --git a/package/openbox/Config.in b/package/openbox/Config.in
index f5475bf..3ddd376 100644
--- a/package/openbox/Config.in
+++ b/package/openbox/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_OPENBOX
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
@@ -21,7 +21,7 @@ config BR2_PACKAGE_OPENBOX
 
 comment "openbox needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		!BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 679ce6f..8bc6c34 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -179,7 +179,7 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # libgtk2 -> glib2
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	select BR2_PACKAGE_LIBGTK2
 
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 8736805..3a185d6 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -69,7 +69,7 @@ config BR2_PACKAGE_OPENCV3_WITH_GTK
 
 comment "gtk2 support needs libgtk2"
 	depends on BR2_USE_MMU # libgtk2 -> glib2
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_LIBGTK2
 
 config BR2_PACKAGE_OPENCV3_WITH_GTK3
@@ -78,7 +78,7 @@ config BR2_PACKAGE_OPENCV3_WITH_GTK3
 
 comment "gtk3 support needs libgtk3"
 	depends on BR2_USE_MMU # libgtk3 -> glib2
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk3 -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_LIBGTK3
 
 config BR2_PACKAGE_OPENCV3_WITH_QT
diff --git a/package/pango/Config.in b/package/pango/Config.in
index e9c3040..7813c4e 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PANGO
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
@@ -24,6 +24,6 @@ config BR2_PACKAGE_PANGO
 
 comment "pango needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
index 6a84c42..a7c41a0 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PANGOMM
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_LIBSIGC
-	depends on BR2_ARCH_HAS_ATOMICS # libcairomm/pango -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
@@ -17,6 +17,6 @@ config BR2_PACKAGE_PANGOMM
 
 comment "pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 4289785..149a595 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	help
 	  PCMan File Manager (PCManFM) is a file manager application developed
 	  by Hong Jen Yee from Taiwan which is meant to be a replacement for
@@ -19,6 +19,6 @@ config BR2_PACKAGE_PCMANFM
 
 comment "pcmanfm needs X.org and a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_XORG7
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index edf3316..f5a8159 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_PINENTRY_GTK2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -31,7 +31,7 @@ config BR2_PACKAGE_PINENTRY_GTK2
 
 comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index b07c446..631ed32 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -15,7 +15,7 @@ if BR2_PACKAGE_RRDTOOL
 config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	bool "rrd_graph"
 	default y
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PDF
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 7f0d1e4..c139f52 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
@@ -47,7 +47,7 @@ config BR2_PACKAGE_WEBKIT
 comment "webkit needs libgtk2 and a toolchain w/ C++, wchar, threads"
 	depends on BR2_DEPRECATED_SINCE_2015_08
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/webkitgtk24/Config.in b/package/webkitgtk24/Config.in
index 0a30bac..3c7c330 100644
--- a/package/webkitgtk24/Config.in
+++ b/package/webkitgtk24/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
 
 comment "webkitgtk24 needs libgtk2 and a toolchain w/ C++, wchar, NPTL, gcc >=4.8"
 	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_PACKAGE_XORG7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -25,7 +25,7 @@ config BR2_PACKAGE_WEBKITGTK24
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on (BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_XORG7)
 	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 3fd7981..c5525e1 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,5 +1,4 @@
 comment "weston needs udev and a toolchain w/ locale, threads, dynamic library, headers >= 3.0"
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS || \
 		!BR2_ENABLE_LOCALE
@@ -19,7 +18,6 @@ config BR2_PACKAGE_WESTON
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	# Make sure at least one compositor is selected.
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 59b19c5..5213ce3 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> glib2
 	depends on BR2_USE_WCHAR # libgtk2 -> glib2
 	depends on BR2_USE_MMU # libgtk2 -> glib2
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLADE
 	select BR2_PACKAGE_JPEG
@@ -25,6 +25,6 @@ config BR2_PACKAGE_XSCREENSAVER
 comment "xscreensaver needs a toolchain w/ wchar, C++, threads"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR
-- 
2.6.4
