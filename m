From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 30 Aug 2011 15:36:11 +0200
Subject: [Buildroot] [PATCH v2] New package: bluez-utils
Message-ID: <4E5CE74B.7040104@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bluetooth utils often used in embedded system, add it to package.

Signed-off-by: Bob Liu <lliubbo@gmail.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
v2: added option to select audio, USB and compat support

 package/Config.in                  |    1 
 package/bluez_utils/Config.in      |   34 +++++++++++++++++++++++++++
 package/bluez_utils/bluez_utils.mk |   46 +++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 package/bluez_utils/Config.in
 create mode 100644 package/bluez_utils/bluez_utils.mk

Index: b/package/Config.in
===================================================================
--- a/package/Config.in
+++ b/package/Config.in
@@ -386,6 +386,7 @@
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
+source "package/bluez_utils/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/boa/Config.in"
 endif
Index: b/package/bluez_utils/Config.in
===================================================================
--- /dev/null
+++ b/package/bluez_utils/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_BLUEZ_UTILS
+	bool "bluez-utils"
+	depends on BR2_USE_WCHAR # libglib2
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  bluez utils
+
+	  http://www.kernel.org/pub/linux/bluetooth
+
+if BR2_PACKAGE_BLUEZ_UTILS
+
+config BR2_PACKAGE_BLUEZ_UTILS_COMPAT
+	bool "BlueZ 3.x compatibility binaries"
+	help
+	  BlueZ 3.x compatibility binaries like pand, hidd, sdp
+
+config BR2_PACKAGE_BLUEZ_UTILS_AUDIO
+	bool "audio support"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  Audio support
+
+config BR2_PACKAGE_BLUEZ_UTILS_USB
+	bool "USB support"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  USB support
+
+endif
+
+comment "bluez-utils require a toolchain with WCHAR support"
+	depends on !(BR2_USE_WCHAR)
Index: b/package/bluez_utils/bluez_utils.mk
===================================================================
--- /dev/null
+++ b/package/bluez_utils/bluez_utils.mk
@@ -0,0 +1,46 @@
+#############################################################
+#
+# bluez_utils
+#
+#############################################################
+BLUEZ_UTILS_VERSION = 4.96
+BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.gz
+BLUEZ_UTILS_SITE = http://www.kernel.org/pub/linux/bluetooth/
+BLUEZ_UTILS_INSTALL_STAGING = YES
+BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
+BLUEZ_UTILS_CONF_OPT = --enable-test --enable-tools
+
+# BlueZ 3.x compatibility
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_COMPAT),y)
+BLUEZ_UTILS_CONF_OPT +=	\
+	--enable-hidd	\
+	--enable-pand	\
+	--enable-sdp	\
+	--enable-dund
+endif
+
+# audio support
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_AUDIO),y)
+BLUEZ_UTILS_DEPENDENCIES +=	\
+	alsa-lib		\
+	libsndfile
+BLUEZ_UTILS_CONF_OPT +=	\
+	--enable-alsa	\
+	--enable-audio
+else
+BLUEZ_UTILS_CONF_OPT +=	\
+	--disable-alsa	\
+	--disable-audio
+endif
+
+# USB support
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_USB),y)
+BLUEZ_UTILS_DEPENDENCIES += libusb
+BLUEZ_UTILS_CONF_OPT +=	\
+	--enable-usb
+else
+BLUEZ_UTILS_CONF_OPT +=	\
+	--disable-usb
+endif
+
+$(eval $(call AUTOTARGETS,package,bluez_utils))
