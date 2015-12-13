From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:32:56 +0100
Subject: [Buildroot] [git commit] package/mesa3d-demos: bump version to 8.3.0
Message-ID: <20151213134718.019CC817EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6bf44ee4ced7da1321297fc107e61048dff3a7a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently buildroot lacks glut support so add configure options to
disable glut support, also disable osmesa support because it also
depends on glut.

Re-numbered and rebased 0001-demos-optional-gl.patch

Removed patches:
- 0001-demos-non-mesa-impl.patch
All files related to this patch have been removed upstream:
http://cgit.freedesktop.org/mesa/demos/commit/?id=74443c6ee79f3251f643ea05e94df58183e37d0d

- 0003-demos-x11-fix.patch
Applied upstream:
http://cgit.freedesktop.org/mesa/demos/commit/?id=6f7ad3f242943242021d1c42c6ed6933b76137fd

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../mesa3d-demos/0001-demos-non-mesa-impl.patch    | 244 ---------------------
 ...ional-gl.patch => 0001-demos-optional-gl.patch} |  22 +-
 package/mesa3d-demos/0003-demos-x11-fix.patch      |  30 ---
 package/mesa3d-demos/mesa3d-demos.hash             |   4 +-
 package/mesa3d-demos/mesa3d-demos.mk               |   4 +-
 5 files changed, 17 insertions(+), 287 deletions(-)

