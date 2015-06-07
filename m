From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Jun 2015 23:11:22 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v2_1/1=5D_package/mesa3d=3A_Remove?=
	=?utf-8?q?_libGL_headers/pkgconfig_when_OpenGL_is_disabled?=
Message-ID: <1433711482-32265-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d defaults to --enable-opengl due to its weird configure.ac:
http://git.buildroot.net/buildroot/commit/package/mesa3d/mesa3d.mk?id=384d601d4ea2c41bb7928f756bfe88af4d38b38b

This leads to include/GL/*.h and lib/pkgconfig/gl.pc being installed to
STAGING_DIR. These files are enough for other packages to wrongly assume
that libGL.so is present, like vlc.

Fixes
http://autobuild.buildroot.net/results/e63/e639dabfb260006acb8a204851b96f9275ce53a7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Instead of fixing vlc?s libGL detection let?s remove the superfluous
    files installed by mesa3d (Yann)

 package/mesa3d/mesa3d.mk |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4a419de..669eada 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -77,9 +77,16 @@ MESA3D_CONF_OPTS += \
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
@@ -102,7 +109,8 @@ endif
 
 # Always enable OpenGL:
 #   - it is needed for GLES (mesa3d's ./configure is a bit weird)
-#   - but if no DRI driver is enabled, then libgl is not built
+#   - but if no DRI driver is enabled, then libgl is not built,
+#     remove dri.pc and gl.pc in this case (MESA3D_REMOVE_OPENGL_PC)
 MESA3D_CONF_OPTS += --enable-opengl
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
-- 
1.7.10.4
