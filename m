From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  9 Oct 2015 15:26:02 +0200
Subject: [Buildroot] [PATCH v3] package/iqvlinux: new package
Message-ID: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
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
Cc: Arnout Vandecappelle <arnout@mind.be>
---
v3: changes suggested by Arnout
    - remove the patch and use CC=$(TARGET_CC) instead.
    - Add a 'or' between GPLv2 and BSD-3c for license information
    - Add some more license files (files.txt)
    - Fixes typos and indentation.
    - move the check for PCI option to LINUX_POST_CONFIGURE_HOOKS
    - redirect echo to stderr.
v2: - rename the package simply to iqvlinux (ThomasP)
    - move it to "Hardware Handling" menu (ThomasP)
    - Cc Yann for the kernel-module infra
    - Add a check for CONFIG_PCI even if it's redundant with
      the message from the Makefile.
      (Do we really need this check ?)
---
 package/Config.in              |  1 +
 package/iqvlinux/Config.in     | 18 ++++++++++++++++++
 package/iqvlinux/iqvlinux.hash |  5 +++++
 package/iqvlinux/iqvlinux.mk   | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+)
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
diff --git a/package/iqvlinux/Config.in b/package/iqvlinux/Config.in
new file mode 100644
index 0000000..275c67e
--- /dev/null
+++ b/package/iqvlinux/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_IQVLINUX
+	bool "iqvlinux"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Intel Ethernet Adapter Debug Driver for Linux (iqvlinux),
+	  which supports kernel versions 2.6.x up through 4.0.x.
+
+	  This debug driver supports all Intel's networking Tools based
+	  on the SDK version 2.19.36.0 or higher which support Intel
+	  Enthernet chip including e1000, e1000e, i210...
+
+	  Note: This driver requires PCI support to be enabled
+	  (i.e. CONFIG_PCI).
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
index 0000000..ed98f1f
--- /dev/null
+++ b/package/iqvlinux/iqvlinux.mk
@@ -0,0 +1,34 @@
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
+IQVLINUX_LICENSE = GPLv2 or BSD-3c
+IQVLINUX_LICENSE_FILES = COPYING src/linux/driver/files.txt \
+	inc/linux/files.txt inc/files.txt
+
+IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) KSRC=$(LINUX_DIR) CC=$(TARGET_CC)
+
+IQVLINUX_MODULE_SUBDIRS = src/linux/driver
+
+ifeq ($(BR2_PACKAGE_IQVLINUX),y)
+define IQVLINUX_PCI_CHECK
+	@if ! grep -Fqx 'CONFIG_PCI=y' $(LINUX_DIR)/.config; then \
+		echo "ERROR: Enable CONFIG_PCI in the linux kernel config." 1>&2 ; \
+		exit 1; \
+	fi
+endef
+
+# Check if PCI is enabled in the Linux kernel build by Buildroot.
+LINUX_POST_CONFIGURE_HOOKS += IQVLINUX_PCI_CHECK
+endif
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.4.3
