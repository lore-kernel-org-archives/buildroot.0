From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2011 15:19:12 +0100
Subject: [Buildroot] [PATCH 1/1] qt: convert to the GENTARGETS infrastructure
In-Reply-To: <cover.1300630739.git.thomas.petazzoni@free-electrons.com>
References: <cover.1300630739.git.thomas.petazzoni@free-electrons.com>
Message-ID: <39ac37ec67acf7886777166a098039bbab39b691.1300630739.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition to converting the qt package to the GENTARGETS
infrastructure, this commit also does the following (related) things
in the Qt package:

 * Create a BR2_PACKAGE_QT_CONFIG_FILE option, which can be used to
   pass a custom Qt configuration file, such as the ones found in
   src/corelib/global/qconfig-*.h. This used to be possible, but
   required changing qt.mk directly, which isn't really how we
   configure things in Buildroot.

 * Remove the BR2_PACKAGE_QT_EMB_PLATFORM option, the embedded
   platform name is now computed directly in qt.mk.

 * The QT_CONFIGURE variable, which hosted all ./configure options,
   has been renamed to QT_CONFIGURE_OPTS, for consistency with what we
   do in the AUTOTARGETS infrastructure.

 * The QT_DEP_LIBS variable has been renamed to QT_DEPENDENCIES, so
   that dependencies are properly handled by the GENTARGETS
   infrastructures.

 * The QT_QMAKE_SET macro (used to adjust the path/flags of the
   compiler/linker) has been extended with an additional argument,
   which allows to pass the source directory of Qt.

 * All the installation procedure has been rewritten to fit within the
   GENTARGETS mechanism.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in |   35 ++--
 package/qt/qt.mk     |  623 +++++++++++++++++++++++---------------------------
 2 files changed, 302 insertions(+), 356 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 3cc04f4..cc65e14 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -55,6 +55,19 @@ config BR2_PACKAGE_QT_LICENSE_APPROVED
 	  LGPL v2.1: http://doc.trolltech.com/4.5/lgpl.html
 	  GPL  v3.0: http://doc.trolltech.com/4.5/gpl.html
 
+config BR2_PACKAGE_QT_CONFIG_FILE
+	string "Config file"
+	help
+	  Configure options allow to set which modules are being
+	  compiled or not in Qt, but Qt also provide a more
+	  fine-grained mechanism to configure which features should be
+	  enabled or disabled, through a header file. Examples of such
+	  header files can be found in src/corelib/global/qconfig-*.h
+	  in the Qt sources.
+
+	  This option allows to set the path of such a configuration
+	  file, which Buildroot will give to Qt at compile time.
+
 config BR2_PACKAGE_QT_QT3SUPPORT
 	bool "Compatibility with Qt3"
 	depends on BR2_PACKAGE_QT_GUI_MODULE
@@ -240,26 +253,6 @@ config BR2_PACKAGE_QT_SYSTEMZLIB
 	  Use the shared zlib from the system.
 endchoice
 
-config BR2_PACKAGE_QT_EMB_PLATFORM
-	string "The embedded platform we are making Qt for"
-	default "arm"	if BR2_arm
-	default "arm"	if BR2_armeb
-	default "avr32"	if BR2_avr32
-	default "x86"	if BR2_i386
-	default "x86_64"	if BR2_x86_64
-	default "mips"	if BR2_mips
-	default "mips"	if BR2_mipsel
-	default "powerpc"	if BR2_powerpc
-# Not that I really believe these will work..
-	default "generic"	if BR2_alpha
-	default "generic"	if BR2_chris
-	default "generic"	if BR2_m68k
-	default "generic"	if BR2_sh
-	default "generic"	if BR2_sh64
-	default "generic"	if BR2_sparc
-	help
-	  The target platform.
-
 source "package/qt/Config.sql.in"
 if BR2_PACKAGE_QT_GUI_MODULE
 source "package/qt/Config.gfx.in"
@@ -286,7 +279,7 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 	  Build the platform Phonon plugin.
 	  If unsure, say n.
 
-comment "Qt DBbus module not available (need dbus)"
+comment "Qt DBus module not available (need dbus)"
 	depends on !BR2_PACKAGE_DBUS
 
 config BR2_PACKAGE_QT_DBUS
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 6974b2f..d72d711 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,51 +12,43 @@
 #
 ######################################################################
 
-QT_VERSION:=4.7.2
-QT_SOURCE:=qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
-QT_SITE:=http://get.qt.nokia.com/qt/source
-QT_CAT:=$(ZCAT)
-QT_TARGET_DIR:=$(BUILD_DIR)/qt-everywhere-opensource-src-$(QT_VERSION)
+QT_VERSION = 4.7.2
+QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
+QT_SITE    = http://get.qt.nokia.com/qt/source
 
-QT_CONFIGURE:=#empty
+QT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
-QT_CONFIGURE += -opensource -confirm-license
+QT_CONFIGURE_OPTS += -opensource -confirm-license
 endif
 
