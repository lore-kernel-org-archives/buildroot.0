From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Tue, 26 Aug 2014 23:28:06 +0300
Subject: [Buildroot] [PATCH 1/2] libphidget: new package for controlling
	Phidgets USB devices
Message-ID: <1409084887-30450-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
---
 package/Config.in                |    1 +
 package/libphidget/Config.in     |   25 +++++++++++++++++++++++++
 package/libphidget/libphidget.mk |   18 ++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 package/libphidget/Config.in
 create mode 100644 package/libphidget/libphidget.mk

diff --git a/package/Config.in b/package/Config.in
index 4520ba6..1088f5a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -676,6 +676,7 @@ menu "Hardware handling"
 	source "package/libsoc/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
+	source "package/libphidget/Config.in"
 	source "package/libv4l/Config.in"
 	source "package/libxkbcommon/Config.in"
 	source "package/mtdev/Config.in"
diff --git a/package/libphidget/Config.in b/package/libphidget/Config.in
new file mode 100644
index 0000000..dcd6854
--- /dev/null
+++ b/package/libphidget/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_LIBPHIDGET
+	bool "libphidget"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  The libphidget library provides an API for controlling Phidgets
+	  USB devices. The library translates API function calls to libusb
+	  function calls to control attached Phidgets devices that provide
+	  GPIO's, DAC's, accelerometers, servo motors, and other capabilities
+	  either singly or on combo devices.
+
+	  To use libphidget for controlling locally attached devices you
+	  need to set up the userspace USB device tree /dev/bus/usb. See
+	  file udev/99-phidgets.rules.
+
+	  The libphidget library also contains an API for sending commands
+	  to a local or remote phidgetwebservice using HTTP. The
+	  phidgetwebservice then translates HTTP requests to libphidget API
+	  function calls to control locally attached Phidgets devices.
+
+	  http://phidgets.com/
+
+comment "libphidget needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
new file mode 100644
index 0000000..55547d5
--- /dev/null
+++ b/package/libphidget/libphidget.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libphidget
+#
+################################################################################
+
+LIBPHIDGET_VERSION = 2.1.8.20140319
+LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
+LIBPHIDGET_SITE = http://www.phidgets.com/downloads/libraries/
+LIBPHIDGET_DEPENDENCIES = libusb
+LIBPHIDGET_CONF_OPT = --disable-ldconfig
+LIBPHIDGET_INSTALL_STAGING = YES
+LIBPHIDGET_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+LIBPHIDGET_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+LIBPHIDGET_LICENSE = LGPLv3
+LIBPHIDGET_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
