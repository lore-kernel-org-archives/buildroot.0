From: vapier at uclibc.org <vapier@uclibc.org>
Date: Tue, 28 Nov 2006 13:11:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	2.17.50.0.7
Message-ID: <20061128211101.D99FA48570@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vapier
Date: 2006-11-28 13:11:01 -0800 (Tue, 28 Nov 2006)
New Revision: 16709

Log:
ver bump

Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.7/

Removed:
   trunk/buildroot/toolchain/binutils/2.17.50.0.7/300-006_better_file_error.patch

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Copied: trunk/buildroot/toolchain/binutils/2.17.50.0.7 (from rev 16708, trunk/buildroot/toolchain/binutils/2.17.50.0.6)

Deleted: trunk/buildroot/toolchain/binutils/2.17.50.0.7/300-006_better_file_error.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.6/300-006_better_file_error.patch	2006-11-28 17:04:37 UTC (rev 16708)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.7/300-006_better_file_error.patch	2006-11-28 21:11:01 UTC (rev 16709)
@@ -1,43 +0,0 @@
-#!/bin/sh -e
-## 006_better_file_error.dpatch by David Kimdon <dwhedon@gordian.com>
-##
-## All lines beginning with `## DP:' are a description of the patch.
-## DP: Specify which filename is causing an error if the filename is a
-## DP: directory. (#45832)
-
-if [ $# -ne 1 ]; then
-    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
-    exit 1
-fi
-
-[ -f debian/patches/00patch-opts ] && . debian/patches/00patch-opts
-patch_opts="${patch_opts:--f --no-backup-if-mismatch}"
-
-case "$1" in
-       -patch) patch $patch_opts -p1 < $0;;
-       -unpatch) patch $patch_opts -p1 -R < $0;;
-        *)
-                echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
-                exit 1;;
-esac
-
-exit 0
-
- at DPATCH@
-diff -urNad /home/james/debian/packages/binutils/binutils-2.14.90.0.6/bfd/opncls.c binutils-2.14.90.0.6/bfd/opncls.c
---- /home/james/debian/packages/binutils/binutils-2.14.90.0.6/bfd/opncls.c	2003-07-23 16:08:09.000000000 +0100
-+++ binutils-2.14.90.0.6/bfd/opncls.c	2003-09-10 22:35:00.000000000 +0100
-@@ -150,6 +150,13 @@
- {
-   bfd *nbfd;
-   const bfd_target *target_vec;
-+  struct stat s;
-+
-+  if (stat (filename, &s) == 0)
-+    if (S_ISDIR(s.st_mode)) {
-+      bfd_set_error (bfd_error_file_not_recognized);
-+      return NULL;
-+    }
- 
-   nbfd = _bfd_new_bfd ();
-   if (nbfd == NULL)

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2006-11-28 17:04:37 UTC (rev 16708)
+++ trunk/buildroot/toolchain/binutils/Config.in	2006-11-28 21:11:01 UTC (rev 16709)
@@ -63,6 +63,10 @@
 		depends !BR2_nios2
 		bool "binutils 2.17.50.0.6"
 
+	config BR2_BINUTILS_VERSION_2_17_50_0_7
+		depends !BR2_nios2
+		bool "binutils 2.17.50.0.7"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -81,6 +85,7 @@
 	default "2.17.50.0.4"     if BR2_BINUTILS_VERSION_2_17_50_0_4
 	default "2.17.50.0.5"     if BR2_BINUTILS_VERSION_2_17_50_0_5
 	default "2.17.50.0.6"     if BR2_BINUTILS_VERSION_2_17_50_0_6
+	default "2.17.50.0.7"     if BR2_BINUTILS_VERSION_2_17_50_0_7
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
