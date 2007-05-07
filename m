From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun,  6 May 2007 20:57:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	2.17.50.0.12
Message-ID: <20070507035710.C9E7B48074@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-06 20:57:09 -0700 (Sun, 06 May 2007)
New Revision: 18570

Log:
Add older version of binutils.


Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/320-mips-elf-reloc-regression.patch

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Added: trunk/buildroot/toolchain/binutils/2.17.50.0.12/100-uclibc-conf.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.12/100-uclibc-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.12/100-uclibc-conf.patch	2007-05-07 03:57:09 UTC (rev 18570)
@@ -0,0 +1,139 @@
+--- binutils-2.16.91.0.7/bfd/configure
++++ binutils-2.16.91.0.7/bfd/configure
+@@ -3576,7 +3576,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
+--- binutils-2.16.91.0.7/binutils/configure
++++ binutils-2.16.91.0.7/binutils/configure
+@@ -3411,7 +3411,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
+--- binutils-2.16.91.0.7/configure
++++ binutils-2.16.91.0.7/configure
+@@ -1270,7 +1270,7 @@
+   am33_2.0-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+-  sh-*-linux*)
++  sh*-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;    
+   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
+@@ -1578,7 +1578,7 @@
+   romp-*-*)
+     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${host}" in
+       i[3456789]86-*-vsta) ;; # don't add gprof back in
+       i[3456789]86-*-go32*) ;; # don't add gprof back in
+--- binutils-2.16.91.0.7/configure.in
++++ binutils-2.16.91.0.7/configure.in
+@@ -468,7 +468,7 @@
+   am33_2.0-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+-  sh-*-linux*)
++  sh*-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;    
+   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
+@@ -776,7 +776,7 @@
+   romp-*-*)
+     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${host}" in
+       i[[3456789]]86-*-vsta) ;; # don't add gprof back in
+       i[[3456789]]86-*-go32*) ;; # don't add gprof back in
+--- binutils-2.16.91.0.7/gas/configure
++++ binutils-2.16.91.0.7/gas/configure
+@@ -3411,7 +3411,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
+--- binutils-2.16.91.0.7/gprof/configure
++++ binutils-2.16.91.0.7/gprof/configure
+@@ -3419,6 +3419,11 @@
+   lt_cv_file_magic_test_file=`echo /lib/libc.so* /lib/libc-*.so`
+   ;;
+ 
++linux-uclibc*)
++  lt_cv_deplibs_check_method=pass_all
++  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
++  ;;
++
+ netbsd* | knetbsd*-gnu)
+   if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
+     lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so\.[0-9]+\.[0-9]+$'
+--- binutils-2.16.91.0.7/ld/configure
++++ binutils-2.16.91.0.7/ld/configure
+@@ -3413,7 +3413,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
+--- binutils-2.16.91.0.7/libtool.m4
++++ binutils-2.16.91.0.7/libtool.m4
+@@ -739,7 +739,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
+--- binutils-2.16.91.0.7/ltconfig
++++ binutils-2.16.91.0.7/ltconfig
+@@ -602,6 +602,7 @@
+ 
+ # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+ case $host_os in
++linux-uclibc*) ;;
+ linux-gnu*) ;;
+ linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+ esac
+@@ -1247,7 +1248,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no
+--- binutils-2.16.91.0.7/opcodes/configure
++++ binutils-2.16.91.0.7/opcodes/configure
+@@ -3579,7 +3579,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 

Added: trunk/buildroot/toolchain/binutils/2.17.50.0.12/110-arm-eabi-conf.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.12/110-arm-eabi-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.12/110-arm-eabi-conf.patch	2007-05-07 03:57:09 UTC (rev 18570)
@@ -0,0 +1,24 @@
+diff -urN binutils-2.16.91.0.7.orig/configure binutils-2.16.91.0.7/configure
+--- binutils-2.16.91.0.7.orig/configure	2006-05-31 14:54:24.000000000 +0300
++++ binutils-2.16.91.0.7/configure	2006-05-31 14:55:53.000000000 +0300
+@@ -1299,7 +1299,7 @@
+   arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
+     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
+     ;;
+-  arm*-*-linux-gnueabi)
++  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
+     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
+     noconfigdirs="$noconfigdirs target-libjava target-libobjc"
+     ;;
+diff -urN binutils-2.16.91.0.7.orig/configure.in binutils-2.16.91.0.7/configure.in
+--- binutils-2.16.91.0.7.orig/configure.in	2006-05-31 14:54:24.000000000 +0300
++++ binutils-2.16.91.0.7/configure.in	2006-05-31 14:55:53.000000000 +0300
+@@ -497,7 +497,7 @@
+   arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
+     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
+     ;;
+-  arm*-*-linux-gnueabi)
++  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
+     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
+     noconfigdirs="$noconfigdirs target-libjava target-libobjc"
+     ;;

