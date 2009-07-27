From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 15:07:15 +0200
Subject: [Buildroot] [PATCH 1/4] qt: rename qtopia4 to qt
In-Reply-To: <cover.1248700034.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248700034.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20d2c70fbda47a6a2eb571da33a9526a0b8c7a1b.1248700034.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A while ago, Trolltech (now part of Nokia) included Qtopia directly
inside Qt. So let's rename the qtopia4 package to simply qt, which
will be more familiar to our users. Of course, the version we compile
is Qt for Embedded Linux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    2 +-
 package/qt/Config.gfx.in                           |   19 +
 package/qt/Config.in                               |  343 ++++++++++++
 package/qt/Config.mouse.in                         |   24 +
 package/qt/Config.sql.in                           |   42 ++
 package/qt/qt-4.5.2-fix-qt-zlib-build.patch        |   20 +
 package/qt/qt.mk                                   |  582 ++++++++++++++++++++
 package/qtopia4/Config.gfx.in                      |   19 -
 package/qtopia4/Config.in                          |  343 ------------
 package/qtopia4/Config.mouse.in                    |   24 -
 package/qtopia4/Config.sql.in                      |   42 --
 .../qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch   |   20 -
 package/qtopia4/qtopia4.mk                         |  582 --------------------
 13 files changed, 1031 insertions(+), 1031 deletions(-)
 create mode 100644 package/qt/Config.gfx.in
 create mode 100644 package/qt/Config.in
 create mode 100644 package/qt/Config.mouse.in
 create mode 100644 package/qt/Config.sql.in
 create mode 100644 package/qt/qt-4.5.2-fix-qt-zlib-build.patch
 create mode 100644 package/qt/qt.mk
 delete mode 100644 package/qtopia4/Config.gfx.in
 delete mode 100644 package/qtopia4/Config.in
 delete mode 100644 package/qtopia4/Config.mouse.in
 delete mode 100644 package/qtopia4/Config.sql.in
 delete mode 100644 package/qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch
 delete mode 100644 package/qtopia4/qtopia4.mk

diff --git a/package/Config.in b/package/Config.in
index 4a943a8..c887323 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -315,7 +315,7 @@ source "package/fbv/Config.in"
 source "package/fbset/Config.in"
 
 comment "other GUIs"
-source "package/qtopia4/Config.in"
+source "package/qt/Config.in"
 
 #source "package/microwin/Config.in"
 
