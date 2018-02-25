From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:06:46 +0100
Subject: [Buildroot] [git commit branch/next] package/mesa3d-demos: bump to
 8.4.0
Message-ID: <20180225210649.63BE888139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee5efb464418fb31c6c96434f4ede4f83f8afb0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use the new upstream url.
Added all hashes provided by upstream.
Rebase patch on top of 8.4.0 and convert it to git formated patch.
Add a comment above "MESA3D_DEMOS_AUTORECONF = YES"

See https://lists.freedesktop.org/archives/mesa-dev/2018-February/186542.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...demos-makes-opengl-an-optional-component.patch} | 56 ++++++++++++++--------
 package/mesa3d-demos/mesa3d-demos.hash             |  7 ++-
 package/mesa3d-demos/mesa3d-demos.mk               |  5 +-
 3 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/package/mesa3d-demos/0001-demos-optional-gl.patch b/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
similarity index 52%
rename from package/mesa3d-demos/0001-demos-optional-gl.patch
rename to package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
index 6470e9d8d9..b328fca810 100644
--- a/package/mesa3d-demos/0001-demos-optional-gl.patch
+++ b/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
@@ -1,12 +1,22 @@
-This patches makes opengl an optional component.
+From bb0ffae7164d296d32da24fa5499534de259169a Mon Sep 17 00:00:00 2001
+From: Spenser Gilliland <spenser@gillilanding.com>
+Date: Sat, 24 Feb 2018 11:36:17 +0100
+Subject: [PATCH] demos: makes opengl an optional component
 
 Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+[Romain: convert to git patch, rebase on 8.4.0]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
-Index: mesa3d-demos-8.1.0/configure.ac
-===================================================================
---- mesa3d-demos-8.1.0.orig/configure.ac
-+++ mesa3d-demos-8.1.0/configure.ac
-@@ -51,6 +51,14 @@
+ configure.ac               | 12 +++++++++++-
+ src/egl/opengl/Makefile.am |  2 ++
+ src/util/Makefile.am       |  2 ++
+ 3 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0b5e9a76..24298c44 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -51,6 +51,14 @@ m4_ifndef([PKG_PROG_PKG_CONFIG],
    ACLOCAL="aclocal -I/other/macro/dir" before running autoreconf.])])
  PKG_PROG_PKG_CONFIG()
  
