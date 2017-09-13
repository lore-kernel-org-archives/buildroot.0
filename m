From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 20:45:43 +0200
Subject: [Buildroot] [PATCH 2/3] package/nvidia-driver: depends on
	xlib_libX11 & xlib_libXext
In-Reply-To: <20170913184544.5670-1-bernd.kuhls@t-online.de>
References: <20170913184544.5670-1-bernd.kuhls@t-online.de>
Message-ID: <20170913184544.5670-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix libglu build error

  CXXLD    libGLU.la
/home/buildroot/br4/output/host/lib/gcc/i586-buildroot-linux-gnu/6.4.0/../../../../i586-buildroot-linux-gnu/bin/ld: cannot find -lXext
/home/buildroot/br4/output/host/lib/gcc/i586-buildroot-linux-gnu/6.4.0/../../../../i586-buildroot-linux-gnu/bin/ld: cannot find -lX11
collect2: error: ld returned 1 exit status

using this defconfig

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_NVIDIA_DRIVER=y
BR2_PACKAGE_LIBGLU=y

The nvidia binary blob is linked to libX11.so & libEext.so

$ output/host/bin/i586-buildroot-linux-gnu-readelf -a output/target/usr/lib/libGL.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libnvidia-tls.so.381.09]
 0x00000001 (NEEDED)                     Shared library: [libnvidia-glcore.so.381.09]
 0x00000001 (NEEDED)                     Shared library: [libX11.so.6]
 0x00000001 (NEEDED)                     Shared library: [libXext.so.6]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.2]

which is also reflected by Libs-section of package/nvidia-driver/gl.pc.

To allow other packages linking to libGL.so provided by this package we
need to reflect the fact that xlib_libX11 & xlib_libXext are not
runtime-only dependencies.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nvidia-driver/Config.in        | 4 ++--
 package/nvidia-driver/nvidia-driver.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index 1105ec63b6..732d9255c7 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -22,8 +22,8 @@ config BR2_PACKAGE_NVIDIA_DRIVER_XORG
 	default y
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	select BR2_PACKAGE_MESA3D_HEADERS
-	select BR2_PACKAGE_XLIB_LIBX11 # runtime
-	select BR2_PACKAGE_XLIB_LIBXEXT # runtime
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 6746134a52..1795434811 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -20,7 +20,7 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
 # are build dependencies of packages that depend on nvidia-driver, so
 # they should be built prior to those packages, and the only simple
 # way to do so is to make nvidia-driver depend on them.
-NVIDIA_DRIVER_DEPENDENCIES = mesa3d-headers
+NVIDIA_DRIVER_DEPENDENCIES = mesa3d-headers xlib_libX11 xlib_libXext
 NVIDIA_DRIVER_PROVIDES = libgl libegl libgles
 
 # libGL.so.$(NVIDIA_DRIVER_VERSION) is the legacy libGL.so library; it
-- 
2.11.0
