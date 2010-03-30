From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Mar 2010 17:23:23 +0200
Subject: [Buildroot] [git commit master] binutils: get rid of ancient
	2.18.50.0.9 development version
Message-ID: <20100330152414.E6F8021341@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8c19cfef377cc09bc3fd2c61f97b80847206f673
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../binutils/2.18.50.0.9/110-arm-eabi-conf.patch   |   24 -------
 toolchain/binutils/2.18.50.0.9/120-sh-conf.patch   |   42 ------------
 .../2.18.50.0.9/300-001_ld_makefile_patch.patch    |   24 -------
 .../300-012_check_ldrunpath_length.patch           |   21 ------
 toolchain/binutils/2.18.50.0.9/PR6878.01.patch     |   68 --------------------
 toolchain/binutils/Config.in                       |    6 --
 6 files changed, 0 insertions(+), 185 deletions(-)
 delete mode 100644 toolchain/binutils/2.18.50.0.9/110-arm-eabi-conf.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.9/120-sh-conf.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.9/300-001_ld_makefile_patch.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.9/300-012_check_ldrunpath_length.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.9/PR6878.01.patch

diff --git a/toolchain/binutils/2.18.50.0.9/110-arm-eabi-conf.patch b/toolchain/binutils/2.18.50.0.9/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/toolchain/binutils/2.18.50.0.9/110-arm-eabi-conf.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -rdup binutils-2.18.50.0.3.orig/configure binutils-2.18.50.0.3/configure
---- binutils-2.18.50.0.3.orig/configure	2007-11-22 12:41:26.000000000 +0100
-+++ binutils-2.18.50.0.3/configure	2007-11-22 12:45:01.000000000 +0100
-@@ -2245,7 +2245,7 @@ case "${target}" in
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-*gnueabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
-diff -rdup binutils-2.18.50.0.3.orig/configure.ac binutils-2.18.50.0.3/configure.ac
---- binutils-2.18.50.0.3.orig/configure.ac	2007-11-22 12:41:26.000000000 +0100
-+++ binutils-2.18.50.0.3/configure.ac	2007-11-22 12:44:54.000000000 +0100
-@@ -522,7 +522,7 @@ case "${target}" in
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-*gnueabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
diff --git a/toolchain/binutils/2.18.50.0.9/120-sh-conf.patch b/toolchain/binutils/2.18.50.0.9/120-sh-conf.patch
deleted file mode 100644
index 071d15a..0000000
--- a/toolchain/binutils/2.18.50.0.9/120-sh-conf.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-diff -rdup binutils-2.18.50.0.9.old/configure binutils-2.18.50.0.9/configure
---- binutils-2.18.50.0.9.old/configure	2008-08-23 17:36:13.000000000 +0200
-+++ binutils-2.18.50.0.9/configure	2008-10-14 14:25:22.000000000 +0200
-@@ -2281,7 +2281,7 @@ case "${target}" in
-   am33_2.0-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
--  sh-*-linux*)
-+  sh*-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
-   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
-@@ -2606,7 +2606,7 @@ case "${target}" in
-   romp-*-*)
-     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${host}" in
-       i[3456789]86-*-vsta) ;; # don't add gprof back in
-       i[3456789]86-*-go32*) ;; # don't add gprof back in
-diff -rdup binutils-2.18.50.0.9.old/configure.ac binutils-2.18.50.0.9/configure.ac
---- binutils-2.18.50.0.9.old/configure.ac	2008-08-23 17:36:13.000000000 +0200
-+++ binutils-2.18.50.0.9/configure.ac	2008-10-14 14:25:11.000000000 +0200
-@@ -530,7 +530,7 @@ case "${target}" in
-   am33_2.0-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
--  sh-*-linux*)
-+  sh*-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;    
-   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
-@@ -855,7 +855,7 @@ case "${target}" in
-   romp-*-*)
-     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${host}" in
-       i[[3456789]]86-*-vsta) ;; # don't add gprof back in
-       i[[3456789]]86-*-go32*) ;; # don't add gprof back in
diff --git a/toolchain/binutils/2.18.50.0.9/300-001_ld_makefile_patch.patch b/toolchain/binutils/2.18.50.0.9/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/toolchain/binutils/2.18.50.0.9/300-001_ld_makefile_patch.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
---- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
-@@ -18,7 +18,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- 
- EMUL = @EMUL@
- EMULATION_OFILES = @EMULATION_OFILES@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.in binutils-2.17.50.0.17/ld/Makefile.in
---- binutils-2.17.50.0.17.oorig/ld/Makefile.in	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.in	2007-06-25 10:00:36.000000000 +0200
-@@ -287,7 +287,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- BASEDIR = $(srcdir)/..
- BFDDIR = $(BASEDIR)/bfd
- INCDIR = $(BASEDIR)/include
diff --git a/toolchain/binutils/2.18.50.0.9/300-012_check_ldrunpath_length.patch b/toolchain/binutils/2.18.50.0.9/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/toolchain/binutils/2.18.50.0.9/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
---- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
-@@ -1007,6 +1007,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+		  lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1191,6 +1193,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+      rpath = NULL;
-   if (! (bfd_elf_size_dynamic_sections
- 	 (output_bfd, command_line.soname, rpath,
- 	  command_line.filter_shlib,
diff --git a/toolchain/binutils/2.18.50.0.9/PR6878.01.patch b/toolchain/binutils/2.18.50.0.9/PR6878.01.patch
deleted file mode 100644
index 498ef30..0000000
--- a/toolchain/binutils/2.18.50.0.9/PR6878.01.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Index: a/gas/app.c
-===================================================================
-RCS file: /cvs/src/src/gas/app.c,v
-retrieving revision 1.47
-diff -c -3 -p -r1.47 app.c
-*** a/gas/app.c	18 Jul 2008 22:25:07 -0000	1.47
---- b/gas/app.c	18 Sep 2008 07:50:44 -0000
-*************** do_scrub_chars (int (*get) (char *, int)
-*** 1024,1030 ****
-  
-  #ifndef IEEE_STYLE
-  	case LEX_IS_ONECHAR_QUOTE:
-! 	  if (state == 9)
-  	    {
-  	      char c;
-  
---- 1024,1031 ----
-  
-  #ifndef IEEE_STYLE
-  	case LEX_IS_ONECHAR_QUOTE:
-! #ifdef H_TICK_HEX
-! 	  if (state == 9 && enable_h_tick_hex)
-  	    {
-  	      char c;
-  
-*************** do_scrub_chars (int (*get) (char *, int)
-*** 1032,1037 ****
---- 1033,1039 ----
-  	      as_warn ("'%c found after symbol", c);
-  	      UNGET (c);
-  	    }
-+ #endif
-  	  if (state == 10)
-  	    {
-  	      /* Preserve the whitespace in foo 'b'.  */
-Index: gas/messages.c
-===================================================================
-RCS file: /cvs/src/src/gas/messages.c,v
-retrieving revision 1.21
-diff -c -3 -p -r1.21 messages.c
-*** a/gas/messages.c	30 Jul 2008 04:34:57 -0000	1.21
---- b/gas/messages.c	18 Sep 2008 07:50:44 -0000
-*************** as_warn_internal (char *file, unsigned i
-*** 162,171 ****
-  
-    identify (file);
-    if (file)
-!     fprintf (stderr, "%s:%u: ", file, line);
-!   fprintf (stderr, _("Warning: "));
-!   fputs (buffer, stderr);
-!   (void) putc ('\n', stderr);
-  #ifndef NO_LISTING
-    listing_warning (buffer);
-  #endif
---- 162,174 ----
-  
-    identify (file);
-    if (file)
-!     {
-!       fprintf (stderr, "%s:", file);
-!       if (line)
-! 	fprintf (stderr, "%u:", line);
-!       fputc (' ', stderr);
-!     }
-!   fprintf (stderr, _("Warning: %s\n"), buffer);
-  #ifndef NO_LISTING
-    listing_warning (buffer);
-  #endif
diff --git a/toolchain/binutils/Config.in b/toolchain/binutils/Config.in
index 602d696..36d3c00 100644
--- a/toolchain/binutils/Config.in
+++ b/toolchain/binutils/Config.in
@@ -18,11 +18,6 @@ choice
 		depends on BR2_DEPRECATED
 		bool "binutils 2.18"
 
-	config BR2_BINUTILS_VERSION_2_18_50_0_9
-		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_DEPRECATED
-		bool "binutils 2.18.50.0.9"
-
 	config BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
 	       depends on BR2_avr32
 	       bool "binutils 2.18-avr32-1.0.1"
@@ -53,7 +48,6 @@ config BR2_BINUTILS_VERSION
 	default "2.15"		if BR2_nios2
 	default "2.17"		if BR2_BINUTILS_VERSION_2_17
 	default "2.18"		if BR2_BINUTILS_VERSION_2_18
-	default "2.18.50.0.9"	if BR2_BINUTILS_VERSION_2_18_50_0_9
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
 	default "2.19"		if BR2_BINUTILS_VERSION_2_19
 	default "2.19.1"	if BR2_BINUTILS_VERSION_2_19_1
-- 
1.6.3.3
