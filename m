From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 25 Oct 2011 09:22:34 +0200
Subject: [Buildroot] [RFC] New package: QSerialDevice
Message-ID: <4EA663BA.5030700@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have some questions regarding inclusion of this package:

1. I fetch it from git branch, how can I specify revision?
2. how do I handle symlinking for libraries? If I just copy all 4 files, I get 4 same files and not one library and 3 symlinks
3. what about creating some kind of folders/menu (in package/Config.in) for Qt, python etc. add-ons?

Yegor
---
 package/Config.in                      |    4 ++++
 package/qserialdevice/Config.in        |    7 +++++++
 package/qserialdevice/qserialdevice.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)

Index: b/package/Config.in
===================================================================
--- a/package/Config.in
+++ b/package/Config.in
@@ -316,6 +316,7 @@
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/python-serial/Config.in"
+source "package/qserialdevice/Config.in"
 endmenu
 
 if BROKEN
@@ -556,4 +557,7 @@
 endif
 endmenu
 
+menu "VScom"
+source "package/vscom/vsguitest/Config.in"
+endmenu
 endmenu
Index: b/package/qserialdevice/Config.in
===================================================================
--- /dev/null
+++ b/package/qserialdevice/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QSERIALDEVICE
+	bool "QSerialDevice"
+	depends on BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_UDEV
+	select BR2_PACKAGE_QT_STL
+	help
+	  Qt serial port implementation.
Index: b/package/qserialdevice/qserialdevice.mk
===================================================================
--- /dev/null
+++ b/package/qserialdevice/qserialdevice.mk
@@ -0,0 +1,26 @@
+QSERIALDEVICE_VERSION = 2.0
+QSERIALDEVICE_SITE = git://gitorious.org/qserialdevice/qserialdevice.git
+QSERIALDEVICE_INSTALL_STAGING = YES
+QSERIALDEVICE_DEPENDENCIES = qt udev
+
+define QSERIALDEVICE_CONFIGURE_CMDS
+	$(QT_QMAKE) $(@D)/serialport.pro
+endef
+
+define QSERIALDEVICE_BUILD_CMDS
+	$(MAKE) -C $(@D) all
+endef
+
+define QSERIALDEVICE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/src/libSerialPort.so* \
+		$(TARGET_DIR)/usr/lib
+endef
+
+define QSERIALDEVICE_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0755 $(@D)/src/libSerialPort.so* \
+		$(STAGING_DIR)/usr/lib
+	$(INSTALL) -m 0644 $(@D)/include/serial* \
+		$(STAGING_DIR)/usr/include
+endef
+
+$(eval $(call GENTARGETS))
