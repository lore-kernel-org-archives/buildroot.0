From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  2 Feb 2020 17:20:24 +0100
Subject: [Buildroot] [PATCH 3/3] package/kodi: add optional support for gbm
In-Reply-To: <20200202162024.21405-1-bernd.kuhls@t-online.de>
References: <20200202162024.21405-1-bernd.kuhls@t-online.de>
Message-ID: <20200202162024.21405-3-bernd.kuhls@t-online.de>
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
index 0a793abe37..1bd9c1234f 100644
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
@@ -205,6 +224,26 @@ choice
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
@@ -276,6 +315,8 @@ config BR2_PACKAGE_KODI_LIBUSB
 config BR2_PACKAGE_KODI_LIBVA
 	bool "va"
 	depends on \
+		BR2_PACKAGE_KODI_PLATFORM_GBM_GL || \
+		BR2_PACKAGE_KODI_PLATFORM_GBM_GLES || \
 		BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL || \
 		BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES || \
 		BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
@@ -283,8 +324,10 @@ config BR2_PACKAGE_KODI_LIBVA
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
index 2f2a92a889..34f7a9dbe7 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -169,6 +169,20 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
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