diff --git a/package/qt/Config.gfx.in b/package/qt/Config.gfx.in
new file mode 100644
index 0000000..0e222dd
--- /dev/null
+++ b/package/qt/Config.gfx.in
@@ -0,0 +1,19 @@
+menu "Graphics drivers"
+
+config BR2_PACKAGE_QT_GFX_LINUXFB
+	bool "Linux Framebuffer"
+	default y
+
+config BR2_PACKAGE_QT_GFX_TRANSFORMED
+	bool "Transformed"
+
+config BR2_PACKAGE_QT_GFX_QVFB
+	bool "Qt Virtual Framebuffer"
+
+config BR2_PACKAGE_QT_GFX_VNC
+	bool "VNC"
+
+config BR2_PACKAGE_QT_GFX_MULTISCREEN
+	bool "multiscreen"
+
+endmenu
diff --git a/package/qt/Config.in b/package/qt/Config.in
new file mode 100644
index 0000000..d68c923
--- /dev/null
+++ b/package/qt/Config.in
@@ -0,0 +1,343 @@
+config BR2_PACKAGE_QT
+	bool "Qt"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Qt for Embedded Linux.
+
+	  http://www.qtsoftware.com/products/platform/qt-for-embedded-linux
+
+comment "qt requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+if BR2_PACKAGE_QT
+
+config BR2_PACKAGE_QT_DEBUG
+	bool "Compile with debug support"
+	help
+	  If unsure, say N.
+
+choice
+	prompt "Library type"
+	default BR2_PACKAGE_QT_SHARED
+	help
+	  Selects the library type: Shared or Static
+
+config BR2_PACKAGE_QT_SHARED
+	bool "Shared library"
+	help
+	  Create and use shared Qt libraries.
+	  If you have multiple programs that depend on Qt or intend to use
+	  plugins, say Y.
+
+config BR2_PACKAGE_QT_STATIC
+	bool "Static Library"
+	help
+	  Create and use static Qt libraries.
+	  If you don't have multiple programs on the target that depends on
+	  Qt, then this will save you quite some of storage space.
+	  If unsure, say Y.
+
+endchoice
+
+config BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL
+	bool "Use commercial license"
+
+config BR2_PACKAGE_QT_LICENSE_APPROVED
+	bool "Approve free license"
+	depends on !BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL
+	help
+	  Select this if you approve one of the available free licenses for the
+	  Qt4 library.
+	  By doing this you will not be asked while the library is compiled.
+	  Please read and understand the license terms before approving this.
+
+	  LGPL v2.1: http://doc.trolltech.com/4.5/lgpl.html
+	  GPL  v3.0: http://doc.trolltech.com/4.5/gpl.html
+
+config BR2_PACKAGE_QT_COMMERCIAL_USERNAME
+	string "Qt 4 Commercial License Username"
+	depends on BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL
+	help
+	  Commercial users can download their source directly by
+	  providing a username.
+
+config BR2_PACKAGE_QT_COMMERCIAL_PASSWORD
+	string "Qt 4 Commercial License Password"
+	depends on BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL
+	help
+	  Commercial users can download their source directly by
+	  providing a password.
+
+config BR2_PACKAGE_QT_QT3SUPPORT
+	bool "Compatibility with Qt3"
+	help
+	  Turns on support for older Qt3. This will create an additional
+	  library with proxy code and increase the space required on target.
+	  If unsure say n.
+
+config BR2_PACKAGE_QT_GUI_MODULE
+	bool "Gui Module"
+	default y
+	help
+	  Turns on support to Gui applications. If your board don't have
+	  video output, or you don't require Qt GUI, say n.
+
+if BR2_PACKAGE_QT_GUI_MODULE
+menu "Pixel depths"
+comment "Deselecting each option leads to Qt's default (8,16,32)"
+
+config BR2_PACKAGE_QT_PIXEL_DEPTH_ALL
+	bool "All supported depths"
+
+if !BR2_PACKAGE_QT_PIXEL_DEPTH_ALL
+
+config BR2_PACKAGE_QT_PIXEL_DEPTH_1
+	bool "1 bpp, black/white"
+
+config BR2_PACKAGE_QT_PIXEL_DEPTH_4
+	bool "4 bpp, grayscale"
+
+config BR2_PACKAGE_QT_PIXEL_DEPTH_8
+	bool "8 bpp, paletted"
+	default y
+
+config BR2_PACKAGE_QT_PIXEL_DEPTH_12
+	bool "12 bpp, rgb 4-4-4"
+
+config BR2_PACKAGE_QT_PIXEL_DEPTH_15
+	bool "15 bpp, rgb 5-5-5"
+
+config BR2_PACKAGE_QT_PIXEL_DEPTH_16
+	bool "16 bpp, rgb 5-6-5"
+	default y
+
+config BR2_PACKAGE_QT_PIXEL_DEPTH_18
+	bool "18 bpp, rgb 6-6-6"
+
+config BR2_PACKAGE_QT_PIXEL_DEPTH_24
+	bool "24 bpp, rgb 8-8-8"
+
+config BR2_PACKAGE_QT_PIXEL_DEPTH_32
+	bool "32 bpp, argb 8-8-8-8 and rgb 8-8-8"
+	default y
+
+endif
+endmenu
+endif
+
+config BR2_PACKAGE_QT_GIF
+	bool "Enable GIF support"
+	depends on BR2_PACKAGE_QT_GUI_MODULE
+	help
+	  This compiles and installs the plugin for GIF reading support.
+
+config BR2_PACKAGE_QT_LIBMNG
+	bool "Enable libmng support"
+	depends on BR2_PACKAGE_QT_GUI_MODULE
+	help
+	  This compiles and installs the plugin for MNG support.
+
+choice
+	prompt "JPEG support"
+	depends on BR2_PACKAGE_QT_GUI_MODULE
+	default BR2_PACKAGE_QT_NOJPEG
+	help
+	  Select libjpeg support.
+
+config BR2_PACKAGE_QT_NOJPEG
+	bool "No jpeg support"
+	help
+	  Disable JPEG support
+
+config BR2_PACKAGE_QT_SYSTEMJPEG
+	select BR2_PACKAGE_JPEG
+	bool "System libjpeg"
+	help
+	  Link against system libjpeg
+
+config BR2_PACKAGE_QT_QTJPEG
+	bool "Use Qt bundled libjpeg"
+	help
+	  Link against libjpeg proveded with Qt
+endchoice
+
+choice
+	prompt "PNG support"
+	depends on BR2_PACKAGE_QT_GUI_MODULE
+	default BR2_PACKAGE_QT_NOPNG
+	help
+	  Select which library to use if PNG support should be enabled.
+
+config BR2_PACKAGE_QT_NOPNG
+	bool "No PNG support"
+
+config BR2_PACKAGE_QT_SYSTEMPNG
+	bool "System libpng"
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_QT_QTPNG
+	bool "Use Qt bundled libpng"
+endchoice
+
+choice
+	prompt "TIFF support"
+	depends on BR2_PACKAGE_QT_GUI_MODULE
+	default BR2_PACKAGE_QT_NOTIFF
+	help
+	  Select which library to use if TIFF support should be enabled.
+
+config BR2_PACKAGE_QT_NOTIFF
+	bool "No TIFF support"
+
+config BR2_PACKAGE_QT_SYSTEMTIFF
+	bool "System libtiff"
+	select BR2_PACKAGE_TIFF
+
+config BR2_PACKAGE_QT_QTTIFF
+	bool "Use Qt bundled libtiff"
+endchoice
+
+choice
+	prompt "zlib support"
+	default BR2_PACKAGE_QT_QTZLIB
+	help
+	  Select zlib support.
+
+config BR2_PACKAGE_QT_QTZLIB
+	bool "Qt zlib"
+	help
+	  Use the zlib bundled with Qt.
+
+config BR2_PACKAGE_QT_SYSTEMZLIB
+	bool "System zlib"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Use the shared zlib from the system.
+endchoice
+
+choice
+	prompt "freetype2 support"
+	depends on BR2_PACKAGE_QT_GUI_MODULE
+	default BR2_PACKAGE_QT_NOFREETYPE
+	help
+	  Select freetype2 support.
+
+config BR2_PACKAGE_QT_NOFREETYPE
+	bool "no freetype2 support"
+	help
+	  Do not compile in Freetype2 support.
+
+
+config BR2_PACKAGE_QT_QTFREETYPE
+	bool "Qt freetype2"
+	help
+	  Use the libfreetype bundled with Qt.
+
+config BR2_PACKAGE_QT_SYSTEMFREETYPE
+	bool "System freetype2"
+	select BR2_PACKAGE_FREETYPE
+	help
+	  Use shared libfreetype from the target system.
+	  See http://www.freetype.org/
+endchoice
+
+config BR2_PACKAGE_QT_EMB_PLATFORM
+	string "The embedded platform we are making Qt for"
+	default "arm"	if BR2_arm
+	default "arm"	if BR2_armeb
+	default "avr32"	if BR2_avr32
+	default "x86"	if BR2_i386
+	default "x86_64"	if BR2_x86_64
+	default "mips"	if BR2_mips
+	default "mips"	if BR2_mipsel
+	default "ppc"	if BR2_powerpc
+# Not that I really believe these will work..
+	default "generic"	if BR2_alpha
+	default "generic"	if BR2_chris
+	default "generic"	if BR2_m68k
+	default "generic"	if BR2_nios2
+	default "generic"	if BR2_sh
+	default "generic"	if BR2_sh64
+	default "generic"	if BR2_sparc
+	help
+	  The target platform.
+
+source "package/qt/Config.sql.in"
+if BR2_PACKAGE_QT_GUI_MODULE
+source "package/qt/Config.gfx.in"
+source "package/qt/Config.mouse.in"
+endif
+
+config BR2_PACKAGE_QT_PHONON
+	bool "Phonon Module"
+	select BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	help
+	  Build the Phonon module. Support for different audio/video
+	  formats can be configured at the GStreamer package.
+	  If unsure, say n.
+
+config BR2_PACKAGE_QT_XML
+	bool "XML Module"
+	default y
+	help
+	  Build the XML module.
+
+config BR2_PACKAGE_QT_XMLPATTERNS
+	bool "XML Patterns Module"
+	depends on BR2_PACKAGE_QT_XML
+	help
+	  Build QtXmlPatterns module.
+	  If unsure, say n
+
+config BR2_PACKAGE_QT_SVG
+	bool "SVG Module"
+	help
+	  Build the SVG module.
+	  If unsure, say n
+
+config BR2_PACKAGE_QT_NETWORK
+	bool "Network Module"
+	default y
+	help
+	  Install the Network module.
+	  if unsure, say y
+
+config BR2_PACKAGE_QT_WEBKIT
+	bool "WebKit Module"
+	depends on BR2_PACKAGE_QT_NETWORK
+	help
+	  Build the WebKit module.
+	  If unsure, say n.
+
+config BR2_PACKAGE_QT_STL
+	bool "STL support"
+	help
+	  Compile STL support.
+	  If unsure, say n.
+
+config BR2_PACKAGE_QT_OPENSSL
+	bool "Enable OpenSSL support"
+	depends on BR2_PACKAGE_QT_NETWORK
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable support for the OpenSSL encryption library. If you use
+	  QSslSocket say y here, otherwise, say no to save space on the
+	  target.
+	  If unsure, say n.
+
+config BR2_PACKAGE_QT_SCRIPT
+	bool "Script Module"
+	default y
+	help
+	  Build the Qt Script module.
+	  if unsure, say y.
+
+config BR2_PACKAGE_QT_SCRIPTTOOLS
+	bool "Script Tools Module"
+	depends on BR2_PACKAGE_QT_SCRIPT
+	help
+	  Build the Qt Script Tools module.
+	  if unsure, say n.
+
+endif # BR2_PACKAGE_QT
diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
new file mode 100644
index 0000000..7085974
--- /dev/null
+++ b/package/qt/Config.mouse.in
@@ -0,0 +1,24 @@
+menu "Mouse drivers"
+
+config BR2_PACKAGE_QT_MOUSE_PC
+	bool "pc"
+
+config BR2_PACKAGE_QT_MOUSE_BUS
+	bool "bus"
+
+config BR2_PACKAGE_QT_MOUSE_LINUXTP
+	bool "linuxtp"
+
+config BR2_PACKAGE_QT_MOUSE_YOPY
+	bool "yopy"
+
+config BR2_PACKAGE_QT_MOUSE_VR41XX
+	bool "vr41xx"
+
+config BR2_PACKAGE_QT_MOUSE_TSLIB
+	bool "tslib"
+
+config BR2_PACKAGE_QT_MOUSE_QVFB
+	bool "qvfb"
+
+endmenu
diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
new file mode 100644
index 0000000..2ce8d79
--- /dev/null
+++ b/package/qt/Config.sql.in
@@ -0,0 +1,42 @@
+menuconfig BR2_PACKAGE_QT_SQL_MODULE
+	bool "SQL Module"
+	help
+	  Compile Qt SQL Module
+
+if BR2_PACKAGE_QT_SQL_MODULE
+config BR2_PACKAGE_QT_MYSQL
+	bool "MySQL Driver"
+	help
+	  Build MySQL driver
+	  If unsure, say n.
+
+config BR2_PACKAGE_QT_IBASE
+	bool "iBase Driver"
+	help
+	  Build iBase driver
+	  If unsure, say n.
+
+config BR2_PACKAGE_QT_ODBC
+	bool "ODBC Driver"
+	help
+	  Build ODBC driver
+	  If unsure, say n.
+
+config BR2_PACKAGE_QT_PSQL
+	bool "PostgreSQL Driver"
+	help
+	  Build PostgreSQL driver
+	  If unsure, say n.
+
+config BR2_PACKAGE_QT_SQLITE
+	bool "SQLite 3 Driver"
+	help
+	  Build SQLite driver
+	  If unsure, say n.
+
+config BR2_PACKAGE_QT_SQLITE2
+	bool "SQLite 2 Driver"
+	help
+	  Build SQLite 2 driver
+	  If unsure, say n.
+endif
diff --git a/package/qt/qt-4.5.2-fix-qt-zlib-build.patch b/package/qt/qt-4.5.2-fix-qt-zlib-build.patch
new file mode 100644
index 0000000..b191cc7
--- /dev/null
+++ b/package/qt/qt-4.5.2-fix-qt-zlib-build.patch
@@ -0,0 +1,20 @@
+When QT is compiled in qt-zlib mode, compilation of
+src/gui/painting/qprintengine_pdf.cpp fails because zlib.h is not
+found. The following patch adds the internal QT zlib directory to the
+include path to fix this issue.
+
+---
+ src/gui/painting/painting.pri |    3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: qt-embedded-linux-opensource-src-4.5.2/src/gui/painting/painting.pri
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.2.orig/src/gui/painting/painting.pri
++++ qt-embedded-linux-opensource-src-4.5.2/src/gui/painting/painting.pri
+@@ -367,3 +367,6 @@
+         SOURCES += painting/qwindowsurface_d3d.cpp
+ }
+ 
++contains(QT_CONFIG, zlib) {
++   INCLUDEPATH += ../3rdparty/zlib
++}
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
new file mode 100644
index 0000000..e07457e
--- /dev/null
+++ b/package/qt/qt.mk
@@ -0,0 +1,582 @@
+######################################################################
+#
+# Qt Embedded for Linux 4.5
+# http://www.qtsoftware.com/
+#
+# This makefile was originally composed by Thomas Lundquist <thomasez@zelow.no>
+# Later heavily modified by buildroot developers
+#
+# BTW, this uses alot of FPU calls and it's pretty slow if you use
+# the kernels FPU emulation so it's better to choose soft float in the
+# buildroot config (and uClibc.config of course, if you have your own.)
+#
+######################################################################
+
+# BUG: In "OpenSuSE 10.2", dbus.h is at dbus-1.0/dbus/dbus.h
+# instead of at "dbus/dbus.h"
+# (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
+# to fix
+
+# BUG: There is a workaround below (search for x86x86fix) for
+# x86 crosscompiling under linux x86. Please remove it when the workaround
+# is no longer necessary.
+
+QT_VERSION:=4.5.2
+QT_CAT:=$(BZCAT)
+
+BR2_PACKAGE_QT_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QT_COMMERCIAL_USERNAME)))
+#"))
+BR2_PACKAGE_QT_COMMERCIAL_PASSWORD:=$(strip $(subst ",, $(BR2_PACKAGE_QT_COMMERCIAL_PASSWORD)))
+#"))
+
+QT_CONFIGURE:=#empty
+
+# What to download, free or commercial version.
+ifneq ($(BR2_PACKAGE_QT_COMMERCIAL_USERNAME),)
+QT_SITE:=http://$(BR2_PACKAGE_QT_COMMERCIAL_USERNAME):$(BR2_QT_COMMERCIAL_PASSWORD)@dist.trolltech.com/$(BR2_PACKAGE_QT_COMMERCIAL_USERNAME)
+QT_SOURCE:=qt-embedded-linux-commercial-src-$(QT_VERSION).tar.bz2
+QT_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QT_VERSION)
+QT_CONFIGURE+= -commercial
+else # Good, good, we are free:
+QT_SITE=http://get.qtsoftware.com/qt/source
+QT_SOURCE:=qt-embedded-linux-opensource-src-$(QT_VERSION).tar.bz2
+QT_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QT_VERSION)
+QT_CONFIGURE+= -opensource
+ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
+QT_CONFIGURE+= -confirm-license
+endif
+endif
+
+# If you want extra tweaking you can copy
+# $(QT_TARGET_DIR)/src/corelib/global/qconfig-myfile.h
+# to the qt packages directory (where this .mk file is) and
+# remove the comment.
+# QT_QCONFIG_COMMAND:=-qconfig myfile
+#
+# For the options you can set in this file, look at
+# $(QT_TARGET_DIR)/src/corelib/global/qfeatures.txt
+#
+QT_QCONFIG_FILE:=package/qt/qconfig-myfile.h
+QT_QCONFIG_FILE_LOCATION:=/src/corelib/global/
+
+ifeq ($(BR2_LARGEFILE),y)
+QT_CONFIGURE+= -largefile
+else
+QT_CONFIGURE+= -no-largefile
+endif
+
+ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
+QT_CONFIGURE+= -qt3support
+else
+QT_CONFIGURE+= -no-qt3support
+endif
+
+
+### Pixel depths
+ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_ALL),y)
+QT_PIXEL_DEPTHS = all
+else
+ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_1),y)
+QT_PIXEL_DEPTHS += 1
+endif
+ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_4),y)
+QT_PIXEL_DEPTHS += 4
+endif
+ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_8),y)
+QT_PIXEL_DEPTHS += 8
+endif
+ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_12),y)
+QT_PIXEL_DEPTHS += 12
+endif
+ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_15),y)
+QT_PIXEL_DEPTHS += 15
+endif
+ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_16),y)
+QT_PIXEL_DEPTHS += 16
+endif
+ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_18),y)
+QT_PIXEL_DEPTHS += 18
+endif
+ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_24),y)
+QT_PIXEL_DEPTHS += 24
+endif
+ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_32),y)
+QT_PIXEL_DEPTHS += 32
+endif
+endif
+ifneq ($(QT_PIXEL_DEPTHS),)
+QT_CONFIGURE += -depths $(subst $(space),$(comma),$(strip $(QT_PIXEL_DEPTHS)))
+endif
+
+### Display drivers
+ifeq ($(BR2_PACKAGE_QT_GFX_LINUXFB),y)
+QT_CONFIGURE += -qt-gfx-linuxfb
+else
+QT_CONFIGURE += -no-gfx-linuxfb
+endif
+ifeq ($(BR2_PACKAGE_QT_GFX_TRANSFORMED),y)
+QT_CONFIGURE += -qt-gfx-transformed
+else
+QT_CONFIGURE += -no-gfx-transformed
+endif
+ifeq ($(BR2_PACKAGE_QT_GFX_QVFB),y)
+QT_CONFIGURE += -qt-gfx-qvfb
+else
+QT_CONFIGURE += -no-gfx-qvfb
+endif
+ifeq ($(BR2_PACKAGE_QT_GFX_VNC),y)
+QT_CONFIGURE += -qt-gfx-vnc
+else
+QT_CONFIGURE += -no-gfx-vnc
+endif
+ifeq ($(BR2_PACKAGE_QT_GFX_MULTISCREEN),y)
+QT_CONFIGURE += -qt-gfx-multiscreen
+else
+QT_CONFIGURE += -no-gfx-multiscreen
+endif
+
+### Mouse drivers
+ifeq ($(BR2_PACKAGE_QT_MOUSE_PC),y)
+QT_CONFIGURE += -qt-mouse-pc
+else
+QT_CONFIGURE += -no-mouse-pc
+endif
+ifeq ($(BR2_PACKAGE_QT_MOUSE_BUS),y)
+QT_CONFIGURE += -qt-mouse-bus
+else
+QT_CONFIGURE += -no-mouse-bus
+endif
+ifeq ($(BR2_PACKAGE_QT_MOUSE_LINUXTP),y)
+QT_CONFIGURE += -qt-mouse-linuxtp
+else
+QT_CONFIGURE += -no-mouse-linuxtp
+endif
+ifeq ($(BR2_PACKAGE_QT_MOUSE_YOPY),y)
+QT_CONFIGURE += -qt-mouse-yopy
+else
+QT_CONFIGURE += -no-mouse-yopy
+endif
+ifeq ($(BR2_PACKAGE_QT_MOUSE_VR41XX),y)
+QT_CONFIGURE += -qt-mouse-vr41xx
+else
+QT_CONFIGURE += -no-mouse-vr41xx
+endif
+ifeq ($(BR2_PACKAGE_QT_MOUSE_TSLIB),y)
+QT_CONFIGURE += -qt-mouse-tslib
+QT_DEP_LIBS+=tslib
+QT_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
+QT_TSLIB_DEB:=$(strip $(subst ",, $(QT_TSLIB_DEB)))
+#"))
+else
+QT_CONFIGURE += -no-mouse-tslib
+endif
+ifeq ($(BR2_PACKAGE_QT_MOUSE_QVFB),y)
+QT_CONFIGURE += -qt-mouse-qvfb
+else
+QT_CONFIGURE += -no-mouse-qvfb
+endif
+
+ifeq ($(BR2_PACKAGE_QT_DEBUG),y)
+QT_CONFIGURE+= "-debug $(QT_TSLIB_DEB)"
+else
+QT_CONFIGURE+= -release
+endif
+
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+QT_CONFIGURE+= -shared
+else
+QT_CONFIGURE+= -static
+endif
+
+ifeq ($(BR2_ENDIAN),"LITTLE")
+QT_CONFIGURE+= -little-endian
+else
+QT_CONFIGURE+= -big-endian
+endif
+
+ifeq ($(BR2_PACKAGE_QT_GIF),y)
+QT_CONFIGURE+= -qt-gif
+else
+QT_CONFIGURE+= -no-gif
+endif
+
+ifeq ($(BR2_PACKAGE_QT_LIBMNG),y)
+QT_CONFIGURE+= -qt-libmng
+else
+QT_CONFIGURE+= -no-libmng
+endif
+
+ifeq ($(BR2_PACKAGE_QT_QTZLIB),y)
+QT_CONFIGURE+= -qt-zlib
+else
+ifeq ($(BR2_PACKAGE_QT_SYSTEMZLIB),y)
+QT_CONFIGURE+= -system-zlib
+QT_DEP_LIBS+=zlib
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QT_QTJPEG),y)
+QT_CONFIGURE+= -qt-libjpeg
+else
+ifeq ($(BR2_PACKAGE_QT_SYSTEMJPEG),y)
+QT_CONFIGURE+= -system-libjpeg
+QT_DEP_LIBS+=jpeg
+else
+QT_CONFIGURE+= -no-libjpeg
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QT_QTPNG),y)
+QT_CONFIGURE+= -qt-libpng
+else
+ifeq ($(BR2_PACKAGE_QT_SYSTEMPNG),y)
+QT_CONFIGURE+= -system-libpng
+QT_DEP_LIBS+=libpng
+else
+QT_CONFIGURE+= -no-libpng
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QT_QTTIFF),y)
+QT_CONFIGURE+= -qt-libtiff
+else
+ifeq ($(BR2_PACKAGE_QT_SYSTEMTIFF),y)
+QT_CONFIGURE+= -system-libtiff
+QT_DEP_LIBS+=tiff
+else
+QT_CONFIGURE+= -no-libtiff
+endif
+endif
+
+
+ifeq ($(BR2_PACKAGE_QT_QTFREETYPE),y)
+QT_CONFIGURE+= -qt-freetype
+else
+ifeq ($(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
+QT_CONFIGURE+= -system-freetype
+QT_CONFIGURE+= -I $(STAGING_DIR)/usr/include/freetype2/
+QT_DEP_LIBS+=freetype
+else
+QT_CONFIGURE+= -no-freetype
+endif
+endif
+
+
+ifeq ($(BR2_PACKAGE_QT_OPENSSL),y)
+QT_CONFIGURE+= -openssl
+QT_DEP_LIBS+=openssl
+else
+QT_CONFIGURE+= -no-openssl
+endif
+
+# Qt SQL Drivers
+ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
+ifeq ($(BR2_PACKAGE_QT_IBASE),y)
+QT_CONFIGURE+= -qt-sql-ibase
+endif
+ifeq ($(BR2_PACKAGE_QT_MYSQL),y)
+QT_CONFIGURE+= -qt-sql-mysql
+endif
+ifeq ($(BR2_PACKAGE_QT_ODBC),y)
+QT_CONFIGURE+= -qt-sql-odbc
+endif
+ifeq ($(BR2_PACKAGE_QT_PSQL),y)
+QT_CONFIGURE+= -qt-sql-psql
+endif
+ifeq ($(BR2_PACKAGE_QT_SQLITE),y)
+QT_CONFIGURE+= -qt-sql-sqlite
+else
+QT_CONFIGURE+= -no-sql-sqlite
+endif
+ifeq ($(BR2_PACKAGE_QT_SQLITE2),y)
+QT_CONFIGURE+= -qt-sql-sqlite2
+endif
+else
+# By default, no SQL driver is turned on by configure.
+# but it seams sqlite isn't disabled despite what says
+# configure --help
+QT_CONFIGURE+= -no-sql-sqlite
+endif
+
+ifeq ($(BR2_PACKAGE_QT_XMLPATTERNS),y)
+QT_CONFIGURE+= -xmlpatterns -exceptions
+else
+QT_CONFIGURE+= -no-xmlpatterns
+endif
+
+ifeq ($(BR2_PACKAGE_QT_PHONON),y)
+QT_CONFIGURE+= -phonon
+QT_DEP_LIBS+=gstreamer gst-plugins-base
+else
+QT_CONFIGURE+= -no-phonon
+endif
+
+ifeq ($(BR2_PACKAGE_QT_SVG),y)
+QT_CONFIGURE+= -svg
+else
+QT_CONFIGURE+= -no-svg
+endif
+
+ifeq ($(BR2_PACKAGE_QT_WEBKIT),y)
+QT_CONFIGURE+= -webkit
+else
+QT_CONFIGURE+= -no-webkit
+endif
+
+ifeq ($(BR2_PACKAGE_QT_STL),y)
+QT_CONFIGURE+= -stl
+else
+QT_CONFIGURE+= -no-stl
+endif
+
+QT_CONFIGURE:=$(strip $(subst ",, $(QT_CONFIGURE)))
+#"))
+BR2_PACKAGE_QT_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QT_EMB_PLATFORM)))
+#"))
+
+# x86x86fix
+# Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
+# host. It's unclear if this would happen on other hosts.
+ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
+ifeq ($(BR2_PACKAGE_QT_EMB_PLATFORM),x86)
+QT_CONFIGURE+= -platform linux-g++
+QT_CONFIGURE:=$(strip $(subst ",, $(QT_CONFIGURE)))
+#"))
+endif
+endif
+# End of workaround.
+
+# Figure out what libs to install in the target
+QT_LIBS=#empty
+ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
+QT_LIBS+= qt-gui  
+endif
+ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
+QT_LIBS+= qt-sql
+endif
+ifeq ($(BR2_PACKAGE_QT_PHONON),y)
+QT_LIBS+= qt-phonon
+endif
+ifeq ($(BR2_PACKAGE_QT_SVG),y)
+QT_LIBS+= qt-svg
+endif
+ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
+QT_LIBS+= qt-network
+endif
+ifeq ($(BR2_PACKAGE_QT_WEBKIT),y)
+QT_LIBS+= qt-webkit
+endif
+ifeq ($(BR2_PACKAGE_QT_XML),y)
+QT_LIBS+= qt-xml
+endif
+ifeq ($(BR2_PACKAGE_QT_XMLPATTERNS),y)
+QT_LIBS+= qt-xmlpatterns
+endif
+ifeq ($(BR2_PACKAGE_QT_SCRIPT),y)
+QT_LIBS+= qt-script
+endif
+ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
+QT_LIBS+= qt-scripttools
+endif
+
+QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++/qmake.conf
+
+QT_QMAKE_AR:=$(TARGET_AR) cqs
+
+# Variable for other Qt applications to use
+QT_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++
+
+################################################################################
+# QT_QMAKE_SET -- helper macro to set QMAKE_<variable> = <value> in
+# QT_QMAKE_CONF. Will remove existing variable declaration if available.
+#
+# Argument 1 is the variable name (without QMAKE_)
+# Argument 2 is the value to set variable to
+#
+# E.G. use like this:
+# $(call QT_QMAKE_SET,variable,value)
+################################################################################
+define QT_QMAKE_SET
+	$(SED) '/QMAKE_$(1)/d' $(QT_QMAKE_CONF)
+	$(SED) '/include.*qws.conf/aQMAKE_$(1) = $(2)' $(QT_QMAKE_CONF)
+endef
+
+################################################################################
+# QT_INSTALL_PLUGINS -- helper macro to install Qt plugins to target and 
+# strip them
+#
+# Argument 1 is the plugin folder
+# 
+# E.G. use like this to install plugins/sqldrivers:
+# $(call QT_INSTALL_PLUGINS,sqldrivers)
+# ################################################################################
+define QT_INSTALL_PLUGINS
+        if [ -d $(STAGING_DIR)/usr/plugins/$(1) ]; then \
+                mkdir -p $(TARGET_DIR)/usr/plugins; \
+                cp -dpfr $(STAGING_DIR)/usr/plugins/$(1) $(TARGET_DIR)/usr/plugins/; \
+                $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/$(1)/*; \
+        fi
+endef
+
+$(DL_DIR)/$(QT_SOURCE):
+	$(call DOWNLOAD,$(QT_SITE),$(QT_SOURCE))
+
+qt-source: $(DL_DIR)/$(QT_SOURCE)
+
+
+$(QT_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QT_SOURCE)
+	$(QT_CAT) $(DL_DIR)/$(QT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(QT_TARGET_DIR) package/qt/ \
+		qt-$(QT_VERSION)-\*.patch \
+		qt-$(QT_VERSION)-\*.patch.$(ARCH)
+	touch $@
+
+$(QT_TARGET_DIR)/.configured: $(QT_TARGET_DIR)/.unpacked
+ifneq ($(BR2_INET_IPV6),y)
+	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QT_TARGET_DIR)/configure
+	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QT_TARGET_DIR)/configure
+endif
+	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QT_TARGET_DIR)/configure
+	# Fix compiler path
+	$(call QT_QMAKE_SET,CC,$(TARGET_CC))
+	$(call QT_QMAKE_SET,CXX,$(TARGET_CXX))
+	$(call QT_QMAKE_SET,LINK,$(TARGET_CXX))
+	$(call QT_QMAKE_SET,LINK_SHLIB,$(TARGET_CXX))
+	$(call QT_QMAKE_SET,AR,$(QT_QMAKE_AR))
+	$(call QT_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY))
+	$(call QT_QMAKE_SET,RANLIB,$(TARGET_RANLIB))
+	$(call QT_QMAKE_SET,STRIP,$(TARGET_STRIP))
+	$(call QT_QMAKE_SET,CFLAGS,$(TARGET_CFLAGS))
+	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_CXXFLAGS))
+	-[ -f $(QT_QCONFIG_FILE) ] && cp $(QT_QCONFIG_FILE) \
+		$(QT_TARGET_DIR)/$(QT_QCONFIG_FILE_LOCATION)
+# Qt doesn't use PKG_CONFIG, it searches for pkg-config with 'which'.
+# PKG_CONFIG_SYSROOT is only used to avoid a warning from Qt's configure system
+# when cross compiling, Qt 4.4.3 is wrong here.
+# Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
+# instead of the host then.
+	(cd $(QT_TARGET_DIR); rm -rf config.cache; \
+		PATH=$(TARGET_PATH) \
+		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
+		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
+		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
+		./configure \
+		$(if $(VERBOSE),-verbose,-silent) \
+		-force-pkg-config \
+		-embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \
+		$(QT_QCONFIG_COMMAND) \
+		$(QT_CONFIGURE) \
+		-no-cups \
+		-no-nis \
+		-no-accessibility \
+		-no-separate-debug-info \
+		-prefix /usr \
+		-hostprefix $(STAGING_DIR)/usr \
+		-fast \
+		-no-rpath \
+		-nomake examples \
+		-nomake demos \
+	)
+	touch $@
+
+$(QT_TARGET_DIR)/.compiled: $(QT_TARGET_DIR)/.configured
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QT_TARGET_DIR)
+	touch $@
+
+$(STAGING_DIR)/usr/lib/libQtCore.la: $(QT_TARGET_DIR)/.compiled
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QT_TARGET_DIR) install
+
+qt-gui: $(STAGING_DIR)/usr/lib/libQtCore.la
+	mkdir -p $(TARGET_DIR)/usr/lib/fonts
+	touch $(TARGET_DIR)/usr/lib/fonts/fontdir
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
+	# Install image plugins if they are built
+	$(call QT_INSTALL_PLUGINS,imageformats)
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtGui.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+qt-sql: $(STAGING_DIR)/usr/lib/libQtCore.la
+	$(call QT_INSTALL_PLUGINS,sqldrivers)
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtSql.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+qt-phonon: $(STAGING_DIR)/usr/lib/libQtCore.la
+	$(call QT_INSTALL_PLUGINS,phonon_backend)
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libphonon.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+qt-svg: $(STAGING_DIR)/usr/lib/libQtCore.la
+	$(call QT_INSTALL_PLUGINS,iconengines)
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtSvg.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+qt-network: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtNetwork.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+qt-webkit: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtWebKit.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+qt-xml: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtXml.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+qt-xmlpatterns: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtXmlPatterns.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+qt-script: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtScript.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+qt-scripttools: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtScriptTools.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+
+$(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la $(QT_LIBS)
+	# Strip all installed libs
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtCore.so.* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
+endif
+
+qt: uclibc $(QT_DEP_LIBS) $(TARGET_DIR)/usr/lib/libQtCore.so.4
+
+qt-clean:
+	-$(MAKE) -C $(QT_TARGET_DIR) clean
+	-rm -rf $(TARGET_DIR)/usr/lib/fonts
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	-rm $(TARGET_DIR)/usr/lib/libQt*.so.*
+	-rm $(TARGET_DIR)/usr/lib/libphonon.so.*
+endif
+
+qt-dirclean:
+	rm -rf $(QT_TARGET_DIR)
+
+qt-status:
+	@echo "QT_QMAKE:               " $(QT_QMAKE)
+	@echo "QT_DEP_LIBS:            " $(QT_DEP_LIBS)
+	@echo "FREETYPE_DIR:		    " $(FREETYPE_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_QT),y)
+TARGETS+=qt
+endif
diff --git a/package/qtopia4/Config.gfx.in b/package/qtopia4/Config.gfx.in
deleted file mode 100644
index 8147886..0000000
--- a/package/qtopia4/Config.gfx.in
+++ /dev/null
@@ -1,19 +0,0 @@
-menu "Graphics drivers"
-
-config BR2_PACKAGE_QTOPIA4_GFX_LINUXFB
-	bool "Linux Framebuffer"
-	default y
-
-config BR2_PACKAGE_QTOPIA4_GFX_TRANSFORMED
-	bool "Transformed"
-
-config BR2_PACKAGE_QTOPIA4_GFX_QVFB
-	bool "Qt Virtual Framebuffer"
-
-config BR2_PACKAGE_QTOPIA4_GFX_VNC
-	bool "VNC"
-
-config BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN
-	bool "multiscreen"
-
-endmenu
diff --git a/package/qtopia4/Config.in b/package/qtopia4/Config.in
deleted file mode 100644
index 457b939..0000000
--- a/package/qtopia4/Config.in
+++ /dev/null
@@ -1,343 +0,0 @@
-config BR2_PACKAGE_QTOPIA4
-	bool "qtopia4"
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  Qtopia core 4.
-
-	  http://www.trolltech.com/
-
-comment "qtopia4 requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-if BR2_PACKAGE_QTOPIA4
-
-config BR2_PACKAGE_QTOPIA4_DEBUG
-	bool "Compile with debug support"
-	help
-	  If unsure, say N.
-
-choice
-	prompt "Library type"
-	default BR2_PACKAGE_QTOPIA4_SHARED
-	help
-	  Selects the library type: Shared or Static
-
-config BR2_PACKAGE_QTOPIA4_SHARED
-	bool "Shared library"
-	help
-	  Create and use shared Qt libraries.
-	  If you have multiple programs that depend on Qt or intend to use
-	  plugins, say Y.
-
-config BR2_PACKAGE_QTOPIA4_STATIC
-	bool "Static Library"
-	help
-	  Create and use static Qt libraries.
-	  If you don't have multiple programs on the target that depends on
-	  Qt, then this will save you quite some of storage space.
-	  If unsure, say Y.
-
-endchoice
-
-config BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
-	bool "Use commercial license"
-
-config BR2_PACKAGE_QTOPIA4_LICENSE_APPROVED
-	bool "Approve free license"
-	depends on !BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
-	help
-	  Select this if you approve one of the available free licenses for the
-	  Qt4 library.
-	  By doing this you will not be asked while the library is compiled.
-	  Please read and understand the license terms before approving this.
-
-	  LGPL v2.1: http://doc.trolltech.com/4.5/lgpl.html
-	  GPL  v3.0: http://doc.trolltech.com/4.5/gpl.html
-
-config BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME
-	string "Qtopia Core 4 Commercial License Username"
-	depends on BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
-	help
-	  Commercial users can download their source directly by
-	  providing a username.
-
-config BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD
-	string "Qtopia Core 4 Commercial License Password"
-	depends on BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
-	help
-	  Commercial users can download their source directly by
-	  providing a password.
-
-config BR2_PACKAGE_QTOPIA4_QT3SUPPORT
-	bool "Compatibility with Qt3"
-	help
-	  Turns on support for older Qt3. This will create an additional
-	  library with proxy code and increase the space required on target.
-	  If unsure say n.
-
-config BR2_PACKAGE_QTOPIA4_GUI_MODULE
-	bool "Gui Module"
-	default y
-	help
-	  Turns on support to Gui applications. If your board don't have
-	  video output, or you don't require Qt GUI, say n.
-
-if BR2_PACKAGE_QTOPIA4_GUI_MODULE
-menu "Pixel depths"
-comment "Deselecting each option leads to Qt's default (8,16,32)"
-
-config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_ALL
-	bool "All supported depths"
-
-if !BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_ALL
-
-config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_1
-	bool "1 bpp, black/white"
-
-config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_4
-	bool "4 bpp, grayscale"
-
-config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_8
-	bool "8 bpp, paletted"
-	default y
-
-config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_12
-	bool "12 bpp, rgb 4-4-4"
-
-config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_15
-	bool "15 bpp, rgb 5-5-5"
-
-config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_16
-	bool "16 bpp, rgb 5-6-5"
-	default y
-
-config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_18
-	bool "18 bpp, rgb 6-6-6"
-
-config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_24
-	bool "24 bpp, rgb 8-8-8"
-
-config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_32
-	bool "32 bpp, argb 8-8-8-8 and rgb 8-8-8"
-	default y
-
-endif
-endmenu
-endif
-
-config BR2_PACKAGE_QTOPIA4_GIF
-	bool "Enable GIF support"
-	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
-	help
-	  This compiles and installs the plugin for GIF reading support.
-
-config BR2_PACKAGE_QTOPIA4_LIBMNG
-	bool "Enable libmng support"
-	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
-	help
-	  This compiles and installs the plugin for MNG support.
-
-choice
-	prompt "JPEG support"
-	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
-	default BR2_PACKAGE_QTOPIA4_NOJPEG
-	help
-	  Select libjpeg support.
-
-config BR2_PACKAGE_QTOPIA4_NOJPEG
-	bool "No jpeg support"
-	help
-	  Disable JPEG support
-
-config BR2_PACKAGE_QTOPIA4_SYSTEMJPEG
-	select BR2_PACKAGE_JPEG
-	bool "System libjpeg"
-	help
-	  Link against system libjpeg
-
-config BR2_PACKAGE_QTOPIA4_QTJPEG
-	bool "Use Qt bundled libjpeg"
-	help
-	  Link against libjpeg proveded with Qt
-endchoice
-
-choice
-	prompt "PNG support"
-	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
-	default BR2_PACKAGE_QTOPIA4_NOPNG
-	help
-	  Select which library to use if PNG support should be enabled.
-
-config BR2_PACKAGE_QTOPIA4_NOPNG
-	bool "No PNG support"
-
-config BR2_PACKAGE_QTOPIA4_SYSTEMPNG
-	bool "System libpng"
-	select BR2_PACKAGE_LIBPNG
-
-config BR2_PACKAGE_QTOPIA4_QTPNG
-	bool "Use Qt bundled libpng"
-endchoice
-
-choice
-	prompt "TIFF support"
-	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
-	default BR2_PACKAGE_QTOPIA4_NOTIFF
-	help
-	  Select which library to use if TIFF support should be enabled.
-
-config BR2_PACKAGE_QTOPIA4_NOTIFF
-	bool "No TIFF support"
-
-config BR2_PACKAGE_QTOPIA4_SYSTEMTIFF
-	bool "System libtiff"
-	select BR2_PACKAGE_TIFF
-
-config BR2_PACKAGE_QTOPIA4_QTTIFF
-	bool "Use Qt bundled libtiff"
-endchoice
-
-choice
-	prompt "zlib support"
-	default BR2_PACKAGE_QTOPIA4_QTZLIB
-	help
-	  Select zlib support.
-
-config BR2_PACKAGE_QTOPIA4_QTZLIB
-	bool "Qt zlib"
-	help
-	  Use the zlib bundled with Qt.
-
-config BR2_PACKAGE_QTOPIA4_SYSTEMZLIB
-	bool "System zlib"
-	select BR2_PACKAGE_ZLIB
-	help
-	  Use the shared zlib from the system.
-endchoice
-
-choice
-	prompt "freetype2 support"
-	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
-	default BR2_PACKAGE_QTOPIA4_NOFREETYPE
-	help
-	  Select freetype2 support.
-
-config BR2_PACKAGE_QTOPIA4_NOFREETYPE
-	bool "no freetype2 support"
-	help
-	  Do not compile in Freetype2 support.
-
-
-config BR2_PACKAGE_QTOPIA4_QTFREETYPE
-	bool "Qt freetype2"
-	help
-	  Use the libfreetype bundled with Qt.
-
-config BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE
-	bool "System freetype2"
-	select BR2_PACKAGE_FREETYPE
-	help
-	  Use shared libfreetype from the target system.
-	  See http://www.freetype.org/
-endchoice
-
-config BR2_PACKAGE_QTOPIA4_EMB_PLATFORM
-	string "The embedded platform we are making Qtopia4 for"
-	default "arm"	if BR2_arm
-	default "arm"	if BR2_armeb
-	default "avr32"	if BR2_avr32
-	default "x86"	if BR2_i386
-	default "x86_64"	if BR2_x86_64
-	default "mips"	if BR2_mips
-	default "mips"	if BR2_mipsel
-	default "ppc"	if BR2_powerpc
-# Not that I really believe these will work..
-	default "generic"	if BR2_alpha
-	default "generic"	if BR2_chris
-	default "generic"	if BR2_m68k
-	default "generic"	if BR2_nios2
-	default "generic"	if BR2_sh
-	default "generic"	if BR2_sh64
-	default "generic"	if BR2_sparc
-	help
-	  The target platform.
-
-source "package/qtopia4/Config.sql.in"
-if BR2_PACKAGE_QTOPIA4_GUI_MODULE
-source "package/qtopia4/Config.gfx.in"
-source "package/qtopia4/Config.mouse.in"
-endif
-
-config BR2_PACKAGE_QTOPIA4_PHONON
-	bool "Phonon Module"
-	select BR2_PACKAGE_GSTREAMER
-	select BR2_PACKAGE_GST_PLUGINS_BASE
-	help
-	  Build the Phonon module. Support for different audio/video
-	  formats can be configured at the GStreamer package.
-	  If unsure, say n.
-
-config BR2_PACKAGE_QTOPIA4_XML
-	bool "XML Module"
-	default y
-	help
-	  Build the XML module.
-
-config BR2_PACKAGE_QTOPIA4_XMLPATTERNS
-	bool "XML Patterns Module"
-	depends on BR2_PACKAGE_QTOPIA4_XML
-	help
-	  Build QtXmlPatterns module.
-	  If unsure, say n
-
-config BR2_PACKAGE_QTOPIA4_SVG
-	bool "SVG Module"
-	help
-	  Build the SVG module.
-	  If unsure, say n
-
-config BR2_PACKAGE_QTOPIA4_NETWORK
-	bool "Network Module"
-	default y
-	help
-	  Install the Network module.
-	  if unsure, say y
-
-config BR2_PACKAGE_QTOPIA4_WEBKIT
-	bool "WebKit Module"
-	depends on BR2_PACKAGE_QTOPIA4_NETWORK
-	help
-	  Build the WebKit module.
-	  If unsure, say n.
-
-config BR2_PACKAGE_QTOPIA4_STL
-	bool "STL support"
-	help
-	  Compile STL support.
-	  If unsure, say n.
-
-config BR2_PACKAGE_QTOPIA4_OPENSSL
-	bool "Enable OpenSSL support"
-	depends on BR2_PACKAGE_QTOPIA4_NETWORK
-	select BR2_PACKAGE_OPENSSL
-	help
-	  Enable support for the OpenSSL encryption library. If you use
-	  QSslSocket say y here, otherwise, say no to save space on the
-	  target.
-	  If unsure, say n.
-
-config BR2_PACKAGE_QTOPIA4_SCRIPT
-	bool "Script Module"
-	default y
-	help
-	  Build the Qt Script module.
-	  if unsure, say y.
-
-config BR2_PACKAGE_QTOPIA4_SCRIPTTOOLS
-	bool "Script Tools Module"
-	depends on BR2_PACKAGE_QTOPIA4_SCRIPT
-	help
-	  Build the Qt Script Tools module.
-	  if unsure, say n.
-
-endif # BR2_PACKAGE_QTOPIA4
diff --git a/package/qtopia4/Config.mouse.in b/package/qtopia4/Config.mouse.in
deleted file mode 100644
index 7b39460..0000000
--- a/package/qtopia4/Config.mouse.in
+++ /dev/null
@@ -1,24 +0,0 @@
-menu "Mouse drivers"
-
-config BR2_PACKAGE_QTOPIA4_MOUSE_PC
-	bool "pc"
-
-config BR2_PACKAGE_QTOPIA4_MOUSE_BUS
-	bool "bus"
-
-config BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP
-	bool "linuxtp"
-
-config BR2_PACKAGE_QTOPIA4_MOUSE_YOPY
-	bool "yopy"
-
-config BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX
-	bool "vr41xx"
-
-config BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB
-	bool "tslib"
-
-config BR2_PACKAGE_QTOPIA4_MOUSE_QVFB
-	bool "qvfb"
-
-endmenu
diff --git a/package/qtopia4/Config.sql.in b/package/qtopia4/Config.sql.in
deleted file mode 100644
index 4c5f405..0000000
--- a/package/qtopia4/Config.sql.in
+++ /dev/null
@@ -1,42 +0,0 @@
-menuconfig BR2_PACKAGE_QTOPIA4_SQL_MODULE
-	bool "SQL Module"
-	help
-	  Compile Qtopia SQL Module
-
-if BR2_PACKAGE_QTOPIA4_SQL_MODULE
-config BR2_PACKAGE_QTOPIA4_MYSQL
-	bool "MySQL Driver"
-	help
-	  Build MySQL driver
-	  If unsure, say n.
-
-config BR2_PACKAGE_QTOPIA4_IBASE
-	bool "iBase Driver"
-	help
-	  Build iBase driver
-	  If unsure, say n.
-
-config BR2_PACKAGE_QTOPIA4_ODBC
-	bool "ODBC Driver"
-	help
-	  Build ODBC driver
-	  If unsure, say n.
-
-config BR2_PACKAGE_QTOPIA4_PSQL
-	bool "PostgreSQL Driver"
-	help
-	  Build PostgreSQL driver
-	  If unsure, say n.
-
-config BR2_PACKAGE_QTOPIA4_SQLITE
-	bool "SQLite 3 Driver"
-	help
-	  Build SQLite driver
-	  If unsure, say n.
-
-config BR2_PACKAGE_QTOPIA4_SQLITE2
-	bool "SQLite 2 Driver"
-	help
-	  Build SQLite 2 driver
-	  If unsure, say n.
-endif
diff --git a/package/qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch b/package/qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch
deleted file mode 100644
index b191cc7..0000000
--- a/package/qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-When QT is compiled in qt-zlib mode, compilation of
-src/gui/painting/qprintengine_pdf.cpp fails because zlib.h is not
-found. The following patch adds the internal QT zlib directory to the
-include path to fix this issue.
-
----
- src/gui/painting/painting.pri |    3 +++
- 1 file changed, 3 insertions(+)
-
-Index: qt-embedded-linux-opensource-src-4.5.2/src/gui/painting/painting.pri
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.2.orig/src/gui/painting/painting.pri
-+++ qt-embedded-linux-opensource-src-4.5.2/src/gui/painting/painting.pri
-@@ -367,3 +367,6 @@
-         SOURCES += painting/qwindowsurface_d3d.cpp
- }
- 
-+contains(QT_CONFIG, zlib) {
-+   INCLUDEPATH += ../3rdparty/zlib
-+}
diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
deleted file mode 100644
index 0d2b980..0000000
--- a/package/qtopia4/qtopia4.mk
+++ /dev/null
@@ -1,582 +0,0 @@
-######################################################################
-#
-# qtopia4 (Qt Embedded for Linux 4.5)
-# http://www.qtsoftware.com/
-#
-# This makefile was originally composed by Thomas Lundquist <thomasez@zelow.no>
-# Later heavily modified by buildroot developers
-#
-# BTW, this uses alot of FPU calls and it's pretty slow if you use
-# the kernels FPU emulation so it's better to choose soft float in the
-# buildroot config (and uClibc.config of course, if you have your own.)
-#
-######################################################################
-
-# BUG: In "OpenSuSE 10.2", dbus.h is at dbus-1.0/dbus/dbus.h
-# instead of at "dbus/dbus.h"
-# (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
-# to fix
-
-# BUG: There is a workaround below (search for x86x86fix) for
-# x86 crosscompiling under linux x86. Please remove it when the workaround
-# is no longer necessary.
-
-QTOPIA4_VERSION:=4.5.2
-QTOPIA4_CAT:=$(BZCAT)
-
-BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
-#"))
-BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD)))
-#"))
-
-QTOPIA4_CONFIGURE:=#empty
-
-# What to download, free or commercial version.
-ifneq ($(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME),)
-QTOPIA4_SITE:=http://$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME):$(BR2_QTOPIA4_COMMERCIAL_PASSWORD)@dist.trolltech.com/$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)
-QTOPIA4_SOURCE:=qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION).tar.bz2
-QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION)
-QTOPIA4_CONFIGURE+= -commercial
-else # Good, good, we are free:
-QTOPIA4_SITE=http://get.qtsoftware.com/qt/source
-QTOPIA4_SOURCE:=qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION).tar.bz2
-QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION)
-QTOPIA4_CONFIGURE+= -opensource
-ifeq ($(BR2_PACKAGE_QTOPIA4_LICENSE_APPROVED),y)
-QTOPIA4_CONFIGURE+= -confirm-license
-endif
-endif
-
-# If you want extra tweaking you can copy
-# $(QTOPIA4_TARGET_DIR)/src/corelib/global/qconfig-myfile.h
-# to the qtopia4 packages directory (where this .mk file is) and
-# remove the comment.
-# QTOPIA4_QCONFIG_COMMAND:=-qconfig myfile
-#
-# For the options you can set in this file, look at
-# $(QTOPIA4_TARGET_DIR)/src/corelib/global/qfeatures.txt
-#
-QTOPIA4_QCONFIG_FILE:=package/qtopia4/qconfig-myfile.h
-QTOPIA4_QCONFIG_FILE_LOCATION:=/src/corelib/global/
-
-ifeq ($(BR2_LARGEFILE),y)
-QTOPIA4_CONFIGURE+= -largefile
-else
-QTOPIA4_CONFIGURE+= -no-largefile
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_QT3SUPPORT),y)
-QTOPIA4_CONFIGURE+= -qt3support
-else
-QTOPIA4_CONFIGURE+= -no-qt3support
-endif
-
-
-### Pixel depths
-ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_ALL),y)
-QTOPIA4_PIXEL_DEPTHS = all
-else
-ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_1),y)
-QTOPIA4_PIXEL_DEPTHS += 1
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_4),y)
-QTOPIA4_PIXEL_DEPTHS += 4
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_8),y)
-QTOPIA4_PIXEL_DEPTHS += 8
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_12),y)
-QTOPIA4_PIXEL_DEPTHS += 12
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_15),y)
-QTOPIA4_PIXEL_DEPTHS += 15
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_16),y)
-QTOPIA4_PIXEL_DEPTHS += 16
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_18),y)
-QTOPIA4_PIXEL_DEPTHS += 18
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_24),y)
-QTOPIA4_PIXEL_DEPTHS += 24
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_32),y)
-QTOPIA4_PIXEL_DEPTHS += 32
-endif
-endif
-ifneq ($(QTOPIA4_PIXEL_DEPTHS),)
-QTOPIA4_CONFIGURE += -depths $(subst $(space),$(comma),$(strip $(QTOPIA4_PIXEL_DEPTHS)))
-endif
-
-### Display drivers
-ifeq ($(BR2_PACKAGE_QTOPIA4_GFX_LINUXFB),y)
-QTOPIA4_CONFIGURE += -qt-gfx-linuxfb
-else
-QTOPIA4_CONFIGURE += -no-gfx-linuxfb
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_GFX_TRANSFORMED),y)
-QTOPIA4_CONFIGURE += -qt-gfx-transformed
-else
-QTOPIA4_CONFIGURE += -no-gfx-transformed
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_GFX_QVFB),y)
-QTOPIA4_CONFIGURE += -qt-gfx-qvfb
-else
-QTOPIA4_CONFIGURE += -no-gfx-qvfb
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_GFX_VNC),y)
-QTOPIA4_CONFIGURE += -qt-gfx-vnc
-else
-QTOPIA4_CONFIGURE += -no-gfx-vnc
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN),y)
-QTOPIA4_CONFIGURE += -qt-gfx-multiscreen
-else
-QTOPIA4_CONFIGURE += -no-gfx-multiscreen
-endif
-
-### Mouse drivers
-ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_PC),y)
-QTOPIA4_CONFIGURE += -qt-mouse-pc
-else
-QTOPIA4_CONFIGURE += -no-mouse-pc
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_BUS),y)
-QTOPIA4_CONFIGURE += -qt-mouse-bus
-else
-QTOPIA4_CONFIGURE += -no-mouse-bus
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP),y)
-QTOPIA4_CONFIGURE += -qt-mouse-linuxtp
-else
-QTOPIA4_CONFIGURE += -no-mouse-linuxtp
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_YOPY),y)
-QTOPIA4_CONFIGURE += -qt-mouse-yopy
-else
-QTOPIA4_CONFIGURE += -no-mouse-yopy
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX),y)
-QTOPIA4_CONFIGURE += -qt-mouse-vr41xx
-else
-QTOPIA4_CONFIGURE += -no-mouse-vr41xx
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB),y)
-QTOPIA4_CONFIGURE += -qt-mouse-tslib
-QTOPIA4_DEP_LIBS+=tslib
-QTOPIA4_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
-QTOPIA4_TSLIB_DEB:=$(strip $(subst ",, $(QTOPIA4_TSLIB_DEB)))
-#"))
-else
-QTOPIA4_CONFIGURE += -no-mouse-tslib
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_QVFB),y)
-QTOPIA4_CONFIGURE += -qt-mouse-qvfb
-else
-QTOPIA4_CONFIGURE += -no-mouse-qvfb
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_DEBUG),y)
-QTOPIA4_CONFIGURE+= "-debug $(QTOPIA4_TSLIB_DEB)"
-else
-QTOPIA4_CONFIGURE+= -release
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-QTOPIA4_CONFIGURE+= -shared
-else
-QTOPIA4_CONFIGURE+= -static
-endif
-
-ifeq ($(BR2_ENDIAN),"LITTLE")
-QTOPIA4_CONFIGURE+= -little-endian
-else
-QTOPIA4_CONFIGURE+= -big-endian
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_GIF),y)
-QTOPIA4_CONFIGURE+= -qt-gif
-else
-QTOPIA4_CONFIGURE+= -no-gif
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_LIBMNG),y)
-QTOPIA4_CONFIGURE+= -qt-libmng
-else
-QTOPIA4_CONFIGURE+= -no-libmng
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_QTZLIB),y)
-QTOPIA4_CONFIGURE+= -qt-zlib
-else
-ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMZLIB),y)
-QTOPIA4_CONFIGURE+= -system-zlib
-QTOPIA4_DEP_LIBS+=zlib
-endif
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_QTJPEG),y)
-QTOPIA4_CONFIGURE+= -qt-libjpeg
-else
-ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMJPEG),y)
-QTOPIA4_CONFIGURE+= -system-libjpeg
-QTOPIA4_DEP_LIBS+=jpeg
-else
-QTOPIA4_CONFIGURE+= -no-libjpeg
-endif
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_QTPNG),y)
-QTOPIA4_CONFIGURE+= -qt-libpng
-else
-ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMPNG),y)
-QTOPIA4_CONFIGURE+= -system-libpng
-QTOPIA4_DEP_LIBS+=libpng
-else
-QTOPIA4_CONFIGURE+= -no-libpng
-endif
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_QTTIFF),y)
-QTOPIA4_CONFIGURE+= -qt-libtiff
-else
-ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMTIFF),y)
-QTOPIA4_CONFIGURE+= -system-libtiff
-QTOPIA4_DEP_LIBS+=tiff
-else
-QTOPIA4_CONFIGURE+= -no-libtiff
-endif
-endif
-
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_QTFREETYPE),y)
-QTOPIA4_CONFIGURE+= -qt-freetype
-else
-ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE),y)
-QTOPIA4_CONFIGURE+= -system-freetype
-QTOPIA4_CONFIGURE+= -I $(STAGING_DIR)/usr/include/freetype2/
-QTOPIA4_DEP_LIBS+=freetype
-else
-QTOPIA4_CONFIGURE+= -no-freetype
-endif
-endif
-
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_OPENSSL),y)
-QTOPIA4_CONFIGURE+= -openssl
-QTOPIA4_DEP_LIBS+=openssl
-else
-QTOPIA4_CONFIGURE+= -no-openssl
-endif
-
-# Qt SQL Drivers
-ifeq ($(BR2_PACKAGE_QTOPIA4_SQL_MODULE),y)
-ifeq ($(BR2_PACKAGE_QTOPIA4_IBASE),y)
-QTOPIA4_CONFIGURE+= -qt-sql-ibase
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_MYSQL),y)
-QTOPIA4_CONFIGURE+= -qt-sql-mysql
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_ODBC),y)
-QTOPIA4_CONFIGURE+= -qt-sql-odbc
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_PSQL),y)
-QTOPIA4_CONFIGURE+= -qt-sql-psql
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_SQLITE),y)
-QTOPIA4_CONFIGURE+= -qt-sql-sqlite
-else
-QTOPIA4_CONFIGURE+= -no-sql-sqlite
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_SQLITE2),y)
-QTOPIA4_CONFIGURE+= -qt-sql-sqlite2
-endif
-else
-# By default, no SQL driver is turned on by configure.
-# but it seams sqlite isn't disabled despite what says
-# configure --help
-QTOPIA4_CONFIGURE+= -no-sql-sqlite
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_XMLPATTERNS),y)
-QTOPIA4_CONFIGURE+= -xmlpatterns -exceptions
-else
-QTOPIA4_CONFIGURE+= -no-xmlpatterns
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_PHONON),y)
-QTOPIA4_CONFIGURE+= -phonon
-QTOPIA4_DEP_LIBS+=gstreamer gst-plugins-base
-else
-QTOPIA4_CONFIGURE+= -no-phonon
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_SVG),y)
-QTOPIA4_CONFIGURE+= -svg
-else
-QTOPIA4_CONFIGURE+= -no-svg
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_WEBKIT),y)
-QTOPIA4_CONFIGURE+= -webkit
-else
-QTOPIA4_CONFIGURE+= -no-webkit
-endif
-
-ifeq ($(BR2_PACKAGE_QTOPIA4_STL),y)
-QTOPIA4_CONFIGURE+= -stl
-else
-QTOPIA4_CONFIGURE+= -no-stl
-endif
-
-QTOPIA4_CONFIGURE:=$(strip $(subst ",, $(QTOPIA4_CONFIGURE)))
-#"))
-BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
-#"))
-
-# x86x86fix
-# Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
-# host. It's unclear if this would happen on other hosts.
-ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
-ifeq ($(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM),x86)
-QTOPIA4_CONFIGURE+= -platform linux-g++
-QTOPIA4_CONFIGURE:=$(strip $(subst ",, $(QTOPIA4_CONFIGURE)))
-#"))
-endif
-endif
-# End of workaround.
-
-# Figure out what libs to install in the target
-QTOPIA4_LIBS=#empty
-ifeq ($(BR2_PACKAGE_QTOPIA4_GUI_MODULE),y)
-QTOPIA4_LIBS+= qtopia4-gui  
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_SQL_MODULE),y)
-QTOPIA4_LIBS+= qtopia4-sql
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_PHONON),y)
-QTOPIA4_LIBS+= qtopia4-phonon
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_SVG),y)
-QTOPIA4_LIBS+= qtopia4-svg
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_NETWORK),y)
-QTOPIA4_LIBS+= qtopia4-network
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_WEBKIT),y)
-QTOPIA4_LIBS+= qtopia4-webkit
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_XML),y)
-QTOPIA4_LIBS+= qtopia4-xml
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_XMLPATTERNS),y)
-QTOPIA4_LIBS+= qtopia4-xmlpatterns
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_SCRIPT),y)
-QTOPIA4_LIBS+= qtopia4-script
-endif
-ifeq ($(BR2_PACKAGE_QTOPIA4_SCRIPTTOOLS),y)
-QTOPIA4_LIBS+= qtopia4-scripttools
-endif
-
-QTOPIA4_QMAKE_CONF:=$(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-
-QTOPIA4_QMAKE_AR:=$(TARGET_AR) cqs
-
-# Variable for other Qt applications to use
-QTOPIA4_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++
-
-################################################################################
-# QTOPIA4_QMAKE_SET -- helper macro to set QMAKE_<variable> = <value> in
-# QTOPIA_QMAKE_CONF. Will remove existing variable declaration if available.
-#
-# Argument 1 is the variable name (without QMAKE_)
-# Argument 2 is the value to set variable to
-#
-# E.G. use like this:
-# $(call QTOPIA4_QMAKE_SET,variable,value)
-################################################################################
-define QTOPIA4_QMAKE_SET
-	$(SED) '/QMAKE_$(1)/d' $(QTOPIA4_QMAKE_CONF)
-	$(SED) '/include.*qws.conf/aQMAKE_$(1) = $(2)' $(QTOPIA4_QMAKE_CONF)
-endef
-
-################################################################################
-# QTOPIA4_INSTALL_PLUGINS -- helper macro to install Qt plugins to target and 
-# strip them
-#
-# Argument 1 is the plugin folder
-# 
-# E.G. use like this to install plugins/sqldrivers:
-# $(call QTOPIA4_INSTALL_PLUGINS,sqldrivers)
-# ################################################################################
-define QTOPIA4_INSTALL_PLUGINS
-        if [ -d $(STAGING_DIR)/usr/plugins/$(1) ]; then \
-                mkdir -p $(TARGET_DIR)/usr/plugins; \
-                cp -dpfr $(STAGING_DIR)/usr/plugins/$(1) $(TARGET_DIR)/usr/plugins/; \
-                $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/$(1)/*; \
-        fi
-endef
-
-$(DL_DIR)/$(QTOPIA4_SOURCE):
-	$(call DOWNLOAD,$(QTOPIA4_SITE),$(QTOPIA4_SOURCE))
-
-qtopia4-source: $(DL_DIR)/$(QTOPIA4_SOURCE)
-
-
-$(QTOPIA4_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QTOPIA4_SOURCE)
-	$(QTOPIA4_CAT) $(DL_DIR)/$(QTOPIA4_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(QTOPIA4_TARGET_DIR) package/qtopia4/ \
-		qtopia-$(QTOPIA4_VERSION)-\*.patch \
-		qtopia-$(QTOPIA4_VERSION)-\*.patch.$(ARCH)
-	touch $@
-
-$(QTOPIA4_TARGET_DIR)/.configured: $(QTOPIA4_TARGET_DIR)/.unpacked
-ifneq ($(BR2_INET_IPV6),y)
-	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QTOPIA4_TARGET_DIR)/configure
-	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
-endif
-	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
-	# Fix compiler path
-	$(call QTOPIA4_QMAKE_SET,CC,$(TARGET_CC))
-	$(call QTOPIA4_QMAKE_SET,CXX,$(TARGET_CXX))
-	$(call QTOPIA4_QMAKE_SET,LINK,$(TARGET_CXX))
-	$(call QTOPIA4_QMAKE_SET,LINK_SHLIB,$(TARGET_CXX))
-	$(call QTOPIA4_QMAKE_SET,AR,$(QTOPIA4_QMAKE_AR))
-	$(call QTOPIA4_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY))
-	$(call QTOPIA4_QMAKE_SET,RANLIB,$(TARGET_RANLIB))
-	$(call QTOPIA4_QMAKE_SET,STRIP,$(TARGET_STRIP))
-	$(call QTOPIA4_QMAKE_SET,CFLAGS,$(TARGET_CFLAGS))
-	$(call QTOPIA4_QMAKE_SET,CXXFLAGS,$(TARGET_CXXFLAGS))
-	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
-		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
-# Qt doesn't use PKG_CONFIG, it searches for pkg-config with 'which'.
-# PKG_CONFIG_SYSROOT is only used to avoid a warning from Qt's configure system
-# when cross compiling, Qt 4.4.3 is wrong here.
-# Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
-# instead of the host then.
-	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
-		PATH=$(TARGET_PATH) \
-		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
-		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
-		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
-		./configure \
-		$(if $(VERBOSE),-verbose,-silent) \
-		-force-pkg-config \
-		-embedded $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM) \
-		$(QTOPIA4_QCONFIG_COMMAND) \
-		$(QTOPIA4_CONFIGURE) \
-		-no-cups \
-		-no-nis \
-		-no-accessibility \
-		-no-separate-debug-info \
-		-prefix /usr \
-		-hostprefix $(STAGING_DIR)/usr \
-		-fast \
-		-no-rpath \
-		-nomake examples \
-		-nomake demos \
-	)
-	touch $@
-
-$(QTOPIA4_TARGET_DIR)/.compiled: $(QTOPIA4_TARGET_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QTOPIA4_TARGET_DIR)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libQtCore.la: $(QTOPIA4_TARGET_DIR)/.compiled
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QTOPIA4_TARGET_DIR) install
-
-qtopia4-gui: $(STAGING_DIR)/usr/lib/libQtCore.la
-	mkdir -p $(TARGET_DIR)/usr/lib/fonts
-	touch $(TARGET_DIR)/usr/lib/fonts/fontdir
-	cp -dpf $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
-	cp -dpf $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
-	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
-	# Install image plugins if they are built
-	$(call QTOPIA4_INSTALL_PLUGINS,imageformats)
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtGui.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qtopia4-sql: $(STAGING_DIR)/usr/lib/libQtCore.la
-	$(call QTOPIA4_INSTALL_PLUGINS,sqldrivers)
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtSql.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qtopia4-phonon: $(STAGING_DIR)/usr/lib/libQtCore.la
-	$(call QTOPIA4_INSTALL_PLUGINS,phonon_backend)
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libphonon.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qtopia4-svg: $(STAGING_DIR)/usr/lib/libQtCore.la
-	$(call QTOPIA4_INSTALL_PLUGINS,iconengines)
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtSvg.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qtopia4-network: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtNetwork.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qtopia4-webkit: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtWebKit.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qtopia4-xml: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtXml.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qtopia4-xmlpatterns: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtXmlPatterns.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qtopia4-script: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtScript.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qtopia4-scripttools: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtScriptTools.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-
-$(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la $(QTOPIA4_LIBS)
-	# Strip all installed libs
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtCore.so.* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
-endif
-
-qtopia4: uclibc $(QTOPIA4_DEP_LIBS) $(TARGET_DIR)/usr/lib/libQtCore.so.4
-
-qtopia4-clean:
-	-$(MAKE) -C $(QTOPIA4_TARGET_DIR) clean
-	-rm -rf $(TARGET_DIR)/usr/lib/fonts
-ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	-rm $(TARGET_DIR)/usr/lib/libQt*.so.*
-	-rm $(TARGET_DIR)/usr/lib/libphonon.so.*
-endif
-
-qtopia4-dirclean:
-	rm -rf $(QTOPIA4_TARGET_DIR)
-
-qtopia4-status:
-	@echo "QTOPIA4_QMAKE:               " $(QTOPIA4_QMAKE)
-	@echo "QTOPIA4_DEP_LIBS:            " $(QTOPIA4_DEP_LIBS)
-	@echo "FREETYPE_DIR:		    " $(FREETYPE_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_QTOPIA4),y)
-TARGETS+=qtopia4
-endif
-- 
1.6.0.4
