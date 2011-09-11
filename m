From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 11 Sep 2011 17:38:07 +0200
Subject: [Buildroot] [PATCH 1/4] package/binutils: fixup version strings 1/2
In-Reply-To: <1315755490-9920-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1315755490-9920-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1315755490-9920-2-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The binutils tarballs have been re-released after a GPL compliance
issue was found:
  http://sourceware.org/ml/binutils/2011-08/msg00198.html

So all versions were re-packaged.

In the process, two things happenned:
 - some versions (eg. 2.19) went missing, due to them being super-seeded
   by a dot release (eg. 2.19.1)
 - an 'a' was appended to the version strings

So, this patch fixes the first issue by removing no-longer available
versions (including patch dirs).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/binutils/Config.in.host                    |   16 --
 .../binutils/binutils-2.19/110-arm-eabi-conf.patch |   24 ---
 package/binutils/binutils-2.19/120-sh-conf.patch   |   42 -----
 .../binutils-2.19/300-001_ld_makefile_patch.patch  |   24 ---
 .../300-012_check_ldrunpath_length.patch           |   21 ---
 .../binutils/binutils-2.20/110-arm-eabi-conf.patch |   24 ---
 package/binutils/binutils-2.20/120-sh-conf.patch   |   42 -----
 .../binutils-2.20/300-001_ld_makefile_patch.patch  |   24 ---
 .../300-012_check_ldrunpath_length.patch           |   21 ---
 .../binutils-2.20/400-arm_link_speed.patch         |  183 --------------------
 .../binutils/binutils-2.21/110-arm-eabi-conf.patch |   24 ---
 package/binutils/binutils-2.21/120-sh-conf.patch   |   42 -----
 .../binutils-2.21/300-001_ld_makefile_patch.patch  |   24 ---
 .../300-012_check_ldrunpath_length.patch           |   21 ---
 14 files changed, 0 insertions(+), 532 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index f87298a..f035bfd 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -17,28 +17,15 @@ choice
 	       depends on BR2_avr32
 	       bool "binutils 2.18-avr32-1.0.1"
 
-	config BR2_BINUTILS_VERSION_2_19
-		depends on !BR2_avr32
-		depends on BR2_DEPRECATED
-		bool "binutils 2.19"
-
 	config BR2_BINUTILS_VERSION_2_19_1
 		depends on !BR2_avr32
 		depends on BR2_DEPRECATED
 		bool "binutils 2.19.1"
 
-	config BR2_BINUTILS_VERSION_2_20
-		depends on !BR2_avr32
-		bool "binutils 2.20"
-
 	config BR2_BINUTILS_VERSION_2_20_1
 		depends on !BR2_avr32
 		bool "binutils 2.20.1"
 
-	config BR2_BINUTILS_VERSION_2_21
-		depends on !BR2_avr32
-		bool "binutils 2.21"
-
 	config BR2_BINUTILS_VERSION_2_21_1
 		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_30 || BR2_UCLIBC_VERSION_0_9_31)
 		bool "binutils 2.21.1"
@@ -49,11 +36,8 @@ config BR2_BINUTILS_VERSION
 	string
 	default "2.18"		if BR2_BINUTILS_VERSION_2_18
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "2.19"		if BR2_BINUTILS_VERSION_2_19
 	default "2.19.1"	if BR2_BINUTILS_VERSION_2_19_1
