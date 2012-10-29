From: Thiago A. Correa <thiago.correa@gmail.com>
Date: Mon, 29 Oct 2012 13:49:49 -0200
Subject: [Buildroot] [PATCHv3] QtSerialPort: new package
Message-ID: <20121029154949.GA15033@localhost.comm5.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
---
 package/Config.in                    |    1 +
 package/qtserialport/Config.in       |   12 +++++++++++
 package/qtserialport/qtserialport.mk |   35 ++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 package/qtserialport/Config.in
 create mode 100644 package/qtserialport/qtserialport.mk

diff --git a/package/Config.in b/package/Config.in
index 331d879..e869c8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -133,6 +133,7 @@ source "package/sdl_gfx/Config.in"
 comment "other GUIs"
 source "package/efl/Config.in"
 source "package/qt/Config.in"
+source "package/qtserialport/Config.in"
 source "package/x11r7/Config.in"
 
 comment "X libraries and helper libraries"
diff --git a/package/qtserialport/Config.in b/package/qtserialport/Config.in
new file mode 100644
index 0000000..f84387a
--- /dev/null
+++ b/package/qtserialport/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QTSERIALPORT
+	bool "QtSerialPort"
+	depends on BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_UDEV
+	help
+	  QtSerialPort module is an add-on for the Qt library, providing
+	  a single interface for both hardware and virtual serial ports.
+
+	  http://qt-project.org/wiki/QtSerialPort
+
+comment "QtSerialPort requires udev support"
+        depends on !(BR2_PACKAGE_UDEV)
diff --git a/package/qtserialport/qtserialport.mk b/package/qtserialport/qtserialport.mk
new file mode 100644
index 0000000..cfd0518
--- /dev/null
+++ b/package/qtserialport/qtserialport.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# QtSerialPort 
+#
+#############################################################
+QTSERIALPORT_VERSION = e831107f468618881e435932c8a42404c1dde13c
+QTSERIALPORT_SITE = git://gitorious.org/qtplayground/qtserialport.git
+QTSERIALPORT_LICENSE = LGPLv2
+QTSERIALPORT_LICENSE_FILES = LICENSE.LGPL
+QTSERIALPORT_INSTALL_STAGING = YES
+
+QTSERIALPORT_DEPENDENCIES = qt udev
+
+QTSERIALPORT_LDFLAGS = $(TARGET_LDFLAGS)
+
+define QTSERIALPORT_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(QT_QMAKE) -recursive CONFIG+=release)
+endef
+
+define QTSERIALPORT_BUILD_CMDS
+	$(MAKE) -C $(@D)/src
+endef
+
+define QTSERIALPORT_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D)/src install
+	mv $(HOST_DIR)/usr/include/QtAddOnSerialPort $(STAGING_DIR)/usr/include/
+endef
+
+define QTSERIALPORT_INSTALL_TARGET_CMDS
+	cp -dpfr $(STAGING_DIR)/usr/lib/libSerialPort.so.* \
+	$(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
1.7.3.4
