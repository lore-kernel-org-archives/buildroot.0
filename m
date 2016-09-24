From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 Sep 2016 14:28:36 -0300
Subject: [Buildroot] [PATCH 3/9] weston: bump to version 1.12.0
In-Reply-To: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474738122-18949-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also drop upstream patch.
Drop propietary RPI support since it's gone upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ompositor-rdp-fix-no-break-space-U-A0-U8-.patch | 34 ----------------------
 package/weston/Config.in                           |  6 ----
 package/weston/weston.hash                         |  4 +--
 package/weston/weston.mk                           | 11 +------
 4 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch

diff --git a/package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch b/package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch
deleted file mode 100644
index b391147..0000000
--- a/package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7ee8589dd83e52ae6af3ec5247c3403e8ded69a5 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Tue, 9 Aug 2016 20:00:29 +0200
-Subject: [PATCH] libweston/compositor-rdp: fix no-break space U+A0 (U8+C2A0)
-
-There is a UTF-8 no-break space (U+A0, U8+C2A0) in the definition of
-macro NSC_RESET in the case of  1.2.2 <= FreeRDP < 2.0.
-
-This is causing build issues (\302 is 0xC2, \240 is 0xA0):
-    http://autobuild.buildroot.net/results/f49/f49a9cbb7bdc5d9e05dcf0a20bd83f059e234e74/build-end.log
-
-Fix that by using a plain, boring space U+20.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- libweston/compositor-rdp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/compositor-rdp.c b/src/compositor-rdp.c
-index 11f5f05..ee81300 100644
---- a/src/compositor-rdp.c
-+++ b/src/compositor-rdp.c
-@@ -58,7 +58,7 @@
- #	define NSC_RESET(C, W, H) nsc_context_reset(C, W, H)
- #	define RFX_RESET(C, W, H) rfx_context_reset(C, W, H)
- #else
--#	define NSC_RESET(C, W, H) do {?nsc_context_reset(C); C->width = W; C->height = H; } while(0)
-+#	define NSC_RESET(C, W, H) do { nsc_context_reset(C); C->width = W; C->height = H; } while(0)
- #	define RFX_RESET(C, W, H) do { rfx_context_reset(C); C->width = W; C->height = H; } while(0)
- #endif
- #define FREERDP_CB_RET_TYPE BOOL
--- 
-2.7.4
-
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 6baa24b..b4e198d 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -77,12 +77,6 @@ comment "RDP compositor needs a toolchain w/ wchar, C++"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
 
-# rpi-userland is an EGL/GLES provider, so we can't select it
-config BR2_PACKAGE_WESTON_RPI
-	bool "RPi compositor"
-	depends on BR2_PACKAGE_RPI_USERLAND
-	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
-
 config BR2_PACKAGE_WESTON_X11
 	bool "X11 compositor"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 4f23511..c966864 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-June/029164.html
-sha256  05e086e9f186a06843b9f7a5e1abf19347b1a6e4be26d7e74927abc17b6b7125  weston-1.11.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-September/031123.html
+sha256  ac7ac2a32e3b9f50131fccded5d2326bd36b2226712d90b61999118a09af5033  weston-1.12.0.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 31c9281..7d348dc 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.11.0
+WESTON_VERSION = 1.12.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -89,15 +89,6 @@ else
 WESTON_CONF_OPTS += --disable-drm-compositor
 endif
 
-ifeq ($(BR2_PACKAGE_WESTON_RPI),y)
-WESTON_DEPENDENCIES += rpi-userland
-WESTON_CONF_OPTS += --enable-rpi-compositor \
-	--disable-resize-optimization \
-	WESTON_NATIVE_BACKEND=rpi-backend.so
-else
-WESTON_CONF_OPTS += --disable-rpi-compositor
-endif # BR2_PACKAGE_WESTON_RPI
-
 ifeq ($(BR2_PACKAGE_WESTON_X11),y)
 WESTON_CONF_OPTS += \
 	--enable-x11-compositor \
-- 
2.7.3
