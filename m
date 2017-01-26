From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 26 Jan 2017 15:04:16 +0100
Subject: [Buildroot] [PATCH v5 05/10] qt5declarative: enable Quick for
	non-GL platforms for Qt 5.8.0
In-Reply-To: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1485439461-4797-6-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Qt 5.8.0 provides a software rasterizer we can enable Quick for non-GL
platforms. However, some modules provide less functionality without OpenGL,
so install steps have to be limited for the softrender only backend:
- qtmultimedia does not provide qml

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5declarative/Config.in       | 6 +++---
 package/qt5/qt5multimedia/qt5multimedia.mk | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index eba4c8d..a8accdb 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -15,11 +15,11 @@ config BR2_PACKAGE_QT5DECLARATIVE
 if BR2_PACKAGE_QT5DECLARATIVE
 
 comment "quick module needs an OpenGL-capable backend"
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_QT5_VERSION_5_6
 
 config BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	bool "quick module"
-	select BR2_PACKAGE_QT5BASE_OPENGL
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_QT5_VERSION_5_8
 
 endif
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 7ce947a..b11b8d1 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -58,11 +58,14 @@ define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
 endef
 endif
 
+# QtMultimedia QMLs have a hard dependency on OpenGL -> not available for softraster backends
+ifeq ($(BR2_PACKAGE_QT5_GL_AVAILABLE),y)
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtMultimedia $(TARGET_DIR)/usr/qml/
 endef
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 define QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES
-- 
1.9.1