-# If you want extra tweaking you can copy
-# $(QT_TARGET_DIR)/src/corelib/global/qconfig-myfile.h
-# to the qt packages directory (where this .mk file is) and
-# remove the comment.
-# QT_QCONFIG_COMMAND:=-qconfig myfile
-#
-# For the options you can set in this file, look at
-# $(QT_TARGET_DIR)/src/corelib/global/qfeatures.txt
-#
-QT_QCONFIG_FILE:=package/qt/qconfig-myfile.h
-QT_QCONFIG_FILE_LOCATION:=/src/corelib/global/
+QT_CONFIG_FILE=$(call qstrip,$(BR2_PACKAGE_QT_CONFIG_FILE))
+
+ifneq ($(QT_CONFIG_FILE),)
+QT_CONFIGURE_OPTS += -config buildroot
+endif
 
 ifeq ($(BR2_LARGEFILE),y)
-QT_CONFIGURE+= -largefile
+QT_CONFIGURE_OPTS += -largefile
 else
-QT_CONFIGURE+= -no-largefile
+QT_CONFIGURE_OPTS += -no-largefile
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
-QT_CONFIGURE+= -qt3support
+QT_CONFIGURE_OPTS += -qt3support
 else
-QT_CONFIGURE+= -no-qt3support
+QT_CONFIGURE_OPTS += -no-qt3support
 endif
 
 ifeq ($(BR2_PACKAGE_QT_DEMOS),y)
-QT_CONFIGURE+= -examplesdir $(TARGET_DIR)/usr/share/qt/examples -demosdir $(TARGET_DIR)/usr/share/qt/demos
+QT_CONFIGURE_OPTS += -examplesdir $(TARGET_DIR)/usr/share/qt/examples -demosdir $(TARGET_DIR)/usr/share/qt/demos
 else
-QT_CONFIGURE+= -nomake examples -nomake demos
+QT_CONFIGURE_OPTS += -nomake examples -nomake demos
 endif
 
 # ensure glib is built first if enabled for Qt's glib support
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-QT_DEP_LIBS+=libglib2
+QT_DEPENDENCIES += libglib2
 endif
 
 
@@ -90,168 +82,189 @@ ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_32),y)
 QT_PIXEL_DEPTHS += 32
 endif
 ifneq ($(QT_PIXEL_DEPTHS),)
-QT_CONFIGURE += -depths $(subst $(space),$(comma),$(strip $(QT_PIXEL_DEPTHS)))
+QT_CONFIGURE_OPTS += -depths $(subst $(space),$(comma),$(strip $(QT_PIXEL_DEPTHS)))
 endif
 
 ### Display drivers
 ifeq ($(BR2_PACKAGE_QT_GFX_LINUXFB),y)
-QT_CONFIGURE += -qt-gfx-linuxfb
+QT_CONFIGURE_OPTS += -qt-gfx-linuxfb
 else
-QT_CONFIGURE += -no-gfx-linuxfb
+QT_CONFIGURE_OPTS += -no-gfx-linuxfb
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_TRANSFORMED),y)
-QT_CONFIGURE += -qt-gfx-transformed
+QT_CONFIGURE_OPTS += -qt-gfx-transformed
 else
-QT_CONFIGURE += -no-gfx-transformed
+QT_CONFIGURE_OPTS += -no-gfx-transformed
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_QVFB),y)
-QT_CONFIGURE += -qt-gfx-qvfb
+QT_CONFIGURE_OPTS += -qt-gfx-qvfb
 else
-QT_CONFIGURE += -no-gfx-qvfb
+QT_CONFIGURE_OPTS += -no-gfx-qvfb
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_VNC),y)
-QT_CONFIGURE += -qt-gfx-vnc
+QT_CONFIGURE_OPTS += -qt-gfx-vnc
 else
-QT_CONFIGURE += -no-gfx-vnc
+QT_CONFIGURE_OPTS += -no-gfx-vnc
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_MULTISCREEN),y)
-QT_CONFIGURE += -qt-gfx-multiscreen
+QT_CONFIGURE_OPTS += -qt-gfx-multiscreen
 else
-QT_CONFIGURE += -no-gfx-multiscreen
+QT_CONFIGURE_OPTS += -no-gfx-multiscreen
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_DIRECTFB),y)
-QT_CONFIGURE += -qt-gfx-directfb
-QT_DEP_LIBS+=directfb
+QT_CONFIGURE_OPTS += -qt-gfx-directfb
+QT_DEPENDENCIES+=directfb
 else
-QT_CONFIGURE += -no-gfx-directfb
+QT_CONFIGURE_OPTS += -no-gfx-directfb
 endif
 
 
 ### Mouse drivers
 ifeq ($(BR2_PACKAGE_QT_MOUSE_PC),y)
-QT_CONFIGURE += -qt-mouse-pc
+QT_CONFIGURE_OPTS += -qt-mouse-pc
 else
-QT_CONFIGURE += -no-mouse-pc
+QT_CONFIGURE_OPTS += -no-mouse-pc
 endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_LINUXTP),y)
-QT_CONFIGURE += -qt-mouse-linuxtp
+QT_CONFIGURE_OPTS += -qt-mouse-linuxtp
 else
-QT_CONFIGURE += -no-mouse-linuxtp
+QT_CONFIGURE_OPTS += -no-mouse-linuxtp
 endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_LINUXINPUT),y)
-QT_CONFIGURE += -qt-mouse-linuxinput
+QT_CONFIGURE_OPTS += -qt-mouse-linuxinput
 else
