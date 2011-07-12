From: ruckuus at gmail.com <ruckuus@gmail.com>
Date: Tue, 12 Jul 2011 17:10:37 +0700
Subject: [Buildroot] [PATCH] pcsc-lite and ccid support
Message-ID: <1310465437-30946-1-git-send-email-ruckuus@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Dwi Sasongko S <ruckuus@gmail.com>

This is support for a generic usb smartcard reader.

See the project page:
http://pcsclite.alioth.debian.org/

List of supported hardware:
http://pcsclite.alioth.debian.org/ccid/section.html

Signed-off-by: Dwi Sasongko S <ruckuus@gmail.com>
---
 package/Config.in              |    2 ++
 package/ccid/Config.in         |   15 +++++++++++++++
 package/ccid/ccid.mk           |   13 +++++++++++++
 package/pcsc-lite/Config.in    |    8 ++++++++
 package/pcsc-lite/pcsc-lite.mk |   13 +++++++++++++
 5 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 package/ccid/Config.in
 create mode 100644 package/ccid/ccid.mk
 create mode 100644 package/pcsc-lite/Config.in
 create mode 100644 package/pcsc-lite/pcsc-lite.mk

diff --git a/package/Config.in b/package/Config.in
index 09aa76a..db82d95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -303,6 +303,7 @@ source "package/libiqrf/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/python-serial/Config.in"
+source "package/pcsc-lite/Config.in"
 endmenu
 
 if BROKEN
@@ -342,6 +343,7 @@ source "package/libnspr/Config.in"
 source "package/liboil/Config.in"
 source "package/libsigc/Config.in"
 source "package/startup-notification/Config.in"
+source "package/ccid/Config.in"
 endmenu
 
 menu "Text and terminal handling"
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
new file mode 100644
index 0000000..35bec37
--- /dev/null
+++ b/package/ccid/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CCID
+	bool "ccid"
+	select BR2_PACKAGE_PKG_CONFIG
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_PCSC_LITE
+	help
+	  This package provides the source code for a generic USB CCID 
+	  (Chip/Smart Card Interface Device) driver and ICCD (Integrated Circuit(s) Card Devices)
+	  
+	  For more information, please visit the project page: 
+	  http://pcsclite.alioth.debian.org/ccid.html
+
+	  List of supported hardware:
+	  http://pcsclite.alioth.debian.org/ccid/section.html
+
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
new file mode 100644
index 0000000..3263ccd
--- /dev/null
+++ b/package/ccid/ccid.mk
@@ -0,0 +1,13 @@
+##########################################################
+#
+# CCID
+#
+# ########################################################
+CCID_VERSION = 1.4.4 
+CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
+CCID_SITE = https://alioth.debian.org/frs/download.php/3579
+CCID_INSTALL_STAGING = YES
+CCID_INSTALL_TARGET = YES
+CCID_DEPENDENCIES = pkg-config libusb pcsc-lite
+
+$(eval $(call AUTOTARGETS, package, ccid))
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
new file mode 100644
index 0000000..55ac6d3
--- /dev/null
+++ b/package/pcsc-lite/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PCSC_LITE
+	bool "pcsc-lite"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Middleware to access a smart card using SCard API (PC/SC).
+	  For more information, please visit:
+	  http://pcsclite.alioth.debian.org/pcsclite.html
+
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
new file mode 100644
index 0000000..2fdda5f
--- /dev/null
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -0,0 +1,13 @@
+##########################################################
+#
+# PCSC-Lite
+#
+# ########################################################
+PCSC_LITE_VERSION = 1.7.4
+PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
+PCSC_LITE_SITE = https://alioth.debian.org/frs/download.php/3598
+PCSC_LITE_INSTALL_STAGING = YES
+PCSC_LITE_INSTALL_TARGET = YES
+PCSC_LITE_CONF_OPT = --disable-libudev --enable-libusb --enable-embedded
+
+$(eval $(call AUTOTARGETS, package, pcsc-lite))
-- 
1.7.0.4
