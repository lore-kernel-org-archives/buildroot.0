From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 16:02:03 +0100
Subject: [Buildroot] [git commit] package/binutils: add binutils 2.26
Message-ID: <20160306150321.29322800EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8d0d28bf9d9e931509cc4a38936bc118e801808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Rebase patches from 2.25 on top of 2.26.
- Use git format for patches
- remove upstreamed xtensa patches

The first patch [1] is needed to be able to build glibc with binutils 2.26 on nios2.
The second from [2] fix an assertion issue with ld.

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=a7be2893a6449e64fe6cfcdd8700b0a367a69f19
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=19405

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/2.26/0120-sh-conf.patch           |  46 ++++
 package/binutils/2.26/0300-ld-makefile.patch       |  41 +++
 .../2.26/0301-check-ldrunpath-length.patch         |  36 +++
 .../2.26/0500-add-sysroot-fix-from-bug-3049.patch  |  52 ++++
 .../2.26/0600-poison-system-directories.patch      | 306 +++++++++++++++++++++
 ...900-Correct-nios2-_gp-address-computation.patch | 108 ++++++++
 ...on-reduce-number-of-messages-about-FDE-en.patch |  67 +++++
 ...-xtensa-fix-signedness-of-gas-relocations.patch | 101 +++++++
 package/binutils/Config.in.host                    |   4 +
 package/binutils/binutils.hash                     |   1 +
 10 files changed, 762 insertions(+)

