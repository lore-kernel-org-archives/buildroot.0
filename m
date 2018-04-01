From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Apr 2018 15:01:09 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/kodi: Add windowing support for
 Raspberry Pi & AMLogic
In-Reply-To: <20180401130109.8006-1-bernd.kuhls@t-online.de>
References: <20180401130109.8006-1-bernd.kuhls@t-online.de>
Message-ID: <20180401130109.8006-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added AML support

 package/kodi/Config.in | 24 ++++++++++++++++++++++++
 package/kodi/kodi.mk   | 44 +++++++++++++++++++++++---------------------
 2 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 649896df4e..603b63a4da 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -18,6 +18,22 @@ comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, t
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 	bool
 
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_AML
+	bool
+	default y
+	depends on BR2_PACKAGE_LIBAMCODEC
+	depends on BR2_PACKAGE_ODROID_MALI
+	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+
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
@@ -189,6 +205,14 @@ choice
 	prompt "platform"
 	default BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 
+config BR2_PACKAGE_KODI_PLATFORM_AML
+	bool "AMLogic"
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_AML
+
+config BR2_PACKAGE_KODI_PLATFORM_RBPI
+	bool "Raspberry Pi"
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
+
 config BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 	bool "X11/OpenGL"
 	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 4891bb734f..810567f06e 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -78,9 +78,7 @@ ifeq ($(BR2_ENABLE_LOCALE),)
 KODI_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi
-KODI_DEPENDENCIES += rpi-userland
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_RBPI),y)
 # These CPU-specific options are only used on rbpi:
 # https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L13
 ifeq ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
@@ -161,6 +159,28 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 KODI_CXX_FLAGS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_AML),y)
+KODI_CONF_OPTS += -DENABLE_AML=ON -DENABLE_OPENGLES=ON
+# The following line can be removed when bumping to 18.0-Leia,
+# see upstream PR 13425
+KODI_CXX_FLAGS += -DMESA_EGL_NO_X11_HEADERS
+KODI_DEPENDENCIES += libamcodec odroid-mali
+else
+KODI_CONF_OPTS += -DENABLE_AML=OFF
+endif
+
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
 KODI_CONF_OPTS += \
 	-DENABLE_OPENGL=ON \
@@ -187,24 +207,6 @@ else
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
-ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
-KODI_CONF_OPTS += -DENABLE_AML=ON
-KODI_DEPENDENCIES += libamcodec
-else
-KODI_CONF_OPTS += -DENABLE_AML=OFF
-endif
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 KODI_CONF_OPTS += -DENABLE_UDEV=ON
 KODI_DEPENDENCIES += udev
-- 
2.14.2
