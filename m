From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 23:11:57 +0100
Subject: [Buildroot] [git commit] package/qwt: prepare package to support
	other versions of Qt
Message-ID: <20160325094639.2C2C081D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab9aa9b0622ee15960b1c451f221d50852a7752d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rework the selection of Qt options in the qwt package to make it
easier to support other versions of Qt than just Qt4. Instead of
depending on Qt options, we select the ones we need, and simply have a
global "depends on BR2_PACKAGE_QT". This also allows to remove a
comment that becomes useless.

Signed-off-by: David Picard <davepiq@yahoo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qwt/Config.in | 10 +++-------
 package/qwt/qwt.mk    |  5 ++++-
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 8c7bc56..876d465 100644
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
@@ -12,7 +12,7 @@ if BR2_PACKAGE_QWT
 
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
-	select BR2_PACKAGE_QT_SVG
+	select BR2_PACKAGE_QT_SVG if BR2_PACKAGE_QT
 
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
@@ -21,10 +21,6 @@ config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_QT_OPENGL_ES
+	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
 
 endif
-
-comment "qwt depends on QT gui module"
-	depends on BR2_PACKAGE_QT
-	depends on !BR2_PACKAGE_QT_GUI_MODULE
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 8a46c25..4d481fb 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -8,7 +8,10 @@ QWT_VERSION = 6.1.2
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
+ifeq ($(BR2_PACKAGE_QT),y)
 QWT_DEPENDENCIES = qt
+QWT_QMAKE = $(QT_QMAKE)
+endif
 
 QWT_LICENSE = LGPLv2.1 with exceptions
 QWT_LICENSE_FILES = COPYING
@@ -37,7 +40,7 @@ endif
 
 define QWT_CONFIGURE_CMDS
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QWT_QMAKE))
 endef
 
 define QWT_BUILD_CMDS
