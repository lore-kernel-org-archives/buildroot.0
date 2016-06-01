From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  1 Jun 2016 08:37:16 -0300
Subject: [Buildroot] [PATCH 3/4] weston: bump to version 1.11.0
In-Reply-To: <1464781037-26791-1-git-send-email-gustavo@zacarias.com.ar>
References: <1464781037-26791-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1464781037-26791-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...uild-add-check-for-clock_gettime-in-librt.patch | 101 ---------------------
 package/weston/weston.hash                         |   4 +-
 package/weston/weston.mk                           |   2 +-
 3 files changed, 3 insertions(+), 104 deletions(-)
 delete mode 100644 package/weston/0002-build-add-check-for-clock_gettime-in-librt.patch

diff --git a/package/weston/0002-build-add-check-for-clock_gettime-in-librt.patch b/package/weston/0002-build-add-check-for-clock_gettime-in-librt.patch
deleted file mode 100644
index 2c8f54e..0000000
--- a/package/weston/0002-build-add-check-for-clock_gettime-in-librt.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 4c0a6ed01fb1aab578dc6ac29f11524a3883e14f Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 20 Apr 2016 13:16:58 -0300
-Subject: [PATCH] build: add check for clock_gettime() in librt
-
-In older versions of glibc (< 2.17) clock_gettime() is in librt, hence
-linking against librt is required when using it.
-Add a configure check for this and replace all instances of -lrt in
-Makefile.am with $(CLOCK_GETTIME_LIBS).
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: submitted upstream
-
- Makefile.am  | 15 ++++++++-------
- configure.ac |  5 +++++
- 2 files changed, 13 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index d3c3f71..c042c68 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -65,7 +65,7 @@ weston_LDFLAGS = -export-dynamic
- weston_CPPFLAGS = $(AM_CPPFLAGS) -DIN_WESTON
- weston_CFLAGS = $(AM_CFLAGS) $(COMPOSITOR_CFLAGS) $(LIBUNWIND_CFLAGS)
- weston_LDADD = $(COMPOSITOR_LIBS) $(LIBUNWIND_LIBS) \
--	$(DLOPEN_LIBS) -lm -lrt libshared.la
-+	$(DLOPEN_LIBS) -lm $(CLOCK_GETTIME_LIBS) libshared.la
- 
- weston_SOURCES =					\
- 	src/git-version.h				\
-@@ -270,7 +270,8 @@ drm_backend_la_LIBADD =				\
- 	$(COMPOSITOR_LIBS)			\
- 	$(DRM_COMPOSITOR_LIBS)			\
- 	$(INPUT_BACKEND_LIBS)			\
--	libshared.la -lrt			\
-+	libshared.la				\
-+	$(CLOCK_GETTIME_LIBS)			\
- 	libsession-helper.la
- drm_backend_la_CFLAGS =				\
- 	$(COMPOSITOR_CFLAGS)			\
-@@ -508,11 +509,11 @@ nodist_weston_presentation_shm_SOURCES =		\
- 	protocol/presentation-time-protocol.c		\
- 	protocol/presentation-time-client-protocol.h
- weston_presentation_shm_CFLAGS = $(AM_CFLAGS) $(SIMPLE_CLIENT_CFLAGS)
--weston_presentation_shm_LDADD = $(SIMPLE_CLIENT_LIBS) libshared.la -lm -lrt
-+weston_presentation_shm_LDADD = $(SIMPLE_CLIENT_LIBS) libshared.la -lm $(CLOCK_GETTIME_LIBS)
- 
- weston_multi_resource_SOURCES = clients/multi-resource.c
- weston_multi_resource_CFLAGS = $(AM_CFLAGS) $(SIMPLE_CLIENT_CFLAGS)
--weston_multi_resource_LDADD = $(SIMPLE_CLIENT_LIBS) libshared.la -lrt -lm
-+weston_multi_resource_LDADD = $(SIMPLE_CLIENT_LIBS) libshared.la $(CLOCK_GETTIME_LIBS) -lm
- endif
- 
- if BUILD_SIMPLE_EGL_CLIENTS
-@@ -580,7 +581,7 @@ BUILT_SOURCES += $(nodist_libtoytoolkit_la_SOURCES)
- libtoytoolkit_la_LIBADD =			\
- 	$(CLIENT_LIBS)				\
- 	$(CAIRO_EGL_LIBS)			\
--	libshared-cairo.la -lrt -lm
-+	libshared-cairo.la $(CLOCK_GETTIME_LIBS) -lm
- libtoytoolkit_la_CFLAGS = $(AM_CFLAGS) $(CLIENT_CFLAGS) $(CAIRO_EGL_CFLAGS)
- 
- weston_flower_SOURCES = clients/flower.c
-@@ -1181,7 +1182,7 @@ vertex_clip_test_SOURCES =			\
- 	shared/helpers.h			\
- 	src/vertex-clipping.c			\
- 	src/vertex-clipping.h
--vertex_clip_test_LDADD = libtest-runner.la -lm -lrt
-+vertex_clip_test_LDADD = libtest-runner.la -lm $(CLOCK_GETTIME_LIBS)
- 
- libtest_client_la_SOURCES =			\
- 	tests/weston-test-client-helper.c	\
-@@ -1269,7 +1270,7 @@ matrix_test_SOURCES =				\
- 	shared/matrix.c				\
- 	shared/matrix.h
- matrix_test_CPPFLAGS = -DUNIT_TEST
--matrix_test_LDADD = -lm -lrt
-+matrix_test_LDADD = -lm $(CLOCK_GETTIME_LIBS)
- 
- if ENABLE_IVI_SHELL
- module_tests += 				\
-diff --git a/configure.ac b/configure.ac
-index 447cf6b..670200c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -46,6 +46,11 @@ AC_CHECK_FUNC([dlopen], [],
-               AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
- AC_SUBST(DLOPEN_LIBS)
- 
-+# In old glibc versions (< 2.17) clock_gettime() is in librt
-+AC_SEARCH_LIBS([clock_gettime], [rt],
-+             [CLOCK_GETTIME_LIBS="-lrt"])
-+AC_SUBST([CLOCK_GETTIME_LIBS])
-+
- AC_CHECK_DECL(SFD_CLOEXEC,[],
- 	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile weston")],
- 	      [[#include <sys/signalfd.h>]])
--- 
-2.7.3
-
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index ed174e6..4f23511 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-February/027039.html
-sha256  e0b2004d00d8293ddf7903ca283c1746afa9ccb5919ab50fd04397ff472aa5c1  weston-1.10.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-June/029164.html
+sha256  05e086e9f186a06843b9f7a5e1abf19347b1a6e4be26d7e74927abc17b6b7125  weston-1.11.0.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 8455a94..6902658 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.10.0
+WESTON_VERSION = 1.11.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
-- 
2.7.3
