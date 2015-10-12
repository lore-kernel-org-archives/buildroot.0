From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:15:13 +0200
Subject: [Buildroot] [git commit] package/iqvlinux: new package
Message-ID: <20151012211527.6C07F81D58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=330f961ad3404708ed9a35b9b1fdc429ad65ccfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The PCI support needs to be checked since this driver is based
on it. Otherwise the build fail with:
 #error "This driver requires PCI support to be available"

But this message is concealed by several occurrence of this
one:
 error: implicit declaration of function 'pci_find_bus' [-Werror=implicit-function-declaration]

[Thomas:
 - fix minor typo in Config.in: s/Enthernet/Ethernet/
 - license is "GPLv2, BSD-3c", not "GPLv2 or BSD-3c"
 - remove IQVLINUX_PCI_CHECK, until a proper generic solution is
   implemented.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/iqvlinux/Config.in     |   18 ++++++++++++++++++
 package/iqvlinux/iqvlinux.hash |    5 +++++
 package/iqvlinux/iqvlinux.mk   |   21 +++++++++++++++++++++
 4 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 37d9cd0..f686f13 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -365,6 +365,7 @@ endif
 	source "package/iostat/Config.in"
 	source "package/ipmitool/Config.in"
 	source "package/ipmiutil/Config.in"
+	source "package/iqvlinux/Config.in"
 	source "package/irda-utils/Config.in"
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
diff --git a/package/iqvlinux/Config.in b/package/iqvlinux/Config.in
new file mode 100644
index 0000000..8959955
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
+	  Ethernet chip including e1000, e1000e, i210...
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
index 0000000..b3981fa
--- /dev/null
+++ b/package/iqvlinux/iqvlinux.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# iqvlinux
+#
+################################################################################
+
+IQVLINUX_VERSION = 1.1.5.3
+IQVLINUX_SITE = http://sourceforge.net/projects/e1000/files/iqvlinux/$(IQVLINUX_VERSION)
+IQVLINUX_SOURCE = iqvlinux.tar.gz
+
+IQVLINUX_LICENSE = GPLv2, BSD-3c
+IQVLINUX_LICENSE_FILES = \
+	COPYING src/linux/driver/files.txt \
+	inc/linux/files.txt inc/files.txt
+
+IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) KSRC=$(LINUX_DIR) CC=$(TARGET_CC)
+
+IQVLINUX_MODULE_SUBDIRS = src/linux/driver
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
