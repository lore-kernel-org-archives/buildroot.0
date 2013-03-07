From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:55 +0100
Subject: [Buildroot] [PATCH 27/32] qt5/qt5declarative: new package
In-Reply-To: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362687540-19440-28-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                        |    1 +
 package/qt5/qt5declarative/Config.in         |   18 ++++++++++
 package/qt5/qt5declarative/qt5declarative.mk |   48 ++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 package/qt5/qt5declarative/Config.in
 create mode 100644 package/qt5/qt5declarative/qt5declarative.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 8a4ed53..ff98b9e 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -15,6 +15,7 @@ menuconfig BR2_PACKAGE_QT5
 
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
+source "package/qt5/qt5declarative/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5jsbackend/Config.in"
 source "package/qt5/qt5script/Config.in"
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
new file mode 100644
index 0000000..f862b94
--- /dev/null
+++ b/package/qt5/qt5declarative/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_QT5DECLARATIVE
+	bool "qt5declarative"
+	select BR2_PACKAGE_QT5XMLPATTERNS
+	select BR2_PACKAGE_QT5JSBACKEND
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_EGLFS
+	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5declarative module.
+
+	  http://qt-project.org
+
+comment "qt5declarative requires an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
new file mode 100644
index 0000000..02fae6a
--- /dev/null
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -0,0 +1,48 @@
+#############################################################
+#
+# qt5declarative
+#
+#############################################################
+
+QT5DECLARATIVE_VERSION = $(QT5_VERSION)
+QT5DECLARATIVE_SITE = http://releases.qt-project.org/qt5/$(QT5DECLARATIVE_VERSION)/submodules_tar/
+QT5DECLARATIVE_SOURCE = qtdeclarative-opensource-src-$(QT5DECLARATIVE_VERSION).tar.xz
+QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns qt5jsbackend
+QT5DECLARATIVE_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5DECLARATIVE_CONFIGURE_OPTS += -opensource -confirm-license
+QT5DECLARATIVE_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
+else
+QT5DECLARATIVE_LICENSE = Commercial license
+QT5DECLARATIVE_REDISTRIBUTE = NO
+endif
+
+define QT5DECLARATIVE_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5DECLARATIVE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		sub-src-all sub-tools-all
+endef
+
+define QT5DECLARATIVE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		sub-src-install_subtargets \
+		sub-tools-install_subtargets
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5DECLARATIVE_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Qml*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Quick*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/bin/qml* $(TARGET_DIR)/usr/bin
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/qml* $(TARGET_DIR)/usr/lib/qt/plugins
+	cp -dpfr $(STAGING_DIR)/usr/qml $(TARGET_DIR)/usr
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
