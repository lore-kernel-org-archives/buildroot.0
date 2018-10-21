From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 20:18:09 +0200
Subject: [Buildroot] [git commit] package/binutils: remove binutils 2.27
 patches
Message-ID: <20181021181630.1E3FD88499@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9861d487e1c6965d15d8ffcdcad2c30af84ef0e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

binutils 2.27 support was removed in commit
453d29f1f45736d0156071930a09015def68994a.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../binutils/2.27/0100-elf32-arm-no-data-fix.patch |  22 --
 package/binutils/2.27/0120-sh-conf.patch           |  46 ----
 ...tensa.c-fixup-xg_reverse_shift_count-typo.patch |  33 ---
 ...a-fix-memory-corruption-by-broken-sysregs.patch |  42 ---
 package/binutils/2.27/0300-ld-makefile.patch       |  41 ---
 .../2.27/0301-check-ldrunpath-length.patch         |  36 ---
 .../2.27/0500-add-sysroot-fix-from-bug-3049.patch  |  52 ----
 .../2.27/0600-poison-system-directories.patch      | 306 ---------------------
 ...-Set-dynamic-tag-VMA-and-size-from-dynami.patch |  36 ---
 .../binutils/2.27/0906-microblaze-pr21180.patch    |  33 ---
 ...ly-enable-CRC-instructions-on-supported-A.patch |  88 ------
 11 files changed, 735 deletions(-)

