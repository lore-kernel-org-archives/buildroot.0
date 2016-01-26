From: David Picard <davepiq@yahoo.fr>
Date: Tue, 26 Jan 2016 10:04:20 +0100
Subject: [Buildroot] [PATCH 1/2] Qwt package : added dependency to Qt5
	besides Qt.
Message-ID: <1453799061-7131-1-git-send-email-davepiq@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replaced the original select by depends on, due to recursive dependencies
involving qt5base. Qwt optional modules not tested.

Signed-off-by: David Picard <davepiq@yahoo.fr>
---
 package/qwt/Config.in | 20 +++++++++++++-------
 package/qwt/qwt.mk    | 16 +++++++++++++++-
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 8c7bc56..40b382b 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
-	depends on BR2_PACKAGE_QT
-	depends on BR2_PACKAGE_QT_GUI_MODULE
+	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5BASE
+	depends on BR2_PACKAGE_QT_GUI_MODULE || BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5BASE
 	help
 	  Qwt is a graphics extension to the Qt GUI application
 	  framework. It provides a 2D plotting widget and more.
@@ -12,7 +13,8 @@ if BR2_PACKAGE_QWT
 
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
-	select BR2_PACKAGE_QT_SVG
+	depends on BR2_PACKAGE_QT_SVG || BR2_PACKAGE_QT5SVG
+
 
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
@@ -21,10 +23,14 @@ config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_QT_OPENGL_ES
+	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5BASE
+
+comment "SVG support depends on Qt or Qt5 SVG module"
+	depends on !BR2_PACKAGE_QT_SVG && !BR2_PACKAGE_QT5SVG
 
 endif
 
-comment "qwt depends on QT gui module"
-	depends on BR2_PACKAGE_QT
-	depends on !BR2_PACKAGE_QT_GUI_MODULE
+comment "qwt depends on Qt or Qt5 gui module"
+	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5BASE
+	depends on !BR2_PACKAGE_QT_GUI_MODULE && !BR2_PACKAGE_QT5BASE_GUI
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 8a46c25..cdb3008 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -8,7 +8,14 @@ QWT_VERSION = 6.1.2
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
-QWT_DEPENDENCIES = qt
+ifeq ($(BR2_PACKAGE_QT),y)
+QWT_DEPENDENCIES += qt
+endif
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+QWT_DEPENDENCIES += qt5base
+QT5_MAKE = $(HOST_DIR)/usr/bin/qmake -spec $(HOST_DIR)/mkspecs/devices/linux-buildroot-g++
+endif
+
 
 QWT_LICENSE = LGPLv2.1 with exceptions
 QWT_LICENSE_FILES = COPYING
@@ -35,10 +42,17 @@ else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/\# QWT_CONFIG += QwtOpenGL/'
 endif
 
+ifeq ($(BR2_PACKAGE_QT),y)
 define QWT_CONFIGURE_CMDS
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
 endef
+else
+define QWT_CONFIGURE_CMDS
+	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
+endef
+endif
 
 define QWT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-- 
1.9.1
