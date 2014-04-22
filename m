From: Jason Pruitt <jrspruitt@gmail.com>
Date: Tue, 22 Apr 2014 08:49:55 -0700
Subject: [Buildroot] [PATCH v2] librtlsdr: new package
Message-ID: <1398181795-11075-1-git-send-email-jrspruitt@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

librtlsdr is a library and software for using a Realtek RTL2832U based
DVB-T dongle as a cheap SDR.

Signed-off-by: Jason Pruitt <jrspruitt@gmail.com>
---
Changes v1 -> v2:
    - Added help to option (suggested by Thomas De Schampheleire)
    - Added _LICENSE_FILE (suggested by Thomas De Schampheleire)
    - Auto select udev rules (suggested by Thomas Petazzoni)

 package/Config.in              |    1 +
 package/librtlsdr/Config.in    |   22 ++++++++++++++++++++++
 package/librtlsdr/librtlsdr.mk |   22 ++++++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 package/librtlsdr/Config.in
 create mode 100644 package/librtlsdr/librtlsdr.mk

diff --git a/package/Config.in b/package/Config.in
index 07fd166..ad3956d 100644
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
index 0000000..efe2b9e
--- /dev/null
+++ b/package/librtlsdr/Config.in
@@ -0,0 +1,22 @@
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
+    help
+        Detach associated kernel driver on startup if
+        if one is loaded.
+endif
+
+comment "librtlsdr needs a toolchain w/ threads"
+depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
new file mode 100644
index 0000000..0b88a34
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
+LIBRTLSDR_LICENSE = GPLv2
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
1.7.10.4
