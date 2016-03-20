From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 18:34:10 +0100
Subject: [Buildroot] [git commit] libepoxy: move outside x11r7 scope
Message-ID: <20160320174019.D5BE9818B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0911f32d1c34b239cbb59e1b2d89d1b5cadee7e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move it outside x11r7 scope since it can be built without it with a few
patches (sent upstream via github pull request).

Motivation is simple, it's a dependency for newer gtk3 versions which
can work with a wayland or broadway backend, and having a full x11 stack
is pointless for that scenario.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[Thomas: split the first patch into four separate patches, since
that's how they were submitted upstream.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |   1 +
 ...-platforms-based-on-configuration-results.patch | 125 +++++++++++++++++++++
 ...0002-add-an-option-to-disable-glx-support.patch |  39 +++++++
 ...able-glx-actually-work-on-osx-and-windows.patch |  67 +++++++++++
 ...arwin-use-glx-instead-of-opengl-framework.patch |  95 ++++++++++++++++
 .../0005-Forward-egl-cflags-into-epoxy.pc.patch    |  45 ++++++++
 package/libepoxy/0006-Make-egl-conditional.patch   |  59 ++++++++++
 package/libepoxy/Config.in                         |  12 ++
 package/libepoxy/libepoxy.mk                       |  32 ++++++
 package/x11r7/Config.in                            |   1 -
 package/x11r7/libepoxy/Config.in                   |  13 ---
 package/x11r7/libepoxy/libepoxy.mk                 |  16 ---
 12 files changed, 475 insertions(+), 30 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2401867..75ee013 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -900,6 +900,7 @@ menu "Graphics"
 	source "package/libdmtx/Config.in"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
+	source "package/libepoxy/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/libexif/Config.in"
 	source "package/libfm/Config.in"
diff --git a/package/libepoxy/0001-select-platforms-based-on-configuration-results.patch b/package/libepoxy/0001-select-platforms-based-on-configuration-results.patch
new file mode 100644
index 0000000..e3a7b49
--- /dev/null
+++ b/package/libepoxy/0001-select-platforms-based-on-configuration-results.patch
@@ -0,0 +1,125 @@
+From 7eff2bf8e27599c1c94217b2bb1b73d4b7d18e59 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 6 May 2015 10:45:22 +0200
+Subject: [PATCH 1/4] select platforms based on configuration results
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Andreas M??ller <schnitzeltony@googlemail.com>
+Fetched from pull #81 on github for libepoxy:
+https://github.com/anholt/libepoxy/pull/81/commits
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac          | 13 +++++--------
+ src/dispatch_common.c |  9 ++++++---
+ src/dispatch_common.h |  9 +++++----
+ 3 files changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2d67726..225ab73 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -58,6 +58,10 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
+ # uintptr_t to a void *") by default.  Kill that.
+ XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
+ 
++PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
++
++AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
++
+ has_znow=yes
+ 
+ case $host_os in
+@@ -86,7 +90,7 @@ case $host_os in
+         ;;
+     *)
+         build_egl=yes
+-        build_glx=yes
++        build_glx=$x11
+         build_wgl=no
+         # On platforms with dlopen, we load everything dynamically and
+         # don't link against a specific window system or GL implementation.
+@@ -144,13 +148,6 @@ esac
+ 
+ AC_SUBST([VISIBILITY_CFLAGS])
+ 
+-PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
+-if test x$x11 = xno -a x$build_glx = xyes; then
+-    AC_MSG_ERROR([libX11 headers (libx11-dev) required to build with GLX support])
+-fi
+-
+-AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
+-
+ PKG_CHECK_MODULES(GL, [gl], [gl=yes], [gl=no])
+ 
+ AC_CONFIG_FILES([
+diff --git a/src/dispatch_common.c b/src/dispatch_common.c
+index 013027f..163d348 100644
+--- a/src/dispatch_common.c
++++ b/src/dispatch_common.c
+@@ -656,10 +656,13 @@ epoxy_get_proc_address(const char *name)
+ #elif defined(__APPLE__)
+     return epoxy_gl_dlsym(name);
+ #else
++#if PLATFORM_HAS_GLX
+     if (epoxy_current_context_is_glx()) {
+         return glXGetProcAddressARB((const GLubyte *)name);
+-    } else {
++    } else
++#endif /* PLATFORM_HAS_GLX */
+ #if PLATFORM_HAS_EGL
++    {
+         GLenum egl_api = epoxy_egl_get_current_gl_context_api();
+ 
+         switch (egl_api) {
+@@ -669,10 +672,10 @@ epoxy_get_proc_address(const char *name)
+         case EGL_NONE:
+             break;
+         }
+-#endif
+     }
++#endif /* PLATFORM_HAS_EGL */
+     errx(1, "Couldn't find current GLX or EGL context.\n");
+-#endif
++#endif /* _WIN32 | __APPLE__*/
+ }
+ 
+ WRAPPER_VISIBILITY (void)
+diff --git a/src/dispatch_common.h b/src/dispatch_common.h
+index 676a4d5..2728b45 100644
+--- a/src/dispatch_common.h
++++ b/src/dispatch_common.h
+@@ -21,12 +21,13 @@
+  * IN THE SOFTWARE.
+  */
+ 
++#include <config.h>
+ #include <stdbool.h>
+ 
+ #ifdef _WIN32
+ #define PLATFORM_HAS_EGL 0
+ #define PLATFORM_HAS_GLX 0
+-#define PLATFORM_HAS_WGL 1
++#define PLATFORM_HAS_WGL BUILD_WGL
+ #define EPOXY_IMPORTEXPORT __declspec(dllexport)
+ #elif defined(__APPLE__)
+ #define PLATFORM_HAS_EGL 0
+@@ -34,13 +35,13 @@
+ #define PLATFORM_HAS_WGL 0
+ #define EPOXY_IMPORTEXPORT
+ #elif defined(ANDROID)
+-#define PLATFORM_HAS_EGL 1
++#define PLATFORM_HAS_EGL BUILD_EGL
+ #define PLATFORM_HAS_GLX 0
+ #define PLATFORM_HAS_WGL 0
+ #define EPOXY_IMPORTEXPORT
+ #else
+-#define PLATFORM_HAS_EGL 1
+-#define PLATFORM_HAS_GLX 1
++#define PLATFORM_HAS_EGL BUILD_EGL
++#define PLATFORM_HAS_GLX BUILD_GLX
+ #define PLATFORM_HAS_WGL 0
+ #define EPOXY_IMPORTEXPORT
+ #endif
+
diff --git a/package/libepoxy/0002-add-an-option-to-disable-glx-support.patch b/package/libepoxy/0002-add-an-option-to-disable-glx-support.patch
new file mode 100644
index 0000000..a81547d
--- /dev/null
+++ b/package/libepoxy/0002-add-an-option-to-disable-glx-support.patch
@@ -0,0 +1,39 @@
+From a9efde0fb2678cd26bdf26d256732d97ded0c595 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 6 May 2015 11:05:48 +0200
+Subject: [PATCH 2/4] add an option to disable glx support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+this option would help us in yocto to get deterministic build results
+
+Signed-off-by: Andreas M??ller <schnitzeltony@googlemail.com>
+Fetched from pull #81 on github for libepoxy:
+https://github.com/anholt/libepoxy/pull/81/commits
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 225ab73..d3d947c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -58,7 +58,14 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
+ # uintptr_t to a void *") by default.  Kill that.
+ XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
+ 
+-PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
++AC_ARG_ENABLE([glx],
++                [AS_HELP_STRING([--disable-glx],
++				[disable if you don't want x11/glx support])],
++                [],
++                [enable_glx=yes]
++             )
++
++PKG_CHECK_MODULES(X11, [x11], [x11=$enable_glx], [x11=no])
+ 
+ AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
+ 
+
diff --git a/package/libepoxy/0003-make-enable-glx-actually-work-on-osx-and-windows.patch b/package/libepoxy/0003-make-enable-glx-actually-work-on-osx-and-windows.patch
new file mode 100644
index 0000000..5b0d4fe
--- /dev/null
+++ b/package/libepoxy/0003-make-enable-glx-actually-work-on-osx-and-windows.patch
@@ -0,0 +1,67 @@
+From 902ea1eb073187603ec2eda4d2a146bef96592d4 Mon Sep 17 00:00:00 2001
+From: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
+Date: Mon, 18 Jan 2016 10:08:44 -0800
+Subject: [PATCH 3/4] Make --enable-glx actually work on OSX and Windows
+
+Followup for anholt/libepoxy#52
+
+Signed-off-by: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
+Fetched from pull #81 on github for libepoxy:
+https://github.com/anholt/libepoxy/pull/81/commits
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac          | 6 +++---
+ src/dispatch_common.h | 4 ++--
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d3d947c..b4c7ede 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -61,7 +61,7 @@ XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
+ AC_ARG_ENABLE([glx],
+                 [AS_HELP_STRING([--disable-glx],
+ 				[disable if you don't want x11/glx support])],
+-                [],
++                [enable_glx=$enableval],
+                 [enable_glx=yes]
+              )
+ 
+@@ -74,7 +74,7 @@ has_znow=yes
+ case $host_os in
+     mingw*)
+         build_egl=no
+-        build_glx=no
++        build_glx=$x11
+         build_wgl=yes
+         # On windows, the DLL has to have all of its functions
+         # resolved at link time, so we have to link directly aginst
+@@ -89,7 +89,7 @@ case $host_os in
+         ;;
+     darwin*)
+         build_egl=no
+-        build_glx=no
++        build_glx=$x11
+         build_wgl=no
+         build_apple=yes
+         has_znow=no
+diff --git a/src/dispatch_common.h b/src/dispatch_common.h
+index 2728b45..c30ce44 100644
+--- a/src/dispatch_common.h
++++ b/src/dispatch_common.h
+@@ -26,12 +26,12 @@
+ 
+ #ifdef _WIN32
+ #define PLATFORM_HAS_EGL 0
+-#define PLATFORM_HAS_GLX 0
++#define PLATFORM_HAS_GLX BUILD_GLX
+ #define PLATFORM_HAS_WGL BUILD_WGL
+ #define EPOXY_IMPORTEXPORT __declspec(dllexport)
+ #elif defined(__APPLE__)
+ #define PLATFORM_HAS_EGL 0
+-#define PLATFORM_HAS_GLX 0
++#define PLATFORM_HAS_GLX BUILD_GLX
+ #define PLATFORM_HAS_WGL 0
+ #define EPOXY_IMPORTEXPORT
+ #elif defined(ANDROID)
+
diff --git a/package/libepoxy/0004-darwin-use-glx-instead-of-opengl-framework.patch b/package/libepoxy/0004-darwin-use-glx-instead-of-opengl-framework.patch
new file mode 100644
index 0000000..be9b009
--- /dev/null
+++ b/package/libepoxy/0004-darwin-use-glx-instead-of-opengl-framework.patch
@@ -0,0 +1,95 @@
+From d010922282580a32dfebcda12ee1c307b3ef6005 Mon Sep 17 00:00:00 2001
+From: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
+Date: Mon, 18 Jan 2016 09:49:55 -0800
+Subject: [PATCH 4/4] darwin: Use GLX instead of OpenGL.framework if it is the
+ current context
+
+Also makes a stab at similar support for Win32
+
+anholt/libepoxy#63
+
+Signed-off-by: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
+Fetched from pull #81 on github for libepoxy:
+https://github.com/anholt/libepoxy/pull/81/commits
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/dispatch_common.c | 29 ++++++++++++++++-------------
+ 1 file changed, 16 insertions(+), 13 deletions(-)
+
+diff --git a/src/dispatch_common.c b/src/dispatch_common.c
+index 163d348..cb9f76a 100644
+--- a/src/dispatch_common.c
++++ b/src/dispatch_common.c
+@@ -482,16 +482,20 @@ epoxy_glx_dlsym(const char *name)
+ void *
+ epoxy_gl_dlsym(const char *name)
+ {
+-#ifdef _WIN32
++#if defined(_WIN32) || defined(__APPLE__)
++if (!epoxy_current_context_is_glx()) {
++# if defined(_WIN32)
+     return do_dlsym(&api.gl_handle, "OPENGL32", name, true);
+-#elif defined(__APPLE__)
++# elif defined(__APPLE__)
+     return do_dlsym(&api.gl_handle,
+                     "/System/Library/Frameworks/OpenGL.framework/Versions/Current/OpenGL",
+                     name, true);
+-#else
++# endif
++}
++#endif
++
+     /* There's no library for desktop GL support independent of GLX. */
+     return epoxy_glx_dlsym(name);
+-#endif
+ }
+ 
+ void *
+@@ -615,7 +619,7 @@ epoxy_get_bootstrap_proc_address(const char *name)
+      */
+ #if PLATFORM_HAS_GLX
+     if (api.glx_handle && glXGetCurrentContext())
+-        return epoxy_gl_dlsym(name);
++        return epoxy_glx_dlsym(name);
+ #endif
+ 
+     /* If epoxy hasn't loaded any API-specific library yet, try to
+@@ -644,22 +648,17 @@ epoxy_get_bootstrap_proc_address(const char *name)
+     }
+ #endif /* PLATFORM_HAS_EGL */
+ 
+-    /* Fall back to GLX */
++    /* Fall back to the platform default */
+     return epoxy_gl_dlsym(name);
+ }
+ 
+ void *
+ epoxy_get_proc_address(const char *name)
+ {
+-#ifdef _WIN32
+-    return wglGetProcAddress(name);
+-#elif defined(__APPLE__)
+-    return epoxy_gl_dlsym(name);
+-#else
+ #if PLATFORM_HAS_GLX
+     if (epoxy_current_context_is_glx()) {
+         return glXGetProcAddressARB((const GLubyte *)name);
+-    } else
++    }
+ #endif /* PLATFORM_HAS_GLX */
+ #if PLATFORM_HAS_EGL
+     {
+@@ -674,8 +673,12 @@ epoxy_get_proc_address(const char *name)
+         }
+     }
+ #endif /* PLATFORM_HAS_EGL */
++#if defined(_WIN32)
++    return wglGetProcAddress(name);
++#elif defined(__APPLE__)
++    return epoxy_gl_dlsym(name);
++#endif
+     errx(1, "Couldn't find current GLX or EGL context.\n");
+-#endif /* _WIN32 | __APPLE__*/
+ }
+ 
+ WRAPPER_VISIBILITY (void)
diff --git a/package/libepoxy/0005-Forward-egl-cflags-into-epoxy.pc.patch b/package/libepoxy/0005-Forward-egl-cflags-into-epoxy.pc.patch
new file mode 100644
index 0000000..d13f01d
--- /dev/null
+++ b/package/libepoxy/0005-Forward-egl-cflags-into-epoxy.pc.patch
@@ -0,0 +1,45 @@
+From 68e5f1574758240aedfe8653d7aaae62cdb08bf5 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sun, 20 Dec 2015 10:07:06 -0300
+Subject: [PATCH] Forward egl cflags into epoxy.pc
+
+When building mesa egl without x11 and gles2 the headers need a
+MESA_EGL_NO_X11_HEADERS define, so put them in epoxy.pc as well since
+otherwise builds will fail.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: pull request https://github.com/anholt/libepoxy/pull/80
+
+ configure.ac | 2 ++
+ epoxy.pc.in  | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c7cffb2..7b599de 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -102,6 +102,8 @@ if test x$build_egl = xyes; then
+     AC_DEFINE([BUILD_EGL], [1], [build EGL tests])
+ fi
+ 
++AC_SUBST(EGL_CFLAGS)
++
+ PKG_CHECK_MODULES(GL, [gl], [gl=yes], [gl=no])
+ if test x$gl = xno; then
+     build_glx=no
+diff --git a/epoxy.pc.in b/epoxy.pc.in
+index 8c85a33..f377da5 100644
+--- a/epoxy.pc.in
++++ b/epoxy.pc.in
+@@ -6,6 +6,6 @@ includedir=@includedir@
+ Name: epoxy
+ Description: epoxy GL dispatch Library
+ Version: @PACKAGE_VERSION@
+-Cflags: -I${includedir}
++Cflags: -I${includedir} @EGL_CFLAGS@
+ Libs: -L${libdir} -lepoxy
+ Libs.private: @DLOPEN_LIBS@
+-- 
+2.4.10
+
diff --git a/package/libepoxy/0006-Make-egl-conditional.patch b/package/libepoxy/0006-Make-egl-conditional.patch
new file mode 100644
index 0000000..752e8e4
--- /dev/null
+++ b/package/libepoxy/0006-Make-egl-conditional.patch
@@ -0,0 +1,59 @@
+From 5492e81f317e48141b0687ad77252c52c2dfcd6d Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Fri, 5 Feb 2016 19:03:39 -0300
+Subject: [PATCH] Make egl conditional
+
+Mesa can be built with GLX and without EGL support, so make this
+possible in epoxy as well.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6e56599..21e3a25 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -58,6 +58,13 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
+ # uintptr_t to a void *") by default.  Kill that.
+ XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
+ 
++AC_ARG_ENABLE([egl],
++		[AS_HELP_STRING([--disable-egl],
++				[disable if you don't want egl support])],
++		[enable_egl=$enableval],
++		[enable_egl=yes]
++             )
++
+ AC_ARG_ENABLE([glx],
+                 [AS_HELP_STRING([--disable-glx],
+ 				[disable if you don't want x11/glx support])],
+@@ -65,6 +72,7 @@ AC_ARG_ENABLE([glx],
+                 [enable_glx=yes]
+              )
+ 
++PKG_CHECK_MODULES(EGL, [egl], [egl=$enable_egl], [egl=no])
+ PKG_CHECK_MODULES(X11, [x11], [x11=$enable_glx], [x11=no])
+ 
+ AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
+@@ -96,7 +104,7 @@ case $host_os in
+         EPOXY_LINK_LIBS=""
+         ;;
+     *)
+-        build_egl=yes
++        build_egl=$egl
+         build_glx=$x11
+         build_wgl=no
+         # On platforms with dlopen, we load everything dynamically and
+@@ -109,7 +117,6 @@ AC_SUBST(EPOXY_LINK_LIBS)
+ 
+ AM_CONDITIONAL(BUILD_EGL, test x$build_egl = xyes)
+ if test x$build_egl = xyes; then
+-    PKG_CHECK_MODULES(EGL, [egl])
+     AC_DEFINE([BUILD_EGL], [1], [build EGL tests])
+ fi
+ 
+-- 
+2.4.10
+
diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
new file mode 100644
index 0000000..c87366a
--- /dev/null
+++ b/package/libepoxy/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBEPOXY
+	bool "libepoxy"
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	help
+	  Epoxy is a library for handling OpenGL function pointer
+	  management for you.
+
+	  https://github.com/anholt/libepoxy
+
+comment "libepoxy needs an OpenGL and/or OpenGL EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
new file mode 100644
index 0000000..8e717ce
--- /dev/null
+++ b/package/libepoxy/libepoxy.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# libepoxy
+#
+################################################################################
+
+LIBEPOXY_VERSION = v1.3.1
+LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
+LIBEPOXY_INSTALL_STAGING = YES
+# For patches:
+# 0001-make-egl-and-glx-conditional.patch
+# 0002-Forward-egl-cflags-into-epoxy.pc.patch
+LIBEPOXY_AUTORECONF = YES
+LIBEPOXY_DEPENDENCIES = xutil_util-macros
+LIBEPOXY_LICENSE = MIT
+LIBEPOXY_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+LIBEPOXY_CONF_OPTS += --enable-egl
+LIBEPOXY_DEPENDENCIES += libegl
+else
+LIBEPOXY_CONF_OPTS += --disable-egl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_XLIB_LIBX11),yy)
+LIBEPOXY_CONF_OPTS += --enable-egl
+LIBEPOXY_DEPENDENCIES += libgl xlib_libX11
+else
+LIBEPOXY_CONF_OPTS += --disable-glx
+endif
+
+$(eval $(autotools-package))
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 019e376..fb6195d 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -15,7 +15,6 @@ if BR2_PACKAGE_XORG7
 	endmenu
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
-		source package/x11r7/libepoxy/Config.in
 		source package/x11r7/xcb-util/Config.in
 		source package/x11r7/xcb-util-cursor/Config.in
 		source package/x11r7/xcb-util-image/Config.in
diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
deleted file mode 100644
index 5628bf7..0000000
--- a/package/x11r7/libepoxy/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_LIBEPOXY
-	bool "epoxy"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	help
-	  Epoxy is a library for handling OpenGL function pointer
-	  management for you.
-
-	  https://github.com/anholt/libepoxy
-
-comment "epoxy needs an OpenGL EGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL
diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
deleted file mode 100644
index 12ddd03..0000000
--- a/package/x11r7/libepoxy/libepoxy.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# libepoxy
-#
-################################################################################
-
-LIBEPOXY_VERSION = v1.3.1
-LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
-LIBEPOXY_INSTALL_STAGING = YES
-LIBEPOXY_AUTORECONF = YES
-LIBEPOXY_DEPENDENCIES = xlib_libX11 xutil_util-macros libegl \
-	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) host-pkgconf
-LIBEPOXY_LICENSE = MIT
-LIBEPOXY_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
