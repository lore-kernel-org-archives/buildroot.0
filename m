From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Apr 2018 09:03:37 +0200
Subject: [Buildroot] [PATCH 4/4] package/kodi: Add Raspberry Pi to windowing
 support options
In-Reply-To: <20180401070337.18301-1-bernd.kuhls@t-online.de>
References: <20180401070337.18301-1-bernd.kuhls@t-online.de>
Message-ID: <20180401070337.18301-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 13 +++++++++++++
 package/kodi/kodi.mk   | 28 +++++++++++++---------------
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 649896df4e..257d1cd37a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -18,6 +18,15 @@ comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, t
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 	bool
 
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
+	bool
+	default y
+	# List of valid CPUs can be found here:
+	# https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L12
+	depends on BR2_arm1176jzf_s || BR2_cortex_a7 || BR2_cortex_a53
+	depends on BR2_PACKAGE_RPI_USERLAND
+	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
 	bool
 	default y
@@ -189,6 +198,10 @@ choice
 	prompt "platform"
 	default BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 
+config BR2_PACKAGE_KODI_PLATFORM_RBPI
+	bool "Raspberry Pi"
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
+
 config BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 	bool "X11/OpenGL"
 	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index d7c11f22ae..4e634049de 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -79,9 +79,7 @@ ifeq ($(BR2_ENABLE_LOCALE),)
 KODI_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi
-KODI_DEPENDENCIES += rpi-userland
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_RBPI),y)
 # These CPU-specific options are only used on rbpi:
 # https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L13
 ifeq ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
@@ -162,6 +160,18 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 KODI_CXX_FLAGS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_RBPI),y)
+KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi -DENABLE_OPENGLES=ON
+KODI_DEPENDENCIES += rpi-userland
+else
+# Kodi considers "rpbi" and "linux" as two separate platforms. The
+# below options, defined in
+# project/cmake/scripts/linux/ArchSetup.cmake are only valid for the
+# "linux" platforms. The "rpbi" platform has a different set of
+# options, defined in project/cmake/scripts/rbpi/
+KODI_CONF_OPTS += -DENABLE_LDGOLD=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL),y)
 KODI_DEPENDENCIES += libegl libglu libgl xlib_libX11 xlib_libXext \
 	xlib_libXrandr libdrm
@@ -188,18 +198,6 @@ else
 KODI_CONF_OPTS += -DENABLE_NONFREE=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi
-KODI_DEPENDENCIES += rpi-userland
-else
-# Kodi considers "rpbi" and "linux" as two separate platforms. The
-# below options, defined in
-# project/cmake/scripts/linux/ArchSetup.cmake are only valid for the
-# "linux" platforms. The "rpbi" platform has a different set of
-# options, defined in project/cmake/scripts/rbpi/
-KODI_CONF_OPTS += -DENABLE_LDGOLD=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 KODI_CONF_OPTS += -DENABLE_UDEV=ON
 KODI_DEPENDENCIES += udev
-- 
2.14.2
