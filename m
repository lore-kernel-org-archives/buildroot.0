From: pierre.lemagourou at openwide.fr <pierre.lemagourou@openwide.fr>
Date: Tue,  4 Nov 2014 11:05:50 +0100
Subject: [Buildroot] [PATCH 1/1] qt5cinex: Add new Qt5CinematicExperience
	package.
Message-ID: <1415095550-26839-1-git-send-email-pierre.lemagourou@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pierre Le Magourou <pierre.lemagourou@openwide.fr>

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@openwide.fr>
---
v0: Initial commit
 qt5cinex is a package for Qt5 Cinematic Experience demo. This
 application demonstrates the power of Qt5 and few of the new additions
 available in QtQuick 2.0.
---
 package/Config.in                                  |  1 +
 package/qt5cinex/Config.in                         | 26 +++++++++
 ...nex-0001-Fix-execution-problem-with-Qt5.3.patch | 62 ++++++++++++++++++++++
 package/qt5cinex/qt5cinex.hash                     |  8 +++
 package/qt5cinex/qt5cinex.mk                       | 37 +++++++++++++
 5 files changed, 134 insertions(+)
 create mode 100644 package/qt5cinex/Config.in
 create mode 100644 package/qt5cinex/qt5cinex-0001-Fix-execution-problem-with-Qt5.3.patch
 create mode 100644 package/qt5cinex/qt5cinex.hash
 create mode 100644 package/qt5cinex/qt5cinex.mk

diff --git a/package/Config.in b/package/Config.in
index 28cf703..d91860c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -190,6 +190,7 @@ comment "Graphic applications"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
 	source "package/mesa3d-demos/Config.in"
+	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
 
 comment "Graphic libraries"
