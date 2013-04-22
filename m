From: H.Fijnvandraat at inter.nl.net <H.Fijnvandraat@inter.nl.net>
Date: Mon, 22 Apr 2013 13:14:34 +0200 (CEST)
Subject: [Buildroot] iMX6Q package proposals for Qt5
In-Reply-To: <5174D566.7010403@mind.be>
References: <51034.217.149.209.147.1366471569.squirrel@webmail.internl.net>
 <5174D566.7010403@mind.be>
Message-ID: <25308.194.123.5.106.1366629274.squirrel@webmail.internl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all again,

With this email I inline the changes I made in package/qt5/qt5base
directory files.

I call them proposals at this moment, as I suspect they can be improved,
by people who have more buildroot inside knowledge.

The changes are a variation on the Raspberry-Pi modifications.

Note that the platform hooks point to the Freescale LTIB device directory
that can already be found in the qt5 source:
mkspecs/devices/linux-imx6-g++/qeglshooks.cpp

(Arnout, both -mfloat-abi=softfp -mfpu=neon are needed for the floating
point, the first seems to indicate the way parameters are transferred, the
second indicates the FPU)

kindly requesting for comments,

Henk



File qt5base-mkspecs-files.patch becomes:

=================================
Add a Buildroot 'device' to ease cross-compilation

Qt5 has a mechanism to support "device" profiles, so that people can
specify the compiler, compiler flags and so on for a specific device.

We leverage this mechanism in the Buildroot packaging of qt5 to
simplify cross-compilation: we have our own "device" definition, which
allows us to easily pass the cross-compiler paths and flags from our
qt5.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
===================================================================
--- /dev/null
+++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
@@ -0,0 +1,61 @@
+MAKEFILE_GENERATOR      = UNIX
+CONFIG                  += incremental gdb_dwarf_index
+QMAKE_INCREMENTAL_STYLE = sublib
+
+include(../../common/linux.conf)
+include(../../common/gcc-base-unix.conf)
+include(../../common/g++-unix.conf)
+
+load(device_config)
+
+QT_QPA_DEFAULT_PLATFORM = eglfs
+
+BUILDROOT_CROSS_COMPILE =
+BUILDROOT_COMPILER_CFLAGS =
+BUILDROOT_COMPILER_CXXFLAGS =
+BUILDROOT_INCLUDE_PATH =
+BUILDROOT_INCDIR_OPENGL_ES2 =
+BUILDROOT_LIBDIR_OPENGL_ES2 =
+BUILDROOT_LIBS_OPENGL_ES2 =
+BUILDROOT_INCDIR_EGL =
+BUILDROOT_LIBDIR_EGL =
+BUILDROOT_LIBS_EGL =
+BUILDROOT_INCDIR_OPENVG =
+BUILDROOT_LIBDIR_OPENVG =
+BUILDROOT_LIBS_OPENVG =
+
+# modifications to g++.conf
+QMAKE_CC                = $${BUILDROOT_CROSS_COMPILE}gcc
+QMAKE_CXX               = $${BUILDROOT_CROSS_COMPILE}g++
+QMAKE_LINK              = $${QMAKE_CXX}
+QMAKE_LINK_SHLIB        = $${QMAKE_CXX}
+
+# modifications to linux.conf
+QMAKE_AR                = $${BUILDROOT_CROSS_COMPILE}ar cqs
+QMAKE_OBJCOPY           = $${BUILDROOT_CROSS_COMPILE}objcopy
+QMAKE_STRIP             = $${BUILDROOT_CROSS_COMPILE}strip
+
+#modifications to gcc-base.conf
+QMAKE_CFLAGS           += $${BUILDROOT_COMPILER_CFLAGS}
+QMAKE_CXXFLAGS         += $${BUILDROOT_COMPILER_CXXFLAGS}
+QMAKE_CXXFLAGS_RELEASE += -O3
+INCLUDEPATH            += $${BUILDROOT_INCLUDE_PATH}
+
+QMAKE_LIBS             += -lrt -lpthread -ldl
+QMAKE_INCDIR_OPENGL_ES2 = $${BUILDROOT_INCDIR_OPENGL_ES2}
+QMAKE_LIBDIR_OPENGL_ES2 = $${BUILDROOT_LIBDIR_OPENGL_ES2}
+QMAKE_LIBS_OPENGL_ES2   = $${BUILDROOT_LIBS_OPENGL_ES2}
+QMAKE_INCDIR_EGL        = $${BUILDROOT_INCDIR_EGL}
+QMAKE_LIBDIR_EGL        = $${BUILDROOT_LIBDIR_EGL}
+QMAKE_LIBS_EGL          = $${BUILDROOT_LIBS_EGL}
+QMAKE_INCDIR_OPENVG     = $${BUILDROOT_INCDIR_OPENVG}
+QMAKE_LIBDIR_OPENVG     = $${BUILDROOT_LIBDIR_OPENVG}
+QMAKE_LIBS_OPENVG       = $${BUILDROOT_LIBS_OPENVG}
+
+# device specific glue code
+EGLFS_PLATFORM_HOOKS_SOURCES =
+
+# Sanity check
+deviceSanityCheckCompiler()
+
+load(qt_config)
Index: b/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
===================================================================
--- /dev/null
+++ b/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
@@ -0,0 +1 @@
+#include "../../linux-g++/qplatformdefs.h"
=================================

