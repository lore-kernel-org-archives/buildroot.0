From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Jul 2015 20:52:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/kodi: Fix egl/gles compilation
	with mesa3d and disabled X.org
Message-ID: <1435863152-13529-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
v2: Rebased local repo against upstream

 package/kodi/kodi.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 8712b12..28fece7 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -113,6 +113,7 @@ else
 KODI_CONF_OPTS += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
 ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
 KODI_DEPENDENCIES += libegl libgles
+KODI_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
 KODI_CONF_OPTS += --enable-gles
 else
 KODI_CONF_OPTS += --disable-gles
-- 
1.7.10.4
