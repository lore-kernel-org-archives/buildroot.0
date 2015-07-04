From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 12:42:39 +0200
Subject: [Buildroot] [git commit] package/kodi: Fix egl/gles compilation
	with mesa3d and disabled X.org
Message-ID: <20150704104248.67AD180DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4a41207241f63a6c134feb75332e2bd8e64afa2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In this case -DMESA_EGL_NO_X11_HEADERS is needed during compilation.

Fixes this build error

make[1]: Entering directory `/home/fli4l/br8_kodi/output/build/kodi-14.2-Helix/xbmc/cores/dvdplayer'
CPP     xbmc/cores/dvdplayer/DVDPlayerVideo.o
In file included from /home/fli4l/br8_kodi/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/EGL/egl.h:36:0,
                 from /home/fli4l/br8_kodi/output/build/kodi-14.2-Helix/xbmc/windowing/egl/WinSystemEGL.h:28,
                 from /home/fli4l/br8_kodi/output/build/kodi-14.2-Helix/xbmc/windowing/WindowingFactory.h:39,
                 from DVDPlayerVideo.cpp:23:
/home/fli4l/br8_kodi/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/EGL/eglplatform.h:118:22: fatal error: X11/Xlib.h: No such file or directory
 #include <X11/Xlib.h>
                      ^
using this defconfig

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/kodi.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index f95d20d..cc42df4 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -112,6 +112,7 @@ else
 KODI_CONF_OPTS += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
 ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
 KODI_DEPENDENCIES += libegl libgles
+KODI_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
 KODI_CONF_OPTS += --enable-gles
 else
 KODI_CONF_OPTS += --disable-gles
