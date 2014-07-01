From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jul 2014 23:00:25 +0200
Subject: [Buildroot] [PATCHv4] librtlsdr: new package
Message-ID: <1404248425-27941-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jason Pruitt <jrspruitt@gmail.com>

librtlsdr is a library and software for using a Realtek RTL2832U based
DVB-T dongle as a cheap SDR.

[Thomas: change license to GPLv2+, reword help text for the detach
driver option.]

Signed-off-by: Jason Pruitt <jrspruitt@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/librtlsdr/Config.in    | 24 ++++++++++++++++++++++++
 package/librtlsdr/librtlsdr.mk | 22 ++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 package/librtlsdr/Config.in
 create mode 100644 package/librtlsdr/librtlsdr.mk

diff --git a/package/Config.in b/package/Config.in
index 9d75c0c..83a1f79 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -647,6 +647,7 @@ menu "Hardware handling"
 	source "package/libnfc/Config.in"
 	source "package/libqmi/Config.in"
 	source "package/libraw1394/Config.in"
+	source "package/librtlsdr/Config.in"
 	source "package/libserial/Config.in"
 	source "package/libsoc/Config.in"
 	source "package/libusb/Config.in"
diff --git a/package/librtlsdr/Config.in b/package/librtlsdr/Config.in
new file mode 100644
index 0000000..1e217bc
--- /dev/null
+++ b/package/librtlsdr/Config.in
@@ -0,0 +1,24 @@
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
+	bool "Detach kernel driver"
+	default y
+	help
+	  Enable this option if you would like librtlsdr to
+	  automatically detach any kernel driver associated to the
+	  RTL2832U USB device on startup if one is loaded.
+
+endif
+
+comment "librtlsdr needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
new file mode 100644
index 0000000..985614a
--- /dev/null
+++ b/package/librtlsdr/librtlsdr.mk
@@ -0,0 +1,22 @@
+##########################################################################
+#
+# librtlsdr
+#
+##########################################################################
+
+LIBRTLSDR_VERSION = v0.5.3
+LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
+LIBRTLSDR_LICENSE = GPLv2+
+LIBRTLSDR_LICENSE_FILES = COPYING
+LIBRTLSDR_INSTALL_STAGING = YES
+LIBRTLSDR_DEPENDENCIES = libusb
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBRTLSDR_CONF_OPT += -DINSTALL_UDEV_RULES=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER),y)
+LIBRTLSDR_CONF_OPT += -DDETACH_KERNEL_DRIVER=1
+endif
+
+$(eval $(cmake-package))
-- 
2.0.0