-QT_CONFIGURE += -no-mouse-linuxinput
+QT_CONFIGURE_OPTS += -no-mouse-linuxinput
 endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_TSLIB),y)
-QT_CONFIGURE += -qt-mouse-tslib
-QT_DEP_LIBS+=tslib
+QT_CONFIGURE_OPTS += -qt-mouse-tslib
+QT_DEPENDENCIES+=tslib
 else
-QT_CONFIGURE += -no-mouse-tslib
+QT_CONFIGURE_OPTS += -no-mouse-tslib
 endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_QVFB),y)
-QT_CONFIGURE += -qt-mouse-qvfb
+QT_CONFIGURE_OPTS += -qt-mouse-qvfb
 else
-QT_CONFIGURE += -no-mouse-qvfb
+QT_CONFIGURE_OPTS += -no-mouse-qvfb
 endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_NO_QWS_CURSOR),y)
-QT_CONFIGURE+= -D QT_NO_QWS_CURSOR
+QT_CONFIGURE_OPTS += -D QT_NO_QWS_CURSOR
 endif
 
 ### Keyboard drivers
 ifeq ($(BR2_PACKAGE_QT_KEYBOARD_TTY),y)
-QT_CONFIGURE += -qt-kbd-tty
+QT_CONFIGURE_OPTS += -qt-kbd-tty
 else
-QT_CONFIGURE += -no-kbd-tty
+QT_CONFIGURE_OPTS += -no-kbd-tty
 endif
 ifeq ($(BR2_PACKAGE_QT_KEYBOARD_LINUXINPUT),y)
-QT_CONFIGURE += -qt-kbd-linuxinput
+QT_CONFIGURE_OPTS += -qt-kbd-linuxinput
 else
-QT_CONFIGURE += -no-kbd-linuxinput
+QT_CONFIGURE_OPTS += -no-kbd-linuxinput
 endif
 ifeq ($(BR2_PACKAGE_QT_KEYBOARD_QVFB),y)
-QT_CONFIGURE += -qt-kbd-qvfb
+QT_CONFIGURE_OPTS += -qt-kbd-qvfb
 else
-QT_CONFIGURE += -no-kbd-qvfb
+QT_CONFIGURE_OPTS += -no-kbd-qvfb
 endif
 
 ifeq ($(BR2_PACKAGE_QT_DEBUG),y)
-QT_CONFIGURE+= -debug
+QT_CONFIGURE_OPTS += -debug
 else
-QT_CONFIGURE+= -release
+QT_CONFIGURE_OPTS += -release
 endif
 
 ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-QT_CONFIGURE+= -shared
+QT_CONFIGURE_OPTS += -shared
 else
-QT_CONFIGURE+= -static
+QT_CONFIGURE_OPTS += -static
 endif
 
 ifeq ($(BR2_ENDIAN),"LITTLE")
-QT_CONFIGURE+= -little-endian
+QT_CONFIGURE_OPTS += -little-endian
 else
-QT_CONFIGURE+= -big-endian
+QT_CONFIGURE_OPTS += -big-endian
 endif
 
+ifeq ($(BR2_arm),y)
+QT_EMB_PLATFORM = arm
+else ifeq ($(BR2_armeb),y)
+QT_EMB_PLATFORM = arm
+else ifeq ($(BR2_avr32),y)
+QT_EMB_PLATFORM = avr32
+else ifeq ($(BR2_x86),y)
+QT_EMB_PLATFORM = x86
+else ifeq ($(BR2_x86_64),y)
+QT_EMB_PLATFORM = x86_64
+else ifeq ($(BR2_mips),y)
+QT_EMB_PLATFORM = mips
+else ifeq ($(BR2_mipsel),y)
+QT_EMB_PLATFORM = mips
+else ifeq ($(BR2_powerpc),y)
+QT_EMB_PLATFORM = powerpc
+else
+QT_EMB_PLATFORM = generic
+endif
+
+QT_CONFIGURE_OPTS += -embedded $(QT_EMB_PLATFORM)
+
 ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-QT_CONFIGURE+= -no-gui
+QT_CONFIGURE_OPTS += -no-gui
 endif
 
 ifeq ($(BR2_PACKAGE_QT_GIF),y)
-QT_CONFIGURE+= -qt-gif
+QT_CONFIGURE_OPTS += -qt-gif
 else
-QT_CONFIGURE+= -no-gif
+QT_CONFIGURE_OPTS += -no-gif
 endif
 
 ifeq ($(BR2_PACKAGE_QT_LIBMNG),y)
-QT_CONFIGURE+= -qt-libmng
+QT_CONFIGURE_OPTS += -qt-libmng
 else
-QT_CONFIGURE+= -no-libmng
+QT_CONFIGURE_OPTS += -no-libmng
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QTZLIB),y)
-QT_CONFIGURE+= -qt-zlib
+QT_CONFIGURE_OPTS += -qt-zlib
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMZLIB),y)
-QT_CONFIGURE+= -system-zlib
-QT_DEP_LIBS+=zlib
+QT_CONFIGURE_OPTS += -system-zlib
+QT_DEPENDENCIES   += zlib
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QTJPEG),y)
-QT_CONFIGURE+= -qt-libjpeg
+QT_CONFIGURE_OPTS += -qt-libjpeg
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMJPEG),y)
-QT_CONFIGURE+= -system-libjpeg
-QT_DEP_LIBS+=jpeg
+QT_CONFIGURE_OPTS += -system-libjpeg
+QT_DEPENDENCIES   += jpeg
 else
