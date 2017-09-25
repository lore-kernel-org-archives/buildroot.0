From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Sep 2017 20:52:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: disable shared/static build
Message-ID: <20170925185246.20816-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows building mesa3d only with BR2_SHARED_LIBS enabled.

Mesa3d still needs dynamic library
https://git.buildroot.net/buildroot/commit/package/mesa3d?id=9c635f86d84bfc915a6dd8928f15082f302a9986

and does not allow building with BR2_SHARED_STATIC_LIBS=y
https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=17.2#n490

Fixes https://bugs.busybox.net/show_bug.cgi?id=10326

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 787e266bdd..f58984c4da 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_MESA3D
 	bool "mesa3d"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
+	depends on BR2_SHARED_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBDRM
@@ -235,7 +235,7 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif # BR2_PACKAGE_MESA3D
 
-comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
+comment "mesa3d needs a toolchain w/ C++, NPTL, only dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		BR2_STATIC_LIBS
+		!BR2_SHARED_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
-- 
2.11.0
