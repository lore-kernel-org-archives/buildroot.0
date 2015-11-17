From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:49:43 +0100
Subject: [Buildroot] [git commit] hidapi: new package
Message-ID: <20151201232117.C380A7FB18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6267f34afdd06ad848bbf7a2975cb279132b6ba0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - use BR2_INIT_SYSTEMD instead of BR2_PACKAGE_SYSTEMD for the
   libgudev handling. This is consistent with what we do in libmbim,
   modem-manager and network-manager. Only udisks is diverging from
   this by using BR2_PACKAGE_SYSTEMD.
 - Fix the license info: it is GPLv3 *or* BSD-3c *or* the specific
   HIDAPI license. Added LICENSE-orig.txt to LICENSE_FILES.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  1 +
 package/hidapi/Config.in   | 20 ++++++++++++++++++++
 package/hidapi/hidapi.hash |  2 ++
 package/hidapi/hidapi.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0a80afb..39a5af7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -865,6 +865,7 @@ menu "Hardware handling"
 	source "package/ccid/Config.in"
 	source "package/dtc/Config.in"
 	source "package/gnu-efi/Config.in"
+	source "package/hidapi/Config.in"
 	source "package/lcdapi/Config.in"
 	source "package/libaio/Config.in"
 	source "package/libatasmart/Config.in"
diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
new file mode 100644
index 0000000..5d025bf
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
+	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
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
index 0000000..2457554
--- /dev/null
+++ b/package/hidapi/hidapi.mk
@@ -0,0 +1,28 @@
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
+HIDAPI_LICENSE = GPLv3 or BSD-3c or HIDAPI license
+HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt LICENSE-orig.txt
+
+HIDAPI_DEPENDENCIES = libusb
+
+# When eudev is used as the udev provider, libgudev is automatically
+# provided as it is part of eudev. However, when systemd is used as
+# the udev provider, libgudev is not provided, and needs to be built
+# separately. This is why we depend on the libgudev package only if
+# systemd is used.
+ifeq ($(BR2_INIT_SYSTEMD),y)
+HIDAPI_DEPENDENCIES += libgudev
+endif
+
+$(eval $(autotools-package))
