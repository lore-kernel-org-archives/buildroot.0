From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Feb 2017 09:32:09 +0100
Subject: [Buildroot] [git commit] Revert "tslib: needs kernel headers 3.12"
Message-ID: <20170209083529.895AF7FAA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7794d5f94946d94c2a19913fb88cacfd2b7d3531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7c60211ce38273580f1f8bf5886771406f9899ca.

tslib-1.4 removes this dependency.

Add upstream patch that fixes input macros declaration for older kernels.

The ts_uinput tool requires 3.6 headers; disable for older kernels.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
[baruch: add tslib patch; disable ts_uinput]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/Config.in                       | 5 ++---
 package/qt/Config.mouse.in                       | 5 ++---
 package/qt5/qt5base/Config.in                    | 5 ++---
 package/tslib/Config.in                          | 5 ++---
 package/tslib/tslib.hash                         | 2 ++
 package/tslib/tslib.mk                           | 5 +++++
 package/x11r7/xdriver_xf86-input-tslib/Config.in | 5 ++---
 7 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 35c0309..b552164 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -113,12 +113,11 @@ config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 config BR2_PACKAGE_DIRECTFB_TSLIB
 	bool "enable touchscreen support"
 	depends on !BR2_STATIC_LIBS # tslib
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 	default y
 	select BR2_PACKAGE_TSLIB
 
-comment "touchscreen support needs a toolchain w/ dynamic library, headers >= 3.12"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+comment "touchscreen support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
index f15f8d5..11da956 100644
--- a/package/qt/Config.mouse.in
+++ b/package/qt/Config.mouse.in
@@ -13,10 +13,9 @@ config BR2_PACKAGE_QT_MOUSE_TSLIB
 	bool "tslib"
 	select BR2_PACKAGE_TSLIB
 	depends on !BR2_STATIC_LIBS # tslib
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 
-comment "tslib support needs a toolchain w/ dynamic library, headers >= 3.12"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+comment "tslib support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_QT_MOUSE_QVFB
 	bool "qvfb"
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index e273caa..f22e034 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -278,12 +278,11 @@ config BR2_PACKAGE_QT5BASE_ICU
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
 	depends on !BR2_STATIC_LIBS # dlopen
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 	select BR2_PACKAGE_TSLIB
 	help
 	  This options enables the Tslib plugin
 
-comment "tslib support needs a toolchain w/ dynamic library, headers >= 3.12"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+comment "tslib support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 endif
diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index 3665301..bc5d790 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_TSLIB
 	bool "tslib"
 	depends on !BR2_STATIC_LIBS # dlopen
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	help
 	  Tslib is a filtering layer for touchscreen panel events.
 
 	  https://github.com/kergoth/tslib
 
-comment "tslib needs a toolchain w/ dynamic library, headers >= 3.12"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+comment "tslib needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 6540ac8..b731df2 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,4 @@
 # taken from https://github.com/kergoth/tslib/releases/tag/1.4
 sha256  ad0373f1dbfda27caec92cb10421227f226c79d160488f1ac915585ba947741f  tslib-1.4.tar.xz
+# Locally computed
+sha256	b76d25358d1e2bbcc88b0b225e8d71cd00a4795f6d17020bae270940b17d0825  02795c4fa8b842c6fc017e86b5e036466bd4d3ef.patch
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 5ea526e..356c4c2 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -10,8 +10,13 @@ TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
 
+TSLIB_PATCH = https://github.com/kergoth/tslib/commit/02795c4fa8b842c6fc017e86b5e036466bd4d3ef.patch
 TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6),)
+TSLIB_CONF_OPTS += --disable-tools
+endif
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
index 79b7396..9c6e296 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	bool "xf86-input-tslib"
 	depends on !BR2_STATIC_LIBS # tslib
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
@@ -11,5 +10,5 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 
 	  http://www.ptxdist.org/software/xf86-input-tslib/index_en.html
 
-comment "xf86-input-tslib needs a toolchain w/ dynamic library, headers >= 3.12"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+comment "xf86-input-tslib needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
