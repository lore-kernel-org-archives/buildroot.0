From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 22 Jul 2014 21:21:32 +0200
Subject: [Buildroot] [PATCH 2 of 2] generic packages: rename
 FOO_CONFIGURE_OPTS into FOO_CONFIGURE_OPT
In-Reply-To: <9d1a7e2626ad1d2e4b42.1406056891@localhost>
References: <9d1a7e2626ad1d2e4b42.1406056891@localhost>
Message-ID: <5b961fc80eb2d23373a6.1406056892@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As FOO_MAKE_OPTS has been renamed to FOO_MAKE_OPT, this patch renames
FOO_CONFIGURE_OPTS into FOO_CONFIGURE_OPT for symmetry reasons.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: TARGET_CONFIGURE_OPTS has not been changed since the impact is very
large. It would make sense to change it too, though, so let me know what you
think.


 boot/uboot/uboot.mk                  |    6 +-
 package/fbv/fbv.mk                   |   10 +-
 package/qt/qt.mk                     |  214 +++++++++++++++---------------
 package/qt5/qt5base/qt5base.mk       |   72 +++++-----
 package/sunxi-cedarx/sunxi-cedarx.mk |    4 +-
 5 files changed, 153 insertions(+), 153 deletions(-)

diff -r 9d1a7e2626ad -r 5b961fc80eb2 boot/uboot/uboot.mk
--- a/boot/uboot/uboot.mk	Tue Jul 22 20:45:36 2014 +0200
+++ b/boot/uboot/uboot.mk	Tue Jul 22 21:11:24 2014 +0200
@@ -58,7 +58,7 @@
 
 UBOOT_ARCH=$(KERNEL_ARCH)
 
-UBOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
+UBOOT_CONFIGURE_OPT += CONFIG_NOSOFTFLOAT=1
 UBOOT_MAKE_OPT += \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH)
@@ -95,7 +95,7 @@
 endif
 
 define UBOOT_CONFIGURE_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
+	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPT) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPT)		\
 		$(UBOOT_BOARD_NAME)_config
 	@echo >> $(@D)/include/config.h
@@ -114,7 +114,7 @@
 endef
 
 define UBOOT_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
+	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPT) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPT) 		\
 		$(UBOOT_MAKE_TARGET)
 endef
diff -r 9d1a7e2626ad -r 5b961fc80eb2 package/fbv/fbv.mk
--- a/package/fbv/fbv.mk	Tue Jul 22 20:45:36 2014 +0200
+++ b/package/fbv/fbv.mk	Tue Jul 22 21:11:24 2014 +0200
@@ -12,21 +12,21 @@
 
 ### image format dependencies and configure options
 FBV_DEPENDENCIES = # empty
-FBV_CONFIGURE_OPTS = # empty
+FBV_CONFIGURE_OPT = # empty
 ifeq ($(BR2_PACKAGE_FBV_PNG),y)
 FBV_DEPENDENCIES += libpng
 else
-FBV_CONFIGURE_OPTS += --without-libpng
+FBV_CONFIGURE_OPT += --without-libpng
 endif
 ifeq ($(BR2_PACKAGE_FBV_JPEG),y)
 FBV_DEPENDENCIES += jpeg
 else
-FBV_CONFIGURE_OPTS += --without-libjpeg
+FBV_CONFIGURE_OPT += --without-libjpeg
 endif
 ifeq ($(BR2_PACKAGE_FBV_GIF),y)
 FBV_DEPENDENCIES += libungif
 else
-FBV_CONFIGURE_OPTS += --without-libungif
+FBV_CONFIGURE_OPT += --without-libungif
 endif
 
 #fbv donesn't support cross-compilation
@@ -36,7 +36,7 @@
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
 		--prefix=/usr \
-		$(FBV_CONFIGURE_OPTS) \
+		$(FBV_CONFIGURE_OPT) \
 	)
 endef
 
