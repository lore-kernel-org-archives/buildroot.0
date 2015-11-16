From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 16 Nov 2015 16:54:12 +0000
Subject: [Buildroot] [PATCH] hidapi: new package
Message-ID: <1447692852-21669-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/Config.in          |    1 +
 package/hidapi/Config.in   |   20 ++++++++++++++++++++
 package/hidapi/hidapi.hash |    2 ++
 package/hidapi/hidapi.mk   |   27 +++++++++++++++++++++++++++
 4 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 package/hidapi/Config.in
 create mode 100644 package/hidapi/hidapi.hash
 create mode 100644 package/hidapi/hidapi.mk

diff --git a/package/Config.in b/package/Config.in
index bdc3063..04800c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -864,6 +864,7 @@ menu "Hardware handling"
 	source "package/ccid/Config.in"
 	source "package/dtc/Config.in"
 	source "package/gnu-efi/Config.in"
+	source "package/hidapi/Config.in"
 	source "package/lcdapi/Config.in"
 	source "package/libaio/Config.in"
 	source "package/libatasmart/Config.in"
diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
new file mode 100644
index 0000000..7fbc1c2
--- /dev/null
+++ b/package/hidapi/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_HIDAPI
+	bool "hidapi"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	# When eudev is used as the udev provider, libgudev is
+	# automatically provided as it is part of eudev. However, when
+	# systemd is used as the udev provider, libgudev is not
+	# provided, and needs to be built separately. This is why we
+	# select the libgudev package only if systemd is used.
+	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_SYSTEMD
+	help
+	  HIDAPI is a multi-platform library which allows an application
+	  to interface with USB and Bluetooth HID-Class devices on
+	  Windows, Linux, and Mac OS X.
+
+	  http://www.signal11.us/oss/hidapi/
+
+comment "hidapi needs udev /dev management and a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
diff --git a/package/hidapi/hidapi.hash b/package/hidapi/hidapi.hash
new file mode 100644
index 0000000..ba00df2
--- /dev/null
+++ b/package/hidapi/hidapi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 33e206f5e145fc1bc6aeb55084d71b55d686533d23ad5bb762746ceba81e728b  hidapi-d17db57b9d4354752e0af42f5f33007a42ef2906.tar.gz
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
new file mode 100644
index 0000000..23d5eab
--- /dev/null
+++ b/package/hidapi/hidapi.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# hidapi
+#
+################################################################################
+
+# Use master version as the current stable is very old and some bugs
+# have been fixed since then.
+HIDAPI_VERSION = d17db57b9d4354752e0af42f5f33007a42ef2906
+HIDAPI_SITE = $(call github,signal11,hidapi,$(HIDAPI_VERSION))
+HIDAPI_INSTALL_STAGING = YES
+# No configure provided, so we need to autoreconf.
+HIDAPI_AUTORECONF = YES
+HIDAPI_LICENSE = GPLv3, BSD-3c
+HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt
+
+HIDAPI_DEPENDENCIES = libusb
+# When eudev is used as the udev provider, libgudev is automatically
+# provided as it is part of eudev. However, when systemd is used as the
+# udev provider, libgudev is not provided, and needs to be built
+# separately. This is why we select the libgudev package only if systemd
+# is used.
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+HIDAPI_DEPENDENCIES += libgudev
+endif
+
+$(eval $(autotools-package))
-- 
1.7.1
