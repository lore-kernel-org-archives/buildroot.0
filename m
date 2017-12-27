From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:52:24 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] package/weston: fix build
 with OpenGL ES disabled
Message-ID: <20171227095308.D02D88294B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d297433dcaea55170c4efe5338e92c79052b2b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit be420d12f10d5b2c9c5d3675c73b2dffc3a66e3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 93b0246..638954f 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -57,6 +57,7 @@ WESTON_DEPENDENCIES += libegl
 else
 WESTON_CONF_OPTS += \
 	--disable-egl \
+	--disable-simple-dmabuf-drm-client \
 	--disable-simple-egl-clients
 endif
 
