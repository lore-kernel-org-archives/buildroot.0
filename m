From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 21:57:17 +0200
Subject: [Buildroot] [PATCHv5 03/14] qt5base: adjust linux-buildroot-g++
	qmake.conf
In-Reply-To: <1365364648-30568-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365364648-30568-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365364648-30568-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for qmake to generate correct moc command lines, we need to
make sure INCLUDEPATH contains $(STAGING_DIR)/usr/include. To do so,
we add a new line in our custom qmake.conf.

Also, in order to clearly identify the Buildroot specific variables
from the qmake standard variables, we prefix all the custom Buildroot
variables by BUILDROOT_ in qmake.conf.

This solves compilation issues of qt5svg such as "Undefined
interface", due to the fact that moc isn't passed a -I path pointing
to the main header directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base-mkspecs-files.patch |   24 ++++++++++++-----------
 package/qt5/qt5base/qt5base.mk                  |    7 ++++---
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-mkspecs-files.patch b/package/qt5/qt5base/qt5base-mkspecs-files.patch
index d5827f6..bfa9c15 100644
--- a/package/qt5/qt5base/qt5base-mkspecs-files.patch
+++ b/package/qt5/qt5base/qt5base-mkspecs-files.patch
@@ -14,7 +14,7 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
 ===================================================================
 --- /dev/null
 +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
-@@ -0,0 +1,41 @@
+@@ -0,0 +1,43 @@
 +MAKEFILE_GENERATOR      = UNIX
 +CONFIG                  += incremental gdb_dwarf_index
 +QMAKE_INCREMENTAL_STYLE = sublib
@@ -27,25 +27,27 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
 +
 +QT_QPA_DEFAULT_PLATFORM = eglfs
 +
-+CROSS_COMPILE =
-+COMPILER_CFLAGS =
-+COMPILER_CXXFLAGS =
++BUILDROOT_CROSS_COMPILE =
++BUILDROOT_COMPILER_CFLAGS =
++BUILDROOT_COMPILER_CXXFLAGS =
++BUILDROOT_INCLUDE_PATH =
 +
 +# modifications to g++.conf
-+QMAKE_CC                = $${CROSS_COMPILE}gcc
-+QMAKE_CXX               = $${CROSS_COMPILE}g++
++QMAKE_CC                = $${BUILDROOT_CROSS_COMPILE}gcc
++QMAKE_CXX               = $${BUILDROOT_CROSS_COMPILE}g++
 +QMAKE_LINK              = $${QMAKE_CXX}
 +QMAKE_LINK_SHLIB        = $${QMAKE_CXX}
 +
 +# modifications to linux.conf
-+QMAKE_AR                = $${CROSS_COMPILE}ar cqs
-+QMAKE_OBJCOPY           = $${CROSS_COMPILE}objcopy
-+QMAKE_STRIP             = $${CROSS_COMPILE}strip
++QMAKE_AR                = $${BUILDROOT_CROSS_COMPILE}ar cqs
++QMAKE_OBJCOPY           = $${BUILDROOT_CROSS_COMPILE}objcopy
++QMAKE_STRIP             = $${BUILDROOT_CROSS_COMPILE}strip
 +
 +#modifications to gcc-base.conf
-+QMAKE_CFLAGS           += $${COMPILER_CFLAGS}
-+QMAKE_CXXFLAGS         += $${COMPILER_CXXFLAGS}
++QMAKE_CFLAGS           += $${BUILDROOT_COMPILER_CFLAGS}
++QMAKE_CXXFLAGS         += $${BUILDROOT_COMPILER_CXXFLAGS}
 +QMAKE_CXXFLAGS_RELEASE += -O3
++INCLUDEPATH            += $${BUILDROOT_INCLUDE_PATH}
 +
 +QMAKE_LIBS             += -lrt -lpthread -ldl
 +
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 0d0fb11..303d255 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -134,9 +134,10 @@ define QT5BASE_CONFIG_SET
 endef
 
 define QT5BASE_CONFIGURE_CMDS
-	$(call QT5BASE_CONFIG_SET,CROSS_COMPILE,$(TARGET_CROSS))
-	$(call QT5BASE_CONFIG_SET,COMPILER_CFLAGS,$(TARGET_CFLAGS))
-	$(call QT5BASE_CONFIG_SET,COMPILER_CXXFLAGS,$(TARGET_CXXFLAGS))
+	$(call QT5BASE_CONFIG_SET,BUILDROOT_CROSS_COMPILE,$(TARGET_CROSS))
+	$(call QT5BASE_CONFIG_SET,BUILDROOT_COMPILER_CFLAGS,$(TARGET_CFLAGS))
+	$(call QT5BASE_CONFIG_SET,BUILDROOT_COMPILER_CXXFLAGS,$(TARGET_CXXFLAGS))
+	$(call QT5BASE_CONFIG_SET,BUILDROOT_INCLUDE_PATH,$(STAGING_DIR)/usr/include)
 	$(call QT5BASE_CONFIG_SET,EGLFS_PLATFORM_HOOKS_SOURCES, \
 		$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES))
 	(cd $(@D); \
-- 
1.7.9.5
