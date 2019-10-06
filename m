From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Oct 2019 14:13:31 +0200
Subject: [Buildroot] [PATCH 2/2] package/qt5/qt5webview: new package
In-Reply-To: <20191006121331.11015-1-bernd.kuhls@t-online.de>
References: <20191006121331.11015-1-bernd.kuhls@t-online.de>
Message-ID: <20191006121331.11015-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bartosz Bilas <b.bilas@grinn-global.com>

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[Bernd: bump version to 5.12.5]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                             |  1 +
 package/qt5/Config.in                  |  1 +
 package/qt5/qt5webview/Config.in       | 17 ++++++++
 package/qt5/qt5webview/qt5webview.hash | 11 ++++++
 package/qt5/qt5webview/qt5webview.mk   | 55 ++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)
 create mode 100644 package/qt5/qt5webview/Config.in
 create mode 100644 package/qt5/qt5webview/qt5webview.hash
 create mode 100644 package/qt5/qt5webview/qt5webview.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7ec94cfa38..2a93516e1a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -253,6 +253,7 @@ F:	package/orbit/
 
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	package/qt5/qt5scxml/
+F:	package/qt5/qt5webview/
 
 N:	Bartosz Golaszewski <brgl@bgdev.pl>
 F:	package/autoconf-archive/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b9598b2be7..6476745a8d 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -83,6 +83,7 @@ source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5webkit-examples/Config.in"
 source "package/qt5/qt5webengine/Config.in"
 source "package/qt5/qt5websockets/Config.in"
+source "package/qt5/qt5webview/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
 endif
diff --git a/package/qt5/qt5webview/Config.in b/package/qt5/qt5webview/Config.in
new file mode 100644
index 0000000000..d76061ceba
--- /dev/null
+++ b/package/qt5/qt5webview/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_QT5WEBVIEW
+	bool "qt5webview"
+	depends on BR2_PACKAGE_QT5WEBENGINE
+	select BR2_PACKAGE_QT5BASE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt WebView provides a way to display web content in
+	  a QML application without necessarily including
+	  a full web browser stack by using native APIs where
+	  it makes sense.
+
+	  https://doc.qt.io/qt-5/qtwebview-index.html
+
+comment "qt5webview needs qt5webengine module"
+	depends on !BR2_PACKAGE_QT5WEBENGINE
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
new file mode 100644
index 0000000000..2de27a0add
--- /dev/null
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/archive/qt/5.6/5.6.3/submodules/qtwebview-opensource-src-5.6.3.tar.xz.sha256
+sha256 768a456e89f0fd7cbf39ac6b282e078a098e7426651c0b3d453b10c5c44bd81c qtwebview-opensource-src-5.6.3.tar.xz
+
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebview-everywhere-src-5.12.5.tar.xz.sha256
+sha256 a6d4d8c335cd6838f4638874fcd67655e80db569ed567a774a84f6bf7d332f26  qtwebview-everywhere-src-5.12.5.tar.xz
+
+# Hashes for license files:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
new file mode 100644
index 0000000000..4e0103de8c
--- /dev/null
+++ b/package/qt5/qt5webview/qt5webview.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# qt5webwiev
+#
+################################################################################
+
+QT5WEBVIEW_VERSION = $(QT5_VERSION)
+QT5WEBVIEW_SITE = $(QT5_SITE)
+QT5WEBVIEW_SOURCE = qtwebview-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBVIEW_VERSION).tar.xz
+QT5WEBVIEW_DEPENDENCIES = qt5base qt5webengine
+QT5WEBVIEW_INSTALL_STAGING = YES
+QT5WEBVIEW_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0, GFDL-1.3 (docs)
+QT5WEBVIEW_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+QT5WEBVIEW_LICENSE := $(QT5WEBVIEW_LICENSE), BSD-3-Clause (examples)
+endif
+
+define QT5WEBVIEW_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+endef
+
+define QT5WEBVIEW_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBVIEW_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5WEBVIEW_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebView $(TARGET_DIR)/usr/qml/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5WEBVIEW_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webview $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+ifneq ($(BR2_STATIC_LIBS),y)
+define QT5WEBVIEW_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebView.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+define QT5WEBVIEW_INSTALL_TARGET_CMDS
+	$(QT5WEBVIEW_INSTALL_TARGET_LIBS)
+	$(QT5WEBVIEW_INSTALL_TARGET_QMLS)
+	$(QT5WEBVIEW_INSTALL_TARGET_EXAMPLES)
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
