From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 00:30:54 +0200
Subject: [Buildroot] [git commit] package/mesa3d: Remove libGL
	headers/pkgconfig when OpenGL is disabled
Message-ID: <20150710223059.6E62081814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bd494f0a8fdeb4ebea9fd8df5bfe186f5b4f455
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mesa3d defaults to --enable-opengl due to its weird configure.ac:
http://git.buildroot.net/buildroot/commit/package/mesa3d/mesa3d.mk?id=384d601d4ea2c41bb7928f756bfe88af4d38b38b

This leads to include/GL/*.h and lib/pkgconfig/gl.pc being installed to
STAGING_DIR. These files are enough for other packages to wrongly assume
that libGL.so is present, like vlc.

Fixes
http://autobuild.buildroot.net/results/e63/e639dabfb260006acb8a204851b96f9275ce53a7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e8844f0..118f071 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -85,9 +85,16 @@ MESA3D_CONF_OPTS += \
 	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
 endif
 
+define MESA3D_REMOVE_OPENGL_PC
+	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/dri.pc
+	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
+	rm -rf $(STAGING_DIR)/usr/include/GL/
+endef
+
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-dri-drivers --without-dri --disable-dri3
+MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_PC
 else
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
@@ -110,7 +117,8 @@ endif
 
 # Always enable OpenGL:
 #   - it is needed for GLES (mesa3d's ./configure is a bit weird)
-#   - but if no DRI driver is enabled, then libgl is not built
+#   - but if no DRI driver is enabled, then libgl is not built,
+#     remove dri.pc and gl.pc in this case (MESA3D_REMOVE_OPENGL_PC)
 MESA3D_CONF_OPTS += --enable-opengl
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
