From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 30 Mar 2019 11:19:40 +0100
Subject: [Buildroot] [RFC 1/1] package/[wpe]webkit[gtk]: common config
 BR2_PACKAGE_WEBKIT_ARCH_SUPPORT[_JIT]
In-Reply-To: <20190330101940.25868-1-francois.perrad@gadz.org>
References: <20190330101940.25868-1-francois.perrad@gadz.org>
Message-ID: <20190330101940.25868-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/midori/Config.in       |  4 ++--
 package/webkitgtk/Config.in    |  8 ++++----
 package/webkitgtk/webkitgtk.mk |  2 +-
 package/wpewebkit/Config.in    | 36 +++-------------------------------
 package/wpewebkit/wpewebkit.mk |  2 +-
 5 files changed, 11 insertions(+), 41 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index f0767c85f..460fc6fbf 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,5 +1,5 @@
 comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
@@ -12,7 +12,7 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # webkitgtk -> icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # webkitgtk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	# GCR can only be used with the X11 backend
 	select BR2_PACKAGE_GCR if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_GRANITE
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 8714677b6..3e5e8d7b6 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	bool
 	# ARM needs BLX, so v5t+, BE completely untested so disabled
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
@@ -12,7 +12,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT
+config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS_JIT
 	bool
 	# ARM needs NEON for JIT.
 	default y if BR2_ARM_CPU_HAS_NEON
@@ -29,7 +29,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT
 	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R5
 
 comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || \
@@ -43,7 +43,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_LIBGTK3
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index c17bbc802..3c2965a6b 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -27,7 +27,7 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_WOFF2=ON
 
-ifeq ($(BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT),y)
+ifeq ($(BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS_JIT),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 04ebe5452..a8f7375a1 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -1,42 +1,12 @@
-config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
-	bool
-	# ARM needs BLX, so v5t+, BE completely untested so disabled
-	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
-	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_i386 || BR2_x86_64
-	# Disabled on MIPS big endian due to sigbus
-	default y if BR2_mipsel || BR2_mips64el
-	# Disabled on PowerPC pending runtime testing
-	# Disabled on SuperH because of segfault
-	depends on BR2_USE_MMU # libglib2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
-
-config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS_JIT
-	bool
-	# ARM needs NEON for JIT.
-	default y if BR2_ARM_CPU_HAS_NEON
-	# AArch64 is supported upstream but not well tested on big-endian mode.
-	default y if BR2_aarch64
-	# i386 & x86_64 don't have any special requirements.
-	default y if BR2_i386
-	default y if BR2_x86_64
-	# JIT is known not to work on MIPS64.
-	# Plain MIPS32 (pre R2) is not well tested and likely broken, and R6
-	# is unsupported, see https://bugs.webkit.org/show_bug.cgi?id=191258
-	# The MIPS support is completely untested in big-endian mode.
-	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R2
-	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R5
-
 comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.8, host gcc >= 4.8"
-	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
 
 comment "wpewebkit needs an OpenGL ES w/ EGL backend"
-	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
 
@@ -51,7 +21,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_USE_WCHAR # icu, libsoup
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
-	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_HARFBUZZ
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 89df9b725..43f8c16e9 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -21,7 +21,7 @@ WPEWEBKIT_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_MINIBROWSER=OFF
 
-ifeq ($(BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS_JIT),y)
+ifeq ($(BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS_JIT),y)
 WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=ON
 else
 WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF
-- 
2.17.1