diff -r 9d1a7e2626ad -r 5b961fc80eb2 package/qt/qt.mk
--- a/package/qt/qt.mk	Tue Jul 22 20:45:36 2014 +0200
+++ b/package/qt/qt.mk	Tue Jul 22 21:11:24 2014 +0200
@@ -25,13 +25,13 @@
 QT_LICENSE_FILES = LICENSE.LGPL LGPL_EXCEPTION.txt LICENSE.GPL3
 
 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
-QT_CONFIGURE_OPTS += -opensource -confirm-license
+QT_CONFIGURE_OPT += -opensource -confirm-license
 endif
 
 QT_CONFIG_FILE=$(call qstrip,$(BR2_PACKAGE_QT_CONFIG_FILE))
 
 ifneq ($(QT_CONFIG_FILE),)
-QT_CONFIGURE_OPTS += -qconfig buildroot
+QT_CONFIGURE_OPT += -qconfig buildroot
 endif
 
 QT_CFLAGS = $(TARGET_CFLAGS)
@@ -39,9 +39,9 @@
 QT_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_LARGEFILE),y)
-QT_CONFIGURE_OPTS += -largefile
+QT_CONFIGURE_OPT += -largefile
 else
-QT_CONFIGURE_OPTS += -no-largefile
+QT_CONFIGURE_OPT += -no-largefile
 
 # embedded sqlite module forces FILE_OFFSET_BITS=64 unless this is defined
 # webkit internally uses this module as well
@@ -53,28 +53,28 @@
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
-QT_CONFIGURE_OPTS += -qt3support
+QT_CONFIGURE_OPT += -qt3support
 else
-QT_CONFIGURE_OPTS += -no-qt3support
+QT_CONFIGURE_OPT += -no-qt3support
 endif
 
 ifeq ($(BR2_PACKAGE_QT_DEMOS),y)
-QT_CONFIGURE_OPTS += -demosdir $(TARGET_DIR)/usr/share/qt/demos
+QT_CONFIGURE_OPT += -demosdir $(TARGET_DIR)/usr/share/qt/demos
 else
-QT_CONFIGURE_OPTS += -nomake demos
+QT_CONFIGURE_OPT += -nomake demos
 endif
 ifeq ($(BR2_PACKAGE_QT_EXAMPLES),y)
-QT_CONFIGURE_OPTS += -examplesdir $(TARGET_DIR)/usr/share/qt/examples
+QT_CONFIGURE_OPT += -examplesdir $(TARGET_DIR)/usr/share/qt/examples
 else
-QT_CONFIGURE_OPTS += -nomake examples
+QT_CONFIGURE_OPT += -nomake examples
 endif
 
 # ensure glib is built first if enabled for Qt's glib support
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-QT_CONFIGURE_OPTS += -glib
+QT_CONFIGURE_OPT += -glib
 QT_DEPENDENCIES += libglib2
 else
-QT_CONFIGURE_OPTS += -no-glib
+QT_CONFIGURE_OPT += -no-glib
 endif
 
 
@@ -108,111 +108,111 @@
 QT_PIXEL_DEPTHS += 32
 endif
 ifneq ($(QT_PIXEL_DEPTHS),)
-QT_CONFIGURE_OPTS += -depths $(subst $(space),$(comma),$(strip $(QT_PIXEL_DEPTHS)))
+QT_CONFIGURE_OPT += -depths $(subst $(space),$(comma),$(strip $(QT_PIXEL_DEPTHS)))
 endif
 
 ### Display drivers
 ifeq ($(BR2_PACKAGE_QT_GFX_LINUXFB),y)
-QT_CONFIGURE_OPTS += -qt-gfx-linuxfb
+QT_CONFIGURE_OPT += -qt-gfx-linuxfb
 else
-QT_CONFIGURE_OPTS += -no-gfx-linuxfb
+QT_CONFIGURE_OPT += -no-gfx-linuxfb
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_TRANSFORMED),y)
-QT_CONFIGURE_OPTS += -qt-gfx-transformed
+QT_CONFIGURE_OPT += -qt-gfx-transformed
 else
