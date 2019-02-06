From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:45:57 +0100
Subject: [Buildroot] [git commit] package/qwt: remove qt4 support
Message-ID: <20190206145217.21E9C8040D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e99c8418af904b14b01455d68c84d7b5afd261f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt4 support is about to be dropped, so remove the support from qwt as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qwt/Config.in | 20 ++++++++------------
 package/qwt/qwt.mk    | 10 ++--------
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 041c2d102c..f4132c8638 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
-	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
-	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_WIDGETS # printsupport
+	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	help
 	  Qwt is a graphics extension to the Qt GUI application
 	  framework. It provides a 2D plotting widget and more.
@@ -15,18 +14,15 @@ if BR2_PACKAGE_QWT
 
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
-	select BR2_PACKAGE_QT_SVG if BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5SVG
 
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
 
 config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
-	depends on (BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_QT) || \
-		(BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_PACKAGE_QT5)
-	select BR2_PACKAGE_QT_OPENGL if BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	select BR2_PACKAGE_QT5BASE_OPENGL
+	select BR2_PACKAGE_QT5BASE_OPENGL_LIB
 
 endif
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 619453bfc9..f381ebbb7a 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -8,13 +8,7 @@ QWT_VERSION = 6.1.3
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
-ifeq ($(BR2_PACKAGE_QT),y)
-QWT_DEPENDENCIES = qt
-QWT_QMAKE = $(QT_QMAKE)
-else ifeq ($(BR2_PACKAGE_QT5),y)
-QWT_DEPENDENCIES += qt5base
-QWT_QMAKE = $(QT5_QMAKE)
-endif
+QWT_DEPENDENCIES = qt5base
 
 QWT_LICENSE = LGPL-2.1 with exceptions
 QWT_LICENSE_FILES = COPYING
@@ -49,7 +43,7 @@ endif
 
 define QWT_CONFIGURE_CMDS
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QWT_QMAKE))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QWT_BUILD_CMDS
