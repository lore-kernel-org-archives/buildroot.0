From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 22:23:49 +0200
Subject: [Buildroot] [git commit] binutils: bump to 2.28
Message-ID: <20170403203031.1603A82574@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ffc6284489bd56c775c797783cd8ee34ca75e3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 - Patch 0100-elf32-arm-no-data-fix.patch is upstream as of commit
   6342be709e8749d0a44c02e1876ddca360bfd52f, so it is removed.

 - Patch 0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch is
   upstream as of commit 78fb7e37eb8bb08ae537d6c487996ff17c810332, so
   it is removed.

 - Patch
   0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch is
   upstream as of commit c646b02fdcae5f37bd88f33a0c4683ef13ad5c82, so
   it is removed.

 - All other patches are kept, just refreshed to apply cleanly on the
   new binutils version.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[Thomas: improve commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/2.28/0120-sh-conf.patch           |  46 ++++
 package/binutils/2.28/0300-ld-makefile.patch       |  41 +++
 .../2.28/0301-check-ldrunpath-length.patch         |  36 +++
 .../2.28/0500-add-sysroot-fix-from-bug-3049.patch  |  48 ++++
 .../2.28/0600-poison-system-directories.patch      | 306 +++++++++++++++++++++
 package/binutils/2.28/0905-bfin-rofixup-bug.patch  |  21 ++
 .../binutils/2.28/0906-microblaze-pr21180.patch    |  33 +++
 package/binutils/Config.in.host                    |   4 +
 package/binutils/binutils.hash                     |   1 +
 9 files changed, 536 insertions(+)

diff --git a/package/binutils/2.28/0120-sh-conf.patch b/package/binutils/2.28/0120-sh-conf.patch
new file mode 100644
index 0000000..f775998
--- /dev/null
+++ b/package/binutils/2.28/0120-sh-conf.patch
@@ -0,0 +1,46 @@
+From 1ceee199e9a32034c6def7700fdbb26335ca76a3 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:38:13 +0100
+Subject: [PATCH] sh-conf
+
+Likewise, binutils has no idea about any of these new targets either, so we
+fix that up too.. now we're able to actually build a real toolchain for
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
+inept targets than that one, really. Go look, I promise).
+
+[Romain: rebase on top of 2.26]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 34b66f7..905bc7b 100755
+--- a/configure
++++ b/configure
+@@ -3943,7 +3943,7 @@ case "${target}" in
+   or1k*-*-*)
+     noconfigdirs="$noconfigdirs gdb"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index 4977d97..1e69ee2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1279,7 +1279,7 @@ case "${target}" in
+   or1k*-*-*)
+     noconfigdirs="$noconfigdirs gdb"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.4.3
+
diff --git a/package/binutils/2.28/0300-ld-makefile.patch b/package/binutils/2.28/0300-ld-makefile.patch
new file mode 100644
index 0000000..6710195
--- /dev/null
+++ b/package/binutils/2.28/0300-ld-makefile.patch
@@ -0,0 +1,41 @@
+From d76a7549b43974fe8564971a3f40459bc495a8a7 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:40:53 +0100
+Subject: [PATCH] ld-makefile
+
+[Romain: rebase on top of 2.26]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ ld/Makefile.am | 2 +-
+ ld/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ld/Makefile.am b/ld/Makefile.am
+index 0b3b049..3871c74 100644
+--- a/ld/Makefile.am
++++ b/ld/Makefile.am
+@@ -57,7 +57,7 @@ endif
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ 
+ EMUL = @EMUL@
+ EMULATION_OFILES = @EMULATION_OFILES@
+diff --git a/ld/Makefile.in b/ld/Makefile.in
+index ed98f87..530e4c9 100644
+--- a/ld/Makefile.in
++++ b/ld/Makefile.in
+@@ -452,7 +452,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ BASEDIR = $(srcdir)/..
+ BFDDIR = $(BASEDIR)/bfd
+ INCDIR = $(BASEDIR)/include
+-- 
+2.4.3
+
diff --git a/package/binutils/2.28/0301-check-ldrunpath-length.patch b/package/binutils/2.28/0301-check-ldrunpath-length.patch
new file mode 100644
index 0000000..8d673dc
--- /dev/null
+++ b/package/binutils/2.28/0301-check-ldrunpath-length.patch
@@ -0,0 +1,36 @@
+From ebe1cba46df52d7bf86def3d681271fd05fb453b Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:41:47 +0100
+Subject: [PATCH] check-ldrunpath-length
+
+[Romain: rebase on top of 2.26]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ ld/emultempl/elf32.em | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
+index 0405d4f..efd3300 100644
+--- a/ld/emultempl/elf32.em
++++ b/ld/emultempl/elf32.em
+@@ -1411,6 +1411,8 @@ fragment <<EOF
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((lib_path) && (strlen (lib_path) == 0))
++	      	lib_path = NULL;
+ 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
+ 						      force))
+ 		break;
+@@ -1692,6 +1694,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+   rpath = command_line.rpath;
+   if (rpath == NULL)
+     rpath = (const char *) getenv ("LD_RUN_PATH");
++  if ((rpath) && (strlen (rpath) == 0))
++  	rpath = NULL;
+ 
+   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
+     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
+-- 
+2.4.3
+
diff --git a/package/binutils/2.28/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.28/0500-add-sysroot-fix-from-bug-3049.patch
new file mode 100644
index 0000000..0331088
--- /dev/null
+++ b/package/binutils/2.28/0500-add-sysroot-fix-from-bug-3049.patch
@@ -0,0 +1,48 @@
+From 30628870e583375f8927c04398c7219c6e9f703c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:42:48 +0100
+Subject: [PATCH] add sysroot fix from bug #3049
+
+Always try to prepend the sysroot prefix to absolute filenames first.
+
+http://bugs.gentoo.org/275666
+http://sourceware.org/bugzilla/show_bug.cgi?id=10340
+
+Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
+[Romain: rebase on top of 2.26]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ ld/ldfile.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/ld/ldfile.c diff --git b/ld/ldfile.c
+--- a/ld/ldfile.c	2017-03-02 03:23:54.000000000 -0500
++++ b/ld/ldfile.c	2017-03-20 09:52:27.687415942 -0400
+@@ -336,18 +336,24 @@
+      directory first.  */
+   if (!entry->flags.maybe_archive)
+     {
+-      if (entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename))
++     /* For absolute pathnames, try to always open the file in the
++	 sysroot first. If this fails, try to open the file at the
++	 given location.  */
++     entry->flags.sysrooted = is_sysrooted_pathname (entry->filename);
++     if (!entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename)
++     && ld_sysroot)
+ 	{
+ 	  char *name = concat (ld_sysroot, entry->filename,
+ 			       (const char *) NULL);
+ 	  if (ldfile_try_open_bfd (name, entry))
+ 	    {
+ 	      entry->filename = name;
++	      entry->flags.sysrooted = TRUE;
+ 	      return TRUE;
+ 	    }
+ 	  free (name);
+ 	}
+-      else if (ldfile_try_open_bfd (entry->filename, entry))
++      if (ldfile_try_open_bfd (entry->filename, entry))
+ 	return TRUE;
+ 
+       if (IS_ABSOLUTE_PATH (entry->filename))
+
diff --git a/package/binutils/2.28/0600-poison-system-directories.patch b/package/binutils/2.28/0600-poison-system-directories.patch
new file mode 100644
index 0000000..bb1a7b4
--- /dev/null
+++ b/package/binutils/2.28/0600-poison-system-directories.patch
@@ -0,0 +1,306 @@
+From be366461dd49e760440fb28eaee5164eb281adcc Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+[Romain: rebase on top of 2.26]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Gustavo: adapt to binutils 2.25]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+Upstream-Status: Inappropriate [distribution: codesourcery]
+
+Patch originally created by Mark Hatle, forward-ported to
+binutils 2.21 by Scott Garman.
+
+purpose:  warn for uses of system directories when cross linking
+
+Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
+
+2008-07-02  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * ld.h (args_type): Add error_poison_system_directories.
+    * ld.texinfo (--error-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.error_poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.error_poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --error-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-06-13  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * config.in: Regenerate.
+    * ld.h (args_type): Add poison_system_directories.
+    * ld.texinfo (--no-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --no-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-04-20  Joseph Myers  <joseph@codesourcery.com>
+
+    Merge from Sourcery G++ binutils 2.17:
+
+    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
+    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
+    ld/
+    * configure.ac (--enable-poison-system-directories): New option.
+    * configure, config.in: Regenerate.
+    * ldfile.c (ldfile_add_library_path): If
+    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
+    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ ld/config.in    |  3 +++
+ ld/configure    | 14 ++++++++++++++
+ ld/configure.ac | 10 ++++++++++
+ ld/ld.h         |  8 ++++++++
+ ld/ld.texinfo   | 12 ++++++++++++
+ ld/ldfile.c     | 17 +++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 89 insertions(+)
+
+diff --git a/ld/config.in b/ld/config.in
+index 276fb77..35c58eb 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -17,6 +17,9 @@
+    language is requested. */
+ #undef ENABLE_NLS
+ 
++/* Define to warn for use of native system library directories */
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++
+ /* Additional extension a shared object might have. */
+ #undef EXTRA_SHLIB_EXTENSION
+ 
+diff --git a/ld/configure b/ld/configure
+index a446283..d1f9504 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -789,6 +789,7 @@ with_lib_path
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1446,6 +1447,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15499,7 +15502,18 @@ else
+ fi
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
+ 
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
+ 
+ # Check whether --enable-got was given.
+ if test "${enable_got+set}" = set; then :
+diff --git a/ld/configure.ac b/ld/configure.ac
+index 188172d..2cd8443 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
+ AC_SUBST(TARGET_SYSTEM_ROOT)
+ AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
+ 
++AC_ARG_ENABLE([poison-system-directories],
++         AS_HELP_STRING([--enable-poison-system-directories],
++                [warn for use of native system library directories]),,
++         [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++       [1],
++       [Define to warn for use of native system library directories])
++fi
++
+ dnl Use --enable-gold to decide if this linker should be the default.
+ dnl "install_as_default" is set to false if gold is the default linker.
+ dnl "installed_linker" is the installed BFD linker name.
+diff --git a/ld/ld.h b/ld/ld.h
+index d84ec4e..3476b26 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -172,6 +172,14 @@ typedef struct {
+   /* If set, display the target memory usage (per memory region).  */
+   bfd_boolean print_memory_usage;
+ 
++  /* If TRUE (the default) warn for uses of system directories when
++     cross linking.  */
++  bfd_boolean poison_system_directories;
++
++  /* If TRUE (default FALSE) give an error for uses of system
++     directories when cross linking instead of a warning.  */
++  bfd_boolean error_poison_system_directories;
++
+   /* Big or little endian as set on command line.  */
+   enum endian_enum endian;
+ 
+diff --git a/ld/ld.texinfo b/ld/ld.texinfo
+index 1dd7492..fb1438e 100644
+--- a/ld/ld.texinfo
++++ b/ld/ld.texinfo
+@@ -2403,6 +2403,18 @@ string identifying the original linked file does not change.
+ 
+ Passing @code{none} for @var{style} disables the setting from any
+ @code{--build-id} options earlier on the command line.
++
++ at kindex --no-poison-system-directories
++ at item --no-poison-system-directories
++Do not warn for @option{-L} options using system directories such as
++ at file{/usr/lib} when cross linking.  This option is intended for use
++in chroot environments when such directories contain the correct
++libraries for the target system rather than the host.
++
++ at kindex --error-poison-system-directories
++ at item --error-poison-system-directories
++Give an error instead of a warning for @option{-L} options using
++system directories when cross linking.
+ @end table
+ 
+ @c man end
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 1439309..086b354 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -114,6 +114,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
+     new_dirs->name = concat (ld_sysroot, name + 1, (const char *) NULL);
+   else
+     new_dirs->name = xstrdup (name);
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (command_line.poison_system_directories
++  && ((!strncmp (name, "/lib", 4))
++      || (!strncmp (name, "/usr/lib", 8))
++      || (!strncmp (name, "/usr/local/lib", 14))
++      || (!strncmp (name, "/usr/X11R6/lib", 14))))
++   {
++     if (command_line.error_poison_system_directories)
++       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++     else
++       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++   }
++#endif
++
+ }
+ 
+ /* Try to open a BFD for a lang_input_statement.  */
+diff --git a/ld/ldlex.h b/ld/ldlex.h
+index 6f11e7b..0ca3110 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -146,6 +146,8 @@ enum option_values
+   OPTION_PRINT_MEMORY_USAGE,
+   OPTION_REQUIRE_DEFINED_SYMBOL,
+   OPTION_ORPHAN_HANDLING,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+ };
+ 
+ /* The initial parser states.  */
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index bb0b9cc..a23c56c 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -270,6 +270,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = TRUE;
+   command_line.warn_search_mismatch = TRUE;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = TRUE;
++  command_line.error_poison_system_directories = FALSE;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index 4cad209..be7d584 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -535,6 +535,14 @@ static const struct ld_option ld_options[] =
+   { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
+     '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
+     TWO_DASHES },
++  { {"no-poison-system-directories", no_argument, NULL,
++    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Do not warn for -L options using system directories"),
++    TWO_DASHES },
++  { {"error-poison-system-directories", no_argument, NULL,
++    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Give an error for -L options using system directories"),
++    TWO_DASHES },
+ };
+ 
+ #define OPTION_COUNT ARRAY_SIZE (ld_options)
+@@ -547,6 +555,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1528,6 +1537,14 @@ parse_args (unsigned argc, char **argv)
+           }
+           break;
+ 
++	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
++	  command_line.poison_system_directories = FALSE;
++	  break;
++
++	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
++	  command_line.error_poison_system_directories = TRUE;
++	  break;
++
+ 	case OPTION_PUSH_STATE:
+ 	  input_flags.pushed = xmemdup (&input_flags,
+ 					sizeof (input_flags),
+@@ -1571,6 +1588,10 @@ parse_args (unsigned argc, char **argv)
+       command_line.soname = NULL;
+     }
+ 
++  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
++  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
++    command_line.error_poison_system_directories = TRUE;
++
+   while (ingroup)
+     {
+       lang_leave_group ();
+-- 
+2.4.3
+
diff --git a/package/binutils/2.28/0905-bfin-rofixup-bug.patch b/package/binutils/2.28/0905-bfin-rofixup-bug.patch
new file mode 100644
index 0000000..5733b21
--- /dev/null
+++ b/package/binutils/2.28/0905-bfin-rofixup-bug.patch
@@ -0,0 +1,21 @@
+Fixes: LINKER BUG: .rofixup section size mismatch
+
+Workaround from adi-toolchain commit:
+af414ec1fb628ddb1562f062f3db49823ca14ca2
+[#6798] binutils-2.21/bfd: temp workaround for rofixup mismatch errors.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur binutils-2.26.1.orig/bfd/elf32-bfin.c binutils-2.26.1/bfd/elf32-bfin.c
+--- binutils-2.26.1.orig/bfd/elf32-bfin.c	2015-11-13 09:27:40.000000000 +0100
++++ binutils-2.26.1/bfd/elf32-bfin.c	2016-07-31 00:50:48.357995132 +0200
+@@ -4845,7 +4845,8 @@
+ 
+ 	case R_BFIN_FUNCDESC:
+ 	  picrel->fd++;
+-	  picrel->relocsfd++;
++	  if (bfd_get_section_flags (abfd, sec) & SEC_ALLOC)
++	    picrel->relocsfd++;
+ 	  break;
+ 
+         /* This relocation describes the C++ object vtable hierarchy.
diff --git a/package/binutils/2.28/0906-microblaze-pr21180.patch b/package/binutils/2.28/0906-microblaze-pr21180.patch
new file mode 100644
index 0000000..52ac4fd
--- /dev/null
+++ b/package/binutils/2.28/0906-microblaze-pr21180.patch
@@ -0,0 +1,33 @@
+Fix ld segfault for microblaze when --gc-sections is used
+Upstream: pending
+https://sourceware.org/bugzilla/show_bug.cgi?id=21180
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur a/bfd/elf32-microblaze.c b/bfd/elf32-microblaze.c
+--- a/bfd/elf32-microblaze.c	2016-08-03 09:36:50.000000000 +0200
++++ b/bfd/elf32-microblaze.c	2017-02-23 19:43:12.612313590 +0100
+@@ -3233,13 +3233,20 @@
+ 	      || h->dynindx == -1))
+         {
+           asection *sec = h->root.u.def.section;
++	  bfd_vma value;
++
++	  value = h->root.u.def.value;
++	  if (sec->output_section != NULL)
++	    /* PR 21180: If the output section is NULL, then the symbol is no
++	       longer needed, and in theory the GOT entry is redundant.  But
++	       it is too late to change our minds now...  */
++	    value += sec->output_section->vma + sec->output_offset;
++
+           microblaze_elf_output_dynamic_relocation (output_bfd,
+                                                     srela, srela->reloc_count++,
+                                                     /* symindex= */ 0,
+                                                     R_MICROBLAZE_REL, offset,
+-                                                    h->root.u.def.value
+-                                                    + sec->output_section->vma
+-                                                    + sec->output_offset);
++                                                    value);
+         }
+       else
+         {
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 37742fb..a031ab5 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -18,6 +18,9 @@ choice
 	config BR2_BINUTILS_VERSION_2_27_X
 		bool "binutils 2.27"
 
+	config BR2_BINUTILS_VERSION_2_28_X
+		bool "binutils 2.28"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -26,6 +29,7 @@ config BR2_BINUTILS_VERSION
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
+	default "2.28"		if BR2_BINUTILS_VERSION_2_28_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 3bc18d6..50db62b 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -3,6 +3,7 @@ sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fb
 sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
 sha512  9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322bb6cb2b45e8df812f0e8ac059149f8a1f69ba3ed9d86a35c6a540b67  binutils-2.26.1.tar.bz2
 sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12cc842822bfc402836be86f479660cef3791aa62f3753d8a1a6f564cb  binutils-2.27.tar.bz2
+sha512	ede2e4e59a800260eea8c14eafbaee94e30abadafd5c419a3370f9f62213cf027d6400a1d4970b6958bd4d220e675dcd483a708107016e7abd5c99d7392ba8fd  binutils-2.28.tar.bz2
 
 # Locally calculated (fetched from Github)
 sha512  4f259849ee191b41b820a24ce3db37ade7a07290f6178c09d3935bf88b777b7aa36a40ba681bd5da765d9c6943ab52fa2975179bf9bf48260ae0a39692c3600c  binutils-arc-2017.03-eng008.tar.gz
