From: Arn R <arnerro@gmail.com>
Date: Fri, 24 May 2013 00:43:01 +1000
Subject: [Buildroot] [PATCH 1/1] gpsd: Add config options for USB, Bluetooth,
	Qt.
Message-ID: <1369320181-6069-1-git-send-email-arnerro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These options can now be disabled individually.
Previously, these options were simply enabled if the package they depended on was also enabled.
By default they will still be enabled if the packages they depend on are enabled.

Signed-off-by: Arn R <arnerro@gmail.com>
---
 package/gpsd/Config.in | 20 ++++++++++++++++++++
 package/gpsd/gpsd.mk   |  6 +++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 337f8e7..c38d52b 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -90,6 +90,26 @@ config BR2_PACKAGE_GPSD_CONTROLSEND
 config BR2_PACKAGE_GPSD_SQUELCH
 	bool "squelch gpsd_report and gpsd_hexdump to save cpu"
 
+config BR2_PACKAGE_GPSD_BLUETOOTH_DEV
+	bool "allow GPS devices via Bluetooth"
+	default y
+	depends on BR2_PACKAGE_BLUEZ_UTILS
+	help
+	  Support Bluetooth devices with BlueZ.
+
+config BR2_PACKAGE_GPSD_USB_DEV
+	bool "allow GPS devices via USB"
+	default y
+	depends on BR2_PACKAGE_LIBUSB
+	help
+	  Support USB devices with libusb.
+
+config BR2_PACKAGE_GPSD_QTBINDING
+	bool "enable the Qt bindings"
+	default y
+	depends on BR2_PACKAGE_QT_NETWORK
+	help
+	  Builds the library libQgpsmm to provide Qt bindings.
 endmenu
 
 menu "Protocols"
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 384726d..be4046f 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -44,7 +44,7 @@ else
 endif
 
 # Enable or disable Qt binding
-ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
+ifeq ($(BR2_PACKAGE_GPSD_QTBINDING),y)
 	GPSD_SCONS_ENV += QMAKE="$(QT_QMAKE)"
 	GPSD_DEPENDENCIES += qt host-pkgconf
 else
@@ -52,14 +52,14 @@ else
 endif
 
 # If libusb is available build it before so the package can use it
-ifeq ($(BR2_PACKAGE_LIBUSB),y)
+ifeq ($(BR2_PACKAGE_GPSD_USB_DEV),y)
 	GPSD_DEPENDENCIES += libusb
 else
 	GPSD_SCONS_OPTS += usb=no
 endif
 
 # If bluetooth is available build it before so the package can use it
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+ifeq ($(BR2_PACKAGE_GPSD_BLUETOOTH_DEV),y)
 	GPSD_DEPENDENCIES += bluez_utils
 else
 	GPSD_SCONS_OPTS += bluez=no
-- 
1.8.1.2
