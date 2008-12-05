From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  5 Dec 2008 07:27:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	2.18.50.0.6
Message-ID: <20081205152745.B455F3C8FE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-05 07:27:45 -0800 (Fri, 05 Dec 2008)
New Revision: 24289

Log:
toolchain/binutils: add 2.18.50.0.6

Based on 45b89c54 / beede0ba in Bernhard's tree.

Added:
   trunk/buildroot/toolchain/binutils/2.18.50.0.6/
   trunk/buildroot/toolchain/binutils/2.18.50.0.6/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.18.50.0.6/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.18.50.0.6/300-012_check_ldrunpath_length.patch

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Added: trunk/buildroot/toolchain/binutils/2.18.50.0.6/110-arm-eabi-conf.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.18.50.0.6/110-arm-eabi-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.18.50.0.6/110-arm-eabi-conf.patch	2008-12-05 15:27:45 UTC (rev 24289)
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

Added: trunk/buildroot/toolchain/binutils/2.18.50.0.6/300-001_ld_makefile_patch.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.18.50.0.6/300-001_ld_makefile_patch.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.18.50.0.6/300-001_ld_makefile_patch.patch	2008-12-05 15:27:45 UTC (rev 24289)
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

Added: trunk/buildroot/toolchain/binutils/2.18.50.0.6/300-012_check_ldrunpath_length.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.18.50.0.6/300-012_check_ldrunpath_length.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.18.50.0.6/300-012_check_ldrunpath_length.patch	2008-12-05 15:27:45 UTC (rev 24289)
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
--- trunk/buildroot/toolchain/binutils/Config.in	2008-12-05 15:27:42 UTC (rev 24288)
+++ trunk/buildroot/toolchain/binutils/Config.in	2008-12-05 15:27:45 UTC (rev 24289)
@@ -32,6 +32,10 @@
 		depends on !BR2_avr32 && !BR2_nios2
 		depends on BR2_DEPRECATED
 		bool "binutils 2.18.50.0.3"
+
+	config BR2_BINUTILS_VERSION_2_18_50_0_6
+		depends on !BR2_avr32 && !BR2_nios2
+		bool "binutils 2.18.50.0.6"
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -42,6 +46,7 @@
 	default "2.18"		if BR2_BINUTILS_VERSION_2_18
 	default "2.18.50.0.1"	if BR2_BINUTILS_VERSION_2_18_50_0_1
 	default "2.18.50.0.3"	if BR2_BINUTILS_VERSION_2_18_50_0_3
+	default "2.18.50.0.6"	if BR2_BINUTILS_VERSION_2_18_50_0_6
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