-QT_CONFIGURE+= -no-libjpeg
+QT_CONFIGURE_OPTS += -no-libjpeg
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QTPNG),y)
-QT_CONFIGURE+= -qt-libpng
+QT_CONFIGURE_OPTS += -qt-libpng
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMPNG),y)
-QT_CONFIGURE+= -system-libpng
-QT_DEP_LIBS+=libpng
+QT_CONFIGURE_OPTS += -system-libpng
+QT_DEPENDENCIES   += libpng
 else
-QT_CONFIGURE+= -no-libpng
+QT_CONFIGURE_OPTS += -no-libpng
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QTTIFF),y)
-QT_CONFIGURE+= -qt-libtiff
+QT_CONFIGURE_OPTS += -qt-libtiff
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMTIFF),y)
-QT_CONFIGURE+= -system-libtiff
-QT_DEP_LIBS+=tiff
+QT_CONFIGURE_OPTS += -system-libtiff
+QT_DEPENDENCIES   += tiff
 else
-QT_CONFIGURE+= -no-libtiff
+QT_CONFIGURE_OPTS += -no-libtiff
 endif
 endif
 
-
 QT_FONTS = $(addprefix $(STAGING_DIR)/usr/lib/fonts/, $(addsuffix *.qpf, \
 	   $(if $(BR2_PACKAGE_QT_FONT_MICRO),micro) \
 	   $(if $(BR2_PACKAGE_QT_FONT_FIXED),fixed) \
@@ -259,272 +272,206 @@ QT_FONTS = $(addprefix $(STAGING_DIR)/usr/lib/fonts/, $(addsuffix *.qpf, \
 	   $(if $(BR2_PACKAGE_QT_FONT_JAPANESE),japanese) \
 	   $(if $(BR2_PACKAGE_QT_FONT_UNIFONT),unifont)))
 
-
 ifeq ($(BR2_PACKAGE_QT_QTFREETYPE),y)
-QT_CONFIGURE+= -qt-freetype
+QT_CONFIGURE_OPTS += -qt-freetype
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
-QT_CONFIGURE+= -system-freetype
-QT_CONFIGURE+= -I $(STAGING_DIR)/usr/include/freetype2/
-QT_DEP_LIBS+=freetype
+QT_CONFIGURE_OPTS += -system-freetype
+QT_CONFIGURE_OPTS += -I $(STAGING_DIR)/usr/include/freetype2/
+QT_DEPENDENCIES   += freetype
 else
-QT_CONFIGURE+= -no-freetype
+QT_CONFIGURE_OPTS += -no-freetype
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_QT_DBUS),y)
+QT_DEPENDENCIES   += dbus
+endif
 
 ifeq ($(BR2_PACKAGE_QT_OPENSSL),y)
-QT_CONFIGURE+= -openssl
-QT_DEP_LIBS+=openssl
+QT_CONFIGURE_OPTS += -openssl
+QT_DEPENDENCIES   += openssl
 else
-QT_CONFIGURE+= -no-openssl
+QT_CONFIGURE_OPTS += -no-openssl
 endif
 
 # Qt SQL Drivers
 ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
 ifeq ($(BR2_PACKAGE_QT_IBASE),y)
-QT_CONFIGURE+= -qt-sql-ibase
+QT_CONFIGURE_OPTS += -qt-sql-ibase
 endif
 ifeq ($(BR2_PACKAGE_QT_MYSQL),y)
-QT_CONFIGURE+= -qt-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
-QT_DEP_LIBS+=mysql_client
+QT_CONFIGURE_OPTS += -qt-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
+QT_DEPENDENCIES   += mysql_client
 endif
 ifeq ($(BR2_PACKAGE_QT_ODBC),y)
-QT_CONFIGURE+= -qt-sql-odbc
+QT_CONFIGURE_OPTS += -qt-sql-odbc
 endif
 ifeq ($(BR2_PACKAGE_QT_PSQL),y)
-QT_CONFIGURE+= -qt-sql-psql
+QT_CONFIGURE_OPTS += -qt-sql-psql
 endif
 ifeq ($(BR2_PACKAGE_QT_SQLITE_QT),y)
-QT_CONFIGURE+= -qt-sql-sqlite
+QT_CONFIGURE_OPTS += -qt-sql-sqlite
 else
 ifeq ($(BR2_PACKAGE_QT_SQLITE_SYSTEM),y)
-QT_CONFIGURE+= -system-sqlite
-QT_DEP_LIBS+= sqlite
+QT_CONFIGURE_OPTS += -system-sqlite
+QT_DEPENDENCIES   += sqlite
 else
-QT_CONFIGURE+= -no-sql-sqlite
+QT_CONFIGURE_OPTS += -no-sql-sqlite
 endif
 endif
 ifeq ($(BR2_PACKAGE_QT_SQLITE2),y)
-QT_CONFIGURE+= -qt-sql-sqlite2
+QT_CONFIGURE_OPTS += -qt-sql-sqlite2
 endif
 else
 # By default, no SQL driver is turned on by configure.
