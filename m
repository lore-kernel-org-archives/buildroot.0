From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jan 2017 15:02:22 +0100
Subject: [Buildroot] [git commit] tslib: needs kernel headers 3.12
Message-ID: <20170119140932.393B481EC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c60211ce38273580f1f8bf5886771406f9899ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel headers 3.12+ are required since tslib version 1.3.

https://github.com/kergoth/tslib/blob/master/README.markdown

Update tslib reverse dependencies.

Fixes:
http://autobuild.buildroot.net/results/28d/28df38e2a042f1b5940bf35c18334ebf8810a348/
http://autobuild.buildroot.net/results/c38/c383cfee3673aa9fba36a86f1e68de63413c2987/
http://autobuild.buildroot.net/results/6dd/6ddb2cd9f4f41ee03dc10a73422ad37070811732/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/Config.in                       | 5 +++--
 package/qt/Config.mouse.in                       | 5 +++--
 package/qt5/qt5base/Config.in                    | 5 +++--
 package/tslib/Config.in                          | 5 +++--
 package/x11r7/xdriver_xf86-input-tslib/Config.in | 5 +++--
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index b552164..35c0309 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -113,11 +113,12 @@ config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 config BR2_PACKAGE_DIRECTFB_TSLIB
 	bool "enable touchscreen support"
 	depends on !BR2_STATIC_LIBS # tslib
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 	default y
 	select BR2_PACKAGE_TSLIB
 
-comment "touchscreen support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "touchscreen support needs a toolchain w/ dynamic library, headers >= 3.12"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 
 config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
index 11da956..f15f8d5 100644
--- a/package/qt/Config.mouse.in
+++ b/package/qt/Config.mouse.in
@@ -13,9 +13,10 @@ config BR2_PACKAGE_QT_MOUSE_TSLIB
 	bool "tslib"
 	select BR2_PACKAGE_TSLIB
 	depends on !BR2_STATIC_LIBS # tslib
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 
-comment "tslib support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "tslib support needs a toolchain w/ dynamic library, headers >= 3.12"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 
 config BR2_PACKAGE_QT_MOUSE_QVFB
 	bool "qvfb"
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 7244fbe..ad95138 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -267,11 +267,12 @@ config BR2_PACKAGE_QT5BASE_ICU
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
 	depends on !BR2_STATIC_LIBS # dlopen
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 	select BR2_PACKAGE_TSLIB
 	help
 	  This options enables the Tslib plugin
 
-comment "tslib support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "tslib support needs a toolchain w/ dynamic library, headers >= 3.12"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 
 endif
diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index 050588e..6b86ebc 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_TSLIB
 	bool "tslib"
 	depends on !BR2_STATIC_LIBS # dlopen
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	help
 	  Tslib is an abstraction layer for touchscreen panel events.
 
 	  https://github.com/kergoth/tslib
 
-comment "tslib needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "tslib needs a toolchain w/ dynamic library, headers >= 3.12"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
index 9c6e296..79b7396 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	bool "xf86-input-tslib"
 	depends on !BR2_STATIC_LIBS # tslib
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
@@ -10,5 +11,5 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 
 	  http://www.ptxdist.org/software/xf86-input-tslib/index_en.html
 
-comment "xf86-input-tslib needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "xf86-input-tslib needs a toolchain w/ dynamic library, headers >= 3.12"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
