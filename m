From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 14:22:48 +0100
Subject: [Buildroot] [git commit] package/kodi: Add windowing support for
 Raspberry Pi & AMLogic
Message-ID: <20190206132225.3676D80279@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b1c0855b321807abdcd737057ae7436547b8001
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi/Config.in | 24 ++++++++++++++++++++++++
 package/kodi/kodi.mk   | 44 +++++++++++++++++++++++---------------------
 2 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 30cfea9a52..279b4ead0d 100644
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
@@ -186,6 +202,14 @@ choice
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
index b7b12c57bc..590af15b7c 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -82,9 +82,7 @@ ifeq ($(BR2_ENABLE_LOCALE),)
 KODI_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi
-KODI_DEPENDENCIES += rpi-userland
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_RBPI),y)
 # These CPU-specific options are only used on rbpi:
 # https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L13
 ifeq ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
@@ -165,6 +163,28 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
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
@@ -191,24 +211,6 @@ else
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