-# but it seams sqlite isn't disabled despite what says
+# but it seems sqlite isn't disabled despite what says
 # configure --help
-QT_CONFIGURE+= -no-sql-sqlite
+QT_CONFIGURE_OPTS += -no-sql-sqlite
 endif
 
 ifeq ($(BR2_PACKAGE_QT_XMLPATTERNS),y)
-QT_CONFIGURE+= -xmlpatterns -exceptions
+QT_CONFIGURE_OPTS += -xmlpatterns -exceptions
 else
-QT_CONFIGURE+= -no-xmlpatterns
+QT_CONFIGURE_OPTS += -no-xmlpatterns
 endif
 
 ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
-QT_CONFIGURE+= -multimedia
+QT_CONFIGURE_OPTS += -multimedia
 else
-QT_CONFIGURE+= -no-multimedia
+QT_CONFIGURE_OPTS += -no-multimedia
 endif
 
 ifeq ($(BR2_PACKAGE_QT_AUDIO_BACKEND),y)
-QT_CONFIGURE+= -audio-backend
-QT_DEP_LIBS+=alsa-lib
+QT_CONFIGURE_OPTS += -audio-backend
+QT_DEPENDENCIES   += alsa-lib
 else
-QT_CONFIGURE+= -no-audio-backend
+QT_CONFIGURE_OPTS += -no-audio-backend
 endif
 
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
-QT_CONFIGURE+= -phonon
-QT_DEP_LIBS+=gstreamer gst-plugins-base
+QT_CONFIGURE_OPTS += -phonon
+QT_DEPENDENCIES   += gstreamer gst-plugins-base
 else
-QT_CONFIGURE+= -no-phonon
+QT_CONFIGURE_OPTS += -no-phonon
 endif
 
 ifeq ($(BR2_PACKAGE_QT_PHONON_BACKEND),y)
-QT_CONFIGURE+= -phonon-backend
+QT_CONFIGURE_OPTS += -phonon-backend
 else
-QT_CONFIGURE+= -no-phonon-backend
+QT_CONFIGURE_OPTS += -no-phonon-backend
 endif
 
 ifeq ($(BR2_PACKAGE_QT_SVG),y)
-QT_CONFIGURE+= -svg
+QT_CONFIGURE_OPTS += -svg
 else
-QT_CONFIGURE+= -no-svg
+QT_CONFIGURE_OPTS += -no-svg
 endif
 
 ifeq ($(BR2_PACKAGE_QT_WEBKIT),y)
-QT_CONFIGURE+= -webkit
+QT_CONFIGURE_OPTS += -webkit
 else
-QT_CONFIGURE+= -no-webkit
+QT_CONFIGURE_OPTS += -no-webkit
 endif
 
 ifeq ($(BR2_PACKAGE_QT_SCRIPT),y)
-QT_CONFIGURE+= -script
+QT_CONFIGURE_OPTS += -script
 else
-QT_CONFIGURE+= -no-script
+QT_CONFIGURE_OPTS += -no-script
 endif
 
 ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
-QT_CONFIGURE+= -scripttools
+QT_CONFIGURE_OPTS += -scripttools
 else
-QT_CONFIGURE+= -no-scripttools
+QT_CONFIGURE_OPTS += -no-scripttools
 endif
 
 ifeq ($(BR2_PACKAGE_QT_JAVASCRIPTCORE),y)
-QT_CONFIGURE+= -javascript-jit
+QT_CONFIGURE_OPTS += -javascript-jit
 else
-QT_CONFIGURE+= -no-javascript-jit
+QT_CONFIGURE_OPTS += -no-javascript-jit
 endif
 
 ifeq ($(BR2_PACKAGE_QT_STL),y)
-QT_CONFIGURE+= -stl
+QT_CONFIGURE_OPTS += -stl
 else
-QT_CONFIGURE+= -no-stl
+QT_CONFIGURE_OPTS += -no-stl
 endif
 
 # ccache and precompiled headers don't play well together
 ifeq ($(BR2_CCACHE),y)
-QT_CONFIGURE += -no-pch
+QT_CONFIGURE_OPTS += -no-pch
 endif
 
-BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
-
 # x86x86fix
 # Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
 # host. It's unclear if this would happen on other hosts.
 ifneq ($(findstring linux,$(GNU_HOST_NAME)),)
 ifneq ($(findstring x86,$(BR2_PACKAGE_QT_EMB_PLATFORM)),)
-QT_CONFIGURE+= -platform linux-g++
+QT_CONFIGURE_OPTS += -platform linux-g++
 endif
 endif
 # End of workaround.
 
