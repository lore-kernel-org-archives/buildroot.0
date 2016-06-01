From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Wed,  1 Jun 2016 15:58:35 +0900
Subject: [Buildroot] [PATCH 1/1] mesa3d: don't remove OpenGL pc when
	installing Gallium
Message-ID: <20160601065835.9754-1-akihiko.odaki.4i@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gallium driver also provides DRI-like infrastructure and OpenGL.
This change prevents from removing pkg-configs of them also when
installing the driver.

Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
---
 package/mesa3d/mesa3d.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4e0d255..9968541 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -94,7 +94,6 @@ endef
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-dri-drivers --disable-dri3
-MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_PC
 else
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
@@ -115,6 +114,10 @@ MESA3D_CONF_OPTS += \
 	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_PC
+endif
+
 # APIs
 
 ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
-- 
2.8.3
