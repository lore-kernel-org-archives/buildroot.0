From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 18 Feb 2019 19:17:17 +0200
Subject: [Buildroot] [PATCH RFC/next 2/4] package/webkit: unify
 *_ARCH_SUPPORTS{, _JIT}
In-Reply-To: <20190218171719.18721-1-aperez@igalia.com>
References: <20190218171719.18721-1-aperez@igalia.com>
Message-ID: <20190218171719.18721-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of having BR2_PACKAGE_{WPEWEBKIT,WEBKITGTK}_ARCH_SUPPORTS
and BR2_PACKAGE_{WPEWEBKIT,WEBKITGTK}_ARCH_SUPPORTS_JIT, which have
the same conditions for both WebKit packages, unify them into common
configuration variables BR2_WEBKIT_ARCH_SUPPORTS{,_JIT} which get
used by both. Also, propagate the needed changes to the .mk files.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/Config.in                     |  1 +
 package/midori/Config.in              |  4 +--
 package/webkit/Config.in              | 29 +++++++++++++++++++++
 package/webkit/webkitgtk/Config.in    | 34 ++-----------------------
 package/webkit/webkitgtk/webkitgtk.mk |  2 +-
 package/webkit/wpewebkit/Config.in    | 36 +++------------------------
 package/webkit/wpewebkit/wpewebkit.mk |  2 +-
 7 files changed, 39 insertions(+), 69 deletions(-)
 create mode 100644 package/webkit/Config.in

diff --git a/package/Config.in b/package/Config.in
index 65faf1fcd6..6801637f33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1320,6 +1320,7 @@ menu "Graphics"
 	source "package/wayland-protocols/Config.in"
 	source "package/waylandpp/Config.in"
 	source "package/webkit/webkitgtk/Config.in"
+	source "package/webkit/Config.in"
 	source "package/webkit/libwpe/Config.in"
 	source "package/webkit/wpebackend-fdo/Config.in"
 	source "package/webkit/wpewebkit/Config.in"
diff --git a/package/midori/Config.in b/package/midori/Config.in
index f0767c85f9..2bd82b448a 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,5 +1,5 @@
 comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
@@ -12,7 +12,7 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # webkitgtk -> icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # webkitgtk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_WEBKIT_ARCH_SUPPORTS
 	# GCR can only be used with the X11 backend
 	select BR2_PACKAGE_GCR if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_GRANITE
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
new file mode 100644
index 0000000000..5e4660d59a
--- /dev/null
+++ b/package/webkit/Config.in
@@ -0,0 +1,29 @@
+config BR2_WEBKIT_ARCH_SUPPORTS
+	bool
+	# ARM needs BLX, so v5t+, BE completely untested so disabled
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_i386 || BR2_x86_64
+	# Disabled on MIPS big endian due to sigbus
+	default y if BR2_mipsel || BR2_mips64el
+	# Disabled on PowerPC pending runtime testing
+	# Disabled on SuperH because of segfault
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
+
+config BR2_WEBKIT_ARCH_SUPPORTS_JIT
+	bool
+	# ARM needs NEON for JIT.
+	default y if BR2_ARM_CPU_HAS_NEON
+	# AArch64 is supported upstream but not well tested on big-endian mode.
+	default y if BR2_aarch64
+	# i386 & x86_64 don't have any special requirements.
+	default y if BR2_i386
+	default y if BR2_x86_64
+	# JIT is known not to work on MIPS64.
+	# Plain MIPS32 (pre R2) is not well tested and likely broken, and R6
+	# is unsupported, see https://bugs.webkit.org/show_bug.cgi?id=191258
+	# The MIPS support is completely untested in big-endian mode.
+	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R2
+	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R5
diff --git a/package/webkit/webkitgtk/Config.in b/package/webkit/webkitgtk/Config.in
index 8714677b6a..09c6848723 100644
--- a/package/webkit/webkitgtk/Config.in
+++ b/package/webkit/webkitgtk/Config.in
@@ -1,35 +1,5 @@
-config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
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
-config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT
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
 comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || \
@@ -43,7 +13,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_LIBGTK3
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_WEBKIT_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
diff --git a/package/webkit/webkitgtk/webkitgtk.mk b/package/webkit/webkitgtk/webkitgtk.mk
index c17bbc8028..1834108bcc 100644
--- a/package/webkit/webkitgtk/webkitgtk.mk
+++ b/package/webkit/webkitgtk/webkitgtk.mk
@@ -27,7 +27,7 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_WOFF2=ON
 
-ifeq ($(BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT),y)
+ifeq ($(BR2_WEBKIT_ARCH_SUPPORTS_JIT),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF
diff --git a/package/webkit/wpewebkit/Config.in b/package/webkit/wpewebkit/Config.in
index 64e81a95f9..dbcab39ebe 100644
--- a/package/webkit/wpewebkit/Config.in
+++ b/package/webkit/wpewebkit/Config.in
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
+	depends on BR2_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_HOST_GCC_AT_LEAST_4_8
 
 comment "wpewebkit needs an OpenGL ES w/ EGL backend"
-	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
+	depends on BR2_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
 
@@ -51,7 +21,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_USE_WCHAR # icu, libsoup
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
-	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
+	depends on BR2_WEBKIT_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_HARFBUZZ
diff --git a/package/webkit/wpewebkit/wpewebkit.mk b/package/webkit/wpewebkit/wpewebkit.mk
index 89df9b725c..3877dcfbb0 100644
--- a/package/webkit/wpewebkit/wpewebkit.mk
+++ b/package/webkit/wpewebkit/wpewebkit.mk
@@ -21,7 +21,7 @@ WPEWEBKIT_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_MINIBROWSER=OFF
 
-ifeq ($(BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS_JIT),y)
+ifeq ($(BR2_WEBKIT_ARCH_SUPPORTS_JIT),y)
 WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=ON
 else
 WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF
-- 
2.20.1