diff --git a/package/binutils/2.27/0100-elf32-arm-no-data-fix.patch b/package/binutils/2.27/0100-elf32-arm-no-data-fix.patch
deleted file mode 100644
index c6b0e7efe8..0000000000
--- a/package/binutils/2.27/0100-elf32-arm-no-data-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-bfd/ChangeLog
-2016-08-23  Nick Clifton  <address@hidden>
-
-        * elf32-arm.c (elf32_arm_count_additional_relocs): Return zero if
-        there is no arm data associated with the section.
-
-[Thomas: taken from https://lists.gnu.org/archive/html/bug-binutils/2016-08/msg00165.html.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-diff --git a/bfd/elf32-arm.c b/bfd/elf32-arm.c
-index 1eba21b..4478238 100644
---- a/bfd/elf32-arm.c
-+++ b/bfd/elf32-arm.c
-@@ -18688,7 +18688,7 @@ elf32_arm_count_additional_relocs (asection *sec)
- {
-   struct _arm_elf_section_data *arm_data;
-   arm_data = get_arm_elf_section_data (sec);
--  return arm_data->additional_reloc_count;
-+  return arm_data == NULL ? 0 : arm_data->additional_reloc_count;
- }
- 
- /* Called to set the sh_flags, sh_link and sh_info fields of OSECTION which
diff --git a/package/binutils/2.27/0120-sh-conf.patch b/package/binutils/2.27/0120-sh-conf.patch
deleted file mode 100644
index cc14ef4029..0000000000
--- a/package/binutils/2.27/0120-sh-conf.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 1ceee199e9a32034c6def7700fdbb26335ca76a3 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:38:13 +0100
-Subject: [PATCH] sh-conf
-
-Likewise, binutils has no idea about any of these new targets either, so we
-fix that up too.. now we're able to actually build a real toolchain for
-sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
-inept targets than that one, really. Go look, I promise).
-
-[Romain: rebase on top of 2.26]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure    | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 34b66f7..905bc7b 100755
---- a/configure
-+++ b/configure
-@@ -3939,7 +3939,7 @@ case "${target}" in
-   or1k*-*-*)
-     noconfigdirs="$noconfigdirs gdb"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
-diff --git a/configure.ac b/configure.ac
-index 4977d97..1e69ee2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1276,7 +1276,7 @@ case "${target}" in
-   or1k*-*-*)
-     noconfigdirs="$noconfigdirs gdb"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
--- 
-2.4.3
-
diff --git a/package/binutils/2.27/0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch b/package/binutils/2.27/0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch
deleted file mode 100644
index 7973607884..0000000000
--- a/package/binutils/2.27/0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 78fb7e37eb8bb08ae537d6c487996ff17c810332 Mon Sep 17 00:00:00 2001
-From: Trevor Saunders <tbsaunde+binutils@tbsaunde.org>
-Date: Mon, 26 Sep 2016 12:42:11 -0400
-Subject: [PATCH] tc-xtensa.c: fixup xg_reverse_shift_count typo
-
-gas/ChangeLog:
-
-2016-09-26  Trevor Saunders  <tbsaunde+binutils@tbsaunde.org>
-
-	* config/tc-xtensa.c (xg_reverse_shift_count): Pass cnt_arg instead of
-	cnt_argp to concat.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- gas/config/tc-xtensa.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
-index d062044..ca261ae 100644
---- a/gas/config/tc-xtensa.c
-+++ b/gas/config/tc-xtensa.c
-@@ -2228,7 +2228,7 @@ xg_reverse_shift_count (char **cnt_argp)
-   cnt_arg = *cnt_argp;
- 
-   /* replace the argument with "31-(argument)" */
--  new_arg = concat ("31-(", cnt_argp, ")", (char *) NULL);
-+  new_arg = concat ("31-(", cnt_arg, ")", (char *) NULL);
- 
-   free (cnt_arg);
-   *cnt_argp = new_arg;
--- 
-2.1.4
-
diff --git a/package/binutils/2.27/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch b/package/binutils/2.27/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch
deleted file mode 100644
index 30103ee05e..0000000000
--- a/package/binutils/2.27/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3c8788dbb70b40e737d4b8e30cab81406e5c5091 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Wed, 2 Aug 2017 00:36:05 -0700
-Subject: [PATCH] xtensa: fix memory corruption by broken sysregs
-
-In some xtensa configurations there may be system/user registers in
-xtensa-modules with negative index. ISA initialization for such config
-may clobber heap and result in program termination.
-Don't update lookup table entries for register with negative indices.
-They are not directly accessible via RSR/WSR/XSR or RUR/WUR, so this
-change should not affect processing of valid assembly/binary code.
-
-bfd/
-2017-08-02  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* xtensa-isa.c (xtensa_isa_init): Don't update lookup table
-	entries for sysregs with negative indices.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: d84ed528d4817b0ff854006b65a9f6ec75f0407a
-
- bfd/xtensa-isa.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/bfd/xtensa-isa.c b/bfd/xtensa-isa.c
-index 8da75bea8109..8c6ee88fdeae 100644
---- a/bfd/xtensa-isa.c
-+++ b/bfd/xtensa-isa.c
-@@ -292,7 +292,8 @@ xtensa_isa_init (xtensa_isa_status *errno_p, char **error_msg_p)
-       xtensa_sysreg_internal *sreg = &isa->sysregs[n];
-       is_user = sreg->is_user;
- 
--      isa->sysreg_table[is_user][sreg->number] = n;
-+      if (sreg->number >= 0)
-+	isa->sysreg_table[is_user][sreg->number] = n;
-     }
- 
-   /* Set up the interface lookup table.  */
--- 
-2.1.4
-
diff --git a/package/binutils/2.27/0300-ld-makefile.patch b/package/binutils/2.27/0300-ld-makefile.patch
deleted file mode 100644
index 73cc098024..0000000000
--- a/package/binutils/2.27/0300-ld-makefile.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d76a7549b43974fe8564971a3f40459bc495a8a7 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:40:53 +0100
-Subject: [PATCH] ld-makefile
-
-[Romain: rebase on top of 2.26]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- ld/Makefile.am | 2 +-
- ld/Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 0b3b049..3871c74 100644
---- a/ld/Makefile.am
-+++ b/ld/Makefile.am
-@@ -57,7 +57,7 @@ endif
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- 
- EMUL = @EMUL@
- EMULATION_OFILES = @EMULATION_OFILES@
-diff --git a/ld/Makefile.in b/ld/Makefile.in
-index ed98f87..530e4c9 100644
---- a/ld/Makefile.in
-+++ b/ld/Makefile.in
-@@ -413,7 +413,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- BASEDIR = $(srcdir)/..
- BFDDIR = $(BASEDIR)/bfd
- INCDIR = $(BASEDIR)/include
--- 
-2.4.3
-
diff --git a/package/binutils/2.27/0301-check-ldrunpath-length.patch b/package/binutils/2.27/0301-check-ldrunpath-length.patch
deleted file mode 100644
index 3b4c204c7f..0000000000
--- a/package/binutils/2.27/0301-check-ldrunpath-length.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ebe1cba46df52d7bf86def3d681271fd05fb453b Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:41:47 +0100
-Subject: [PATCH] check-ldrunpath-length
-
-[Romain: rebase on top of 2.26]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- ld/emultempl/elf32.em | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index 0405d4f..efd3300 100644
---- a/ld/emultempl/elf32.em
-+++ b/ld/emultempl/elf32.em
-@@ -1242,6 +1242,8 @@ fragment <<EOF
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+	      	lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1523,6 +1525,8 @@ gld${EMULATION_NAME}_before_allocation (void)
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+  	rpath = NULL;
- 
-   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
-     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
--- 
-2.4.3
-
diff --git a/package/binutils/2.27/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.27/0500-add-sysroot-fix-from-bug-3049.patch
deleted file mode 100644
index f67a43efdf..0000000000
--- a/package/binutils/2.27/0500-add-sysroot-fix-from-bug-3049.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 30628870e583375f8927c04398c7219c6e9f703c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:42:48 +0100
-Subject: [PATCH] add sysroot fix from bug #3049
-
-Always try to prepend the sysroot prefix to absolute filenames first.
-
-http://bugs.gentoo.org/275666
-http://sourceware.org/bugzilla/show_bug.cgi?id=10340
-
-Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
-[Romain: rebase on top of 2.26]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- ld/ldfile.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 96f9ecc..1439309 100644
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -335,18 +335,25 @@ ldfile_open_file_search (const char *arch,
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
--- 
-2.4.3
-
diff --git a/package/binutils/2.27/0600-poison-system-directories.patch b/package/binutils/2.27/0600-poison-system-directories.patch
deleted file mode 100644
index d16994ec0c..0000000000
--- a/package/binutils/2.27/0600-poison-system-directories.patch
+++ /dev/null
@@ -1,306 +0,0 @@
-From be366461dd49e760440fb28eaee5164eb281adcc Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:45:38 +0100
-Subject: [PATCH] poison-system-directories
-
-Patch adapted to binutils 2.23.2 and extended to use
-BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
-
-[Romain: rebase on top of 2.26]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-[Gustavo: adapt to binutils 2.25]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-Upstream-Status: Inappropriate [distribution: codesourcery]
-
-Patch originally created by Mark Hatle, forward-ported to
-binutils 2.21 by Scott Garman.
-
-purpose:  warn for uses of system directories when cross linking
-
-Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
-
-2008-07-02  Joseph Myers  <joseph@codesourcery.com>
-
-    ld/
-    * ld.h (args_type): Add error_poison_system_directories.
-    * ld.texinfo (--error-poison-system-directories): Document.
-    * ldfile.c (ldfile_add_library_path): Check
-    command_line.error_poison_system_directories.
-    * ldmain.c (main): Initialize
-    command_line.error_poison_system_directories.
-    * lexsup.c (enum option_values): Add
-    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
-    (ld_options): Add --error-poison-system-directories.
-    (parse_args): Handle new option.
-
-2007-06-13  Joseph Myers  <joseph@codesourcery.com>
-
-    ld/
-    * config.in: Regenerate.
-    * ld.h (args_type): Add poison_system_directories.
-    * ld.texinfo (--no-poison-system-directories): Document.
-    * ldfile.c (ldfile_add_library_path): Check
-    command_line.poison_system_directories.
-    * ldmain.c (main): Initialize
-    command_line.poison_system_directories.
-    * lexsup.c (enum option_values): Add
-    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
-    (ld_options): Add --no-poison-system-directories.
-    (parse_args): Handle new option.
-
-2007-04-20  Joseph Myers  <joseph@codesourcery.com>
-
-    Merge from Sourcery G++ binutils 2.17:
-
-    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
-    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
-    ld/
-    * configure.ac (--enable-poison-system-directories): New option.
-    * configure, config.in: Regenerate.
-    * ldfile.c (ldfile_add_library_path): If
-    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
-    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
----
- ld/config.in    |  3 +++
- ld/configure    | 14 ++++++++++++++
- ld/configure.ac | 10 ++++++++++
- ld/ld.h         |  8 ++++++++
- ld/ld.texinfo   | 12 ++++++++++++
- ld/ldfile.c     | 17 +++++++++++++++++
- ld/ldlex.h      |  2 ++
- ld/ldmain.c     |  2 ++
- ld/lexsup.c     | 21 +++++++++++++++++++++
- 9 files changed, 89 insertions(+)
-
-diff --git a/ld/config.in b/ld/config.in
-index 276fb77..35c58eb 100644
---- a/ld/config.in
-+++ b/ld/config.in
-@@ -14,6 +14,9 @@
-    language is requested. */
- #undef ENABLE_NLS
- 
-+/* Define to warn for use of native system library directories */
-+#undef ENABLE_POISON_SYSTEM_DIRECTORIES
-+
- /* Additional extension a shared object might have. */
- #undef EXTRA_SHLIB_EXTENSION
- 
-diff --git a/ld/configure b/ld/configure
-index a446283..d1f9504 100755
---- a/ld/configure
-+++ b/ld/configure
-@@ -786,6 +786,7 @@ with_lib_path
- enable_targets
- enable_64_bit_bfd
- with_sysroot
-+enable_poison_system_directories
- enable_gold
- enable_got
- enable_compressed_debug_sections
-@@ -1442,6 +1443,8 @@ Optional Features:
-   --disable-largefile     omit support for large files
-   --enable-targets        alternative target configurations
-   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
-+  --enable-poison-system-directories
-+                          warn for use of native system library directories
-   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
-   --enable-got=<type>     GOT handling scheme (target, single, negative,
-                           multigot)
-@@ -15491,7 +15494,18 @@ else
- fi
- 
- 
-+# Check whether --enable-poison-system-directories was given.
-+if test "${enable_poison_system_directories+set}" = set; then :
-+  enableval=$enable_poison_system_directories;
-+else
-+  enable_poison_system_directories=no
-+fi
-+
-+if test "x${enable_poison_system_directories}" = "xyes"; then
- 
-+$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
-+
-+fi
- 
- # Check whether --enable-got was given.
- if test "${enable_got+set}" = set; then :
-diff --git a/ld/configure.ac b/ld/configure.ac
-index 188172d..2cd8443 100644
---- a/ld/configure.ac
-+++ b/ld/configure.ac
-@@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
- AC_SUBST(TARGET_SYSTEM_ROOT)
- AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
- 
-+AC_ARG_ENABLE([poison-system-directories],
-+         AS_HELP_STRING([--enable-poison-system-directories],
-+                [warn for use of native system library directories]),,
-+         [enable_poison_system_directories=no])
-+if test "x${enable_poison_system_directories}" = "xyes"; then
-+  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
-+       [1],
-+       [Define to warn for use of native system library directories])
-+fi
-+
- dnl Use --enable-gold to decide if this linker should be the default.
- dnl "install_as_default" is set to false if gold is the default linker.
- dnl "installed_linker" is the installed BFD linker name.
-diff --git a/ld/ld.h b/ld/ld.h
-index d84ec4e..3476b26 100644
---- a/ld/ld.h
-+++ b/ld/ld.h
-@@ -164,6 +164,14 @@ typedef struct {
-   /* If set, display the target memory usage (per memory region).  */
-   bfd_boolean print_memory_usage;
- 
-+  /* If TRUE (the default) warn for uses of system directories when
-+     cross linking.  */
-+  bfd_boolean poison_system_directories;
-+
-+  /* If TRUE (default FALSE) give an error for uses of system
-+     directories when cross linking instead of a warning.  */
-+  bfd_boolean error_poison_system_directories;
-+
-   /* Big or little endian as set on command line.  */
-   enum endian_enum endian;
- 
-diff --git a/ld/ld.texinfo b/ld/ld.texinfo
-index 1dd7492..fb1438e 100644
---- a/ld/ld.texinfo
-+++ b/ld/ld.texinfo
-@@ -2332,6 +2332,18 @@ string identifying the original linked file does not change.
- 
- Passing @code{none} for @var{style} disables the setting from any
- @code{--build-id} options earlier on the command line.
-+
-+ at kindex --no-poison-system-directories
-+ at item --no-poison-system-directories
-+Do not warn for @option{-L} options using system directories such as
-+ at file{/usr/lib} when cross linking.  This option is intended for use
-+in chroot environments when such directories contain the correct
-+libraries for the target system rather than the host.
-+
-+ at kindex --error-poison-system-directories
-+ at item --error-poison-system-directories
-+Give an error instead of a warning for @option{-L} options using
-+system directories when cross linking.
- @end table
- 
- @c man end
-diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 1439309..086b354 100644
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -114,6 +114,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
-     new_dirs->name = concat (ld_sysroot, name + 1, (const char *) NULL);
-   else
-     new_dirs->name = xstrdup (name);
-+
-+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
-+  if (command_line.poison_system_directories
-+  && ((!strncmp (name, "/lib", 4))
-+      || (!strncmp (name, "/usr/lib", 8))
-+      || (!strncmp (name, "/usr/local/lib", 14))
-+      || (!strncmp (name, "/usr/X11R6/lib", 14))))
-+   {
-+     if (command_line.error_poison_system_directories)
-+       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
-+            "cross-compilation\n"), name);
-+     else
-+       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
-+            "cross-compilation\n"), name);
-+   }
-+#endif
-+
- }
- 
- /* Try to open a BFD for a lang_input_statement.  */
-diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 6f11e7b..0ca3110 100644
---- a/ld/ldlex.h
-+++ b/ld/ldlex.h
-@@ -144,6 +144,8 @@ enum option_values
-   OPTION_PRINT_MEMORY_USAGE,
-   OPTION_REQUIRE_DEFINED_SYMBOL,
-   OPTION_ORPHAN_HANDLING,
-+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
-+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
- };
- 
- /* The initial parser states.  */
-diff --git a/ld/ldmain.c b/ld/ldmain.c
-index bb0b9cc..a23c56c 100644
---- a/ld/ldmain.c
-+++ b/ld/ldmain.c
-@@ -257,6 +257,8 @@ main (int argc, char **argv)
-   command_line.warn_mismatch = TRUE;
-   command_line.warn_search_mismatch = TRUE;
-   command_line.check_section_addresses = -1;
-+  command_line.poison_system_directories = TRUE;
-+  command_line.error_poison_system_directories = FALSE;
- 
-   /* We initialize DEMANGLING based on the environment variable
-      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 4cad209..be7d584 100644
---- a/ld/lexsup.c
-+++ b/ld/lexsup.c
-@@ -530,6 +530,14 @@ static const struct ld_option ld_options[] =
-   { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
-     '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
-     TWO_DASHES },
-+  { {"no-poison-system-directories", no_argument, NULL,
-+    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
-+    '\0', NULL, N_("Do not warn for -L options using system directories"),
-+    TWO_DASHES },
-+  { {"error-poison-system-directories", no_argument, NULL,
-+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
-+    '\0', NULL, N_("Give an error for -L options using system directories"),
-+    TWO_DASHES },
- };
- 
- #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -542,6 +550,7 @@ parse_args (unsigned argc, char **argv)
-   int ingroup = 0;
-   char *default_dirlist = NULL;
-   char *shortopts;
-+  char *BR_paranoid_env;
-   struct option *longopts;
-   struct option *really_longopts;
-   int last_optind;
-@@ -1516,6 +1525,14 @@ parse_args (unsigned argc, char **argv)
-           }
-           break;
- 
-+	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
-+	  command_line.poison_system_directories = FALSE;
-+	  break;
-+
-+	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
-+	  command_line.error_poison_system_directories = TRUE;
-+	  break;
-+
- 	case OPTION_PUSH_STATE:
- 	  input_flags.pushed = xmemdup (&input_flags,
- 					sizeof (input_flags),
-@@ -1559,6 +1576,10 @@ parse_args (unsigned argc, char **argv)
-       command_line.soname = NULL;
-     }
- 
-+  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
-+  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
-+    command_line.error_poison_system_directories = TRUE;
-+
-   while (ingroup)
-     {
-       lang_leave_group ();
--- 
-2.4.3
-
diff --git a/package/binutils/2.27/0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch b/package/binutils/2.27/0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch
deleted file mode 100644
index f1ec259988..0000000000
--- a/package/binutils/2.27/0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c646b02fdcae5f37bd88f33a0c4683ef13ad5c82 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Mon, 31 Oct 2016 12:46:38 +1030
-Subject: [PATCH] Revert part "Set dynamic tag VMA and size from dynamic
- section when possible"
-
-	PR 20748
-	* elf32-microblaze.c (microblaze_elf_finish_dynamic_sections): Revert
-	2016-05-13 change.
-
-Signed-off-by: Alan Modra <amodra@gmail.com>
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
-
-diff --git a/bfd/elf32-microblaze.c b/bfd/elf32-microblaze.c
-index 477e7b3..5c66808 100644
---- a/bfd/elf32-microblaze.c
-+++ b/bfd/elf32-microblaze.c
-@@ -3396,13 +3396,13 @@ microblaze_elf_finish_dynamic_sections (bfd *output_bfd,
-             {
-               asection *s;
- 
--              s = bfd_get_linker_section (dynobj, name);
-+              s = bfd_get_section_by_name (output_bfd, name);
-               if (s == NULL)
-                 dyn.d_un.d_val = 0;
-               else
-                 {
-                   if (! size)
--                    dyn.d_un.d_ptr = s->output_section->vma + s->output_offset;
-+                    dyn.d_un.d_ptr = s->vma;
-                   else
-                     dyn.d_un.d_val = s->size;
-                 }
--- 
-2.1.4
-
diff --git a/package/binutils/2.27/0906-microblaze-pr21180.patch b/package/binutils/2.27/0906-microblaze-pr21180.patch
deleted file mode 100644
index 48e5e14b45..0000000000
--- a/package/binutils/2.27/0906-microblaze-pr21180.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Fix ld segfault for microblaze when --gc-sections is used
-Upstream: pending
-https://sourceware.org/bugzilla/show_bug.cgi?id=21180
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur binutils-2.27.orig/bfd/elf32-microblaze.c binutils-2.27/bfd/elf32-microblaze.c
---- binutils-2.27.orig/bfd/elf32-microblaze.c	2016-08-03 09:36:50.000000000 +0200
-+++ binutils-2.27/bfd/elf32-microblaze.c	2017-02-23 19:43:12.612313590 +0100
-@@ -3297,13 +3297,20 @@
- 	      || h->dynindx == -1))
-         {
-           asection *sec = h->root.u.def.section;
-+	  bfd_vma value;
-+
-+	  value = h->root.u.def.value;
-+	  if (sec->output_section != NULL)
-+	    /* PR 21180: If the output section is NULL, then the symbol is no
-+	       longer needed, and in theory the GOT entry is redundant.  But
-+	       it is too late to change our minds now...  */
-+	    value += sec->output_section->vma + sec->output_offset;
-+
-           microblaze_elf_output_dynamic_relocation (output_bfd,
-                                                     srela, srela->reloc_count++,
-                                                     /* symindex= */ 0,
-                                                     R_MICROBLAZE_REL, offset,
--                                                    h->root.u.def.value
--                                                    + sec->output_section->vma
--                                                    + sec->output_offset);
-+                                                    value);
-         }
-       else
-         {
diff --git a/package/binutils/2.27/0907-Automatically-enable-CRC-instructions-on-supported-A.patch b/package/binutils/2.27/0907-Automatically-enable-CRC-instructions-on-supported-A.patch
deleted file mode 100644
index 3b7fcfc959..0000000000
--- a/package/binutils/2.27/0907-Automatically-enable-CRC-instructions-on-supported-A.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 29a4659015ca7044c2d425d32a0b828e0fbb5ac1 Mon Sep 17 00:00:00 2001
-From: Richard Earnshaw <Richard.Earnshaw@arm.com>
-Date: Wed, 7 Sep 2016 17:14:54 +0100
-Subject: [PATCH] Automatically enable CRC instructions on supported ARMv8-A
- CPUs.
-
-2016-09-07  Richard Earnshaw  <rearnsha@arm.com>
-
-	* opcode/arm.h (ARM_ARCH_V8A_CRC): New architecture.
-
-2016-09-07  Richard Earnshaw  <rearnsha@arm.com>
-
-	* config/tc-arm.c ((arm_cpus): Use ARM_ARCH_V8A_CRC for all
-	ARMv8-A CPUs except xgene1.
-
-Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=patch;h=27e5a270962fb92c07e7d476966ba380fa3bb68e
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- gas/config/tc-arm.c  | 18 +++++++++---------
- include/opcode/arm.h |  2 ++
- 2 files changed, 11 insertions(+), 9 deletions(-)
-
-diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c
-index 73d05316..7c86184d 100644
---- a/gas/config/tc-arm.c
-+++ b/gas/config/tc-arm.c
-@@ -25332,17 +25332,17 @@ static const struct arm_cpu_option_table arm_cpus[] =
- 								  "Cortex-A15"),
-   ARM_CPU_OPT ("cortex-a17",	ARM_ARCH_V7VE,   FPU_ARCH_NEON_VFP_V4,
- 								  "Cortex-A17"),
--  ARM_CPU_OPT ("cortex-a32",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
-+  ARM_CPU_OPT ("cortex-a32",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
- 								  "Cortex-A32"),
--  ARM_CPU_OPT ("cortex-a35",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
-+  ARM_CPU_OPT ("cortex-a35",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
- 								  "Cortex-A35"),
--  ARM_CPU_OPT ("cortex-a53",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
-+  ARM_CPU_OPT ("cortex-a53",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
- 								  "Cortex-A53"),
--  ARM_CPU_OPT ("cortex-a57",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
-+  ARM_CPU_OPT ("cortex-a57",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
- 								  "Cortex-A57"),
--  ARM_CPU_OPT ("cortex-a72",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
-+  ARM_CPU_OPT ("cortex-a72",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
- 								  "Cortex-A72"),
--  ARM_CPU_OPT ("cortex-a73",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
-+  ARM_CPU_OPT ("cortex-a73",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
- 								  "Cortex-A73"),
-   ARM_CPU_OPT ("cortex-r4",	ARM_ARCH_V7R,	 FPU_NONE,	  "Cortex-R4"),
-   ARM_CPU_OPT ("cortex-r4f",	ARM_ARCH_V7R,	 FPU_ARCH_VFP_V3D16,
-@@ -25361,10 +25361,10 @@ static const struct arm_cpu_option_table arm_cpus[] =
-   ARM_CPU_OPT ("cortex-m1",	ARM_ARCH_V6SM,	 FPU_NONE,	  "Cortex-M1"),
-   ARM_CPU_OPT ("cortex-m0",	ARM_ARCH_V6SM,	 FPU_NONE,	  "Cortex-M0"),
-   ARM_CPU_OPT ("cortex-m0plus",	ARM_ARCH_V6SM,	 FPU_NONE,	  "Cortex-M0+"),
--  ARM_CPU_OPT ("exynos-m1",	ARM_ARCH_V8A,	 FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
-+  ARM_CPU_OPT ("exynos-m1",	ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
- 								  "Samsung " \
- 								  "Exynos M1"),
--  ARM_CPU_OPT ("qdf24xx",	ARM_ARCH_V8A,	 FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
-+  ARM_CPU_OPT ("qdf24xx",	ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
- 								  "Qualcomm "
- 								  "QDF24XX"),
- 
-@@ -25389,7 +25389,7 @@ static const struct arm_cpu_option_table arm_cpus[] =
-   /* APM X-Gene family.  */
-   ARM_CPU_OPT ("xgene1",        ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
- 	                                                          "APM X-Gene 1"),
--  ARM_CPU_OPT ("xgene2",        ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
-+  ARM_CPU_OPT ("xgene2",        ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
- 	                                                          "APM X-Gene 2"),
- 
-   { NULL, 0, ARM_ARCH_NONE, ARM_ARCH_NONE, NULL }
-diff --git a/include/opcode/arm.h b/include/opcode/arm.h
-index 60715cf8..feace5cd 100644
---- a/include/opcode/arm.h
-+++ b/include/opcode/arm.h
-@@ -263,6 +263,8 @@
- #define ARM_ARCH_V7M	ARM_FEATURE_CORE (ARM_AEXT_V7M, ARM_EXT2_V6T2_V8M)
- #define ARM_ARCH_V7EM	ARM_FEATURE_CORE (ARM_AEXT_V7EM, ARM_EXT2_V6T2_V8M)
- #define ARM_ARCH_V8A	ARM_FEATURE_CORE (ARM_AEXT_V8A, ARM_AEXT2_V8A)
-+#define ARM_ARCH_V8A_CRC ARM_FEATURE (ARM_AEXT_V8A, ARM_AEXT2_V8A, \
-+				      CRC_EXT_ARMV8)
- #define ARM_ARCH_V8_1A	ARM_FEATURE (ARM_AEXT_V8A, ARM_AEXT2_V8_1A,	\
- 				     CRC_EXT_ARMV8 | FPU_NEON_EXT_RDMA)
- #define ARM_ARCH_V8_2A	ARM_FEATURE (ARM_AEXT_V8A, ARM_AEXT2_V8_2A,	\
--- 
-2.11.0
-
