From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri,  1 Mar 2013 17:46:20 +0100
Subject: [Buildroot] [PATCH] qt5: add rPi EGL glue code
Message-ID: <1362156380-27083-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the rpi-userland package is selected, assume we are targetting the Raspberry Pi, and add the right
platform glue code when building the Qt5 EGLFS plugin.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/qt5/qt5base/qt5base-mkspecs-files.patch |    6 +++++-
 package/qt5/qt5base/qt5base.mk                  |    8 ++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base-mkspecs-files.patch b/package/qt5/qt5base/qt5base-mkspecs-files.patch
index a86d0b1..56d3b03 100644
--- a/package/qt5/qt5base/qt5base-mkspecs-files.patch
+++ b/package/qt5/qt5base/qt5base-mkspecs-files.patch
@@ -14,7 +14,7 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
 ===================================================================
 --- /dev/null
 +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
-@@ -0,0 +1,38 @@
+@@ -0,0 +1,42 @@
 +MAKEFILE_GENERATOR      = UNIX
 +CONFIG                  += incremental gdb_dwarf_index
 +QMAKE_INCREMENTAL_STYLE = sublib
@@ -49,6 +49,10 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
 +
 +QMAKE_LIBS             += -lrt -lpthread -ldl
 +
++# device specific glue code
++EGLFS_PLATFORM_HOOKS_SOURCES =
++EGLFS_PLATFORM_HOOKS_LIBS =
++
 +# Sanity check
 +deviceSanityCheckCompiler()
 +
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 0ea15c2..75492c8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -75,6 +75,12 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
 QT5BASE_DEPENDENCIES   += libgles libegl
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = $(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
+QT5BASE_EGLFS_PLATFORM_HOOKS_LIBS = -lbcm_host
+QT5BASE_CONFIGURE_OPTS += -I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
+QT5BASE_CONFIGURE_OPTS += -I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux
+endif
 else
 QT5BASE_CONFIGURE_OPTS += -no-opengl -no-eglfs
 endif
@@ -125,6 +131,8 @@ define QT5BASE_CONFIGURE_CMDS
 	$(call QT5BASE_CONFIG_SET,CROSS_COMPILE,$(TARGET_CROSS))
 	$(call QT5BASE_CONFIG_SET,COMPILER_CFLAGS,$(TARGET_CFLAGS))
 	$(call QT5BASE_CONFIG_SET,COMPILER_CXXFLAGS,$(TARGET_CXXFLAGS))
+	$(call QT5BASE_CONFIG_SET,EGLFS_PLATFORM_HOOKS_SOURCES,$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES))
+	$(call QT5BASE_CONFIG_SET,EGLFS_PLATFORM_HOOKS_LIBS,$(QT5BASE_EGLFS_PLATFORM_HOOKS_LIBS))
 	(cd $(@D); \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
-- 
1.7.10.4
