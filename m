From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:05:30 +0100
Subject: [Buildroot] [git commit] mesa3d-demos: new package
Message-ID: <20141026210600.63D63B08BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8011e4ffc590014dd24d310c7dde3a900d270cb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - add license information, even if there's unfortunately no license
   file
 - rename patches to use the correct convention.]

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 .../mesa3d-demos/0001-demos-non-mesa-impl.patch    |  244 ++++++++++++++++++++
 package/mesa3d-demos/0002-demos-optional-gl.patch  |   75 ++++++
 package/mesa3d-demos/0003-demos-x11-fix.patch      |   30 +++
 package/mesa3d-demos/Config.in                     |    8 +
 package/mesa3d-demos/mesa3d-demos.mk               |   63 +++++
 6 files changed, 421 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 33d270c..8865c1e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -188,6 +188,7 @@ comment "Graphic applications"
 	source "package/fswebcam/Config.in"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
+	source "package/mesa3d-demos/Config.in"
 	source "package/rrdtool/Config.in"
 
 comment "Graphic libraries"
diff --git a/package/mesa3d-demos/0001-demos-non-mesa-impl.patch b/package/mesa3d-demos/0001-demos-non-mesa-impl.patch
new file mode 100644
index 0000000..d370929
--- /dev/null
+++ b/package/mesa3d-demos/0001-demos-non-mesa-impl.patch
@@ -0,0 +1,244 @@
+This makes it possible to build the demos against opengl
+implementations other than Mesa 
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+---
+Index: mesa3d-demos-8.1.0/src/egl/eglut/eglut.c
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/eglut/eglut.c
++++ mesa3d-demos-8.1.0/src/egl/eglut/eglut.c
+@@ -76,8 +76,9 @@ _eglutNow(void)
+ static void
+ _eglutDestroyWindow(struct eglut_window *win)
+ {
+-   if (_eglut->surface_type != EGL_PBUFFER_BIT &&
+-       _eglut->surface_type != EGL_SCREEN_BIT_MESA)
++
++   if (_eglut->surface_type == EGL_WINDOW_BIT ||
++       _eglut->surface_type == EGL_PIXMAP_BIT)
+       eglDestroySurface(_eglut->dpy, win->surface);
+ 
+    _eglutNativeFiniWindow(win);
+@@ -175,7 +176,9 @@ _eglutCreateWindow(const char *title, in
+             win->config, win->native.u.pixmap, NULL);
+       break;
+    case EGL_PBUFFER_BIT:
++#ifdef EGL_MESA_screen_surface
+    case EGL_SCREEN_BIT_MESA:
++#endif
+       win->surface = win->native.u.surface;
+       break;
+    default:
+@@ -289,8 +292,10 @@ eglutDestroyWindow(int win)
+    if (window->index != win)
+       return;
+ 
++#ifdef EGL_MESA_screen_surface
+    /* XXX it causes some bug in st/egl KMS backend */
+    if ( _eglut->surface_type != EGL_SCREEN_BIT_MESA)
++#endif
+       eglMakeCurrent(_eglut->dpy, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
+ 
+    _eglutDestroyWindow(_eglut->current);
+Index: mesa3d-demos-8.1.0/src/egl/eglut/eglut_screen.c
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/eglut/eglut_screen.c
++++ mesa3d-demos-8.1.0/src/egl/eglut/eglut_screen.c
+@@ -35,26 +35,33 @@
+ 
+ #define MAX_MODES 100
+ 
++#ifdef EGL_MESA_screen_surface
+ static EGLScreenMESA kms_screen;
+ static EGLModeMESA kms_mode;
+ static EGLint kms_width, kms_height;
++#endif
+ 
+ void
+ _eglutNativeInitDisplay(void)
+ {
++#ifdef EGL_MESA_screen_surface
+    _eglut->native_dpy = EGL_DEFAULT_DISPLAY;
+    _eglut->surface_type = EGL_SCREEN_BIT_MESA;
++#endif
+ }
+ 
+ void
+ _eglutNativeFiniDisplay(void)
+ {
++#ifdef EGL_MESA_screen_surface
+    kms_screen = 0;
+    kms_mode = 0;
+    kms_width = 0;
+    kms_height = 0;
++#endif
+ }
+ 
++#ifdef EGL_MESA_screen_surface
+ static void
+ init_kms(void)
+ {
+@@ -94,19 +101,23 @@ init_kms(void)
+    kms_width = width;
+    kms_height = height;
+ }
++#endif
+ 
+ void
+ _eglutNativeInitWindow(struct eglut_window *win, const char *title,
+                        int x, int y, int w, int h)
+ {
++#ifdef EGL_MESA_screen_surface
+    EGLint surf_attribs[16];
+    EGLint i;
++#endif
+    const char *exts;
+ 
+    exts = eglQueryString(_eglut->dpy, EGL_EXTENSIONS);
+    if (!exts || !strstr(exts, "EGL_MESA_screen_surface"))
+       _eglutFatal("EGL_MESA_screen_surface is not supported\n");
+ 
++#ifdef EGL_MESA_screen_surface
+    init_kms();
+ 
+    i = 0;
+@@ -128,14 +139,17 @@ _eglutNativeInitWindow(struct eglut_wind
+ 
+    win->native.width = kms_width;
+    win->native.height = kms_height;
++#endif
+ }
+ 
+ void
+ _eglutNativeFiniWindow(struct eglut_window *win)
+ {
++#ifdef EGL_MESA_screen_surface
+    eglShowScreenSurfaceMESA(_eglut->dpy,
+          kms_screen, EGL_NO_SURFACE, 0);
+    eglDestroySurface(_eglut->dpy, win->native.u.surface);
++#endif
+ }
+ 
+ void
+Index: mesa3d-demos-8.1.0/src/egl/opengl/demo1.c
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/opengl/demo1.c
++++ mesa3d-demos-8.1.0/src/egl/opengl/demo1.c
+@@ -18,6 +18,7 @@
+ static void
+ TestScreens(EGLDisplay dpy)
+ {
++#ifdef EGL_MESA_screen_surface
+ #define MAX 8
+    EGLScreenMESA screens[MAX];
+    EGLint numScreens;
+@@ -28,6 +29,7 @@ TestScreens(EGLDisplay dpy)
+    for (i = 0; i < numScreens; i++) {
+       printf(" Screen %d handle: %d\n", i, (int) screens[i]);
+    }
++#endif
+ }
+ 
+ /**
+Index: mesa3d-demos-8.1.0/src/egl/opengl/demo2.c
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/opengl/demo2.c
++++ mesa3d-demos-8.1.0/src/egl/opengl/demo2.c
+@@ -16,6 +16,7 @@
+ 
+ /*#define FRONTBUFFER*/
+ 
++#ifdef EGL_MESA_screen_surface
+ static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2,
+                           GLfloat r, GLfloat g, GLfloat b)
+ {
+@@ -95,12 +96,13 @@ TestScreens(EGLDisplay dpy)
+       printf(" Screen %d handle: %d\n", i, (int) screens[i]);
+    }
+ }
+-
++#endif
+ 
+ int
+ main(int argc, char *argv[])
+ {
+    int maj, min;
++#ifdef EGL_MESA_screen_surface
+    EGLContext ctx;
+    EGLSurface pbuffer, screen_surf;
+    EGLConfig configs[10];
+@@ -115,6 +117,7 @@ main(int argc, char *argv[])
+    EGLModeMESA mode;
+    EGLScreenMESA screen;
+    EGLint count;
++#endif
+ 
+    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
+    assert(d);
+@@ -132,6 +135,7 @@ main(int argc, char *argv[])
+       exit(1);
+    }
+ 
++#ifdef EGL_MESA_screen_surface
+    eglGetConfigs(d, configs, 10, &numConfigs);
+    printf("Got %d EGL configs:\n", numConfigs);
+    for (i = 0; i < numConfigs; i++) {
+@@ -211,6 +215,7 @@ main(int argc, char *argv[])
+    eglDestroySurface(d, pbuffer);
+    eglDestroyContext(d, ctx);
+    eglTerminate(d);
++#endif
+ 
+    return 0;
+ }
+Index: mesa3d-demos-8.1.0/src/egl/opengl/demo3.c
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/opengl/demo3.c
++++ mesa3d-demos-8.1.0/src/egl/opengl/demo3.c
+@@ -46,7 +46,7 @@ GLubyte OpenGL_bits[] = {
+    0x3e, 0x00, 0x00, 0xf8, 0x0c, 0x00, 
+ };
+ 
+-
++#ifdef EGL_MESA_screen_surface
+ static void Init(void)
+ {
+ 
+@@ -551,11 +551,13 @@ write_ppm(const char *filename, const GL
+       fclose(f);
+    }
+ }
++#endif
+ 
+ int
+ main(int argc, char *argv[])
+ {
+    int maj, min;
++#ifdef EGL_MESA_screen_surface
+    EGLContext ctx;
+    EGLSurface screen_surf;
+    EGLConfig configs[10];
+@@ -566,6 +568,7 @@ main(int argc, char *argv[])
+    const GLubyte *bitmap;
+    EGLint screenAttribs[32];
+    EGLint i;
++#endif
+ 
+    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
+    assert(d);
+@@ -583,6 +586,7 @@ main(int argc, char *argv[])
+       exit(1);
+    }
+ 
++#ifdef EGL_MESA_screen_surface
+    eglGetConfigs(d, configs, 10, &numConfigs);
+    eglGetScreensMESA(d, &screen, 1, &count);
+    eglGetModesMESA(d, screen, &mode, 1, &count);
+@@ -642,6 +646,7 @@ main(int argc, char *argv[])
+    eglDestroySurface(d, screen_surf);
+    eglDestroyContext(d, ctx);
+    eglTerminate(d);
++#endif
+ 
+    return 0;
+ }
diff --git a/package/mesa3d-demos/0002-demos-optional-gl.patch b/package/mesa3d-demos/0002-demos-optional-gl.patch
new file mode 100644
index 0000000..b198531
--- /dev/null
+++ b/package/mesa3d-demos/0002-demos-optional-gl.patch
@@ -0,0 +1,75 @@
+This patches makes opengl an optional component.
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+---
+Index: mesa3d-demos-8.1.0/configure.ac
+===================================================================
+--- mesa3d-demos-8.1.0.orig/configure.ac
++++ mesa3d-demos-8.1.0/configure.ac
+@@ -51,6 +51,14 @@ m4_ifndef([PKG_PROG_PKG_CONFIG],
+   ACLOCAL="aclocal -I/other/macro/dir" before running autoreconf.])])
+ PKG_PROG_PKG_CONFIG()
+ 
++AC_ARG_ENABLE([gl],
++    [AS_HELP_STRING([--enable-gl],
++        [enable GL library @<:@default=no@:>@])],
++    [gl_enabled="$enableval"],
++    [gl_enabled=auto])
++
++if test "x$gl_enabled" != "xno"; then
++
+ dnl Get the pkg-config definitions for libGL.  We include a fallback
+ dnl path for GL implementation that don't provide a .pc file
+ PKG_CHECK_MODULES(GL, [gl], [], [
+@@ -103,6 +111,8 @@ PKG_CHECK_MODULES(GLU, [glu], [],
+ DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
+ DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
+ 
++fi
++
+ AC_ARG_ENABLE([egl],
+     [AS_HELP_STRING([--enable-egl],
+         [enable EGL library @<:@default=no@:>@])],
+@@ -287,7 +297,7 @@ AC_SUBST([MESA_GLAPI])
+ AC_SUBST([WAYLAND_CFLAGS])
+ AC_SUBST([WAYLAND_LIBS])
+ 
+-
++AM_CONDITIONAL(HAVE_GL, test "x$gl_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_EGL, test "x$egl_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_GLESV1, test "x$glesv1_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_GLESV2, test "x$glesv2_enabled" = "xyes")
+Index: mesa3d-demos-8.1.0/src/egl/opengl/Makefile.am
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/opengl/Makefile.am
++++ mesa3d-demos-8.1.0/src/egl/opengl/Makefile.am
+@@ -50,6 +50,7 @@ endif
+ endif
+ 
+ if HAVE_EGL
++if HAVE_GL
+ noinst_PROGRAMS = \
+ 	demo1 \
+ 	demo2 \
+@@ -61,6 +62,7 @@ noinst_PROGRAMS = \
+ 	$(EGL_DRM_DEMOS) \
+ 	$(EGL_X11_DEMOS)
+ endif
++endif
+ 
+ egltri_screen_SOURCES = egltri.c
+ eglgears_screen_SOURCES = eglgears.c
+Index: mesa3d-demos-8.1.0/src/util/Makefile.am
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/util/Makefile.am
++++ mesa3d-demos-8.1.0/src/util/Makefile.am
+@@ -27,7 +27,9 @@ AM_CFLAGS = \
+ AM_LDFLAGS = \
+ 	$(DEMO_LIBS)
+ 
++if HAVE_GL
+ noinst_LTLIBRARIES = libutil.la
++endif
+ 
+ if HAVE_GLUT
+ AM_CFLAGS += \
diff --git a/package/mesa3d-demos/0003-demos-x11-fix.patch b/package/mesa3d-demos/0003-demos-x11-fix.patch
new file mode 100644
index 0000000..f6b3b0c
--- /dev/null
+++ b/package/mesa3d-demos/0003-demos-x11-fix.patch
@@ -0,0 +1,30 @@
+This patch ensures that programs which depend on x11 are not build if x11
+is not available.
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+---
+Index: mesa3d-demos-8.1.0/src/egl/opengles2/Makefile.am
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/opengles2/Makefile.am
++++ mesa3d-demos-8.1.0/src/egl/opengles2/Makefile.am
+@@ -35,9 +35,10 @@ AM_LDFLAGS = \
+ 
+ if HAVE_EGL
+ if HAVE_GLESV2
+-bin_PROGRAMS = \
++bin_PROGRAMS = es2gears_screen
++if HAVE_X11
++bin_PROGRAMS += \
+ 	es2_info \
+-	es2gears_screen \
+ 	es2gears_x11 \
+ 	es2tri
+ if HAVE_WAYLAND
+@@ -45,6 +46,7 @@ bin_PROGRAMS += es2gears_wayland
+ endif
+ endif
+ endif
++endif
+ 
+ es2_info_LDADD = $(X11_LIBS)
+ es2tri_LDADD = $(X11_LIBS)
diff --git a/package/mesa3d-demos/Config.in b/package/mesa3d-demos/Config.in
new file mode 100644
index 0000000..e2b2e05
--- /dev/null
+++ b/package/mesa3d-demos/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MESA3D_DEMOS
+	bool "mesa3d-demos"
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
+		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG
+	help
+	  OpenGL demos from the Mesa 3D project.
+
+	  http://mesa3d.org
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
new file mode 100644
index 0000000..9b60dc9
--- /dev/null
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# mesa3d-demos
+#
+################################################################################
+
+MESA3D_DEMOS_VERSION = 8.2.0
+MESA3D_DEMOS_SOURCE = mesa-demos-$(MESA3D_DEMOS_VERSION).tar.bz2
+MESA3D_DEMOS_SITE = ftp://ftp.freedesktop.org/pub/mesa/demos/$(MESA3D_DEMOS_VERSION)
+MESA3D_DEMOS_AUTORECONF = YES
+MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
+MESA3D_DEMOS_LICENSE = MIT
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+MESA3D_DEMOS_DEPENDENCIES += libgl libglew libglu
+MESA3D_DEMOS_CONF_OPTS += --enable-gl
+else
+MESA3D_DEMOS_CONF_OPTS += --disable-gl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+MESA3D_DEMOS_DEPENDENCIES += libegl
+MESA3D_DEMOS_CONF_OPTS += --enable-egl
+else
+MESA3D_DEMOS_CONF_OPTS += --disable-egl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+MESA3D_DEMOS_DEPENDENCIES += libgles
+MESA3D_DEMOS_CONF_OPTS += --enable-gles1 --enable-gles2
+else
+MESA3D_DEMOS_CONF_OPTS += --disable-gles1 --disable-gles2
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
+MESA3D_DEMOS_DEPENDENCIES += libopenvg
+MESA3D_DEMOS_CONF_OPTS += --enable-vg
+else
+MESA3D_DEMOS_CONF_OPTS += --disable-vg
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+MESA3D_DEMOS_DEPENDENCIES += mesa3d
+MESA3D_DEMOS_CONF_OPTS += --enable-gbm
+else
+MESA3D_DEMOS_CONF_OPTS += --disable-gbm
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+MESA3D_DEMOS_DEPENDENCIES += freetype
+MESA3D_DEMOS_CONF_OPTS += --enable-freetype2
+else
+MESA3D_DEMOS_CONF_OPTS += --disable-freetype2
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+MESA3D_DEMOS_DEPENDENCIES += wayland
+MESA3D_DEMOS_CONF_OPTS += --enable-wayland
+else
+MESA3D_DEMOS_CONF_OPTS += --disable-wayland
+endif
+
+$(eval $(autotools-package))
