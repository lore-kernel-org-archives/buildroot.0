From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] webkit: remove user visible
	rendering target selection
Message-ID: <20100526122002.1355C1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0f4d293c30d45cb86e06216da2a9bdf55c9d9b01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead use the same logic as in libgtk2. The rendering target selected
MUST be the same as libgtk2's, so just figure it out automatically
instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webkit/Config.in |   19 -------------------
 package/webkit/webkit.mk |   11 +++++++----
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index eee6bcb..b0d69d7 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -21,22 +21,3 @@ config BR2_PACKAGE_WEBKIT
 
 comment "webkit requires a toolchain with C++ support and WCHAR enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-
-if BR2_PACKAGE_WEBKIT
-
-choice
-	prompt "Rendering target"
-	default BR2_PACKAGE_WEBKIT_X
-	help
-	  Selects which rendering target will be used.
-
-config BR2_PACKAGE_WEBKIT_X11
-	bool "X11"
-
-config BR2_PACKAGE_WEBKIT_DIRECTFB
-	bool "DirectFB"
-	select BR2_PACKAGE_DIRECTFB
-
-endchoice
-
-endif
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 2121f4b..39debd3 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -14,12 +14,15 @@ WEBKIT_LIBTOOL_PATCH = NO
 WEBKIT_DEPENDENCIES = host-flex host-gperf icu curl libxml2 libxslt	\
 			libgtk2 sqlite enchant libsoup
 
-ifeq ($(BR2_PACKAGE_WEBKIT_X11),y)
-WEBKIT_CONF_OPT = --with-target=x11
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+	WEBKIT_CONF_OPT += --with-target=x11
+	WEBKIT_DEPENDENCIES += xserver_xorg-server
 endif
 
-ifeq ($(BR2_PACKAGE_WEBKIT_DIRECTFB),y)
-WEBKIT_CONF_OPT = --with-target=directfb
+ifeq ($(BR2_PACKAGE_DIRECTFB),y)
+	WEBKIT_CONF_OPT += --with-target=directfb
+	WEBKIT_DEPENDENCIES += directfb
 endif
 
 WEBKIT_CONF_OPT += --disable-video
-- 
1.6.3.3
