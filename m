From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Apr 2018 09:03:36 +0200
Subject: [Buildroot] [PATCH 3/4] package/kodi: Rework windowing support
 options
In-Reply-To: <20180401070337.18301-1-bernd.kuhls@t-online.de>
References: <20180401070337.18301-1-bernd.kuhls@t-online.de>
Message-ID: <20180401070337.18301-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To prepare the bump to the next Kodi version 18.0-Leia we rework the
options to control the windowing platform Kodi is built for. An
automatic choice will no longer be suitable after addition of support
for wayland and gbm, the former also providing a choice to use either
OpenGL or OpenGL ES.

This patch introduces a new choice option by converting the current
X11-based OpenGL support to the new scheme. Other windowing platforms
will be added by subsequent patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 41 +++++++++++++++++++++++++++--------------
 package/kodi/kodi.mk   | 19 +++++++++++--------
 2 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index fefed70e0d..649896df4e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -15,14 +15,19 @@ comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, t
 		|| !BR2_PACKAGE_PYTHON \
 		|| BR2_PACKAGE_PYTHON_PYC_ONLY
 
-config BR2_PACKAGE_KODI_GL_EGL
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+	bool
+
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
 comment "kodi needs an OpenGL EGL backend with OpenGL support"
-	depends on !BR2_PACKAGE_KODI_GL_EGL
+	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
 menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
@@ -31,10 +36,10 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_PACKAGE_KODI_GL_EGL
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # python and others
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
 	select BR2_NEEDS_HOST_JAVA
@@ -51,7 +56,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBCROSSGUID
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBFRIBIDI
-	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_KODI_GL_EGL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBSAMPLERATE
@@ -73,8 +77,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TINYXML
-	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_KODI_GL_EGL
-	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_KODI_GL_EGL
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
@@ -183,6 +185,19 @@ config BR2_PACKAGE_KODI_NONFREE
 	  Enable components with non-free licenses. This option
 	  currently only controls support for RAR archives.
 
+choice
+	prompt "platform"
+	default BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
+
+config BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
+	bool "X11/OpenGL"
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+
+endchoice
+
 config BR2_PACKAGE_KODI_PULSEAUDIO
 	bool "pulseaudio"
 	# Pulseaudio support in kodi needs glib support in Pulseaudio,
@@ -232,25 +247,23 @@ config BR2_PACKAGE_KODI_LIBUSB
 
 config BR2_PACKAGE_KODI_LIBVA
 	bool "va"
-	depends on BR2_PACKAGE_KODI_GL_EGL
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 	select BR2_PACKAGE_LIBVA
 	help
 	  Enable libva support.
 
-comment "libva support needs X.org with an openGL backend"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_GL_EGL
+comment "libva support needs platform 'X11/OpenGL'"
+	depends on !BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 
 config BR2_PACKAGE_KODI_LIBVDPAU
 	bool "vdpau"
-	depends on BR2_PACKAGE_KODI_GL_EGL
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 	select BR2_PACKAGE_LIBVDPAU
 	help
 	  Enable libvdpau support.
 
-comment "libvdpau support needs X.org with an openGL backend"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_GL_EGL
+comment "libvdpau support needs platform 'X11/OpenGL'"
+	depends on !BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 
 config BR2_PACKAGE_KODI_UPNP
 	bool "upnp"
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 03be32acf2..d7c11f22ae 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -162,6 +162,17 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 KODI_CXX_FLAGS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL),y)
+KODI_DEPENDENCIES += libegl libglu libgl xlib_libX11 xlib_libXext \
+	xlib_libXrandr libdrm
+KODI_CONF_OPTS += \
+	-DENABLE_OPENGL=ON \
+	-DENABLE_OPENGLES=OFF \
+	-DENABLE_X11=ON
+else
+KODI_CONF_OPTS += -DENABLE_OPENGL=OFF -DENABLE_X11=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
 KODI_CONF_OPTS += -DENABLE_MYSQLCLIENT=ON
 KODI_DEPENDENCIES += mysql
@@ -241,14 +252,6 @@ else
 KODI_CONF_OPTS += -DENABLE_ALSA=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_GL_EGL),y)
-KODI_DEPENDENCIES += libegl libglu libgl xlib_libX11 xlib_libXext \
-	xlib_libXrandr libdrm
-KODI_CONF_OPTS += -DENABLE_OPENGL=ON -DENABLE_X11=ON -DENABLE_OPENGLES=OFF
-else
-KODI_CONF_OPTS += -DENABLE_OPENGL=OFF -DENABLE_X11=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_KODI_LIBMICROHTTPD),y)
 KODI_CONF_OPTS += -DENABLE_MICROHTTPD=ON
 KODI_DEPENDENCIES += libmicrohttpd
-- 
2.14.2
