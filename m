From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 21:57:25 +0200
Subject: [Buildroot] [PATCHv5 11/14] qt5/qt5multimedia: new package
In-Reply-To: <1365364648-30568-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365364648-30568-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365364648-30568-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                      |    1 +
 package/qt5/qt5multimedia/Config.in        |   16 +++++++++
 package/qt5/qt5multimedia/qt5multimedia.mk |   49 ++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 package/qt5/qt5multimedia/Config.in
 create mode 100644 package/qt5/qt5multimedia/qt5multimedia.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index fe85ee6..7dff33f 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -20,6 +20,7 @@ source "package/qt5/qt5declarative/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5jsbackend/Config.in"
+source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
new file mode 100644
index 0000000..fd36672
--- /dev/null
+++ b/package/qt5/qt5multimedia/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_QT5MULTIMEDIA
+	bool "qt5multimedia"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5DECLARATIVE
+	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5multimedia module.
+
+	  http://qt-project.org
+
+comment "qt5multimedia requires an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
new file mode 100644
index 0000000..6725701
--- /dev/null
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -0,0 +1,49 @@
+#############################################################
+#
+# qt5multimedia
+#
+#############################################################
+
+QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
+QT5MULTIMEDIA_SITE = http://releases.qt-project.org/qt5/$(QT5MULTIMEDIA_VERSION)/submodules_tar/
+QT5MULTIMEDIA_SOURCE = qtmultimedia-opensource-src-$(QT5MULTIMEDIA_VERSION).tar.xz
+QT5MULTIMEDIA_DEPENDENCIES = qt5base qt5declarative
+QT5MULTIMEDIA_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5MULTIMEDIA_CONFIGURE_OPTS += -opensource -confirm-license
+QT5MULTIMEDIA_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
+else
+QT5MULTIMEDIA_LICENSE = Commercial license
+QT5MULTIMEDIA_REDISTRIBUTE = NO
+endif
+
+define QT5MULTIMEDIA_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5MULTIMEDIA_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Multimedia*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
+endef
+endif
+
+define QT5MULTIMEDIA_INSTALL_TARGET_CMDS
+	cp -dpfr $(STAGING_DIR)/usr/qml/* $(TARGET_DIR)/usr/qml
+	$(QT5MULTIMEDIA_INSTALL_TARGET_LIBS)
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
