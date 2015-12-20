From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 20 Dec 2015 10:40:33 -0300
Subject: [Buildroot] [PATCH 1/4] libepoxy: move outside x11r7 scope
Message-ID: <1450618836-3845-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move it outside x11r7 scope since it can be built without it with a few
patches (sent upstream via github pull request).

Motivation is simple, it's a dependency for newer gtk3 versions which
can work with a wayland or broadway backend, and having a full x11 stack
is pointless for that scenario.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                  |   1 +
 .../0001-Use-target_os-instead-of-host_os.patch    |  39 ++++++++
 package/libepoxy/0002-Make-glx-conditional.patch   | 109 +++++++++++++++++++++
 .../0003-Forward-egl-cflags-into-epoxy.pc.patch    |  45 +++++++++
 package/{x11r7 => }/libepoxy/Config.in             |   1 -
 package/{x11r7 => }/libepoxy/libepoxy.mk           |   7 +-
 package/x11r7/Config.in                            |   1 -
 7 files changed, 199 insertions(+), 4 deletions(-)
 create mode 100644 package/libepoxy/0001-Use-target_os-instead-of-host_os.patch
 create mode 100644 package/libepoxy/0002-Make-glx-conditional.patch
 create mode 100644 package/libepoxy/0003-Forward-egl-cflags-into-epoxy.pc.patch
 rename package/{x11r7 => }/libepoxy/Config.in (90%)
 rename package/{x11r7 => }/libepoxy/libepoxy.mk (72%)

diff --git a/package/Config.in b/package/Config.in
index 4d8c054..a0da1d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -845,6 +845,7 @@ menu "Graphics"
 	source "package/libdmtx/Config.in"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
+	source "package/libepoxy/Config.in"
 	source "package/libexif/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/libfm/Config.in"