-QT_CONFIGURE_OPTS += -no-gfx-transformed
+QT_CONFIGURE_OPT += -no-gfx-transformed
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_QVFB),y)
-QT_CONFIGURE_OPTS += -qt-gfx-qvfb
+QT_CONFIGURE_OPT += -qt-gfx-qvfb
 else
-QT_CONFIGURE_OPTS += -no-gfx-qvfb
+QT_CONFIGURE_OPT += -no-gfx-qvfb
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_VNC),y)
-QT_CONFIGURE_OPTS += -qt-gfx-vnc
+QT_CONFIGURE_OPT += -qt-gfx-vnc
 else
-QT_CONFIGURE_OPTS += -no-gfx-vnc
+QT_CONFIGURE_OPT += -no-gfx-vnc
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_MULTISCREEN),y)
-QT_CONFIGURE_OPTS += -qt-gfx-multiscreen
+QT_CONFIGURE_OPT += -qt-gfx-multiscreen
 else
-QT_CONFIGURE_OPTS += -no-gfx-multiscreen
+QT_CONFIGURE_OPT += -no-gfx-multiscreen
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_DIRECTFB),y)
-QT_CONFIGURE_OPTS += -qt-gfx-directfb
+QT_CONFIGURE_OPT += -qt-gfx-directfb
 QT_DEPENDENCIES += directfb
 else
-QT_CONFIGURE_OPTS += -no-gfx-directfb
+QT_CONFIGURE_OPT += -no-gfx-directfb
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_POWERVR),y)
-QT_CONFIGURE_OPTS += \
+QT_CONFIGURE_OPT += \
 	-plugin-gfx-powervr -D QT_NO_QWS_CURSOR -D QT_QWS_CLIENTBLIT
 QT_DEPENDENCIES += powervr
 endif
 
 ### Mouse drivers
 ifeq ($(BR2_PACKAGE_QT_MOUSE_PC),y)
-QT_CONFIGURE_OPTS += -qt-mouse-pc
+QT_CONFIGURE_OPT += -qt-mouse-pc
 else
-QT_CONFIGURE_OPTS += -no-mouse-pc
+QT_CONFIGURE_OPT += -no-mouse-pc
 endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_LINUXTP),y)
-QT_CONFIGURE_OPTS += -qt-mouse-linuxtp
+QT_CONFIGURE_OPT += -qt-mouse-linuxtp
 else
-QT_CONFIGURE_OPTS += -no-mouse-linuxtp
+QT_CONFIGURE_OPT += -no-mouse-linuxtp
 endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_LINUXINPUT),y)
-QT_CONFIGURE_OPTS += -qt-mouse-linuxinput
+QT_CONFIGURE_OPT += -qt-mouse-linuxinput
 else
-QT_CONFIGURE_OPTS += -no-mouse-linuxinput
+QT_CONFIGURE_OPT += -no-mouse-linuxinput
 endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_TSLIB),y)
-QT_CONFIGURE_OPTS += -qt-mouse-tslib
+QT_CONFIGURE_OPT += -qt-mouse-tslib
 QT_DEPENDENCIES += tslib
 else
-QT_CONFIGURE_OPTS += -no-mouse-tslib
+QT_CONFIGURE_OPT += -no-mouse-tslib
 endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_QVFB),y)
-QT_CONFIGURE_OPTS += -qt-mouse-qvfb
+QT_CONFIGURE_OPT += -qt-mouse-qvfb
 else
-QT_CONFIGURE_OPTS += -no-mouse-qvfb
+QT_CONFIGURE_OPT += -no-mouse-qvfb
 endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_NO_QWS_CURSOR),y)
-QT_CONFIGURE_OPTS += -D QT_NO_QWS_CURSOR
+QT_CONFIGURE_OPT += -D QT_NO_QWS_CURSOR
 endif
 
 ### Keyboard drivers
 ifeq ($(BR2_PACKAGE_QT_KEYBOARD_TTY),y)
