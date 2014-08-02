From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Aug 2014 12:55:39 +0200
Subject: [Buildroot] [git commit] bluez5_utils: new package
Message-ID: <20140802110051.8ED399D381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb1a0c0c96da28d815ed5861320db364b08f58a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds Bluez 5.x. Its API is not backwards compatible with
BlueZ 4 so it is packaged separately from BlueZ 4.

BlueZ utils will use systemd and/or udev if enabled. It contains a
hook to install the GATT support tool, which is always built but not
installed by default.

[Thomas:
 - Add dependency on 3.4 kernel headers
 - Add options for OBEX support and client support, to make the
   libical and readline dependencies optional.
 - Rewrap Config.in help text.
 - Adapt indentation in .mk file.
 - Bump to version 5.21.
 - Use BR2_PACKAGE_HAS_UDEV instead of BR2_PACKAGE_UDEV.]

Signed-off-by: Marcin Bis <marcin@bis.org.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/bluez5_utils/Config.in       |   67 +++++++++++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk |   72 ++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ee158fa..2f92c19 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -943,6 +943,7 @@ menu "Networking applications"
 	source "package/bcusdk/Config.in"
 	source "package/bind/Config.in"
 	source "package/bluez_utils/Config.in"
+	source "package/bluez5_utils/Config.in"
 	source "package/bmon/Config.in"
 	source "package/boa/Config.in"
 	source "package/bridge-utils/Config.in"
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
new file mode 100644
index 0000000..62bac5d
--- /dev/null
+++ b/package/bluez5_utils/Config.in
@@ -0,0 +1,67 @@
+config BR2_PACKAGE_BLUEZ5_UTILS
+	bool "bluez-utils 5.x"
+	depends on !BR2_avr32
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
+	depends on BR2_USE_MMU # dbus
+	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  bluez utils version 5.x
+
+	  With this release BlueZ only supports the new Bluetooth
+	  Management kernel interface (introduced in Linux 3.4).
+
+	  For Low Energy support at least kernel version 3.5 is
+	  needed.
+
+	  The API is not backward compatible with BlueZ 4.
+
+	  Bluez utils will use systemd and/or udev if enabled.
+
+	  http://www.bluez.org
+	  http://www.kernel.org/pub/linux/bluetooth
+
+if BR2_PACKAGE_BLUEZ5_UTILS
+
+config BR2_PACKAGE_BLUEZ5_UTILS_OBEX
+	bool "build OBEX support"
+	select BR2_PACKAGE_LIBICAL
+	help
+	  Enable the OBEX support in Bluez 5.x.
+
+config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
+	bool "build CLI client"
+	select BR2_PACKAGE_READLINE
+	help
+	  Enable the Bluez 5.x command line client.
+
+config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
+	bool "build experimental plugins"
+	help
+	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
+
+config BR2_PACKAGE_BLUEZ5_UTILS_TEST
+	bool "build tests"
+	help
+	  Build BlueZ 5.x tests
+
+config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
+	bool "install GATT tool"
+	help
+	  Generic Attribute Profile (GATT) support. This provides
+	  profile discovery and description services for Bluetooth Low
+	  Energy.  This will install the gatttool utility.
+
+	  It is always built with BlueZ 5.x, but upstream choose not
+	  to install it by default.
+
+endif
+
+comment "bluez5-utils needs a toolchain w/ wchar, threads, headers >= 3.4"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+
+comment "bluez5-utils conflicts with older bluez-utils version"
+	depends on BR2_PACKAGE_BLUEZ_UTILS
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
new file mode 100644
index 0000000..e22e8a4
--- /dev/null
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# bluez5_utils
+#
+################################################################################
+
+BLUEZ5_UTILS_VERSION = 5.21
+BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
+BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
+BLUEZ5_UTILS_INSTALL_STAGING = YES
+BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
+BLUEZ5_UTILS_LICENSE = GPLv2+ LGPLv2.1+
+BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
+
+BLUEZ5_UTILS_CONF_OPT = 	\
+	--enable-tools 		\
+	--enable-library 	\
+	--disable-cups
+
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
+BLUEZ5_UTILS_CONF_OPT += --enable-obex
+BLUEZ5_UTILS_DEPENDENCIES += libical
+else
+BLUEZ5_UTILS_CONF_OPT += --disable-obex
+endif
+
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_CLIENT),y)
+BLUEZ5_UTILS_CONF_OPT += --enable-client
+BLUEZ5_UTILS_DEPENDENCIES += readline
+else
+BLUEZ5_UTILS_CONF_OPT += --disable-client
+endif
+
+# experimental plugins
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL),y)
+BLUEZ5_UTILS_CONF_OPT += --enable-experimental
+else
+BLUEZ5_UTILS_CONF_OPT += --disable-experimental
+endif
+
+# install gatttool (For some reason upstream choose not to do it by default)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
+define BLUEZ5_UTILS_INSTALL_GATTTOOL
+	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin/gatttool
+endef
+BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
+endif
+
+# enable test
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_TEST),y)
+BLUEZ5_UTILS_CONF_OPT += --enable-test
+else
+BLUEZ5_UTILS_CONF_OPT += --disable-test
+endif
+
+# use udev if available
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+BLUEZ5_UTILS_CONF_OPT += --enable-udev
+BLUEZ5_UTILS_DEPENDENCIES += udev
+else
+BLUEZ5_UTILS_CONF_OPT += --disable-udev
+endif
+
+# integrate with systemd if available
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+BLUEZ5_UTILS_CONF_OPT += --enable-systemd
+BLUEZ5_UTILS_DEPENDENCIES += systemd
+else
+BLUEZ5_UTILS_CONF_OPT += --disable-systemd
+endif
+
+$(eval $(autotools-package))
