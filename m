From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 20 Apr 2014 08:30:43 +0300
Subject: [Buildroot] [PATCH] mesa3d: needs NPTL threading
Message-ID: <e7a6b270dba399ed52c5d6b04e9625b880347e0e.1397971843.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Strictly speaking, linuxthreads (new) should be enough, since it includes
pthread_barrier_* implementation. However, we currently have no clean way to
distinguish between LT and LT.old.

Fixes:
http://autobuild.buildroot.net/results/66a/66a9d2c664e0a9b2b0c51b998c72c2ceda90ff9b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mesa3d/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 0793b486d97b..06f2bc382102 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -12,6 +12,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XSERVER_XORG_SERVER
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
 
@@ -124,5 +125,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif # BR2_PACKAGE_MESA3D
 
-comment "mesa3d needs a toolchain w/ C++, largefile"
-	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP
+comment "mesa3d needs a toolchain w/ C++, largefile, NPTL"
+	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
1.9.1
