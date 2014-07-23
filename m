From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Jul 2014 06:40:18 +0200
Subject: [Buildroot] [PATCH v15 2/9] xbmc: Add missing egl-related cflags
In-Reply-To: <1406090425-5925-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406090425-5925-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1406090425-5925-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A similar patch is used in package/qt/qt.mk.

Fixes compilation error:

In file included from /home/br/br/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:36:0,
                 from /home/br/br/output/build/xbmc-13.0-Gotham/xbmc/windowing/egl/WinSystemEGL.h:28,
                 from /home/br/br/output/build/xbmc-13.0-Gotham/xbmc/windowing/WindowingFactory.h:39,
                 from DVDPlayerVideo.cpp:23:
/home/br/br/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:118:22: fatal error: X11/Xlib.h: No such file or directory

using this defconfig

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_XBMC=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 2a38114..f81cf12 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -73,6 +73,10 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 endif
 
+XBMC_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
+	CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
-- 
1.7.10.4
