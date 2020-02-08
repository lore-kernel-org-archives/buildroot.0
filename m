From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 22:42:49 +0100
Subject: [Buildroot] [git commit] package/libplayer: remove package
Message-ID: <20200208214332.0CDC88D666@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d89fa735a7a02151c02f10f13e3b62f1ac2b9b5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libplayer is dead upstream.  The mercurial repo is no longer online, it
hasn't seen any releases since 2010 and the mplayer backend was removed from
Buildroot in 2018.

With the upcoming removal of gstreamer 0.10, there is no longer any backends
available in Buildroot, so remove the package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                  |  8 +++++
 package/Config.in                                 |  1 -
 package/libplayer/0001-add-fpic.patch             | 18 ----------
 package/libplayer/0002-fix-configure-cflags.patch | 41 -----------------------
 package/libplayer/Config.in                       | 28 ----------------
 package/libplayer/libplayer.hash                  |  3 --
 package/libplayer/libplayer.mk                    | 36 --------------------
 7 files changed, 8 insertions(+), 127 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3c6984d886..4d81a2a09a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_LIBPLAYER
+	bool "libplayer package was removed"
+	select BR2_LEGACY
+	help
+	  The libplayer package was removed. The latest release is
+	  from 2010 and none of the backends are available in
+	  Buildroot any more.
+
 config BR2_GCC_VERSION_OR1K
 	bool "gcc 5.x fork for or1k has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index bad4f9cba6..72630d4ee9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1601,7 +1601,6 @@ menu "Multimedia"
 	source "package/libogg/Config.in"
 	source "package/libopenh264/Config.in"
 	source "package/libopusenc/Config.in"
-	source "package/libplayer/Config.in"
 	source "package/libtheora/Config.in"
 	source "package/libvpx/Config.in"
 	source "package/libyuv/Config.in"
