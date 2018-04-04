From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Apr 2018 18:00:09 +0200
Subject: [Buildroot] [PATCH] iqvlinux: remove package
Message-ID: <20180404160009.16337-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package contains a kernel module from Intel, which could only be
used together with Intel userspace tools provided under NDA, which
also come with the same kernel module. The copy of the kernel module
available on SourceForge is only provided only to comply with the
GPLv2 requirement. Intel engineers were even surprised it even built
and were not willing to make any effort to fix their tarball naming to
contain a version number. Therefore, it does not make sense for
Buildroot to provide such a package.

See https://sourceforge.net/p/e1000/bugs/589/ for the discussion.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   | 18 ++++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 .../0001-Support-Linux-kernel-4.12-and-later.patch | 66 ----------------------
 package/iqvlinux/Config.in                         | 21 -------
 package/iqvlinux/iqvlinux.hash                     |  6 --
 package/iqvlinux/iqvlinux.mk                       | 25 --------
 7 files changed, 18 insertions(+), 120 deletions(-)
 delete mode 100644 package/iqvlinux/0001-Support-Linux-kernel-4.12-and-later.patch
 delete mode 100644 package/iqvlinux/Config.in
 delete mode 100644 package/iqvlinux/iqvlinux.hash
 delete mode 100644 package/iqvlinux/iqvlinux.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 2e3b1b6001..45ad79e4b1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,24 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
+config BR2_PACKAGE_IQVLINUX
+	bool "iqvlinux packaged removed"
+	select BR2_LEGACY
+	help
+	  This package contained a kernel module from Intel, which
+	  could only be used together with Intel userspace tools
+	  provided under NDA, which also come with the same kernel
+	  module. The copy of the kernel module available on
+	  SourceForge is only provided only to comply with the GPLv2
+	  requirement. Intel engineers were even surprised it even
+	  built and were not willing to make any effort to fix their
+	  tarball naming to contain a version number. Therefore, it
+	  does not make sense for Buildroot to provide such a package.
+
+	  See https://sourceforge.net/p/e1000/bugs/589/ for the
+	  discussion.
+
+
 config BR2_PACKAGE_KODI_ADSP_BASIC
 	bool "kodi-adsp-basic package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 4ed7422645..a4e71f0a42 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1582,7 +1582,6 @@ F:	package/bullet/
 F:	package/efl/
 F:	package/enlightenment/
 F:	package/expedite/
-F:	package/iqvlinux/
 F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
diff --git a/package/Config.in b/package/Config.in
index d883909094..7362e08a9a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -437,7 +437,6 @@ endmenu
 	source "package/iostat/Config.in"
 	source "package/ipmitool/Config.in"
 	source "package/ipmiutil/Config.in"
