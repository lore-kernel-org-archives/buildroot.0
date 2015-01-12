From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 22:21:44 +0100
Subject: [Buildroot] [git commit] package/glmark2: Fix mesa3d dependency
Message-ID: <20150112212151.CE58C80403@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5f3db697f37d81b87a99dc3fdce9a6a7f4e0754
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compilation fails with this defconfig, provided by Thomas

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.11.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_GLMARK2=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_RPI_USERLAND=y

because rpi-userland is used a provider for libegl/gles.
Fix this by depending on the corresponding mesa3d suboptions.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glmark2/Config.in |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 2d799fe..65e077b 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -1,15 +1,13 @@
 config BR2_PACKAGE_GLMARK2_EGL_GLES
 	bool
 	default y
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBGLES
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on BR2_PACKAGE_MESA3D_OPENGL_ES
 
 config BR2_PACKAGE_GLMARK2_GL
 	bool
 	default y
-	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
 
 comment "glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d"
 	depends on BR2_LARGEFILE
