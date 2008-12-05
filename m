From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  5 Dec 2008 07:28:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:  2.19
Message-ID: <20081205152802.5BB193C64F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-05 07:28:01 -0800 (Fri, 05 Dec 2008)
New Revision: 24294

Log:
toolchain/binutils: add 2.19

Based on 9cd8638d / b86af9a1 in Bernhard's tree.

Added:
   trunk/buildroot/toolchain/binutils/2.19/
   trunk/buildroot/toolchain/binutils/2.19/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.19/120-sh-conf.patch
   trunk/buildroot/toolchain/binutils/2.19/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.19/300-012_check_ldrunpath_length.patch

Modified:
   trunk/buildroot/toolchain/binutils/Config.in
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Added: trunk/buildroot/toolchain/binutils/2.19/110-arm-eabi-conf.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.19/110-arm-eabi-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.19/110-arm-eabi-conf.patch	2008-12-05 15:28:01 UTC (rev 24294)
@@ -0,0 +1,24 @@
+diff -rdup binutils-2.18.50.0.3.orig/configure binutils-2.18.50.0.3/configure
+--- binutils-2.18.50.0.3.orig/configure	2007-11-22 12:41:26.000000000 +0100
++++ binutils-2.18.50.0.3/configure	2007-11-22 12:45:01.000000000 +0100
+@@ -2245,7 +2245,7 @@ case "${target}" in
+     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
+     libgloss_dir=arm
+     ;;
+-  arm*-*-linux-gnueabi)
++  arm*-*-linux-*gnueabi)
+     noconfigdirs="$noconfigdirs target-qthreads"
+     noconfigdirs="$noconfigdirs target-libobjc"
+     case ${with_newlib} in
+diff -rdup binutils-2.18.50.0.3.orig/configure.ac binutils-2.18.50.0.3/configure.ac
+--- binutils-2.18.50.0.3.orig/configure.ac	2007-11-22 12:41:26.000000000 +0100
++++ binutils-2.18.50.0.3/configure.ac	2007-11-22 12:44:54.000000000 +0100
+@@ -522,7 +522,7 @@ case "${target}" in
+     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
+     libgloss_dir=arm
+     ;;
+-  arm*-*-linux-gnueabi)
++  arm*-*-linux-*gnueabi)
+     noconfigdirs="$noconfigdirs target-qthreads"
+     noconfigdirs="$noconfigdirs target-libobjc"
+     case ${with_newlib} in

Added: trunk/buildroot/toolchain/binutils/2.19/120-sh-conf.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.19/120-sh-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.19/120-sh-conf.patch	2008-12-05 15:28:01 UTC (rev 24294)
@@ -0,0 +1,42 @@
+diff -rdup binutils-2.18.50.0.9.old/configure binutils-2.18.50.0.9/configure
+--- binutils-2.18.50.0.9.old/configure	2008-08-23 17:36:13.000000000 +0200
++++ binutils-2.18.50.0.9/configure	2008-10-14 14:25:22.000000000 +0200
+@@ -2281,7 +2281,7 @@ case "${target}" in
+   am33_2.0-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+-  sh-*-linux*)
++  sh*-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
+@@ -2606,7 +2606,7 @@ case "${target}" in
+   romp-*-*)
+     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${host}" in
+       i[3456789]86-*-vsta) ;; # don't add gprof back in
+       i[3456789]86-*-go32*) ;; # don't add gprof back in
+diff -rdup binutils-2.18.50.0.9.old/configure.ac binutils-2.18.50.0.9/configure.ac
+--- binutils-2.18.50.0.9.old/configure.ac	2008-08-23 17:36:13.000000000 +0200
++++ binutils-2.18.50.0.9/configure.ac	2008-10-14 14:25:11.000000000 +0200
+@@ -530,7 +530,7 @@ case "${target}" in
+   am33_2.0-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+-  sh-*-linux*)
++  sh*-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;    
+   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
+@@ -855,7 +855,7 @@ case "${target}" in
+   romp-*-*)
+     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${host}" in
+       i[[3456789]]86-*-vsta) ;; # don't add gprof back in
+       i[[3456789]]86-*-go32*) ;; # don't add gprof back in

