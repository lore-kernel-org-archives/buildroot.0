From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 10:27:46 +0200
Subject: [Buildroot] [git commit] package/apcupsd: new package
Message-ID: <20200419123527.DC0E48E4FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d12b63b741586b89c4017551308c43512a617287
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apcupsd is a UPS control system that permits orderly shutdown of your
computer in the event of a power failure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/apcupsd/Config.in    | 64 ++++++++++++++++++++++++++++++++++++++++++
 package/apcupsd/apcupsd.hash |  6 ++++
 package/apcupsd/apcupsd.mk   | 67 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 139 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c831d9d2d1..67456d0c4b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1171,6 +1171,7 @@ F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
+F:	package/apcupsd/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
diff --git a/package/Config.in b/package/Config.in
index ccf54f2417..7a0ff1716d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -415,6 +415,7 @@ endmenu
 	source "package/aer-inject/Config.in"
 	source "package/am335x-pru-package/Config.in"
 	source "package/amd-catalyst/Config.in"
+	source "package/apcupsd/Config.in"
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
 	source "package/biosdevname/Config.in"
diff --git a/package/apcupsd/Config.in b/package/apcupsd/Config.in
new file mode 100644
index 0000000000..fc77e7c208
--- /dev/null
+++ b/package/apcupsd/Config.in
@@ -0,0 +1,64 @@
+config BR2_PACKAGE_APCUPSD
+	bool "apcupsd"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  A daemon for controlling APC UPSes.
+
+	  http://www.apcupsd.org/
+
+if BR2_PACKAGE_APCUPSD
+
+config BR2_PACKAGE_APCUPSD_APCSMART
+	bool "apcsmart"
+	help
+	  Compile APC SmartUPS serial driver
+
+config BR2_PACKAGE_APCUPSD_DUMB
+	bool "dumb"
+	help
+	  Compile dumb UPS driver
+
+config BR2_PACKAGE_APCUPSD_MODBUS
+	bool "modbus"
+	help
+	  Compile MODBUS driver code
+
+config BR2_PACKAGE_APCUPSD_MODBUS_USB
+	bool "modbus usb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	select BR2_PACKAGE_APCUPSD_MODBUS
+	help
+	  Compile MODBUS/USB driver code
+
+comment "modbus usb support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_APCUPSD_NET
+	bool "net"
+	help
+	  Compile networking driver for slaves
+
+config BR2_PACKAGE_APCUPSD_PCNET
+	bool "pcnet"
+	help
+	  Compile PCNET driver code
+
+config BR2_PACKAGE_APCUPSD_SNMP
+	bool "snmp"
+	help
+	  Compile SNMP driver
+
+config BR2_PACKAGE_APCUPSD_USB
+	bool "usb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  Compile USB UPS code
+
+comment "usb support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
diff --git a/package/apcupsd/apcupsd.hash b/package/apcupsd/apcupsd.hash
new file mode 100644
index 0000000000..6795560f62
--- /dev/null
+++ b/package/apcupsd/apcupsd.hash
@@ -0,0 +1,6 @@
+# From https://sourceforge.net/projects/apcupsd/files/apcupsd%20-%20Stable/3.14.14/
+md5  cc8f5ced77f38906a274787acb9bc980  apcupsd-3.14.14.tar.gz
+sha1  f027fa141c929371fe860443b6d911ef3a3606fb  apcupsd-3.14.14.tar.gz
+# Locally computed:
+sha256  db7748559b6b4c3784f9856561ef6ac6199ef7bd019b3edcd7e0a647bf8f9867  apcupsd-3.14.14.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
new file mode 100644
index 0000000000..e750657236
--- /dev/null
+++ b/package/apcupsd/apcupsd.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# apcupsd
+#
+################################################################################
+
+APCUPSD_VERSION = 3.14.14
+APCUPSD_SITE = http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/$(APCUPSD_VERSION)
+APCUPSD_LICENSE = GPL-2.0
+APCUPSD_LICENSE_FILES = COPYING
+APCUPSD_CONF_OPTS = --disable-test
+
+ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+APCUPSD_CONF_ENV = ac_cv_path_usbcfg=$(STAGING_DIR)/usr/bin/libusb-config
+endif
+
+ifeq ($(BR2_PACKAGE_APCUPSD_APCSMART),y)
+APCUPSD_CONF_OPTS += --enable-apcsmart
+else
+APCUPSD_CONF_OPTS += --disable-apcsmart
+endif
+
+ifeq ($(BR2_PACKAGE_APCUPSD_DUMB),y)
+APCUPSD_CONF_OPTS += --enable-dumb
+else
+APCUPSD_CONF_OPTS += --disable-dumb
+endif
+
+ifeq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB),y)
+APCUPSD_CONF_OPTS += --enable-modbus-usb
+APCUPSD_DEPENDENCIES = libusb libusb-compat
+else
+APCUPSD_CONF_OPTS += --disable-modbus-usb
+endif
+
+ifeq ($(BR2_PACKAGE_APCUPSD_MODBUS),y)
+APCUPSD_CONF_OPTS += --enable-modbus
+else
+APCUPSD_CONF_OPTS += --disable-modbus
+endif
+
+ifeq ($(BR2_PACKAGE_APCUPSD_NET),y)
+APCUPSD_CONF_OPTS += --enable-net
+else
+APCUPSD_CONF_OPTS += --disable-net
+endif
+
+ifeq ($(BR2_PACKAGE_APCUPSD_PCNET),y)
+APCUPSD_CONF_OPTS += --enable-pcnet
+else
+APCUPSD_CONF_OPTS += --disable-pcnet
+endif
+
+ifeq ($(BR2_PACKAGE_APCUPSD_SNMP),y)
+APCUPSD_CONF_OPTS += --enable-snmp
+else
+APCUPSD_CONF_OPTS += --disable-snmp
+endif
+
+ifeq ($(BR2_PACKAGE_APCUPSD_USB),y)
+APCUPSD_CONF_OPTS += --enable-usb
+APCUPSD_DEPENDENCIES = libusb libusb-compat
+else
+APCUPSD_CONF_OPTS += --disable-usb
+endif
+
+$(eval $(autotools-package))