@@ -21,7 +31,7 @@ Index: mesa3d-demos-8.1.0/configure.ac
  dnl Get the pkg-config definitions for libGL.  We include a fallback
  dnl path for GL implementation that don't provide a .pc file
  PKG_CHECK_MODULES(GL, [gl], [], [
-@@ -113,6 +121,8 @@
+@@ -112,6 +120,8 @@ PKG_CHECK_MODULES(GLU, [glu], [],
  DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
  DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
  
@@ -30,7 +40,7 @@ Index: mesa3d-demos-8.1.0/configure.ac
  AC_ARG_ENABLE([egl],
      [AS_HELP_STRING([--enable-egl],
          [enable EGL library @<:@default=auto@:>@])],
-@@ -303,7 +313,7 @@
+@@ -302,7 +312,7 @@ AC_SUBST([MESA_GLAPI])
  AC_SUBST([WAYLAND_CFLAGS])
  AC_SUBST([WAYLAND_LIBS])
  
@@ -39,29 +49,30 @@ Index: mesa3d-demos-8.1.0/configure.ac
  AM_CONDITIONAL(HAVE_EGL, test "x$egl_enabled" = "xyes")
  AM_CONDITIONAL(HAVE_GLESV1, test "x$glesv1_enabled" = "xyes")
  AM_CONDITIONAL(HAVE_GLESV2, test "x$glesv2_enabled" = "xyes")
-Index: mesa3d-demos-8.1.0/src/egl/opengl/Makefile.am
-===================================================================
---- mesa3d-demos-8.1.0.orig/src/egl/opengl/Makefile.am
-+++ mesa3d-demos-8.1.0/src/egl/opengl/Makefile.am
-@@ -50,12 +50,14 @@
+diff --git a/src/egl/opengl/Makefile.am b/src/egl/opengl/Makefile.am
+index 6d184ff6..219ab850 100644
+--- a/src/egl/opengl/Makefile.am
++++ b/src/egl/opengl/Makefile.am
+@@ -56,6 +56,7 @@ endif
  endif
  
  if HAVE_EGL
 +if HAVE_GL
+ bin_PROGRAMS = \
+ 	eglinfo
  noinst_PROGRAMS = \
- 	eglinfo \
- 	peglgears \
- 	$(EGL_DRM_DEMOS) \
- 	$(EGL_X11_DEMOS)
+@@ -64,6 +65,7 @@ noinst_PROGRAMS = \
+ 	$(EGL_X11_DEMOS) \
+ 	$(EGL_WL_DEMOS)
  endif
 +endif
  
  egltri_x11_SOURCES = egltri.c
  eglgears_x11_SOURCES = eglgears.c
-Index: mesa3d-demos-8.1.0/src/util/Makefile.am
-===================================================================
---- mesa3d-demos-8.1.0.orig/src/util/Makefile.am
-+++ mesa3d-demos-8.1.0/src/util/Makefile.am
+diff --git a/src/util/Makefile.am b/src/util/Makefile.am
+index 759a293a..012b9c75 100644
+--- a/src/util/Makefile.am
++++ b/src/util/Makefile.am
 @@ -27,7 +27,9 @@ AM_CFLAGS = \
  AM_LDFLAGS = \
  	$(DEMO_LIBS)
@@ -72,3 +83,6 @@ Index: mesa3d-demos-8.1.0/src/util/Makefile.am
  
  if HAVE_GLUT
  AM_CFLAGS += \
+-- 
+2.14.3
+
diff --git a/package/mesa3d-demos/mesa3d-demos.hash b/package/mesa3d-demos/mesa3d-demos.hash
index a50a3a1e0c..8a771df2f8 100644
--- a/package/mesa3d-demos/mesa3d-demos.hash
+++ b/package/mesa3d-demos/mesa3d-demos.hash
@@ -1,2 +1,5 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2015-December/000191.html
-sha256	c173154bbd0d5fb53d732471984def42fb1b14ac85fcb834138fb9518b3e0bef	mesa-demos-8.3.0.tar.bz2
+# From https://lists.freedesktop.org/archives/mesa-dev/2018-February/186542.html
+md5  6b65a02622765522176d00f553086fa3  mesa-demos-8.4.0.tar.bz2
+sha1 57ba892e919fa22ce3db9f25e7331a6fa33c652c  mesa-demos-8.4.0.tar.bz2
+sha256 01e99c94a0184e63e796728af89bfac559795fb2a0d6f506fa900455ca5fff7d  mesa-demos-8.4.0.tar.bz2
+sha512 b72d03cad36e0535ff18dcfb222ec4200064b9264f6da51a6e5f03b0dd912abe188bc1d600b6698de3ce6f63b28d2ce01565886ca8e7079edc4967fbf2fb0957  mesa-demos-8.4.0.tar.bz2
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index cbc15c3b69..52a1e2420a 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-MESA3D_DEMOS_VERSION = 8.3.0
+MESA3D_DEMOS_VERSION = 8.4.0
 MESA3D_DEMOS_SOURCE = mesa-demos-$(MESA3D_DEMOS_VERSION).tar.bz2
-MESA3D_DEMOS_SITE = ftp://ftp.freedesktop.org/pub/mesa/demos/$(MESA3D_DEMOS_VERSION)
+MESA3D_DEMOS_SITE = ftp://ftp.freedesktop.org/pub/mesa/demos
+# 0001-demos-makes-opengl-an-optional-component.patch
 MESA3D_DEMOS_AUTORECONF = YES
 MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
 MESA3D_DEMOS_LICENSE = MIT