and the file qt5base.mk is then

=================================
#############################################################
#
# qt5base
#
#############################################################

QT5BASE_VERSION = $(QT5_VERSION)
QT5BASE_SITE =
http://releases.qt-project.org/qt5/$(QT5BASE_VERSION)/submodules_tar/
QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz

QT5BASE_DEPENDENCIES = host-pkgconf zlib pcre
QT5BASE_INSTALL_STAGING = YES

# A few comments:
#  * -no-pch to workaround the issue described at
#     http://comments.gmane.org/gmane.comp.lib.qt.devel/5933.
#  * -system-zlib because zlib is mandatory for Qt build, and we
#     want to use the Buildroot packaged zlib
#  * -system-pcre because pcre is mandatory to build Qt, and we
#    want to use the one packaged in Buildroot
QT5BASE_CONFIGURE_OPTS += \
	-optimized-qmake \
	-no-kms \
	-no-cups \
	-no-nis \
	-no-libudev \
	-no-iconv \
	-no-gstreamer \
	-no-gtkstyle \
	-system-zlib \
	-system-pcre \
	-no-pch

ifeq ($(BR2_ENABLE_DEBUG),y)
QT5BASE_CONFIGURE_OPTS += -debug
else
QT5BASE_CONFIGURE_OPTS += -release
endif

ifeq ($(BR2_PREFER_STATIC_LIB),y)
QT5BASE_CONFIGURE_OPTS += -static
else
# We apparently can't build both the shared and static variants of the
# library.
QT5BASE_CONFIGURE_OPTS += -shared
endif

ifeq ($(BR2_LARGEFILE),y)
QT5BASE_CONFIGURE_OPTS += -largefile
else
QT5BASE_CONFIGURE_OPTS += -no-largefile
endif

ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
QT5BASE_LICENSE = LGPLv2.1 or GPLv3.0
QT5BASE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
else
QT5BASE_LICENSE = Commercial license
QT5BASE_REDISTRIBUTE = NO
endif

# We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
# is to add a link against the "inuxfb" library.
QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-gui,-no-gui)
QT5BASE_CONFIGURE_OPTS += $(if
$(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
QT5BASE_CONFIGURE_OPTS += $(if
$(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
QT5BASE_CONFIGURE_OPTS += $(if
$(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)

ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
QT5BASE_CONFIGURE_OPTS += -xcb
QT5BASE_DEPENDENCIES   += \
	libxcb \
	xcb-util-wm \
	xcb-util-image \
	xcb-util-keysyms \
	xlib_libX11
else
QT5BASE_CONFIGURE_OPTS += -no-xcb
endif

QT5BASE_ADDITIONAL_INCLUDE_PATHS = $(STAGING_DIR)/usr/include

ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
QT5BASE_DEPENDENCIES   += libgles libegl
QT5BASE_INCDIR_OPENGL_ES2 =
QT5BASE_LIBDIR_OPENGL_ES2 =
QT5BASE_LIBS_OPENGL_ES2   =
QT5BASE_INCDIR_EGL =
QT5BASE_LIBDIR_EGL =
QT5BASE_LIBS_EGL =
QT5BASE_INCDIR_OPENVG =
QT5BASE_LIBDIR_OPENVG =
QT5BASE_LIBS_OPENVG =
ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
	$(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
endif
ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_IMX6Q),y)
QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
TARGET_CFLAGS   += -mfloat-abi=softfp -mfpu=neon -DLINUX=1 -DEGL_API_FB=1
# TARGET_CXXFLAGS += -mfloat-abi=softfp -mfpu=neon -DLINUX=1 -DEGL_API_FB=1
# need to add the library paths here too
QT5BASE_INCDIR_OPENGL_ES2 += $(STAGING_DIR)/usr/include
QT5BASE_LIBDIR_OPENGL_ES2 += $(STAGING_DIR)/usr/lib
QT5BASE_LIBS_OPENGL_ES2   += -lGLESv2 -lEGL-fb -lGAL-fb
QT5BASE_INCDIR_EGL        += $(STAGING_DIR)/usr/include
QT5BASE_LIBDIR_EGL        += $(STAGING_DIR)/usr/lib
QT5BASE_LIBS_EGL          += -lEGL-fb
QT5BASE_INCDIR_OPENVG     += $(STAGING_DIR)/usr/include
QT5BASE_LIBDIR_OPENVG     += $(STAGING_DIR)/usr/lib
QT5BASE_LIBS_OPENVG       += -lOpenVG -lEGL-fb -lGAL-fb
# QT5BASE_ADDITIONAL_INCLUDE_PATHS += $(STAGING_DIR)/usr/include/directfb

endif
else
QT5BASE_CONFIGURE_OPTS += -no-opengl -no-eglfs
endif

QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)

QT5BASE_CONFIGURE_OPTS += $(if
$(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GIF),,-no-gif)
QT5BASE_CONFIGURE_OPTS += $(if
$(BR2_PACKAGE_QT5BASE_JPEG),-system-libjpeg,-no-libjpeg)
QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_JPEG),jpeg)
QT5BASE_CONFIGURE_OPTS += $(if
$(BR2_PACKAGE_QT5BASE_PNG),-system-libpng,-no-libpng)
QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)

QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DBUS),-dbus,-no-dbus)
QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DBUS),dbus)

QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)

QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_ICU),-icu,-no-icu)
QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)

# Build the list of libraries to be installed on the target
QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT) += Qt5Concurrent
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml

QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport

QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus

# Ideally, we could use -device-option to substitute variable values
# in our linux-buildroot-g++/qmake.config, but this mechanism doesn't
# nicely support variable values that contain spaces. So we use the
# good old sed solution here.
define QT5BASE_CONFIG_SET
	$(SED) 's%^$(1).*%$(1) = $(2)%g'
$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
endef

define QT5BASE_CONFIGURE_CMDS
	$(call QT5BASE_CONFIG_SET,BUILDROOT_CROSS_COMPILE,$(TARGET_CROSS))
	$(call QT5BASE_CONFIG_SET,BUILDROOT_COMPILER_CFLAGS,$(TARGET_CFLAGS))
	$(call QT5BASE_CONFIG_SET,BUILDROOT_COMPILER_CXXFLAGS,$(TARGET_CXXFLAGS))
	$(call
QT5BASE_CONFIG_SET,BUILDROOT_INCLUDE_PATH,$(QT5BASE_ADDITIONAL_INCLUDE_PATHS))
	$(call
QT5BASE_CONFIG_SET,BUILDROOT_INCDIR_OPENGL_ES2,$(QT5BASE_INCDIR_OPENGL_ES2))
	$(call
QT5BASE_CONFIG_SET,BUILDROOT_LIBDIR_OPENGL_ES2,$(QT5BASE_LIBDIR_OPENGL_ES2))
	$(call
QT5BASE_CONFIG_SET,BUILDROOT_LIBS_OPENGL_ES2,$(QT5BASE_LIBS_OPENGL_ES2))
	$(call QT5BASE_CONFIG_SET,BUILDROOT_INCDIR_EGL,$(QT5BASE_INCDIR_EGL))
	$(call QT5BASE_CONFIG_SET,BUILDROOT_LIBDIR_EGL,$(QT5BASE_LIBDIR_EGL))
	$(call QT5BASE_CONFIG_SET,BUILDROOT_LIBS_EGL,$(QT5BASE_LIBS_EGL))
	$(call QT5BASE_CONFIG_SET,BUILDROOT_INCDIR_OPENVG,$(QT5BASE_INCDIR_OPENVG))
	$(call QT5BASE_CONFIG_SET,BUILDROOT_LIBDIR_OPENVG,$(QT5BASE_LIBDIR_OPENVG))
	$(call QT5BASE_CONFIG_SET,BUILDROOT_LIBS_OPENVG,$(QT5BASE_LIBS_OPENVG))
	$(call QT5BASE_CONFIG_SET,EGLFS_PLATFORM_HOOKS_SOURCES, \
		$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES))
	(cd $(@D); \
		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
		./configure \
		-v \
		-prefix /usr \
		-hostprefix $(HOST_DIR)/usr \
		-sysroot $(STAGING_DIR) \
		-plugindir /usr/lib/qt/plugins \
		-no-rpath \
		-nomake examples -nomake demos -nomake tests \
		-device buildroot \
		-no-c++11 \
		$(QT5BASE_CONFIGURE_OPTS) \
	)
endef

define QT5BASE_BUILD_CMDS
	$(MAKE) -C $(@D)
endef

define QT5BASE_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) install
	$(QT5_LA_PRL_FILES_FIXUP)
endef

define QT5BASE_INSTALL_TARGET_LIBS
	for lib in $(QT5BASE_INSTALL_LIBS_y); do \
		cp -dpf $(STAGING_DIR)/usr/lib/lib$${lib}.so.* $(TARGET_DIR)/usr/lib ; \
	done
endef

define QT5BASE_INSTALL_TARGET_PLUGINS
	if [ -d $(STAGING_DIR)/usr/lib/qt/plugins/ ] ; then \
		mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins ; \
		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/*
$(TARGET_DIR)/usr/lib/qt/plugins ; \
	fi
endef

define QT5BASE_INSTALL_TARGET_FONTS
	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
	fi
endef

ifeq ($(BR2_PREFER_STATIC_LIB),y)
define QT5BASE_INSTALL_TARGET_CMDS
	$(QT5BASE_INSTALL_TARGET_FONTS)
endef
else
define QT5BASE_INSTALL_TARGET_CMDS
	$(QT5BASE_INSTALL_TARGET_LIBS)
	$(QT5BASE_INSTALL_TARGET_PLUGINS)
	$(QT5BASE_INSTALL_TARGET_FONTS)
endef
endif

$(eval $(generic-package))
=================================
