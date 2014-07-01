From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jul 2014 20:03:02 +0200
Subject: [Buildroot] [PATCH 03/10] binutils: remove 2.20.1, 2.21 and 2.23.1
In-Reply-To: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1404237789-15563-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - The 2.20.x series is old, it no longer makes sense to support it.

 - In the 2.21.x series, we still have 2.21.1, so keeping 2.21 doesn't
   make much sense, so this patch removes it.

 - Similarly for the 2.23.x series, having both 2.23.1 and 2.23.2
   doesn't make much sense, so this patch removes 2.23.1 and keeps
   2.23.2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  21 +
 package/binutils/2.20.1/110-arm-eabi-conf.patch    |  24 -
 package/binutils/2.20.1/120-sh-conf.patch          |  42 -
 .../2.20.1/300-001_ld_makefile_patch.patch         |  24 -
 .../2.20.1/300-012_check_ldrunpath_length.patch    |  21 -
 package/binutils/2.20.1/400-arm_link_speed.patch   | 183 -----
 package/binutils/2.20.1/500-sysroot.patch          |  36 -
 package/binutils/2.21/110-arm-eabi-conf.patch      |  24 -
 package/binutils/2.21/120-sh-conf.patch            |  42 -
 .../binutils/2.21/300-001_ld_makefile_patch.patch  |  24 -
 .../2.21/300-012_check_ldrunpath_length.patch      |  21 -
 package/binutils/2.21/500-sysroot.patch            |  36 -
 package/binutils/2.23.1/120-sh-conf.patch          |  29 -
 .../2.23.1/300-001_ld_makefile_patch.patch         |  24 -
 .../2.23.1/300-012_check_ldrunpath_length.patch    |  21 -
 package/binutils/2.23.1/500-sysroot.patch          |  37 -
 .../binutils/2.23.1/900-xtensa-trampolines.patch   | 846 ---------------------
 .../901-xtensa-gas-first-frag-alignment.patch      |  51 --
 .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 ----
 package/binutils/Config.in.host                    |  14 -
 20 files changed, 21 insertions(+), 1632 deletions(-)
 delete mode 100644 package/binutils/2.20.1/110-arm-eabi-conf.patch
 delete mode 100644 package/binutils/2.20.1/120-sh-conf.patch
 delete mode 100644 package/binutils/2.20.1/300-001_ld_makefile_patch.patch
 delete mode 100644 package/binutils/2.20.1/300-012_check_ldrunpath_length.patch
 delete mode 100644 package/binutils/2.20.1/400-arm_link_speed.patch
 delete mode 100644 package/binutils/2.20.1/500-sysroot.patch
 delete mode 100644 package/binutils/2.21/110-arm-eabi-conf.patch
 delete mode 100644 package/binutils/2.21/120-sh-conf.patch
 delete mode 100644 package/binutils/2.21/300-001_ld_makefile_patch.patch
 delete mode 100644 package/binutils/2.21/300-012_check_ldrunpath_length.patch
 delete mode 100644 package/binutils/2.21/500-sysroot.patch
 delete mode 100644 package/binutils/2.23.1/120-sh-conf.patch
 delete mode 100644 package/binutils/2.23.1/300-001_ld_makefile_patch.patch
 delete mode 100644 package/binutils/2.23.1/300-012_check_ldrunpath_length.patch
 delete mode 100644 package/binutils/2.23.1/500-sysroot.patch
 delete mode 100644 package/binutils/2.23.1/900-xtensa-trampolines.patch
 delete mode 100644 package/binutils/2.23.1/901-xtensa-gas-first-frag-alignment.patch
 delete mode 100644 package/binutils/2.23.1/902-xtensa-gas-ld-diff-relocation-signed.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index a2c7846..024e4c5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -128,6 +128,27 @@ config BR2_PACKAGE_PROCPS
 	help
 	  The procps package has been replaced by the equivalent procps-ng.
 
+config BR2_BINUTILS_VERSION_2_20_1
+	bool "binutils 2.20.1 has been removed"
+	select BR2_LEGACY
+	help
+	  The 2.20.1 version of binutils has been removed. Use a newer
+	  version instead.
+
+config BR2_BINUTILS_VERSION_2_21
+	bool "binutils 2.21 has been removed"
+	select BR2_LEGACY
+	help
+	  The 2.21 version of binutils has been removed. Use a newer
+	  version instead.
+
+config BR2_BINUTILS_VERSION_2_23_1
+	bool "binutils 2.23.1 has been removed"
+	select BR2_LEGACY
+	help
+	  The 2.23.1 version of binutils has been removed. Use a newer
+	  version instead.
+
 ###############################################################################
 comment "Legacy options removed in 2014.05"
 
