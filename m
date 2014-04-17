From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 18:04:17 +0200
Subject: [Buildroot] [PATCH 05/14] package/mesa3d: DRI drivers depend on
	X.org
In-Reply-To: <cover.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <d136fff0309f466027a1089f5eeae6f0acd18e2b.1397750571.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It does not make sense to build DRI drivers without X.org.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/mesa3d/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 801a203..3a2766b 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -56,10 +56,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	  This is a software opengl implementation using the Gallium3D
 	  infrastructure.
 
-comment "DRI drivers needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+comment "DRI drivers needs an X.Org server and a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_XSERVER_XORG_SERVER
 
-if !BR2_PREFER_STATIC_LIB
+if !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XSERVER_XORG_SERVER
 
 comment "DRI drivers"
 
@@ -73,7 +73,6 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	bool "DRI i965 driver"
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
@@ -87,7 +86,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	help
 	  Legacy Radeon driver for R100 series GPUs.
 
-endif # !BR2_PREFER_STATIC_LIB
+endif # !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XSERVER_XORG_SERVER
 
 if BR2_PACKAGE_MESA3D_DRIVER
 
-- 
1.8.3.2
