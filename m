From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  9 Jun 2014 14:15:39 +0200
Subject: [Buildroot] [PATCH] Revert "package/weston: libxkbcommon is
	optional"
Message-ID: <1402316139-7639-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This reverts commit cf1c2eb19d3eeddca04013cfa7b2107530abf054.

xkbcommon is still needed for the clients. There's no point in disabling
the clients, or weston is unusable (as packaged in Buildroot.)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 11 +----------
 package/weston/weston.mk |  9 +--------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 96ebdf1..aaef405 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -5,6 +5,7 @@ comment "weston needs udev and a toolchain w/ threads, headers >= 3.0"
 config BR2_PACKAGE_WESTON
 	bool "weston"
 	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_LIBPNG
@@ -28,16 +29,6 @@ config BR2_PACKAGE_WESTON
 
 if BR2_PACKAGE_WESTON
 
-config BR2_PACKAGE_WESTON_HW_KBD
-	bool "enable keyboard support"
-	default y
-	select BR2_PACKAGE_LIBXKBCOMMON
-	help
-	  Say 'y' here if you plan on using a keyboard.
-
-	  Only say 'n' if you're going to use a virtual keyboard or any other
-	  input method.
-
 # Helper to make sure at least one compositor is selected.
 config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	bool
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 325cfc7..ed0707b 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -10,7 +10,7 @@ WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
-WESTON_DEPENDENCIES = host-pkgconf wayland pixman libpng \
+WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
 	jpeg mtdev udev cairo
 
 WESTON_CONF_OPT = \
@@ -25,13 +25,6 @@ WESTON_CONF_OPT = \
 	--disable-weston-launch \
 	--disable-colord
 
-ifeq ($(BR2_PACKAGE_WESTON_HW_KBD),y)
-WESTON_DEPENDENCIES += libxkbcommon
-WESTON_CONF_OPT += --enable-xkbcommon
-else
-WESTON_CONF_OPT += --disable-xkbcommon
-endif
-
 ifeq ($(BR2_PACKAGE_LIBINPUT),y)
 WESTON_DEPENDENCIES += libinput
 WESTON_CONF_OPT += --enable-libinput-backend
-- 
1.8.3.2
