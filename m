From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 00:26:02 +0100
Subject: [Buildroot] [PATCH 11/30] qt5base: new package
In-Reply-To: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362007582-14753-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the beginning of the Qt5 packaging. This commit allows to
build only the qtbase module, which contains QtCore, QtNetwork, QtXml,
QtTest, QtSql and QtConcurrent.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                               |    1 +
 package/qt5/Config.in                           |    2 +-
 package/qt5/qt5base/Config.in                   |   56 ++++++++++
 package/qt5/qt5base/qt5base-mkspecs-files.patch |   61 +++++++++++
 package/qt5/qt5base/qt5base-uclibc-no-lfs.patch |   36 +++++++
 package/qt5/qt5base/qt5base.mk                  |  131 +++++++++++++++++++++++
 6 files changed, 286 insertions(+), 1 deletion(-)
 create mode 100644 package/qt5/qt5base/Config.in
 create mode 100644 package/qt5/qt5base/qt5base-mkspecs-files.patch
 create mode 100644 package/qt5/qt5base/qt5base-uclibc-no-lfs.patch
 create mode 100644 package/qt5/qt5base/qt5base.mk

diff --git a/package/Config.in b/package/Config.in
index c8b6c1a..c688eab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -148,6 +148,7 @@ source "package/qtuio/Config.in"
 source "package/qwt/Config.in"
 endif
 
+source "package/qt5/Config.in"
 source "package/x11r7/Config.in"
 
 comment "X libraries and helper libraries"
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 0acb89e..1c9f8a6 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -14,5 +14,5 @@ menuconfig BR2_PACKAGE_QT5
 	  http://qt-project.org
 
 if BR2_PACKAGE_QT5
