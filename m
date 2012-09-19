From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
Date: Wed, 19 Sep 2012 14:52:30 +0200
Subject: [Buildroot] [PATCH v2 2/2] ccid: new package
In-Reply-To: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
References: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
Message-ID: <1348059150-32601-2-git-send-email-waldemar.rymarkiewicz@tieto.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PC/SC driver for USB CCID smart card readers.

http://pcsclite.alioth.debian.org/ccid.html

Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
---
 package/Config.in      |    1 +
 package/ccid/Config.in |   11 +++++++++++
 package/ccid/ccid.mk   |   19 +++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/ccid/Config.in
 create mode 100644 package/ccid/ccid.mk

diff --git a/package/Config.in b/package/Config.in
index dcc84b6..a0fb593 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -382,6 +382,7 @@ source "package/zxing/Config.in"
 endmenu
 
 menu "Hardware handling"
+source "package/ccid/Config.in"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
new file mode 100644
index 0000000..d67bc0e
--- /dev/null
+++ b/package/ccid/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_CCID
+	bool "ccid"
+	select BR2_PACKAGE_PCSC_LITE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  PC/SC driver for USB CCID smart card readers
+
+	  http://pcsclite.alioth.debian.org/ccid.html
+
+comment "ccid needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
new file mode 100644
index 0000000..cb59451
--- /dev/null
+++ b/package/ccid/ccid.mk
@@ -0,0 +1,19 @@
+##########################################################
+#
+# CCID
+#
+# ########################################################
+CCID_VERSION = 1.4.7
+CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
+CCID_SITE = https://alioth.debian.org/frs/download.php/3730
+CCID_INSTALL_STAGING = YES
+CCID_DEPENDENCIES = pcsc-lite host-pkg-config
+
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+CCID_CONF_OPT += --enable-libusb
+CCID_DEPENDENCIES += libusb
+else
+CCID_CONF_OPT += --disable-libusb
+endif
+
+$(eval $(call autotools-package))
-- 
1.7.10