diff --git a/package/qt5cinex/Config.in b/package/qt5cinex/Config.in
new file mode 100644
index 0000000..4490bcd
--- /dev/null
+++ b/package/qt5cinex/Config.in
@@ -0,0 +1,26 @@
+comment "Qt5 Cinematic Experience needs Qt5 graphical effects"
+	depends on !BR2_PACKAGE_QT5GRAPHICALEFFECTS
+
+config BR2_PACKAGE_QT5CINEX
+	bool "Qt5 Cinematic Experience"
+	depends on BR2_PACKAGE_QT5GRAPHICALEFFECTS
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_QT5BASE_PNG
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5BASE_EGLFS
+
+	help
+	  UX demo application that shows some graphical features of Qt5.
+	  The name 'Cinematic Experience' reflects how it's possible to build
+	  user interfaces with increased dynamics.
+
+	  http://quitcoding.com/?page=work#cinex
+
+if BR2_PACKAGE_QT5CINEX
+
+config BR2_PACKAGE_QT5CINEX_RPI
+	bool "RaspberryPI Edition"
+	help
+	  High definifition version of the application optimised for Raspberry PI cards.
+
+endif
diff --git a/package/qt5cinex/qt5cinex-0001-Fix-execution-problem-with-Qt5.3.patch b/package/qt5cinex/qt5cinex-0001-Fix-execution-problem-with-Qt5.3.patch
new file mode 100644
index 0000000..48e0c83
--- /dev/null
+++ b/package/qt5cinex/qt5cinex-0001-Fix-execution-problem-with-Qt5.3.patch
@@ -0,0 +1,62 @@
+From 6ecfcf724522fa37a695a4612f4638c2890d29f9 Mon Sep 17 00:00:00 2001
+From: Pierre Le Magourou <pierre.lemagourou@openwide.fr>
+Date: Thu, 23 Oct 2014 17:41:08 +0200
+Subject: [PATCH] Fix execution problem with Qt5.3.
+
+This patch has been inspired from Open Embedded meta-qt5.
+---
+ content/SettingsView.qml | 4 ++--
+ content/Switch.qml       | 8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/content/SettingsView.qml b/content/SettingsView.qml
+index 7944803..a0ddcc8 100644
+--- a/content/SettingsView.qml
++++ b/content/SettingsView.qml
+@@ -127,8 +127,8 @@ Item {
+             Switch {
+                 text: "Do you l-o-v-e colors?"
+                 checked: settings.showColors
+-                onText: "Yes"
+-                offText: "No!"
++                textON: "Yes"
++                textOFF: "No!"
+                 onCheckedChanged: {
+                     settings.showColors = checked;
+                 }
+diff --git a/content/Switch.qml b/content/Switch.qml
+index 967c03f..66955fc 100644
+--- a/content/Switch.qml
++++ b/content/Switch.qml
+@@ -6,8 +6,8 @@ Item {
+ 
+     property alias text: textItem.text
+     property bool checked: false
+-    property string onText: "On"
+-    property string offText: "Off"
++    property string textON: "On"
++    property string textOFF: "Off"
+ 
+     QtObject {
+         id: priv
+@@ -120,7 +120,7 @@ Item {
+             color: "#000000"
+             font.pixelSize: 18
+             font.bold: true
+-            text: onText
++            text: textON
+         }
+         Text {
+             anchors.verticalCenter: parent.verticalCenter
+@@ -129,7 +129,7 @@ Item {
+             color: "#ffffff"
+             font.pixelSize: 18
+             font.bold: true
+-            text: offText
++            text: textOFF
+         }
+ 
+         Image {
+-- 
+2.1.1
+
diff --git a/package/qt5cinex/qt5cinex.hash b/package/qt5cinex/qt5cinex.hash
new file mode 100644
index 0000000..e84c31d
--- /dev/null
+++ b/package/qt5cinex/qt5cinex.hash
@@ -0,0 +1,8 @@
+# No upstream hashes for this file.
+sha256 0dd602983ced5f7c0cfd5ad0fbfe2b0b7e3c9ff715e4ef23eef818ccc2b6c60b Qt5_CinematicExperience_rpi_1.0.tgz
+sha1   a68d7c5f133d380f9a8b85cfd617deb6b8cc99e2                         Qt5_CinematicExperience_rpi_1.0.tgz
+md5    935a5db0a6b2a72c67236e72f52be7d1                                 Qt5_CinematicExperience_rpi_1.0.tgz
+
+sha256 0e547e0259667915a24e84ade5efdcd0c553f81786734452c2c8dbce19a19f44 Qt5_CinematicExperience_1.0.tgz
+sha1   8c746a64c458b5c9ff3c6d01f284875d3aa11dcb                         Qt5_CinematicExperience_1.0.tgz
+md5    1c4f9bf5411c985fc5d3dbfc5d826a29                                 Qt5_CinematicExperience_1.0.tgz
diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
new file mode 100644
index 0000000..3bedf9c
--- /dev/null
+++ b/package/qt5cinex/qt5cinex.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# qt5cinex
+#
+################################################################################
+
+QT5CINEX_VERSION = 1.0
+QT5CINEX_RPI = ""
+QT5CINEX_SITE = http://quitcoding.com/download/
+
+ifeq ($(BR2_PACKAGE_QT5CINEX_RPI),y)
+	QT5CINEX_RPI = "rpi_"
+endif
+
+QT5CINEX_SOURCE = Qt5_CinematicExperience_$(QT5CINEX_RPI)$(QT5CINEX_VERSION).tgz
+QT5CINEX_DEPENDENCIES = qt5base qt5declarative
+
+QT5CINEX_LICENSE = CC-BY-3.0
+QT5CINEX_LICENSE_FILE = README
+
+define QT5CINEX_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5CINEX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5CINEX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/Qt5_CinematicExperience \
+	  $(TARGET_DIR)/opt/Qt5_CinematicExperience/Qt5_CinematicExperience
+	$(INSTALL) -D -m 0664 $(@D)/Qt5_CinematicExperience.qml \
+	  $(TARGET_DIR)/opt/Qt5_CinematicExperience/Qt5_CinematicExperience.qml
+	cp -dpfr $(@D)/content $(TARGET_DIR)/opt/Qt5_CinematicExperience/content
+endef
+
+$(eval $(generic-package))
-- 
2.1.1
