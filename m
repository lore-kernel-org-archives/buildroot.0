From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  2 Oct 2015 14:32:16 +0200
Subject: [Buildroot] [PATCH] package/intel-iqvlinux-driver: new package
Message-ID: <1443789136-31294-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in                                  |  1 +
 .../0001-don-t-use-host-gcc.patch                  | 32 ++++++++++++++++++++++
 package/intel-iqvlinux-driver/Config.in            | 14 ++++++++++
 .../intel-iqvlinux-driver.hash                     |  5 ++++
 .../intel-iqvlinux-driver/intel-iqvlinux-driver.mk | 22 +++++++++++++++
 5 files changed, 74 insertions(+)
 create mode 100644 package/intel-iqvlinux-driver/0001-don-t-use-host-gcc.patch
 create mode 100644 package/intel-iqvlinux-driver/Config.in
 create mode 100644 package/intel-iqvlinux-driver/intel-iqvlinux-driver.hash
 create mode 100644 package/intel-iqvlinux-driver/intel-iqvlinux-driver.mk

diff --git a/package/Config.in b/package/Config.in
index 79cbbe6..7ae836f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -130,6 +130,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/grep/Config.in"
 endif
+	source "package/intel-iqvlinux-driver/Config.in"
 	source "package/intltool/Config.in"
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
diff --git a/package/intel-iqvlinux-driver/0001-don-t-use-host-gcc.patch b/package/intel-iqvlinux-driver/0001-don-t-use-host-gcc.patch
new file mode 100644
index 0000000..66820ee
--- /dev/null
+++ b/package/intel-iqvlinux-driver/0001-don-t-use-host-gcc.patch
@@ -0,0 +1,32 @@
+From e768f2a9f618d2b5ff0f4be452eaf1dfffdae844 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 2 Oct 2015 11:50:08 +0200
+Subject: [PATCH] don't use host gcc
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/linux/driver/Makefile |    8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/src/linux/driver/Makefile b/src/linux/driver/Makefile
+index c1dee29..3470d58 100644
+--- a/src/linux/driver/Makefile
++++ b/src/linux/driver/Makefile
+@@ -100,14 +100,6 @@ ifeq (,$(wildcard $(CONFIG_FILE)))
+   $(error Linux kernel source not configured - missing autoconf.h)
+ endif
+ 
+-ifneq (,$(findstring egcs-2.91.66, $(shell cat /proc/version)))
+-  CC := kgcc gcc cc
+-else
+-  CC := gcc cc
+-endif
+-test_cc = $(shell $(cc) --version > /dev/null 2>&1 && echo $(cc))
+-CC := $(foreach cc, $(CC), $(test_cc))
+-CC := $(firstword $(CC))
+ ifeq (,$(CC))
+   $(error Compiler not found)
+ endif
+-- 
+1.7.10.4
+
diff --git a/package/intel-iqvlinux-driver/Config.in b/package/intel-iqvlinux-driver/Config.in
new file mode 100644
index 0000000..70fff10
--- /dev/null
+++ b/package/intel-iqvlinux-driver/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_INTEL_IQVLINUX_DRIVER
+	bool "intel iqvlinux driver"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Intel Ethernet Adapter Debug Driver for Linux (iqvlinux), which
+	  supports kernel versions 2.6.x up through 4.0.x.
+
+	  This debug driver supports all Intel's networking Tools based on
+	  the SDK version 2.19.36.0 or higher.
+
+	  http://sourceforge.net/projects/e1000/files/iqvlinux/
+
+comment "intel iqvlinux driver needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/intel-iqvlinux-driver/intel-iqvlinux-driver.hash b/package/intel-iqvlinux-driver/intel-iqvlinux-driver.hash
new file mode 100644
index 0000000..ddf57b7
--- /dev/null
+++ b/package/intel-iqvlinux-driver/intel-iqvlinux-driver.hash
@@ -0,0 +1,5 @@
+# From http://sourceforge.net/projects/e1000/files/iqvlinux/1.1.5.3/
+sha1	bd94416e4364015dbbd78a22e51080bf7ea81fac	iqvlinux.tar.gz
+md5	fb6a2a4dc122d39070fcb06985c97a05	iqvlinux.tar.gz
+# locally computed
+sha256	8cb19f3bfe040100a13bb2d05cb2b54f2b259e55cef23f8cc5aa6f2f31e98bec	iqvlinux.tar.gz
diff --git a/package/intel-iqvlinux-driver/intel-iqvlinux-driver.mk b/package/intel-iqvlinux-driver/intel-iqvlinux-driver.mk
new file mode 100644
index 0000000..b4e032a
--- /dev/null
+++ b/package/intel-iqvlinux-driver/intel-iqvlinux-driver.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# intel-iqvlinux-driver
+#
+################################################################################
+
+INTEL_IQVLINUX_DRIVER_VERSION = 1.1.5.3
+
+INTEL_IQVLINUX_DRIVER_SITE = \
+	http://sourceforge.net/projects/e1000/files/iqvlinux/$(INTEL_IQVLINUX_DRIVER_VERSION)
+INTEL_IQVLINUX_DRIVER_SOURCE = iqvlinux.tar.gz
+
+INTEL_IQVLINUX_DRIVER_LICENSE = GPLv2 BSD-3c
+INTEL_IQVLINUX_DRIVER_LICENSE_FILES = COPYING
+
+INTEL_IQVLINUX_DRIVER_MODULE_MAKE_OPTS = NALDIR=$(@D) \
+	KSRC=$(LINUX_DIR)
+
+INTEL_IQVLINUX_DRIVER_MODULE_SUBDIRS = src/linux/driver
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.4.3
