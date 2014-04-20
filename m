From: Jason Pruitt <jrspruitt@gmail.com>
Date: Sun, 20 Apr 2014 16:21:58 -0700
Subject: [Buildroot] [PATCH 1/1] librtlsdr: new package
Message-ID: <1398036119-7335-1-git-send-email-jrspruitt@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jason <jrspruitt@gmail.com>

librtlsdr is a library and software for using a Realtek RTL2832U based
DVB-T dongle as a cheap SDR.

Signed-off-by: Jason <jrspruitt@gmail.com>
---
 package/Config.in              |    1 +
 package/librtlsdr/Config.in    |   25 +++++++++++++++++++++++++
 package/librtlsdr/librtlsdr.mk |   21 +++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 package/librtlsdr/Config.in
 create mode 100644 package/librtlsdr/librtlsdr.mk

diff --git a/package/Config.in b/package/Config.in
index 1361e9f..3690f7f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -628,6 +628,7 @@ source "package/libmbim/Config.in"
 source "package/libnfc/Config.in"
 source "package/libqmi/Config.in"
 source "package/libraw1394/Config.in"
+source "package/librtlsdr/Config.in"
 source "package/libserial/Config.in"
 source "package/libsoc/Config.in"
 source "package/libusb/Config.in"
diff --git a/package/librtlsdr/Config.in b/package/librtlsdr/Config.in
new file mode 100644
index 0000000..9df632d
--- /dev/null
+++ b/package/librtlsdr/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_LIBRTLSDR
+	bool "librtlsdr"
+	select BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Library and command line programs for accessing
+	  RTL2832U SDR dongles.
+
+	  http://sdr.osmocom.org/trac/wiki/rtl-sdr/
+
+if BR2_PACKAGE_LIBRTLSDR
+
+config BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER
+	bool "Detach driver if loaded"
+	default y
+
+if BR2_PACKAGE_HAS_UDEV
+config BR2_PACKAGE_LIBRTLSDR_UDEV_RULES
+	bool "Install udev rules"
+	default y
+endif
+endif
+
+comment "librtlsdr needs a toolchain w/ threads"
+depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
new file mode 100644
index 0000000..595b3ba
--- /dev/null
+++ b/package/librtlsdr/librtlsdr.mk
@@ -0,0 +1,21 @@
+##########################################################################
+#
+# librtlsdr
+#
+##########################################################################
+
+LIBRTLSDR_VERSION = v0.5.3
+LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
+LIBRTLSDR_LICENSE = GPLv2
+LIBRTLSDR_INSTALL_STAGING = YES
+LIBRTLSDR_DEPENDENCIES = libusb
+
+ifeq ($(BR2_PACKAGE_LIBRTLSDR_UDEV_RULES),y)
+LIBRTLSDR_CONF_OPT += -DINSTALL_UDEV_RULES=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER),y)
+LIBRTLSDR_CONF_OPT += -DDETACH_KERNEL_DRIVER=1
+endif
+
+$(eval $(cmake-package))
-- 
1.7.10.4
