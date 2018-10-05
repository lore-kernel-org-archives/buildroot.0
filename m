From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 18:54:50 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] webkitgtk: bump to
 version 2.22.2
Message-ID: <20181005174033.511AB88634@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=432f9fc9d64d71512bb98adc349b88c86094c49a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Release notes:

    https://webkitgtk.org/2018/09/03/webkitgtk2.22.0-released.html
    https://webkitgtk.org/2018/09/20/webkitgtk2.22.1-released.html
    https://webkitgtk.org/2018/09/21/webkitgtk2.22.2-released.html

No corresponding security advisories for 2.22.x have been published.
Nevertheless, due to skipping over versions in the 2.20.x series,
the following 2.20.x advisories apply:

    https://webkitgtk.org/security/WSA-2018-0003.html
    https://webkitgtk.org/security/WSA-2018-0004.html
    https://webkitgtk.org/security/WSA-2018-0005.html
    https://webkitgtk.org/security/WSA-2018-0006.html

This also bumps the required GCC version, due to the WebKit code
now using more modern C++ features which were introduced in version
6.x of the compiler. The dependency is propagated to the midori
package as well. Last but not least, BR2_PACKAGE_WEBP_DEMUX and
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX are selected as
they are unconditionally needed by the newer WebKitGTK+ releases
when multimedia support is enabled.

An upstream patch for 32-bit ARM which did not make it to be included
in this new version is included as well, and can be removed once it
gets picked in a new release.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bd1bde0dc81451b4f429a66a8ee3a022b442bec8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/midori/Config.in                           |  6 ++--
 ...g-FELightingNEON.cpp-fails-due-to-missing.patch | 41 ++++++++++++++++++++++
 package/webkitgtk/Config.in                        |  9 +++--
 package/webkitgtk/webkitgtk.hash                   |  8 ++---
 package/webkitgtk/webkitgtk.mk                     |  2 +-
 5 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index bc37c6a95b..f0767c85f9 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,7 +1,7 @@
-comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 5, host gcc >= 4.8"
+comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_MIDORI
@@ -10,7 +10,7 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # webkitgtk -> icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # webkitgtk
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # webkitgtk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	# GCR can only be used with the X11 backend
diff --git a/package/webkitgtk/0001-ARM-Building-FELightingNEON.cpp-fails-due-to-missing.patch b/package/webkitgtk/0001-ARM-Building-FELightingNEON.cpp-fails-due-to-missing.patch
new file mode 100644
index 0000000000..6fb309d9fb
--- /dev/null
+++ b/package/webkitgtk/0001-ARM-Building-FELightingNEON.cpp-fails-due-to-missing.patch
@@ -0,0 +1,41 @@
+From b252c7aed3fa6f22db8a26c3ab0bfe66e3490eef Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Sun, 23 Sep 2018 02:34:26 +0300
+Subject: [PATCH xserver] [ARM] Building FELightingNEON.cpp fails due to
+ missing lightVector member https://bugs.webkit.org/show_bug.cgi?id=189890
+
+Reviewed by NOBODY (OOPS!).
+
+No new tests needed.
+
+* platform/graphics/cpu/arm/filters/FELightingNEON.h:
+(WebCore::FELighting::platformApplyNeon): Adapt to new layout of "struct PaintingData" after r225122.
+---
+ Source/WebCore/ChangeLog                             | 12 ++++++++++++
+ .../graphics/cpu/arm/filters/FELightingNEON.h        |  6 +++---
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+Fetch from: https://bugs.webkit.org/show_bug.cgi?id=189890
+Upstream-Status: Pending
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+index 42af922374b..b542a4c81aa 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+@@ -144,9 +144,9 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
+             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
+     } else {
+         ASSERT(m_lightSource->type() == LS_DISTANT);
+-        floatArguments.lightX = paintingData.lightVector.x();
+-        floatArguments.lightY = paintingData.lightVector.y();
+-        floatArguments.lightZ = paintingData.lightVector.z();
++        floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
++        floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
++        floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
+         floatArguments.padding2 = 1;
+     }
+ 
+-- 
+2.19.0
+
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 31794ed2a4..df2aeef3d9 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -11,19 +11,19 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 5, host gcc >= 4.8"
+comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
@@ -41,6 +41,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_WEBP_DEMUX
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
@@ -67,6 +68,8 @@ comment "webkitgtk https support needs a toolchain w/ dynamic library"
 config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	bool "multimedia support"
 	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index dd2b28d372..0b9b94ca49 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.18.6.tar.xz.sums
-md5 c1a548595135ee75ad3bf2e18ac83112 webkitgtk-2.18.6.tar.xz
-sha1 fb0daa85142cfe8822de518dfaa7bd5c3cdd6c23 webkitgtk-2.18.6.tar.xz
-sha256 93912cc2f40f12e452be1ca4babdbdaac0ec4f828d441257a6b06c2963bbac3c webkitgtk-2.18.6.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.22.2.tar.xz.sums
+md5 207d50d313c07b03726f3a7f22643934 webkitgtk-2.22.2.tar.xz
+sha1 ff0c40e81e240aa0743f7e6483f175defebd1417 webkitgtk-2.22.2.tar.xz
+sha256 345487d4d1896e711683f951d1e09387d3b90d7cf59295c0e634af7f515e99ba webkitgtk-2.22.2.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index eb39664b1e..eccd9bbae5 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.18.6
+WEBKITGTK_VERSION = 2.22.2
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
