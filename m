From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 Oct 2017 20:05:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston: fix build with OpenGL ES
	disabled
Message-ID: <20171022180521.25751-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building this defconfig

BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_WESTON=y
BR2_PACKAGE_XORG7=y

is broken:

  CC       clients/weston_simple_dmabuf_drm-simple-dmabuf-drm.o
clients/simple-dmabuf-drm.c: In function 'create_display':
clients/simple-dmabuf-drm.c:758:15: warning: implicit declaration of function 'eglQueryString' [-Wimplicit-function-declaration]
  extensions = eglQueryString(EGL_NO_DISPLAY, EGL_EXTENSIONS);
               ^~~~~~~~~~~~~~
clients/simple-dmabuf-drm.c:758:30: error: 'EGL_NO_DISPLAY' undeclared (first use in this function)
  extensions = eglQueryString(EGL_NO_DISPLAY, EGL_EXTENSIONS);
                              ^~~~~~~~~~~~~~
clients/simple-dmabuf-drm.c:758:30: note: each undeclared identifier is reported only once for each function it appears in
clients/simple-dmabuf-drm.c:758:46: error: 'EGL_EXTENSIONS' undeclared (first use in this function)
  extensions = eglQueryString(EGL_NO_DISPLAY, EGL_EXTENSIONS);
                                              ^~~~~~~~~~~~~~
clients/simple-dmabuf-drm.c:759:21: warning: implicit declaration of function 'weston_check_egl_extension' [-Wimplicit-function-declaration]
  if (extensions && !weston_check_egl_extension(extensions,

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/weston/weston.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 93b0246e9e..638954f034 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -57,6 +57,7 @@ WESTON_DEPENDENCIES += libegl
 else
 WESTON_CONF_OPTS += \
 	--disable-egl \
+	--disable-simple-dmabuf-drm-client \
 	--disable-simple-egl-clients
 endif
 
-- 
2.11.0
