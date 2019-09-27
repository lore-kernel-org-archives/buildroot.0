From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:14:57 +0200
Subject: [Buildroot] [git commit] package/sdl2_ttf: bump to version 2.0.15
Message-ID: <20190927211455.92F818F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bef0879162de8a0cbd6dcfccebeefefb87b8a9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch 0001-fix-opengl-detection.patch is removed because it is now
upstream. Thanks to this, autoreconf is no longer needed, which allows
us to drop AUTORECONF = YES and the 0002-fix-autoreconfig.patch which
was only needed to fix autoreconf.

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
[Thomas: improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2_ttf/0001-fix-opengl-detection.patch | 37 ------------------------
 package/sdl2_ttf/0002-fix-autoreconf.patch       | 30 -------------------
 package/sdl2_ttf/sdl2_ttf.hash                   |  4 +--
 package/sdl2_ttf/sdl2_ttf.mk                     |  5 +---
 4 files changed, 3 insertions(+), 73 deletions(-)

diff --git a/package/sdl2_ttf/0001-fix-opengl-detection.patch b/package/sdl2_ttf/0001-fix-opengl-detection.patch
deleted file mode 100644
index 06e0abf8b9..0000000000
--- a/package/sdl2_ttf/0001-fix-opengl-detection.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-# HG changeset patch
-# User Sam Lantinga <slouken@libsdl.org>
-# Date 1485568474 28800
-# Node ID 3b93536d291a34183592fd29ef1df9cf1416ac09
-# Parent  184c34c673d479477d34194e3c0b1abe7ca5d828
-Make sure we can link with OpenGL libraries in the OpenGL configure test
-
-[yann.morin.1998 at free.fr:
-  - backported from upstream
-  - drop the configure hunk for autoreconf
-]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -r 184c34c673d4 -r 3b93536d291a configure.in
---- a/configure.in	Sun Jan 01 18:46:38 2017 -0800
-+++ b/configure.in	Fri Jan 27 17:54:34 2017 -0800
-@@ -164,14 +164,17 @@
- esac
- AC_MSG_CHECKING(for OpenGL support)
- have_opengl=no
--AC_TRY_COMPILE([
-+save_LIBS="$LIBS"
-+LIBS="$LIBS $SYS_GL_LIBS"
-+AC_TRY_LINK([
-  #include "SDL_opengl.h"
- ],[
-- GLuint texture;
-+ glOrtho( -2.0, 2.0, -2.0, 2.0, -20.0, 20.0 );
- ],[
- have_opengl=yes
- ])
- AC_MSG_RESULT($have_opengl)
-+LIBS="$save_LIBS"
- if test x$have_opengl = xyes; then
-     CFLAGS="$CFLAGS -DHAVE_OPENGL"
-     GL_LIBS="$SYS_GL_LIBS"
-
diff --git a/package/sdl2_ttf/0002-fix-autoreconf.patch b/package/sdl2_ttf/0002-fix-autoreconf.patch
deleted file mode 100644
index 88543a9491..0000000000
--- a/package/sdl2_ttf/0002-fix-autoreconf.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-# HG changeset patch
-# User "Yann E. MORIN" <yann.morin.1998@free.fr>
-# Date 1485597428 -3600
-# Node ID 26376ce4a3e6565885fd984b3fe5a39a6895dcdd
-# Parent  3b93536d291a34183592fd29ef1df9cf1416ac09
-configure: fix autoreconf
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/configure.in b/configure.in
---- a/configure.in
-+++ b/configure.in
-@@ -1,5 +1,6 @@
- dnl Process this file with autoconf to produce a configure script.
--AC_INIT(README.txt)
-+dnl The version string must be a literal
-+AC_INIT([SDL2_ttf],[2.0.14])
- 
- dnl Set various version strings - taken gratefully from the GTk sources
- 
-@@ -42,7 +42,7 @@
- AC_CANONICAL_HOST
- 
- dnl Setup for automake
--AM_INIT_AUTOMAKE(SDL2_ttf, $VERSION)
-+AM_INIT_AUTOMAKE([foreign])
- 
- dnl Check for tools
- AC_PROG_LIBTOOL
-
diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 515189afd9..4559ccec62 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59acc768ab62fe39276  SDL2_ttf-2.0.14.tar.gz
+# Locally calculated 
+sha256 a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33  SDL2_ttf-2.0.15.tar.gz
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index dbe30dd544..326cb99366 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.0.14
+SDL2_TTF_VERSION = 2.0.15
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
@@ -12,9 +12,6 @@ SDL2_TTF_LICENSE_FILES = COPYING.txt
 SDL2_TTF_INSTALL_STAGING = YES
 SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
 
-# Two patches touching configure.in
-SDL2_TTF_AUTORECONF = YES
-
 SDL2_TTF_CONF_ENV = \
 	FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
