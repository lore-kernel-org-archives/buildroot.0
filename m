From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  5 Sep 2013 23:25:21 -0500
Subject: [Buildroot] [PATCH v2 7/7] mesa3d-demos: new package
In-Reply-To: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1378441521-10050-8-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in                                  |   1 +
 package/mesa3d-demos/Config.in                     |   8 +
 .../mesa3d-demos/mesa3d-demos-optional-gl.patch    | 348 +++++++++++++++++++++
 package/mesa3d-demos/mesa3d-demos.mk               |  63 ++++
 4 files changed, 420 insertions(+)
 create mode 100644 package/mesa3d-demos/Config.in
 create mode 100644 package/mesa3d-demos/mesa3d-demos-optional-gl.patch
 create mode 100644 package/mesa3d-demos/mesa3d-demos.mk

diff --git a/package/Config.in b/package/Config.in
index 27bd70a..e8ceb5a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -39,6 +39,7 @@ source "package/lttng-modules/Config.in"
 source "package/lttng-tools/Config.in"
 source "package/ltrace/Config.in"
 source "package/memstat/Config.in"
+source "package/mesa3d-demos/Config.in"
 source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
 source "package/pax-utils/Config.in"
diff --git a/package/mesa3d-demos/Config.in b/package/mesa3d-demos/Config.in
new file mode 100644
index 0000000..24c29e0
--- /dev/null
+++ b/package/mesa3d-demos/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MESA3D_DEMOS
+	bool "mesa3d-demos"
+	depends on BR2_PACKAGE_HAS_OPENGL || BR2_PACKAGE_HAS_OPENGL_ES \
+		|| BR2_PACKAGE_HAS_OPENGL_EGL || BR2_PACKAGE_HAS_OPENVG
+	help
+	  OpenGL demos from the Mesa 3D project.
+
+	  http://mesa3d.org
diff --git a/package/mesa3d-demos/mesa3d-demos-optional-gl.patch b/package/mesa3d-demos/mesa3d-demos-optional-gl.patch
new file mode 100644
index 0000000..9345d29
--- /dev/null
+++ b/package/mesa3d-demos/mesa3d-demos-optional-gl.patch
@@ -0,0 +1,348 @@
+This patch makes the egl stuff work with other opengles providers and makes
+it possible to build the demos without opengl (only opengles.)
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+---
+Index: mesa3d-demos-8.1.0/configure.ac
+===================================================================
+--- mesa3d-demos-8.1.0.orig/configure.ac	2013-02-24 04:49:47.000000000 -0600
++++ mesa3d-demos-8.1.0/configure.ac	2013-09-05 10:01:19.137886856 -0500
+@@ -51,6 +51,14 @@
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
+@@ -103,6 +111,8 @@
+ DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
+ DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
+ 
++fi
++
+ AC_ARG_ENABLE([egl],
+     [AS_HELP_STRING([--enable-egl],
+         [enable EGL library @<:@default=no@:>@])],
+@@ -202,7 +212,6 @@
+         [enable support for wayland @<:@default=no@:>@])],
+     [wayland_enabled="$enableval"],
+     [wayland_enabled=no])
+-
+ if test "x$wayland_enabled" != "xno"; then
+     PKG_CHECK_MODULES(WAYLAND, [wayland-client wayland-egl], [wayland_enabled=yes], [wayland_enabled=no])
+ fi
+@@ -287,7 +296,7 @@
+ AC_SUBST([WAYLAND_CFLAGS])
+ AC_SUBST([WAYLAND_LIBS])
+ 
+-
++AM_CONDITIONAL(HAVE_GL, test "x$gl_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_EGL, test "x$egl_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_GLESV1, test "x$glesv1_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_GLESV2, test "x$glesv2_enabled" = "xyes")
+Index: mesa3d-demos-8.1.0/src/egl/eglut/eglut.c
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/eglut/eglut.c	2010-12-26 15:14:50.000000000 -0600
++++ mesa3d-demos-8.1.0/src/egl/eglut/eglut.c	2013-09-05 09:53:25.769878216 -0500
+@@ -76,8 +76,9 @@
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
+@@ -175,7 +176,9 @@
+             win->config, win->native.u.pixmap, NULL);
+       break;
+    case EGL_PBUFFER_BIT:
++#ifdef EGL_MESA_screen_surface
+    case EGL_SCREEN_BIT_MESA:
++#endif
+       win->surface = win->native.u.surface;
+       break;
+    default:
+@@ -289,8 +292,10 @@
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
+--- mesa3d-demos-8.1.0.orig/src/egl/eglut/eglut_screen.c	2012-12-15 01:17:06.000000000 -0600
++++ mesa3d-demos-8.1.0/src/egl/eglut/eglut_screen.c	2013-09-05 09:54:27.505879343 -0500
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
+@@ -94,19 +101,23 @@
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
+@@ -128,14 +139,17 @@
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
+Index: mesa3d-demos-8.1.0/src/egl/opengl/Makefile.am
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/opengl/Makefile.am	2012-12-15 01:17:06.000000000 -0600
++++ mesa3d-demos-8.1.0/src/egl/opengl/Makefile.am	2013-09-05 09:55:09.601880111 -0500
+@@ -50,6 +50,7 @@
+ endif
+ 
+ if HAVE_EGL
++if HAVE_GL
+ noinst_PROGRAMS = \
+ 	demo1 \
+ 	demo2 \
+@@ -61,6 +62,7 @@
+ 	$(EGL_DRM_DEMOS) \
+ 	$(EGL_X11_DEMOS)
+ endif
++endif
+ 
+ egltri_screen_SOURCES = egltri.c
+ eglgears_screen_SOURCES = eglgears.c
+Index: mesa3d-demos-8.1.0/src/egl/opengl/demo1.c
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/opengl/demo1.c	2010-12-26 15:14:50.000000000 -0600
++++ mesa3d-demos-8.1.0/src/egl/opengl/demo1.c	2013-09-05 09:57:06.985882254 -0500
+@@ -18,6 +18,7 @@
+ static void
+ TestScreens(EGLDisplay dpy)
+ {
++#ifdef EGL_MESA_screen_surface
+ #define MAX 8
+    EGLScreenMESA screens[MAX];
+    EGLint numScreens;
+@@ -28,6 +29,7 @@
+    for (i = 0; i < numScreens; i++) {
+       printf(" Screen %d handle: %d\n", i, (int) screens[i]);
+    }
++#endif
+ }
+ 
+ /**
+Index: mesa3d-demos-8.1.0/src/egl/opengl/demo2.c
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/opengl/demo2.c	2012-12-15 01:17:06.000000000 -0600
++++ mesa3d-demos-8.1.0/src/egl/opengl/demo2.c	2013-09-05 09:57:32.805882725 -0500
+@@ -16,6 +16,7 @@
+ 
+ /*#define FRONTBUFFER*/
+ 
++#ifdef EGL_MESA_screen_surface
+ static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2,
+                           GLfloat r, GLfloat g, GLfloat b)
+ {
+@@ -95,12 +96,13 @@
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
+@@ -115,6 +117,7 @@
+    EGLModeMESA mode;
+    EGLScreenMESA screen;
+    EGLint count;
++#endif
+ 
+    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
+    assert(d);
+@@ -132,6 +135,7 @@
+       exit(1);
+    }
+ 
++#ifdef EGL_MESA_screen_surface
+    eglGetConfigs(d, configs, 10, &numConfigs);
+    printf("Got %d EGL configs:\n", numConfigs);
+    for (i = 0; i < numConfigs; i++) {
+@@ -211,6 +215,7 @@
+    eglDestroySurface(d, pbuffer);
+    eglDestroyContext(d, ctx);
+    eglTerminate(d);
++#endif
+ 
+    return 0;
+ }
+Index: mesa3d-demos-8.1.0/src/egl/opengl/demo3.c
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/opengl/demo3.c	2012-12-15 01:17:06.000000000 -0600
++++ mesa3d-demos-8.1.0/src/egl/opengl/demo3.c	2013-09-05 09:58:08.961883385 -0500
+@@ -46,7 +46,7 @@
+    0x3e, 0x00, 0x00, 0xf8, 0x0c, 0x00, 
+ };
+ 
+-
++#ifdef EGL_MESA_screen_surface
+ static void Init(void)
+ {
+ 
+@@ -551,11 +551,13 @@
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
+@@ -566,6 +568,7 @@
+    const GLubyte *bitmap;
+    EGLint screenAttribs[32];
+    EGLint i;
++#endif
+ 
+    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
+    assert(d);
+@@ -583,6 +586,7 @@
+       exit(1);
+    }
+ 
++#ifdef EGL_MESA_screen_surface
+    eglGetConfigs(d, configs, 10, &numConfigs);
+    eglGetScreensMESA(d, &screen, 1, &count);
+    eglGetModesMESA(d, screen, &mode, 1, &count);
+@@ -642,6 +646,7 @@
+    eglDestroySurface(d, screen_surf);
+    eglDestroyContext(d, ctx);
+    eglTerminate(d);
++#endif
+ 
+    return 0;
+ }
+Index: mesa3d-demos-8.1.0/src/egl/opengles2/Makefile.am
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/egl/opengles2/Makefile.am	2012-12-15 01:17:06.000000000 -0600
++++ mesa3d-demos-8.1.0/src/egl/opengles2/Makefile.am	2013-09-05 09:58:48.937884115 -0500
+@@ -35,9 +35,10 @@
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
+@@ -45,6 +46,7 @@
+ endif
+ endif
+ endif
++endif
+ 
+ es2_info_LDADD = $(X11_LIBS)
+ es2tri_LDADD = $(X11_LIBS)
+Index: mesa3d-demos-8.1.0/src/util/Makefile.am
+===================================================================
+--- mesa3d-demos-8.1.0.orig/src/util/Makefile.am	2012-12-15 01:17:06.000000000 -0600
++++ mesa3d-demos-8.1.0/src/util/Makefile.am	2013-09-05 10:00:21.957885813 -0500
+@@ -27,7 +27,9 @@
+ AM_LDFLAGS = \
+ 	$(DEMO_LIBS)
+ 
++if HAVE_GL
+ noinst_LTLIBRARIES = libutil.la
++endif
+ 
+ if HAVE_GLUT
+ AM_CFLAGS += \
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
new file mode 100644
index 0000000..2cb7cd8
--- /dev/null
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# mesa3d-demos
+#
+################################################################################
+
+MESA3D_DEMOS_VERSION = 8.1.0
+MESA3D_DEMOS_SOURCE = mesa-demos-$(MESA3D_DEMOS_VERSION).tar.bz2
+MESA3D_DEMOS_SITE = ftp://ftp.freedesktop.org/pub/mesa/demos/$(MESA3D_DEMOS_VERSION)
+MESA3D_DEMOS_INSTALL_STAGING = YES
+MESA3D_DEMOS_AUTORECONF = YES
+MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_HAS_OPENGL),y)
+MESA3D_DEMOS_DEPENDENCIES += libgl
+MESA3D_DEMOS_CONF_OPT += --enable-gl
+else
+MESA3D_DEMOS_CONF_OPT += --disable-gl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL),y)
+MESA3D_DEMOS_DEPENDENCIES += libegl
+MESA3D_DEMOS_CONF_OPT += --enable-egl
+else
+MESA3D_DEMOS_CONF_OPT += --disable-egl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_ES),y)
+MESA3D_DEMOS_DEPENDENCIES += libgles
+MESA3D_DEMOS_CONF_OPT += --enable-gles1 --enable-gles2
+else
+MESA3D_DEMOS_CONF_OPT += --disable-gles1 --disable-gles2
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENVG),y)
+MESA3D_DEMOS_DEPENDENCIES += libopenvg
+MESA3D_DEMOS_CONF_OPT += --enable-vg
+else
+MESA3D_DEMOS_CONF_OPT += --disable-vg
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
+MESA3D_DEMOS_DEPENDENCIES += mesa3d
+MESA3D_DEMOS_CONF_OPT += --enable-gbm
+else
+MESA3D_DEMOS_CONF_OPT += --disable-gbm
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+MESA3D_DEMOS_DEPENDENCIES += freetype
+MESA3D_DEMOS_CONF_OPT += --enable-freetype2
+else
+MESA3D_DEMOS_CONF_OPT += --disable-freetype2
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+MESA3D_DEMOS_DEPENDENCIES += wayland
+MESA3D_DEMOS_CONF_OPT += --enable-wayland
+else
+MESA3D_DEMOS_CONF_OPT += --disable-wayland
+endif
+
+$(eval $(autotools-package))
-- 
1.8.1.2
