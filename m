From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:56 +0100
Subject: [Buildroot] [PATCH 28/32] qt5/qt5graphicaleffects: new package
In-Reply-To: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362687540-19440-29-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                              |    1 +
 package/qt5/qt5graphicaleffects/Config.in          |   14 +++++++
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |   40 ++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 package/qt5/qt5graphicaleffects/Config.in
 create mode 100644 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index ff98b9e..59234dd 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -16,6 +16,7 @@ menuconfig BR2_PACKAGE_QT5
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5declarative/Config.in"
+source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5jsbackend/Config.in"
 source "package/qt5/qt5script/Config.in"
diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
new file mode 100644
index 0000000..859cd5a
--- /dev/null
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_QT5GRAPHICALEFFECTS
+	bool "qt5graphicaleffects"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5DECLARATIVE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5graphicaleffects module.
+
+	  http://qt-project.org
+
+comment "qt5graphicaleffects requires an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
new file mode 100644
index 0000000..c4b7231
--- /dev/null
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# qt5graphicaleffects
+#
+#############################################################
+
+QT5GRAPHICALEFFECTS_VERSION = $(QT5_VERSION)
+QT5GRAPHICALEFFECTS_SITE = http://releases.qt-project.org/qt5/$(QT5GRAPHICALEFFECTS_VERSION)/submodules_tar/
+QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-opensource-src-$(QT5GRAPHICALEFFECTS_VERSION).tar.xz
+QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
+QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5GRAPHICALEFFECTS_CONFIGURE_OPTS += -opensource -confirm-license
+QT5GRAPHICALEFFECTS_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
+else
+QT5GRAPHICALEFFECTS_LICENSE = Commercial license
+QT5GRAPHICALEFFECTS_REDISTRIBUTE = NO
+endif
+
+define QT5GRAPHICALEFFECTS_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5GRAPHICALEFFECTS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5GRAPHICALEFFECTS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+define QT5GRAPHICALEFFECTS_INSTALL_TARGET_CMDS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtGraphicalEffects $(TARGET_DIR)/usr/qml
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