diff --git a/package/libplayer/0001-add-fpic.patch b/package/libplayer/0001-add-fpic.patch
deleted file mode 100644
index e4b227f911..0000000000
--- a/package/libplayer/0001-add-fpic.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Add -fPIC to CFLAGS
-
--fPIC is needed to build shared library code.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/Makefile
-===================================================================
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -9,6 +9,7 @@
- SHARED_LIBNAME_VERSION = $(SHARED_LIBNAME).$(VERSION)
- SHARED_LIBNAME_MAJOR = $(SHARED_LIBNAME).$(shell echo $(VERSION) | cut -f1 -d.)
- SHARED_LIBNAME_FLAGS = -shared -Wl,-soname,$(SHARED_LIBNAME_MAJOR)
-+CFLAGS = -fPIC
- 
- ifeq ($(BUILD_STATIC),yes)
-   BUILD_RULES += lib_static
diff --git a/package/libplayer/0002-fix-configure-cflags.patch b/package/libplayer/0002-fix-configure-cflags.patch
deleted file mode 100644
index 186afd562e..0000000000
--- a/package/libplayer/0002-fix-configure-cflags.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-Subject: [PATCH] libplayer: Fix handling of cflags in configure.
-
-The cflags returned by pkg-config or another config script may consist
-of several arguments for the compiler.  These should not be quoted together
-into a single argument.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
-Sent upstream to devel at geexbox.org on July 11, 2012.
----
-diff -rup libplayer-2.0.1.orig/configure libplayer-2.0.1/configure
---- libplayer-2.0.1.orig/configure	2010-10-03 19:26:11.000000000 +0200
-+++ libplayer-2.0.1/configure	2012-07-10 23:33:02.783701852 +0200
-@@ -342,7 +342,7 @@ check_libconfig(){
-   err=1
-   if `which "$config" 1>/dev/null 2>&1`; then
-     cflags=`$config $ccflags`
--    [ -n "$cflags" ] && check_cflags "$cflags"
-+    [ -n "$cflags" ] && check_cflags $cflags
-     libs=`$config $clibs`
-     if [ -n "$libs" ]; then
-       temp_extralibs "$libs"
-@@ -364,7 +364,7 @@ check_libconfig_exists(){
-   err=1
-   if `which "$config" 1>/dev/null 2>&1`; then
-     cflags=`$config $ccflags`
--    [ -n "$cflags" ] && temp_cflags "$cflags"
-+    [ -n "$cflags" ] && temp_cflags $cflags
-     libs=`$config $clibs`
-     if [ -n "$libs" ]; then
-       temp_extralibs "$libs"
-@@ -386,7 +386,7 @@ check_pkgconfig(){
-   err=1
-   if `which pkg-config 1>/dev/null 2>&1`; then
-     cflags=`pkg-config $pkg $ccflags`
--    [ -n "$cflags" ] && check_cflags "$cflags"
-+    [ -n "$cflags" ] && check_cflags $cflags
-     libs=`pkg-config $pkg $clibs`
-     if [ -n "$libs" ]; then
-       temp_extralibs "$libs"
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
deleted file mode 100644
index 3cad683248..0000000000
--- a/package/libplayer/Config.in
+++ /dev/null
@@ -1,28 +0,0 @@
-config BR2_PACKAGE_LIBPLAYER
-	bool "libplayer"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  libplayer provides a generic A/V API that relies on various
-	  multimedia player for Linux systems. It currently supports
-	  MPlayer, xine VLC and GStreamer only
-
-	  http://libplayer.geexbox.org/
-
-if BR2_PACKAGE_LIBPLAYER
-
-config BR2_PACKAGE_LIBPLAYER_GSTREAMER
-	bool "gstreamer backend"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on !BR2_STATIC_LIBS # gstreamer
-	select BR2_PACKAGE_GSTREAMER
-
-comment "gstreamer backend needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
-endif
-
-comment "libplayer needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libplayer/libplayer.hash b/package/libplayer/libplayer.hash
deleted file mode 100644
index 62041e5737..0000000000
--- a/package/libplayer/libplayer.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  aa5eeb54f773bc9cad2733e4a0b5870208fc7f75024515ea87e55f64653e9d65  libplayer-2.0.1.tar.bz2
-sha256  29bc1d97c09654ba9a9f490e3b69d1bba84938ebb21ac87b2af4d190b082e2ca  COPYING
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
deleted file mode 100644
index 8d139cea0e..0000000000
--- a/package/libplayer/libplayer.mk
+++ /dev/null
@@ -1,36 +0,0 @@
-################################################################################
-#
-# libplayer
-#
-################################################################################
-
-LIBPLAYER_VERSION = 2.0.1
-LIBPLAYER_SITE = http://libplayer.geexbox.org/releases
-LIBPLAYER_SOURCE = libplayer-$(LIBPLAYER_VERSION).tar.bz2
-LIBPLAYER_LICENSE = LGPL-2.1+
-LIBPLAYER_LICENSE_FILES = COPYING
-
-# When passing the standard buildroot configure arguments, the configure script
-# breaks on --target and --host options. Thus we need to define a configure cmd
-# ourselves.
-define LIBPLAYER_CONFIGURE_CMDS
-	(cd $(@D) && rm -rf config.cache && \
-	$(TARGET_CONFIGURE_OPTS) \
-	$(TARGET_CONFIGURE_ARGS) \
-	./configure \
-		--prefix=/usr \
-		--cross-compile \
-		--disable-mplayer \
-		$(SHARED_STATIC_LIBS_OPTS) \
-		$(LIBPLAYER_CONF_OPTS) \
-	)
-endef
-
-ifeq ($(BR2_PACKAGE_LIBPLAYER_GSTREAMER),y)
-LIBPLAYER_DEPENDENCIES += gstreamer
-LIBPLAYER_CONF_OPTS += --enable-gstreamer
-else
-LIBPLAYER_CONF_OPTS += --disable-gstreamer
-endif
-
-$(eval $(autotools-package))
