From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 22:45:14 +0100
Subject: [Buildroot] [git commit] package/mesa3d: Remove opengl headers
	files if opengl support is disabled
Message-ID: <20161106214531.BDEE68183C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09ed94bd6d51ff1e47df26b4ba8cdb682dc78bf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mesa3d used to install GL/gl.h & co. only if libGL.so was installed.

After this commit
https://cgit.freedesktop.org/mesa/mesa/commit/?h=13.0&id=a89faa2022fd995af2019c886b152b49a01f9392

this is no longer the case leading to misdetection of opengl support by
vlc if mesa3d was built before:

http://git.videolan.org/?p=vlc.git;a=blob;f=configure.ac;h=c8900d216540816224e872bef46fbcc93d83ca41;hb=HEAD#l3010

This patch partly re-introduces a mechanism to clean unwanted files
installed by mesa3d which was removed when bumping to 12.0.0:
https://git.buildroot.net/buildroot/commit/package/mesa3d?id=ff3e522e748925f6be5732a6e5df6553468ca0a1

Fixes
http://autobuild.buildroot.net/results/13e/13e7c0f5fc6ae8ba5e62b2597d188496c64090fd/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e17db5c..96ebb95 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -137,6 +137,12 @@ MESA3D_CONF_OPTS += --disable-va
 # libGL is only provided for a full xorg stack
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_PROVIDES += libgl
+else
+define MESA3D_REMOVE_OPENGL_HEADERS
+	rm -rf $(STAGING_DIR)/usr/include/GL/
+endef
+
+MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_HEADERS
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
