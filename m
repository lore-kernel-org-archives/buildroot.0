From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:47:12 +0100
Subject: [Buildroot] [git commit] qt5charts: new package
Message-ID: <20171203224007.7FC4381494@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0066a215d5dc4078001c27df96e76e33262bb78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
[Thomas: add entry to DEVELOPERS file, update to Qt 5.9.3.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                           |  1 +
 package/qt5/Config.in                |  1 +
 package/qt5/qt5charts/Config.in      | 15 +++++++++
 package/qt5/qt5charts/qt5charts.hash |  5 +++
 package/qt5/qt5charts/qt5charts.mk   | 59 ++++++++++++++++++++++++++++++++++++
 5 files changed, 81 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f96b1d0..3e52d7c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1627,6 +1627,7 @@ N:	S??bastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
 F:	package/python-flask-login/
+F:	package/qt5/qt5charts/
 
 N:	Theo Debrouwere <t.debrouwere@televic.com>
 F:	package/pugixml/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 0136e11..69f36e2 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -61,6 +61,7 @@ endchoice
 source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
+source "package/qt5/qt5charts/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
 source "package/qt5/qt5enginio/Config.in"
diff --git a/package/qt5/qt5charts/Config.in b/package/qt5/qt5charts/Config.in
new file mode 100644
index 0000000..993f4db
--- /dev/null
+++ b/package/qt5/qt5charts/Config.in
@@ -0,0 +1,15 @@
+comment "qt5charts needs at least qt-5.7"
+	depends on !BR2_PACKAGE_QT5_VERSION_LATEST
+
+config BR2_PACKAGE_QT5CHARTS
+	bool "qt5charts"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	depends on BR2_PACKAGE_QT5_VERSION_LATEST
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Charts module provides a set of easy to use chart components.
+
+	  https://doc.qt.io/qt-5/qtcharts-index.html
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
new file mode 100644
index 0000000..3a9db5b
--- /dev/null
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -0,0 +1,5 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtcharts-opensource-src-5.9.3.tar.xz.mirrorlist
+sha256 ec1783a81d5715fc48a3276e67b90a66cac3e283ac14fc3bf88b2058994d69e9  qtcharts-opensource-src-5.9.3.tar.xz
+
+# Hashes for license files:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
new file mode 100644
index 0000000..17fdd96
--- /dev/null
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# qt5charts
+#
+################################################################################
+
+QT5CHARTS_VERSION = $(QT5_VERSION)
+QT5CHARTS_SITE = $(QT5_SITE)
+QT5CHARTS_SOURCE = qtcharts-opensource-src-$(QT5CHARTS_VERSION).tar.xz
+QT5CHARTS_DEPENDENCIES = qt5base
+QT5CHARTS_INSTALL_STAGING = YES
+
+QT5CHARTS_LICENSE = GPL-3.0
+QT5CHARTS_LICENSE_FILES = LICENSE.GPL3
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5CHARTS_DEPENDENCIES += qt5declarative
+endif
+
+define QT5CHARTS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+endef
+
+define QT5CHARTS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5CHARTS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+define QT5CHARTS_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Charts*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
+endef
+endif
+
+# this is only built with quick support enabled
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5CHARTS_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtCharts $(TARGET_DIR)/usr/qml/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5CHARTS_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/charts* $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+define QT5CHARTS_INSTALL_TARGET_CMDS
+	$(QT5CHARTS_INSTALL_TARGET_LIBS)
+	$(QT5CHARTS_INSTALL_TARGET_QMLS)
+	$(QT5CHARTS_INSTALL_TARGET_EXAMPLES)
+endef
+
+$(eval $(generic-package))