diff --git a/package/binutils/2.20.1/110-arm-eabi-conf.patch b/package/binutils/2.20.1/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/package/binutils/2.20.1/110-arm-eabi-conf.patch
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
diff --git a/package/binutils/2.20.1/120-sh-conf.patch b/package/binutils/2.20.1/120-sh-conf.patch
deleted file mode 100644
index 071d15a..0000000
--- a/package/binutils/2.20.1/120-sh-conf.patch
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
diff --git a/package/binutils/2.20.1/300-001_ld_makefile_patch.patch b/package/binutils/2.20.1/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/package/binutils/2.20.1/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/2.20.1/300-012_check_ldrunpath_length.patch b/package/binutils/2.20.1/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/package/binutils/2.20.1/300-012_check_ldrunpath_length.patch
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
diff --git a/package/binutils/2.20.1/400-arm_link_speed.patch b/package/binutils/2.20.1/400-arm_link_speed.patch
deleted file mode 100644
index d03385a..0000000
--- a/package/binutils/2.20.1/400-arm_link_speed.patch
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
diff --git a/package/binutils/2.20.1/500-sysroot.patch b/package/binutils/2.20.1/500-sysroot.patch
deleted file mode 100644
index d21e4cb..0000000
--- a/package/binutils/2.20.1/500-sysroot.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
-
-Always try to prepend the sysroot prefix to absolute filenames first.
-
-http://bugs.gentoo.org/275666
-http://sourceware.org/bugzilla/show_bug.cgi?id=10340
-
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -308,18 +308,24 @@
-      directory first.  */
-   if (! entry->is_archive)
-     {
--      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
-+      /* For absolute pathnames, try to always open the file in the
-+	 sysroot first. If this fails, try to open the file at the
-+	 given location. */
-+      entry->sysrooted = is_sysrooted_pathname(entry->filename, FALSE);
-+      if (IS_ABSOLUTE_PATH (entry->filename) && ld_sysroot && ! entry->sysrooted)
- 	{
- 	  char *name = concat (ld_sysroot, entry->filename,
- 			       (const char *) NULL);
- 	  if (ldfile_try_open_bfd (name, entry))
- 	    {
- 	      entry->filename = name;
-+	      entry->sysrooted = TRUE;
- 	      return TRUE;
- 	    }
- 	  free (name);
- 	}
--      else if (ldfile_try_open_bfd (entry->filename, entry))
-+
-+      if (ldfile_try_open_bfd (entry->filename, entry))
- 	{
- 	  entry->sysrooted = IS_ABSOLUTE_PATH (entry->filename)
- 	    && is_sysrooted_pathname (entry->filename, TRUE);
diff --git a/package/binutils/2.21/110-arm-eabi-conf.patch b/package/binutils/2.21/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/package/binutils/2.21/110-arm-eabi-conf.patch
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
diff --git a/package/binutils/2.21/120-sh-conf.patch b/package/binutils/2.21/120-sh-conf.patch
deleted file mode 100644
index 071d15a..0000000
--- a/package/binutils/2.21/120-sh-conf.patch
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
diff --git a/package/binutils/2.21/300-001_ld_makefile_patch.patch b/package/binutils/2.21/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/package/binutils/2.21/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/2.21/300-012_check_ldrunpath_length.patch b/package/binutils/2.21/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index df78310..0000000
--- a/package/binutils/2.21/300-012_check_ldrunpath_length.patch
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
diff --git a/package/binutils/2.21/500-sysroot.patch b/package/binutils/2.21/500-sysroot.patch
deleted file mode 100644
index d21e4cb..0000000
--- a/package/binutils/2.21/500-sysroot.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
-
-Always try to prepend the sysroot prefix to absolute filenames first.
-
-http://bugs.gentoo.org/275666
-http://sourceware.org/bugzilla/show_bug.cgi?id=10340
-
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -308,18 +308,24 @@
-      directory first.  */
-   if (! entry->is_archive)
-     {
--      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
-+      /* For absolute pathnames, try to always open the file in the
-+	 sysroot first. If this fails, try to open the file at the
-+	 given location. */
-+      entry->sysrooted = is_sysrooted_pathname(entry->filename, FALSE);
-+      if (IS_ABSOLUTE_PATH (entry->filename) && ld_sysroot && ! entry->sysrooted)
- 	{
- 	  char *name = concat (ld_sysroot, entry->filename,
- 			       (const char *) NULL);
- 	  if (ldfile_try_open_bfd (name, entry))
- 	    {
- 	      entry->filename = name;
-+	      entry->sysrooted = TRUE;
- 	      return TRUE;
- 	    }
- 	  free (name);
- 	}
--      else if (ldfile_try_open_bfd (entry->filename, entry))
-+
-+      if (ldfile_try_open_bfd (entry->filename, entry))
- 	{
- 	  entry->sysrooted = IS_ABSOLUTE_PATH (entry->filename)
- 	    && is_sysrooted_pathname (entry->filename, TRUE);
diff --git a/package/binutils/2.23.1/120-sh-conf.patch b/package/binutils/2.23.1/120-sh-conf.patch
deleted file mode 100644
index ea3d1b6..0000000
--- a/package/binutils/2.23.1/120-sh-conf.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-r10231 | lethal | 2005-05-02 09:58:00 -0400 (Mon, 02 May 2005) | 13 lines
-
-Likewise, binutils has no idea about any of these new targets either, so we 
-fix that up too.. now we're able to actually build a real toolchain for 
-sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more 
-inept targets than that one, really. Go look, I promise).
-
---- a/configure
-+++ b/configure
-@@ -1495,7 +1495,7 @@
-   mips*-*-*)
-     noconfigdirs="$noconfigdirs gprof"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
---- a/configure.ac
-+++ b/configure.ac
-@@ -712,7 +712,7 @@
-   mips*-*-*)
-     noconfigdirs="$noconfigdirs gprof"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
diff --git a/package/binutils/2.23.1/300-001_ld_makefile_patch.patch b/package/binutils/2.23.1/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/package/binutils/2.23.1/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/2.23.1/300-012_check_ldrunpath_length.patch b/package/binutils/2.23.1/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index df78310..0000000
--- a/package/binutils/2.23.1/300-012_check_ldrunpath_length.patch
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
diff --git a/package/binutils/2.23.1/500-sysroot.patch b/package/binutils/2.23.1/500-sysroot.patch
deleted file mode 100644
index e49c795..0000000
--- a/package/binutils/2.23.1/500-sysroot.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
-
-Always try to prepend the sysroot prefix to absolute filenames first.
-
-http://bugs.gentoo.org/275666
-http://sourceware.org/bugzilla/show_bug.cgi?id=10340
-
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -308,18 +308,25 @@
-      directory first.  */
-   if (! entry->flags.maybe_archive)
-     {
--      if (entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename))
-+      /* For absolute pathnames, try to always open the file in the
-+	 sysroot first. If this fails, try to open the file at the
-+	 given location.  */
-+      entry->flags.sysrooted = is_sysrooted_pathname (entry->filename);
-+      if (!entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename)
-+	  && ld_sysroot)
- 	{
- 	  char *name = concat (ld_sysroot, entry->filename,
- 			       (const char *) NULL);
- 	  if (ldfile_try_open_bfd (name, entry))
- 	    {
- 	      entry->filename = name;
-+	      entry->flags.sysrooted = TRUE;
- 	      return TRUE;
- 	    }
- 	  free (name);
- 	}
--      else if (ldfile_try_open_bfd (entry->filename, entry))
-+
-+      if (ldfile_try_open_bfd (entry->filename, entry))
- 	return TRUE;
- 
-       if (IS_ABSOLUTE_PATH (entry->filename))
diff --git a/package/binutils/2.23.1/900-xtensa-trampolines.patch b/package/binutils/2.23.1/900-xtensa-trampolines.patch
deleted file mode 100644
index b5b934f..0000000
--- a/package/binutils/2.23.1/900-xtensa-trampolines.patch
+++ /dev/null
@@ -1,846 +0,0 @@
-From a82c7d9030b67a6a76a5403d0e1641f9e42141ac Mon Sep 17 00:00:00 2001
-From: David Weatherford <weath@cadence.com>
-Date: Fri, 21 Mar 2014 11:53:42 +0000
-Subject: [PATCH] Add support to the Xtensa target for creating trampolines for
- out-of-range branches.
-
-    * tc-xtensa.c (xtensa_check_frag_count, xtensa_create_trampoline_frag)
-    (xtensa_maybe_create_trampoline_frag, init_trampoline_frag)
-    (find_trampoline_seg, search_trampolines, get_best_trampoline)
-    (check_and_update_trampolines, add_jump_to_trampoline)
-    (dump_trampolines): New function.
-    (md_parse_option): Add cases for --[no-]trampolines options.
-    (md_assemble, finish_vinsn, xtensa_end): Add call to
-    xtensa_check_frag_count.
-    (xg_assemble_vliw_tokens): Add call to
-    xtensa_maybe_create_trampoline_frag.
-    (xtensa_relax_frag): Relax fragments with RELAX_TRAMPOLINE state.
-    (relax_frag_immed): Relax jump instructions that cannot reach its
-    target.
-    * tc-xtensa.h (xtensa_relax_statesE::RELAX_TRAMPOLINE): New relax
-    state.
-
-    * as.texinfo: Document --[no-]trampolines command-line options.
-    * c-xtensa.texi: Document trampolines relaxation and command line
-    options.
-
-    * frags.c (get_frag_count, clear_frag_count): New function.
-    (frag_alloc): Increment totalfrags counter.
-    * frags.h (get_frag_count, clear_frag_count): New function.
-
-    * all.exp: Add test for trampoline relaxation.
-    * trampoline.d: Trampoline relaxation expected dump.
-    * trampoline.s: Trampoline relaxation test source.
----
-Backported from: a82c7d9030b67a6a76a5403d0e1641f9e42141ac
-Changes to Changelog files are dropped.
-
- gas/config/tc-xtensa.c                | 558 +++++++++++++++++++++++++++++++++-
- gas/config/tc-xtensa.h                |   5 +
- gas/frags.c                           |  15 +
- gas/frags.h                           |   3 +
- gas/testsuite/gas/xtensa/all.exp      |   1 +
- gas/testsuite/gas/xtensa/trampoline.d |  26 ++
- gas/testsuite/gas/xtensa/trampoline.s |  21 ++
- 11 files changed, 753 insertions(+), 2 deletions(-)
- create mode 100644 gas/testsuite/gas/xtensa/trampoline.d
- create mode 100644 gas/testsuite/gas/xtensa/trampoline.s
-
-diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
-index fe8ec0f..ea23c96 100644
---- a/gas/config/tc-xtensa.c
-+++ b/gas/config/tc-xtensa.c
-@@ -468,6 +468,12 @@ static void xtensa_set_frag_assembly_state (fragS *);
- static void finish_vinsn (vliw_insn *);
- static bfd_boolean emit_single_op (TInsn *);
- static int total_frag_text_expansion (fragS *);
-+static bfd_boolean use_trampolines = TRUE;
-+static void xtensa_check_frag_count (void);
-+static void xtensa_create_trampoline_frag (bfd_boolean);
-+static void xtensa_maybe_create_trampoline_frag (void);
-+struct trampoline_frag;
-+static int init_trampoline_frag (struct trampoline_frag *);
- 
- /* Alignment Functions.  */
- 
-@@ -520,6 +526,7 @@ static void tinsn_from_chars (TInsn *, char *, int);
- static void tinsn_immed_from_frag (TInsn *, fragS *, int);
- static int get_num_stack_text_bytes (IStack *);
- static int get_num_stack_literal_bytes (IStack *);
-+static bfd_boolean tinsn_to_slotbuf (xtensa_format, int, TInsn *, xtensa_insnbuf);
- 
- /* vliw_insn functions.  */
- 
-@@ -687,7 +694,10 @@ enum
-   option_prefer_l32r,
-   option_prefer_const16,
- 
--  option_target_hardware
-+  option_target_hardware,
-+
-+  option_trampolines,
-+  option_no_trampolines,
- };
- 
- const char *md_shortopts = "";
-@@ -760,6 +770,9 @@ struct option md_longopts[] =
- 
-   { "target-hardware", required_argument, NULL, option_target_hardware },
- 
-+  { "trampolines", no_argument, NULL, option_trampolines },
-+  { "no-trampolines", no_argument, NULL, option_no_trampolines },
-+
-   { NULL, no_argument, NULL, 0 }
- };
- 
-@@ -940,6 +953,14 @@ md_parse_option (int c, char *arg)
-       directive_state[directive_transform] = FALSE;
-       return 1;
- 
-+    case option_trampolines:
-+      use_trampolines = TRUE;
-+      return 1;
-+
-+    case option_no_trampolines:
-+      use_trampolines = FALSE;
-+      return 1;
-+
-     default:
-       return 0;
-     }
-@@ -963,7 +984,9 @@ Xtensa options:\n\
-                           flix bundles\n\
-   --no-allow-flix         neither allow hand-written nor generate\n\
-                           flix bundles\n\
--  --rename-section old=new Rename section 'old' to 'new'\n", stream);
-+  --rename-section old=new Rename section 'old' to 'new'\n\
-+  --[no-]trampolines      [Do not] generate trampolines (jumps to jumps)\n\
-+                          when jumps do not reach their targets\n", stream);
- }
- 
- 
-@@ -5568,6 +5591,8 @@ md_assemble (char *str)
- 
-   /* We've just emitted a new instruction so clear the list of labels.  */
-   xtensa_clear_insn_labels ();
-+
-+  xtensa_check_frag_count ();
- }
- 
- 
-@@ -6372,6 +6397,8 @@ finish_vinsn (vliw_insn *vinsn)
-   xg_assemble_vliw_tokens (vinsn);
- 
-   xg_clear_vinsn (vinsn);
-+
-+  xtensa_check_frag_count ();
- }
- 
- 
-@@ -7140,6 +7167,7 @@ xg_assemble_vliw_tokens (vliw_insn *vinsn)
- 		    RELAX_UNREACHABLE,
- 		    frag_now->fr_symbol, frag_now->fr_offset, NULL);
- 	  xtensa_set_frag_assembly_state (frag_now);
-+	  xtensa_maybe_create_trampoline_frag ();
- 	}
-       else if (is_branch && do_align_targets ())
- 	{
-@@ -7222,9 +7250,164 @@ xtensa_end (void)
-   xtensa_sanity_check ();
- 
-   xtensa_add_config_info ();
-+
-+  xtensa_check_frag_count ();
-+}
-+
-+
-+struct trampoline_frag
-+{
-+  struct trampoline_frag *next;
-+  bfd_boolean needs_jump_around;
-+  fragS *fragP;
-+  fixS *fixP;
-+};
-+
-+struct trampoline_seg
-+{
-+  struct trampoline_seg *next;
-+  asection *seg;
-+  struct trampoline_frag trampoline_list;
-+};
-+
-+static struct trampoline_seg trampoline_seg_list;
-+#define J_RANGE (128 * 1024)
-+
-+static int unreachable_count = 0;
-+
-+
-+static void
-+xtensa_maybe_create_trampoline_frag (void)
-+{
-+  if (!use_trampolines)
-+    return;
-+
-+  /* We create an area for possible trampolines every 10 unreachable frags.
-+     These are preferred over the ones not preceded by an unreachable frag,
-+     because we don't have to jump around them. This function is called after
-+     each RELAX_UNREACHABLE frag is created.  */
-+
-+  if (++unreachable_count > 10)
-+    {
-+      xtensa_create_trampoline_frag (FALSE);
-+      clear_frag_count ();
-+      unreachable_count = 0;
-+    }
-+}
-+
-+static void
-+xtensa_check_frag_count (void)
-+{
-+  if (!use_trampolines || frag_now->tc_frag_data.is_no_transform)
-+    return;
-+
-+  /* We create an area for possible trampolines every 8000 frags or so. This
-+     is an estimate based on the max range of a "j" insn (+/-128K) divided
-+     by a typical frag byte count (16), minus a few for safety. This function
-+     is called after each source line is processed.  */
-+
-+  if (get_frag_count () > 8000)
-+    {
-+      xtensa_create_trampoline_frag (TRUE);
-+      clear_frag_count ();
-+      unreachable_count = 0;
-+    }
-+}
-+
-+static xtensa_insnbuf trampoline_buf = NULL;
-+static xtensa_insnbuf trampoline_slotbuf = NULL;
-+
-+#define TRAMPOLINE_FRAG_SIZE 3000
-+
-+static void
-+xtensa_create_trampoline_frag (bfd_boolean needs_jump_around)
-+{
-+  /* Emit a frag where we can place intermediate jump instructions,
-+     in case we need to jump farther than 128K bytes.
-+     Each jump instruction takes three bytes.
-+     We allocate enough for 1000 trampolines in each frag.
-+     If that's not enough, oh well.  */
-+
-+  struct trampoline_seg *ts = trampoline_seg_list.next;
-+  struct trampoline_frag *tf;
-+  char *varP;
-+  fragS *fragP;
-+  int size = TRAMPOLINE_FRAG_SIZE;
-+
-+  for ( ; ts; ts = ts->next)
-+    {
-+      if (ts->seg == now_seg)
-+	break;
-+    }
-+
-+  if (ts == NULL)
-+    {
-+      ts = (struct trampoline_seg *)xcalloc(sizeof (struct trampoline_seg), 1);
-+      ts->next = trampoline_seg_list.next;
-+      trampoline_seg_list.next = ts;
-+      ts->seg = now_seg;
-+    }
-+
-+  frag_wane (frag_now);
-+  frag_new (0);
-+  xtensa_set_frag_assembly_state (frag_now);
-+  varP = frag_var (rs_machine_dependent, size, size, RELAX_TRAMPOLINE, NULL, 0, NULL);
-+  fragP = (fragS *)(varP - SIZEOF_STRUCT_FRAG);
-+  if (trampoline_buf == NULL)
-+    {
-+      trampoline_buf = xtensa_insnbuf_alloc (xtensa_default_isa);
-+      trampoline_slotbuf = xtensa_insnbuf_alloc (xtensa_default_isa);
-+    }
-+  tf = (struct trampoline_frag *)xmalloc(sizeof (struct trampoline_frag));
-+  tf->next = ts->trampoline_list.next;
-+  ts->trampoline_list.next = tf;
-+  tf->needs_jump_around = needs_jump_around;
-+  tf->fragP = fragP;
-+  tf->fixP = NULL;
-+}
-+
-+
-+static struct trampoline_seg *
-+find_trampoline_seg (asection *seg)
-+{
-+  struct trampoline_seg *ts = trampoline_seg_list.next;
-+
-+  for ( ; ts; ts = ts->next)
-+    {
-+      if (ts->seg == seg)
-+	return ts;
-+    }
-+
-+  return NULL;
- }
- 
- 
-+void dump_trampolines (void);
-+
-+void
-+dump_trampolines (void)
-+{
-+  struct trampoline_seg *ts = trampoline_seg_list.next;
-+
-+  for ( ; ts; ts = ts->next)
-+    {
-+      asection *seg = ts->seg;
-+
-+      if (seg == NULL)
-+	continue;
-+      fprintf(stderr, "SECTION %s\n", seg->name);
-+      struct trampoline_frag *tf = ts->trampoline_list.next;
-+      for ( ; tf; tf = tf->next)
-+	{
-+	  if (tf->fragP == NULL)
-+	    continue;
-+	  fprintf(stderr, "   0x%08x: fix=%d, jump_around=%s\n",
-+		  (int)tf->fragP->fr_address, (int)tf->fragP->fr_fix,
-+		  tf->needs_jump_around ? "T" : "F");
-+	}
-+    }
-+}
-+
- static void
- xtensa_cleanup_align_frags (void)
- {
-@@ -8708,6 +8891,149 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
- 	new_stretch += relax_frag_for_align (fragP, stretch);
-       break;
- 
-+    case RELAX_TRAMPOLINE:
-+      if (fragP->tc_frag_data.relax_seen)
-+        {
-+          segment_info_type *seginfo = seg_info (now_seg);
-+          fragS *fP; /* The out-of-range jump.  */
-+          fixS *fixP;
-+
-+          /* Scan for jumps that will not reach.  */
-+          for (fixP = seginfo->fix_root; fixP ; fixP = fixP->fx_next)
-+            {
-+              symbolS *s = fixP->fx_addsy;
-+	      xtensa_opcode opcode;
-+              int target;
-+              int addr;
-+              int delta;
-+
-+              if (fixP->fx_r_type < BFD_RELOC_XTENSA_SLOT0_OP ||
-+                  fixP->fx_r_type > BFD_RELOC_XTENSA_SLOT14_OP)
-+                continue;
-+	      xtensa_insnbuf_from_chars (isa, trampoline_buf,
-+					 (unsigned char *) fixP->fx_frag->fr_literal + fixP->fx_where,
-+					 0);
-+	      fmt = xtensa_format_decode (isa, trampoline_buf);
-+	      gas_assert (fmt != XTENSA_UNDEFINED);
-+	      slot = fixP->tc_fix_data.slot;
-+	      xtensa_format_get_slot (isa, fmt, slot, trampoline_buf, trampoline_slotbuf);
-+	      opcode = xtensa_opcode_decode (isa, fmt, slot, trampoline_slotbuf);
-+	      if (opcode != xtensa_j_opcode)
-+		continue;
-+              target = S_GET_VALUE (s);
-+              addr = fixP->fx_frag->fr_address;
-+              delta = target - addr + stretch;
-+              if (delta > J_RANGE  || delta < -1 * J_RANGE)
-+                { /* Found an out-of-range jump; scan the list of trampolines for the best match.  */
-+		  struct trampoline_seg *ts = find_trampoline_seg (now_seg);
-+		  struct trampoline_frag *tf = ts->trampoline_list.next;
-+		  struct trampoline_frag *prev = &ts->trampoline_list;
-+		  int lower = (target < addr) ? target : addr;
-+		  int upper = (target > addr) ? target : addr;
-+		  int midpoint = lower + (upper - lower) / 2;
-+
-+		  if ((upper - lower) > 2 * J_RANGE)
-+		    {
-+		      /* One trampoline won't suffice; we need multiple jumps.
-+			 Jump to the trampoline that's farthest, but still in
-+			 range relative to the original "j" instruction.  */
-+		      for ( ; tf; prev = tf, tf = tf->next )
-+			{
-+			  int this_addr = tf->fragP->fr_address + tf->fragP->fr_fix;
-+			  int next_addr = (tf->next) ? tf->next->fragP->fr_address + tf->next->fragP->fr_fix : 0 ;
-+
-+			  if (addr == lower)
-+			    {
-+			      /* Forward jump.  */
-+			      if (this_addr - addr < J_RANGE)
-+				break;
-+			    }
-+			  else
-+			    {
-+			      /* Backward jump.  */
-+			      if (next_addr == 0 || addr - next_addr > J_RANGE)
-+				break;
-+			    }
-+			}
-+		    }
-+		  else
-+		    {
-+		      struct trampoline_frag *best_tf = NULL;
-+		      int best_delta = 0;
-+
-+		      for ( ; tf; prev = tf, tf = tf->next )
-+			{
-+			  int this_addr = tf->fragP->fr_address + tf->fragP->fr_fix;
-+			  int this_delta = abs (this_addr - midpoint);
-+
-+			  if (!best_tf || this_delta < best_delta)
-+			    {
-+			       best_tf = tf;
-+			       best_delta = this_delta;
-+			    }
-+			}
-+		      tf = best_tf;
-+		    }
-+		  if (tf->fragP == fragP)
-+		    {
-+		      int trampaddr = fragP->fr_address + fragP->fr_fix;
-+
-+		      if (abs (addr - trampaddr) < J_RANGE)
-+			{ /* The trampoline is in range of original; fix it!  */
-+			  fixS *newfixP;
-+			  int offset;
-+			  TInsn insn;
-+			  symbolS *lsym;
-+
-+			  new_stretch += init_trampoline_frag (tf);
-+			  offset = fragP->fr_fix; /* Where to assemble the j insn.  */
-+			  lsym = fragP->fr_symbol;
-+			  fP = fixP->fx_frag;
-+			  /* Assemble a jump to the target label here.  */
-+			  tinsn_init (&insn);
-+			  insn.insn_type = ITYPE_INSN;
-+			  insn.opcode = xtensa_j_opcode;
-+			  insn.ntok = 1;
-+			  set_expr_symbol_offset (&insn.tok[0], lsym, offset);
-+			  fmt = xg_get_single_format (xtensa_j_opcode);
-+			  tinsn_to_slotbuf (fmt, 0, &insn, trampoline_slotbuf);
-+			  xtensa_format_set_slot (isa, fmt, 0, trampoline_buf, trampoline_slotbuf);
-+			  xtensa_insnbuf_to_chars (isa, trampoline_buf, (unsigned char *)fragP->fr_literal + offset, 3);
-+			  fragP->fr_fix += 3;
-+			  fragP->fr_var -= 3;
-+			  /* Add a fix-up for the original j insn.  */
-+			  newfixP = fix_new (fP, fixP->fx_where, fixP->fx_size, lsym, fragP->fr_fix - 3, TRUE, fixP->fx_r_type);
-+			  newfixP->fx_no_overflow = 1;
-+			  newfixP->tc_fix_data.X_add_symbol = lsym;
-+			  newfixP->tc_fix_data.X_add_number = offset;
-+			  newfixP->tc_fix_data.slot = slot;
-+			  /* Move the fix-up from the original j insn to this one.  */
-+			  fixP->fx_frag = fragP;
-+			  fixP->fx_where = fragP->fr_fix - 3;
-+			  fixP->tc_fix_data.slot = 0;
-+			  /* Adjust the jump around this trampoline (if present).  */
-+			  if (tf->fixP != NULL)
-+			    {
-+			      tf->fixP->fx_offset += 3;
-+			    }
-+			  new_stretch += 3;
-+			  fragP->tc_frag_data.relax_seen = FALSE; /* Need another pass.  */
-+			  /* Do we have room for more?  */
-+			  if (fragP->fr_var < 3)
-+			    { /* No, convert to fill.  */
-+			      frag_wane (fragP);
-+			      fragP->fr_subtype = 0;
-+			      /* Remove from the trampoline_list.  */
-+			      prev->next = tf->next;
-+			      break;
-+			    }
-+			}
-+		    }
-+                }
-+            }
-+        }
-+      break;
-+
-     default:
-       as_bad (_("bad relaxation state"));
-     }
-@@ -9146,6 +9472,200 @@ bytes_to_stretch (fragS *this_frag,
- }
- 
- 
-+static struct trampoline_frag *
-+search_trampolines (TInsn *tinsn, fragS *fragP, bfd_boolean unreachable_only)
-+{
-+  struct trampoline_seg *ts = find_trampoline_seg (now_seg);
-+  struct trampoline_frag *tf = (ts) ? ts->trampoline_list.next : NULL;
-+  struct trampoline_frag *best_tf = NULL;
-+  int best_delta = 0;
-+  int best_addr = 0;
-+  symbolS *sym = tinsn->tok[0].X_add_symbol;
-+  offsetT target = S_GET_VALUE (sym) + tinsn->tok[0].X_add_number;
-+  offsetT addr = fragP->fr_address;
-+  offsetT lower = (addr < target) ? addr : target;
-+  offsetT upper = (addr > target) ? addr : target;
-+  int delta = upper - lower;
-+  offsetT midpoint = lower + delta / 2;
-+  int this_delta = -1;
-+  int this_addr = -1;
-+
-+  if (delta > 2 * J_RANGE)
-+    {
-+      /* One trampoline won't do; we need multiple.
-+	 Choose the farthest trampoline that's still in range of the original
-+	 and let a later pass finish the job.  */
-+      for ( ; tf; tf = tf->next)
-+	{
-+	  int next_addr = (tf->next) ? tf->next->fragP->fr_address + tf->next->fragP->fr_fix : 0;
-+
-+	  this_addr = tf->fragP->fr_address + tf->fragP->fr_fix;
-+	  if (lower == addr)
-+	    {
-+	      /* Forward jump.  */
-+	      if (this_addr - addr < J_RANGE)
-+		break;
-+	    }
-+	  else
-+	    {
-+	      /* Backward jump.  */
-+	      if (next_addr == 0 || addr - next_addr > J_RANGE)
-+		break;
-+	    }
-+	  if (abs (addr - this_addr) < J_RANGE)
-+	    return tf;
-+
-+	  return NULL;
-+	}
-+    }
-+  for ( ; tf; tf = tf->next)
-+    {
-+      this_addr = tf->fragP->fr_address + tf->fragP->fr_fix;
-+      this_delta = abs (this_addr - midpoint);
-+      if (unreachable_only && tf->needs_jump_around)
-+	continue;
-+      if (!best_tf || this_delta < best_delta)
-+        {
-+	  best_tf = tf;
-+	  best_delta = this_delta;
-+	  best_addr = this_addr;
-+        }
-+    }
-+
-+  if (best_tf &&
-+      best_delta < J_RANGE &&
-+      abs(best_addr - lower) < J_RANGE &&
-+      abs(best_addr - upper) < J_RANGE)
-+    return best_tf;
-+
-+  return NULL; /* No suitable trampoline found.  */
-+}
-+
-+
-+static struct trampoline_frag *
-+get_best_trampoline (TInsn *tinsn, fragS *fragP)
-+{
-+  struct trampoline_frag *tf = NULL;
-+
-+  tf = search_trampolines (tinsn, fragP, TRUE); /* Try unreachable first.  */
-+
-+  if (tf == NULL)
-+    tf = search_trampolines (tinsn, fragP, FALSE); /* Try ones needing a jump-around, too.  */
-+
-+  return tf;
-+}
-+
-+
-+static void
-+check_and_update_trampolines (void)
-+{
-+  struct trampoline_seg *ts = find_trampoline_seg (now_seg);
-+  struct trampoline_frag *tf = ts->trampoline_list.next;
-+  struct trampoline_frag *prev = &ts->trampoline_list;
-+
-+  for ( ; tf; prev = tf, tf = tf->next)
-+    {
-+      if (tf->fragP->fr_var < 3)
-+	{
-+	  frag_wane (tf->fragP);
-+	  prev->next = tf->next;
-+	  tf->fragP = NULL;
-+	}
-+    }
-+}
-+
-+
-+static int
-+init_trampoline_frag (struct trampoline_frag *trampP)
-+{
-+  fragS *fp = trampP->fragP;
-+  int growth = 0;
-+
-+  if (fp->fr_fix == 0)
-+    {
-+      symbolS *lsym;
-+      char label[10 + 2 * sizeof(fp)];
-+      sprintf (label, ".L0_TR_%p", fp);
-+
-+      lsym = (symbolS *)local_symbol_make (label, now_seg, 0, fp);
-+      fp->fr_symbol = lsym;
-+      if (trampP->needs_jump_around)
-+        {
-+	  /* Add a jump around this block of jumps, in case
-+	     control flows into this block.  */
-+	  fixS *fixP;
-+	  TInsn insn;
-+	  xtensa_format fmt;
-+	  xtensa_isa isa = xtensa_default_isa;
-+
-+	  fp->tc_frag_data.is_insn = 1;
-+	  /* Assemble a jump insn.  */
-+	  tinsn_init (&insn);
-+	  insn.insn_type = ITYPE_INSN;
-+	  insn.opcode = xtensa_j_opcode;
-+	  insn.ntok = 1;
-+	  set_expr_symbol_offset (&insn.tok[0], lsym, 3);
-+	  fmt = xg_get_single_format (xtensa_j_opcode);
-+	  tinsn_to_slotbuf (fmt, 0, &insn, trampoline_slotbuf);
-+	  xtensa_format_set_slot (isa, fmt, 0, trampoline_buf, trampoline_slotbuf);
-+	  xtensa_insnbuf_to_chars (isa, trampoline_buf, (unsigned char *)fp->fr_literal, 3);
-+	  fp->fr_fix += 3;
-+	  fp->fr_var -= 3;
-+	  growth = 3;
-+	  fixP = fix_new (fp, 0, 3, lsym, 3, TRUE, BFD_RELOC_XTENSA_SLOT0_OP);
-+	  trampP->fixP = fixP;
-+        }
-+    }
-+  return growth;
-+}
-+
-+
-+static int
-+add_jump_to_trampoline (struct trampoline_frag *trampP, fragS *origfrag)
-+{
-+  fragS *tramp = trampP->fragP;
-+  fixS *fixP;
-+  int offset = tramp->fr_fix; /* Where to assemble the j insn.  */
-+  TInsn insn;
-+  symbolS *lsym;
-+  symbolS *tsym;
-+  int toffset;
-+  xtensa_format fmt;
-+  xtensa_isa isa = xtensa_default_isa;
-+  int growth = 0;
-+
-+  lsym = tramp->fr_symbol;
-+  /* Assemble a jump to the target label in the trampoline frag.  */
-+  tsym = origfrag->tc_frag_data.slot_symbols[0];
-+  toffset = origfrag-> tc_frag_data.slot_offsets[0];
-+  tinsn_init (&insn);
-+  insn.insn_type = ITYPE_INSN;
-+  insn.opcode = xtensa_j_opcode;
-+  insn.ntok = 1;
-+  set_expr_symbol_offset (&insn.tok[0], tsym, toffset);
-+  fmt = xg_get_single_format (xtensa_j_opcode);
-+  tinsn_to_slotbuf (fmt, 0, &insn, trampoline_slotbuf);
-+  xtensa_format_set_slot (isa, fmt, 0, trampoline_buf, trampoline_slotbuf);
-+  xtensa_insnbuf_to_chars (isa, trampoline_buf, (unsigned char *)tramp->fr_literal + offset, 3);
-+  tramp->fr_fix += 3;
-+  tramp->fr_var -= 3;
-+  growth = 3;
-+  /* add a fix-up for the trampoline jump.  */
-+  fixP = fix_new (tramp, tramp->fr_fix - 3, 3, tsym, toffset, TRUE, BFD_RELOC_XTENSA_SLOT0_OP);
-+  /* Modify the jump at the start of this trampoline to point past the newly-added jump.  */
-+  fixP = trampP->fixP;
-+  if (fixP)
-+    fixP->fx_offset += 3;
-+  /* Modify the original j to point here.  */
-+  origfrag->tc_frag_data.slot_symbols[0] = lsym;
-+  origfrag->tc_frag_data.slot_offsets[0] = tramp->fr_fix - 3;
-+  /* If trampoline is full, remove it from the list.  */
-+  check_and_update_trampolines ();
-+
-+  return growth;
-+}
-+
-+
- static long
- relax_frag_immed (segT segP,
- 		  fragS *fragP,
-@@ -9284,6 +9804,37 @@ relax_frag_immed (segT segP,
-   if (negatable_branch && istack.ninsn > 1)
-     update_next_frag_state (fragP);
- 
-+  /* If last insn is a jump, and it cannot reach its target, try to find a trampoline.  */
-+  if (istack.ninsn > 2 &&
-+      istack.insn[istack.ninsn - 1].insn_type == ITYPE_LABEL &&
-+      istack.insn[istack.ninsn - 2].insn_type == ITYPE_INSN &&
-+      istack.insn[istack.ninsn - 2].opcode == xtensa_j_opcode)
-+    {
-+      TInsn *jinsn = &istack.insn[istack.ninsn - 2];
-+
-+      if (!xg_symbolic_immeds_fit (jinsn, segP, fragP, fragP->fr_offset, total_text_diff))
-+	{
-+	  struct trampoline_frag *tf = get_best_trampoline (jinsn, fragP);
-+
-+	  if (tf)
-+	    {
-+	      this_text_diff += init_trampoline_frag (tf);
-+	      this_text_diff += add_jump_to_trampoline (tf, fragP);
-+	    }
-+	  else
-+	    {
-+	      /* If target symbol is undefined, assume it will reach once linked.  */
-+	      expressionS *exp = &istack.insn[istack.ninsn - 2].tok[0];
-+
-+	      if (exp->X_op == O_symbol && S_IS_DEFINED (exp->X_add_symbol))
-+		{
-+		  as_bad_where (fragP->fr_file, fragP->fr_line,
-+		    _("jump target out of range; no usable trampoline found"));
-+		}
-+	    }
-+	}
-+    }
-+
-   return this_text_diff;
- }
- 
-@@ -9404,6 +9955,9 @@ md_convert_frag (bfd *abfd ATTRIBUTE_UNUSED, segT sec, fragS *fragp)
-       else
- 	as_bad (_("invalid relaxation fragment result"));
-       break;
-+
-+    case RELAX_TRAMPOLINE:
-+      break;
-     }
- 
-   fragp->fr_var = 0;
-diff --git a/gas/config/tc-xtensa.h b/gas/config/tc-xtensa.h
-index 0bf1240..4672bc6 100644
---- a/gas/config/tc-xtensa.h
-+++ b/gas/config/tc-xtensa.h
-@@ -180,6 +180,11 @@ enum xtensa_relax_statesE
-      prevent the linker from changing the size of any frag between the
-      section start and the org frag.  */
- 
-+  RELAX_TRAMPOLINE,
-+  /* Every few thousand frags, we insert one of these, just in case we may
-+     need some space for a trampoline (jump to a jump) because the function
-+     has gotten too big. If not needed, it disappears. */
-+
-   RELAX_NONE
- };
- 
-diff --git a/gas/frags.c b/gas/frags.c
-index 5f68480..e14099d 100644
---- a/gas/frags.c
-+++ b/gas/frags.c
-@@ -24,6 +24,20 @@
- 
- extern fragS zero_address_frag;
- extern fragS predefined_address_frag;
-+
-+static int totalfrags;
-+
-+int
-+get_frag_count (void)
-+{
-+  return totalfrags;
-+}
-+
-+void
-+clear_frag_count (void)
-+{
-+  totalfrags = 0;
-+}
- 
- /* Initialization for frag routines.  */
- 
-@@ -70,6 +84,7 @@ frag_alloc (struct obstack *ob)
-   ptr = (fragS *) obstack_alloc (ob, SIZEOF_STRUCT_FRAG);
-   obstack_alignment_mask (ob) = oalign;
-   memset (ptr, 0, SIZEOF_STRUCT_FRAG);
-+  totalfrags++;
-   return ptr;
- }
- 
-diff --git a/gas/frags.h b/gas/frags.h
-index 319898f..2f9e1b5 100644
---- a/gas/frags.h
-+++ b/gas/frags.h
-@@ -155,4 +155,7 @@ char *frag_var (relax_stateT type,
- 
- bfd_boolean frag_offset_fixed_p (const fragS *, const fragS *, offsetT *);
- 
-+int get_frag_count (void);
-+void clear_frag_count (void);
-+
- #endif /* FRAGS_H */
-diff --git a/gas/testsuite/gas/xtensa/all.exp b/gas/testsuite/gas/xtensa/all.exp
-index 2b2c294..3683b78 100644
---- a/gas/testsuite/gas/xtensa/all.exp
-+++ b/gas/testsuite/gas/xtensa/all.exp
-@@ -98,6 +98,7 @@ if [istarget xtensa*-*-*] then {
-     run_dump_test "pcrel"
-     run_dump_test "weak-call"
-     run_dump_test "jlong"
-+    run_dump_test "trampoline"
- }
- 
- if [info exists errorInfo] then {
-diff --git a/gas/testsuite/gas/xtensa/trampoline.d b/gas/testsuite/gas/xtensa/trampoline.d
-new file mode 100644
-index 0000000..b4f65dc
---- /dev/null
-+++ b/gas/testsuite/gas/xtensa/trampoline.d
-@@ -0,0 +1,26 @@
-+#as:
-+#objdump: -d
-+#name: trampolines relaxation
-+
-+.*: +file format .*xtensa.*
-+#...
-+.*0:.*j.0x1194c
-+.*3:.*j.0x1194f
-+.*6:.*j.0x11952
-+.*9:.*j.0x1d4e4
-+#...
-+.*11949:.*j.0x11955
-+.*1194c:.*j.0x24a0e
-+.*1194f:.*j.0x24a0e
-+.*11952:.*j.0x24a11
-+#...
-+.*1d4e1:.*j.0x1d4e7
-+.*1d4e4:.*j.0x33462
-+#...
-+.*24a0e:.*j.0x24a0e
-+.*24a11:.*j.0x24a11
-+#...
-+.*3345f:.*ret
-+.*33462:.*j.0x49407
-+#...
-+.*49407:.*j.0x49407
-diff --git a/gas/testsuite/gas/xtensa/trampoline.s b/gas/testsuite/gas/xtensa/trampoline.s
-new file mode 100644
-index 0000000..259a3bb
---- /dev/null
-+++ b/gas/testsuite/gas/xtensa/trampoline.s
-@@ -0,0 +1,21 @@
-+	.text
-+	j	1f
-+	j	1f
-+	j	2f
-+	j	3f
-+	.rep	25000
-+99:
-+	and	a2, a2, a3
-+	bne	a2, a3, 99b
-+	.endr
-+1:
-+	j	1b
-+2:
-+	j	2b
-+
-+	.rep	25000
-+	and	a2, a2, a3
-+	_ret
-+	.endr
-+3:
-+	j	3b
--- 
-1.8.1.4
-
diff --git a/package/binutils/2.23.1/901-xtensa-gas-first-frag-alignment.patch b/package/binutils/2.23.1/901-xtensa-gas-first-frag-alignment.patch
deleted file mode 100644
index e1c2d85..0000000
--- a/package/binutils/2.23.1/901-xtensa-gas-first-frag-alignment.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Tue, 15 Apr 2014 19:12:46 +0400
-Subject: [PATCH] Fix alignment for the first section frag on xtensa
-
-Linking object files produced by partial linking with link-time
-relaxation enabled sometimes fails with the following error message:
-
-dangerous relocation: call8: misaligned call target: (.text.unlikely+0x63)
-
-This happens because no basic block with an XTENSA_PROP_ALIGN flag in the
-property table is generated for the first basic block, even if the
-.align directive is present.
-It was believed that the first frag alignment could be derived from the
-section alignment, but this was not implemented for the partial linking
-case: after partial linking first frag of a section may become not
-first, but no additional alignment frag is inserted before it.
-Basic block for such frag may be merged with previous basic block into
-extended basic block during relaxation pass losing its alignment
-restrictions.
-
-Fix this by always recording alignment for the first section frag.
-
-2014-04-22  Max Filippov  <jcmvbkbc@gmail.com>
-
-gas/
-    * config/tc-xtensa.c (xtensa_handle_align): record alignment for the
-    first section frag.
-
----
-Backported from: a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1
-Changes to Changelog files and tests are dropped.
-
- gas/config/tc-xtensa.c                      | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
-index ea23c96..58ace38 100644
---- a/gas/config/tc-xtensa.c
-+++ b/gas/config/tc-xtensa.c
-@@ -5609,7 +5609,6 @@ xtensa_handle_align (fragS *fragP)
-       && ! fragP->tc_frag_data.is_literal
-       && (fragP->fr_type == rs_align
- 	  || fragP->fr_type == rs_align_code)
--      && fragP->fr_address + fragP->fr_fix > 0
-       && fragP->fr_offset > 0
-       && now_seg != bss_section)
-     {
--- 
-1.8.1.4
-
diff --git a/package/binutils/2.23.1/902-xtensa-gas-ld-diff-relocation-signed.patch b/package/binutils/2.23.1/902-xtensa-gas-ld-diff-relocation-signed.patch
deleted file mode 100644
index ba24f4e..0000000
--- a/package/binutils/2.23.1/902-xtensa-gas-ld-diff-relocation-signed.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 6a17eba5358549d0d6d195bb22b34cdbc068def2 Mon Sep 17 00:00:00 2001
-From: Volodymyr Arbatov <arbatov@cadence.com>
-Date: Mon, 6 May 2013 09:43:21 -0800
-Subject: [PATCH] Use signed data type for R_XTENSA_DIFF* relocation offsets.
-
-R_XTENSA_DIFF relocation offsets are in fact signed. Treat them as such.
-Add testcase that examines ld behaviour on R_XTENSA_DIFF relocation
-changing sign during relaxation.
-
-2014-05-02  Volodymyr Arbatov  <arbatov@cadence.com>
-	    David Weatherford  <weath@cadence.com>
-	    Max Filippov  <jcmvbkbc@gmail.com>
-
-bfd/
-  * elf32-xtensa.c (relax_section): treat R_XTENSA_DIFF* relocations as
-  signed.
-
-gas/
-  * config/tc-xtensa.c (md_apply_fix): mark BFD_RELOC_XTENSA_DIFF*
-  fixups as signed.
----
-Backported from: 1058c7532d0b012ac329219264ddad59049fb6e6
-Changes to Changelog files and tests are dropped.
-
- bfd/elf32-xtensa.c                       | 32 ++++++++++++-----------
- gas/config/tc-xtensa.c                   |  3 +++
- 2 files changed, 20 insertions(+), 15 deletions(-)
-
-diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
-index edb04b4..8818d67 100644
---- a/bfd/elf32-xtensa.c
-+++ b/bfd/elf32-xtensa.c
-@@ -222,11 +222,11 @@ static reloc_howto_type elf_howto_table[] =
- 	 FALSE, 0, 0, FALSE),
- 
-   /* Relocations for supporting difference of symbols.  */
--  HOWTO (R_XTENSA_DIFF8, 0, 0, 8, FALSE, 0, complain_overflow_bitfield,
-+  HOWTO (R_XTENSA_DIFF8, 0, 0, 8, FALSE, 0, complain_overflow_signed,
- 	 bfd_elf_xtensa_reloc, "R_XTENSA_DIFF8", FALSE, 0, 0xff, FALSE),
--  HOWTO (R_XTENSA_DIFF16, 0, 1, 16, FALSE, 0, complain_overflow_bitfield,
-+  HOWTO (R_XTENSA_DIFF16, 0, 1, 16, FALSE, 0, complain_overflow_signed,
- 	 bfd_elf_xtensa_reloc, "R_XTENSA_DIFF16", FALSE, 0, 0xffff, FALSE),
--  HOWTO (R_XTENSA_DIFF32, 0, 2, 32, FALSE, 0, complain_overflow_bitfield,
-+  HOWTO (R_XTENSA_DIFF32, 0, 2, 32, FALSE, 0, complain_overflow_signed,
- 	 bfd_elf_xtensa_reloc, "R_XTENSA_DIFF32", FALSE, 0, 0xffffffff, FALSE),
- 
-   /* General immediate operand relocations.  */
-@@ -9013,7 +9013,8 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
- 		  || r_type == R_XTENSA_DIFF16
- 		  || r_type == R_XTENSA_DIFF32)
- 		{
--		  bfd_vma diff_value = 0, new_end_offset, diff_mask = 0;
-+		  bfd_signed_vma diff_value = 0;
-+		  bfd_vma new_end_offset, diff_mask = 0;
- 
- 		  if (bfd_get_section_limit (abfd, sec) < old_source_offset)
- 		    {
-@@ -9027,15 +9028,15 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
- 		    {
- 		    case R_XTENSA_DIFF8:
- 		      diff_value =
--			bfd_get_8 (abfd, &contents[old_source_offset]);
-+			bfd_get_signed_8 (abfd, &contents[old_source_offset]);
- 		      break;
- 		    case R_XTENSA_DIFF16:
- 		      diff_value =
--			bfd_get_16 (abfd, &contents[old_source_offset]);
-+			bfd_get_signed_16 (abfd, &contents[old_source_offset]);
- 		      break;
- 		    case R_XTENSA_DIFF32:
- 		      diff_value =
--			bfd_get_32 (abfd, &contents[old_source_offset]);
-+			bfd_get_signed_32 (abfd, &contents[old_source_offset]);
- 		      break;
- 		    }
- 
-@@ -9047,24 +9048,25 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
- 		  switch (r_type)
- 		    {
- 		    case R_XTENSA_DIFF8:
--		      diff_mask = 0xff;
--		      bfd_put_8 (abfd, diff_value,
-+		      diff_mask = 0x7f;
-+		      bfd_put_signed_8 (abfd, diff_value,
- 				 &contents[old_source_offset]);
- 		      break;
- 		    case R_XTENSA_DIFF16:
--		      diff_mask = 0xffff;
--		      bfd_put_16 (abfd, diff_value,
-+		      diff_mask = 0x7fff;
-+		      bfd_put_signed_16 (abfd, diff_value,
- 				  &contents[old_source_offset]);
- 		      break;
- 		    case R_XTENSA_DIFF32:
--		      diff_mask = 0xffffffff;
--		      bfd_put_32 (abfd, diff_value,
-+		      diff_mask = 0x7fffffff;
-+		      bfd_put_signed_32 (abfd, diff_value,
- 				  &contents[old_source_offset]);
- 		      break;
- 		    }
- 
--		  /* Check for overflow.  */
--		  if ((diff_value & ~diff_mask) != 0)
-+		  /* Check for overflow. Sign bits must be all zeroes or all ones */
-+		  if ((diff_value & ~diff_mask) != 0 &&
-+		      (diff_value & ~diff_mask) != (-1 & ~diff_mask))
- 		    {
- 		      (*link_info->callbacks->reloc_dangerous)
- 			(link_info, _("overflow after relaxation"),
-diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
-index 58ace38..7547c0a0 100644
---- a/gas/config/tc-xtensa.c
-+++ b/gas/config/tc-xtensa.c
-@@ -5867,12 +5867,15 @@ md_apply_fix (fixS *fixP, valueT *valP, segT seg)
- 	    {
- 	    case BFD_RELOC_8:
- 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF8;
-+	      fixP->fx_signed = 1;
- 	      break;
- 	    case BFD_RELOC_16:
- 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF16;
-+	      fixP->fx_signed = 1;
- 	      break;
- 	    case BFD_RELOC_32:
- 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF32;
-+	      fixP->fx_signed = 1;
- 	      break;
- 	    default:
- 	      break;
--- 
-1.8.1.4
-
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index acb3933..08f7d58 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -13,16 +13,6 @@ choice
 		depends on BR2_avr32
 		bool "binutils 2.18-avr32-1.0.1"
 
-	config BR2_BINUTILS_VERSION_2_20_1
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
-		depends on !BR2_ARM_EABIHF
-		bool "binutils 2.20.1"
-
-	config BR2_BINUTILS_VERSION_2_21
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
-		depends on !BR2_ARM_EABIHF
-		bool "binutils 2.21"
-
 	config BR2_BINUTILS_VERSION_2_21_1
 		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		depends on !BR2_ARM_EABIHF
@@ -32,10 +22,6 @@ choice
 		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.22"
 
-	config BR2_BINUTILS_VERSION_2_23_1
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
-		bool "binutils 2.23.1"
-
 	config BR2_BINUTILS_VERSION_2_23_2
 		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.23.2"
-- 
2.0.0
