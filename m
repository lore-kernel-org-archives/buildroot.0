From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
Date: Fri, 21 Sep 2012 09:32:18 +0200
Subject: [Buildroot] [PATCH v3 1/2] pcsc-lite: new package
Message-ID: <1348212739-32093-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Middleware to access a smart card using SCard API (PC/SC).

http://pcsclite.alioth.debian.org/

Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
---
 package/Config.in              |    1 +
 package/pcsc-lite/Config.in    |   29 +++++++++++++++++++++++++++++
 package/pcsc-lite/pcsc-lite.mk |   36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 package/pcsc-lite/Config.in
 create mode 100644 package/pcsc-lite/pcsc-lite.mk

diff --git a/package/Config.in b/package/Config.in
index a4e0b2c..dcc84b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,7 @@ source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
 source "package/mtdev/Config.in"
+source "package/pcsc-lite/Config.in"
 endmenu
 
 menu "Javascript"
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
new file mode 100644
index 0000000..cfbcb69
--- /dev/null
+++ b/package/pcsc-lite/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_PCSC_LITE
+	bool "pcsc-lite"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Middleware to access smart card using SCard API (PC/SC).
+
+	  http://pcsclite.alioth.debian.org/
+
+if BR2_PACKAGE_PCSC_LITE
+
+config BR2_PACKAGE_PCSC_LITE_FORCE_LIBUSB
+	bool "use libusb"
+	depends on !BR2_PACKAGE_UDEV
+	select BR2_PACKAGE_LIBUSB
+
+config BR2_PACKAGE_PCSC_LITE_DEBUGATR
+	bool "enable ATR debug messages"
+	help
+	  enable ATR debug messages from pcscd
+
+config BR2_PACKAGE_PCSC_LITE_EMBEDDED
+	bool "enable embedded mode"
+	help
+	  limit RAM and CPU resources by disabling features (log)
+
+endif
+
+comment "pcsc-lite needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
new file mode 100644
index 0000000..35d0cf3
--- /dev/null
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -0,0 +1,36 @@
+##########################################################
+#
+# PCSC-Lite
+#
+# ########################################################
+PCSC_LITE_VERSION = 1.8.6
+PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
+PCSC_LITE_SITE = https://alioth.debian.org/frs/download.php/3757
+PCSC_LITE_INSTALL_STAGING = YES
+PCSC_LITE_DEPENDENCIES = host-pkg-config
+
+# - libudev and libusb are optional
+# - libudev and libusb can't be used together
+# - libudev has a priority over libusb
+
+ifeq ($(BR2_PACKAGE_UDEV),y)
+PCSC_LITE_CONF_OPT += --enable-libudev --disable-libusb
+PCSC_LITE_DEPENDENCIES += udev
+else
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+PCSC_LITE_CONF_OPT += --enable-libusb --disable-libudev
+PCSC_LITE_DEPENDENCIES += libusb
+else
+PCSC_LITE_CONF_OPT += --disable-libusb --disable-libudev
+endif
+endif
+
+ifeq ($(PACKAGE_PCSC_LITE_DEBUGATR),y)
+PCSC_LITE_CONF_OPT += --enable-debugatr
+endif
+
+ifeq ($(PACKAGE_PCSC_LITE_EMBEDDED),y)
+PCSC_LITE_CONF_OPT += --enable-embedded
+endif
+
+$(eval $(call autotools-package))
-- 
1.7.10
