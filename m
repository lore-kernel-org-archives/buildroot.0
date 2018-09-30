From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 20:16:53 +0200
Subject: [Buildroot] [git commit] bootutils: drop package
Message-ID: <20180930181808.C17438A47C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c3c7c4f930ec595301a45df72f9969931129f5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Romain Naour during review of patch 976582
(https://patchwork.ozlabs.org/patch/976582), drop bootutils as "upstream
is dead since 2009" and "BootUtils is a collection of utilities to
facilitate booting of modern Kernel 2.6 based systems"

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |  6 ++++
 package/Config.in                                  |  1 -
 .../bootutils/0001-fix-build-with-glibc-2.28.patch | 41 ----------------------
 package/bootutils/Config.in                        | 10 ------
 package/bootutils/bootutils.hash                   |  2 --
 package/bootutils/bootutils.mk                     | 13 -------
 6 files changed, 6 insertions(+), 67 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e1a0276b7d..20e2d5c8c6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.11"
 
+config BR2_PACKAGE_BOOTUTILS
+	bool "bootutils package removed"
+	select BR2_LEGACY
+	help
+	  The bootutils package was removed.
+
 config BR2_PACKAGE_EXPEDITE
 	bool "expedite package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 125e8ca7dc..2e163f1852 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2048,7 +2048,6 @@ menu "System tools"
 	source "package/atop/Config.in"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
-	source "package/bootutils/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/coreutils/Config.in"
diff --git a/package/bootutils/0001-fix-build-with-glibc-2.28.patch b/package/bootutils/0001-fix-build-with-glibc-2.28.patch
deleted file mode 100644
index fced93d4a6..0000000000
--- a/package/bootutils/0001-fix-build-with-glibc-2.28.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 00773e89893e4aaed721269eee0dbf844edd291c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 29 Sep 2018 12:56:14 +0200
-Subject: [PATCH] fix build with glibc 2.28
-
-Include to sys/sysmacros.h is needed to use makedev since glibc 2.28 so
-add this include to devname.c and raidscan.c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libblkid/devname.c | 1 +
- raidscan.c         | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libblkid/devname.c b/libblkid/devname.c
-index d11bddd..12b63db 100644
---- a/libblkid/devname.c
-+++ b/libblkid/devname.c
-@@ -37,6 +37,7 @@
- #if HAVE_SYS_MKDEV_H
- #include <sys/mkdev.h>
- #endif
-+#include <sys/sysmacros.h>
- #include <time.h>
- 
- #include "blkidP.h"
-diff --git a/raidscan.c b/raidscan.c
-index fab3b02..6e07b3d 100644
---- a/raidscan.c
-+++ b/raidscan.c
-@@ -22,6 +22,7 @@
- #include "config.h"
- 
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <fcntl.h>
- #include <sys/ioctl.h>
- #include <linux/major.h>
--- 
-2.17.1
-
diff --git a/package/bootutils/Config.in b/package/bootutils/Config.in
deleted file mode 100644
index 30d647ab11..0000000000
--- a/package/bootutils/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_BOOTUTILS
-	bool "bootutils"
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	help
-	  BootUtils is a collection of utilities to facilitate booting
-	  of Linux 2.6-based systems. The process of finding the root
-	  volume either by label or explicit label= on the kernel
-	  command line, mounting it, and 'switchroot'ing is automated.
-
-	  http://bootutils.sourceforge.net/
diff --git a/package/bootutils/bootutils.hash b/package/bootutils/bootutils.hash
deleted file mode 100644
index 576c324c0f..0000000000
--- a/package/bootutils/bootutils.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256  78549714e7c7fa246a4019c245f4da044aee6cfe48ad6887c4013ac4c749c7b9  bootutils-1.0.0.tar.gz
diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
deleted file mode 100644
index bc4b3e8438..0000000000
--- a/package/bootutils/bootutils.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# bootutils
-#
-################################################################################
-
-BOOTUTILS_VERSION = 1.0.0
-BOOTUTILS_SITE = http://downloads.sourceforge.net/project/bootutils/Stable/v$(BOOTUTILS_VERSION)
-BOOTUTILS_CONF_OPTS = --prefix=/ --exec-prefix=/
-BOOTUTILS_LICENSE = GPL-2.0+
-BOOTUTILS_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
