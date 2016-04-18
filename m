From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:46:46 +0200
Subject: [Buildroot] [git commit] qt5location: new package
Message-ID: <20160418194650.C57B180E31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64904a92299bd7a3048a6d847e9931b8e66a3123
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                    |  1 +
 package/qt5/qt5location/Config.in        | 10 ++++++
 package/qt5/qt5location/qt5location.hash |  2 ++
 package/qt5/qt5location/qt5location.mk   | 61 ++++++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f673daa..ecae7cb 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -37,6 +37,7 @@ source "package/qt5/qt5declarative/Config.in"
 source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
+source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5sensors/Config.in"
diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
new file mode 100644
index 0000000..209d134
--- /dev/null
+++ b/package/qt5/qt5location/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5LOCATION
+	bool "qt5location"
+	select BR2_PACKAGE_QT5BASE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5location module.
+
+	  http://qt.io
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
new file mode 100644
index 0000000..e078ec5
--- /dev/null
+++ b/package/qt5/qt5location/qt5location.hash
@@ -0,0 +1,2 @@
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtlocation-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 360e1519d0fcafe4f86923d224e76d56dd785dfb0e1a19fd2e2b0016799653c9 qtlocation-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
new file mode 100644
index 0000000..358b162
--- /dev/null
+++ b/package/qt5/qt5location/qt5location.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# qt5location
+#
+################################################################################
+
+QT5LOCATION_VERSION = $(QT5_VERSION)
+QT5LOCATION_SITE = $(QT5_SITE)
+QT5LOCATION_SOURCE = qtlocation-opensource-src-$(QT5LOCATION_VERSION).tar.xz
+QT5LOCATION_DEPENDENCIES = qt5base
+QT5LOCATION_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5LOCATION_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+else
+QT5LOCATION_LICENSE = Commercial license
+QT5LOCATION_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5LOCATION_DEPENDENCIES += qt5declarative
+endif
+
+define QT5LOCATION_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5LOCATION_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5LOCATION_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5LOCATION_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtPositioning $(TARGET_DIR)/usr/qml/
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtLocation $(TARGET_DIR)/usr/qml/
+endef
+define QT5LOCATION_INSTALL_TARGET_LOCATION
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Location.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geoservices $(TARGET_DIR)/usr/lib/qt/plugins/
+endef
+endif
+
+define QT5LOCATION_INSTALL_TARGET_POSITION
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Positioning.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/position $(TARGET_DIR)/usr/lib/qt/plugins/
+endef
+
+define QT5LOCATION_INSTALL_TARGET_CMDS
+	$(QT5LOCATION_INSTALL_TARGET_POSITION)
+	$(QT5LOCATION_INSTALL_TARGET_LOCATION)
+	$(QT5LOCATION_INSTALL_TARGET_QMLS)
+endef
+
+
+$(eval $(generic-package))
