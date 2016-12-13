From: Andreas Naumann <anaumann@ultratronik.de>
Date: Tue, 13 Dec 2016 15:59:30 +0100
Subject: [Buildroot] [PATCH v3 6/7] qt5declarative: enable Quick for non-GL
	platforms
In-Reply-To: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1481641171-10407-7-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

However, some modules provide less functionality without OpenGL, so install
steps have to be limited for the softrender only backend:
- qtmultimedia does not provide qml

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5declarative/Config.in       | 6 +-----
 package/qt5/qt5multimedia/qt5multimedia.mk | 3 +++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 6f89dda..233220e 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -14,13 +14,9 @@ config BR2_PACKAGE_QT5DECLARATIVE
 
 if BR2_PACKAGE_QT5DECLARATIVE
 
-comment "quick module needs an OpenGL-capable backend"
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
-
 config BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	bool "quick module"
-	select BR2_PACKAGE_QT5BASE_OPENGL
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5_GL_AVAILABLE
 
 config BR2_PACKAGE_QT5DECLARATIVE_EXAMPLES
 	bool "qt5 declarative examples"
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index e5faa4c..6eb8dca 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -63,11 +63,14 @@ define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
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
 
 define QT5MULTIMEDIA_INSTALL_TARGET_CMDS
 	$(QT5MULTIMEDIA_INSTALL_TARGET_LIBS)
-- 
1.9.1
