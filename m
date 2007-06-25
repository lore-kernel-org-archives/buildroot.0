From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 02:43:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	2.17.50.0.17
Message-ID: <20070625094317.34EC0A45B5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 02:43:16 -0700 (Mon, 25 Jun 2007)
New Revision: 18915

Log:
- add 2.17.50.0.17


Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.17/

Modified:
   trunk/buildroot/toolchain/binutils/2.17.50.0.17/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.17/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.17/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Copied: trunk/buildroot/toolchain/binutils/2.17.50.0.17 (from rev 18889, trunk/buildroot/toolchain/binutils/2.17.50.0.16)

Modified: trunk/buildroot/toolchain/binutils/2.17.50.0.17/110-arm-eabi-conf.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.16/110-arm-eabi-conf.patch	2007-06-21 22:10:12 UTC (rev 18889)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.17/110-arm-eabi-conf.patch	2007-06-25 09:43:16 UTC (rev 18915)
@@ -1,7 +1,7 @@
-diff -urN binutils-2.16.91.0.7.orig/configure binutils-2.16.91.0.7/configure
---- binutils-2.16.91.0.7.orig/configure	2006-05-31 14:54:24.000000000 +0300
-+++ binutils-2.16.91.0.7/configure	2006-05-31 14:55:53.000000000 +0300
-@@ -1299,7 +1299,7 @@
+diff -u binutils-2.17.50.0.17.oorig/configure binutils-2.17.50.0.17/configure
+--- binutils-2.17.50.0.17.oorig/configure	2007-06-18 19:29:28.000000000 +0200
++++ binutils-2.17.50.0.17/configure	2007-06-25 09:58:36.000000000 +0200
+@@ -2224,7 +2224,7 @@
    arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
      noconfigdirs="$noconfigdirs target-libffi target-qthreads"
      ;;
@@ -10,10 +10,10 @@
      noconfigdirs="$noconfigdirs target-libffi target-qthreads"
      noconfigdirs="$noconfigdirs target-libjava target-libobjc"
      ;;
-diff -urN binutils-2.16.91.0.7.orig/configure.ac binutils-2.16.91.0.7/configure.ac
---- binutils-2.16.91.0.7.orig/configure.ac	2006-05-31 14:54:24.000000000 +0300
-+++ binutils-2.16.91.0.7/configure.ac	2006-05-31 14:55:53.000000000 +0300
-@@ -497,7 +497,7 @@
+diff -u binutils-2.17.50.0.17.oorig/configure.ac binutils-2.17.50.0.17/configure.ac
+--- binutils-2.17.50.0.17.oorig/configure.ac	2007-06-18 19:29:28.000000000 +0200
++++ binutils-2.17.50.0.17/configure.ac	2007-06-25 09:58:36.000000000 +0200
+@@ -513,7 +513,7 @@
    arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
      noconfigdirs="$noconfigdirs target-libffi target-qthreads"
      ;;

Modified: trunk/buildroot/toolchain/binutils/2.17.50.0.17/300-001_ld_makefile_patch.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.16/300-001_ld_makefile_patch.patch	2007-06-21 22:10:12 UTC (rev 18889)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.17/300-001_ld_makefile_patch.patch	2007-06-25 09:43:16 UTC (rev 18915)
@@ -1,34 +1,7 @@
-#!/bin/sh -e
-## 001_ld_makefile_patch.dpatch
-##
-## All lines beginning with `## DP:' are a description of the patch.
-## DP: Description: correct where ld scripts are installed
-## DP: Author: Chris Chimelis <chris@debian.org>
-## DP: Upstream status: N/A
-## DP: Date: ??
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
---- binutils-2.16.91.0.1/ld/Makefile.am
-+++ binutils-2.16.91.0.1/ld/Makefile.am
-@@ -20,7 +20,7 @@
+diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
+--- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
++++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
+@@ -18,7 +18,7 @@
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -37,9 +10,10 @@
  
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
---- binutils-2.16.91.0.1/ld/Makefile.in
-+++ binutils-2.16.91.0.1/ld/Makefile.in
-@@ -268,7 +268,7 @@
+diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.in binutils-2.17.50.0.17/ld/Makefile.in
+--- binutils-2.17.50.0.17.oorig/ld/Makefile.in	2007-06-18 19:29:29.000000000 +0200
++++ binutils-2.17.50.0.17/ld/Makefile.in	2007-06-25 10:00:36.000000000 +0200
+@@ -287,7 +287,7 @@
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.

Modified: trunk/buildroot/toolchain/binutils/2.17.50.0.17/300-012_check_ldrunpath_length.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.16/300-012_check_ldrunpath_length.patch	2007-06-21 22:10:12 UTC (rev 18889)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.17/300-012_check_ldrunpath_length.patch	2007-06-25 09:43:16 UTC (rev 18915)
@@ -1,33 +1,7 @@
-#!/bin/sh -e
-## 012_check_ldrunpath_length.dpatch by Chris Chimelis <chris@debian.org>
-##
-## All lines beginning with `## DP:' are a description of the patch.
-## DP: Only generate an RPATH entry if LD_RUN_PATH is not empty, for
-## DP: cases where -rpath isn't specified. (#151024)
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
-diff -urNad /home/james/debian/packages/binutils/new/binutils-2.15/ld/emultempl/elf32.em binutils-2.15/ld/emultempl/elf32.em
---- /home/james/debian/packages/binutils/new/binutils-2.15/ld/emultempl/elf32.em	2004-05-21 23:12:58.000000000 +0100
-+++ binutils-2.15/ld/emultempl/elf32.em	2004-05-21 23:12:59.000000000 +0100
-@@ -692,6 +692,8 @@
+diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
+--- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
++++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
+@@ -1007,6 +1007,8 @@
  	      && command_line.rpath == NULL)
  	    {
  	      lib_path = (const char *) getenv ("LD_RUN_PATH");
@@ -36,7 +10,7 @@
  	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
  						      force))
  		break;
-@@ -871,6 +873,8 @@
+@@ -1191,6 +1193,8 @@
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-06-25 09:41:35 UTC (rev 18914)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-06-25 09:43:16 UTC (rev 18915)
@@ -89,8 +89,12 @@
 		bool "binutils 2.17.50.0.14"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_16
+		depends !BR2_nios2 && BR2_DEPRECATED
+		bool "binutils 2.17.50.0.16"
+
+	config BR2_BINUTILS_VERSION_2_17_50_0_17
 		depends !BR2_nios2
-		bool "binutils 2.17.50.0.16"
+		bool "binutils 2.17.50.0.17"
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -116,6 +120,7 @@
 	default "2.17.50.0.12"    if BR2_BINUTILS_VERSION_2_17_50_0_12
 	default "2.17.50.0.14"    if BR2_BINUTILS_VERSION_2_17_50_0_14
 	default "2.17.50.0.16"    if BR2_BINUTILS_VERSION_2_17_50_0_16
+	default "2.17.50.0.17"    if BR2_BINUTILS_VERSION_2_17_50_0_17
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
