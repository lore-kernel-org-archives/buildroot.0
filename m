From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Oct 2014 13:46:23 -0700
Subject: [Buildroot] [PATCH 15/15 v6] [RFC] package/weston: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1414442699.git.yann.morin.1998@free.fr>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <194186ed8f4117444db62f8642ad3f305a11fa27.1414442699.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

weston is happy enough with just a libudev, and does
not require a udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 8 ++++----
 package/weston/weston.mk | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index fafdf95..0fd0a71 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,8 +1,8 @@
-comment "weston needs udev and a toolchain w/ threads, dynamic library, headers >= 3.0"
+comment "weston needs a toolchain w/ threads, dynamic library, headers >= 3.0"
 	depends on !BR2_avr32
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || !BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PREFER_STATIC_LIB \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
@@ -13,7 +13,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_MTDEV
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	depends on !BR2_avr32 # wayland
 	depends on !BR2_PREFER_STATIC_LIB # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 9964b90..cfe1eba 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -11,7 +11,7 @@ WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
 WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
-	jpeg mtdev udev cairo
+	jpeg mtdev libudev cairo
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-- 
1.9.1