Added: trunk/buildroot/toolchain/binutils/2.19/300-001_ld_makefile_patch.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.19/300-001_ld_makefile_patch.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.19/300-001_ld_makefile_patch.patch	2008-12-05 15:28:01 UTC (rev 24294)
@@ -0,0 +1,24 @@
+diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
+--- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
++++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
+@@ -18,7 +18,7 @@
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ 
+ EMUL = @EMUL@
+ EMULATION_OFILES = @EMULATION_OFILES@
+diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.in binutils-2.17.50.0.17/ld/Makefile.in
+--- binutils-2.17.50.0.17.oorig/ld/Makefile.in	2007-06-18 19:29:29.000000000 +0200
++++ binutils-2.17.50.0.17/ld/Makefile.in	2007-06-25 10:00:36.000000000 +0200
+@@ -287,7 +287,7 @@
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ BASEDIR = $(srcdir)/..
+ BFDDIR = $(BASEDIR)/bfd
+ INCDIR = $(BASEDIR)/include

Added: trunk/buildroot/toolchain/binutils/2.19/300-012_check_ldrunpath_length.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.19/300-012_check_ldrunpath_length.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.19/300-012_check_ldrunpath_length.patch	2008-12-05 15:28:01 UTC (rev 24294)
@@ -0,0 +1,21 @@
+diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
+--- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
++++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
+@@ -1007,6 +1007,8 @@
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((lib_path) && (strlen (lib_path) == 0))
++		  lib_path = NULL;
+ 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
+ 						      force))
+ 		break;
+@@ -1191,6 +1193,8 @@
+   rpath = command_line.rpath;
+   if (rpath == NULL)
+     rpath = (const char *) getenv ("LD_RUN_PATH");
++  if ((rpath) && (strlen (rpath) == 0))
++      rpath = NULL;
+   if (! (bfd_elf_size_dynamic_sections
+ 	 (output_bfd, command_line.soname, rpath,
+ 	  command_line.filter_shlib,

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2008-12-05 15:27:58 UTC (rev 24293)
+++ trunk/buildroot/toolchain/binutils/Config.in	2008-12-05 15:28:01 UTC (rev 24294)
@@ -4,7 +4,7 @@
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_18
+	default BR2_BINUTILS_VERSION_2_19
 	help
 	  Select the version of binutils you wish to use.
 
@@ -45,7 +45,12 @@
 
 	config BR2_BINUTILS_VERSION_2_18_50_0_9
 		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_DEPRECATED
 		bool "binutils 2.18.50.0.9"
+
+	config BR2_BINUTILS_VERSION_2_19
+		depends on !BR2_avr32 && !BR2_nios2
+		bool "binutils 2.19"
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -59,6 +64,7 @@
 	default "2.18.50.0.6"	if BR2_BINUTILS_VERSION_2_18_50_0_6
 	default "2.18.50.0.8"	if BR2_BINUTILS_VERSION_2_18_50_0_8
 	default "2.18.50.0.9"	if BR2_BINUTILS_VERSION_2_18_50_0_9
+	default "2.19"		if BR2_BINUTILS_VERSION_2_19
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-05 15:27:58 UTC (rev 24293)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-05 15:28:01 UTC (rev 24294)
@@ -3,12 +3,15 @@
 # build binutils for use on the host system
 #
 #############################################################
-BINUTILS_VERSION:=$(strip $(subst ",, $(BR2_BINUTILS_VERSION)))
-#"))
+BINUTILS_VERSION:=$(subst ",,$(BR2_BINUTILS_VERSION))
+#")
 
 EXTRA_BINUTILS_CONFIG_OPTIONS=$(strip $(subst ",, $(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS)))
 #"))
 BINUTILS_SITE:=$(BR2_KERNEL_MIRROR)/linux/devel/binutils
+ifeq ($(BINUTILS_VERSION),2.19)
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
+endif
 ifeq ($(BINUTILS_VERSION),2.18)
 BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 endif
@@ -143,6 +146,8 @@
 binutils-dirclean:
 	rm -rf $(BINUTILS_DIR1)
 
+binutils-src-dirclean:
+	rm -rf $(BINUTILS_DIR)
 
 #############################################################
 #
