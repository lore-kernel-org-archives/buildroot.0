From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 22:42:21 +0200
Subject: [Buildroot] [git commit] pcsc-lite: new package
Message-ID: <20121008204732.84E9C997FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c345d91cf6b9664e9edae36c005f20cbff4853f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Middleware to access a smart card using SCard API (PC/SC).

http://pcsclite.alioth.debian.org/

Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/pcsc-lite/Config.in    |   31 +++++++++++++++++++++++++++++++
 package/pcsc-lite/pcsc-lite.mk |   36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d777454..c1b4041 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
 source "package/mtdev/Config.in"
+source "package/pcsc-lite/Config.in"
 endmenu
 
 menu "Javascript"
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
new file mode 100644
index 0000000..621cc66
--- /dev/null
+++ b/package/pcsc-lite/Config.in
@@ -0,0 +1,31 @@
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
+	help
+	  Select Y if you want to support usb smart card readers.
+
+config BR2_PACKAGE_PCSC_LITE_DEBUGATR
+	bool "enable ATR debug messages"
+	help
+	  Enable ATR debug messages from pcscd.
+
+config BR2_PACKAGE_PCSC_LITE_EMBEDDED
+	bool "enable embedded mode"
+	help
+	  Limit RAM and CPU resources by disabling logs.
+
+endif
+
+comment "pcsc-lite needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
new file mode 100644
index 0000000..6c57dbb
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
+$(eval $(autotools-package))
