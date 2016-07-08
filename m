From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 20:54:07 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
	mesa3d-headers}: bump version to 12.0.0
Message-ID: <20160708185432.43F917FDA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff3e522e748925f6be5732a6e5df6553468ca0a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove MESA3D_REMOVE_OPENGL_PC, not needed anymore after
https://cgit.freedesktop.org/mesa/mesa/commit/?h=12.0&id=5193fe9f4fe9c2d537afb051323724a399abc4e1

Tested using defconfig from
https://git.buildroot.net/buildroot/commit/package/mesa3d/mesa3d.mk?id=e07a98239969794c2257345b17a604e309a5dbb1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               |  4 ++--
 package/mesa3d/mesa3d.mk                 | 16 +---------------
 3 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 11e79cb..2b1e4d8 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 11.2.2
+MESA3D_HEADERS_VERSION = 12.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index fa06593..3572b46 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2016-April/000209.html
-sha256	40e148812388ec7c6d7b6657d5a16e2e8dabba8b97ddfceea5197947647bdfb4	mesa-11.2.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2016-July/000226.html
+sha256	0090c025219318935124292b482e3439bc43e8c074ad01086449fcad88547dc6	mesa-12.0.0.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 117e061..dcccb41 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 11.2.2
+MESA3D_VERSION = 12.0.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -93,12 +93,6 @@ MESA3D_CONF_OPTS += \
 	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
 endif
 
-define MESA3D_REMOVE_OPENGL_PC
-	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/dri.pc
-	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
-	rm -rf $(STAGING_DIR)/usr/include/GL/
-endef
-
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-dri-drivers --disable-dri3
@@ -115,8 +109,6 @@ endif
 # libGL is only provided for a full xorg stack
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_PROVIDES += libgl
-else
-MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_PC
 endif
 MESA3D_CONF_OPTS += \
 	--enable-shared-glapi \
@@ -124,10 +116,6 @@ MESA3D_CONF_OPTS += \
 	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_PC
-endif
-
 # APIs
 
 ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
@@ -138,8 +126,6 @@ endif
 
 # Always enable OpenGL:
 #   - it is needed for GLES (mesa3d's ./configure is a bit weird)
-#   - but if no DRI driver is enabled, then libgl is not built,
-#     remove dri.pc and gl.pc in this case (MESA3D_REMOVE_OPENGL_PC)
 MESA3D_CONF_OPTS += --enable-opengl --enable-dri
 
 # libva and mesa3d have a circular dependency