-QT_CONFIGURE_OPTS += -qt-kbd-tty
+QT_CONFIGURE_OPT += -qt-kbd-tty
 else
-QT_CONFIGURE_OPTS += -no-kbd-tty
+QT_CONFIGURE_OPT += -no-kbd-tty
 endif
 ifeq ($(BR2_PACKAGE_QT_KEYBOARD_LINUXINPUT),y)
-QT_CONFIGURE_OPTS += -qt-kbd-linuxinput
+QT_CONFIGURE_OPT += -qt-kbd-linuxinput
 else
-QT_CONFIGURE_OPTS += -no-kbd-linuxinput
+QT_CONFIGURE_OPT += -no-kbd-linuxinput
 endif
 ifeq ($(BR2_PACKAGE_QT_KEYBOARD_QVFB),y)
-QT_CONFIGURE_OPTS += -qt-kbd-qvfb
+QT_CONFIGURE_OPT += -qt-kbd-qvfb
 else
-QT_CONFIGURE_OPTS += -no-kbd-qvfb
+QT_CONFIGURE_OPT += -no-kbd-qvfb
 endif
 
 ifeq ($(BR2_PACKAGE_QT_DEBUG),y)
-QT_CONFIGURE_OPTS += -debug
+QT_CONFIGURE_OPT += -debug
 else
-QT_CONFIGURE_OPTS += -release
+QT_CONFIGURE_OPT += -release
 endif
 
 ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-QT_CONFIGURE_OPTS += -shared
+QT_CONFIGURE_OPT += -shared
 else
-QT_CONFIGURE_OPTS += -static
+QT_CONFIGURE_OPT += -static
 endif
 
 ifeq ($(BR2_ENDIAN),"LITTLE")
-QT_CONFIGURE_OPTS += -little-endian
+QT_CONFIGURE_OPT += -little-endian
 else
-QT_CONFIGURE_OPTS += -big-endian
+QT_CONFIGURE_OPT += -big-endian
 endif
 
 ifeq ($(BR2_arm)$(BR2_armeb),y)
@@ -231,61 +231,61 @@
 QT_EMB_PLATFORM = generic
 endif
 
-QT_CONFIGURE_OPTS += -embedded $(QT_EMB_PLATFORM)
+QT_CONFIGURE_OPT += -embedded $(QT_EMB_PLATFORM)
 
 ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-QT_CONFIGURE_OPTS += -no-gui
+QT_CONFIGURE_OPT += -no-gui
 endif
 
 ifneq ($(BR2_PACKAGE_QT_GIF),y)
-QT_CONFIGURE_OPTS += -no-gif
+QT_CONFIGURE_OPT += -no-gif
 endif
 
 ifeq ($(BR2_PACKAGE_QT_LIBMNG),y)
-QT_CONFIGURE_OPTS += -qt-libmng
+QT_CONFIGURE_OPT += -qt-libmng
 else
-QT_CONFIGURE_OPTS += -no-libmng
+QT_CONFIGURE_OPT += -no-libmng
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QTZLIB),y)
-QT_CONFIGURE_OPTS += -qt-zlib
+QT_CONFIGURE_OPT += -qt-zlib
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMZLIB),y)
-QT_CONFIGURE_OPTS += -system-zlib
+QT_CONFIGURE_OPT += -system-zlib
 QT_DEPENDENCIES   += zlib
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QTJPEG),y)
-QT_CONFIGURE_OPTS += -qt-libjpeg
+QT_CONFIGURE_OPT += -qt-libjpeg
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMJPEG),y)
-QT_CONFIGURE_OPTS += -system-libjpeg
+QT_CONFIGURE_OPT += -system-libjpeg
 QT_DEPENDENCIES   += jpeg
 else
-QT_CONFIGURE_OPTS += -no-libjpeg
+QT_CONFIGURE_OPT += -no-libjpeg
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QTPNG),y)
-QT_CONFIGURE_OPTS += -qt-libpng
+QT_CONFIGURE_OPT += -qt-libpng
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMPNG),y)
-QT_CONFIGURE_OPTS += -system-libpng
+QT_CONFIGURE_OPT += -system-libpng
 QT_DEPENDENCIES   += libpng
 else
