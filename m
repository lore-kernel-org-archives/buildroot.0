From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Jul 2014 15:53:23 +0200
Subject: [Buildroot] [PATCH 7/7] xserver_xorg-server: Bump version to 1.16.0
In-Reply-To: <1405778003-2712-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405778003-2712-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405778003-2712-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version bump includes bumping version

xlib_libXfont to 1.4.99.901 & xproto_fontsproto to 2.1.3.

xserver_xorg-server 1.16.0 depends on them, but they are incompatible
with older versions of xserver_xorg-server, for details and libXfont-related
CVE?s see http://lists.x.org/archives/xorg-announce/2014-July/002453.html

Also remove patches applied upstream.

Since a different patch than xserver_xorg-server-100-mips.patch
was committed upstream:
http://cgit.freedesktop.org/xorg/xserver/commit/?id=19e5a13970ad9d440c0789395e94931429ef4fbb
I also compile tested using this defconfig:

BR2_mips64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    2 +-
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |    2 +-
 .../xserver_xorg-server-100-mips.patch             |   17 ----
 ...erver_xorg-server-200-add-support-for-arc.patch |   81 --------------------
 ...tensa-add-support-for-xtensa-architecture.patch |   74 ------------------
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 6 files changed, 3 insertions(+), 175 deletions(-)
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-100-mips.patch
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-200-add-support-for-arc.patch
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-300-xtensa-add-support-for-xtensa-architecture.patch

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 5f2b1e1..17cd557 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT_VERSION = 1.4.8
+XLIB_LIBXFONT_VERSION = 1.4.99.901
 XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_LICENSE = MIT
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index 64d7bea..b4e6d6a 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_FONTSPROTO_VERSION = 2.1.2
+XPROTO_FONTSPROTO_VERSION = 2.1.3
 XPROTO_FONTSPROTO_SOURCE = fontsproto-$(XPROTO_FONTSPROTO_VERSION).tar.bz2
 XPROTO_FONTSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FONTSPROTO_LICENSE = MIT
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-100-mips.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-100-mips.patch
deleted file mode 100644
index ac01e7c..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-100-mips.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Taken from upstream bug tracker:
-https://bugs.freedesktop.org/show_bug.cgi?id=72126
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -up xorg-server-1.14.4/hw/xfree86/common/compiler.h xorg-server-1.14.4-fix/hw/xfree86/common/compiler.h
---- xorg-server-1.14.4/hw/xfree86/common/compiler.h	2013-07-26 01:14:32.000000000 -0400
-+++ xorg-server-1.14.4-fix/hw/xfree86/common/compiler.h	2013-11-27 23:16:46.000000000 -0500
-@@ -727,7 +727,7 @@ xf86WriteMmio32LeNB(__volatile__ void *b
- #define PORT_SIZE short
- #endif
- 
--_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
-+_X_EXPORT uintptr_t IOPortBase;      /* Memory mapped I/O port area */
- 
- static __inline__ void
- outb(unsigned PORT_SIZE port, unsigned char val)
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-200-add-support-for-arc.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-200-add-support-for-arc.patch
deleted file mode 100644
index 4bf2018..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-200-add-support-for-arc.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Upstream-Status: Backport (should be a part of 1.15.2 - remove then)
-
-http://cgit.freedesktop.org/xorg/xserver/commit/?id=c08d2b8ccb0158dbf1f529f80cc3236e66236cce
-
-From c08d2b8ccb0158dbf1f529f80cc3236e66236cce Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
-Date: Thu, 01 May 2014 12:39:29 +0000
-Subject: ARC: Add support for ARC architecture
-
-Xorg server could be built for and run on Synopsys DesignWare ARC cores.
-These changes are required for successful building and execution of the server.
-
-Both little-endian and big-endian flavors of ARC cores are supported.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-Acked-by: Adam Jackson <ajax@redhat.com>
-Reviewed-by: Egbert Eich <eich@freedesktop.org>
-Signed-off-by: Keith Packard <keithp@keithp.com>
----
-diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
-index fb95f58..0319de0 100644
---- a/hw/xfree86/common/compiler.h
-+++ b/hw/xfree86/common/compiler.h
-@@ -1352,7 +1352,7 @@ stl_u(unsigned long val, unsigned int *p)
- #else                           /* ix86 */
- 
- #if !defined(__SUNPRO_C)
--#if !defined(FAKEIT) && !defined(__mc68000__) && !defined(__arm__) && !defined(__sh__) && !defined(__hppa__) && !defined(__s390__) && !defined(__m32r__) && !defined(__aarch64__)
-+#if !defined(FAKEIT) && !defined(__mc68000__) && !defined(__arm__) && !defined(__sh__) && !defined(__hppa__) && !defined(__s390__) && !defined(__m32r__) && !defined(__aarch64__) && !defined(__arc__)
- #ifdef GCCUSESGAS
- 
- /*
-@@ -1454,7 +1454,7 @@ inl(unsigned short port)
- 
- #endif                          /* GCCUSESGAS */
- 
--#else                           /* !defined(FAKEIT) && !defined(__mc68000__)  && !defined(__arm__) && !defined(__sh__) && !defined(__hppa__) && !defined(__m32r__) */
-+#else                           /* !defined(FAKEIT) && !defined(__mc68000__)  && !defined(__arm__) && !defined(__sh__) && !defined(__hppa__) && !defined(__m32r__) && !defined(__arc__) */
- 
- static __inline__ void
- outb(unsigned short port, unsigned char val)
-diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-support/linux/lnx_video.c
-index 47f5abc..40765fc 100644
---- a/hw/xfree86/os-support/linux/lnx_video.c
-+++ b/hw/xfree86/os-support/linux/lnx_video.c
-@@ -59,7 +59,8 @@ static Bool ExtendedEnabled = FALSE;
-       !defined(__mips__) && \
-       !defined(__nds32__) && \
-       !defined(__arm__) && \
--      !defined(__aarch64__)
-+      !defined(__aarch64__) && \
-+      !defined(__arc__)
- 
- /*
-  * Due to conflicts with "compiler.h", don't rely on <sys/io.h> to declare
-diff --git a/include/servermd.h b/include/servermd.h
-index 11f6c10..2d1ccb1 100644
---- a/include/servermd.h
-+++ b/include/servermd.h
-@@ -300,6 +300,19 @@ SOFTWARE.
- 
- #endif                          /* __aarch64__ */
- 
-+#if defined(__arc__)
-+
-+#if defined(__BIG_ENDIAN__)
-+#define IMAGE_BYTE_ORDER	MSBFirst
-+#define BITMAP_BIT_ORDER	MSBFirst
-+#else
-+#define IMAGE_BYTE_ORDER	LSBFirst
-+#define BITMAP_BIT_ORDER	LSBFirst
-+#endif
-+#define GLYPHPADBYTES		4
-+
-+#endif                          /* ARC */
-+
- /* size of buffer to use with GetImage, measured in bytes. There's obviously
-  * a trade-off between the amount of heap used and the number of times the
-  * ddx routine has to be called.
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-300-xtensa-add-support-for-xtensa-architecture.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-300-xtensa-add-support-for-xtensa-architecture.patch
deleted file mode 100644
index 67bce1c..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-300-xtensa-add-support-for-xtensa-architecture.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From dc8d0688471695ec5a8db5fef93fbcfc064891d5 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Mon, 2 Jun 2014 01:17:31 +0400
-Subject: [PATCH] xtensa: add support for xtensa architecture
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-Reviewed-by: Adam Jackson <ajax@redhat.com>
-Signed-off-by: Keith Packard <keithp@keithp.com>
----
-Backported from: dc8d0688471695ec5a8db5fef93fbcfc064891d5
-
- hw/xfree86/common/compiler.h            |    5 ++++-
- hw/xfree86/os-support/linux/lnx_video.c |    3 ++-
- include/servermd.h                      |   14 ++++++++++++++
- 3 files changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
-index 0319de0..1bd8def 100644
---- a/hw/xfree86/common/compiler.h
-+++ b/hw/xfree86/common/compiler.h
-@@ -1352,7 +1352,10 @@ stl_u(unsigned long val, unsigned int *p)
- #else                           /* ix86 */
- 
- #if !defined(__SUNPRO_C)
--#if !defined(FAKEIT) && !defined(__mc68000__) && !defined(__arm__) && !defined(__sh__) && !defined(__hppa__) && !defined(__s390__) && !defined(__m32r__) && !defined(__aarch64__) && !defined(__arc__)
-+#if !defined(FAKEIT) && !defined(__mc68000__) && !defined(__arm__) && \
-+    !defined(__sh__) && !defined(__hppa__) && !defined(__s390__) && \
-+    !defined(__m32r__) && !defined(__aarch64__) && !defined(__arc__) && \
-+    !defined(__xtensa__)
- #ifdef GCCUSESGAS
- 
- /*
-diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-support/linux/lnx_video.c
-index 40765fc..652f963 100644
---- a/hw/xfree86/os-support/linux/lnx_video.c
-+++ b/hw/xfree86/os-support/linux/lnx_video.c
-@@ -60,7 +60,8 @@ static Bool ExtendedEnabled = FALSE;
-       !defined(__nds32__) && \
-       !defined(__arm__) && \
-       !defined(__aarch64__) && \
--      !defined(__arc__)
-+      !defined(__arc__) && \
-+      !defined(__xtensa__)
- 
- /*
-  * Due to conflicts with "compiler.h", don't rely on <sys/io.h> to declare
-diff --git a/include/servermd.h b/include/servermd.h
-index 2d1ccb1..081123b 100644
---- a/include/servermd.h
-+++ b/include/servermd.h
-@@ -313,6 +313,20 @@ SOFTWARE.
- 
- #endif                          /* ARC */
- 
-+#ifdef __xtensa__
-+
-+#ifdef __XTENSA_EL__
-+#define IMAGE_BYTE_ORDER        LSBFirst
-+#define BITMAP_BIT_ORDER        LSBFirst
-+#endif
-+#ifdef __XTENSA_EB__
-+#define IMAGE_BYTE_ORDER        MSBFirst
-+#define BITMAP_BIT_ORDER        MSBFirst
-+#endif
-+#define GLYPHPADBYTES           4
-+
-+#endif                          /* __xtensa__ */
-+
- /* size of buffer to use with GetImage, measured in bytes. There's obviously
-  * a trade-off between the amount of heap used and the number of times the
-  * ddx routine has to be called.
--- 
-1.7.7.6
-
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 779c46d..9188411 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.15.2
+XSERVER_XORG_SERVER_VERSION = 1.16.0
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
1.7.10.4
