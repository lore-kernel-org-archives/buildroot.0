From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:03:46 +0200
Subject: [Buildroot] [git commit] mesa3d: don't remove OpenGL pc when
	installing Gallium
Message-ID: <20160705130352.95130817E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=999d4a263118ab8581190d3e3c8bdc471896628f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gallium driver also provides DRI-like infrastructure and OpenGL.
This change prevents from removing pkg-configs of them also when
installing the driver.

Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ebd674f..117e061 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -102,7 +102,6 @@ endef
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-dri-drivers --disable-dri3
-MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_PC
 else
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
@@ -125,6 +124,10 @@ MESA3D_CONF_OPTS += \
 	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_PC
+endif
+
 # APIs
 
 ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
