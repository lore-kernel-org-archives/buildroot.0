From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 11:55:04 +0200
Subject: [Buildroot] [git commit] qt5multimedia: make qt5declarative
	dependency optional
Message-ID: <20140720095916.E6F1C9D1E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=342f29b43d046d997d27541400ec44af280fe554
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add missing dependencies on gui and network modules.

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5multimedia/Config.in        |   10 ++--------
 package/qt5/qt5multimedia/qt5multimedia.mk |    6 +++++-
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index c00491c..36128eb 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_QT5MULTIMEDIA
 	bool "qt5multimedia"
 	select BR2_PACKAGE_QT5BASE
-	select BR2_PACKAGE_QT5DECLARATIVE
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBGLES
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_NETWORK
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -12,7 +10,3 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	  This package corresponds to the qt5multimedia module.
 
 	  http://qt-project.org
-
-comment "qt5multimedia requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES) && \
-		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 5eef543..e89e31c 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -7,7 +7,7 @@
 QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
 QT5MULTIMEDIA_SITE = $(QT5_SITE)
 QT5MULTIMEDIA_SOURCE = qtmultimedia-opensource-src-$(QT5MULTIMEDIA_VERSION).tar.xz
-QT5MULTIMEDIA_DEPENDENCIES = qt5base qt5declarative
+QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
@@ -22,6 +22,10 @@ ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
 QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
 endif
 
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
+endif
+
 define QT5MULTIMEDIA_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
