From: Julien Corjon <corjon.j@ecagroup.com>
Date: Fri, 10 Jul 2015 16:20:22 +0200
Subject: [Buildroot] [PATCH v3 5/5] qt/qt5webchannel: new package
In-Reply-To: <1436538022-18924-1-git-send-email-corjon.j@ecagroup.com>
References: <1436380555-13657-3-git-send-email-corjon.j@ecagroup.com>
 <1436538022-18924-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <1436538022-18924-5-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/Config.in                        |  1 +
 package/qt5/qt5webchannel/Config.in          | 11 +++++
 package/qt5/qt5webchannel/qt5webchannel.hash |  4 ++
 package/qt5/qt5webchannel/qt5webchannel.mk   | 61 ++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+)
 create mode 100644 package/qt5/qt5webchannel/Config.in
 create mode 100644 package/qt5/qt5webchannel/qt5webchannel.hash
 create mode 100644 package/qt5/qt5webchannel/qt5webchannel.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 4cce323..e87f1bf 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -40,6 +40,7 @@ source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
+source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webengine/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
diff --git a/package/qt5/qt5webchannel/Config.in b/package/qt5/qt5webchannel/Config.in
new file mode 100644
index 0000000..218629a
--- /dev/null
+++ b/package/qt5/qt5webchannel/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT5WEBCHANNEL
+	bool "qt5webchannel"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5WEBSOCKETS
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5webchannel module.
+
+	  http://qt.io
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
new file mode 100644
index 0000000..b96aebb
--- /dev/null
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtwebchannel-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 94f88604ff0b29a30f1a1b13601d4bce9af5c0a96c43869705aee1596aeb2d8d qtwebchannel-opensource-src-5.5.0.tar.xz
+sha1   7c45ecb9c4226207f184b5cf25d1a18d650075da                         qtwebchannel-opensource-src-5.5.0.tar.xz
+md5    c20146286108477cdab60c67d2d87dc7                                 qtwebchannel-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
new file mode 100644
index 0000000..cfb6da9
--- /dev/null
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# qt5webchannel
+#
+################################################################################
+
+QT5WEBCHANNEL_VERSION = $(QT5_VERSION)
+QT5WEBCHANNEL_SITE = $(QT5_SITE)
+QT5WEBCHANNEL_SOURCE = qtwebchannel-opensource-src-$(QT5WEBCHANNEL_VERSION).tar.xz
+QT5WEBCHANNEL_DEPENDENCIES = qt5base qt5websockets
+QT5WEBCHANNEL_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5WEBCHANNEL_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5WEBCHANNEL_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LGPL_EXCEPTION.txt LICENSE.GPLv2
+else
+QT5WEBCHANNEL_LICENSE = Commercial license
+QT5WEBCHANNEL_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5WEBCHANNEL_DEPENDENCIES += qt5declarative
+endif
+
+define QT5WEBCHANNEL_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5WEBCHANNEL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBCHANNEL_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5WEBCHANNEL_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebChannel $(TARGET_DIR)/usr/qml/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webchannel $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+ifneq ($(BR2_STATIC_LIBS),y)
+define QT5WEBCHANNEL_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebChannel.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+define QT5WEBCHANNEL_INSTALL_TARGET_CMDS
+	$(QT5WEBCHANNEL_INSTALL_TARGET_LIBS)
+	$(QT5WEBCHANNEL_INSTALL_TARGET_QMLS)
+endef
+
+$(eval $(generic-package))
-- 
2.1.0
