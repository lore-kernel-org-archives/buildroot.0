From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 10:54:32 +0200
Subject: [Buildroot] [git commit] mesa3d: needs NPTL threading
Message-ID: <20140420085528.BFCF09C837@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=783c8f5acb108b0737f7a367cc55ff553959059e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Strictly speaking, linuxthreads (new) should be enough, since it includes
pthread_barrier_* implementation. However, we currently have no clean way to
distinguish between LT and LT.old.

Fixes:
http://autobuild.buildroot.net/results/66a/66a9d2c664e0a9b2b0c51b998c72c2ceda90ff9b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 0793b48..06f2bc3 100644
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
