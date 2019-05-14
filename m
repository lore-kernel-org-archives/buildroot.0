From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 14 May 2019 14:41:10 +0300
Subject: [Buildroot] [PATCH 4/5] package/wpewebkit: bump to version 2.24.1
In-Reply-To: <20190514114111.20424-1-aperez@igalia.com>
References: <20190514114111.20424-1-aperez@igalia.com>
Message-ID: <20190514114111.20424-5-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a new major release which brings in many improvements and new
features. For a complete list, please refer to the release notes:

  https://wpewebkit.org/release/wpewebkit-2.24.0.html
  https://wpewebkit.org/release/wpewebkit-2.24.1.html

Updating to version 2.24.1 also includes fixes for CVE-2019-6201,
CVE-2019-6251, CVE-2019-7285, CVE-2019-7292, CVE-2019-8503,
CVE-2019-8506, CVE-2019-8515, CVE-2019-8518, CVE-2019-8523,
CVE-2019-8524, CVE-2019-8535, CVE-2019-8536, CVE-2019-8544,
CVE-2019-8551, CVE-2019-8558, CVE-2019-8559, CVE-2019-8563, and
CVE-2019-11070. The detailed security advisory can be found at:

  https://wpewebkit.org/security/WSA-2019-0002.html

The BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS_JIT configuration symbol is not
needed anymore, because the logic to decide whether the JavaScriptCore
JIT spport can be enabled has been improved upstream.

One of the new features in 2.24.x is the support for JPEG2000 images,
which is implemented using the OpenJPEG library. Therefore a dependency
on BR2_PACKAGE_OPENJPEG is added.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/Config.in      | 17 +----------------
 package/wpewebkit/wpewebkit.hash |  8 ++++----
 package/wpewebkit/wpewebkit.mk   | 10 ++--------
 3 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 04ebe5452b..ff5775c735 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -12,22 +12,6 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
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
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
@@ -63,6 +47,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_OPENJPEG
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_WEBP
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index cbf253d29c..27f7344be2 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.22.5.tar.xz.sums
-md5 7b768bfae1295ebbc9a9038bf8fb6e6c wpewebkit-2.22.5.tar.xz
-sha1 c85f927e0f17f1e7045a5d33c683d310c7af24de wpewebkit-2.22.5.tar.xz
-sha256 d5e7b23e4f9e9f1b9d369faa4d527cdb59aef56b3e6a50a16dad243df5f699f3 wpewebkit-2.22.5.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.24.1.tar.xz.sums
+md5 0f7b792874853416d8005b020bd90685 wpewebkit-2.24.1.tar.xz
+sha1 d009c82afbc2c373a7f34ffda392e5c3b52dac7d wpewebkit-2.24.1.tar.xz
+sha256 95f2fb68429fbd901ea415d09fdd88d6d9ac5ec2d170bec9977093b12e5093a6 wpewebkit-2.24.1.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 73ad534acd..480ddb0b0c 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.22.5
+WPEWEBKIT_VERSION = 2.24.1
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
@@ -14,19 +14,13 @@ WPEWEBKIT_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
-	libpng libxslt wayland-protocols webp wpebackend-fdo
+	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
 
 WPEWEBKIT_CONF_OPTS = \
 	-DPORT=WPE \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_MINIBROWSER=OFF
 
-ifeq ($(BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS_JIT),y)
-WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=ON
-else
-WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA),y)
 WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_VIDEO=ON \
-- 
2.21.0