-
+source "package/qt5/qt5base/Config.in"
 endif
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
new file mode 100644
index 0000000..4cd6ce0
--- /dev/null
+++ b/package/qt5/qt5base/Config.in
@@ -0,0 +1,56 @@
+config BR2_PACKAGE_QT5BASE
+	bool "qt5base"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_16
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5base module, which
+	  contains the base Qt libraries: QtCore, QtNetwork, QtGui,
+	  QtWidgets, etc.
+
+	  http://qt-project.org
+
+if BR2_PACKAGE_QT5BASE
+
+config BR2_PACKAGE_QT5BASE_LICENSE_APPROVED
+	bool "Approve free license"
+	help
+	  Select this if you approve one of the available free licenses for the
+	  Qt5 library.
+	  By doing this you will not be asked while the library is compiled.
+	  Please read and understand the license terms before approving this.
+
+	  LGPL v2.1: http://qt-project.org/doc/qt-5.0/qtdoc/lgpl.html
+	  GPL  v3.0: http://qt-project.org/doc/qt-5.0/qtdoc/gpl.html
+
+	  See also http://qt-project.org/doc/qt-5.0/qtdoc/licensing.html
+
+config BR2_PACKAGE_QT5BASE_NETWORK
+	bool "network module"
+	help
+	  This options enables the Qt5Network library.
+
+config BR2_PACKAGE_QT5BASE_CONCURRENT
+	bool "concurrent module"
+	help
+	  This options enables the Qt5Concurrent library.
+
+config BR2_PACKAGE_QT5BASE_SQL
+	bool "sql module"
+	help
+	  This options enables the Qt5Sql library.
+
+config BR2_PACKAGE_QT5BASE_TEST
+	bool "test module"
+	help
+	  This options enables the Qt5Test library.
+
+config BR2_PACKAGE_QT5BASE_XML
+	bool "XML module"
+	help
+	  This options enables the Qt5Xml library.
+
+endif
diff --git a/package/qt5/qt5base/qt5base-mkspecs-files.patch b/package/qt5/qt5base/qt5base-mkspecs-files.patch
new file mode 100644
index 0000000..a86d0b1
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-mkspecs-files.patch
@@ -0,0 +1,61 @@
+Add a Buildroot 'device' to ease cross-compilation
+
+Qt5 has a mechanism to support "device" profiles, so that people can
+specify the compiler, compiler flags and so on for a specific device.
+
+We leverage this mechanism in the Buildroot packaging of qt5 to
+simplify cross-compilation: we have our own "device" definition, which
+allows us to easily pass the cross-compiler paths and flags from our
+qt5.mk.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
+===================================================================
+--- /dev/null
++++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
+@@ -0,0 +1,38 @@
++MAKEFILE_GENERATOR      = UNIX
++CONFIG                  += incremental gdb_dwarf_index
++QMAKE_INCREMENTAL_STYLE = sublib
++
++include(../../common/linux.conf)
++include(../../common/gcc-base-unix.conf)
++include(../../common/g++-unix.conf)
++
++load(device_config)
++
++QT_QPA_DEFAULT_PLATFORM = eglfs
++
++CROSS_COMPILE =
++COMPILER_CFLAGS =
++COMPILER_CXXFLAGS =
++
++# modifications to g++.conf
++QMAKE_CC                = $${CROSS_COMPILE}gcc
++QMAKE_CXX               = $${CROSS_COMPILE}g++
++QMAKE_LINK              = $${QMAKE_CXX}
++QMAKE_LINK_SHLIB        = $${QMAKE_CXX}
++
++# modifications to linux.conf
++QMAKE_AR                = $${CROSS_COMPILE}ar cqs
++QMAKE_OBJCOPY           = $${CROSS_COMPILE}objcopy
++QMAKE_STRIP             = $${CROSS_COMPILE}strip
++
++#modifications to gcc-base.conf
++QMAKE_CFLAGS           += $${COMPILER_CFLAGS}
++QMAKE_CXXFLAGS         += $${COMPILER_CXXFLAGS}
++QMAKE_CXXFLAGS_RELEASE += -O3
++
++QMAKE_LIBS             += -lrt -lpthread -ldl
++
++# Sanity check
++deviceSanityCheckCompiler()
++
++load(qt_config)
+Index: b/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
+===================================================================
+--- /dev/null
++++ b/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
+@@ -0,0 +1 @@
++#include "../../linux-g++/qplatformdefs.h"
diff --git a/package/qt5/qt5base/qt5base-uclibc-no-lfs.patch b/package/qt5/qt5base/qt5base-uclibc-no-lfs.patch
new file mode 100644
index 0000000..9772d49
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-uclibc-no-lfs.patch
@@ -0,0 +1,36 @@
+From 6f88b27de256266947a7f6a3e70e18510754aab2 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Sat, 14 Apr 2012 20:36:07 +0200
+Subject: [PATCH] mkspecs/common/posix: fix !largefile builds on uClibc
+
+uClibc doesn't even define O_LARGEFILE when not configured with large file
+support, so ensure this define is only used when Qt is built with
+-largefile, otherwise the build fails with:
+
+io/qtemporaryfile.cpp: In function 'bool createFileFromTemplate(
+        NativeFileHandle&, QFileSystemEntry::NativePath&, size_t, size_t,
+        QSystemError&)':
+io/qtemporaryfile.cpp:197:57: error: 'O_LARGEFILE' was not declared in
+        this scope
+
+Moved to qt5 by Thomas Petazzoni.
+
+Reported-Upstream: https://bugreports.qt-project.org/browse/QTBUG-25321
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+
+Index: b/mkspecs/common/posix/qplatformdefs.h
+===================================================================
+--- a/mkspecs/common/posix/qplatformdefs.h
++++ b/mkspecs/common/posix/qplatformdefs.h
+@@ -123,7 +123,11 @@
+ #define QT_READ                 ::read
+ #define QT_WRITE                ::write
+ 
++#ifdef QT_LARGEFILE_SUPPORT
+ #define QT_OPEN_LARGEFILE       O_LARGEFILE
++#else
++#define QT_OPEN_LARGEFILE       0
++#endif
+ #define QT_OPEN_RDONLY          O_RDONLY
+ #define QT_OPEN_WRONLY          O_WRONLY
+ #define QT_OPEN_RDWR            O_RDWR
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
new file mode 100644
index 0000000..094ded1
--- /dev/null
+++ b/package/qt5/qt5base/qt5base.mk
@@ -0,0 +1,131 @@
+#############################################################
+#
+# qt5base
+#
+#############################################################
+
+QT5BASE_VERSION = 5.0.0
+QT5BASE_SITE = http://releases.qt-project.org/qt5/$(QT5BASE_VERSION)/submodules_tar/
+QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
+
+QT5BASE_DEPENDENCIES = host-pkgconf zlib pcre
+QT5BASE_INSTALL_STAGING = YES
+
+# A few comments:
+#  * -no-pch to workaround the issue described at
+#     http://comments.gmane.org/gmane.comp.lib.qt.devel/5933.
+#  * -system-zlib because zlib is mandatory for Qt build, and we
+#     want to use the Buildroot packaged zlib
+#  * -system-pcre because pcre is mandatory to build Qt, and we
+#    want to use the one packaged in Buildroot
+QT5BASE_CONFIGURE_OPTS += \
+	-optimized-qmake \
+	-no-linuxfb \
+	-no-xcb \
+	-no-directfb \
+	-no-eglfs \
+	-no-kms \
+	-no-gui \
+	-no-widgets \
+	-no-opengl \
+	-no-glib \
+	-no-cups \
+	-no-nis \
+	-no-libudev \
+	-no-iconv \
+	-no-openssl \
+	-no-fontconfig \
+	-no-gif \
+	-no-libpng \
+	-no-libjpeg \
+	-no-icu \
+	-no-dbus \
+	-no-gstreamer \
+	-no-gtkstyle \
+	-system-zlib \
+	-system-pcre \
+	-no-pch
+
+ifeq ($(BR2_LARGEFILE),y)
+QT5BASE_CONFIGURE_OPTS += -largefile
+else
+QT5BASE_CONFIGURE_OPTS += -no-largefile
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
+QT5BASE_LICENSE = LGPLv2.1 or GPLv3.0
+QT5BASE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+else
+QT5BASE_LICENSE = Commercial license
+QT5BASE_REDISTRIBUTE = NO
+endif
+
+# Build the list of libraries to be installed on the target
+QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT) += Qt5Concurrent
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
+
+# Ideally, we could use -device-option to substitute variable values
+# in our linux-buildroot-g++/qmake.config, but this mechanism doesn't
+# nicely support variable values that contain spaces. So we use the
+# good old sed solution here.
+define QT5BASE_CONFIG_SET
+	$(SED) 's%^$(1).*%$(1) = $(2)%g' $(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+endef
+
+define QT5BASE_CONFIGURE_CMDS
+	$(call QT5BASE_CONFIG_SET,CROSS_COMPILE,$(TARGET_CROSS))
+	$(call QT5BASE_CONFIG_SET,COMPILER_CFLAGS,$(TARGET_CFLAGS))
+	$(call QT5BASE_CONFIG_SET,COMPILER_CXXFLAGS,$(TARGET_CXXFLAGS))
+	(cd $(@D); \
+		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
+		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
+		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
+		./configure \
+		-v \
+		-prefix /usr \
+		-hostprefix $(HOST_DIR)/usr \
+		-sysroot $(STAGING_DIR) \
+		-plugindir /usr/lib/qt/plugins \
+		-fast \
+		-no-rpath \
+		-nomake examples -nomake demos -nomake tests \
+		-device buildroot \
+		-no-c++11 \
+		$(QT5BASE_CONFIGURE_OPTS) \
+	)
+endef
+
+define QT5BASE_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define QT5BASE_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5BASE_INSTALL_TARGET_LIBS
+	for lib in $(QT5BASE_INSTALL_LIBS_y); do \
+		cp -dpf $(STAGING_DIR)/usr/lib/lib$${lib}.so.* $(TARGET_DIR)/usr/lib ; \
+	done
+endef
+
+define QT5BASE_INSTALL_TARGET_PLUGINS
+	if [ -d $(STAGING_DIR)/usr/lib/qt/plugins/ ] ; then \
+		mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins ; \
+		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins ; \
+	fi
+endef
+
+define QT5BASE_INSTALL_TARGET_CMDS
+	$(QT5BASE_INSTALL_TARGET_LIBS)
+	$(QT5BASE_INSTALL_TARGET_PLUGINS)
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
