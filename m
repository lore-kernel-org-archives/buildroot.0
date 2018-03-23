From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 23 Mar 2018 20:59:41 +0200
Subject: [Buildroot] [PATCH v2/next 3/4] webkitgtk: update to version 2.20.0
In-Reply-To: <20180323185942.60252-1-aperez@igalia.com>
References: <20180323185942.60252-1-aperez@igalia.com>
Message-ID: <20180323185942.60252-4-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
    https://webkitgtk.org/2018/03/12/webkitgtk2.20.0-released.html

No corresponding WebKit Security Advisory (WSA) has been published
for now.

This also adds a dependency on the woff2 package. In previous versions
WebKitGTK+ bundled a known-to-work snapshot of its Git repository due to
upstream not providing releases. The situation has changed and releases
are now available, and the bundled copy of woff2 has been removed.

Last but not least, this patch selects BR2_PACKAGE_WEBP_DEMUX, which is
now required.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

---
Changes v1 -> v2:
  - Marked as supported on AArch64, which is officially supported upstream.
  - Add upstream patch for fixing build failure with multimedia/XSLT
    support disabled.
---
 ...ld-failure-when-ENABLE_VIDEO-ENABLE_WEB_A.patch | 32 ++++++++++++++++++++++
 package/webkitgtk/Config.in                        |  3 ++
 package/webkitgtk/webkitgtk.hash                   |  8 +++---
 package/webkitgtk/webkitgtk.mk                     |  4 +--
 4 files changed, 41 insertions(+), 6 deletions(-)
 create mode 100644 package/webkitgtk/0002-WPE-GTK-Build-failure-when-ENABLE_VIDEO-ENABLE_WEB_A.patch

diff --git a/package/webkitgtk/0002-WPE-GTK-Build-failure-when-ENABLE_VIDEO-ENABLE_WEB_A.patch b/package/webkitgtk/0002-WPE-GTK-Build-failure-when-ENABLE_VIDEO-ENABLE_WEB_A.patch
new file mode 100644
index 0000000000..2c69fa89ae
--- /dev/null
+++ b/package/webkitgtk/0002-WPE-GTK-Build-failure-when-ENABLE_VIDEO-ENABLE_WEB_A.patch
@@ -0,0 +1,32 @@
+From ecfba9336863c2dad22c9ad1dfd1f6ea1801ccdb Mon Sep 17 00:00:00 2001
+From: "aperez at igalia.com"
+ <aperez@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Thu, 22 Mar 2018 13:48:34 +0000
+Subject: [PATCH xserver 2/2] [WPE][GTK] Build failure when ENABLE_VIDEO,
+ ENABLE_WEB_AUDIO and ENABLE_XSLT are disabled
+ https://bugs.webkit.org/show_bug.cgi?id=183896
+
+Reviewed by Yusuke Suzuki.
+
+No new tests needed.
+
+* bindings/js/JSWebAnimationCustom.cpp: Add missing #include of Document.h
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream-Status: Committed
+
+diff --git a/Source/WebCore/bindings/js/JSWebAnimationCustom.cpp b/Source/WebCore/bindings/js/JSWebAnimationCustom.cpp
+index 8b56f86c151..b8716be0f1c 100644
+--- a/Source/WebCore/bindings/js/JSWebAnimationCustom.cpp
++++ b/Source/WebCore/bindings/js/JSWebAnimationCustom.cpp
+@@ -26,6 +26,7 @@
+ #include "config.h"
+ #include "JSWebAnimation.h"
+ 
++#include "Document.h"
+ #include "JSAnimationEffect.h"
+ #include "JSAnimationTimeline.h"
+ #include "JSDOMConstructor.h"
+-- 
+2.16.2
+
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 31794ed2a4..99755d8d69 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	bool
 	# ARM needs BLX, so v5t+, BE completely untested so disabled
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
+	default y if BR2_aarch64
 	default y if BR2_i386 || BR2_x86_64
 	# Disabled on MIPS big endian due to sigbus
 	default y if BR2_mipsel || BR2_mips64el
@@ -41,6 +42,8 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_WOFF2
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index dd2b28d372..28468a5297 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.18.6.tar.xz.sums
-md5 c1a548595135ee75ad3bf2e18ac83112 webkitgtk-2.18.6.tar.xz
-sha1 fb0daa85142cfe8822de518dfaa7bd5c3cdd6c23 webkitgtk-2.18.6.tar.xz
-sha256 93912cc2f40f12e452be1ca4babdbdaac0ec4f828d441257a6b06c2963bbac3c webkitgtk-2.18.6.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.20.0.tar.xz.sums
+md5 51cc47345c3ec53802718cd6fc9b746f webkitgtk-2.20.0.tar.xz
+sha1 f1e021318f06085fff5455667459bf26716d610f webkitgtk-2.20.0.tar.xz
+sha256 57f640f720bd9a8a7207f3321cf803a15c2f207b4e7b75ff1be17bc1eeb00a3c webkitgtk-2.20.20.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index eb39664b1e..e27f970104 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.18.6
+WEBKITGTK_VERSION = 2.20.0
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -14,7 +14,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
-	libtasn1 libxml2 libxslt sqlite webp
+	libtasn1 libxml2 libxslt sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_GEOLOCATION=OFF \
-- 
2.16.2
