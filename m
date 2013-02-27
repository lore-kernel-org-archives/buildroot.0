From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 00:26:12 +0100
Subject: [Buildroot] [PATCH 21/30] qt5/qt5svg: new package
In-Reply-To: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362007582-14753-22-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in        |    1 +
 package/qt5/qt5svg/Config.in |   11 ++++++++++
 package/qt5/qt5svg/qt5svg.mk |   47 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 package/qt5/qt5svg/Config.in
 create mode 100644 package/qt5/qt5svg/qt5svg.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 1c9f8a6..f4d2b45 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -15,4 +15,5 @@ menuconfig BR2_PACKAGE_QT5
 
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
+source "package/qt5/qt5svg/Config.in"
 endif
diff --git a/package/qt5/qt5svg/Config.in b/package/qt5/qt5svg/Config.in
new file mode 100644
index 0000000..27e6b05
--- /dev/null
+++ b/package/qt5/qt5svg/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT5SVG
+	bool "qt5svg"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5svg module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
new file mode 100644
index 0000000..8db28ba
--- /dev/null
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -0,0 +1,47 @@
+#############################################################
+#
+# qt5svg
+#
+#############################################################
+
+QT5SVG_VERSION = $(QT5_VERSION)
+QT5SVG_SITE = http://releases.qt-project.org/qt5/$(QT5SVG_VERSION)/submodules_tar/
+QT5SVG_SOURCE = qtsvg-opensource-src-$(QT5SVG_VERSION).tar.xz
+QT5SVG_DEPENDENCIES = qt5base
+QT5SVG_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5SVG_CONFIGURE_OPTS += -opensource -confirm-license
+QT5SVG_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for qt5svg.
+else
+QT5SVG_LICENSE = Commercial license
+QT5SVG_REDISTRIBUTE = NO
+endif
+
+define QT5SVG_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5SVG_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5SVG_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
+define QT5SVG_INSTALL_ICONENGINES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/iconengines $(TARGET_DIR)/usr/lib/qt/plugins
+endef
+endif
+define QT5SVG_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Svg*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/imageformats/libqsvg.so $(TARGET_DIR)/usr/lib/qt/plugins/imageformats/
+	$(QT5SVG_INSTALL_ICONENGINES)
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