diff --git a/package/libepoxy/0001-Use-target_os-instead-of-host_os.patch b/package/libepoxy/0001-Use-target_os-instead-of-host_os.patch
new file mode 100644
index 0000000..7ea0740
--- /dev/null
+++ b/package/libepoxy/0001-Use-target_os-instead-of-host_os.patch
@@ -0,0 +1,39 @@
+From 4ef87628ad9ff25115d2fdbe652ca39eeae824c5 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 28 Oct 2015 15:10:24 -0300
+Subject: [PATCH 1/3] Use target_os instead of host_os
+
+We might be cross-compiling and hence host might be != target.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: pull request https://github.com/anholt/libepoxy/pull/80
+
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2d67726..a271cc4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -60,7 +60,7 @@ XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
+ 
+ has_znow=yes
+ 
+-case $host_os in
++case $target_os in
+     mingw*)
+         build_egl=no
+         build_glx=no
+@@ -122,7 +122,7 @@ AM_CONDITIONAL(HAS_ZNOW, test x$has_znow = xyes)
+ AC_CHECK_LIB([dl], [dlopen], [DLOPEN_LIBS="-ldl"])
+ AC_SUBST([DLOPEN_LIBS])
+ 
+-case $host_os in
++case $target_os in
+     mingw*)
+         # visibility flags aren't supported for windows DLLs, and the
+         # compiler whines to tell you so, so don't set them up.
+-- 
+2.4.10
+
diff --git a/package/libepoxy/0002-Make-glx-conditional.patch b/package/libepoxy/0002-Make-glx-conditional.patch
new file mode 100644
index 0000000..18fe2d2
--- /dev/null
+++ b/package/libepoxy/0002-Make-glx-conditional.patch
@@ -0,0 +1,109 @@
+From 54aa14558dc8493e730be209844868131f67c741 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 11 Nov 2015 14:40:18 -0300
+Subject: [PATCH 2/3] Make glx conditional
+
+Since libgtk3 uses libepoxy and can be built for wayland alone without
+X11 support it doesn't make sense to force OpenGL support and a full
+X11 stack.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: pull request https://github.com/anholt/libepoxy/pull/80
+
+ configure.ac          | 7 +++++--
+ src/Makefile.am       | 7 +++++++
+ src/dispatch_common.c | 4 ++++
+ src/dispatch_common.h | 4 ----
+ 4 files changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a271cc4..c7cffb2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -102,6 +102,11 @@ if test x$build_egl = xyes; then
+     AC_DEFINE([BUILD_EGL], [1], [build EGL tests])
+ fi
+ 
++PKG_CHECK_MODULES(GL, [gl], [gl=yes], [gl=no])
++if test x$gl = xno; then
++    build_glx=no
++fi
++
+ AM_CONDITIONAL(BUILD_GLX, test x$build_glx = xyes)
+ if test x$build_glx = xyes; then
+     AC_DEFINE([BUILD_GLX], [1], [build GLX tests])
+@@ -151,8 +156,6 @@ fi
+ 
+ AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
+ 
+-PKG_CHECK_MODULES(GL, [gl], [gl=yes], [gl=no])
+-
+ AC_CONFIG_FILES([
+                 epoxy.pc
+                 Makefile
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 49c3507..6c0a46b 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -19,7 +19,14 @@
+ # FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ # IN THE SOFTWARE.
+ 
++if BUILD_GLX
++PLATFORM_HAS_GLX=1
++else
++PLATFORM_HAS_GLX=0
++endif
++
+ AM_CPPFLAGS = \
++	-DPLATFORM_HAS_GLX=$(PLATFORM_HAS_GLX) \
+ 	-I$(top_srcdir)/include \
+ 	-I$(top_builddir)/include \
+ 	$()
+diff --git a/src/dispatch_common.c b/src/dispatch_common.c
+index 013027f..761cee7 100644
+--- a/src/dispatch_common.c
++++ b/src/dispatch_common.c
+@@ -657,7 +657,11 @@ epoxy_get_proc_address(const char *name)
+     return epoxy_gl_dlsym(name);
+ #else
+     if (epoxy_current_context_is_glx()) {
++#if PLATFORM_HAS_GLX
+         return glXGetProcAddressARB((const GLubyte *)name);
++#else
++	return false;
++#endif
+     } else {
+ #if PLATFORM_HAS_EGL
+         GLenum egl_api = epoxy_egl_get_current_gl_context_api();
+diff --git a/src/dispatch_common.h b/src/dispatch_common.h
+index 676a4d5..01886a3 100644
+--- a/src/dispatch_common.h
++++ b/src/dispatch_common.h
+@@ -25,22 +25,18 @@
+ 
+ #ifdef _WIN32
+ #define PLATFORM_HAS_EGL 0
+-#define PLATFORM_HAS_GLX 0
+ #define PLATFORM_HAS_WGL 1
+ #define EPOXY_IMPORTEXPORT __declspec(dllexport)
+ #elif defined(__APPLE__)
+ #define PLATFORM_HAS_EGL 0
+-#define PLATFORM_HAS_GLX 0
+ #define PLATFORM_HAS_WGL 0
+ #define EPOXY_IMPORTEXPORT
+ #elif defined(ANDROID)
+ #define PLATFORM_HAS_EGL 1
+-#define PLATFORM_HAS_GLX 0
+ #define PLATFORM_HAS_WGL 0
+ #define EPOXY_IMPORTEXPORT
+ #else
+ #define PLATFORM_HAS_EGL 1
+-#define PLATFORM_HAS_GLX 1
+ #define PLATFORM_HAS_WGL 0
+ #define EPOXY_IMPORTEXPORT
+ #endif
+-- 
+2.4.10
+
diff --git a/package/libepoxy/0003-Forward-egl-cflags-into-epoxy.pc.patch b/package/libepoxy/0003-Forward-egl-cflags-into-epoxy.pc.patch
new file mode 100644
index 0000000..b402649
--- /dev/null
+++ b/package/libepoxy/0003-Forward-egl-cflags-into-epoxy.pc.patch
@@ -0,0 +1,45 @@
+From 68e5f1574758240aedfe8653d7aaae62cdb08bf5 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sun, 20 Dec 2015 10:07:06 -0300
+Subject: [PATCH 3/3] Forward egl cflags into epoxy.pc
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
diff --git a/package/x11r7/libepoxy/Config.in b/package/libepoxy/Config.in
similarity index 90%
rename from package/x11r7/libepoxy/Config.in
rename to package/libepoxy/Config.in
index 5628bf7..21607c2 100644
--- a/package/x11r7/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "epoxy"
-	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	help
diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
similarity index 72%
rename from package/x11r7/libepoxy/libepoxy.mk
rename to package/libepoxy/libepoxy.mk
index 12ddd03..75ac395 100644
--- a/package/x11r7/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -8,9 +8,12 @@ LIBEPOXY_VERSION = v1.3.1
 LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
 LIBEPOXY_INSTALL_STAGING = YES
 LIBEPOXY_AUTORECONF = YES
-LIBEPOXY_DEPENDENCIES = xlib_libX11 xutil_util-macros libegl \
-	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) host-pkgconf
+LIBEPOXY_DEPENDENCIES = libegl xutil_util-macros
 LIBEPOXY_LICENSE = MIT
 LIBEPOXY_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_XLIB_LIBX11),yy)
+LIBEPOXY_DEPENDENCIES += libgl xlib_libX11
+endif
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 381157f..f4d0c80 100644
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
-- 
2.4.10
