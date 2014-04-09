From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  9 Apr 2014 14:54:21 +0200
Subject: [Buildroot] [PATCH] mesa3d: fix khrplatform.h installation.
Message-ID: <1397048061-31767-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mesa3D only installs khrplatform.h if EGL support is enabled, whereas
this header file is needed by the headers of OpenGL|ES and OpenVG.

The supplied patch forces Mesa3D to install this header unconditionally.

Fixes http://autobuild.buildroot.net/results/e07/e079219d70830a123977c3ee09d3c11b863d0691

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...atform.h-not-installed-if-EGL-is-disabled.patch | 44 ++++++++++++++++++++++
 package/mesa3d/mesa3d.mk                           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch

diff --git a/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch b/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
new file mode 100644
index 0000000..79df1ce
--- /dev/null
+++ b/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
@@ -0,0 +1,44 @@
+From 83a1afd73f2d0aff9aa11c1754d6d407983afa7d Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Wed, 9 Apr 2014 12:48:36 +0200
+Subject: [PATCH] Fix khrplatform.h not installed if EGL is disabled.
+
+KHR/khrplatform.h is required by the EGL, GLES and VG headers, but is
+only installed if Mesa3d is compiled with EGL support.
+
+This patch installs this header file unconditionally.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ src/egl/main/Makefile.am | 3 ---
+ src/mapi/Makefile.am     | 3 +++
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/egl/main/Makefile.am b/src/egl/main/Makefile.am
+index 60cb600..1cd5cd2 100644
+--- a/src/egl/main/Makefile.am
++++ b/src/egl/main/Makefile.am
+@@ -126,9 +126,6 @@ pkgconfigdir = $(libdir)/pkgconfig
+ 
+ pkgconfig_DATA = egl.pc
+ 
+-khrdir = $(includedir)/KHR
+-khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
+-
+ egldir = $(includedir)/EGL
+ egl_HEADERS = \
+ 	$(top_srcdir)/include/EGL/eglext.h \
+diff --git a/src/mapi/Makefile.am b/src/mapi/Makefile.am
+index ef53803..2a8c555 100644
+--- a/src/mapi/Makefile.am
++++ b/src/mapi/Makefile.am
+@@ -40,3 +40,6 @@ endif
+ if HAVE_OPENVG
+ SUBDIRS += vgapi
+ endif
++
++khrdir = $(includedir)/KHR
++khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
+-- 
+1.9.1
+
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f40b2ee..1e2cc53 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -9,6 +9,7 @@ MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
+MESA3D_AUTORECONF = YES
 
 MESA3D_INSTALL_STAGING = YES
 
-- 
1.9.1
