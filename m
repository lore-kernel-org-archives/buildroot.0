From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 14 Oct 2011 15:51:57 +0100
Subject: [Buildroot] [PATCH 5/9] Support for compiling Qt for X11
In-Reply-To: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1318603921-22899-6-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch enables you to cross compile the X11 version of Qt. Although cross compilation of Qt is not officially supported it works well and allows Qt to be build for a target running X11

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/qt/Config.in |   12 ++++++++++++
 package/qt/qt.mk     |   44 +++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index ab231d9..513f135 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -11,6 +11,14 @@ menuconfig BR2_PACKAGE_QT
 
 if BR2_PACKAGE_QT
 
+comment "Qt will be built for use with an X server"
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+
+config BR2_PACKAGE_QT_X11
+	bool
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+	default y
+
 config BR2_PACKAGE_QT_DEBUG
 	bool "Compile with debug support"
 	help
@@ -85,6 +93,7 @@ config BR2_PACKAGE_QT_GUI_MODULE
 	  video output, or you don't require Qt GUI, say n.
 
 if BR2_PACKAGE_QT_GUI_MODULE
+if !BR2_PACKAGE_QT_X11
 menu "Pixel depths"
 comment "Deselecting each option leads to Qt's default (8,16,32)"
 
@@ -165,6 +174,7 @@ config BR2_PACKAGE_QT_SYSTEMFREETYPE
 	  Use shared libfreetype from the target system.
 	  See http://www.freetype.org/
 endchoice
+endif # !BR2_PACKAGE_QT_X11
 
 config BR2_PACKAGE_QT_GIF
 	bool "Enable GIF support"
@@ -255,9 +265,11 @@ endchoice
 
 source "package/qt/Config.sql.in"
 if BR2_PACKAGE_QT_GUI_MODULE
+if !BR2_PACKAGE_QT_X11
 source "package/qt/Config.gfx.in"
 source "package/qt/Config.mouse.in"
 source "package/qt/Config.keyboard.in"
+endif # !BR2_PACKAGE_QT_X11
 
 config BR2_PACKAGE_QT_PHONON
 	bool "Phonon Module"
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index cc035bf..a36fcb6 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -96,6 +96,10 @@ ifneq ($(QT_PIXEL_DEPTHS),)
 QT_CONFIGURE_OPTS += -depths $(subst $(space),$(comma),$(strip $(QT_PIXEL_DEPTHS)))
 endif
 
+ifneq ($(BR2_PACKAGE_QT_X11),y)
+### Embedded options
+QT_CONFIGURE_OPTS += -no-gfx-qnx -no-kbd-qnx -no-mouse-qnx
+
 ### Display drivers
 ifeq ($(BR2_PACKAGE_QT_GFX_LINUXFB),y)
 QT_CONFIGURE_OPTS += -qt-gfx-linuxfb
@@ -129,7 +133,6 @@ else
 QT_CONFIGURE_OPTS += -no-gfx-directfb
 endif
 
-
 ### Mouse drivers
 ifeq ($(BR2_PACKAGE_QT_MOUSE_PC),y)
 QT_CONFIGURE_OPTS += -qt-mouse-pc
@@ -178,6 +181,11 @@ else
 QT_CONFIGURE_OPTS += -no-kbd-qvfb
 endif
 
+else
+### X11 options
+QT_CONFIGURE_OPTS += -no-gtkstyle -no-opengl -no-openvg -no-glib --disable-script
+endif
+
 ifeq ($(BR2_PACKAGE_QT_DEBUG),y)
 QT_CONFIGURE_OPTS += -debug
 else
@@ -216,7 +224,12 @@ else
 QT_EMB_PLATFORM = generic
 endif
 
+ifneq ($(BR2_PACKAGE_QT_X11),y)
 QT_CONFIGURE_OPTS += -embedded $(QT_EMB_PLATFORM)
+else
+QT_CONFIGURE_OPTS += -xplatform linux-$(QT_EMB_PLATFORM)-g++ -arch i386
+QT_DEPENDENCIES   += xserver_xorg-server
+endif
 
 ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 QT_CONFIGURE_OPTS += -no-gui
@@ -415,6 +428,12 @@ else
 QT_CONFIGURE_OPTS += -no-declarative
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+QT_CONFIGURE_OPTS += -xinerama
+else
+QT_CONFIGURE_OPTS += -no-xinerama
+endif
+
 # ccache and precompiled headers don't play well together
 ifeq ($(BR2_CCACHE),y)
 QT_CONFIGURE_OPTS += -no-pch
@@ -431,7 +450,11 @@ endif
 # End of workaround.
 
 # Variable for other Qt applications to use
+ifneq ($(BR2_PACKAGE_QT_X11),y)
 QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
+else
+QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec linux-$(QT_EMB_PLATFORM)-g++
+endif
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set QMAKE_<variable> = <value> in
@@ -445,10 +468,24 @@ QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 # E.G. use like this:
 # $(call QT_QMAKE_SET,variable,value,directory)
 ################################################################################
+ifneq ($(BR2_PACKAGE_QT_X11),y)
 define QT_QMAKE_SET
 	$(SED) '/QMAKE_$(1)/d' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 	$(SED) '/include.*qws.conf/aQMAKE_$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 endef
+else
+define QT_QMAKE_SET
+	$(SED) '/QMAKE_$(1)/d' $(3)/mkspecs/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '/include.*linux.conf/aQMAKE_$(1) = $(2)' $(3)/mkspecs/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT_X11),y)
+define QT_CONFIGURE_MKSPECS
+	cp -R $(@D)/mkspecs/linux-g++ $(@D)/mkspecs/linux-$(QT_EMB_PLATFORM)-g++
+	$(call QT_QMAKE_SET,INCDIR_X11,$(STAGING_DIR)/usr/X11R6/include,$(@D))
+endef
+endif
 
 ifneq ($(BR2_INET_IPV6),y)
 define QT_CONFIGURE_IPV6
@@ -465,6 +502,7 @@ endif
 
 define QT_CONFIGURE_CMDS
 	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) confclean
+	$(QT_CONFIGURE_MKSPECS)
 	$(QT_CONFIGURE_IPV6)
 	$(QT_CONFIGURE_CONFIG_FILE)
 	# Fix compiler path
@@ -489,10 +527,6 @@ define QT_CONFIGURE_CMDS
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
 		$(QT_CONFIGURE_OPTS) \
-		-no-gfx-qnx \
-		-no-kbd-qnx \
-		-no-mouse-qnx \
-		-no-xinerama \
 		-no-cups \
 		-no-nis \
 		-no-accessibility \
-- 
1.7.2.5
