From: David Picard <davepiq@yahoo.fr>
Date: Wed, 16 Mar 2016 18:37:05 +0100
Subject: [Buildroot] [PATCH 2/2] package/qwt : added support for Qt5.
In-Reply-To: <1458149825-23401-1-git-send-email-davepiq@yahoo.fr>
References: <1458149825-23401-1-git-send-email-davepiq@yahoo.fr>
Message-ID: <1458149825-23401-2-git-send-email-davepiq@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version of Qwt is compatible with both Qt and Qt5. This patch adds the
option to compile it for Qt5.

Signed-off-by: David Picard <davepiq@yahoo.fr>
---
 package/qwt/Config.in | 14 +++++++++-----
 package/qwt/qwt.mk    |  5 +++++
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index e72db31..9dca8ed 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
-	depends on BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
 	help
 	  Qwt is a graphics extension to the Qt GUI application
 	  framework. It provides a 2D plotting widget and more.
@@ -13,6 +15,7 @@ if BR2_PACKAGE_QWT
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
 	select BR2_PACKAGE_QT_SVG if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
 
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
@@ -20,10 +23,11 @@ config BR2_PACKAGE_QWT_MATHML
 config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
 	select BR2_PACKAGE_QT_OPENGL_ES if \
-	    BR2_PACKAGE_QT && BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL
+		BR2_PACKAGE_QT && BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if \
+		BR2_PACKAGE_QT5BASE && BR2_PACKAGE_QT5_GL_AVAILABLE
 
 endif
 
-comment "qwt depends on QT gui module"
-	depends on BR2_PACKAGE_QT
-	depends on !BR2_PACKAGE_QT_GUI_MODULE
+comment "qwt needs Qt or Qt5"
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index afd0ffb..8fbde32 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -11,6 +11,9 @@ QWT_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT),y)
 QWT_DEPENDENCIES = qt libgles libegl
 endif
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+QWT_DEPENDENCIES += qt5base libgles
+endif
 
 QWT_LICENSE = LGPLv2.1 with exceptions
 QWT_LICENSE_FILES = COPYING
@@ -39,6 +42,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT),y)
     QWT_QMAKE = $(QT_QMAKE)
+else
+	QWT_QMAKE = $(QT5_QMAKE)
 endif
 
 define QWT_CONFIGURE_CMDS
-- 
1.9.1
