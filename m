From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Apr 2016 15:38:58 -0300
Subject: [Buildroot] [PATCH] weston: add build fix for clock_gettime() in
	librt
Message-ID: <1461177538-21402-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Over time weston has been manually adding -lrt LDADDs to the Makefile
for clock_gettime() using sources. However this isn't 100% correct since
"modern" glibc versions don't require it so switch all over to a
configure test for that purpose. Fixes:
http://autobuild.buildroot.net/results/7fb/7fb9968b13f144c4576b28ecd01c82b74e4ed9d5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...uild-add-check-for-clock_gettime-in-librt.patch | 101 +++++++++++++++++++++
 package/weston/weston.mk                           |   2 +
 2 files changed, 103 insertions(+)
 create mode 100644 package/weston/0002-build-add-check-for-clock_gettime-in-librt.patch

diff --git a/package/weston/0002-build-add-check-for-clock_gettime-in-librt.patch b/package/weston/0002-build-add-check-for-clock_gettime-in-librt.patch
new file mode 100644
index 0000000..2c8f54e
--- /dev/null
+++ b/package/weston/0002-build-add-check-for-clock_gettime-in-librt.patch
@@ -0,0 +1,101 @@
+From 4c0a6ed01fb1aab578dc6ac29f11524a3883e14f Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 20 Apr 2016 13:16:58 -0300
+Subject: [PATCH] build: add check for clock_gettime() in librt
+
+In older versions of glibc (< 2.17) clock_gettime() is in librt, hence
+linking against librt is required when using it.
+Add a configure check for this and replace all instances of -lrt in
+Makefile.am with $(CLOCK_GETTIME_LIBS).
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: submitted upstream
+
+ Makefile.am  | 15 ++++++++-------
+ configure.ac |  5 +++++
+ 2 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d3c3f71..c042c68 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -65,7 +65,7 @@ weston_LDFLAGS = -export-dynamic
+ weston_CPPFLAGS = $(AM_CPPFLAGS) -DIN_WESTON
+ weston_CFLAGS = $(AM_CFLAGS) $(COMPOSITOR_CFLAGS) $(LIBUNWIND_CFLAGS)
+ weston_LDADD = $(COMPOSITOR_LIBS) $(LIBUNWIND_LIBS) \
+-	$(DLOPEN_LIBS) -lm -lrt libshared.la
++	$(DLOPEN_LIBS) -lm $(CLOCK_GETTIME_LIBS) libshared.la
+ 
+ weston_SOURCES =					\
+ 	src/git-version.h				\
+@@ -270,7 +270,8 @@ drm_backend_la_LIBADD =				\
+ 	$(COMPOSITOR_LIBS)			\
+ 	$(DRM_COMPOSITOR_LIBS)			\
+ 	$(INPUT_BACKEND_LIBS)			\
+-	libshared.la -lrt			\
++	libshared.la				\
++	$(CLOCK_GETTIME_LIBS)			\
+ 	libsession-helper.la
+ drm_backend_la_CFLAGS =				\
+ 	$(COMPOSITOR_CFLAGS)			\
+@@ -508,11 +509,11 @@ nodist_weston_presentation_shm_SOURCES =		\
+ 	protocol/presentation-time-protocol.c		\
+ 	protocol/presentation-time-client-protocol.h
+ weston_presentation_shm_CFLAGS = $(AM_CFLAGS) $(SIMPLE_CLIENT_CFLAGS)
+-weston_presentation_shm_LDADD = $(SIMPLE_CLIENT_LIBS) libshared.la -lm -lrt
++weston_presentation_shm_LDADD = $(SIMPLE_CLIENT_LIBS) libshared.la -lm $(CLOCK_GETTIME_LIBS)
+ 
+ weston_multi_resource_SOURCES = clients/multi-resource.c
+ weston_multi_resource_CFLAGS = $(AM_CFLAGS) $(SIMPLE_CLIENT_CFLAGS)
+-weston_multi_resource_LDADD = $(SIMPLE_CLIENT_LIBS) libshared.la -lrt -lm
++weston_multi_resource_LDADD = $(SIMPLE_CLIENT_LIBS) libshared.la $(CLOCK_GETTIME_LIBS) -lm
+ endif
+ 
+ if BUILD_SIMPLE_EGL_CLIENTS
+@@ -580,7 +581,7 @@ BUILT_SOURCES += $(nodist_libtoytoolkit_la_SOURCES)
+ libtoytoolkit_la_LIBADD =			\
+ 	$(CLIENT_LIBS)				\
+ 	$(CAIRO_EGL_LIBS)			\
+-	libshared-cairo.la -lrt -lm
++	libshared-cairo.la $(CLOCK_GETTIME_LIBS) -lm
+ libtoytoolkit_la_CFLAGS = $(AM_CFLAGS) $(CLIENT_CFLAGS) $(CAIRO_EGL_CFLAGS)
+ 
+ weston_flower_SOURCES = clients/flower.c
+@@ -1181,7 +1182,7 @@ vertex_clip_test_SOURCES =			\
+ 	shared/helpers.h			\
+ 	src/vertex-clipping.c			\
+ 	src/vertex-clipping.h
+-vertex_clip_test_LDADD = libtest-runner.la -lm -lrt
++vertex_clip_test_LDADD = libtest-runner.la -lm $(CLOCK_GETTIME_LIBS)
+ 
+ libtest_client_la_SOURCES =			\
+ 	tests/weston-test-client-helper.c	\
+@@ -1269,7 +1270,7 @@ matrix_test_SOURCES =				\
+ 	shared/matrix.c				\
+ 	shared/matrix.h
+ matrix_test_CPPFLAGS = -DUNIT_TEST
+-matrix_test_LDADD = -lm -lrt
++matrix_test_LDADD = -lm $(CLOCK_GETTIME_LIBS)
+ 
+ if ENABLE_IVI_SHELL
+ module_tests += 				\
+diff --git a/configure.ac b/configure.ac
+index 447cf6b..670200c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -46,6 +46,11 @@ AC_CHECK_FUNC([dlopen], [],
+               AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
+ AC_SUBST(DLOPEN_LIBS)
+ 
++# In old glibc versions (< 2.17) clock_gettime() is in librt
++AC_SEARCH_LIBS([clock_gettime], [rt],
++             [CLOCK_GETTIME_LIBS="-lrt"])
++AC_SUBST([CLOCK_GETTIME_LIBS])
++
+ AC_CHECK_DECL(SFD_CLOEXEC,[],
+ 	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile weston")],
+ 	      [[#include <sys/signalfd.h>]])
+-- 
+2.7.3
+
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 052784e..63c43a3 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -9,6 +9,8 @@ WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
+# For 0002-build-add-check-for-clock_gettime-in-librt.patch
+WESTON_AUTORECONF = YES
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 	libxkbcommon pixman libpng jpeg mtdev udev cairo libinput \
-- 
2.7.3
