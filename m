From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 24 Aug 2011 10:35:23 +0200
Subject: [Buildroot] [PATCH] New package: bluez-utils
Message-ID: <4E54B7CB.500@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

userland tools and daemons for Bluetooth

Signed-off-by: Bob Liu <lliubbo@gmail.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                  |    1 +
 package/bluez_utils/Config.in      |   12 ++++++++++++
 package/bluez_utils/bluez_utils.mk |   13 +++++++++++++
 3 files changed, 26 insertions(+)
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
@@ -0,0 +1,12 @@
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
+comment "bluez-utils require a toolchain with WCHAR support"
+	depends on !(BR2_USE_WCHAR)
Index: b/package/bluez_utils/bluez_utils.mk
===================================================================
--- /dev/null
+++ b/package/bluez_utils/bluez_utils.mk
@@ -0,0 +1,13 @@
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
+BLUEZ_UTILS_CONF_OPT = --enable-hidd --enable-test --enable-alsa
+
+$(eval $(call AUTOTARGETS,package,bluez_utils))
