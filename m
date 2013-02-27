From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 00:26:20 +0100
Subject: [Buildroot] [PATCH 29/30] qt5/qt5quick1: new package
In-Reply-To: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362007582-14753-30-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in              |    1 +
 package/qt5/qt5quick1/Config.in    |   15 ++++++++++++
 package/qt5/qt5quick1/qt5quick1.mk |   45 ++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 package/qt5/qt5quick1/Config.in
 create mode 100644 package/qt5/qt5quick1/qt5quick1.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index e8e581c..0db6c45 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -20,6 +20,7 @@ source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5jsbackend/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
+source "package/qt5/qt5quick1/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
new file mode 100644
index 0000000..157038c
--- /dev/null
+++ b/package/qt5/qt5quick1/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_QT5QUICK1
+	bool "qt5quick1"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5SCRIPT
+	select BR2_PACKAGE_QT5XMLPATTERNS
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5JSBACKEND
+	select BR2_PACKAGE_QT5WEBKIT
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5quick1 module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
new file mode 100644
index 0000000..e076123
--- /dev/null
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -0,0 +1,45 @@
+#############################################################
+#
+# qt5quick1
+#
+#############################################################
+
+QT5QUICK1_VERSION = $(QT5_VERSION)
+QT5QUICK1_SITE = http://releases.qt-project.org/qt5/$(QT5QUICK1_VERSION)/submodules_tar/
+QT5QUICK1_SOURCE = qtquick1-opensource-src-$(QT5QUICK1_VERSION).tar.xz
+QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script qt5declarative qt5jsbackend qt5webkit
+QT5QUICK1_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5QUICK1_CONFIGURE_OPTS += -opensource -confirm-license
+QT5QUICK1_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
+else
+QT5QUICK1_LICENSE = Commercial license
+QT5QUICK1_REDISTRIBUTE = NO
+endif
+
+define QT5QUICK1_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5QUICK1_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5QUICK1_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5QUICK1_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Declarative.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/bin/qmlviewer $(TARGET_DIR)/usr/bin
+	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/qmltooling/libqmldbg_inspector.so $(TARGET_DIR)/usr/lib/qt/plugins/qmltooling/
+	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/qmltooling/libqmldbg_tcp_qtdeclarative.so $(TARGET_DIR)/usr/lib/qt/plugins/qmltooling/
+	cp -dpfr $(STAGING_DIR)/usr/imports $(TARGET_DIR)/usr
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
