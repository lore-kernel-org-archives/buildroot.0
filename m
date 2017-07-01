From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Jul 2017 10:09:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
	mesa3d-headers}: bump version to 17.1.4
Message-ID: <20170701080933.26646-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0001, applied upstream:
https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=0069a613ac3b6ca75315cbb2fd3d86b0f6c9ede4

Renumbered remaining patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...atform.h-not-installed-if-EGL-is-disabled.patch | 39 ----------------------
 ...ch => 0001-Fix-runtime-error-with-uClibc.patch} |  0
 .../mesa3d/{0003-musl.patch => 0002-musl.patch}    |  0
 ...ess-detection-with-musl-based-toolchains.patch} |  0
 ...c-invert-order-for-wayland-scanner-check.patch} |  0
 package/mesa3d/mesa3d.hash                         | 10 +++---
 package/mesa3d/mesa3d.mk                           |  2 +-
 8 files changed, 7 insertions(+), 46 deletions(-)
 delete mode 100644 package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
 rename package/mesa3d/{0002-Fix-runtime-error-with-uClibc.patch => 0001-Fix-runtime-error-with-uClibc.patch} (100%)
 rename package/mesa3d/{0003-musl.patch => 0002-musl.patch} (100%)
 rename package/mesa3d/{0004-Fix-endianess-detection-with-musl-based-toolchains.patch => 0003-Fix-endianess-detection-with-musl-based-toolchains.patch} (100%)
 rename package/mesa3d/{0005-configure.ac-invert-order-for-wayland-scanner-check.patch => 0004-configure.ac-invert-order-for-wayland-scanner-check.patch} (100%)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 5e6490538..0cae1808e 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.1.3
+MESA3D_HEADERS_VERSION = 17.1.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch b/package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
deleted file mode 100644
index ab773f85a..000000000
--- a/package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 83a1afd73f2d0aff9aa11c1754d6d407983afa7d Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Wed, 9 Apr 2014 12:48:36 +0200
-Subject: [PATCH] Fix khrplatform.h not installed if EGL is disabled.
-
-KHR/khrplatform.h is required by the EGL, GLES and VG headers, but is
-only installed if Mesa3d is compiled with EGL support.
-
-This patch installs this header file unconditionally.
-
-Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=77240
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de> (rebased for mesa3d 10.3)
-
-diff -uNr Mesa-10.3.0-rc2.org/src/egl/main/Makefile.am Mesa-10.3.0-rc2/src/egl/main/Makefile.am
---- Mesa-10.3.0-rc2.org/src/egl/Makefile.am	2014-08-29 00:00:57.000000000 +0200
-+++ Mesa-10.3.0-rc2/src/egl/Makefile.am	2014-09-02 21:35:52.548071820 +0200
-@@ -85,9 +85,6 @@
- 
- pkgconfig_DATA = egl.pc
- 
--khrdir = $(includedir)/KHR
--khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
--
- egldir = $(includedir)/EGL
- egl_HEADERS = \
- 	$(top_srcdir)/include/EGL/eglext.h \
-diff -uNr Mesa-10.3.0-rc2.org/src/mapi/Makefile.am Mesa-10.3.0-rc2/src/mapi/Makefile.am
---- Mesa-10.3.0-rc2.org/src/mapi/Makefile.am	2014-09-01 01:22:12.000000000 +0200
-+++ Mesa-10.3.0-rc2/src/mapi/Makefile.am	2014-09-02 21:36:22.891686861 +0200
-@@ -211,4 +211,7 @@
- SUBDIRS += vgapi
- endif
- 
-+khrdir = $(includedir)/KHR
-+khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
-+
- include $(top_srcdir)/install-lib-links.mk
diff --git a/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch b/package/mesa3d/0001-Fix-runtime-error-with-uClibc.patch
similarity index 100%
rename from package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch
rename to package/mesa3d/0001-Fix-runtime-error-with-uClibc.patch
diff --git a/package/mesa3d/0003-musl.patch b/package/mesa3d/0002-musl.patch
similarity index 100%
rename from package/mesa3d/0003-musl.patch
rename to package/mesa3d/0002-musl.patch
diff --git a/package/mesa3d/0004-Fix-endianess-detection-with-musl-based-toolchains.patch b/package/mesa3d/0003-Fix-endianess-detection-with-musl-based-toolchains.patch
similarity index 100%
rename from package/mesa3d/0004-Fix-endianess-detection-with-musl-based-toolchains.patch
rename to package/mesa3d/0003-Fix-endianess-detection-with-musl-based-toolchains.patch
diff --git a/package/mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch b/package/mesa3d/0004-configure.ac-invert-order-for-wayland-scanner-check.patch
similarity index 100%
rename from package/mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch
rename to package/mesa3d/0004-configure.ac-invert-order-for-wayland-scanner-check.patch
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 80e8cbd54..51cc3006c 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-June/000337.html
-md5 1946a93d543bc219427e2bebe2ac4752  mesa-17.1.3.tar.xz
-sha1 c79c420d9ecb08ed56d106427528793bdd3ab7ab  mesa-17.1.3.tar.xz
-sha256 5f1ee9a8aea2880f887884df2dea0c16dd1b13eb42fd2e52265db0dc1b380e8c mesa-17.1.3.tar.xz
-sha512 b487d4f3d7717f379e7aaf66958bbef886fbae219e6e0333123c4623dc7db84109aca8cf07be08c0b79a74bdb198c704073fd549c6e85aa952ed3c97da1a8a94 mesa-17.1.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-June/000339.html
+md5 be2ef7c9edec23b07f74f6512a6a6fa5  mesa-17.1.4.tar.xz
+sha1 70a6c971125f754b78e502ade668bd02e46074d6  mesa-17.1.4.tar.xz
+sha256 06f3b0e6a28f0d20b7f3391cf67fe89ae98ecd0a686cd545da76557b6cec9cad  mesa-17.1.4.tar.xz
+sha512 cb8369f0edd3e17b4eee8da159b9dc487f8144d69fe4b95901e9aa6a924759866f26f91fc2ead7036707eecea41582185e7ce73d54f97bf310f198b72ee0a8e4  mesa-17.1.4.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9f190ba53..7b312e34e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.1.3
+MESA3D_VERSION = 17.1.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
