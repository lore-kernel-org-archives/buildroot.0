From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Dec 2015 19:31:43 +0100
Subject: [Buildroot] [PATCH 8/8] package/mesa3d-demos: add glut support
In-Reply-To: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
References: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1449945103-23715-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-demos/mesa3d-demos.mk | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index c0f889a..016095b 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -11,8 +11,6 @@ MESA3D_DEMOS_AUTORECONF = YES
 MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
 MESA3D_DEMOS_LICENSE = MIT
 
-MESA3D_DEMOS_CONF_OPTS += --without-glut --disable-osmesa
-
 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
 MESA3D_DEMOS_DEPENDENCIES += libgl libglew libglu xlib_libX11 xlib_libXext
 MESA3D_DEMOS_CONF_OPTS += --enable-gl --enable-x11
@@ -55,6 +53,19 @@ else
 MESA3D_DEMOS_CONF_OPTS += --disable-freetype2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
+MESA3D_DEMOS_DEPENDENCIES += libfreeglut
+MESA3D_DEMOS_CONF_OPTS += --with-glut=$(STAGING_DIR)/usr
+# osmesa support depends on glut
+ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
+MESA3D_DEMOS_CONF_OPTS += --enable-osmesa
+else
+MESA3D_DEMOS_CONF_OPTS += --disable-osmesa
+endif
+else
+MESA3D_DEMOS_CONF_OPTS += --without-glut --disable-osmesa
+endif
+
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEMOS_DEPENDENCIES += wayland
 MESA3D_DEMOS_CONF_OPTS += --enable-wayland
-- 
2.6.2
