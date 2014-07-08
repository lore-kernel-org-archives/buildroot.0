From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 17:28:03 +0200
Subject: [Buildroot] [git commit] librtlsdr: new package
Message-ID: <20140708153829.5E3639D1CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec13c098521fec94207a05294528614ae051c58e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

librtlsdr is a library and software for using a Realtek RTL2832U based
DVB-T dongle as a cheap SDR.

[Thomas: change license to GPLv2+, reword help text for the detach
driver option.]

Signed-off-by: Jason Pruitt <jrspruitt@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/librtlsdr/Config.in    |   24 ++++++++++++++++++++++++
 package/librtlsdr/librtlsdr.mk |   22 ++++++++++++++++++++++
 3 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8e1c391..f30c25f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -649,6 +649,7 @@ menu "Hardware handling"
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
