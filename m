From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 00:26:21 +0100
Subject: [Buildroot] [PATCH 30/30] qt5/qt5webkit: new package
In-Reply-To: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362007582-14753-31-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in              |    1 +
 package/qt5/qt5webkit/Config.in    |   12 ++++++++++
 package/qt5/qt5webkit/qt5webkit.mk |   43 ++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 package/qt5/qt5webkit/Config.in
 create mode 100644 package/qt5/qt5webkit/qt5webkit.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 0db6c45..5662f55 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -23,5 +23,6 @@ source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quick1/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
+source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
 endif
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
new file mode 100644
index 0000000..17ee3ab
--- /dev/null
+++ b/package/qt5/qt5webkit/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QT5WEBKIT
+	bool "qt5webkit"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_ICU
+	select BR2_PACKAGE_SQLITE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5webkit module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
new file mode 100644
index 0000000..d577cf8
--- /dev/null
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# qt5webkit
+#
+#############################################################
+
+QT5WEBKIT_VERSION = $(QT5_VERSION)
+QT5WEBKIT_SITE = http://releases.qt-project.org/qt5/$(QT5WEBKIT_VERSION)/submodules_tar/
+QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
+QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf
+QT5WEBKIT_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5WEBKIT_CONFIGURE_OPTS += -opensource -confirm-license
+QT5WEBKIT_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
+else
+QT5WEBKIT_LICENSE = Commercial license
+QT5WEBKIT_REDISTRIBUTE = NO
+endif
+
+define QT5WEBKIT_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5WEBKIT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBKIT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5WEBKIT_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebKit $(TARGET_DIR)/usr/qml/
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