Added: trunk/buildroot/toolchain/binutils/2.17.50.0.12/300-001_ld_makefile_patch.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.12/300-001_ld_makefile_patch.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.12/300-001_ld_makefile_patch.patch	2007-05-07 03:57:09 UTC (rev 18570)
@@ -0,0 +1,50 @@
+#!/bin/sh -e
+## 001_ld_makefile_patch.dpatch
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Description: correct where ld scripts are installed
+## DP: Author: Chris Chimelis <chris@debian.org>
+## DP: Upstream status: N/A
+## DP: Date: ??
+
+if [ $# -ne 1 ]; then
+    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+    exit 1
+fi
+
+[ -f debian/patches/00patch-opts ] && . debian/patches/00patch-opts
+patch_opts="${patch_opts:--f --no-backup-if-mismatch}"
+
+case "$1" in
+       -patch) patch $patch_opts -p1 < $0;;
+       -unpatch) patch $patch_opts -p1 -R < $0;;
+        *)
+                echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+                exit 1;;
+esac
+
+exit 0
+
+ at DPATCH@
+--- binutils-2.16.91.0.1/ld/Makefile.am
++++ binutils-2.16.91.0.1/ld/Makefile.am
+@@ -20,7 +20,7 @@
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ 
+ EMUL = @EMUL@
+ EMULATION_OFILES = @EMULATION_OFILES@
+--- binutils-2.16.91.0.1/ld/Makefile.in
++++ binutils-2.16.91.0.1/ld/Makefile.in
+@@ -268,7 +268,7 @@
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ BASEDIR = $(srcdir)/..
+ BFDDIR = $(BASEDIR)/bfd
+ INCDIR = $(BASEDIR)/include

