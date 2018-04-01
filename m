From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Apr 2018 15:01:07 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/kodi: remove X11-based OpenGL ES
 support
Message-ID: <20180401130109.8006-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To prepare the bump to the next Kodi version 18.0-Leia we remove the
current OpenGL ES support options. Kodi 18.0 will bring a major
overhaul of the supported windowing platforms, x11-based gles support
was removed, see upstream PR 12196.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: updated subject to make clear that this is about X11

 package/kodi/Config.in | 13 +++----------
 package/kodi/kodi.mk   | 10 ----------
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 071c03d640..fefed70e0d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -15,21 +15,14 @@ comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, t
 		|| !BR2_PACKAGE_PYTHON \
 		|| BR2_PACKAGE_PYTHON_PYC_ONLY
 
-config BR2_PACKAGE_KODI_EGL_GLES
-	bool
-	default y
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBGLES
-	depends on !BR2_PACKAGE_KODI_GL_EGL # prefer GL if available
-
 config BR2_PACKAGE_KODI_GL_EGL
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGL
 
-comment "kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend"
-	depends on !BR2_PACKAGE_KODI_GL_EGL && !BR2_PACKAGE_KODI_EGL_GLES
+comment "kodi needs an OpenGL EGL backend with OpenGL support"
+	depends on !BR2_PACKAGE_KODI_GL_EGL
 
 menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
@@ -38,7 +31,7 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL_EGL
+	depends on BR2_PACKAGE_KODI_GL_EGL
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # python and others
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 9d3b65ae91..aecbc994c4 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -254,16 +254,6 @@ else
 KODI_CONF_OPTS += -DENABLE_OPENGL=OFF -DENABLE_X11=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
-KODI_DEPENDENCIES += libegl libgles
-KODI_CONF_OPTS += \
-	-DENABLE_OPENGLES=ON
-KODI_C_FLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags --libs egl`
-KODI_CXX_FLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags --libs egl`
-else
-KODI_CONF_OPTS += -DENABLE_OPENGLES=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_KODI_LIBMICROHTTPD),y)
 KODI_CONF_OPTS += -DENABLE_MICROHTTPD=ON
 KODI_DEPENDENCIES += libmicrohttpd
-- 
2.14.2
