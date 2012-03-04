From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun,  4 Mar 2012 01:06:41 -0200
Subject: [Buildroot] [PATCHv2] qt: X11 support
Message-ID: <1330830401-1736-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also reworked the QT_QMAKE_SET macro, to make it work on all qmakespecs.

Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
 package/qt/Config.in |   22 ++++++++++++++++++++++
 package/qt/qt.mk     |   12 +++++++++---
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 3a552d0..ab0fc18 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -85,6 +85,26 @@ config BR2_PACKAGE_QT_GUI_MODULE
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
+	default y if !BR2_PACKAGE_XORG7
+	help
+	  QWS is a compact and efficient windowing system. Using it, Qt-based
+	  applications write directly to the Linux framebuffer, eliminating the
+	  need for the X Window System.
+
+config BR2_PACKAGE_QT_GUI_X11
+	depends on BR2_PACKAGE_XORG7
+	bool "X Window System"
+	default y if BR2_PACKAGE_XORG7
+endchoice
+
 menu "Pixel depths"
 comment "Deselecting each option leads to Qt's default (8,16,32)"
 
@@ -255,9 +275,11 @@ endchoice
 
 source "package/qt/Config.sql.in"
 if BR2_PACKAGE_QT_GUI_MODULE
+if BR2_PACKAGE_QT_GUI_QWS
 source "package/qt/Config.gfx.in"
 source "package/qt/Config.mouse.in"
 source "package/qt/Config.keyboard.in"
+endif
 
 config BR2_PACKAGE_QT_PHONON
 	bool "Phonon Module"
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
