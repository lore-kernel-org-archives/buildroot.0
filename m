From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Mar 2016 10:46:28 +0100
Subject: [Buildroot] [git commit] package/qwt: add support for Qt5.
Message-ID: <20160325094639.3C84B7FA70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a976ee0dc834c56e67e1c832ded00ce23b5ccdb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version of Qwt is compatible with both Qt and Qt5. This patch
adds the option to compile it for Qt5.

Signed-off-by: David Picard <davepiq@yahoo.fr>
[Thomas: slightly adjust the OpenGL dependencies.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qwt/Config.in | 10 +++++++---
 package/qwt/qwt.mk    |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 876d465..6b394e3 100644
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
@@ -13,14 +15,16 @@ if BR2_PACKAGE_QWT
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
 	select BR2_PACKAGE_QT_SVG if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
 
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
 
 config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
-	depends on BR2_PACKAGE_HAS_LIBGLES
-	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on (BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEG && BR2_PACKAGE_QT) || \
+		(BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_PACKAGE_QT5)
 	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5
 
 endif
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 4d481fb..594b141 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -11,6 +11,9 @@ QWT_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT),y)
 QWT_DEPENDENCIES = qt
 QWT_QMAKE = $(QT_QMAKE)
+else ifeq ($(BR2_PACKAGE_QT5),y)
+QWT_DEPENDENCIES += qt5
+QWT_QMAKE = $(QT5_QMAKE)
 endif
 
 QWT_LICENSE = LGPLv2.1 with exceptions
