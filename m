From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 23:50:51 +0100
Subject: [Buildroot] [git commit] weston: bump to version 2.0.0
Message-ID: <20170303225113.D21BC82539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eb1ed921c308de2bbe5d98762ef17525a9618d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...form-include-weston-egl-ext.h-only-if-ENA.patch | 38 --------------
 ...onfigure-search-for-lib-with-clock_getres.patch | 47 ------------------
 ...nclude-weston-egl-ext.h-in-drm-x11-and-wa.patch | 58 ----------------------
 ...ix-building-issue-when-EGL-support-is-not.patch | 47 ------------------
 .../weston/0006-tests-add-missing-include.patch    | 36 --------------
 package/weston/weston.hash                         |  4 +-
 package/weston/weston.mk                           |  4 +-
 7 files changed, 3 insertions(+), 231 deletions(-)

diff --git a/package/weston/0002-shared-platform-include-weston-egl-ext.h-only-if-ENA.patch b/package/weston/0002-shared-platform-include-weston-egl-ext.h-only-if-ENA.patch
deleted file mode 100644
index baa3a4f..0000000
--- a/package/weston/0002-shared-platform-include-weston-egl-ext.h-only-if-ENA.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e338ced1e04bf4b97322d5eed2b5bdf5b052095a Mon Sep 17 00:00:00 2001
-From: Krzysztof Konopko <kris@youview.com>
-Date: Thu, 15 Sep 2016 13:01:49 +0200
-Subject: [PATCH] shared/platform: include weston-egl-ext.h only if ENABLE_EGL
- is defined
-
-Including `weston-egl-ext.h` causes compilation failure for configurations
-with EGL disabled.
-
-Verified with `--disable-egl`, `--disable-x11-compositor`
-and `--disable-drm-compositor`.
-
-Signed-off-by: Krzysztof Konopko <kris@youview.com>
-Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
-[yann.morin.1998 at free.fr: backported from upstream]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- shared/platform.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/shared/platform.h b/shared/platform.h
-index 1eb96fd..30db1a6 100644
---- a/shared/platform.h
-+++ b/shared/platform.h
-@@ -33,9 +33,9 @@
- #include <wayland-egl.h>
- #include <EGL/egl.h>
- #include <EGL/eglext.h>
--#endif
- 
- #include "weston-egl-ext.h"
-+#endif
- 
- #ifdef  __cplusplus
- extern "C" {
--- 
-2.7.4
-
diff --git a/package/weston/0003-configure-search-for-lib-with-clock_getres.patch b/package/weston/0003-configure-search-for-lib-with-clock_getres.patch
deleted file mode 100644
index a8ad9ea..0000000
--- a/package/weston/0003-configure-search-for-lib-with-clock_getres.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e269012c4b919624ca92d80afd1d6a6f5399e041 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Mon, 19 Dec 2016 18:07:07 +0100
-Subject: [PATCH] configure: search for lib with clock_getres()
-
-Like clock_gettime(), clock_getres() is in -lrt for glibc < 2.17.
-Add a check for it, like is done for clock_gettime().
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Upstream status: submitted
-https://lists.freedesktop.org/archives/wayland-devel/2016-December/032354.html
----
- Makefile.am  | 1 +
- configure.ac | 3 ++-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 2219e3d..53f8f51 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -190,6 +190,7 @@ weston_CFLAGS = $(AM_CFLAGS) $(COMPOSITOR_CFLAGS) $(LIBUNWIND_CFLAGS)
- weston_LDADD = libshared.la libweston- at LIBWESTON_MAJOR@.la \
- 	$(COMPOSITOR_LIBS) $(LIBUNWIND_LIBS) \
- 	$(DLOPEN_LIBS) $(LIBINPUT_BACKEND_LIBS) \
-+	$(CLOCK_GETRES_LIBS) \
- 	-lm
- 
- weston_SOURCES = 					\
-diff --git a/configure.ac b/configure.ac
-index 1e251bf..604f51b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -88,8 +88,9 @@ PKG_PROG_PKG_CONFIG()
- 
- WESTON_SEARCH_LIBS([DLOPEN], [dl], [dlopen])
- 
--# In old glibc versions (< 2.17) clock_gettime() is in librt
-+# In old glibc versions (< 2.17) clock_gettime() and clock_getres() are in librt
- WESTON_SEARCH_LIBS([CLOCK_GETTIME], [rt], [clock_gettime])
-+WESTON_SEARCH_LIBS([CLOCK_GETRES], [rt], [clock_getres])
- 
- AC_CHECK_DECL(SFD_CLOEXEC,[],
- 	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile weston")],
--- 
-2.7.4
-
diff --git a/package/weston/0004-libweston-include-weston-egl-ext.h-in-drm-x11-and-wa.patch b/package/weston/0004-libweston-include-weston-egl-ext.h-in-drm-x11-and-wa.patch
deleted file mode 100644
index 9012f5f..0000000
--- a/package/weston/0004-libweston-include-weston-egl-ext.h-in-drm-x11-and-wa.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From c950667e87dc175bd2741a51460ebd3e29a57c92 Mon Sep 17 00:00:00 2001
-From: Vincent Abriou <vincent.abriou@st.com>
-Date: Wed, 5 Oct 2016 16:14:07 +0200
-Subject: [PATCH] libweston: include weston-egl-ext.h in drm, x11 and wayland
- compositor
-
-As to what is done for gl-renderer.c, weston-egl-ext.h should be
-include in compositor-drm.c, compositor-x11.c and compositor-wayland.c.
-This fix building issue with GPU that does not have EGL_PLATFORM_xxx_KHR
-in their extension header file eglext.h.
-
-Signed-off-by: Vincent Abriou <vincent.abriou@st.com>
-Reviewed-by: Daniel Stone <daniels@collabora.com>
----
- libweston/compositor-drm.c     | 1 +
- libweston/compositor-wayland.c | 1 +
- libweston/compositor-x11.c     | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
-index 567240f..f61e3d9 100644
---- a/libweston/compositor-drm.c
-+++ b/libweston/compositor-drm.c
-@@ -52,6 +52,7 @@
- #include "shared/helpers.h"
- #include "shared/timespec-util.h"
- #include "gl-renderer.h"
-+#include "weston-egl-ext.h"
- #include "pixman-renderer.h"
- #include "libbacklight.h"
- #include "libinput-seat.h"
-diff --git a/libweston/compositor-wayland.c b/libweston/compositor-wayland.c
-index 580c7b5..46fdde1 100644
---- a/libweston/compositor-wayland.c
-+++ b/libweston/compositor-wayland.c
-@@ -44,6 +44,7 @@
- #include "compositor.h"
- #include "compositor-wayland.h"
- #include "gl-renderer.h"
-+#include "weston-egl-ext.h"
- #include "pixman-renderer.h"
- #include "shared/helpers.h"
- #include "shared/image-loader.h"
-diff --git a/libweston/compositor-x11.c b/libweston/compositor-x11.c
-index dadcd10..1c6de08 100644
---- a/libweston/compositor-x11.c
-+++ b/libweston/compositor-x11.c
-@@ -56,6 +56,7 @@
- #include "shared/helpers.h"
- #include "shared/image-loader.h"
- #include "gl-renderer.h"
-+#include "weston-egl-ext.h"
- #include "pixman-renderer.h"
- #include "presentation-time-server-protocol.h"
- #include "linux-dmabuf.h"
--- 
-2.7.4
-
diff --git a/package/weston/0005-libweston-fix-building-issue-when-EGL-support-is-not.patch b/package/weston/0005-libweston-fix-building-issue-when-EGL-support-is-not.patch
deleted file mode 100644
index 6a5b192..0000000
--- a/package/weston/0005-libweston-fix-building-issue-when-EGL-support-is-not.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 7327d5a7a29ad31af871e144ebe053cb1ab478f7 Mon Sep 17 00:00:00 2001
-From: Vincent Abriou <vincent.abriou@st.com>
-Date: Tue, 11 Oct 2016 13:47:03 +0200
-Subject: [PATCH] libweston: fix building issue when EGL support is not enabled
-
-weston-egl-ext.h has been include in compositor-xx.c file in order to
-define EGL_PLATFORM_xxx_KHR extensions used by the compositors.
-But in case EGL support is not enabled, all EGL related definition must
-be skipped except EGL_PLATFORM_xxx_KHR that must be still defined to
-allow compositor-xx.c to build.
-
-Signed-off-by: Vincent Abriou <vincent.abriou@st.com>
-Reviewed-by: Giulio Camuffo <giuliocamuffo@gmail.com>
----
- libweston/weston-egl-ext.h | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/libweston/weston-egl-ext.h b/libweston/weston-egl-ext.h
-index 6e36996..70556fd 100644
---- a/libweston/weston-egl-ext.h
-+++ b/libweston/weston-egl-ext.h
-@@ -28,6 +28,8 @@
- #ifndef WESTON_EGL_EXT_H
- #define WESTON_EGL_EXT_H
- 
-+#ifdef ENABLE_EGL
-+
- #ifndef EGL_WL_bind_wayland_display
- #define EGL_WL_bind_wayland_display 1
- 
-@@ -152,5 +154,13 @@ typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATEPLATFORMPIXMAPSURFACEEXTPROC) (EGLD
- #define EGL_PLATFORM_X11_KHR 0x31D5
- #endif
- 
-+#else /* ENABLE_EGL */
-+
-+/* EGL platform definition are keept to allow compositor-xx.c to build */
-+#define EGL_PLATFORM_GBM_KHR     0x31D7
-+#define EGL_PLATFORM_WAYLAND_KHR 0x31D8
-+#define EGL_PLATFORM_X11_KHR     0x31D5
-+
-+#endif /* ENABLE_EGL */
- 
- #endif
--- 
-2.7.4
-
diff --git a/package/weston/0006-tests-add-missing-include.patch b/package/weston/0006-tests-add-missing-include.patch
deleted file mode 100644
index 67dc3df..0000000
--- a/package/weston/0006-tests-add-missing-include.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4c9e149d641a9945c3a8e15707b8712834f08c4f Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 22 Jan 2017 14:46:28 +0100
-Subject: [PATCH] tests: add missing include
-
-The int32_t type is defined in stdint.h.
-
-The musl C library is very conservative in the headers that it
-internally includes, and stdint.h is not included by any other header,
-unlike with glibc or uClibc, which breaks the build.
-
-Add the missing header.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Status: sent upstream
-    https://lists.freedesktop.org/archives/wayland-devel/2017-January/032771.html
----
- tests/string-test.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/string-test.c b/tests/string-test.c
-index a72ec30..5571b52 100644
---- a/tests/string-test.c
-+++ b/tests/string-test.c
-@@ -28,6 +28,7 @@
- #include <stdlib.h>
- #include <stdbool.h>
- #include <stdio.h>
-+#include <stdint.h>
- #include <assert.h>
- 
- #include "shared/string-helpers.h"
--- 
-2.7.4
-
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index c966864..85b4613 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-September/031123.html
-sha256  ac7ac2a32e3b9f50131fccded5d2326bd36b2226712d90b61999118a09af5033  weston-1.12.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-February/033231.html
+sha256  b4e446ac27f118196f1609dab89bb3cb3e81652d981414ad860e733b355365d8  weston-2.0.0.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 9bd127c..a6d9faa 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.12.0
+WESTON_VERSION = 2.0.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
-# configure.ac patched by 0003-configure-search-for-lib-with-clock_getres.patch
-WESTON_AUTORECONF = YES
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 	libxkbcommon pixman libpng jpeg mtdev udev cairo libinput \