-# Figure out what libs to install in the target
-QT_LIBS=#empty
-ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-QT_LIBS+= qt-gui  
-endif
-ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
-QT_LIBS+= qt-sql
-endif
-ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
-QT_LIBS+= qt-multimedia
-endif
-ifeq ($(BR2_PACKAGE_QT_PHONON),y)
-QT_LIBS+= qt-phonon
-endif
-ifeq ($(BR2_PACKAGE_QT_SVG),y)
-QT_LIBS+= qt-svg
-endif
-ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
-QT_LIBS+= qt-network
-endif
-ifeq ($(BR2_PACKAGE_QT_WEBKIT),y)
-QT_LIBS+= qt-webkit
-endif
-ifeq ($(BR2_PACKAGE_QT_XML),y)
-QT_LIBS+= qt-xml
-endif
-ifeq ($(BR2_PACKAGE_QT_DBUS),y)
-QT_LIBS+= qt-dbus
-QT_DEP_LIBS+= dbus
-endif
-ifeq ($(BR2_PACKAGE_QT_XMLPATTERNS),y)
-QT_LIBS+= qt-xmlpatterns
-endif
-ifeq ($(BR2_PACKAGE_QT_SCRIPT),y)
-QT_LIBS+= qt-script
-endif
-ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
-QT_LIBS+= qt-scripttools
-endif
-ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
-QT_LIBS+= qt-qt3support
-endif
-
-QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++/qmake.conf
-
 # Variable for other Qt applications to use
-QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++
+QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set QMAKE_<variable> = <value> in
-# QT_QMAKE_CONF. Will remove existing variable declaration if available.
+# the qmake.conf file. Will remove existing variable declaration if
+# available.
 #
 # Argument 1 is the variable name (without QMAKE_)
 # Argument 2 is the value to set variable to
+# Argument 3 is the base source directory of Qt
 #
 # E.G. use like this:
-# $(call QT_QMAKE_SET,variable,value)
+# $(call QT_QMAKE_SET,variable,value,directory)
 ################################################################################
 define QT_QMAKE_SET
-	$(SED) '/QMAKE_$(1)/d' $(QT_QMAKE_CONF)
-	$(SED) '/include.*qws.conf/aQMAKE_$(1) = $(2)' $(QT_QMAKE_CONF)
+	$(SED) '/QMAKE_$(1)/d' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '/include.*qws.conf/aQMAKE_$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 endef
 
