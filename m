From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 20:10:47 +0200
Subject: [Buildroot] [PATCH v14 2/8] package/mesa3d: add xvmc option
In-Reply-To: <20190921181053.8999-1-bernd.kuhls@t-online.de>
References: <20190921181053.8999-1-bernd.kuhls@t-online.de>
Message-ID: <20190921181053.8999-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

"XVMC state tracker requires at least one of the following gallium drivers: r600, nouveau."

https://cgit.freedesktop.org/mesa/mesa/commit/?id=22a817af8a89eb3c762fc3e07b443a3ce37d7416

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[moved Config.in option into Gallium block, fixed comment dependency]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 16 ++++++++++++++++
 package/mesa3d/mesa3d.mk |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index bfba68f867..37fa958978 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -193,6 +193,22 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
 	  virgl is the 3D acceleration backend for the virtio-gpu
 	  shipping with qemu.
 
+config BR2_PACKAGE_MESA3D_XVMC
+	bool "Gallium XvMC state tracker"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	select BR2_PACKAGE_XLIB_LIBXVMC
+	help
+	  XVMC state tracker (needs r600 or nouveau gallium drivers).
+
+comment "Gallium XvMC state tracker depends on X.org and needs gallium drivers: r600, nouveau"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_XORG7 || \
+		!(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)
+
 comment "DRI drivers"
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 107b4dfeb8..1987cb358a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -219,7 +219,7 @@ else
 MESA3D_CONF_OPTS += --disable-gles1 --disable-gles2
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
+ifeq ($(BR2_PACKAGE_MESA3D_XVMC),y)
 MESA3D_DEPENDENCIES += xlib_libXvMC
 MESA3D_CONF_OPTS += --enable-xvmc
 else
-- 
2.20.1
