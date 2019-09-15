From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Sep 2019 20:40:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/chocolate-doom: bump to version
 3.0.0
Message-ID: <20190915184000.3491-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Switch to sdl2
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...onfigure-Switch-to-pkg-config-macros.patch | 217 ------------------
 package/chocolate-doom/Config.in              |  10 +-
 package/chocolate-doom/chocolate-doom.hash    |   3 +-
 package/chocolate-doom/chocolate-doom.mk      |  12 +-
 4 files changed, 11 insertions(+), 231 deletions(-)
 delete mode 100644 package/chocolate-doom/0004-configure-Switch-to-pkg-config-macros.patch

diff --git a/package/chocolate-doom/0004-configure-Switch-to-pkg-config-macros.patch b/package/chocolate-doom/0004-configure-Switch-to-pkg-config-macros.patch
deleted file mode 100644
index 2618396b56..0000000000
--- a/package/chocolate-doom/0004-configure-Switch-to-pkg-config-macros.patch
+++ /dev/null
@@ -1,217 +0,0 @@
-From 3163bf87d7b955d08dedd5ebaccb1b2a86ffdcb9 Mon Sep 17 00:00:00 2001
-From: Simon Howard <fraggle@soulsphere.org>
-Date: Thu, 25 Feb 2016 22:55:04 -0500
-Subject: [PATCH] configure: Switch to pkg-config macros.
-
-All dependency libraries install pkg-config .pc files nowadays, which
-makes the process of looking them up a lot simpler. Get rid of the SDL
-workaround macro as it's not needed.
-
-[Backported from upstream commit 3163bf87d7b955d08dedd5ebaccb1b2a86ffdcb9.
-Fixes static linking issues with SDL_mixer.]
-
-Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
----
- configure.ac                    | 117 ++++++++++++++--------------------------
- opl/examples/Makefile.am        |   2 +-
- src/Makefile.am                 |   7 ++-
- textscreen/Makefile.am          |   2 +-
- textscreen/examples/Makefile.am |   2 +-
- 5 files changed, 49 insertions(+), 81 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7b03485..48f83ef 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -33,89 +33,54 @@ then
-         CFLAGS="-O$OPT_LEVEL -g $WARNINGS $orig_CFLAGS"
- fi
- 
--dnl Search for SDL ...
--
--AM_PATH_SDL(1.1.3)
--
--# Add the SDL compiler flags to the default compiler flag variables. 
--# It is important to do this now, before checking for headers and
--# library functions.  The reason being that on Windows, sdl-config
--# sets the -mno-cygwin compiler option in order to generate MinGW 
--# executables.  If we don't do this now, we might end up discovering
--# header files that are not actually available to us when we come
--# to compile.
--
--CFLAGS="$CFLAGS $SDL_CFLAGS"
--LDFLAGS="$LDFLAGS $SDL_LIBS"
--
--# On some platforms, SDL renames main() to SDL_main() using a #define,
--# so that its own main, stored in the SDLmain library, can be run first.
--# Unfortunately, this causes problems for autoconf, which builds
--# test programs to probe the system.  All library/header/symbol checks
--# must be run in this block, that performs a workaround for the problem.
--
--AC_SDL_MAIN_WORKAROUND([
--
--    # Check for SDL_mixer.
--
--    AC_CHECK_LIB(SDL_mixer,Mix_LoadMUS,[
--        SDLMIXER_LIBS="$SDLMIXER_LIBS -lSDL_mixer"
--    ],[
--        echo "*** Could not find SDL_mixer.  Please install it."
--        exit -1
--    ])
--
--    # Check for SDL_net.
--
--    AC_CHECK_LIB(SDL_net,SDLNet_UDP_Send,[
--        SDLNET_LIBS="$SDLNET_LIBS -lSDL_net"
--    ],[
--        echo "*** Could not find SDL_net.  Please install it."
--        exit -1
--    ])
--
--    # Check for libsamplerate.
--    AC_ARG_WITH([libsamplerate],
--    AS_HELP_STRING([--without-libsamplerate],
--        [Build without libsamplerate @<:@default=check@:>@]),
--    [],
--    [
--        [with_libsamplerate=check]
--    ])
--    AS_IF([test "x$with_libsamplerate" != xno], [
--        AC_CHECK_LIB(samplerate, src_new, [], [
--            AS_IF([test "x$with_libsamplerate" != xcheck], [AC_MSG_FAILURE(
--                [--with-libsamplerate was given, but test for libsamplerate failed])
--            ])
-+PKG_CHECK_MODULES([SDL], [sdl])
-+PKG_CHECK_MODULES([SDLMIXER], [SDL_mixer])
-+PKG_CHECK_MODULES([SDLNET], [SDL_net])
-+
-+# Check for libsamplerate.
-+AC_ARG_WITH([libsamplerate],
-+AS_HELP_STRING([--without-libsamplerate],
-+    [Build without libsamplerate @<:@default=check@:>@]),
-+[],
-+[
-+    [with_libsamplerate=check]
-+])
-+AS_IF([test "x$with_libsamplerate" != xno], [
-+    PKG_CHECK_MODULES([SAMPLERATE], [samplerate >= 0.1.8], [
-+        AC_DEFINE([HAVE_LIBSAMPLERATE], [1], [libsamplerate installed])
-+    ], [
-+        AS_IF([test "x$with_libsamplerate" != xcheck], [AC_MSG_FAILURE(
-+            [--with-libsamplerate was given, but test for libsamplerate failed])
-         ])
-     ])
--    # Check for libpng.
--    AC_ARG_WITH([libpng],
--    AS_HELP_STRING([--without-libpng],
--        [Build without libpng @<:@default=check@:>@]),
--    [],
--    [
--        [with_libpng=check]
--    ])
--    AS_IF([test "x$with_libpng" != xno], [
--        AC_CHECK_LIB(z, zlibVersion)
--        AC_CHECK_LIB(png, png_get_io_ptr, [], [
--            AS_IF([test "x$with_libpng" != xcheck], [AC_MSG_FAILURE(
--                [--with-libpng was given, but test for libpng failed])
--            ])
-+])
-+# Check for libpng.
-+AC_ARG_WITH([libpng],
-+AS_HELP_STRING([--without-libpng],
-+    [Build without libpng @<:@default=check@:>@]),
-+[],
-+[
-+    [with_libpng=check]
-+])
-+AS_IF([test "x$with_libpng" != xno], [
-+    PKG_CHECK_MODULES([PNG], [libpng >= 1.6.10], [
-+        AC_DEFINE([HAVE_LIBPNG], [1], [libpng installed])
-+    ], [
-+        AS_IF([test "x$with_libpng" != xcheck], [AC_MSG_FAILURE(
-+            [--with-libpng was given, but test for libpng failed])
-         ])
-     ])
--    AC_CHECK_LIB(m, log)
-+])
-+AC_CHECK_LIB(m, log)
- 
--    AC_CHECK_HEADERS([linux/kd.h dev/isa/spkrio.h dev/speaker/speaker.h])
--    AC_CHECK_FUNCS(mmap ioperm)
-+AC_CHECK_HEADERS([linux/kd.h dev/isa/spkrio.h dev/speaker/speaker.h])
-+AC_CHECK_FUNCS(mmap ioperm)
- 
--    # OpenBSD I/O i386 library for I/O port access.
--    # (64 bit has the same thing with a different name!)
-+# OpenBSD I/O i386 library for I/O port access.
-+# (64 bit has the same thing with a different name!)
- 
--    AC_CHECK_LIB(i386, i386_iopl)
--    AC_CHECK_LIB(amd64, amd64_iopl)
--])
-+AC_CHECK_LIB(i386, i386_iopl)
-+AC_CHECK_LIB(amd64, amd64_iopl)
- 
- case $host in
-   *cygwin* | *mingw* )
-diff --git a/opl/examples/Makefile.am b/opl/examples/Makefile.am
-index 9afcd51..54c37f8 100644
---- a/opl/examples/Makefile.am
-+++ b/opl/examples/Makefile.am
-@@ -1,5 +1,5 @@
- 
--AM_CFLAGS = -I$(top_srcdir)/opl
-+AM_CFLAGS = -I$(top_srcdir)/opl @SDL_CFLAGS@
- 
- noinst_PROGRAMS=droplay
- 
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 78ee3ba..9624e01 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -21,7 +21,8 @@ execgames_SCRIPTS = $(SETUP_BINARIES)
- AM_CFLAGS = -I$(top_srcdir)/textscreen            \
-             -I$(top_srcdir)/opl                   \
-             -I$(top_srcdir)/pcsound               \
--            @SDLMIXER_CFLAGS@ @SDLNET_CFLAGS@
-+            @SDLMIXER_CFLAGS@ @SDLNET_CFLAGS@     \
-+            @SAMPLERATE_CFLAGS@ @PNG_CFLAGS@
- 
- # Common source files used by absolutely everything:
- 
-@@ -150,7 +151,9 @@ EXTRA_LIBS =                                               \
-                @LDFLAGS@                                   \
-                @SDL_LIBS@                                  \
-                @SDLMIXER_LIBS@                             \
--               @SDLNET_LIBS@
-+               @SDLNET_LIBS@                               \
-+               @SAMPLERATE_LIBS@                           \
-+               @PNG_LIBS@
- 
- if HAVE_WINDRES
- @PROGRAM_PREFIX at doom_SOURCES=$(SOURCE_FILES_WITH_DEH) resource.rc
-diff --git a/textscreen/Makefile.am b/textscreen/Makefile.am
-index 628d4ff..427ed40 100644
---- a/textscreen/Makefile.am
-+++ b/textscreen/Makefile.am
-@@ -1,5 +1,5 @@
- 
--AM_CFLAGS = -I$(top_srcdir)/src
-+AM_CFLAGS = -I$(top_srcdir)/src @SDL_CFLAGS@
- 
- CTAGS_ARGS=-I TXT_UNCAST_ARG+
- 
-diff --git a/textscreen/examples/Makefile.am b/textscreen/examples/Makefile.am
-index 4632d92..b857748 100644
---- a/textscreen/examples/Makefile.am
-+++ b/textscreen/examples/Makefile.am
-@@ -1,5 +1,5 @@
- 
--AM_CFLAGS =  -I$(top_srcdir)/src -I$(top_srcdir)/textscreen
-+AM_CFLAGS =  -I$(top_srcdir)/src -I$(top_srcdir)/textscreen @SDL_CFLAGS@
- 
- noinst_PROGRAMS=guitest calculator
- 
--- 
-2.1.4
-
diff --git a/package/chocolate-doom/Config.in b/package/chocolate-doom/Config.in
index 5e0d9c11ea..3ba520ad29 100644
--- a/package/chocolate-doom/Config.in
+++ b/package/chocolate-doom/Config.in
@@ -1,12 +1,16 @@
 config BR2_PACKAGE_CHOCOLATE_DOOM
 	bool "chocolate-doom"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_SDL
-	select BR2_PACKAGE_SDL_MIXER
-	select BR2_PACKAGE_SDL_NET
+	depends on !BR2_STATIC_LIBS # sdl2
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_SDL2_MIXER
+	select BR2_PACKAGE_SDL2_NET
 	help
 	  Chocolate Doom is a set of conservative source ports for Doom,
 	  Heretic, Hexen and Strife, with a philosophy of preserving the
 	  look, feel, and bugs of the vanilla versions of each.
 
 	  http://www.chocolate-doom.org
+
+comment "chocolate-doom needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/chocolate-doom/chocolate-doom.hash b/package/chocolate-doom/chocolate-doom.hash
index 6751c7d205..7f7fa27ab7 100644
--- a/package/chocolate-doom/chocolate-doom.hash
+++ b/package/chocolate-doom/chocolate-doom.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	3e6d1a82ac5c8b025a9695ce1e47d0dc6ed142ebb1129b1e4a70e2740f79150c	chocolate-doom-2.3.0.tar.gz
+sha256	73aea623930c7d18a7a778eea391e1ddfbe90ad1ac40a91b380afca4b0e1dab8	chocolate-doom-3.0.0.tar.gz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/chocolate-doom/chocolate-doom.mk b/package/chocolate-doom/chocolate-doom.mk
index 8c16a7fa30..4e0a8fee18 100644
--- a/package/chocolate-doom/chocolate-doom.mk
+++ b/package/chocolate-doom/chocolate-doom.mk
@@ -4,23 +4,15 @@
 #
 ################################################################################
 
-CHOCOLATE_DOOM_VERSION = 2.3.0
+CHOCOLATE_DOOM_VERSION = 3.0.0
 CHOCOLATE_DOOM_SITE = http://www.chocolate-doom.org/downloads/$(CHOCOLATE_DOOM_VERSION)
 CHOCOLATE_DOOM_LICENSE = GPL-2.0+
 CHOCOLATE_DOOM_LICENSE_FILES = COPYING
-CHOCOLATE_DOOM_DEPENDENCIES = host-pkgconf sdl sdl_mixer sdl_net
-
-# We're patching configure.ac, so we need to autoreconf
-CHOCOLATE_DOOM_AUTORECONF = YES
+CHOCOLATE_DOOM_DEPENDENCIES = host-pkgconf sdl2 sdl2_mixer sdl2_net
 
 # Avoid installing desktop entries, icons, etc.
 CHOCOLATE_DOOM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
 
-CHOCOLATE_DOOM_CONF_OPTS = \
-	--disable-sdltest \
-	--with-sdl-prefix=$(STAGING_DIR)/usr \
-	--with-sdl-exec-prefix=$(STAGING_DIR)/usr
-
 CHOCOLATE_DOOM_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-- 
2.23.0.rc1