-QT_CONFIGURE_OPTS += -no-libpng
+QT_CONFIGURE_OPT += -no-libpng
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QTTIFF),y)
-QT_CONFIGURE_OPTS += -qt-libtiff
+QT_CONFIGURE_OPT += -qt-libtiff
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMTIFF),y)
-QT_CONFIGURE_OPTS += -system-libtiff
+QT_CONFIGURE_OPT += -system-libtiff
 QT_DEPENDENCIES   += tiff
 else
-QT_CONFIGURE_OPTS += -no-libtiff
+QT_CONFIGURE_OPT += -no-libtiff
 endif
 endif
 
@@ -297,14 +297,14 @@
 	   $(if $(BR2_PACKAGE_QT_FONT_UNIFONT),unifont)))
 
 ifeq ($(BR2_PACKAGE_QT_QTFREETYPE),y)
-QT_CONFIGURE_OPTS += -qt-freetype
+QT_CONFIGURE_OPT += -qt-freetype
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
-QT_CONFIGURE_OPTS += -system-freetype
-QT_CONFIGURE_OPTS += -I $(STAGING_DIR)/usr/include/freetype2/
+QT_CONFIGURE_OPT += -system-freetype
+QT_CONFIGURE_OPT += -I $(STAGING_DIR)/usr/include/freetype2/
 QT_DEPENDENCIES   += freetype
 else
-QT_CONFIGURE_OPTS += -no-freetype
+QT_CONFIGURE_OPT += -no-freetype
 endif
 endif
 
@@ -313,136 +313,136 @@
 endif
 
 ifeq ($(BR2_PACKAGE_QT_OPENSSL),y)
-QT_CONFIGURE_OPTS += -openssl
+QT_CONFIGURE_OPT += -openssl
 QT_DEPENDENCIES   += openssl
 else
-QT_CONFIGURE_OPTS += -no-openssl
+QT_CONFIGURE_OPT += -no-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
-QT_CONFIGURE_OPTS += -opengl es2 -egl
+QT_CONFIGURE_OPT += -opengl es2 -egl
 QT_DEPENDENCIES   += libgles libegl
 QT_CFLAGS   += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
 QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
 QT_LDFLAGS  += $(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)
 else
-QT_CONFIGURE_OPTS += -no-opengl
+QT_CONFIGURE_OPT += -no-opengl
 endif
 
 # Qt SQL Drivers
 ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
 ifeq ($(BR2_PACKAGE_QT_IBASE),y)
-QT_CONFIGURE_OPTS += -qt-sql-ibase
+QT_CONFIGURE_OPT += -qt-sql-ibase
 endif
 ifeq ($(BR2_PACKAGE_QT_MYSQL),y)
-QT_CONFIGURE_OPTS += -qt-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
+QT_CONFIGURE_OPT += -qt-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
 QT_DEPENDENCIES   += mysql
 endif
 ifeq ($(BR2_PACKAGE_QT_ODBC),y)
-QT_CONFIGURE_OPTS += -qt-sql-odbc
+QT_CONFIGURE_OPT += -qt-sql-odbc
 endif
 ifeq ($(BR2_PACKAGE_QT_PSQL),y)
-QT_CONFIGURE_OPTS += -qt-sql-psql
+QT_CONFIGURE_OPT += -qt-sql-psql
 endif
 ifeq ($(BR2_PACKAGE_QT_SQLITE_QT),y)
-QT_CONFIGURE_OPTS += -qt-sql-sqlite
+QT_CONFIGURE_OPT += -qt-sql-sqlite
 else
 ifeq ($(BR2_PACKAGE_QT_SQLITE_SYSTEM),y)
-QT_CONFIGURE_OPTS += -system-sqlite
+QT_CONFIGURE_OPT += -system-sqlite
 QT_DEPENDENCIES   += sqlite
 else