-	source "package/iqvlinux/Config.in"
 	source "package/irda-utils/Config.in"
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
diff --git a/package/iqvlinux/0001-Support-Linux-kernel-4.12-and-later.patch b/package/iqvlinux/0001-Support-Linux-kernel-4.12-and-later.patch
deleted file mode 100644
index 22ee03cdc9..0000000000
--- a/package/iqvlinux/0001-Support-Linux-kernel-4.12-and-later.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 517d70780b903caa41ee93adbbb9bb985da23a29 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.ind.br>
-Date: Tue, 12 Dec 2017 13:40:44 -0200
-Subject: [PATCH] Support Linux kernel 4.12 and later
-
-Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
----
- src/linux/driver/linuxdrivermemory_i.c | 5 +++++
- src/linux/driver/linuxdriveros_i.c     | 5 +++++
- src/linux/driver/linuxnaldriver.c      | 5 +++++
- 3 files changed, 15 insertions(+)
-
-diff --git a/src/linux/driver/linuxdrivermemory_i.c b/src/linux/driver/linuxdrivermemory_i.c
-index bdf1d42..53366d7 100644
---- a/src/linux/driver/linuxdrivermemory_i.c
-+++ b/src/linux/driver/linuxdrivermemory_i.c
-@@ -49,7 +49,12 @@
- #include <linux/errno.h>
- #include <linux/fs.h>
- #include <linux/mm.h>
-+#include <linux/version.h>
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
-+#include <linux/uaccess.h>
-+#else
- #include <asm/uaccess.h>
-+#endif
- #include <linux/pci.h>
- #include <linux/delay.h>
- 
-diff --git a/src/linux/driver/linuxdriveros_i.c b/src/linux/driver/linuxdriveros_i.c
-index 653bec9..43df25e 100644
---- a/src/linux/driver/linuxdriveros_i.c
-+++ b/src/linux/driver/linuxdriveros_i.c
-@@ -49,7 +49,12 @@
- #include <linux/errno.h>
- #include <linux/fs.h>
- #include <linux/mm.h>
-+#include <linux/version.h>
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
-+#include <linux/uaccess.h>
-+#else
- #include <asm/uaccess.h>
-+#endif
- #include <linux/pci.h>
- #include <linux/delay.h>
- 
-diff --git a/src/linux/driver/linuxnaldriver.c b/src/linux/driver/linuxnaldriver.c
-index 93c2f80..c1ddbcf 100644
---- a/src/linux/driver/linuxnaldriver.c
-+++ b/src/linux/driver/linuxnaldriver.c
-@@ -39,7 +39,12 @@
- #include <linux/fs.h>
- #include <linux/mm.h>
- #include <linux/version.h>
-+#include <linux/version.h>
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
-+#include <linux/uaccess.h>
-+#else
- #include <asm/uaccess.h>
-+#endif
- #include "naltypes.h"
- #include "nalioctl.h"
- #include "linuxnaldriver.h"
--- 
-2.14.3
-
diff --git a/package/iqvlinux/Config.in b/package/iqvlinux/Config.in
deleted file mode 100644
index 73804ac02a..0000000000
--- a/package/iqvlinux/Config.in
+++ /dev/null
@@ -1,21 +0,0 @@
-config BR2_PACKAGE_IQVLINUX
-	bool "iqvlinux"
-	depends on BR2_LINUX_KERNEL
-	help
-	  Intel Ethernet Adapter Debug Driver for Linux (iqvlinux).
-
-	  Officially supports kernel versions 2.6.x up through 4.0.x but
-	  the Buildroot package contains a patch to allow it to be built
-	  on newer kernel versions.
-
-	  This debug driver supports all Intel's networking Tools based
-	  on the SDK version 2.19.36.0 or higher which support Intel
-	  Ethernet chip including e1000, e1000e, i210...
-
-	  Note: This driver requires PCI support to be enabled
-	  (i.e. CONFIG_PCI).
-
-	  https://sourceforge.net/projects/e1000/files/iqvlinux/
-
-comment "iqvlinux needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
diff --git a/package/iqvlinux/iqvlinux.hash b/package/iqvlinux/iqvlinux.hash
deleted file mode 100644
index 20d612ddc5..0000000000
--- a/package/iqvlinux/iqvlinux.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# locally computed
-sha256	4020a661940ba6d50f24654b90a41280eb8eccf00061fe6d105c654d3d97d551  iqvlinux-1.2.0.3.tar.gz
-sha256	386086e232db4708770f717595d4f83188f776aa6e7313cd12fb039e869f494b  COPYING
-sha256	beded926a8f18aad5d911daf581759e2b25697588034d2b29033ae1a929506ff  src/linux/driver/files.txt
-sha256	ecf93b9b739fc82f7b87b34f8c6411dfdd271234af2fe45212293d9df2b654b3  inc/linux/files.txt
-sha256	0a309350c1b32be72479e8fe08f7f6bbbad2e8c3d9a1cbcad3d482ea48a236ad  inc/files.txt
diff --git a/package/iqvlinux/iqvlinux.mk b/package/iqvlinux/iqvlinux.mk
deleted file mode 100644
index d6d445e666..0000000000
--- a/package/iqvlinux/iqvlinux.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# iqvlinux
-#
-################################################################################
-
-# The upstream tarball is just named iqvlinux.tar.gz, which we cannot
-# use because it doesn't contain a version number. Therefore, the
-# download from the upstream site will fail, and fallback to the
-# backup mirror, where we have added an iqvlinux-1.2.0.3.tar.gz
-# tarball.
-IQVLINUX_VERSION = 1.2.0.3
-IQVLINUX_SITE = https://downloads.sourceforge.net/project/e1000/iqvlinux/$(IQVLINUX_VERSION)
-
-IQVLINUX_LICENSE = GPL-2.0, BSD-3-Clause
-IQVLINUX_LICENSE_FILES = \
-	COPYING src/linux/driver/files.txt \
-	inc/linux/files.txt inc/files.txt
-
-IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) KSRC=$(LINUX_DIR) CC=$(TARGET_CC)
-
-IQVLINUX_MODULE_SUBDIRS = src/linux/driver
-
-$(eval $(kernel-module))
-$(eval $(generic-package))
-- 
2.14.3
