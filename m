From: lf <micro1183@gmail.com>
Date: Sat, 11 Oct 2014 17:23:18 +0200
Subject: [Buildroot] [PATCH 1/2] mesa3d xa option cleanup
Message-ID: <1413040999-3426-1-git-send-email-micro1183@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: lf <micro1183@gmail.com>
---
 package/mesa3d/Config.in | 5 +++++
 package/mesa3d/mesa3d.mk | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 74ebbed..1bd92ea 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -43,6 +43,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Supports all Nvidia GPUs.
 
@@ -51,6 +52,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VMWGFX
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  This is a virtual GPU driver for VMWare virtual machines.
 
@@ -61,6 +63,9 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	  This is a software opengl implementation using the Gallium3D
 	  infrastructure.
 
+config BR2_PACKAGE_MESA3D_NEEDS_XA
+	bool
+
 comment "DRI drivers needs X.Org and a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_XORG7
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 844884b..8fbd72c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -36,7 +36,7 @@ MESA3D_DEPENDENCIES += \
 	libxcb
 MESA3D_CONF_OPTS += --enable-glx
 # quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
-ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA),)
+ifneq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),)
 MESA3D_CONF_OPTS += --enable-xa
 else
 MESA3D_CONF_OPTS += --disable-xa
-- 
1.9.1
