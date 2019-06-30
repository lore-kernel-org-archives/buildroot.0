From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jun 2019 16:05:08 +0200
Subject: [Buildroot] [PATCH 14/31] package/mesa3d: add option to configure
 gbm support
In-Reply-To: <20190630140525.6537-1-bernd.kuhls@t-online.de>
References: <20190630140525.6537-1-bernd.kuhls@t-online.de>
Message-ID: <20190630140525.6537-15-bernd.kuhls@t-online.de>
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
 package/mesa3d/Config.in | 6 ++++++
 package/mesa3d/mesa3d.mk | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 5dd3895956..cd6dc203c0 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -295,10 +295,16 @@ comment "OpenGL GLX support needs X11"
 
 comment "Additional API Support"
 
+config BR2_PACKAGE_MESA3D_GBM
+	bool "gbm"
+	help
+	  Enable Generic Buffer Management (gbm)
+
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	select BR2_PACKAGE_MESA3D_GBM
 	help
 	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL
 	  applications similar to GLX, for X, and WGL, for Windows.
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 58f0351328..9dd9f4c299 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -202,10 +202,17 @@ endif
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