diff --git a/package/binutils/2.26/0120-sh-conf.patch b/package/binutils/2.26/0120-sh-conf.patch
new file mode 100644
index 0000000..cc14ef4
--- /dev/null
+++ b/package/binutils/2.26/0120-sh-conf.patch
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
+@@ -3939,7 +3939,7 @@ case "${target}" in
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
+@@ -1276,7 +1276,7 @@ case "${target}" in
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
diff --git a/package/binutils/2.26/0300-ld-makefile.patch b/package/binutils/2.26/0300-ld-makefile.patch
new file mode 100644
index 0000000..73cc098
--- /dev/null
+++ b/package/binutils/2.26/0300-ld-makefile.patch
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
+@@ -413,7 +413,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
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
diff --git a/package/binutils/2.26/0301-check-ldrunpath-length.patch b/package/binutils/2.26/0301-check-ldrunpath-length.patch
new file mode 100644
index 0000000..3b4c204
--- /dev/null
+++ b/package/binutils/2.26/0301-check-ldrunpath-length.patch
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
+@@ -1242,6 +1242,8 @@ fragment <<EOF
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((lib_path) && (strlen (lib_path) == 0))
++	      	lib_path = NULL;
+ 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
+ 						      force))
+ 		break;
+@@ -1523,6 +1525,8 @@ gld${EMULATION_NAME}_before_allocation (void)
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
diff --git a/package/binutils/2.26/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.26/0500-add-sysroot-fix-from-bug-3049.patch
new file mode 100644
index 0000000..f67a43e
--- /dev/null
+++ b/package/binutils/2.26/0500-add-sysroot-fix-from-bug-3049.patch
@@ -0,0 +1,52 @@
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
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 96f9ecc..1439309 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -335,18 +335,25 @@ ldfile_open_file_search (const char *arch,
+      directory first.  */
+   if (! entry->flags.maybe_archive)
+     {
+-      if (entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename))
++      /* For absolute pathnames, try to always open the file in the
++	 sysroot first. If this fails, try to open the file at the
++	 given location.  */
++      entry->flags.sysrooted = is_sysrooted_pathname (entry->filename);
++      if (!entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename)
++	  && ld_sysroot)
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
++
++      if (ldfile_try_open_bfd (entry->filename, entry))
+ 	return TRUE;
+ 
+       if (IS_ABSOLUTE_PATH (entry->filename))
+-- 
+2.4.3
+
diff --git a/package/binutils/2.26/0600-poison-system-directories.patch b/package/binutils/2.26/0600-poison-system-directories.patch
new file mode 100644
index 0000000..d16994e
--- /dev/null
+++ b/package/binutils/2.26/0600-poison-system-directories.patch
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
+@@ -14,6 +14,9 @@
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
+@@ -786,6 +786,7 @@ with_lib_path
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1442,6 +1443,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15491,7 +15494,18 @@ else
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
+@@ -164,6 +164,14 @@ typedef struct {
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
+@@ -2332,6 +2332,18 @@ string identifying the original linked file does not change.
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
+@@ -144,6 +144,8 @@ enum option_values
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
+@@ -257,6 +257,8 @@ main (int argc, char **argv)
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
+@@ -530,6 +530,14 @@ static const struct ld_option ld_options[] =
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
+@@ -542,6 +550,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1516,6 +1525,14 @@ parse_args (unsigned argc, char **argv)
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
+@@ -1559,6 +1576,10 @@ parse_args (unsigned argc, char **argv)
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
diff --git a/package/binutils/2.26/0900-Correct-nios2-_gp-address-computation.patch b/package/binutils/2.26/0900-Correct-nios2-_gp-address-computation.patch
new file mode 100644
index 0000000..81986f5
--- /dev/null
+++ b/package/binutils/2.26/0900-Correct-nios2-_gp-address-computation.patch
@@ -0,0 +1,108 @@
+From 5eeb7401eed2f26d5fc255de816ca70a2cb9374e Mon Sep 17 00:00:00 2001
+From: Sandra Loosemore <sandra@codesourcery.com>
+Date: Sun, 27 Dec 2015 12:30:26 -0800
+Subject: [PATCH 900/901] Correct nios2 _gp address computation.
+
+2015-12-27  Sandra Loosemore  <sandra@codesourcery.com>
+
+	bfd/
+	* elf32-nios2.c (nios2_elf_assign_gp): Correct computation of _gp
+	address.
+	(nios2_elf32_relocate_section): Tidy code for R_NIOS2_GPREL error
+	messages.
+
+[Romain:
+  - backport upstream patch on 2.26
+  - drop bfd/ChangeLog entry]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ bfd/elf32-nios2.c | 31 +++++++++++++++++++++----------
+ 1 file changed, 21 insertions(+), 10 deletions(-)
+
+diff --git a/bfd/elf32-nios2.c b/bfd/elf32-nios2.c
+index 6b29d8b..01ebd6e 100644
+--- a/bfd/elf32-nios2.c
++++ b/bfd/elf32-nios2.c
+@@ -3086,7 +3086,15 @@ lookup:
+ 	case bfd_link_hash_defined:
+ 	case bfd_link_hash_defweak:
+ 	  gp_found = TRUE;
+-	  *pgp = lh->u.def.value;
++	  {
++	    asection *sym_sec = lh->u.def.section;
++	    bfd_vma sym_value = lh->u.def.value;
++
++	    if (sym_sec->output_section)
++	      sym_value = (sym_value + sym_sec->output_offset
++			   + sym_sec->output_section->vma);
++	    *pgp = sym_value;
++	  }
+ 	  break;
+ 	case bfd_link_hash_indirect:
+ 	case bfd_link_hash_warning:
+@@ -3719,7 +3727,6 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+       struct elf32_nios2_link_hash_entry *eh;
+       bfd_vma relocation;
+       bfd_vma gp;
+-      bfd_vma reloc_address;
+       bfd_reloc_status_type r = bfd_reloc_ok;
+       const char *name = NULL;
+       int r_type;
+@@ -3762,12 +3769,6 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+       if (bfd_link_relocatable (info))
+ 	continue;
+ 
+-      if (sec && sec->output_section)
+-	reloc_address = (sec->output_section->vma + sec->output_offset
+-			 + rel->r_offset);
+-      else
+-	reloc_address = 0;
+-
+       if (howto)
+ 	{
+ 	  switch (howto->type)
+@@ -3816,6 +3817,15 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+ 	      /* Turns an absolute address into a gp-relative address.  */
+ 	      if (!nios2_elf_assign_gp (output_bfd, &gp, info))
+ 		{
++		  bfd_vma reloc_address;
++
++		  if (sec && sec->output_section)
++		    reloc_address = (sec->output_section->vma
++				     + sec->output_offset
++				     + rel->r_offset);
++		  else
++		    reloc_address = 0;
++
+ 		  format = _("global pointer relative relocation at address "
+ 			     "0x%08x when _gp not defined\n");
+ 		  sprintf (msgbuf, format, reloc_address);
+@@ -3825,7 +3835,7 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+ 	      else
+ 		{
+ 		  bfd_vma symbol_address = rel->r_addend + relocation;
+-		  relocation = relocation + rel->r_addend - gp;
++		  relocation = symbol_address - gp;
+ 		  rel->r_addend = 0;
+ 		  if (((signed) relocation < -32768
+ 		       || (signed) relocation > 32767)
+@@ -3833,6 +3843,8 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+ 			  || h->root.type == bfd_link_hash_defined
+ 			  || h->root.type == bfd_link_hash_defweak))
+ 		    {
++		      if (h)
++			name = h->root.root.string;
+ 		      format = _("Unable to reach %s (at 0x%08x) from the "
+ 				 "global pointer (at 0x%08x) because the "
+ 				 "offset (%d) is out of the allowed range, "
+@@ -3848,7 +3860,6 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+ 						  rel->r_offset, relocation,
+ 						  rel->r_addend);
+ 		}
+-
+ 	      break;
+ 	    case R_NIOS2_UJMP:
+ 	      r = nios2_elf32_do_ujmp_relocate (input_bfd, howto,
+-- 
+2.4.3
+
diff --git a/package/binutils/2.26/0901-Fix-assertion-reduce-number-of-messages-about-FDE-en.patch b/package/binutils/2.26/0901-Fix-assertion-reduce-number-of-messages-about-FDE-en.patch
new file mode 100644
index 0000000..a490780
--- /dev/null
+++ b/package/binutils/2.26/0901-Fix-assertion-reduce-number-of-messages-about-FDE-en.patch
@@ -0,0 +1,67 @@
+From 39c481c2fb0e7fb127a15facf70b55d517462809 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 6 Feb 2016 00:35:31 +0100
+Subject: [PATCH 901/901] Fix assertion, reduce number of messages about FDE
+ encoding
+
+Patch by Nick Clifton [1]
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=19405
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ bfd/elf-eh-frame.c | 17 ++++++++++++++---
+ bfd/elf32-nios2.c  |  4 ++--
+ 2 files changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf-eh-frame.c b/bfd/elf-eh-frame.c
+index e303189..e79bff0 100644
+--- a/bfd/elf-eh-frame.c
++++ b/bfd/elf-eh-frame.c
+@@ -1369,14 +1369,25 @@ _bfd_elf_discard_section_eh_frame
+ 		     && ent->make_relative == 0)
+ 		    || (ent->fde_encoding & 0x70) == DW_EH_PE_aligned))
+ 	      {
++		static int num_warnings_issued = 0;
+ 		/* If a shared library uses absolute pointers
+ 		   which we cannot turn into PC relative,
+ 		   don't create the binary search table,
+ 		   since it is affected by runtime relocations.  */
+ 		hdr_info->u.dwarf.table = FALSE;
+-		(*info->callbacks->einfo)
+-		  (_("%P: FDE encoding in %B(%A) prevents .eh_frame_hdr"
+-		     " table being created.\n"), abfd, sec);
++		if (num_warnings_issued < 10)
++		  {
++		    (*info->callbacks->einfo)
++		      (_("%P: FDE encoding in %B(%A) prevents .eh_frame_hdr"
++			 " table being created.\n"), abfd, sec);
++		    num_warnings_issued ++;
++		  }
++		else if (num_warnings_issued == 10)
++		  {
++		    (*info->callbacks->einfo)
++		      (_("%P: Further warnings about FDE encoding preventing .eh_frame_hdr generation dropped.\n"));
++		    num_warnings_issued ++;
++		  }
+ 	      }
+ 	    ent->removed = 0;
+ 	    hdr_info->u.dwarf.fde_count++;
+diff --git a/bfd/elf32-nios2.c b/bfd/elf32-nios2.c
+index 01ebd6e..d1b7f83 100644
+--- a/bfd/elf32-nios2.c
++++ b/bfd/elf32-nios2.c
+@@ -1905,8 +1905,8 @@ nios2_elf32_install_imm16 (asection *sec, bfd_vma offset, bfd_vma value)
+ {
+   bfd_vma word = bfd_get_32 (sec->owner, sec->contents + offset);
+ 
+-  BFD_ASSERT(value <= 0xffff);
+-
++  BFD_ASSERT (value <= 0xffff || ((bfd_signed_vma) value) >= -0xffff);
++  
+   bfd_put_32 (sec->owner, word | ((value & 0xffff) << 6),
+ 	      sec->contents + offset);
+ }
+-- 
+2.4.3
+
diff --git a/package/binutils/2.26/0902-xtensa-fix-signedness-of-gas-relocations.patch b/package/binutils/2.26/0902-xtensa-fix-signedness-of-gas-relocations.patch
new file mode 100644
index 0000000..4ba2f75
--- /dev/null
+++ b/package/binutils/2.26/0902-xtensa-fix-signedness-of-gas-relocations.patch
@@ -0,0 +1,101 @@
+From eb3e02b484ff75f4a2f54192422a88baa275bdfc Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 2 Feb 2016 17:11:38 +0300
+Subject: [PATCH] xtensa: fix signedness of gas relocations
+
+Change 1058c7532d0b "Use signed data type for R_XTENSA_DIFF* relocation
+offsets." changed signedness of BFD_RELOC_XTENSA_DIFF* relocations
+substituted for BFD_RELOC_*. This made it impossible to encode arbitrary
+8-, 16- and 32-bit values, which broke e.g. debug info encoding by .loc
+directive. Revert this part and add test.
+
+gas/
+2016-02-03  Max Filippov  <jcmvbkbc@gmail.com>
+	* config/tc-xtensa.c (md_apply_fix): Mark BFD_RELOC_XTENSA_DIFF*
+	substitutions for BFD_RELOC_* as unsigned.
+
+gas/testsuite/
+2016-02-03  Max Filippov  <jcmvbkbc@gmail.com>
+	* gas/xtensa/all.exp: Add loc to list of xtensa tests.
+	* gas/xtensa/loc.d: New file: loc test result patterns.
+	* gas/xtensa/loc.s: New file: loc test.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+[Rebase on 2.26]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gas/config/tc-xtensa.c           |  6 +++---
+ gas/testsuite/gas/xtensa/all.exp |  1 +
+ gas/testsuite/gas/xtensa/loc.d   | 10 ++++++++++
+ gas/testsuite/gas/xtensa/loc.s   |  7 +++++++
+ 4 files changed, 21 insertions(+), 3 deletions(-)
+ create mode 100644 gas/testsuite/gas/xtensa/loc.d
+ create mode 100644 gas/testsuite/gas/xtensa/loc.s
+
+diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
+index d707da8..f623add 100644
+--- a/gas/config/tc-xtensa.c
++++ b/gas/config/tc-xtensa.c
+@@ -5961,15 +5961,15 @@ md_apply_fix (fixS *fixP, valueT *valP, segT seg)
+ 	    {
+ 	    case BFD_RELOC_8:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF8;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    case BFD_RELOC_16:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF16;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    case BFD_RELOC_32:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF32;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    default:
+ 	      break;
+diff --git a/gas/testsuite/gas/xtensa/all.exp b/gas/testsuite/gas/xtensa/all.exp
+index db39629..4daeff2 100644
+--- a/gas/testsuite/gas/xtensa/all.exp
++++ b/gas/testsuite/gas/xtensa/all.exp
+@@ -101,6 +101,7 @@ if [istarget xtensa*-*-*] then {
+     run_dump_test "trampoline"
+     run_dump_test "first_frag_align"
+     run_dump_test "auto-litpools"
++    run_dump_test "loc"
+ }
+ 
+ if [info exists errorInfo] then {
+diff --git a/gas/testsuite/gas/xtensa/loc.d b/gas/testsuite/gas/xtensa/loc.d
+new file mode 100644
+index 0000000..71983cc
+--- /dev/null
++++ b/gas/testsuite/gas/xtensa/loc.d
+@@ -0,0 +1,10 @@
++#as:
++#objdump: -r
++#name: .loc directive relocs
++
++.*: +file format .*xtensa.*
++
++RELOCATION RECORDS FOR \[\.debug_line\]:
++#...
++.*R_XTENSA_DIFF16.*\.text\+0x00009c42
++#...
+diff --git a/gas/testsuite/gas/xtensa/loc.s b/gas/testsuite/gas/xtensa/loc.s
+new file mode 100644
+index 0000000..029e14e
+--- /dev/null
++++ b/gas/testsuite/gas/xtensa/loc.s
+@@ -0,0 +1,7 @@
++	.text
++	.file 1 "loc.s"
++	.loc 1 3
++	nop
++	.space 40000
++	.loc 1 5
++	nop
+-- 
+2.4.3
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 07574e4..a532283 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -28,6 +28,9 @@ choice
 	config BR2_BINUTILS_VERSION_2_25_X
 		bool "binutils 2.25.1"
 
+	config BR2_BINUTILS_VERSION_2_26_X
+		bool "binutils 2.26"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -36,6 +39,7 @@ config BR2_BINUTILS_VERSION
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_X
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
+	default "2.26"		if BR2_BINUTILS_VERSION_2_26_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 4af5498..387714d 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -3,5 +3,6 @@ sha512  ffe8ef263ef99183e8cc823fe8487ff7d0f7bf9a8efd2853b5f4636aca0023850d13de4e
 sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0a4ba38c43d2434da007137780cfe674de5414be5cf7ce7fbc6af6d16  binutils-2.23.2.tar.bz2
 sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
 sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
+sha512  e77e1b8dbbcbaf9ac2fae95c4403615808af3be03b2e1d32448cd3a7d32c43273f8bcace3f2de84ec120a982879295673029da306e2885dbf5f990584932cfc7  binutils-2.26.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
 none   xxx  binutils-arc-2015.12.tar.gz
