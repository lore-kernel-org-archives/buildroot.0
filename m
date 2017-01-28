From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 23:31:34 +1300
Subject: [Buildroot] [git commit] package/sdl2_ttf: fix detection of OpenGL
Message-ID: <20170128103251.4004C81EA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd869112a45eb2f9044ee784b37de95979f23f4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a opatch from upstream to preoperly detect OpenGL, add patch to
fix autoreconf.

Fixes:
    http://autobuild.buildroot.org/results/be9/be9d9d0d75dca62d9edb28c1e4d81f7f33b30ea8/
    http://autobuild.buildroot.org/results/db8/db87a00a7cd1f8d1627fa4a39a0f67e9328b2b0f/
    http://autobuild.buildroot.org/results/f45/f45a9588090c296c9c5ece2cbc71f8bb64bebf73/
    http://autobuild.buildroot.org/results/9cb/9cb669ab6760420421e3c907462b69fe36c46601/
    and many others...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl2_ttf/0001-fix-opengl-detection.patch | 37 ++++++++++++++++++++++++
 package/sdl2_ttf/0002-fix-autoreconf.patch       | 30 +++++++++++++++++++
 package/sdl2_ttf/sdl2_ttf.mk                     |  4 +++
 3 files changed, 71 insertions(+)

diff --git a/package/sdl2_ttf/0001-fix-opengl-detection.patch b/package/sdl2_ttf/0001-fix-opengl-detection.patch
new file mode 100644
index 0000000..06e0abf
--- /dev/null
+++ b/package/sdl2_ttf/0001-fix-opengl-detection.patch
@@ -0,0 +1,37 @@
+# HG changeset patch
+# User Sam Lantinga <slouken@libsdl.org>
+# Date 1485568474 28800
+# Node ID 3b93536d291a34183592fd29ef1df9cf1416ac09
+# Parent  184c34c673d479477d34194e3c0b1abe7ca5d828
+Make sure we can link with OpenGL libraries in the OpenGL configure test
+
+[yann.morin.1998 at free.fr:
+  - backported from upstream
+  - drop the configure hunk for autoreconf
+]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -r 184c34c673d4 -r 3b93536d291a configure.in
+--- a/configure.in	Sun Jan 01 18:46:38 2017 -0800
++++ b/configure.in	Fri Jan 27 17:54:34 2017 -0800
+@@ -164,14 +164,17 @@
+ esac
+ AC_MSG_CHECKING(for OpenGL support)
+ have_opengl=no
+-AC_TRY_COMPILE([
++save_LIBS="$LIBS"
++LIBS="$LIBS $SYS_GL_LIBS"
++AC_TRY_LINK([
+  #include "SDL_opengl.h"
+ ],[
+- GLuint texture;
++ glOrtho( -2.0, 2.0, -2.0, 2.0, -20.0, 20.0 );
+ ],[
+ have_opengl=yes
+ ])
+ AC_MSG_RESULT($have_opengl)
++LIBS="$save_LIBS"
+ if test x$have_opengl = xyes; then
+     CFLAGS="$CFLAGS -DHAVE_OPENGL"
+     GL_LIBS="$SYS_GL_LIBS"
+
diff --git a/package/sdl2_ttf/0002-fix-autoreconf.patch b/package/sdl2_ttf/0002-fix-autoreconf.patch
new file mode 100644
index 0000000..88543a9
--- /dev/null
+++ b/package/sdl2_ttf/0002-fix-autoreconf.patch
@@ -0,0 +1,30 @@
+# HG changeset patch
+# User "Yann E. MORIN" <yann.morin.1998@free.fr>
+# Date 1485597428 -3600
+# Node ID 26376ce4a3e6565885fd984b3fe5a39a6895dcdd
+# Parent  3b93536d291a34183592fd29ef1df9cf1416ac09
+configure: fix autoreconf
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/configure.in b/configure.in
+--- a/configure.in
++++ b/configure.in
+@@ -1,5 +1,6 @@
+ dnl Process this file with autoconf to produce a configure script.
+-AC_INIT(README.txt)
++dnl The version string must be a literal
++AC_INIT([SDL2_ttf],[2.0.14])
+ 
+ dnl Set various version strings - taken gratefully from the GTk sources
+ 
+@@ -42,7 +42,7 @@
+ AC_CANONICAL_HOST
+ 
+ dnl Setup for automake
+-AM_INIT_AUTOMAKE(SDL2_ttf, $VERSION)
++AM_INIT_AUTOMAKE([foreign])
+ 
+ dnl Check for tools
+ AC_PROG_LIBTOOL
+
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 6834d16..86916c3 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -11,6 +11,10 @@ SDL2_TTF_LICENSE = zlib
 SDL2_TTF_LICENSE_FILES = COPYING.txt
 SDL2_TTF_INSTALL_STAGING = YES
 SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
+
+# Two patches touching configure.in
+SDL2_TTF_AUTORECONF = YES
+
 SDL2_TTF_CONF_ENV = \
 	FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