-################################################################################
-# QT_INSTALL_PLUGINS -- helper macro to install Qt plugins to target and 
-# strip them
-#
-# Argument 1 is the plugin folder
-# 
-# E.G. use like this to install plugins/sqldrivers:
-# $(call QT_INSTALL_PLUGINS,sqldrivers)
-# ################################################################################
-define QT_INSTALL_PLUGINS
-        if [ -d $(STAGING_DIR)/usr/plugins/$(1) ]; then \
-                mkdir -p $(TARGET_DIR)/usr/plugins; \
-                cp -dpfr $(STAGING_DIR)/usr/plugins/$(1) $(TARGET_DIR)/usr/plugins/; \
-                $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/$(1)/*; \
-        fi
+ifneq ($(BR2_INET_IPV6),y)
+define QT_CONFIGURE_IPV6
+	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(@D)/configure
+	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(@D)/configure
 endef
+endif
 
-$(DL_DIR)/$(QT_SOURCE):
-	$(call DOWNLOAD,$(QT_SITE),$(QT_SOURCE))
-
-qt-source: $(DL_DIR)/$(QT_SOURCE)
-
-
-$(QT_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QT_SOURCE)
-	$(QT_CAT) $(DL_DIR)/$(QT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(QT_TARGET_DIR) package/qt/ \
-		qt-$(QT_VERSION)-\*.patch \
-		qt-$(QT_VERSION)-\*.patch.$(ARCH)
-	touch $@
-
-$(QT_TARGET_DIR)/.configured: $(QT_TARGET_DIR)/.unpacked
-	-[ -f $(QT_TARGET_DIR)/Makefile ] && $(MAKE) -C $(QT_TARGET_DIR) confclean
-ifneq ($(BR2_INET_IPV6),y)
-	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QT_TARGET_DIR)/configure
-	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QT_TARGET_DIR)/configure
+ifneq ($(QT_CONFIG_FILE),)
+define QT_CONFIGURE_CONFIG_FILE
+	cp $(QT_CONFIG_FILE) $(@D)/src/corelib/global/qconfig-buildroot.h
+endef
 endif
+
+define QT_CONFIGURE_CMDS
+	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) confclean
+	$(QT_CONFIGURE_IPV6)
+	$(QT_CONFIGURE_CONFIG_FILE)
 	# Fix compiler path
-	$(call QT_QMAKE_SET,CC,$(filter-out --sysroot=%,$(TARGET_CC)))
-	$(call QT_QMAKE_SET,CXX,$(filter-out --sysroot=%,$(TARGET_CXX)))
-	$(call QT_QMAKE_SET,LINK,$(TARGET_CXX))
-	$(call QT_QMAKE_SET,LINK_SHLIB,$(TARGET_CXX))
-	$(call QT_QMAKE_SET,AR,$(TARGET_AR) cqs)
-	$(call QT_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY))
-	$(call QT_QMAKE_SET,RANLIB,$(TARGET_RANLIB))
-	$(call QT_QMAKE_SET,STRIP,$(TARGET_STRIP))
-	$(call QT_QMAKE_SET,CFLAGS,$(TARGET_SYSROOT_OPT) $(TARGET_CFLAGS))
-	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_SYSROOT_OPT) $(TARGET_CXXFLAGS))
-	$(call QT_QMAKE_SET,LFLAGS,$(TARGET_LDFLAGS))
-	-[ -f $(QT_QCONFIG_FILE) ] && cp $(QT_QCONFIG_FILE) \
-		$(QT_TARGET_DIR)/$(QT_QCONFIG_FILE_LOCATION)
+	$(call QT_QMAKE_SET,CC,$(filter-out --sysroot=%,$(TARGET_CC)),$(@D))
+	$(call QT_QMAKE_SET,CXX,$(filter-out --sysroot=%,$(TARGET_CXX)),$(@D))
+	$(call QT_QMAKE_SET,LINK,$(TARGET_CXX),$(@D))
+	$(call QT_QMAKE_SET,LINK_SHLIB,$(TARGET_CXX),$(@D))
+	$(call QT_QMAKE_SET,AR,$(TARGET_AR) cqs,$(@D))
+	$(call QT_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY),$(@D))
+	$(call QT_QMAKE_SET,RANLIB,$(TARGET_RANLIB),$(@D))
+	$(call QT_QMAKE_SET,STRIP,$(TARGET_STRIP),$(@D))
+	$(call QT_QMAKE_SET,CFLAGS,$(TARGET_SYSROOT_OPT) $(TARGET_CFLAGS),$(@D))
+	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_SYSROOT_OPT) $(TARGET_CXXFLAGS),$(@D))
+	$(call QT_QMAKE_SET,LFLAGS,$(TARGET_LDFLAGS),$(@D))
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
 # instead of the host then. So set PKG_CONFIG* manually.
-	(cd $(QT_TARGET_DIR); \
+	(cd $(@D); \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		./configure \
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
-		-embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \
-		$(QT_QCONFIG_COMMAND) \
-		$(QT_CONFIGURE) \
+		$(QT_CONFIGURE_OPTS) \
 		-no-gfx-qnx \
 		-no-kbd-qnx \
 		-no-mouse-qnx \
@@ -538,133 +485,139 @@ endif
 		-fast \
 		-no-rpath \
 	)
-	touch $@
-
-$(QT_TARGET_DIR)/.compiled: $(QT_TARGET_DIR)/.configured
-	$(MAKE) -C $(QT_TARGET_DIR)
-	touch $@
-
-$(HOST_DIR)/usr/bin/qt.conf:
-	mkdir -p $(dir $@)
-	echo "[Paths]" > $@
-	echo "Prefix=$(HOST_DIR)/usr" >> $@
-	echo "Headers=$(STAGING_DIR)/usr/include" >> $@
-	echo "Libraries=$(STAGING_DIR)/usr/lib" >> $@
-	echo "Data=$(HOST_DIR)/usr" >> $@
-	echo "Binaries=$(HOST_DIR)/usr/bin" >> $@
-
-$(STAGING_DIR)/usr/lib/libQtCore.la: $(QT_TARGET_DIR)/.compiled $(HOST_DIR)/usr/bin/qt.conf
-	$(MAKE) -C $(QT_TARGET_DIR) install
-	# Move host programs and spec files to the host directory. The
-	# generated qt.conf file will tell qmake where everything is.
-	mv $(addprefix $(STAGING_DIR)/usr/bin/,moc rcc qmake lrelease) $(HOST_DIR)/usr/bin
+endef
+
+define QT_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+
+# Build the list of libraries and plugins to install to the target
+
+QT_INSTALL_LIBS    += QtCore
+QT_HOST_PROGRAMS   += moc rcc qmake lrelease
+
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-	mv $(STAGING_DIR)/usr/bin/uic $(HOST_DIR)/usr/bin
+QT_INSTALL_LIBS    += QtGui
+QT_INSTALL_PLUGINS += imageformats
+QT_HOST_PROGRAMS   += uic
 endif
-	mv $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr
-
-qt-gui: $(STAGING_DIR)/usr/lib/libQtCore.la
-	mkdir -p $(TARGET_DIR)/usr/lib/fonts
-ifneq ($(QT_FONTS),)
-	cp -dpf $(QT_FONTS) $(TARGET_DIR)/usr/lib/fonts
+ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
+QT_INSTALL_LIBS    += QtSql
+QT_INSTALL_PLUGINS += sqldrivers
 endif
-ifneq ($(BR2_PACKAGE_QT_NOFREETYPE),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
+ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
+QT_INSTALL_LIBS    += QtMultimedia
 endif
-	# Install image plugins if they are built
-	$(call QT_INSTALL_PLUGINS,imageformats)
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtGui.so.* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_QT_PHONON),y)
+QT_INSTALL_LIBS    += phonon
+QT_INSTALL_PLUGINS += phonon_backend
 endif
-
-qt-sql: $(STAGING_DIR)/usr/lib/libQtCore.la
-	$(call QT_INSTALL_PLUGINS,sqldrivers)
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtSql.so.* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_QT_SVG),y)
+QT_INSTALL_LIBS    += QtSvg
+QT_INSTALL_PLUGINS += iconengines
 endif
-
-qt-multimedia: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtMultimedia.so.* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
+QT_INSTALL_LIBS    += QtNetwork
 endif
-
-qt-phonon: $(STAGING_DIR)/usr/lib/libQtCore.la
-	$(call QT_INSTALL_PLUGINS,phonon_backend)
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libphonon.so.* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_QT_WEBKIT),y)
+QT_INSTALL_LIBS    += QtWebKit
 endif
-
-qt-svg: $(STAGING_DIR)/usr/lib/libQtCore.la
-	$(call QT_INSTALL_PLUGINS,iconengines)
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtSvg.so.* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_QT_XML),y)
+QT_INSTALL_LIBS    += QtXml
 endif
-
-qt-network: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtNetwork.so.* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_QT_DBUS),y)
+QT_INSTALL_LIBS    += QtDBus
 endif
-
-qt-webkit: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtWebKit.so.* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_QT_XMLPATTERNS),y)
+QT_INSTALL_LIBS    += QtXmlPatterns
 endif
-
-qt-xml: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtXml.so.* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_QT_SCRIPT),y)
+QT_INSTALL_LIBS    += QtScript
 endif
-
-qt-xmlpatterns: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtXmlPatterns.so.* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
+QT_INSTALL_LIBS    += QtScriptTools
 endif
+ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
+QT_INSTALL_LIBS    += libQt3Support
+endif
+
+QT_CONF_FILE=$(HOST_DIR)/usr/bin/qt.conf
+
+# Since host programs and spec files have been moved to $(HOST_DIR),
+# we need to tell qmake the new location of the various elements,
+# through a qt.conf file.
+define QT_INSTALL_QT_CONF
+	mkdir -p $(dir $(QT_CONF_FILE))
+	echo "[Paths]"                             > $(QT_CONF_FILE)
+	echo "Prefix=$(HOST_DIR)/usr"             >> $(QT_CONF_FILE)
+	echo "Headers=$(STAGING_DIR)/usr/include" >> $(QT_CONF_FILE)
+	echo "Libraries=$(STAGING_DIR)/usr/lib"   >> $(QT_CONF_FILE)
+	echo "Data=$(HOST_DIR)/usr"               >> $(QT_CONF_FILE)
+	echo "Binaries=$(HOST_DIR)/usr/bin"       >> $(QT_CONF_FILE)
+endef
 
-qt-dbus: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtDBus.so.* $(TARGET_DIR)/usr/lib/
-endif
+# After running Qt normal installation process (which installs
+# everything in the STAGING_DIR), we move host programs such as qmake,
+# rcc or uic to the HOST_DIR so that they are available at the usual
+# location. A qt.conf file is generated to make sure that all host
+# programs still find all files they need.
+define QT_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install
+	mkdir -p $(HOST_DIR)/usr/bin
+	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
+	rm -rf $(HOST_DIR)/usr/mkspecs
+	mv $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr
+	$(QT_INSTALL_QT_CONF)
+endef
 
-qt-script: $(STAGING_DIR)/usr/lib/libQtCore.la
+# Library installation
 ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtScript.so.* $(TARGET_DIR)/usr/lib/
+define QT_INSTALL_TARGET_LIBS
+	for lib in $(QT_INSTALL_LIBS); do \
+		cp -dpf $(STAGING_DIR)/usr/lib/lib$${lib}.so.* $(TARGET_DIR)/usr/lib ; \
+	done
+endef
 endif
 
-qt-scripttools: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtScriptTools.so.* $(TARGET_DIR)/usr/lib/
-endif
+# Plugin installation
+define QT_INSTALL_TARGET_PLUGINS
+	for plugin in $(QT_INSTALL_PLUGINS); do \
+		mkdir -p $(TARGET_DIR)/usr/plugins ; \
+		cp -dpfr $(STAGING_DIR)/usr/plugins/$$plugin $(TARGET_DIR)/usr/plugins/; \
+	done
+endef
 
-qt-qt3support: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt3Support.so.* $(TARGET_DIR)/usr/lib/
+# Fonts installation
+ifneq ($(QT_FONTS),)
+define QT_INSTALL_TARGET_FONTS
+	mkdir -p $(TARGET_DIR)/usr/lib/fonts
+	cp -dpf $(QT_FONTS) $(TARGET_DIR)/usr/lib/fonts
+endef
 endif
 
-$(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la $(QT_LIBS)
-	# Strip all installed libs
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtCore.so.* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
+ifeq ($(BR2_PACKAGE_QT_QTFREETYPE)$(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
+define QT_INSTALL_TARGET_FONTS_TTF
+	mkdir -p $(TARGET_DIR)/usr/lib/fonts
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
+endef
 endif
 
-qt: $(QT_DEP_LIBS) $(TARGET_DIR)/usr/lib/libQtCore.so.4
+define QT_INSTALL_TARGET_CMDS
+	$(QT_INSTALL_TARGET_LIBS)
+	$(QT_INSTALL_TARGET_PLUGINS)
+	$(QT_INSTALL_TARGET_FONTS)
+	$(QT_INSTALL_TARGET_FONTS_TTF)
+endef
+
+define QT_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
 
-qt-clean:
-	-$(MAKE) -C $(QT_TARGET_DIR) clean
+define QT_UNINSTALL_TARGET_CMDS
 	-rm -rf $(TARGET_DIR)/usr/lib/fonts
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
 	-rm $(TARGET_DIR)/usr/lib/libQt*.so.*
 	-rm $(TARGET_DIR)/usr/lib/libphonon.so.*
-endif
-
-qt-dirclean:
-	rm -rf $(QT_TARGET_DIR)
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_QT),y)
-TARGETS+=qt
-endif
+$(eval $(call GENTARGETS,package,qt))
-- 
1.7.0.4
