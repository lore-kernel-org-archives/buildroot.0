From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 16:11:49 +0200
Subject: [Buildroot] [git commit] qt5/qt5svg: new package
Message-ID: <20130411151207.CCEA49B59C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29e8426bd655d8b36476fb593d43945132aed16b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/Config.in        |    1 +
 package/qt5/qt5svg/Config.in |   11 +++++++++
 package/qt5/qt5svg/qt5svg.mk |   50 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 9e9104a..f0585ab 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -16,4 +16,5 @@ menuconfig BR2_PACKAGE_QT5
 
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
index 0000000..65fb04b
--- /dev/null
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -0,0 +1,50 @@
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
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define QT5SVG_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Svg*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/imageformats/libqsvg.so $(TARGET_DIR)/usr/lib/qt/plugins/imageformats/
+	$(QT5SVG_INSTALL_ICONENGINES)
+endef
+endif
+
+$(eval $(generic-package))
