From: ruckuus at gmail.com <ruckuus@gmail.com>
Date: Tue, 12 Jul 2011 13:28:09 +0700
Subject: [Buildroot] [PATCH] pcsc-lite and ccid support
Message-ID: <1310452089-23322-1-git-send-email-ruckuus@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Dwi Sasongko S <ruckuus@gmail.com>

Support for accessing USB smart card reader.

http://pcsclite.alioth.debian.org/

Signed-off-by: Dwi Sasongko S <ruckuus@gmail.com>
---
 package/Config.in              |    2 ++
 package/ccid/Config.in         |    6 ++++++
 package/ccid/ccid.mk           |   13 +++++++++++++
 package/pcsc-lite/Config.in    |    6 ++++++
 package/pcsc-lite/pcsc-lite.mk |   14 ++++++++++++++
 5 files changed, 41 insertions(+), 0 deletions(-)
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
index 0000000..d5ff34e
--- /dev/null
+++ b/package/ccid/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_CCID
+	depends on BR2_PACKAGE_PCSC_LITE
+	bool "ccid"
+	help
+		Card reader driver
+
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
new file mode 100644
index 0000000..2eb2e4d
--- /dev/null
+++ b/package/ccid/ccid.mk
@@ -0,0 +1,13 @@
+##########################################################
+#
+# CCID
+#
+# ########################################################
+CCID_VERSION = 5706
+CCID_SITE = svn://anonscm.debian.org/pcsclite/trunk/Drivers/ccid
+CCID_INSTALL_STAGING = YES
+CCID_INSTALL_TARGET = YES
+CCID_AUTORECONF = YES
+CCID_DEPENDENCIES = pcsc-lite libusb
+
+$(eval $(call AUTOTARGETS, package, ccid))
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
new file mode 100644
index 0000000..51e32c8
--- /dev/null
+++ b/package/pcsc-lite/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PCSC_LITE
+	select BR2_PACKAGE_CCID
+	bool "pcsc-lite"
+	help
+		Middleware to be used with PC/SC
+
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
new file mode 100644
index 0000000..9457b75
--- /dev/null
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -0,0 +1,14 @@
+##########################################################
+#
+# PCSC-Lite
+#
+# ########################################################
+PCSC_LITE_VERSION = 5853
+PCSC_LITE_SITE = svn://anonscm.debian.org/pcsclite/trunk/PCSC
+PCSC_LITE_INSTALL_STAGING = YES
+PCSC_LITE_INSTALL_TARGET = YES
+PCSC_LITE_AUTORECONF = YES
+PCSC_LITE_CONF_OPT = --disable-libudev --enable-libusb --enable-embedded
+PCSC_LITE_DEPENDENCIES=libusb
+
+$(eval $(call AUTOTARGETS, package, pcsc-lite))
-- 
1.7.0.4
