From: David Picard <davepiq@yahoo.fr>
Date: Tue, 26 Jan 2016 10:04:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/qwt : fixed dependencies to qt5
In-Reply-To: <1453799061-7131-1-git-send-email-davepiq@yahoo.fr>
References: <1453799061-7131-1-git-send-email-davepiq@yahoo.fr>
Message-ID: <1453799061-7131-2-git-send-email-davepiq@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Set dependencies to qt5 instead of qt5base.
- Use the same SVG select scheme for qt and qt5.
- Moved the dependency to OpenGL libraries from Config.in to qwt.mk for both
  qt and qt5, to make things less cumbersome.

Qwt optional modules not tested.

Signed-off-by: David Picard <davepiq@yahoo.fr>
---
 package/qwt/Config.in | 20 ++++++++------------
 package/qwt/qwt.mk    |  4 ++--
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 40b382b..31a79fe 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
-	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5BASE
-	depends on BR2_PACKAGE_QT_GUI_MODULE || BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5BASE
+	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
 	help
 	  Qwt is a graphics extension to the Qt GUI application
 	  framework. It provides a 2D plotting widget and more.
@@ -13,7 +14,8 @@ if BR2_PACKAGE_QWT
 
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
-	depends on BR2_PACKAGE_QT_SVG || BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_QT_SVG if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
 
 
 config BR2_PACKAGE_QWT_MATHML
@@ -23,14 +25,8 @@ config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5BASE
-
-comment "SVG support depends on Qt or Qt5 SVG module"
-	depends on !BR2_PACKAGE_QT_SVG && !BR2_PACKAGE_QT5SVG
 
 endif
 
-comment "qwt depends on Qt or Qt5 gui module"
-	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5BASE
-	depends on !BR2_PACKAGE_QT_GUI_MODULE && !BR2_PACKAGE_QT5BASE_GUI
+comment "qwt needs Qt or Qt5"
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index cdb3008..6c99c50 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -9,10 +9,10 @@ QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT),y)
-QWT_DEPENDENCIES += qt
+QWT_DEPENDENCIES += qt libgles libegl
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE),y)
-QWT_DEPENDENCIES += qt5base
+QWT_DEPENDENCIES += qt5base libgles
 QT5_MAKE = $(HOST_DIR)/usr/bin/qmake -spec $(HOST_DIR)/mkspecs/devices/linux-buildroot-g++
 endif
 
-- 
1.9.1
