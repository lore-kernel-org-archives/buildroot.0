From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Tue, 24 Dec 2013 23:07:53 +0100
Subject: [Buildroot] [PATCH v1 1/1] avrdude: new package
Message-ID: <1387922873-14896-1-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
---
 package/Config.in          |  1 +
 package/avrdude/Config.in  | 16 ++++++++++++++++
 package/avrdude/avrdude.mk | 18 ++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/avrdude/Config.in
 create mode 100644 package/avrdude/avrdude.mk

diff --git a/package/Config.in b/package/Config.in
index 3685807..2abffb8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -258,6 +258,7 @@ source "package/zd1211-firmware/Config.in"
 endmenu
 source "package/a10disp/Config.in"
 source "package/acpid/Config.in"
+source "package/avrdude/Config.in"
 source "package/cdrkit/Config.in"
 source "package/cryptsetup/Config.in"
 source "package/dbus/Config.in"
diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
new file mode 100644
index 0000000..f3b075a
--- /dev/null
+++ b/package/avrdude/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_AVRDUDE
+	bool "avrdude"
+	select BR2_PACKAGE_LIBELF
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	select BR2_PACKAGE_NCURSES
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  avrdude is a programmer for Atmel AVR microcontrollers
+	  this package provides a version with new linuxspi driver
+
+	  https://github.com/kcuzner/avrdude
+
+comment "avrdude needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
new file mode 100644
index 0000000..cdca10e
--- /dev/null
+++ b/package/avrdude/avrdude.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# AVRDUDE
+#
+################################################################################
+
+AVRDUDE_VERSION = eabe067c4527bc2eedc5db9288ef5cf1818ec720
+AVRDUDE_SITE = http://github.com/kcuzner/avrdude/tarball/$(AVRDUDE_VERSION)
+AVRDUDE_LICENSE = GPLv2+
+AVRDUDR_LICENSE_FILES = avrdude/COPYING
+AVRDUDE_SUBDIR = avrdude
+# Sources are distributed with ./bootstrap file
+# it is necessary to perform autoreconfiguration 
+AVRDUDE_AUTORECONF = YES
+AVRDUDE_DEPENDENCIES = libelf libusb libusb-compat ncurses
+
+$(eval $(autotools-package))
+
-- 
1.8.5.1
