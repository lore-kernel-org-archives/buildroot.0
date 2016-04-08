From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  8 Apr 2016 23:33:10 +0200
Subject: [Buildroot] [PATCH v2] qt5quickcontrols2: new package
Message-ID: <1460151190-21021-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - move menu entry to 'technology preview' section
  - add QT5_GL_AVAILABLE/QT5_JSCORE_AVAILABLE dependency comment
  - install the right qt5quickcontrols2 files to target
    (all suggested by Julien Corjon)
---
 package/qt5/Config.in                              |  2 ++
 package/qt5/qt5quickcontrols2/Config.in            | 17 +++++++++
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  2 ++
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 40 ++++++++++++++++++++++
 4 files changed, 61 insertions(+)
 create mode 100644 package/qt5/qt5quickcontrols2/Config.in
 create mode 100644 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
 create mode 100644 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f673daa..c011aa9 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -47,6 +47,8 @@ source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
+comment "technology preview"
+source "package/qt5/qt5quickcontrols2/Config.in"
 comment "legacy compatibility"
 source "package/qt5/qt5script/Config.in"
 endif
diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
new file mode 100644
index 0000000..1e57674
--- /dev/null
+++ b/package/qt5/qt5quickcontrols2/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_QT5QUICKCONTROLS2
+	bool "qt5quickcontrols2"
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative/quick
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative/quick
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5quickcontrols2 module.
+
+	  http://qt.io
+
+comment "qt5quickcontrols2 needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
new file mode 100644
index 0000000..aaf8fcf
--- /dev/null
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -0,0 +1,2 @@
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtquickcontrols2-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 59ec6ea2282931bc0d0748b3979a52e1a322e7ef8d1e5490b8a34931e8b9fee0 qtquickcontrols2-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
new file mode 100644
index 0000000..a5ad3f6
--- /dev/null
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# qt5quickcontrols2
+#
+################################################################################
+
+QT5QUICKCONTROLS2_VERSION = $(QT5_VERSION)
+QT5QUICKCONTROLS2_SITE = $(QT5_SITE)
+QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-opensource-src-$(QT5QUICKCONTROLS2_VERSION).tar.xz
+QT5QUICKCONTROLS2_DEPENDENCIES = qt5base qt5declarative
+QT5QUICKCONTROLS2_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5QUICKCONTROLS2_LICENSE = GPLv3 or LGPLv3, GFDLv1.3 (docs)
+QT5QUICKCONTROLS2_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+else
+QT5QUICKCONTROLS2_LICENSE = Commercial license
+QT5QUICKCONTROLS2_REDISTRIBUTE = NO
+endif
+
+define QT5QUICKCONTROLS2_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5QUICKCONTROLS2_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5QUICKCONTROLS2_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5LabsTemplates.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/controls $(TARGET_DIR)/usr/qml/Qt/labs
+	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar $(TARGET_DIR)/usr/qml/Qt/labs
+	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/templates $(TARGET_DIR)/usr/qml/Qt/labs
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
