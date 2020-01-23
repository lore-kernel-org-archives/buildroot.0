From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Jan 2020 06:15:17 +0100
Subject: [Buildroot] [PATCH 3/3] package/kodi: add optional support for gbm
In-Reply-To: <20200123051517.3726-1-bernd.kuhls@t-online.de>
References: <20200123051517.3726-1-bernd.kuhls@t-online.de>
Message-ID: <20200123051517.3726-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see upstream PR 11955.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 45 +++++++++++++++++++++++++++++++++++++++++-
 package/kodi/kodi.mk   | 14 +++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 630813b437..83d214415e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -17,6 +17,25 @@ comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, t
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 	bool
 
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM_GL
+	bool
+	default y
+	depends on BR2_ENABLE_LOCALE # libinput
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_MESA3D_GBM
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM_GLES
+	bool
+	default y
+	depends on BR2_ENABLE_LOCALE # libinput
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_MESA3D_GBM
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
 	bool
 	default y
@@ -204,6 +223,26 @@ choice
 	prompt "platform"
 	default BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 
+config BR2_PACKAGE_KODI_PLATFORM_GBM_GL
+	bool "gbm/OpenGL"
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM_GL
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+
+config BR2_PACKAGE_KODI_PLATFORM_GBM_GLES
+	bool "gbm/GLES"
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM_GLES
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+
+comment "gbm support needs OpenGL or GLES support"
+	depends on \
+		BR2_PACKAGE_MESA3D_GBM && \
+		!BR2_PACKAGE_HAS_LIBEGL && \
+		!BR2_PACKAGE_HAS_LIBGLES
+
 config BR2_PACKAGE_KODI_PLATFORM_RBPI
 	bool "Raspberry Pi"
 	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
@@ -275,6 +314,8 @@ config BR2_PACKAGE_KODI_LIBUSB
 config BR2_PACKAGE_KODI_LIBVA
 	bool "va"
 	depends on \
+		BR2_PACKAGE_KODI_PLATFORM_GBM_GL || \
+		BR2_PACKAGE_KODI_PLATFORM_GBM_GLES || \
 		BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL || \
 		BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES || \
 		BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
@@ -282,8 +323,10 @@ config BR2_PACKAGE_KODI_LIBVA
 	help
 	  Enable libva support.
 
-comment "libva support needs platform 'Wayland' or 'X11/OpenGL'"
+comment "libva support needs platform 'gbm', 'Wayland' or 'X11/OpenGL'"
 	depends on \
+		!BR2_PACKAGE_KODI_PLATFORM_GBM_GL && \
+		!BR2_PACKAGE_KODI_PLATFORM_GBM_GLES && \
 		!BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL && \
 		!BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES && \
 		!BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index fd20cd38f7..d58bd6d333 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -174,6 +174,20 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 KODI_CXX_FLAGS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_GBM_GL),y)
+KODI_CONF_OPTS += \
+	-DCORE_PLATFORM_NAME=gbm \
+	-DGBM_RENDER_SYSTEM=gl
+KODI_DEPENDENCIES += libegl libglu libinput libxkbcommon mesa3d
+endif
+
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_GBM_GLES),y)
+KODI_CONF_OPTS += \
+	-DCORE_PLATFORM_NAME=gbm \
+	-DGBM_RENDER_SYSTEM=gles
+KODI_DEPENDENCIES += libgles libinput libxkbcommon mesa3d
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_RBPI),y)
 KODI_CONF_OPTS += -DCORE_PLATFORM_NAME=rbpi
 KODI_DEPENDENCIES += libinput libxkbcommon rpi-userland
-- 
2.20.1