-QT_CONFIGURE_OPTS += -no-sql-sqlite
+QT_CONFIGURE_OPT += -no-sql-sqlite
 endif
 endif
 ifeq ($(BR2_PACKAGE_QT_SQLITE2),y)
-QT_CONFIGURE_OPTS += -qt-sql-sqlite2
+QT_CONFIGURE_OPT += -qt-sql-sqlite2
 endif
 else
 # By default, no SQL driver is turned on by configure.
 # but it seems sqlite isn't disabled despite what says
 # configure --help
-QT_CONFIGURE_OPTS += -no-sql-sqlite
+QT_CONFIGURE_OPT += -no-sql-sqlite
 endif
 
 ifeq ($(BR2_PACKAGE_QT_XMLPATTERNS),y)
-QT_CONFIGURE_OPTS += -xmlpatterns -exceptions
+QT_CONFIGURE_OPT += -xmlpatterns -exceptions
 else
-QT_CONFIGURE_OPTS += -no-xmlpatterns
+QT_CONFIGURE_OPT += -no-xmlpatterns
 endif
 
 ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
-QT_CONFIGURE_OPTS += -multimedia
+QT_CONFIGURE_OPT += -multimedia
 else
-QT_CONFIGURE_OPTS += -no-multimedia
+QT_CONFIGURE_OPT += -no-multimedia
 endif
 
 ifeq ($(BR2_PACKAGE_QT_AUDIO_BACKEND),y)
-QT_CONFIGURE_OPTS += -audio-backend
+QT_CONFIGURE_OPT += -audio-backend
 QT_DEPENDENCIES   += alsa-lib
 else
-QT_CONFIGURE_OPTS += -no-audio-backend
+QT_CONFIGURE_OPT += -no-audio-backend
 endif
 
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
-QT_CONFIGURE_OPTS += -phonon
+QT_CONFIGURE_OPT += -phonon
 QT_DEPENDENCIES   += gstreamer gst-plugins-base
 else
-QT_CONFIGURE_OPTS += -no-phonon
+QT_CONFIGURE_OPT += -no-phonon
 endif
 
 ifeq ($(BR2_PACKAGE_QT_PHONON_BACKEND),y)
-QT_CONFIGURE_OPTS += -phonon-backend
+QT_CONFIGURE_OPT += -phonon-backend
 else
-QT_CONFIGURE_OPTS += -no-phonon-backend
+QT_CONFIGURE_OPT += -no-phonon-backend
 endif
 
 ifeq ($(BR2_PACKAGE_QT_SVG),y)
-QT_CONFIGURE_OPTS += -svg
+QT_CONFIGURE_OPT += -svg
 else
-QT_CONFIGURE_OPTS += -no-svg
+QT_CONFIGURE_OPT += -no-svg
 endif
 
 ifeq ($(BR2_PACKAGE_QT_WEBKIT),y)
-QT_CONFIGURE_OPTS += -webkit
+QT_CONFIGURE_OPT += -webkit
 else
-QT_CONFIGURE_OPTS += -no-webkit
+QT_CONFIGURE_OPT += -no-webkit
 endif
 
 ifeq ($(BR2_PACKAGE_QT_SCRIPT),y)
-QT_CONFIGURE_OPTS += -script
+QT_CONFIGURE_OPT += -script
 else
-QT_CONFIGURE_OPTS += -no-script
+QT_CONFIGURE_OPT += -no-script
 endif
 
 ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
-QT_CONFIGURE_OPTS += -scripttools
+QT_CONFIGURE_OPT += -scripttools
 else
-QT_CONFIGURE_OPTS += -no-scripttools
+QT_CONFIGURE_OPT += -no-scripttools
 endif
 
 ifeq ($(BR2_PACKAGE_QT_STL),y)
-QT_CONFIGURE_OPTS += -stl
+QT_CONFIGURE_OPT += -stl
 else