-	default "2.20"		if BR2_BINUTILS_VERSION_2_20
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
-	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
 
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
diff --git a/package/binutils/binutils-2.19/110-arm-eabi-conf.patch b/package/binutils/binutils-2.19/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/package/binutils/binutils-2.19/110-arm-eabi-conf.patch
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
diff --git a/package/binutils/binutils-2.19/120-sh-conf.patch b/package/binutils/binutils-2.19/120-sh-conf.patch
deleted file mode 100644
index 071d15a..0000000
--- a/package/binutils/binutils-2.19/120-sh-conf.patch
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
diff --git a/package/binutils/binutils-2.19/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.19/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/package/binutils/binutils-2.19/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/binutils-2.19/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.19/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/package/binutils/binutils-2.19/300-012_check_ldrunpath_length.patch
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
diff --git a/package/binutils/binutils-2.20/110-arm-eabi-conf.patch b/package/binutils/binutils-2.20/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/package/binutils/binutils-2.20/110-arm-eabi-conf.patch
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
diff --git a/package/binutils/binutils-2.20/120-sh-conf.patch b/package/binutils/binutils-2.20/120-sh-conf.patch
deleted file mode 100644
index 071d15a..0000000
--- a/package/binutils/binutils-2.20/120-sh-conf.patch
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
diff --git a/package/binutils/binutils-2.20/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.20/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/package/binutils/binutils-2.20/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/binutils-2.20/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.20/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/package/binutils/binutils-2.20/300-012_check_ldrunpath_length.patch
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
diff --git a/package/binutils/binutils-2.20/400-arm_link_speed.patch b/package/binutils/binutils-2.20/400-arm_link_speed.patch
deleted file mode 100644
index d03385a..0000000
--- a/package/binutils/binutils-2.20/400-arm_link_speed.patch
+++ /dev/null
@@ -1,183 +0,0 @@
-From Binutils CVS:
-
-http://sourceware.org/cgi-bin/cvsweb.cgi/src/bfd/elf32-arm.c?rev=1.230&content-type=text/x-cvsweb-markup&cvsroot=src
-
-Improves linking time from large projects on ARM.
-diff -dupr binutils-2.20.orig/bfd/elf32-arm.c binutils-2.20/bfd/elf32-arm.c
---- binutils-2.20.orig/bfd/elf32-arm.c	2010-04-19 10:08:50.000000000 -0700
-+++ binutils-2.20/bfd/elf32-arm.c	2010-04-19 10:12:45.000000000 -0700
-@@ -12736,108 +12736,15 @@ elf32_arm_section_from_shdr (bfd *abfd,
-   return TRUE;
- }
-
--/* A structure used to record a list of sections, independently
--   of the next and prev fields in the asection structure.  */
--typedef struct section_list
--{
--  asection * sec;
--  struct section_list * next;
--  struct section_list * prev;
--}
--section_list;
--
--/* Unfortunately we need to keep a list of sections for which
--   an _arm_elf_section_data structure has been allocated.  This
--   is because it is possible for functions like elf32_arm_write_section
--   to be called on a section which has had an elf_data_structure
--   allocated for it (and so the used_by_bfd field is valid) but
--   for which the ARM extended version of this structure - the
--   _arm_elf_section_data structure - has not been allocated.  */
--static section_list * sections_with_arm_elf_section_data = NULL;
--
--static void
--record_section_with_arm_elf_section_data (asection * sec)
--{
--  struct section_list * entry;
--
--  entry = bfd_malloc (sizeof (* entry));
--  if (entry == NULL)
--    return;
--  entry->sec = sec;
--  entry->next = sections_with_arm_elf_section_data;
--  entry->prev = NULL;
--  if (entry->next != NULL)
--    entry->next->prev = entry;
--  sections_with_arm_elf_section_data = entry;
--}
--
--static struct section_list *
--find_arm_elf_section_entry (asection * sec)
--{
--  struct section_list * entry;
--  static struct section_list * last_entry = NULL;
--
--  /* This is a short cut for the typical case where the sections are added
--     to the sections_with_arm_elf_section_data list in forward order and
--     then looked up here in backwards order.  This makes a real difference
--     to the ld-srec/sec64k.exp linker test.  */
--  entry = sections_with_arm_elf_section_data;
--  if (last_entry != NULL)
--    {
--      if (last_entry->sec == sec)
--	entry = last_entry;
--      else if (last_entry->next != NULL
--	       && last_entry->next->sec == sec)
--	entry = last_entry->next;
--    }
--
--  for (; entry; entry = entry->next)
--    if (entry->sec == sec)
--      break;
--
--  if (entry)
--    /* Record the entry prior to this one - it is the entry we are most
--       likely to want to locate next time.  Also this way if we have been
--       called from unrecord_section_with_arm_elf_section_data() we will not
--       be caching a pointer that is about to be freed.  */
--    last_entry = entry->prev;
--
--  return entry;
--}
--
- static _arm_elf_section_data *
- get_arm_elf_section_data (asection * sec)
- {
--  struct section_list * entry;
--
--  entry = find_arm_elf_section_entry (sec);
--
--  if (entry)
--    return elf32_arm_section_data (entry->sec);
-+  if (sec && sec->owner && is_arm_elf (sec->owner))
-+    return elf32_arm_section_data (sec);
-   else
-     return NULL;
- }
-
--static void
--unrecord_section_with_arm_elf_section_data (asection * sec)
--{
--  struct section_list * entry;
--
--  entry = find_arm_elf_section_entry (sec);
--
--  if (entry)
--    {
--      if (entry->prev != NULL)
--	entry->prev->next = entry->next;
--      if (entry->next != NULL)
--	entry->next->prev = entry->prev;
--      if (entry == sections_with_arm_elf_section_data)
--	sections_with_arm_elf_section_data = entry->next;
--      free (entry);
--    }
--}
--
--
- typedef struct
- {
-   void *finfo;
-@@ -13230,8 +13137,6 @@ elf32_arm_new_section_hook (bfd *abfd, a
-       sec->used_by_bfd = sdata;
-     }
-
--  record_section_with_arm_elf_section_data (sec);
--
-   return _bfd_elf_new_section_hook (abfd, sec);
- }
-
-@@ -13659,44 +13564,13 @@ elf32_arm_write_section (bfd *output_bfd
-     }
-
-   free (map);
--  arm_data->mapcount = 0;
-+  arm_data->mapcount = -1;
-   arm_data->mapsize = 0;
-   arm_data->map = NULL;
--  unrecord_section_with_arm_elf_section_data (sec);
-
-   return FALSE;
- }
-
--static void
--unrecord_section_via_map_over_sections (bfd * abfd ATTRIBUTE_UNUSED,
--					asection * sec,
--					void * ignore ATTRIBUTE_UNUSED)
--{
--  unrecord_section_with_arm_elf_section_data (sec);
--}
--
--static bfd_boolean
--elf32_arm_close_and_cleanup (bfd * abfd)
--{
--  if (abfd->sections)
--    bfd_map_over_sections (abfd,
--			   unrecord_section_via_map_over_sections,
--			   NULL);
--
--  return _bfd_elf_close_and_cleanup (abfd);
--}
--
--static bfd_boolean
--elf32_arm_bfd_free_cached_info (bfd * abfd)
--{
--  if (abfd->sections)
--    bfd_map_over_sections (abfd,
--			   unrecord_section_via_map_over_sections,
--			   NULL);
--
--  return _bfd_free_cached_info (abfd);
--}
--
- /* Display STT_ARM_TFUNC symbols as functions.  */
-
- static void
-@@ -13882,8 +13756,6 @@ const struct elf_size_info elf32_arm_siz
- #define bfd_elf32_find_inliner_info	        elf32_arm_find_inliner_info
- #define bfd_elf32_new_section_hook		elf32_arm_new_section_hook
- #define bfd_elf32_bfd_is_target_special_symbol	elf32_arm_is_target_special_symbol
--#define bfd_elf32_close_and_cleanup             elf32_arm_close_and_cleanup
--#define bfd_elf32_bfd_free_cached_info          elf32_arm_bfd_free_cached_info
- #define bfd_elf32_bfd_final_link		elf32_arm_final_link
-
- #define elf_backend_get_symbol_type             elf32_arm_get_symbol_type
diff --git a/package/binutils/binutils-2.21/110-arm-eabi-conf.patch b/package/binutils/binutils-2.21/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/package/binutils/binutils-2.21/110-arm-eabi-conf.patch
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
diff --git a/package/binutils/binutils-2.21/120-sh-conf.patch b/package/binutils/binutils-2.21/120-sh-conf.patch
deleted file mode 100644
index 071d15a..0000000
--- a/package/binutils/binutils-2.21/120-sh-conf.patch
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
diff --git a/package/binutils/binutils-2.21/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.21/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/package/binutils/binutils-2.21/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/binutils-2.21/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.21/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index df78310..0000000
--- a/package/binutils/binutils-2.21/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -Nura binutils-2.21.orig/ld/emultempl/elf32.em binutils-2.21/ld/emultempl/elf32.em
---- binutils-2.21.orig/ld/emultempl/elf32.em	2010-10-29 09:10:36.000000000 -0300
-+++ binutils-2.21/ld/emultempl/elf32.em	2010-12-10 09:26:56.746102724 -0300
-@@ -1270,6 +1270,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+	      	lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1497,6 +1499,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+  	rpath = NULL;
- 
-   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link_next)
-     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
-- 
1.7.2.5
