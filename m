From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jan 2015 23:37:05 +0100
Subject: [Buildroot] [PATCH 1/6 v4] package/freerdp: do not forcibly depend
	on X.Org
In-Reply-To: <cover.1422225347.git.yann.morin.1998@free.fr>
References: <cover.1422225347.git.yann.morin.1998@free.fr>
Message-ID: <30fc930ab51895bd3a7e94baba5d7f6a3735ea5c.1422225347.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is possible to build the libfreerdp standalone, without X.Org.
Having a libfreerdp will be usefull for the weston RDP compositor.

So, only select the strictly required X.Org library if X.Org is enabled,
and only build with Xcursor if it is enabled. Drop dependency on other
X.Org libraries, as they are not strictly required (or get pulled as
dependencies of the mandatory libXext).

Re-order the menuconfig, as freerdp is no longer an X-only application.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in          |  2 +-
 package/freerdp/Config.in  |  6 +-----
 package/freerdp/freerdp.mk | 17 +++++++++++++++--
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 043a350..6356e8d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -211,6 +211,7 @@ endif
 	source "package/fb-test-app/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
+	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
@@ -247,7 +248,6 @@ comment "X applications"
 	source "package/dillo/Config.in"
 	source "package/docker/Config.in"
 	source "package/feh/Config.in"
-	source "package/freerdp/Config.in"
 	source "package/gmpc/Config.in"
 	source "package/gob2/Config.in"
 	source "package/gqview/Config.in"
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index c5ff769..09efbc0 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_FREERDP
 	bool "freerdp"
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	help
 	  FreeRDP is a free implementation of the Remote Desktop
 	  Protocol (RDP), released under the Apache license
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 57cd7a8..a373447 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -7,8 +7,7 @@
 # Changeset on the stable-1.1 branch
 FREERDP_VERSION = 440916eae2e07463912d5fe507677e67096eb083
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
-FREERDP_DEPENDENCIES = openssl zlib \
-	xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
+FREERDP_DEPENDENCIES = openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
@@ -42,6 +41,20 @@ else
 FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
+FREERDP_DEPENDENCIES += xlib_libXext
+FREERDP_CONF_OPTS += -DWITH_X11=ON
+else
+FREERDP_CONF_OPTS += -DWITH_X11=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+FREERDP_CONF_OPTS += -DWITH_XCURSOR=ON
+FREERDP_DEPENDENCIES += xlib_libXcursor
+else
+FREERDP_CONF_OPTS += -DWITH_XCURSOR=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 FREERDP_CONF_OPTS += -DWITH_XINERAMA=ON
 FREERDP_DEPENDENCIES += xlib_libXinerama
-- 
1.9.1
