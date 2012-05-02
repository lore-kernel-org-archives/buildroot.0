From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  2 May 2012 12:40:02 +0100
Subject: [Buildroot] [PATCH] libnfc: new package
Message-ID: <1335958802-15798-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in        |    1 +
 package/libnfc/Config.in |    8 ++++++++
 package/libnfc/libnfc.mk |   16 ++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/libnfc/Config.in
 create mode 100644 package/libnfc/libnfc.mk

diff --git a/package/Config.in b/package/Config.in
index ed66c05..a479528 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -337,6 +337,7 @@ source "package/tslib/Config.in"
 source "package/libftdi/Config.in"
 source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
+source "package/libnfc/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
new file mode 100644
index 0000000..42418e0
--- /dev/null
+++ b/package/libnfc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBNFC
+	bool "libnfc"
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  Public platform independent Near Field Communication (NFC) library.
+
+	  http://www.libnfc.org/
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
new file mode 100644
index 0000000..f1028b1
--- /dev/null
+++ b/package/libnfc/libnfc.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# libnfc
+#
+#############################################################
+LIBNFC_VERSION = 1.5.1
+LIBNFC_SITE = http://libnfc.googlecode.com/files/
+LIBNFC_SOURCE = libnfc-$(LIBNFC_VERSION).tar.gz
+LIBNFC_INSTALL_STAGING = YES
+
+LIBNFC_DEPENDENCIES = host-pkg-config libusb libusb-compat
+
+# N.B. The acr122 driver requires pcsc-lite.
+LIBNFC_CONF_OPT = --with-drivers=arygon,pn53x_usb
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.5
