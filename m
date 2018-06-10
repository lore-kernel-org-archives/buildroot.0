From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 16:20:52 +0200
Subject: [Buildroot] [git commit] librsvg: bump to version 2.42.5
Message-ID: <20180610141947.8D06282517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ec1f865515223426518e0709d4ca8b57dded6fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add a dependency to host-cargo
- Add a patch to set RUST_TARGET
- Add a dependency to BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
- Forward this dependency to efl svg, enlightment, gst-plugins-bad and
  gst1-plugins-bad
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: propagate the new dependency to the gst-plugins-bad and
gst1-plugins-bad Config.in comments.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/efl/Config.in                              |  1 +
 package/enlightenment/Config.in                    |  2 +
 package/gstreamer/gst-plugins-bad/Config.in        |  2 +
 package/gstreamer1/gst1-plugins-bad/Config.in      |  2 +
 .../librsvg/0001-Add-RUST_TARGET-variable.patch    | 57 ++++++++++++++++++++++
 package/librsvg/Config.in                          |  3 ++
 package/librsvg/librsvg.hash                       |  7 ++-
 package/librsvg/librsvg.mk                         | 12 +++--
 8 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index cfb803c6df..b9b285d8da 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -289,6 +289,7 @@ config BR2_PACKAGE_EFL_LIBRAW
 
 config BR2_PACKAGE_EFL_SVG
 	bool "SVG loader"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # librsvg
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index d1dee25f86..892da79b4d 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ENLIGHTENMENT
 	bool "enlightenment"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # efl svg -> librsvg
 	# libevas-generic-loaders-svg -> librsvg -> glib2 / pango
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -29,6 +30,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	  http://www.enlightenment.org/
 
 comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_EFL && BR2_PACKAGE_XORG7 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_PACKAGE_HAS_UDEV
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 7bbd56a602..3f2392afdb 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -297,11 +297,13 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OPUS
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # librsvg
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 
 comment "rsvg plugin needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 7e166e43a1..b09e515f5a 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -643,6 +643,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # librsvg
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
@@ -650,6 +651,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	  RSVG plugin library
 
 comment "rsvg plugin needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
diff --git a/package/librsvg/0001-Add-RUST_TARGET-variable.patch b/package/librsvg/0001-Add-RUST_TARGET-variable.patch
new file mode 100644
index 0000000000..2807c2423f
--- /dev/null
+++ b/package/librsvg/0001-Add-RUST_TARGET-variable.patch
@@ -0,0 +1,57 @@
+From 2bef718d1ade8dd20f431ac2eef9fdf58d96842f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 1 Jun 2018 20:58:25 +0200
+Subject: [PATCH] Add RUST_TARGET variable
+
+Add RUST_TARGET environment variable through AC_ARG_VAR to allow the
+user to override the rust target name. Indeed, using $host when
+cross-compiling is not always the good option especially when vendor
+part of target is not set to unknown but to another value such as
+buildroot.
+Indeed, in this case aarch64-buildroot-linux-gnu won't be recognised as
+a valid target by rust/cargo.
+
+[Upstream status: merged (https://github.com/GNOME/librsvg/commit/f0b76ab6f003b8e05d4caab2b6d844e97b97796f)]
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  | 2 +-
+ configure.ac | 7 ++++++-
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index f21b58e2..0b5b906f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -136,7 +136,7 @@ CARGO_RELEASE_ARGS=--release
+ endif
+ 
+ if CROSS_COMPILING
+-CARGO_TARGET_ARGS=--target=$(host)
++CARGO_TARGET_ARGS=--target=$(RUST_TARGET)
+ endif
+ 
+ CARGO_VERBOSE = $(cargo_verbose_$(V))
+diff --git a/configure.ac b/configure.ac
+index c9666757..50ca9f0f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -286,9 +286,14 @@ else
+ fi
+ AM_CONDITIONAL([DEBUG_RELEASE], [test "x$debug_release" = "xyes"])
+ 
++AC_ARG_VAR(RUST_TARGET, [Set rust target (default=$host)])
++if test "x$RUST_TARGET" == x; then
++	RUST_TARGET=$host
++fi
++
+ AM_CONDITIONAL(CROSS_COMPILING, test $cross_compiling = yes)
+ if test "x$cross_compiling" = "xyes" ; then
+-	RUST_TARGET_SUBDIR="$host/$RUST_TARGET_SUBDIR"
++	RUST_TARGET_SUBDIR="$RUST_TARGET/$RUST_TARGET_SUBDIR"
+ fi
+ AC_SUBST([RUST_TARGET_SUBDIR])
+ 
+-- 
+2.14.1
+
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index ffb0287dbd..45919c7d51 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBRSVG
 	bool "librsvg"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
@@ -8,6 +9,7 @@ config BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_HOST_CARGO
 	select BR2_PACKAGE_LIBCROCO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
@@ -19,6 +21,7 @@ config BR2_PACKAGE_LIBRSVG
 	  https://wiki.gnome.org/Projects/LibRsvg
 
 comment "librsvg needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 6f4b07423a..dce918d0ce 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,2 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/librsvg-2.40.20.sha256sum
-sha256	cff4dd3c3b78bfe99d8fcfad3b8ba1eee3289a0823c0e118d78106be6b84c92b	librsvg-2.40.20.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.42/librsvg-2.42.5.sha256sum
+sha256	d4dd51a492a2022c07dec385e22947190fe70410928c471934ff3399f20935ec	librsvg-2.42.5.tar.xz
+
+# Hash for license file:
+sha256	d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f	COPYING.LIB
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 4f563ce6db..037e1fbc14 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -4,18 +4,22 @@
 #
 ################################################################################
 
-LIBRSVG_VERSION_MAJOR = 2.40
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).20
+LIBRSVG_VERSION_MAJOR = 2.42
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).5
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools --enable-introspection=no
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
-LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
+LIBRSVG_DEPENDENCIES = cairo host-cargo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
 	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3)
-HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libglib2 host-libxml2 host-pango
+HOST_LIBRSVG_DEPENDENCIES = host-cairo host-cargo host-gdk-pixbuf host-libcroco host-libglib2 host-libxml2 host-pango
 LIBRSVG_LICENSE = LGPL-2.0+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
 
+# We're patching configure.ac
+LIBRSVG_AUTORECONF = YES
+LIBRSVG_CONF_ENV = RUST_TARGET=$(RUSTC_TARGET_NAME)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