diff --git a/package/mesa3d-demos/0001-demos-non-mesa-impl.patch b/package/mesa3d-demos/0001-demos-non-mesa-impl.patch
deleted file mode 100644
index d370929..0000000
--- a/package/mesa3d-demos/0001-demos-non-mesa-impl.patch
+++ /dev/null
@@ -1,244 +0,0 @@
-This makes it possible to build the demos against opengl
-implementations other than Mesa 
-
-Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
----
-Index: mesa3d-demos-8.1.0/src/egl/eglut/eglut.c
-===================================================================
---- mesa3d-demos-8.1.0.orig/src/egl/eglut/eglut.c
-+++ mesa3d-demos-8.1.0/src/egl/eglut/eglut.c
-@@ -76,8 +76,9 @@ _eglutNow(void)
- static void
- _eglutDestroyWindow(struct eglut_window *win)
- {
--   if (_eglut->surface_type != EGL_PBUFFER_BIT &&
--       _eglut->surface_type != EGL_SCREEN_BIT_MESA)
-+
-+   if (_eglut->surface_type == EGL_WINDOW_BIT ||
-+       _eglut->surface_type == EGL_PIXMAP_BIT)
-       eglDestroySurface(_eglut->dpy, win->surface);
- 
-    _eglutNativeFiniWindow(win);
-@@ -175,7 +176,9 @@ _eglutCreateWindow(const char *title, in
-             win->config, win->native.u.pixmap, NULL);
-       break;
-    case EGL_PBUFFER_BIT:
-+#ifdef EGL_MESA_screen_surface
-    case EGL_SCREEN_BIT_MESA:
-+#endif
-       win->surface = win->native.u.surface;
-       break;
-    default:
-@@ -289,8 +292,10 @@ eglutDestroyWindow(int win)
-    if (window->index != win)
-       return;
- 
-+#ifdef EGL_MESA_screen_surface
-    /* XXX it causes some bug in st/egl KMS backend */
-    if ( _eglut->surface_type != EGL_SCREEN_BIT_MESA)
-+#endif
-       eglMakeCurrent(_eglut->dpy, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
- 
-    _eglutDestroyWindow(_eglut->current);
-Index: mesa3d-demos-8.1.0/src/egl/eglut/eglut_screen.c
-===================================================================
---- mesa3d-demos-8.1.0.orig/src/egl/eglut/eglut_screen.c
-+++ mesa3d-demos-8.1.0/src/egl/eglut/eglut_screen.c
-@@ -35,26 +35,33 @@
- 
- #define MAX_MODES 100
- 
-+#ifdef EGL_MESA_screen_surface
- static EGLScreenMESA kms_screen;
- static EGLModeMESA kms_mode;
- static EGLint kms_width, kms_height;
-+#endif
- 
- void
- _eglutNativeInitDisplay(void)
- {
-+#ifdef EGL_MESA_screen_surface
-    _eglut->native_dpy = EGL_DEFAULT_DISPLAY;
-    _eglut->surface_type = EGL_SCREEN_BIT_MESA;
-+#endif
- }
- 
- void
- _eglutNativeFiniDisplay(void)
- {
-+#ifdef EGL_MESA_screen_surface
-    kms_screen = 0;
-    kms_mode = 0;
-    kms_width = 0;
-    kms_height = 0;
-+#endif
- }
- 
-+#ifdef EGL_MESA_screen_surface
- static void
- init_kms(void)
- {
-@@ -94,19 +101,23 @@ init_kms(void)
-    kms_width = width;
-    kms_height = height;
- }
-+#endif
- 
- void
- _eglutNativeInitWindow(struct eglut_window *win, const char *title,
-                        int x, int y, int w, int h)
- {
-+#ifdef EGL_MESA_screen_surface
-    EGLint surf_attribs[16];
-    EGLint i;
-+#endif
-    const char *exts;
- 
-    exts = eglQueryString(_eglut->dpy, EGL_EXTENSIONS);
-    if (!exts || !strstr(exts, "EGL_MESA_screen_surface"))
-       _eglutFatal("EGL_MESA_screen_surface is not supported\n");
- 
-+#ifdef EGL_MESA_screen_surface
-    init_kms();
- 
-    i = 0;
-@@ -128,14 +139,17 @@ _eglutNativeInitWindow(struct eglut_wind
- 
-    win->native.width = kms_width;
-    win->native.height = kms_height;
-+#endif
- }
- 
- void
- _eglutNativeFiniWindow(struct eglut_window *win)
- {
-+#ifdef EGL_MESA_screen_surface
-    eglShowScreenSurfaceMESA(_eglut->dpy,
-          kms_screen, EGL_NO_SURFACE, 0);
-    eglDestroySurface(_eglut->dpy, win->native.u.surface);
-+#endif
- }
- 
- void
-Index: mesa3d-demos-8.1.0/src/egl/opengl/demo1.c
-===================================================================
---- mesa3d-demos-8.1.0.orig/src/egl/opengl/demo1.c
-+++ mesa3d-demos-8.1.0/src/egl/opengl/demo1.c
-@@ -18,6 +18,7 @@
- static void
- TestScreens(EGLDisplay dpy)
- {
-+#ifdef EGL_MESA_screen_surface
- #define MAX 8
-    EGLScreenMESA screens[MAX];
-    EGLint numScreens;
-@@ -28,6 +29,7 @@ TestScreens(EGLDisplay dpy)
-    for (i = 0; i < numScreens; i++) {
-       printf(" Screen %d handle: %d\n", i, (int) screens[i]);
-    }
-+#endif
- }
- 
- /**
-Index: mesa3d-demos-8.1.0/src/egl/opengl/demo2.c
-===================================================================
---- mesa3d-demos-8.1.0.orig/src/egl/opengl/demo2.c
-+++ mesa3d-demos-8.1.0/src/egl/opengl/demo2.c
-@@ -16,6 +16,7 @@
- 
- /*#define FRONTBUFFER*/
- 
-+#ifdef EGL_MESA_screen_surface
- static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2,
-                           GLfloat r, GLfloat g, GLfloat b)
- {
-@@ -95,12 +96,13 @@ TestScreens(EGLDisplay dpy)
-       printf(" Screen %d handle: %d\n", i, (int) screens[i]);
-    }
- }
--
-+#endif
- 
- int
- main(int argc, char *argv[])
- {
-    int maj, min;
-+#ifdef EGL_MESA_screen_surface
-    EGLContext ctx;
-    EGLSurface pbuffer, screen_surf;
-    EGLConfig configs[10];
-@@ -115,6 +117,7 @@ main(int argc, char *argv[])
-    EGLModeMESA mode;
-    EGLScreenMESA screen;
-    EGLint count;
-+#endif
- 
-    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
-    assert(d);
-@@ -132,6 +135,7 @@ main(int argc, char *argv[])
-       exit(1);
-    }
- 
-+#ifdef EGL_MESA_screen_surface
-    eglGetConfigs(d, configs, 10, &numConfigs);
-    printf("Got %d EGL configs:\n", numConfigs);
-    for (i = 0; i < numConfigs; i++) {
-@@ -211,6 +215,7 @@ main(int argc, char *argv[])
-    eglDestroySurface(d, pbuffer);
-    eglDestroyContext(d, ctx);
-    eglTerminate(d);
-+#endif
- 
-    return 0;
- }
-Index: mesa3d-demos-8.1.0/src/egl/opengl/demo3.c
-===================================================================
---- mesa3d-demos-8.1.0.orig/src/egl/opengl/demo3.c
-+++ mesa3d-demos-8.1.0/src/egl/opengl/demo3.c
-@@ -46,7 +46,7 @@ GLubyte OpenGL_bits[] = {
-    0x3e, 0x00, 0x00, 0xf8, 0x0c, 0x00, 
- };
- 
--
-+#ifdef EGL_MESA_screen_surface
- static void Init(void)
- {
- 
-@@ -551,11 +551,13 @@ write_ppm(const char *filename, const GL
-       fclose(f);
-    }
- }
-+#endif
- 
- int
- main(int argc, char *argv[])
- {
-    int maj, min;
-+#ifdef EGL_MESA_screen_surface
-    EGLContext ctx;
-    EGLSurface screen_surf;
-    EGLConfig configs[10];
-@@ -566,6 +568,7 @@ main(int argc, char *argv[])
-    const GLubyte *bitmap;
-    EGLint screenAttribs[32];
-    EGLint i;
-+#endif
- 
-    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
-    assert(d);
-@@ -583,6 +586,7 @@ main(int argc, char *argv[])
-       exit(1);
-    }
- 
-+#ifdef EGL_MESA_screen_surface
-    eglGetConfigs(d, configs, 10, &numConfigs);
-    eglGetScreensMESA(d, &screen, 1, &count);
-    eglGetModesMESA(d, screen, &mode, 1, &count);
-@@ -642,6 +646,7 @@ main(int argc, char *argv[])
-    eglDestroySurface(d, screen_surf);
-    eglDestroyContext(d, ctx);
-    eglTerminate(d);
-+#endif
- 
-    return 0;
- }
diff --git a/package/mesa3d-demos/0002-demos-optional-gl.patch b/package/mesa3d-demos/0001-demos-optional-gl.patch
similarity index 81%
rename from package/mesa3d-demos/0002-demos-optional-gl.patch
rename to package/mesa3d-demos/0001-demos-optional-gl.patch
index b198531..0415bbc 100644
--- a/package/mesa3d-demos/0002-demos-optional-gl.patch
+++ b/package/mesa3d-demos/0001-demos-optional-gl.patch
@@ -6,7 +6,7 @@ Index: mesa3d-demos-8.1.0/configure.ac
 ===================================================================
 --- mesa3d-demos-8.1.0.orig/configure.ac
 +++ mesa3d-demos-8.1.0/configure.ac
