From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 May 2014 13:45:00 +0200
Subject: [Buildroot] [git commit branch/next] qt5websockets: new package
Message-ID: <20140527123835.053829CB24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad75a7f58cd073a92e255bd8e02f5a7a08a4498e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Peter: only install *.so.* if !BR2_PREFER_STATIC_LIB]
Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in                              |    1 +
 package/qt5/qt5websockets/Config.in                |   11 ++++
 ...01-Remove-dependency-on-unused-sql-module.patch |   28 +++++++++
 package/qt5/qt5websockets/qt5websockets.mk         |   61 ++++++++++++++++++++
 4 files changed, 101 insertions(+), 0 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index e810ecb..efdd9d4 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -40,6 +40,7 @@ source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5webkit/Config.in"
+source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
 endif
diff --git a/package/qt5/qt5websockets/Config.in b/package/qt5/qt5websockets/Config.in
new file mode 100644
index 0000000..be693c7
--- /dev/null
+++ b/package/qt5/qt5websockets/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT5WEBSOCKETS
+	bool "qt5websockets"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5websockets module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5websockets/qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch b/package/qt5/qt5websockets/qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch
new file mode 100644
index 0000000..34a0649
--- /dev/null
+++ b/package/qt5/qt5websockets/qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch
@@ -0,0 +1,28 @@
+From c6b4e9f6609b91e56301bde39be48fc65fcfb916 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
+Date: Tue, 20 May 2014 16:15:43 +0300
+Subject: [PATCH] Remove dependency on unused sql module
+
+Sent-Upstream: https://codereview.qt-project.org/85844
+Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
+Change-Id: I102bcb81ec53d022480e81a3632b93d42bf33403
+---
+ src/websockets/websockets.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/websockets/websockets.pro b/src/websockets/websockets.pro
+index 99e84b6..5b5ff78 100644
+--- a/src/websockets/websockets.pro
++++ b/src/websockets/websockets.pro
+@@ -1,7 +1,7 @@
+ load(qt_build_config)
+ TARGET = QtWebSockets
+ 
+-QT = core network core-private sql
++QT = core network core-private
+ 
+ TEMPLATE = lib
+ 
+-- 
+1.9.1
+
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
new file mode 100644
index 0000000..cac9931
--- /dev/null
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# qt5websockets
+#
+################################################################################
+
+QT5WEBSOCKETS_VERSION = $(QT5_VERSION)
+QT5WEBSOCKETS_SITE = $(QT5_SITE)
+QT5WEBSOCKETS_SOURCE = qtwebsockets-opensource-src-$(QT5WEBSOCKETS_VERSION).tar.xz
+QT5WEBSOCKETS_DEPENDENCIES = qt5base
+QT5WEBSOCKETS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5WEBSOCKETS_LICENSE = LGPLv2.1 or GPLv3.0
+QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+else
+QT5WEBSOCKETS_LICENSE = Commercial license
+QT5WEBSOCKETS_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5WEBSOCKETS_DEPENDENCIES += qt5declarative
+endif
+
+define QT5WEBSOCKETS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5WEBSOCKETS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBSOCKETS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+define QT5WEBSOCKETS_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/WebSockets $(TARGET_DIR)/usr/qml/Qt/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/websockets $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
+define QT5WEBSOCKETS_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebSockets.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+define QT5WEBSOCKETS_INSTALL_TARGET_CMDS
+	$(QT5WEBSOCKETS_INSTALL_TARGET_LIBS)
+	$(QT5WEBSOCKETS_INSTALL_TARGET_QMLS)
+endef
+
+$(eval $(generic-package))
