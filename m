From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jun 2017 09:19:57 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/mesa3d: always pass
	--with-platforms
In-Reply-To: <20170617071957.9865-1-bernd.kuhls@t-online.de>
References: <20170617071957.9865-1-bernd.kuhls@t-online.de>
Message-ID: <20170617071957.9865-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If --with-platforms is not used mesa3d defaults to x11:
https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=17.1#n1641
https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=17.1#n1659

This will break configure when x11 is not needed because the defconfig
has no mesa3d drivers enabled. To solve the problem we always pass
--with-platforms, even with empty values and also for non-egl builds.

Fixes
http://autobuild.buildroot.net/results/d16/d16b39d16b5bee5c09b1e996941a275a4337c3c1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: set MESA3D_PLATFORMS also for non-egl builds
v2: split from initial patch http://patchwork.ozlabs.org/patch/774339/

 package/mesa3d/mesa3d.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ac27b0f07..04a7d13b9 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -141,8 +141,6 @@ endef
 MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_HEADERS
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
-MESA3D_PROVIDES += libegl
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
 MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
@@ -159,10 +157,15 @@ endif
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_PLATFORMS += x11
 endif
+
+MESA3D_CONF_OPTS += \
+	--with-platforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
+
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+MESA3D_PROVIDES += libegl
 MESA3D_CONF_OPTS += \
 	--enable-gbm \
-	--enable-egl \
-	--with-egl-platforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
+	--enable-egl
 else
 MESA3D_CONF_OPTS += \
 	--disable-egl
-- 
2.11.0