-@@ -51,6 +51,14 @@ m4_ifndef([PKG_PROG_PKG_CONFIG],
+@@ -51,6 +51,14 @@
    ACLOCAL="aclocal -I/other/macro/dir" before running autoreconf.])])
  PKG_PROG_PKG_CONFIG()
  
@@ -21,7 +21,7 @@ Index: mesa3d-demos-8.1.0/configure.ac
  dnl Get the pkg-config definitions for libGL.  We include a fallback
  dnl path for GL implementation that don't provide a .pc file
  PKG_CHECK_MODULES(GL, [gl], [], [
-@@ -103,6 +111,8 @@ PKG_CHECK_MODULES(GLU, [glu], [],
+@@ -113,6 +121,8 @@
  DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
  DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
  
@@ -29,8 +29,8 @@ Index: mesa3d-demos-8.1.0/configure.ac
 +
  AC_ARG_ENABLE([egl],
      [AS_HELP_STRING([--enable-egl],
-         [enable EGL library @<:@default=no@:>@])],
-@@ -287,7 +297,7 @@ AC_SUBST([MESA_GLAPI])
+         [enable EGL library @<:@default=auto@:>@])],
+@@ -303,7 +313,7 @@
  AC_SUBST([WAYLAND_CFLAGS])
  AC_SUBST([WAYLAND_LIBS])
  
@@ -43,22 +43,21 @@ Index: mesa3d-demos-8.1.0/src/egl/opengl/Makefile.am
 ===================================================================
 --- mesa3d-demos-8.1.0.orig/src/egl/opengl/Makefile.am
 +++ mesa3d-demos-8.1.0/src/egl/opengl/Makefile.am
-@@ -50,6 +50,7 @@ endif
+@@ -50,12 +50,14 @@
  endif
  
  if HAVE_EGL
 +if HAVE_GL
  noinst_PROGRAMS = \
- 	demo1 \
- 	demo2 \
-@@ -61,6 +62,7 @@ noinst_PROGRAMS = \
+ 	eglinfo \
+ 	peglgears \
  	$(EGL_DRM_DEMOS) \
  	$(EGL_X11_DEMOS)
  endif
 +endif
  
- egltri_screen_SOURCES = egltri.c
- eglgears_screen_SOURCES = eglgears.c
+ egltri_x11_SOURCES = egltri.c
+ eglgears_x11_SOURCES = eglgears.c
 Index: mesa3d-demos-8.1.0/src/util/Makefile.am
 ===================================================================
 --- mesa3d-demos-8.1.0.orig/src/util/Makefile.am
@@ -73,3 +72,6 @@ Index: mesa3d-demos-8.1.0/src/util/Makefile.am
  
  if HAVE_GLUT
  AM_CFLAGS += \
+diff -uNr mesa-demos-8.3.0.org/configure.ac mesa-demos-8.3.0/configure.ac
+--- mesa-demos-8.3.0.org/configure.ac	2015-12-09 22:06:44.000000000 +0100
++++ mesa-demos-8.3.0/configure.ac	2015-12-12 17:06:10.484295811 +0100
diff --git a/package/mesa3d-demos/0003-demos-x11-fix.patch b/package/mesa3d-demos/0003-demos-x11-fix.patch
deleted file mode 100644
index f6b3b0c..0000000
--- a/package/mesa3d-demos/0003-demos-x11-fix.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-This patch ensures that programs which depend on x11 are not build if x11
-is not available.
-
-Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
----
-Index: mesa3d-demos-8.1.0/src/egl/opengles2/Makefile.am
-===================================================================
---- mesa3d-demos-8.1.0.orig/src/egl/opengles2/Makefile.am
-+++ mesa3d-demos-8.1.0/src/egl/opengles2/Makefile.am
-@@ -35,9 +35,10 @@ AM_LDFLAGS = \
- 
- if HAVE_EGL
- if HAVE_GLESV2
--bin_PROGRAMS = \
-+bin_PROGRAMS = es2gears_screen
-+if HAVE_X11
-+bin_PROGRAMS += \
- 	es2_info \
--	es2gears_screen \
- 	es2gears_x11 \
- 	es2tri
- if HAVE_WAYLAND
-@@ -45,6 +46,7 @@ bin_PROGRAMS += es2gears_wayland
- endif
- endif
- endif
-+endif
- 
- es2_info_LDADD = $(X11_LIBS)
- es2tri_LDADD = $(X11_LIBS)
diff --git a/package/mesa3d-demos/mesa3d-demos.hash b/package/mesa3d-demos/mesa3d-demos.hash
index 17db1b0..a50a3a1 100644
--- a/package/mesa3d-demos/mesa3d-demos.hash
+++ b/package/mesa3d-demos/mesa3d-demos.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f90ba92	mesa-demos-8.2.0.tar.bz2
+# From http://lists.freedesktop.org/archives/mesa-announce/2015-December/000191.html
+sha256	c173154bbd0d5fb53d732471984def42fb1b14ac85fcb834138fb9518b3e0bef	mesa-demos-8.3.0.tar.bz2
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 2db7f56..c0f889a 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-MESA3D_DEMOS_VERSION = 8.2.0
+MESA3D_DEMOS_VERSION = 8.3.0
 MESA3D_DEMOS_SOURCE = mesa-demos-$(MESA3D_DEMOS_VERSION).tar.bz2
 MESA3D_DEMOS_SITE = ftp://ftp.freedesktop.org/pub/mesa/demos/$(MESA3D_DEMOS_VERSION)
 MESA3D_DEMOS_AUTORECONF = YES
 MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
 MESA3D_DEMOS_LICENSE = MIT
 
+MESA3D_DEMOS_CONF_OPTS += --without-glut --disable-osmesa
+
 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
 MESA3D_DEMOS_DEPENDENCIES += libgl libglew libglu xlib_libX11 xlib_libXext
 MESA3D_DEMOS_CONF_OPTS += --enable-gl --enable-x11
