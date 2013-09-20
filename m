From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 20 Sep 2013 08:43:13 +0300
Subject: [Buildroot] [PATCH v2 4/6] qt5serialport: new package
In-Reply-To: <1379655795-22429-1-git-send-email-fatih.asici@gmail.com>
References: <1379655795-22429-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1379655795-22429-5-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/Config.in                      |    1 +
 package/qt5/qt5serialport/Config.in        |   10 +++++++
 package/qt5/qt5serialport/qt5serialport.mk |   40 ++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 package/qt5/qt5serialport/Config.in
 create mode 100644 package/qt5/qt5serialport/qt5serialport.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 8488578..fa10155 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -25,6 +25,7 @@ source "package/qt5/qt5quick1/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5sensors/Config.in"
+source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5serialport/Config.in b/package/qt5/qt5serialport/Config.in
new file mode 100644
index 0000000..772de88
--- /dev/null
+++ b/package/qt5/qt5serialport/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5SERIALPORT
+	bool "qt5serialport"
+	select BR2_PACKAGE_QT5BASE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5serialport module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
new file mode 100644
index 0000000..0328ef8
--- /dev/null
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# qt5serialport
+#
+################################################################################
+
+QT5SERIALPORT_VERSION = $(QT5_VERSION)
+QT5SERIALPORT_SITE = $(QT5_SITE)
+QT5SERIALPORT_SOURCE = qtserialport-opensource-src-$(QT5SERIALPORT_VERSION).tar.xz
+QT5SERIALPORT_DEPENDENCIES = qt5base
+QT5SERIALPORT_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5SERIALPORT_LICENSE = LGPLv2.1 or GPLv3.0
+QT5SERIALPORT_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+else
+QT5SERIALPORT_LICENSE = Commercial license
+QT5SERIALPORT_REDISTRIBUTE = NO
+endif
+
+define QT5SERIALPORT_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5SERIALPORT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5SERIALPORT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define QT5SERIALPORT_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5SerialPort.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+$(eval $(generic-package))
-- 
1.7.10.4
