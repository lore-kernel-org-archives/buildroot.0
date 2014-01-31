From: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Date: Fri, 31 Jan 2014 15:25:07 +0100
Subject: [Buildroot] [PATCH 1/1] Qt4: adapt for X11
Message-ID: <1391178307-32431-1-git-send-email-cedric.chepied@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt4 can now be built with X11 support

I found the original patch here:
http://lists.busybox.net/pipermail/buildroot/2011-October/046706.html

Signed-off-by: C?dric Ch?pied <cedric.chepied@openwide.fr>
---
 package/qt/Config.in |  8 ++++++++
 package/qt/qt.mk     | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 926d54c..7f8de3b 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -15,6 +15,12 @@ menuconfig BR2_PACKAGE_QT
 
 if BR2_PACKAGE_QT
 
+config BR2_PACKAGE_QT_X11
+	bool "X server support"
+	default n
+	help
+	  Build Qt with X11 support
+
 config BR2_PACKAGE_QT_DEBUG
 	bool "Compile with debug support"
 	help
@@ -96,6 +102,7 @@ config BR2_PACKAGE_QT_GUI_MODULE
 	  video output, or you don't require Qt GUI, say n.
 
 if BR2_PACKAGE_QT_GUI_MODULE
+if !BR2_PACKAGE_QT_X11
 menu "Pixel depths"
 comment "Deselecting each option leads to Qt's default (8,16,32)"
 
@@ -176,6 +183,7 @@ config BR2_PACKAGE_QT_SYSTEMFREETYPE
 	  Use shared libfreetype from the target system.
 	  See http://www.freetype.org/
 endchoice
+endif # !BR2_PACKAGE_QT_X11
 
 config BR2_PACKAGE_QT_GIF
 	bool "Enable GIF support"
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index bc329f0..1fb350c 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -111,6 +111,10 @@ ifneq ($(QT_PIXEL_DEPTHS),)
 QT_CONFIGURE_OPTS += -depths $(subst $(space),$(comma),$(strip $(QT_PIXEL_DEPTHS)))
 endif
 
+ifneq ($(BR2_PACKAGE_QT_X11),y)
+### Embedded options
+QT_CONFIGURE_OPTS += -no-gfx-qnx -no-kbd-qnx -no-mouse-qnx
+
 ### Display drivers
 ifeq ($(BR2_PACKAGE_QT_GFX_LINUXFB),y)
 QT_CONFIGURE_OPTS += -qt-gfx-linuxfb
@@ -197,6 +201,12 @@ else
 QT_CONFIGURE_OPTS += -no-kbd-qvfb
 endif
 
+else
+### X11 options
+QT_CONFIGURE_OPTS += -no-gtkstyle -no-openvg -no-glib --disable-script
+endif
+
+
 ifeq ($(BR2_PACKAGE_QT_DEBUG),y)
 QT_CONFIGURE_OPTS += -debug
 else
@@ -236,7 +246,12 @@ else
 QT_EMB_PLATFORM = generic
 endif
 
+ifneq ($(BR2_PACKAGE_QT_X11),y)
 QT_CONFIGURE_OPTS += -embedded $(QT_EMB_PLATFORM)
+else
+QT_CONFIGURE_OPTS += -xplatform linux-$(QT_EMB_PLATFORM)-g++ -v
+QT_DEPENDENCIES   += fontconfig xlib_libXi xlib_libX11 xlib_libXrender xlib_libXcursor xlib_libXinerama xlib_libXrandr xlib_libXext xlib_libXv
+endif
 
 ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 QT_CONFIGURE_OPTS += -no-gui
@@ -453,7 +468,11 @@ endif
 # End of workaround.
 
 # Variable for other Qt applications to use
+ifneq ($(BR2_PACKAGE_QT_X11),y)
 QT_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
+else
+QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec linux-$(QT_EMB_PLATFORM)-g++
+endif
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set <variable> = <value> in
@@ -467,10 +486,26 @@ QT_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 # E.G. use like this:
 # $(call QT_QMAKE_SET,variable,value,directory)
 ################################################################################
+ifneq ($(BR2_PACKAGE_QT_X11),y)
 define QT_QMAKE_SET
 	$(SED) '/$(1)/d' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 	$(SED) '/include.*qws.conf/a$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 endef
+else
+define QT_QMAKE_SET
+	$(SED) '/$(1)/d' $(3)/mkspecs/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '/load(qt_config)/i$(1) = $(2)' $(3)/mkspecs/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT_X11),y)
+define QT_CONFIGURE_MKSPECS
+	cp -R $(@D)/mkspecs/linux-g++ $(@D)/mkspecs/linux-$(QT_EMB_PLATFORM)-g++
+	$(call QT_QMAKE_SET,QMAKE_INCDIR_X11,$(STAGING_DIR)/usr/X11R6/include,$(@D))
+	$(call QT_QMAKE_SET,QMAKE_LIBDIR,$(STAGING_DIR)/lib/ $(STAGING_DIR)/usr/lib/,$(@D))
+	$(call QT_QMAKE_SET,QMAKE_LIBDIR_X11,$(STAGING_DIR)/lib/ $(STAGING_DIR)/usr/lib/,$(@D))
+endef
+endif
 
 ifneq ($(BR2_INET_IPV6),y)
 define QT_CONFIGURE_IPV6
@@ -487,6 +522,7 @@ endif
 
 define QT_CONFIGURE_CMDS
 	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) confclean
+	$(QT_CONFIGURE_MKSPECS)
 	$(QT_CONFIGURE_IPV6)
 	$(QT_CONFIGURE_CONFIG_FILE)
 	# Fix compiler path
-- 
1.8.5.3
