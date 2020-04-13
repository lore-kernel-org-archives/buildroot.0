From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 16:29:30 -0600
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: new package
Message-ID: <20200413222930.99472-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apcupsd is a UPS control system that permits orderly shutdown of your
computer in the event of a power failure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/apcupsd/Config.in    |  9 +++++++++
 package/apcupsd/apcupsd.hash |  6 ++++++
 package/apcupsd/apcupsd.mk   | 23 +++++++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/apcupsd/Config.in
 create mode 100644 package/apcupsd/apcupsd.hash
 create mode 100644 package/apcupsd/apcupsd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cea4a18cd9..e89297a708 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1169,6 +1169,7 @@ F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
+F:	package/apcupsd/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
diff --git a/package/Config.in b/package/Config.in
index e2868dd1b5..6d6b5146ce 100644
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
index 0000000000..d8bf07e1fa
--- /dev/null
+++ b/package/apcupsd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_APCUPSD
+	bool "apcupsd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  A daemon for controlling APC UPSes.
+
+	  http://www.apcupsd.org/
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
index 0000000000..13dbd14c4f
--- /dev/null
+++ b/package/apcupsd/apcupsd.mk
@@ -0,0 +1,23 @@
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
+APCUPSD_DEPENDENCIES = libusb libusb-compat
+APCUPSD_CONF_OPTS = \
+	  --enable-apcsmart \
+	  --enable-dumb \
+	  --enable-usb \
+	  --enable-net \
+	  --enable-snmp \
+	  --disable-test \
+	  --enable-pcnet \
+	  --enable-modbus-usb \
+	  --enable-modbus
+
+$(eval $(autotools-package))
-- 
2.20.1
