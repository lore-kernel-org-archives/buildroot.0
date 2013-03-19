From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 22:41:39 +0100
Subject: [Buildroot] [git commit] qt5base: add rPi EGL glue code
Message-ID: <20130319214235.E47A09B1BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cd7b60f8bd2ad827028e3a82d2f62cf63831a99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the rpi-userland package is selected, assume we are targetting
the Raspberry Pi, and add the right platform glue code when building
the Qt5 EGLFS plugin.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5base/qt5base-mkspecs-files.patch |    5 ++++-
 package/qt5/qt5base/qt5base.mk                  |    6 ++++++
 2 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-mkspecs-files.patch b/package/qt5/qt5base/qt5base-mkspecs-files.patch
index a86d0b1..d5827f6 100644
--- a/package/qt5/qt5base/qt5base-mkspecs-files.patch
+++ b/package/qt5/qt5base/qt5base-mkspecs-files.patch
@@ -14,7 +14,7 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
 ===================================================================
 --- /dev/null
 +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
-@@ -0,0 +1,38 @@
+@@ -0,0 +1,41 @@
 +MAKEFILE_GENERATOR      = UNIX
 +CONFIG                  += incremental gdb_dwarf_index
 +QMAKE_INCREMENTAL_STYLE = sublib
@@ -49,6 +49,9 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
 +
 +QMAKE_LIBS             += -lrt -lpthread -ldl
 +
++# device specific glue code
++EGLFS_PLATFORM_HOOKS_SOURCES =
++
 +# Sanity check
 +deviceSanityCheckCompiler()
 +
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ac63e98..3b4c007 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -75,6 +75,10 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
 QT5BASE_DEPENDENCIES   += libgles libegl
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
+	$(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
+endif
 else
 QT5BASE_CONFIGURE_OPTS += -no-opengl -no-eglfs
 endif
@@ -125,6 +129,8 @@ define QT5BASE_CONFIGURE_CMDS
 	$(call QT5BASE_CONFIG_SET,CROSS_COMPILE,$(TARGET_CROSS))
 	$(call QT5BASE_CONFIG_SET,COMPILER_CFLAGS,$(TARGET_CFLAGS))
 	$(call QT5BASE_CONFIG_SET,COMPILER_CXXFLAGS,$(TARGET_CXXFLAGS))
+	$(call QT5BASE_CONFIG_SET,EGLFS_PLATFORM_HOOKS_SOURCES, \
+		$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES))
 	(cd $(@D); \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
