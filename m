From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 09:28:10 +0300
Subject: [Buildroot] [PATCH 2/5] qt5quickcontrols: new package
In-Reply-To: <1379485693-822-1-git-send-email-fatih.asici@gmail.com>
References: <1379485693-822-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1379485693-822-3-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/Config.in                            |    1 +
 package/qt5/qt5quickcontrols/Config.in           |   20 ++++++++++++
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk |   37 ++++++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 package/qt5/qt5quickcontrols/Config.in
 create mode 100644 package/qt5/qt5quickcontrols/qt5quickcontrols.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 2945d96..b5b742c 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -22,6 +22,7 @@ source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5jsbackend/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quick1/Config.in"
+source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5webkit/Config.in"
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
new file mode 100644
index 0000000..3d80630
--- /dev/null
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_QT5QUICKCONTROLS
+	bool "qt5quickcontrols"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_QT5DECLARATIVE
+	# qt5declarative -> qt5jsbackend
+	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5quickcontrols module.
+
+	  http://qt-project.org
+
+comment "qt5quickcontrols requires an OpenGL-capable backend"
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+		BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
new file mode 100644
index 0000000..f9008b4
--- /dev/null
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# qt5quickcontrols
+#
+################################################################################
+
+QT5QUICKCONTROLS_VERSION = $(QT5_VERSION)
+QT5QUICKCONTROLS_SITE = $(QT5_SITE)
+QT5QUICKCONTROLS_SOURCE = qtquickcontrols-opensource-src-$(QT5QUICKCONTROLS_VERSION).tar.xz
+QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
+QT5QUICKCONTROLS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5QUICKCONTROLS_LICENSE = LGPLv2.1 or GPLv3.0
+QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+else
+QT5QUICKCONTROLS_LICENSE = Commercial license
+QT5QUICKCONTROLS_REDISTRIBUTE = NO
+endif
+
+define QT5QUICKCONTROLS_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5QUICKCONTROLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5QUICKCONTROLS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick $(TARGET_DIR)/usr/qml
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
