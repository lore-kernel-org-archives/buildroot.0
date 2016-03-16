From: David Picard <davepiq@yahoo.fr>
Date: Wed, 16 Mar 2016 18:37:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/qwt : prepared package for other
	versions of Qt.
Message-ID: <1458149825-23401-1-git-send-email-davepiq@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted the package configuration to make it more generic. It will thus be
easier to handle more than one version of Qt. Indeed, multiple versions of Qt
are compatible with the current Qwt.

Signed-off-by: David Picard <davepiq@yahoo.fr>
---
 package/qwt/Config.in |  9 ++++-----
 package/qwt/qwt.mk    | 10 ++++++++--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 8c7bc56..e72db31 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
 	depends on BR2_PACKAGE_QT
-	depends on BR2_PACKAGE_QT_GUI_MODULE
+	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
 	help
 	  Qwt is a graphics extension to the Qt GUI application
 	  framework. It provides a 2D plotting widget and more.
@@ -12,16 +12,15 @@ if BR2_PACKAGE_QWT
 
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
-	select BR2_PACKAGE_QT_SVG
+	select BR2_PACKAGE_QT_SVG if BR2_PACKAGE_QT
 
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
 
 config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
-	depends on BR2_PACKAGE_HAS_LIBGLES
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_QT_OPENGL_ES
+	select BR2_PACKAGE_QT_OPENGL_ES if \
+	    BR2_PACKAGE_QT && BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL
 
 endif
 
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 8a46c25..afd0ffb 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -8,7 +8,9 @@ QWT_VERSION = 6.1.2
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
-QWT_DEPENDENCIES = qt
+ifeq ($(BR2_PACKAGE_QT),y)
+QWT_DEPENDENCIES = qt libgles libegl
+endif
 
 QWT_LICENSE = LGPLv2.1 with exceptions
 QWT_LICENSE_FILES = COPYING
@@ -35,9 +37,13 @@ else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/\# QWT_CONFIG += QwtOpenGL/'
 endif
 
+ifeq ($(BR2_PACKAGE_QT),y)
+    QWT_QMAKE = $(QT_QMAKE)
+endif
+
 define QWT_CONFIGURE_CMDS
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QWT_QMAKE))
 endef
 
 define QWT_BUILD_CMDS
-- 
1.9.1
