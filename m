From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 22 May 2019 11:27:34 +0300
Subject: [Buildroot] [PATCH/next 1/1] package/webkitgtk: bump to version
 2.24.2
Message-ID: <20190522082734.33964-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a new major release which brings in many improvements and new
features. For a complete list, please refer to the release notes:

  https://webkitgtk.org/2019/03/13/webkitgtk2.24.0-released.html
  https://webkitgtk.org/2019/04/09/webkitgtk2.24.1-released.html
  https://webkitgtk.org/2019/05/17/webkitgtk2.24.2-released.html

Updating to version 2.24.2 also includes fixes for CVE-2019-6201,
CVE-2019-6251, CVE-2019-7285, CVE-2019-7292, CVE-2019-8503,
CVE-2019-8506, CVE-2019-8515, CVE-2019-8518, CVE-2019-8523,
CVE-2019-8524, CVE-2019-8535, CVE-2019-8536, CVE-2019-8544,
CVE-2019-8551, CVE-2019-8558, CVE-2019-8559, CVE-2019-8563,
CVE-2019-11070, CVE-2019-6237, CVE-2019-8571, CVE-2019-8583,
CVE-2019-8584, CVE-2019-8586, CVE-2019-8587, CVE-2019-8594,
CVE-2019-8595, CVE-2019-8596, CVE-2019-8597, CVE-2019-8601,
CVE-2019-8607, CVE-2019-8608, CVE-2019-8609, CVE-2019-8610,
CVE-2019-8615, CVE-2019-8611, CVE-2019-8619, CVE-2019-8622, and
CVE-2019-8623.

The detailed security advisories can be found at:

  https://webkitgtk.org/security/WSA-2019-0002.html
  https://webkitgtk.org/security/WSA-2019-0003.html

The BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT configuration symbol is not
needed anymore, because the logic to decide whether the JavaScriptCore
JIT spport can be enabled has been improved upstream.

One of the new features in 2.24.x is the support for JPEG2000 images,
which is implemented using the OpenJPEG library. Therefore now
BR2_PACKAGE_OPENJPEG is selected.

This adds one small patch which did not make it to the 2.24.2 release
which solves a build issue when the building the GStreamer GL elements
is disabled.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...uild-failure-after-r243644-in-GTK-Li.patch | 36 +++++++++++++++++++
 package/webkitgtk/Config.in                   | 17 +--------
 package/webkitgtk/webkitgtk.hash              |  8 ++---
 package/webkitgtk/webkitgtk.mk                | 11 ++----
 4 files changed, 44 insertions(+), 28 deletions(-)
 create mode 100644 package/webkitgtk/0001-Build-failure-after-r243644-in-GTK-Li.patch

diff --git a/package/webkitgtk/0001-Build-failure-after-r243644-in-GTK-Li.patch b/package/webkitgtk/0001-Build-failure-after-r243644-in-GTK-Li.patch
new file mode 100644
index 0000000000..748fc8e46e
--- /dev/null
+++ b/package/webkitgtk/0001-Build-failure-after-r243644-in-GTK-Li.patch
@@ -0,0 +1,36 @@
+From a672bbd75f257dd65844ad53dd21fb37345999b5 Mon Sep 17 00:00:00 2001
+From: "aperez at igalia.com"
+ <aperez@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Mon, 20 May 2019 21:20:02 +0000
+Subject: [PATCH] Build failure after r243644 in GTK
+ Linux 64-bit stable builds https://bugs.webkit.org/show_bug.cgi?id=196440
+
+Patch by Pablo Saavedra <psaavedra@igalia.com> on 2019-04-01
+Reviewed by Philippe Normand.
+
+* platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:
+(WebCore::MediaPlayerPrivateGStreamerBase::updateTextureMapperFlags):
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+diff --git a/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp b/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp
+index 608aee2e1b3..c614050972a 100644
+--- a/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp
++++ b/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp
+@@ -1000,11 +1000,13 @@ void MediaPlayerPrivateGStreamerBase::updateTextureMapperFlags()
+         break;
+     }
+ 
++#if USE(GSTREAMER_GL)
+     // When the imxvpudecoder is used, the texture sampling of the
+     // directviv-uploaded texture returns an RGB value, so there's no need to
+     // convert it.
+     if (m_videoDecoderPlatform != WebKitGstVideoDecoderPlatform::ImxVPU)
+         m_textureMapperFlags |= TEXTURE_MAPPER_COLOR_CONVERT_FLAG;
++#endif
+ }
+ #endif
+ 
+-- 
+2.21.0
+
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 8714677b6a..9f0d4a776c 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -12,22 +12,6 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
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
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
@@ -56,6 +40,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_OPENJPEG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index d024343d5e..40bb6f7b63 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.22.7.tar.xz.sums
-md5 47386c10a9c3975f933c85404f35ff3b webkitgtk-2.22.7.tar.xz
-sha1 5f45147f6fc4b6a0dd3c545bf857679313230507 webkitgtk-2.22.7.tar.xz
-sha256 4be6f7d605cd0a690fd26e8aa83b089a33ad9d419148eafcfb60580dd2af30ff webkitgtk-2.22.7.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.24.2.tar.xz.sums
+md5 83012998e1b9f71abb37d8baf6f9c7e6 webkitgtk-2.24.2.tar.xz
+sha1 632a65d93beb996bebdf7592ef9591f3993dea91 webkitgtk-2.24.2.tar.xz
+sha256 019cb1f0d05bf6148b72c7a85734bcd006388a1c14132843ef9a1b2cb7b4321c webkitgtk-2.24.2.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index a30c61460a..e81ba047e4 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.22.7
+WEBKITGTK_VERSION = 2.24.2
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -14,7 +14,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
-	libtasn1 libxml2 libxslt sqlite webp woff2
+	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_GEOLOCATION=OFF \
@@ -25,14 +25,9 @@ WEBKITGTK_CONF_OPTS = \
 	-DPORT=GTK \
 	-DUSE_LIBNOTIFY=OFF \
 	-DUSE_LIBHYPHEN=OFF \
+	-DUSE_OPENJPEG=ON \
 	-DUSE_WOFF2=ON
 
-ifeq ($(BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT),y)
-WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
-else
-WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=ON \
-- 
2.21.0
