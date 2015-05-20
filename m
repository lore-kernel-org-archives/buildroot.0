From: Julien CORJON <corjon.j@ecagroup.com>
Date: Wed, 20 May 2015 17:06:53 +0000
Subject: [Buildroot] [PATCH 1/1] qt/qt5webchannel: new package
Message-ID: <0f88f55e-415a-49f5-8e6d-497e86ce223d@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/Config.in                        |  1 +
 package/qt5/qt5webchannel/Config.in          | 10 +++++
 package/qt5/qt5webchannel/qt5webchannel.hash |  4 ++
 package/qt5/qt5webchannel/qt5webchannel.mk   | 61 ++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+)
 create mode 100644 package/qt5/qt5webchannel/Config.in
 create mode 100644 package/qt5/qt5webchannel/qt5webchannel.hash
 create mode 100644 package/qt5/qt5webchannel/qt5webchannel.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index e8ec7d9..c31342a 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -42,6 +42,7 @@ source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
+source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5webkit-examples/Config.in"
 source "package/qt5/qt5websockets/Config.in"
diff --git a/package/qt5/qt5webchannel/Config.in b/package/qt5/qt5webchannel/Config.in
new file mode 100644
index 0000000..14e4d8f
--- /dev/null
+++ b/package/qt5/qt5webchannel/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5WEBCHANNEL
+	bool "qt5webchannel"
+	select BR2_PACKAGE_QT5BASE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5webchannel module.
+
+	  http://qt.io
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
new file mode 100644
index 0000000..e390d1e
--- /dev/null
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtwebchannel-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 c4acb9ec9886fca6d0c2adc5b45970347ae1b3e4b5e0055ab370540faef7b251 qtwebchannel-opensource-src-5.4.1.tar.xz
+sha1   7a27eac0bead6e60b5faaf360a6236dd96013c12                         qtwebchannel-opensource-src-5.4.1.tar.xz
+md5    bb914134c164c6758a0074748cc678ff                                 qtwebchannel-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
new file mode 100644
index 0000000..29c6b57
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
+QT5WEBCHANNEL_DEPENDENCIES = qt5base
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
