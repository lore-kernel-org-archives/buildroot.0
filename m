From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:44 +0200
Subject: [Buildroot] [PATCH 20/26] package/weston: libxkbcommon is optional
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <6e6b9ff8ce0366a66f16600e37b77508dd61bb16.1401656581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It is possible to build weston without libxkbcommon, for example
if using an input method that is not an hardware keyboard (e.g. a
virtual keyboard, or none at all.)

Make it optional.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 11 ++++++++++-
 package/weston/weston.mk |  9 ++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index aaef405..96ebdf1 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -5,7 +5,6 @@ comment "weston needs udev and a toolchain w/ threads, headers >= 3.0"
 config BR2_PACKAGE_WESTON
 	bool "weston"
 	select BR2_PACKAGE_WAYLAND
-	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_LIBPNG
@@ -29,6 +28,16 @@ config BR2_PACKAGE_WESTON
 
 if BR2_PACKAGE_WESTON
 
+config BR2_PACKAGE_WESTON_HW_KBD
+	bool "enable keyboard support"
+	default y
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  Say 'y' here if you plan on using a keyboard.
+
+	  Only say 'n' if you're going to use a virtual keyboard or any other
+	  input method.
+
 # Helper to make sure at least one compositor is selected.
 config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	bool
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 8188ae6..ea63203 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -10,7 +10,7 @@ WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
-WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
+WESTON_DEPENDENCIES = host-pkgconf wayland pixman libpng \
 	jpeg mtdev udev cairo
 
 WESTON_CONF_OPT = \
@@ -25,6 +25,13 @@ WESTON_CONF_OPT = \
 	--disable-weston-launch \
 	--disable-colord
 
+ifeq ($(BR2_PACKAGE_WESTON_HW_KBD),y)
+WESTON_DEPENDENCIES += libxkbcommon
+WESTON_CONF_OPT += --enable-xkbcommon
+else
+WESTON_CONF_OPT += --disable-xkbcommon
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 WESTON_DEPENDENCIES += libunwind
 else
-- 
1.8.3.2
