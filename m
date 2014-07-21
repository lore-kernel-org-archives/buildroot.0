From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:58:43 +0200
Subject: [Buildroot] [git commit] qt5declarative: add an option for quick
	module
Message-ID: <20140721195948.3890D9D2A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=984c834e682aeee8ddd6756f230b198063998986
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this change, qt5declarative can be built without OpenGL.

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5declarative/Config.in         |   17 +++++++++++------
 package/qt5/qt5declarative/qt5declarative.mk |   12 ++++++++++--
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 4a6e805..edac8cd 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -3,9 +3,6 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5XMLPATTERNS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_EGLFS
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -15,6 +12,14 @@ config BR2_PACKAGE_QT5DECLARATIVE
 
 	  http://qt-project.org
 
-comment "qt5declarative requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES) && \
-		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+if BR2_PACKAGE_QT5DECLARATIVE
+
+comment "quick module needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+
+config BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	bool "quick module"
+	select BR2_PACKAGE_QT5BASE_OPENGL
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+
+endif
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 472d092..34dd14a 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -35,12 +35,20 @@ define QT5DECLARATIVE_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
-define QT5DECLARATIVE_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Qml*.so.* $(TARGET_DIR)/usr/lib
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5DECLARATIVE_INSTALL_TARGET_QUICK_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Quick*.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/accessible $(TARGET_DIR)/usr/lib/qt/plugins
+endef
+endif
+
+define QT5DECLARATIVE_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Qml*.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/qml* $(TARGET_DIR)/usr/lib/qt/plugins
+	$(QT5DECLARATIVE_INSTALL_TARGET_QUICK_LIBS)
 endef
+
 endif
 
 define QT5DECLARATIVE_INSTALL_TARGET_CMDS
