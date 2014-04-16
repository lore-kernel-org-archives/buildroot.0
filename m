From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:59:25 +0200
Subject: [Buildroot] [git commit] package/mesa3d: fix improper dependency of
	blind option
Message-ID: <20140416180002.0CDB29C80F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e2ba248c62dd48c4f24b71e16c4cc1601596b5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Thomas: really use the right wording for the comment about the
dynamic library dependency.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 54aca4b..81f2272 100644
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
 
+comment "DRI drivers needs a toolchain w/ dynamic library"
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
