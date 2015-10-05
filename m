From: Romain Naour <romain.naour@openwide.fr>
Date: Mon,  5 Oct 2015 18:48:50 +0200
Subject: [Buildroot] [PATCH v2] package/iqvlinux: new package
Message-ID: <1444063730-26388-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The PCI support needs to be checked since this driver is based
on it. Otherwise the build fail with:
 #error "This driver requires PCI support to be available"

But this message is concealed by several occurrence of this
one:
 error: implicit declaration of function 'pci_find_bus' [-Werror=implicit-function-declaration]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
v2: - rename the package simply to iqvlinux (ThomasP)
    - move it to "Hardware Handling" menu (ThomasP)
    - Cc Yann for the kernel-module infra
    - Add a check for CONFIG_PCI even if it's redundant with
      the message from the Makefile.
      (Do we really need this check ?)
---
 package/Config.in                              |  1 +
 package/iqvlinux/0001-don-t-use-host-gcc.patch | 32 ++++++++++++++++++++++++++
 package/iqvlinux/Config.in                     | 17 ++++++++++++++
 package/iqvlinux/iqvlinux.hash                 |  5 ++++
 package/iqvlinux/iqvlinux.mk                   | 31 +++++++++++++++++++++++++
 5 files changed, 86 insertions(+)
 create mode 100644 package/iqvlinux/0001-don-t-use-host-gcc.patch
 create mode 100644 package/iqvlinux/Config.in
 create mode 100644 package/iqvlinux/iqvlinux.hash
 create mode 100644 package/iqvlinux/iqvlinux.mk

diff --git a/package/Config.in b/package/Config.in
index 3794f44..5e2ac80 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,7 @@ endif
 	source "package/iostat/Config.in"
 	source "package/ipmitool/Config.in"
 	source "package/ipmiutil/Config.in"
+	source "package/iqvlinux/Config.in"
 	source "package/irda-utils/Config.in"
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
diff --git a/package/iqvlinux/0001-don-t-use-host-gcc.patch b/package/iqvlinux/0001-don-t-use-host-gcc.patch
new file mode 100644
index 0000000..66820ee
--- /dev/null
+++ b/package/iqvlinux/0001-don-t-use-host-gcc.patch
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
diff --git a/package/iqvlinux/Config.in b/package/iqvlinux/Config.in
new file mode 100644
index 0000000..d0394f5
--- /dev/null
+++ b/package/iqvlinux/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_IQVLINUX
+	bool "iqvlinux"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Intel Ethernet Adapter Debug Driver for Linux (iqvlinux), which
+	  supports kernel versions 2.6.x up through 4.0.x.
+
+	  This debug driver supports all Intel's networking Tools based on
+	  the SDK version 2.19.36.0 or higher.
+
+	  Note: This driver require PCI support is enabled in the kernel
+	  (ie. CONFIG_PCI).
+
+	  http://sourceforge.net/projects/e1000/files/iqvlinux/
+
+comment "iqvlinux needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/iqvlinux/iqvlinux.hash b/package/iqvlinux/iqvlinux.hash
new file mode 100644
index 0000000..ddf57b7
--- /dev/null
+++ b/package/iqvlinux/iqvlinux.hash
@@ -0,0 +1,5 @@
+# From http://sourceforge.net/projects/e1000/files/iqvlinux/1.1.5.3/
+sha1	bd94416e4364015dbbd78a22e51080bf7ea81fac	iqvlinux.tar.gz
+md5	fb6a2a4dc122d39070fcb06985c97a05	iqvlinux.tar.gz
+# locally computed
+sha256	8cb19f3bfe040100a13bb2d05cb2b54f2b259e55cef23f8cc5aa6f2f31e98bec	iqvlinux.tar.gz
diff --git a/package/iqvlinux/iqvlinux.mk b/package/iqvlinux/iqvlinux.mk
new file mode 100644
index 0000000..b84cfa3
--- /dev/null
+++ b/package/iqvlinux/iqvlinux.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# iqvlinux
+#
+################################################################################
+
+IQVLINUX_VERSION = 1.1.5.3
+
+IQVLINUX_SITE = \
+	http://sourceforge.net/projects/e1000/files/iqvlinux/$(IQVLINUX_VERSION)
+IQVLINUX_SOURCE = iqvlinux.tar.gz
+
+IQVLINUX_LICENSE = GPLv2 BSD-3c
+IQVLINUX_LICENSE_FILES = COPYING
+
+IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) \
+	KSRC=$(LINUX_DIR)
+
+IQVLINUX_MODULE_SUBDIRS = src/linux/driver
+
+define IQVLINUX_PCI_CHECK
+	@if ! grep -Fqx 'CONFIG_PCI=y' $(LINUX_DIR)/.config; then \
+		echo "ERROR: Kernel does not support PCI bus."; \
+		exit 1; \
+	fi
+endef
+
+IQVLINUX_PRE_BUILD_HOOKS += IQVLINUX_PCI_CHECK
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.4.3
