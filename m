From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  2 Feb 2020 18:33:32 +0100
Subject: [Buildroot] [PATCH v2 3/4] package/mesa3d: add option to configure
 gbm support
In-Reply-To: <20200202173333.305860-1-bernd.kuhls@t-online.de>
References: <20200202173333.305860-1-bernd.kuhls@t-online.de>
Message-ID: <20200202173333.305860-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi 18.0-Leia will implement stand-alone gbm support alongside x11 &
wayland. To enable building gbm support in mesa3d without x11 & wayland
we need to add a specific configure option for it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/mesa3d/Config.in | 6 ++++++
 package/mesa3d/mesa3d.mk | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 14adb407b4..5929e15442 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -355,6 +355,11 @@ if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "OpenGL API Support"
 
+config BR2_PACKAGE_MESA3D_GBM
+	bool "gbm"
+	help
+	  Enable Generic Buffer Management (gbm)
+
 config BR2_PACKAGE_MESA3D_OPENGL_GLX
 	bool "OpenGL GLX"
 	depends on BR2_PACKAGE_XORG7
@@ -370,6 +375,7 @@ config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	select BR2_PACKAGE_MESA3D_GBM
 	help
 	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL
 	  applications similar to GLX, for X, and WGL, for Windows.
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f0e889a400..c7e5be55a0 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -200,10 +200,17 @@ endif
 MESA3D_CONF_OPTS += \
 	-Dplatforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
 
+ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
+MESA3D_CONF_OPTS += \
+	-Dgbm=true
+else
+MESA3D_CONF_OPTS += \
+	-Dgbm=false
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
 MESA3D_CONF_OPTS += \
-	-Dgbm=true \
 	-Degl=true
 else
 MESA3D_CONF_OPTS += \
-- 
2.20.1
