From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:47 +0200
Subject: [Buildroot] [PATCH 23/26] package/freerdp: not forcibly depend on
	X.Org
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <0e9eefefc047c5be7e8e4573c47baae2509093c7.1401656581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It is possible to build the libfreerdp standalone, without X.Org.
Having a libfreerdp will be usefull for the weston RDP compositor.

Re-order the menuconfig, as freerdp is no longer an X-only application.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in          |  2 +-
 package/freerdp/Config.in  | 17 ++++++++++++-----
 package/freerdp/freerdp.mk | 18 ++++++++++++++----
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index da8258f..2503ae8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -190,6 +190,7 @@ endif
 source "package/fb-test-app/Config.in"
 source "package/fbterm/Config.in"
 source "package/fbv/Config.in"
+source "package/freerdp/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
@@ -227,7 +228,6 @@ source "package/alsamixergui/Config.in"
 source "package/apitrace/Config.in"
 source "package/docker/Config.in"
 source "package/feh/Config.in"
-source "package/freerdp/Config.in"
 source "package/gmpc/Config.in"
 source "package/gob2/Config.in"
 source "package/gqview/Config.in"
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index c5ff769..81a67ea 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -1,14 +1,21 @@
 config BR2_PACKAGE_FREERDP
 	bool "freerdp"
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_PACKAGE_XORG7
 	help
 	  FreeRDP is a free implementation of the Remote Desktop
 	  Protocol (RDP), released under the Apache license
 
 	  http://www.freerdp.com/
+
+if BR2_PACKAGE_FREERDP
+
+config BR2_PACKAGE_FREERDP_NEEDS_XLIBS
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+
+endif
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index e92067c..95430bb 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,13 +4,23 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 1.0.1
-FREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
-FREERDP_DEPENDENCIES = openssl zlib \
-	xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
+# Changeset on the stable-1.1 branch
+FREERDP_VERSION = 01865f0e284ce34bb5f38842b34dc80f08b58749
+FREERDP_SITE = https://github.com/FreeRDP/FreeRDP
+FREERDP_SITE_METHOD = git
+FREERDP_DEPENDENCIES = openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREEDRP_LICENSE_FILES = LICENSE
 
+FREERDP_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_FREERDP_NEEDS_XLIBS),y)
+FREERDP_DEPENDENCIES += xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
+FREERDP_CONF_OPT += -DWITH_X11=ON
+else
+FREERDP_CONF_OPT += -DWITH_X11=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 FREERDP_CONF_OPT += -DWITH_CUPS=ON
 FREERDP_DEPENDENCIES += cups
-- 
1.8.3.2