-QT_CONFIGURE_OPTS += -no-stl
+QT_CONFIGURE_OPT += -no-stl
 endif
 
 ifeq ($(BR2_PACKAGE_QT_DECLARATIVE),y)
-QT_CONFIGURE_OPTS += -declarative
+QT_CONFIGURE_OPT += -declarative
 else
-QT_CONFIGURE_OPTS += -no-declarative
+QT_CONFIGURE_OPT += -no-declarative
 endif
 
 # -no-pch is needed to workaround the issue described at
 # http://comments.gmane.org/gmane.comp.lib.qt.devel/5933.
 # In addition, ccache and precompiled headers don't play well together
-QT_CONFIGURE_OPTS += -no-pch
+QT_CONFIGURE_OPT += -no-pch
 
 # x86x86fix
 # Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
 # host. It's unclear if this would happen on other hosts.
 ifneq ($(findstring linux,$(GNU_HOST_NAME)),)
 ifneq ($(findstring x86,$(QT_EMB_PLATFORM)),)
-QT_CONFIGURE_OPTS += -platform linux-g++
+QT_CONFIGURE_OPT += -platform linux-g++
 endif
 endif
 # End of workaround.
@@ -506,7 +506,7 @@
 		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" ./configure \
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
-		$(QT_CONFIGURE_OPTS) \
+		$(QT_CONFIGURE_OPT) \
 		-no-xinerama \
 		-no-cups \
 		-no-nis \
diff -r 9d1a7e2626ad -r 5b961fc80eb2 package/qt5/qt5base/qt5base.mk
--- a/package/qt5/qt5base/qt5base.mk	Tue Jul 22 20:45:36 2014 +0200
+++ b/package/qt5/qt5base/qt5base.mk	Tue Jul 22 21:11:24 2014 +0200
@@ -18,7 +18,7 @@
 #     want to use the Buildroot packaged zlib
 #  * -system-pcre because pcre is mandatory to build Qt, and we
 #    want to use the one packaged in Buildroot
-QT5BASE_CONFIGURE_OPTS += \
+QT5BASE_CONFIGURE_OPT += \
 	-optimized-qmake \
 	-no-kms \
 	-no-cups \
@@ -29,27 +29,27 @@
 	-no-pch
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-QT5BASE_CONFIGURE_OPTS += -debug
+QT5BASE_CONFIGURE_OPT += -debug
 else
-QT5BASE_CONFIGURE_OPTS += -release
+QT5BASE_CONFIGURE_OPT += -release
 endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-QT5BASE_CONFIGURE_OPTS += -static
+QT5BASE_CONFIGURE_OPT += -static
 else
 # We apparently can't build both the shared and static variants of the
 # library.
-QT5BASE_CONFIGURE_OPTS += -shared
+QT5BASE_CONFIGURE_OPT += -shared
 endif
 
 ifeq ($(BR2_LARGEFILE),y)
-QT5BASE_CONFIGURE_OPTS += -largefile
+QT5BASE_CONFIGURE_OPT += -largefile
 else
-QT5BASE_CONFIGURE_OPTS += -no-largefile
+QT5BASE_CONFIGURE_OPT += -no-largefile
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
+QT5BASE_CONFIGURE_OPT += -opensource -confirm-license
 QT5BASE_LICENSE = LGPLv2.1 or GPLv3.0
 QT5BASE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
 else
@@ -60,28 +60,28 @@
 # Qt5 SQL Plugins
 ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
-QT5BASE_CONFIGURE_OPTS += -plugin-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
+QT5BASE_CONFIGURE_OPT += -plugin-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
 QT5BASE_DEPENDENCIES   += mysql
 else
-QT5BASE_CONFIGURE_OPTS += -no-sql-mysql
+QT5BASE_CONFIGURE_OPT += -no-sql-mysql
 endif
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_QT),-plugin-sql-sqlite)
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),-system-sqlite)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_QT),-plugin-sql-sqlite)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),-system-sqlite)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),sqlite)
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_NONE),-no-sql-sqlite)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_NONE),-no-sql-sqlite)
 endif
 
 # We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
 # is to add a link against the "inuxfb" library.
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-gui,-no-gui)
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_GUI),-gui,-no-gui)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
 
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
-QT5BASE_CONFIGURE_OPTS += -xcb -system-xkbcommon
+QT5BASE_CONFIGURE_OPT += -xcb -system-xkbcommon
 QT5BASE_DEPENDENCIES   += \
 	libxcb \
 	xcb-util-wm \