Added: trunk/buildroot/toolchain/binutils/2.17.50.0.12/300-012_check_ldrunpath_length.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.12/300-012_check_ldrunpath_length.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.12/300-012_check_ldrunpath_length.patch	2007-05-07 03:57:09 UTC (rev 18570)
@@ -0,0 +1,47 @@
+#!/bin/sh -e
+## 012_check_ldrunpath_length.dpatch by Chris Chimelis <chris@debian.org>
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Only generate an RPATH entry if LD_RUN_PATH is not empty, for
+## DP: cases where -rpath isn't specified. (#151024)
+
+if [ $# -ne 1 ]; then
+    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+    exit 1
+fi
+
+[ -f debian/patches/00patch-opts ] && . debian/patches/00patch-opts
+patch_opts="${patch_opts:--f --no-backup-if-mismatch}"
+
+case "$1" in
+       -patch) patch $patch_opts -p1 < $0;;
+       -unpatch) patch $patch_opts -p1 -R < $0;;
+        *)
+                echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+                exit 1;;
+esac
+
+exit 0
+
+ at DPATCH@
+diff -urNad /home/james/debian/packages/binutils/new/binutils-2.15/ld/emultempl/elf32.em binutils-2.15/ld/emultempl/elf32.em
+--- /home/james/debian/packages/binutils/new/binutils-2.15/ld/emultempl/elf32.em	2004-05-21 23:12:58.000000000 +0100
++++ binutils-2.15/ld/emultempl/elf32.em	2004-05-21 23:12:59.000000000 +0100
+@@ -692,6 +692,8 @@
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((lib_path) && (strlen (lib_path) == 0))
++		  lib_path = NULL;
+ 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
+ 						      force))
+ 		break;
+@@ -871,6 +873,8 @@
+   rpath = command_line.rpath;
+   if (rpath == NULL)
+     rpath = (const char *) getenv ("LD_RUN_PATH");
++  if ((rpath) && (strlen (rpath) == 0))
++      rpath = NULL;
+   if (! (bfd_elf_size_dynamic_sections
+ 	 (output_bfd, command_line.soname, rpath,
+ 	  command_line.filter_shlib,

Added: trunk/buildroot/toolchain/binutils/2.17.50.0.12/320-mips-elf-reloc-regression.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.12/320-mips-elf-reloc-regression.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.12/320-mips-elf-reloc-regression.patch	2007-05-07 03:57:09 UTC (rev 18570)
@@ -0,0 +1,68 @@
+diff -ur binutils-2.17.50.0.12/bfd/elfxx-mips.c binutils-2.17.50.0.12-patched/bfd/elfxx-mips.c
+--- binutils-2.17.50.0.12/bfd/elfxx-mips.c	2006-11-27 16:21:04.000000000 -0600
++++ binutils-2.17.50.0.12-patched/bfd/elfxx-mips.c	2007-03-20 15:25:42.000000000 -0500
+@@ -3615,7 +3615,6 @@
+     }
+ 
+   /* We didn't find it.  */
+-  bfd_set_error (bfd_error_bad_value);
+   return NULL;
+ }
+ 
+@@ -7849,32 +7848,36 @@
+ 		     several relocations for the same address.  In
+ 		     that case, the R_MIPS_LO16 relocation may occur
+ 		     as one of these.  We permit a similar extension
+-		     in general, as that is useful for GCC.  */
++		     in general, as that is useful for GCC.
++
++		     In some cases GCC dead code elimination removes
++		     the LO16 but keeps the corresponding HI16.  */
+ 		  lo16_relocation = mips_elf_next_relocation (input_bfd,
+ 							      lo16_type,
+ 							      rel, relend);
+-		  if (lo16_relocation == NULL)
+-		    return FALSE;
+-
+-		  lo16_location = contents + lo16_relocation->r_offset;
++		  if (lo16_relocation != NULL)
++		    {
++		      lo16_location = contents + lo16_relocation->r_offset;
+ 
+-		  /* Obtain the addend kept there.  */
+-		  lo16_howto = MIPS_ELF_RTYPE_TO_HOWTO (input_bfd,
+-							lo16_type, FALSE);
+-		  _bfd_mips16_elf_reloc_unshuffle (input_bfd, lo16_type, FALSE,
+-						   lo16_location);
+-		  l = mips_elf_obtain_contents (lo16_howto, lo16_relocation,
+-						input_bfd, contents);
+-		  _bfd_mips16_elf_reloc_shuffle (input_bfd, lo16_type, FALSE,
+-						 lo16_location);
+-		  l &= lo16_howto->src_mask;
+-		  l <<= lo16_howto->rightshift;
+-		  l = _bfd_mips_elf_sign_extend (l, 16);
++		      /* Obtain the addend kept there.  */
++		      lo16_howto = MIPS_ELF_RTYPE_TO_HOWTO (input_bfd,
++							    lo16_type, FALSE);
++		      _bfd_mips16_elf_reloc_unshuffle (input_bfd, lo16_type,
++						       FALSE, lo16_location);
++		      l = mips_elf_obtain_contents (lo16_howto,
++						    lo16_relocation,
++						    input_bfd, contents);
++		      _bfd_mips16_elf_reloc_shuffle (input_bfd, lo16_type,
++						     FALSE, lo16_location);
++		      l &= lo16_howto->src_mask;
++		      l <<= lo16_howto->rightshift;
++		      l = _bfd_mips_elf_sign_extend (l, 16);
+ 
+-		  addend <<= 16;
++		      addend <<= 16;
+ 
+-		  /* Compute the combined addend.  */
+-		  addend += l;
++		      /* Compute the combined addend.  */
++		      addend += l;
++		    }
+ 		}
+ 	      else
+ 		addend <<= howto->rightshift;

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-05-07 03:56:47 UTC (rev 18569)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-05-07 03:57:09 UTC (rev 18570)
@@ -80,6 +80,10 @@
 		depends !BR2_nios2
 		bool "binutils 2.17.50.0.10"
 
+	config BR2_BINUTILS_VERSION_2_17_50_0_12
+		depends !BR2_nios2
+		bool "binutils 2.17.50.0.12"
+
 	config BR2_BINUTILS_VERSION_2_17_50_0_14
 		depends !BR2_nios2
 		bool "binutils 2.17.50.0.14"
@@ -105,6 +109,7 @@
 	default "2.17.50.0.8"     if BR2_BINUTILS_VERSION_2_17_50_0_8
 	default "2.17.50.0.9"     if BR2_BINUTILS_VERSION_2_17_50_0_9
 	default "2.17.50.0.10"    if BR2_BINUTILS_VERSION_2_17_50_0_10
+	default "2.17.50.0.12"    if BR2_BINUTILS_VERSION_2_17_50_0_12
 	default "2.17.50.0.14"    if BR2_BINUTILS_VERSION_2_17_50_0_14
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
