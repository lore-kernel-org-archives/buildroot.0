From: Marcin Bis <marcin@bis.org.pl>
Date: Mon, 31 Mar 2014 10:58:00 +0200
Subject: [Buildroot] [PATCH v5] bluez5_utils: new package
In-Reply-To: <532F69C8.5060202@trzebnica.net>
References: <532F69C8.5060202@trzebnica.net>
Message-ID: <1396256280-23284-1-git-send-email-marcin@bis.org.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds Bluez 5.x.
API is not backwards compatible with BlueZ 4.x

BlueZ utils will use systemd and/or udev if enabled.
Contains a hook for installing GATT support tool, wchich is always
build but not installed by default.

Signed-off-by: Marcin Bis <marcin@bis.org.pl>
---
 package/Config.in                    |    1 +
 package/bluez5_utils/Config.in       |   54 ++++++++++++++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk |   54 ++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 package/bluez5_utils/Config.in
 create mode 100644 package/bluez5_utils/bluez5_utils.mk

diff --git a/package/Config.in b/package/Config.in
index e816603..0be90f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -876,6 +876,7 @@ source "package/axel/Config.in"
 source "package/bcusdk/Config.in"
 source "package/bind/Config.in"
 source "package/bluez_utils/Config.in"
+source "package/bluez5_utils/Config.in"
 source "package/bmon/Config.in"
 source "package/boa/Config.in"
 source "package/bridge-utils/Config.in"
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
new file mode 100644
index 0000000..809dd8a
--- /dev/null
+++ b/package/bluez5_utils/Config.in
@@ -0,0 +1,54 @@
+config BR2_PACKAGE_BLUEZ5_UTILS
+	bool "bluez-utils 5.x"
+	depends on !BR2_avr32
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
+	depends on BR2_USE_MMU # dbus
+	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBICAL
+	select BR2_PACKAGE_READLINE
+	help
+	  bluez utils version 5.x
+
+	  With this release BlueZ only supports the new Bluetooth Management
+	  kernel interface (introduced in Linux 3.4).
+	  For Low Energy support at least kernel version 3.5 is needed.
+
+	  The API is not backwards compatible with BlueZ 4.
+
+	  Bluez utils will use systemd and/or udev if enabled.
+
+	  http://www.bluez.org
+	  http://www.kernel.org/pub/linux/bluetooth
+
+if BR2_PACKAGE_BLUEZ5_UTILS
+
+config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
+	bool "build experimental plugins"
+	help
+	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
+
+config BR2_PACKAGE_BLUEZ5_UTILS_TEST
+	bool "enable test"
+	help
+	  Enable test.
+
+config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
+	bool "install GATT tool"
+	help
+	  Generic Attribute Profile (GATT) support. This provides profile
+	  discovery and description services for Bluetooth Low Energy.
+	  This will install the gatttool utility.
+
+	  It is always build with BlueZ 5.x, but upstream choose not to install
+	  it by default.
+
+endif
+
+comment "bluez5-utils needs a toolchain w/ wchar, threads"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "bluez5-utils conflicts with older bluez-utils version"
+	depends on BR2_PACKAGE_BLUEZ_UTILS
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
new file mode 100644
index 0000000..85cbb43
--- /dev/null
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# bluez5_utils
+#
+################################################################################
+
+BLUEZ5_UTILS_VERSION = 5.17
+BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
+BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
+BLUEZ5_UTILS_INSTALL_STAGING = YES
+BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2 libical readline
+BLUEZ5_UTILS_CONF_OPT = --enable-tools --enable-library
+BLUEZ5_UTILS_LICENSE = GPLv2+ LGPLv2.1+
+BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
+
+# experimental plugins
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL),y)
+	BLUEZ5_UTILS_CONF_OPT += --enable-experimental
+else
+	BLUEZ5_UTILS_CONF_OPT += --disable-experimental
+endif
+
+# install gatttool (For some reason upstream choose not to do it by default)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
+define BLUEZ5_UTILS_INSTALL_GATTTOOL
+	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin
+endef
+BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
+endif
+
+# enable test
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_TEST),y)
+	BLUEZ5_UTILS_CONF_OPT += --enable-test
+else
+	BLUEZ5_UTILS_CONF_OPT += --disable-test
+endif
+
+# use udev if available
+ifeq ($(BR2_PACKAGE_UDEV),y)
+        BLUEZ5_UTILS_CONF_OPT += --enable-udev
+        BLUEZ5_UTILS_DEPENDENCIES += udev
+else
+        BLUEZ5_UTILS_CONF_OPT += --disable-udev
+endif
+
+# integrate with systemd if available
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+        BLUEZ5_UTILS_CONF_OPT += --enable-systemd
+        BLUEZ5_UTILS_DEPENDENCIES += systemd
+else
+        BLUEZ5_UTILS_CONF_OPT += --disable-systemd
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
