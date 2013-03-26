From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Mar 2013 15:25:58 -0300
Subject: [Buildroot] [PATCH] binutils: add 2.23.2 and remove deprecated 2.20
Message-ID: <1364322358-7946-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/binutils/Config.in.host                    |  10 +-
 .../binutils/binutils-2.20/110-arm-eabi-conf.patch |  24 ---
 package/binutils/binutils-2.20/120-sh-conf.patch   |  42 -----
 .../300-012_check_ldrunpath_length.patch           |  21 ---
 .../binutils-2.20/400-arm_link_speed.patch         | 183 ---------------------
 package/binutils/binutils-2.23.2/120-sh-conf.patch |  29 ++++
 .../300-001_ld_makefile_patch.patch                |   0
 .../300-012_check_ldrunpath_length.patch           |  21 +++
 .../500-sysroot.patch                              |  21 +--
 9 files changed, 66 insertions(+), 285 deletions(-)
 delete mode 100644 package/binutils/binutils-2.20/110-arm-eabi-conf.patch
 delete mode 100644 package/binutils/binutils-2.20/120-sh-conf.patch
 delete mode 100644 package/binutils/binutils-2.20/300-012_check_ldrunpath_length.patch
 delete mode 100644 package/binutils/binutils-2.20/400-arm_link_speed.patch
 create mode 100644 package/binutils/binutils-2.23.2/120-sh-conf.patch
 rename package/binutils/{binutils-2.20 => binutils-2.23.2}/300-001_ld_makefile_patch.patch (100%)
 create mode 100644 package/binutils/binutils-2.23.2/300-012_check_ldrunpath_length.patch
 rename package/binutils/{binutils-2.20 => binutils-2.23.2}/500-sysroot.patch (62%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 81a4cf7..a61a503 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -12,10 +12,6 @@ choice
 	       depends on BR2_avr32
 	       bool "binutils 2.18-avr32-1.0.1"
 
-	config BR2_BINUTILS_VERSION_2_20
-		depends on !BR2_avr32 && BR2_DEPRECATED
-		bool "binutils 2.20"
-
 	config BR2_BINUTILS_VERSION_2_20_1
 		depends on !BR2_avr32
 		bool "binutils 2.20.1"
@@ -36,17 +32,21 @@ choice
 		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
 		bool "binutils 2.23.1"
 
+	config BR2_BINUTILS_VERSION_2_23_2
+		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
+		bool "binutils 2.23.2"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "2.20"		if BR2_BINUTILS_VERSION_2_20
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
 	default "2.22"		if BR2_BINUTILS_VERSION_2_22
 	default "2.23.1"	if BR2_BINUTILS_VERSION_2_23_1
+	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
 
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
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
diff --git a/package/binutils/binutils-2.23.2/120-sh-conf.patch b/package/binutils/binutils-2.23.2/120-sh-conf.patch
new file mode 100644
index 0000000..ea3d1b6
--- /dev/null
+++ b/package/binutils/binutils-2.23.2/120-sh-conf.patch
@@ -0,0 +1,29 @@
+r10231 | lethal | 2005-05-02 09:58:00 -0400 (Mon, 02 May 2005) | 13 lines
+
+Likewise, binutils has no idea about any of these new targets either, so we 
+fix that up too.. now we're able to actually build a real toolchain for 
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more 
+inept targets than that one, really. Go look, I promise).
+
+--- a/configure
++++ b/configure
+@@ -1495,7 +1495,7 @@
+   mips*-*-*)
+     noconfigdirs="$noconfigdirs gprof"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+--- a/configure.ac
++++ b/configure.ac
+@@ -712,7 +712,7 @@
+   mips*-*-*)
+     noconfigdirs="$noconfigdirs gprof"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
diff --git a/package/binutils/binutils-2.20/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.23.2/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.20/300-001_ld_makefile_patch.patch
rename to package/binutils/binutils-2.23.2/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.23.2/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.23.2/300-012_check_ldrunpath_length.patch
new file mode 100644
index 0000000..df78310
--- /dev/null
+++ b/package/binutils/binutils-2.23.2/300-012_check_ldrunpath_length.patch
@@ -0,0 +1,21 @@
+diff -Nura binutils-2.21.orig/ld/emultempl/elf32.em binutils-2.21/ld/emultempl/elf32.em
+--- binutils-2.21.orig/ld/emultempl/elf32.em	2010-10-29 09:10:36.000000000 -0300
++++ binutils-2.21/ld/emultempl/elf32.em	2010-12-10 09:26:56.746102724 -0300
+@@ -1270,6 +1270,8 @@
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((lib_path) && (strlen (lib_path) == 0))
++	      	lib_path = NULL;
+ 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
+ 						      force))
+ 		break;
+@@ -1497,6 +1499,8 @@
+   rpath = command_line.rpath;
+   if (rpath == NULL)
+     rpath = (const char *) getenv ("LD_RUN_PATH");
++  if ((rpath) && (strlen (rpath) == 0))
++  	rpath = NULL;
+ 
+   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link_next)
+     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
diff --git a/package/binutils/binutils-2.20/500-sysroot.patch b/package/binutils/binutils-2.23.2/500-sysroot.patch
similarity index 62%
rename from package/binutils/binutils-2.20/500-sysroot.patch
rename to package/binutils/binutils-2.23.2/500-sysroot.patch
index d21e4cb..e49c795 100644
--- a/package/binutils/binutils-2.20/500-sysroot.patch
+++ b/package/binutils/binutils-2.23.2/500-sysroot.patch
@@ -7,23 +7,24 @@ http://sourceware.org/bugzilla/show_bug.cgi?id=10340
 
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -308,18 +308,24 @@
+@@ -308,18 +308,25 @@
       directory first.  */
-   if (! entry->is_archive)
+   if (! entry->flags.maybe_archive)
      {
--      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
+-      if (entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename))
 +      /* For absolute pathnames, try to always open the file in the
 +	 sysroot first. If this fails, try to open the file at the
-+	 given location. */
-+      entry->sysrooted = is_sysrooted_pathname(entry->filename, FALSE);
-+      if (IS_ABSOLUTE_PATH (entry->filename) && ld_sysroot && ! entry->sysrooted)
++	 given location.  */
++      entry->flags.sysrooted = is_sysrooted_pathname (entry->filename);
++      if (!entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename)
++	  && ld_sysroot)
  	{
  	  char *name = concat (ld_sysroot, entry->filename,
  			       (const char *) NULL);
  	  if (ldfile_try_open_bfd (name, entry))
  	    {
  	      entry->filename = name;
-+	      entry->sysrooted = TRUE;
++	      entry->flags.sysrooted = TRUE;
  	      return TRUE;
  	    }
  	  free (name);
@@ -31,6 +32,6 @@ http://sourceware.org/bugzilla/show_bug.cgi?id=10340
 -      else if (ldfile_try_open_bfd (entry->filename, entry))
 +
 +      if (ldfile_try_open_bfd (entry->filename, entry))
- 	{
- 	  entry->sysrooted = IS_ABSOLUTE_PATH (entry->filename)
- 	    && is_sysrooted_pathname (entry->filename, TRUE);
+ 	return TRUE;
+ 
+       if (IS_ABSOLUTE_PATH (entry->filename))
-- 
1.8.1.5
