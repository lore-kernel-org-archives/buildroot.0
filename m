From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 18 Oct 2013 08:44:43 +0200
Subject: [Buildroot] [PATCH] tslib: needs dynamic library for dlopen
Message-ID: <a0f5079cb28446c5d278.1382078683@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/1242cbea015e5a24a6621d1bd5569d2a1a819bb4/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: - propagate dependency to selectors of tslib (ThomasP)
    - shared library -> dynamic library (shame on me)

 package/directfb/Config.in                       |  4 ++++
 package/tslib/Config.in                          |  4 ++++
 package/x11r7/xdriver_xf86-input-tslib/Config.in |  4 ++++
 3 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -93,9 +93,13 @@ config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 
 config BR2_PACKAGE_DIRECTFB_TSLIB
 	bool "enable touchscreen support"
+	depends on !BR2_PREFER_STATIC_LIB # tslib
 	default y
 	select BR2_PACKAGE_TSLIB
 
+comment "touchscreen support needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
 	default y
diff --git a/package/tslib/Config.in b/package/tslib/Config.in
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_TSLIB
 	bool "tslib"
+	depends on !BR2_PREFER_STATIC_LIB # dlopen
 	help
 	  Tslib is an abstraction layer for touchscreen panel events.
 
 	  http://tslib.berlios.de/
+
+comment "tslib needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	bool "xf86-input-tslib"
+	depends on !BR2_PREFER_STATIC_LIB # tslib
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
@@ -8,3 +9,6 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_TS
 	  Touch screen library input driver
 
 	  http://www.ptxdist.org/software/xf86-input-tslib/index_en.html
+
+comment "xf86-input-tslib needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
