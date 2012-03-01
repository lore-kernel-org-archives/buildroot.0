From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Thu,  1 Mar 2012 01:37:54 -0200
Subject: [Buildroot] [PATCH] qt: X11 support
Message-ID: <1330573074-12118-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
 package/qt/Config.gfx.in      |    4 ++++
 package/qt/Config.in          |   14 ++++++++++++++
 package/qt/Config.keyboard.in |    4 ++++
 package/qt/Config.mouse.in    |    4 ++++
 package/qt/qt.mk              |   12 +++++++++---
 5 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/package/qt/Config.gfx.in b/package/qt/Config.gfx.in
index dc70665..2fecd51 100644
--- a/package/qt/Config.gfx.in
+++ b/package/qt/Config.gfx.in
@@ -1,3 +1,5 @@
+if BR2_PACKAGE_QT_GUI_QWS
+
 menu "Graphics drivers"
 
 config BR2_PACKAGE_QT_GFX_LINUXFB
@@ -24,3 +26,5 @@ config BR2_PACKAGE_QT_GFX_DIRECTFB
 	bool "directFB"
 
 endmenu
+
+endif
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 3a552d0..a982170 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -85,6 +85,20 @@ config BR2_PACKAGE_QT_GUI_MODULE
 	  video output, or you don't require Qt GUI, say n.
 
 if BR2_PACKAGE_QT_GUI_MODULE
+
+choice
+	prompt "GUI Backend"
+	help
+	  Select the graphic system, used to arbitrate screen access.
+
+config BR2_PACKAGE_QT_GUI_QWS
+	bool "QWS"
+	default y
+
+config BR2_PACKAGE_QT_GUI_X11
+	bool "X11"
+endchoice
+
 menu "Pixel depths"
 comment "Deselecting each option leads to Qt's default (8,16,32)"
 
diff --git a/package/qt/Config.keyboard.in b/package/qt/Config.keyboard.in
index b042547..4c67c0d 100644
--- a/package/qt/Config.keyboard.in
+++ b/package/qt/Config.keyboard.in
@@ -1,3 +1,5 @@
+if BR2_PACKAGE_QT_GUI_QWS
+
 menu "Keyboard drivers"
 
 config BR2_PACKAGE_QT_KEYBOARD_TTY
@@ -10,3 +12,5 @@ config BR2_PACKAGE_QT_KEYBOARD_QVFB
 	bool "qvfb"
 
 endmenu
+
+endif
diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
index 16c41c1..6f0d715 100644
--- a/package/qt/Config.mouse.in
+++ b/package/qt/Config.mouse.in
@@ -1,3 +1,5 @@
+if BR2_PACKAGE_QT_GUI_QWS
+
 menu "Mouse drivers"
 
 config BR2_PACKAGE_QT_MOUSE_PC
@@ -23,3 +25,5 @@ config BR2_PACKAGE_QT_MOUSE_NO_QWS_CURSOR
 	  Do not show the mouse cursor in QWS.
 
 endmenu
+
+endif
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 776eb63..c6fd292 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -220,7 +220,14 @@ else
 QT_EMB_PLATFORM = generic
 endif
 
+ifeq ($(BR2_PACKAGE_QT_GUI_X11),y)
+QT_SPEC = linux-g++
+QT_CONFIGURE_OPTS += -xplatform linux-g++ -arch $(QT_EMB_PLATFORM)
+else
+QT_SPEC = qws/linux-$(QT_EMB_PLATFORM)-g++
 QT_CONFIGURE_OPTS += -embedded $(QT_EMB_PLATFORM)
+endif
+
 
 ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 QT_CONFIGURE_OPTS += -no-gui
@@ -433,7 +440,7 @@ endif
 # End of workaround.
 
 # Variable for other Qt applications to use
-QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
+QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec $(QT_SPEC)
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set <variable> = <value> in
@@ -448,8 +455,7 @@ QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 # $(call QT_QMAKE_SET,variable,value,directory)
 ################################################################################
 define QT_QMAKE_SET
-	$(SED) '/$(1)/d' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '/include.*qws.conf/a$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '/$(1)/d;/^load(qt_config)/i$(1) = $(2)' $(3)/mkspecs/$(QT_SPEC)/qmake.conf
 endef
 
 ifneq ($(BR2_INET_IPV6),y)
-- 
1.7.9.1
