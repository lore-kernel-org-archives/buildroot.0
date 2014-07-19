From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:25 +0200
Subject: [Buildroot] [PATCH 18/20 v3] package/weston: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <c6149a32819a5007070cc040fa88af7808617669.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

weston is happy enough with just a libudev, and does
not require a udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 6 +++---
 package/weston/weston.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index aaef405..8e387ca 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,6 +1,6 @@
-comment "weston needs udev and a toolchain w/ threads, headers >= 3.0"
+comment "weston needs a toolchain w/ threads, headers >= 3.0"
 	depends on !BR2_avr32
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
@@ -11,7 +11,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_MTDEV
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	depends on !BR2_avr32 # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index ed0707b..c1d023a 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -11,7 +11,7 @@ WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
 WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
-	jpeg mtdev udev cairo
+	jpeg mtdev libudev cairo
 
 WESTON_CONF_OPT = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-- 
1.9.1
