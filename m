From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Aug 2019 12:59:52 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: remove AMLogic support
Message-ID: <20190810105955.22449-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi 19 will remove specific support for AMLogic:
https://github.com/xbmc/xbmc/pull/16043

Also buildroot dropped support for the odroid2c defconfig:
https://git.buildroot.net/buildroot/commit/?id=b80712a16ae3deb65331a7923aa878e13e2e66b6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy       |  7 +++++++
 package/kodi/Config.in | 11 -----------
 package/kodi/kodi.mk   | 10 ----------
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index de05b07c97..03d17d1743 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.08"
 
+config BR2_PACKAGE_KODI_PLATFORM_AML
+	bool "Kodi AMLogic support was removed"
+	select BR2_LEGACY
+	help
+	  Support for AMLogic was removed due to the removal of the
+	  odroidc2 defconfig.
+
 config BR2_GCC_VERSION_6_X
 	bool "gcc 6.x support removed"
 	select BR2_LEGACY
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 279b4ead0d..626038e8c8 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -18,13 +18,6 @@ comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, t
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 	bool
 
-config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_AML
-	bool
-	default y
-	depends on BR2_PACKAGE_LIBAMCODEC
-	depends on BR2_PACKAGE_ODROID_MALI
-	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
 	bool
 	default y
@@ -202,10 +195,6 @@ choice
 	prompt "platform"
 	default BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 
-config BR2_PACKAGE_KODI_PLATFORM_AML
-	bool "AMLogic"
-	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_AML
-
 config BR2_PACKAGE_KODI_PLATFORM_RBPI
 	bool "Raspberry Pi"
 	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 590af15b7c..6e482e615c 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -163,16 +163,6 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 KODI_CXX_FLAGS += -latomic
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_PLATFORM_AML),y)
-KODI_CONF_OPTS += -DENABLE_AML=ON -DENABLE_OPENGLES=ON
-# The following line can be removed when bumping to 18.0-Leia,
-# see upstream PR 13425
-KODI_CXX_FLAGS += -DMESA_EGL_NO_X11_HEADERS
-KODI_DEPENDENCIES += libamcodec odroid-mali
-else
-KODI_CONF_OPTS += -DENABLE_AML=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_RBPI),y)
 KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi -DENABLE_OPENGLES=ON
 KODI_DEPENDENCIES += rpi-userland
-- 
2.20.1
