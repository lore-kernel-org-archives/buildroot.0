From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 14:10:07 +0200
Subject: [Buildroot] [PATCH 03/13] package/mesa3d: fix improper dependency
	of blind option
In-Reply-To: <cover.1396699629.git.yann.morin.1998@free.fr>
References: <cover.1396699629.git.yann.morin.1998@free.fr>
Message-ID: <84c5268994e965fac056f5de485a99ea8baa4840.1396699629.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, the blind option BR2_PACKAGE_MESA3D_DRI_DRIVER depends
on !STATIC.

But this option is also selected by the various DRI drivers, and
none of them currently depend on !STATIC (although there is a comment
stating DRI drivers need !STATIC, there's nothing to enforce that).

So, we could well end-up with an inconsistent configuration, where some
DRI drivers are selected even though STATIC is set.

Enclose all DRI drivers in an 'if !STATIC' condition, remove the
dependency from the blind option, move the comment so it is nearer
the affected drivers, rephrase the comment to match the rules about
dependencies on toolchain features.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/mesa3d/Config.in | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8ed0c07..c5312f5 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -26,12 +26,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_MESA3D_DRIVER
-	depends on !BR2_PREFER_STATIC_LIB
 	bool
 
-comment "DRI drivers need shared libdrm"
-	depends on BR2_PREFER_STATIC_LIB
-
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
 
@@ -60,6 +56,11 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	  This is a software opengl implementation using the Gallium3D
 	  infrastructure.
 
+comment "DRI drivers need dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
+if !BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	bool "DRI swrast driver"
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
@@ -84,6 +85,8 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	help
 	  Legacy Radeon driver for R100 series GPUs.
 
+endif # !BR2_PREFER_STATIC_LIB
+
 endmenu
 
 menu "Additional API Support"
-- 
1.8.3.2
