From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 17 May 2016 20:41:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Execute
	MESA3D_REMOVE_OPENGL_PC also for DRI configs lacking OpenGL
Message-ID: <1463510499-1418-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mesa3d provides libgl only with DRI drivers and X.org enabled. Since

https://git.busybox.net/buildroot/commit/package/mesa3d/mesa3d.mk?id=f1894ec95728806e09405d26663e0ea371afaeab

DRI drivers can be enabled without X.org support, but mesa3d still does
not provide OpenGL support so we also need to remove the pkgconf files
in this case. A POST_INSTALL_*_HOOK is already present but needs to be
executed not only when DRI support was disabled but also with DRI en-
and X.org disabled.

Fixes
http://autobuild.buildroot.net/results/342/3420ad6aa8e1e8151bf11b43be2c97cbe1dbb400/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4e0d255..3c98f8d 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -108,6 +108,8 @@ endif
 # libGL is only provided for a full xorg stack
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_PROVIDES += libgl
+else
+MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_PC
 endif
 MESA3D_CONF_OPTS += \
 	--enable-shared-glapi \
-- 
2.8.1
