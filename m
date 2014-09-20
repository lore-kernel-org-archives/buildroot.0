From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 19:09:49 +0200
Subject: [Buildroot] [PATCH 03/10] package/freerdp: do not forcibly depend
	on X.Org
In-Reply-To: <cover.1411232859.git.yann.morin.1998@free.fr>
References: <cover.1411232859.git.yann.morin.1998@free.fr>
Message-ID: <3236211c986585bc7a8c43fa3a91a1c6e5720eff.1411232859.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is possible to build the libfreerdp standalone, without X.Org.
Having a libfreerdp will be usefull for the weston RDP compositor.

Re-order the menuconfig, as freerdp is no longer an X-only application.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in          |  2 +-
 package/freerdp/Config.in  | 17 ++++++++++++-----
 package/freerdp/freerdp.mk | 10 ++++++++--
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 73ba86a..17f2c67 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -198,6 +198,7 @@ endif
 	source "package/fb-test-app/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
+	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
@@ -236,7 +237,6 @@ comment "X applications"
 	source "package/dillo/Config.in"
 	source "package/docker/Config.in"
 	source "package/feh/Config.in"
-	source "package/freerdp/Config.in"
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
index f1ec0c3..3ae68bf 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -7,11 +7,17 @@
 # Changeset on the stable-1.1 branch
 FREERDP_VERSION = 440916eae2e07463912d5fe507677e67096eb083
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
-FREERDP_DEPENDENCIES = openssl zlib \
-	xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
+FREERDP_DEPENDENCIES = openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
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
1.9.1
