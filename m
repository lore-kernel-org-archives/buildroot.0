From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Apr 2018 09:03:34 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
Message-ID: <20180401070337.18301-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the libamcodec package (-DENABLE_AML=ON) is not enough:

-- Could NOT find OpenGLES (missing:  OPENGLES_gl_LIBRARY OPENGLES_egl_LIBRARY OPENGLES_INCLUDE_DIR)
CMake Error at /usr/share/cmake-3.7/Modules/FindPackageHandleStandardArgs.cmake:138 (message):
  Could NOT find EGL (missing: EGL_LIBRARY EGL_INCLUDE_DIR)
Call Stack (most recent call first):
  /usr/share/cmake-3.7/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
  modules/FindEGL.cmake:30 (find_package_handle_standard_args)
  scripts/common/Macros.cmake:354 (find_package)
  CMakeLists.txt:208 (core_require_dep)

Libreelec provides pre-compiled OpenGL ES libraries for AML which are
not provided by buildroot:
https://github.com/LibreELEC/LibreELEC.tv/tree/master/packages/graphics/opengl-meson

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 9d3b65ae91..5af9fe180d 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -72,6 +72,7 @@ KODI_CONF_OPTS += \
 	-DLIBDVDCSS_URL=$(DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	-DLIBDVDNAV_URL=$(DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	-DLIBDVDREAD_URL=$(DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz \
+	-DENABLE_AML=OFF \
 	-DENABLE_IMX=OFF
 
 ifeq ($(BR2_ENABLE_LOCALE),)
@@ -186,12 +187,6 @@ else
 # "linux" platforms. The "rpbi" platform has a different set of
 # options, defined in project/cmake/scripts/rbpi/
 KODI_CONF_OPTS += -DENABLE_LDGOLD=OFF
-ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
-KODI_CONF_OPTS += -DENABLE_AML=ON
-KODI_DEPENDENCIES += libamcodec
-else
-KODI_CONF_OPTS += -DENABLE_AML=OFF
-endif
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-- 
2.14.2
