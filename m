From: Daniel Sangue <daniel.sangue@sangue.ch>
Date: Wed,  1 Oct 2014 16:18:21 +0200
Subject: [Buildroot] [PATCH 1/1] libFTDI major version update 1. This
	version can coexists beside the 0.x version (libftdi.so,
	libftdi1.so).
Message-ID: <1412173101-52605-1-git-send-email-daniel.sangue@sangue.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Sangue <daniel.sangue@sangue.ch>
---
 package/Config.in            |  1 +
 package/libftdi1/Config.in   | 24 ++++++++++++++++++++++++
 package/libftdi1/libftdi1.mk | 22 ++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 package/libftdi1/Config.in
 create mode 100644 package/libftdi1/libftdi1.mk

diff --git a/package/Config.in b/package/Config.in
index 2ad72bc..a6e78b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -670,6 +670,7 @@ menu "Hardware handling"
 	source "package/libcec/Config.in"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
+	source "package/libftdi1/Config.in"
 	source "package/libhid/Config.in"
 	source "package/libinput/Config.in"
 	source "package/libiqrf/Config.in"
diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
new file mode 100644
index 0000000..d896fc0
--- /dev/null
+++ b/package/libftdi1/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_LIBFTDI1
+	bool "libftdi1"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	select BR2_PACKAGE_LIBCONFUSE
+	help
+	  Userspace access to FTDI USB interface chips (version 1.x)
+
+	  http://www.intra2net.com/en/developer/libftdi/index.php
+
+if BR2_PACKAGE_LIBFTDI1
+
+config BR2_PACKAGE_LIBTFDI1_CPP
+	depends on BR2_INSTALL_LIBSTDCPP
+	bool "C++ bindings"
+	help
+	  C++ bindings for libftdi
+
+endif # BR2_PACKAGE_LIBFTDI1
+
+comment "libftdi1 needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
new file mode 100644
index 0000000..abe0dc7
--- /dev/null
+++ b/package/libftdi1/libftdi1.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libftdi1
+#
+################################################################################
+
+LIBFTDI1_VERSION = 1.1
+LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
+LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download/
+LIBFTDI1_INSTALL_STAGING = YES
+LIBFDTI1_CONF_OPT = --without-examples
+LIBFTDI1_DEPENDENCIES = libusb-compat libusb libconfuse
+
+# configure detect it automaticaly so we need to force it
+ifeq ($(BR2_PACKAGE_LIBTFDI1_CPP),y)
+LIBFDTI_CONF_OPT += --enable-libftdipp
+else
+LIBFDTI_CONF_OPT += --disable-libftdipp
+endif
+
+$(eval $(cmake-package))
+
-- 
1.9.1