@@ -93,24 +93,24 @@
 QT5BASE_DEPENDENCIES   += xlib_libXext
 endif
 else
-QT5BASE_CONFIGURE_OPTS += -no-xcb
+QT5BASE_CONFIGURE_OPT += -no-xcb
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP),y)
-QT5BASE_CONFIGURE_OPTS += -opengl desktop
+QT5BASE_CONFIGURE_OPT += -opengl desktop
 QT5BASE_DEPENDENCIES   += libgl
 else ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL_ES2),y)
-QT5BASE_CONFIGURE_OPTS += -opengl es2
+QT5BASE_CONFIGURE_OPT += -opengl es2
 QT5BASE_DEPENDENCIES   += libgles
 else
-QT5BASE_CONFIGURE_OPTS += -no-opengl
+QT5BASE_CONFIGURE_OPT += -no-opengl
 endif
 
 QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
-QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
+QT5BASE_CONFIGURE_OPT += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
-QT5BASE_CONFIGURE_OPTS += -eglfs
+QT5BASE_CONFIGURE_OPT += -eglfs
 QT5BASE_DEPENDENCIES   += libegl
 ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
 QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
@@ -121,33 +121,33 @@
 	$(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
 endif
 else
-QT5BASE_CONFIGURE_OPTS += -no-eglfs
+QT5BASE_CONFIGURE_OPT += -no-eglfs
 endif
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GIF),,-no-gif)
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_JPEG),-system-libjpeg,-no-libjpeg)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_GIF),,-no-gif)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_JPEG),-system-libjpeg,-no-libjpeg)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_JPEG),jpeg)
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_PNG),-system-libpng,-no-libpng)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_PNG),-system-libpng,-no-libpng)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DBUS),-dbus,-no-dbus)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_DBUS),-dbus,-no-dbus)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DBUS),dbus)
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),-tslib,-no-tslib)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),-tslib,-no-tslib)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),tslib)
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_ICU),-icu,-no-icu)
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_ICU),-icu,-no-icu)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
+QT5BASE_CONFIGURE_OPT += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
 
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
@@ -186,7 +186,7 @@
 		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 		-device-option EGLFS_PLATFORM_HOOKS_SOURCES="$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES)" \
 		-no-c++11 \
-		$(QT5BASE_CONFIGURE_OPTS) \
+		$(QT5BASE_CONFIGURE_OPT) \
 	)
 endef
 
diff -r 9d1a7e2626ad -r 5b961fc80eb2 package/sunxi-cedarx/sunxi-cedarx.mk
--- a/package/sunxi-cedarx/sunxi-cedarx.mk	Tue Jul 22 20:45:36 2014 +0200
+++ b/package/sunxi-cedarx/sunxi-cedarx.mk	Tue Jul 22 21:11:24 2014 +0200
@@ -9,7 +9,7 @@
 
 SUNXI_CEDARX_INSTALL_STAGING = YES
 
-SUNXI_CEDARX_CONFIGURE_OPTS = \
+SUNXI_CEDARX_CONFIGURE_OPT = \
 	CROSS_COMPILE=$(TARGET_CROSS)
 
 ifeq ($(BR2_ARM_EABIHF),y)
@@ -35,7 +35,7 @@
 
 define SUNXI_CEDARX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(SUNXI_CEDARX_BIN_DIR) \
-		$(SUNXI_CEDARX_CONFIGURE_OPTS)
+		$(SUNXI_CEDARX_CONFIGURE_OPT)
 	$(SUNXI_CEDARX_BUILD_AVHEAP)
 endef
 
