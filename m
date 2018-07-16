From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 16 Jul 2018 23:30:10 +0200
Subject: [Buildroot] [PATCH] package/binutils: add binutils version 2.31
Message-ID: <20180716213010.29310-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://sourceware.org/ml/binutils/2018-07/msg00213.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/binutils/2.31/0001-sh-conf.patch           |  48 ++++
 package/binutils/2.31/0002-ld-makefile.patch       |  41 +++
 .../2.31/0003-check-ldrunpath-length.patch         |  36 +++
 .../2.31/0004-add-sysroot-fix-from-bug-3049.patch  |  51 ++++
 .../2.31/0005-poison-system-directories.patch      | 306 +++++++++++++++++++++
 ...location-where-GOT-information-is-collect.patch | 198 +++++++++++++
 ...bustness.-Return-FALSE-in-case-of-NULL-po.patch |  35 +++
 ...lobal-symbol-is-not-an-indirect-or-warnin.patch |  43 +++
 ...tion-was-still-being-generated-when-symbo.patch |  37 +++
 package/binutils/Config.in.host                    |   4 +
 package/binutils/binutils.hash                     |   1 +
 11 files changed, 800 insertions(+)
 create mode 100644 package/binutils/2.31/0001-sh-conf.patch
 create mode 100644 package/binutils/2.31/0002-ld-makefile.patch
 create mode 100644 package/binutils/2.31/0003-check-ldrunpath-length.patch
 create mode 100644 package/binutils/2.31/0004-add-sysroot-fix-from-bug-3049.patch
 create mode 100644 package/binutils/2.31/0005-poison-system-directories.patch
 create mode 100644 package/binutils/2.31/0006-Refactored-location-where-GOT-information-is-collect.patch
 create mode 100644 package/binutils/2.31/0007-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
 create mode 100644 package/binutils/2.31/0008-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
 create mode 100644 package/binutils/2.31/0009-PLT-information-was-still-being-generated-when-symbo.patch

diff --git a/package/binutils/2.31/0001-sh-conf.patch b/package/binutils/2.31/0001-sh-conf.patch
new file mode 100644
index 0000000000..9e77c12b68
--- /dev/null
+++ b/package/binutils/2.31/0001-sh-conf.patch
@@ -0,0 +1,48 @@
+From ac36af7d97d7920512068316fac6159aead97a01 Mon Sep 17 00:00:00 2001
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
+[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 462ad053066..27cb5571d0d 100755
+--- a/configure
++++ b/configure
+@@ -3855,7 +3855,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index a638f694134..2fd7bce1576 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1152,7 +1152,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.14.4
+
diff --git a/package/binutils/2.31/0002-ld-makefile.patch b/package/binutils/2.31/0002-ld-makefile.patch
new file mode 100644
index 0000000000..6893d65aa0
--- /dev/null
+++ b/package/binutils/2.31/0002-ld-makefile.patch
@@ -0,0 +1,41 @@
+From ae435bc27e1eb59e4ad571a37a144bf99dc68f55 Mon Sep 17 00:00:00 2001
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
+index d86ad0940c9..c95b0ef0252 100644
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
+index 4792b2b013c..789df2d01b9 100644
+--- a/ld/Makefile.in
++++ b/ld/Makefile.in
+@@ -563,7 +563,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ BASEDIR = $(srcdir)/..
+ BFDDIR = $(BASEDIR)/bfd
+ INCDIR = $(BASEDIR)/include
+-- 
+2.14.4
+
diff --git a/package/binutils/2.31/0003-check-ldrunpath-length.patch b/package/binutils/2.31/0003-check-ldrunpath-length.patch
new file mode 100644
index 0000000000..6cdf085422
--- /dev/null
+++ b/package/binutils/2.31/0003-check-ldrunpath-length.patch
@@ -0,0 +1,36 @@
+From a216bfcd91363a8e8c14db320a2870fff2985d78 Mon Sep 17 00:00:00 2001
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
+index 1ad9d6b6fa8..637a5d5d585 100644
+--- a/ld/emultempl/elf32.em
++++ b/ld/emultempl/elf32.em
+@@ -1471,6 +1471,8 @@ fragment <<EOF
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((path) && (strlen (path) == 0))
++	        path = NULL;
+ 	      if (path
+ 		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
+ 		break;
+@@ -1751,6 +1753,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+   rpath = command_line.rpath;
+   if (rpath == NULL)
+     rpath = (const char *) getenv ("LD_RUN_PATH");
++  if ((rpath) && (strlen (rpath) == 0))
++    rpath = NULL;
+ 
+   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
+     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
+-- 
+2.14.4
+
diff --git a/package/binutils/2.31/0004-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.31/0004-add-sysroot-fix-from-bug-3049.patch
new file mode 100644
index 0000000000..1ef1385062
--- /dev/null
+++ b/package/binutils/2.31/0004-add-sysroot-fix-from-bug-3049.patch
@@ -0,0 +1,51 @@
+From 73ecf6f6a1f327c9fa3af1fc924d152321aac801 Mon Sep 17 00:00:00 2001
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
+ ld/ldfile.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index a72ff135264..b3d166cbd60 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -338,18 +338,24 @@ ldfile_open_file_search (const char *arch,
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
+-- 
+2.14.4
+
diff --git a/package/binutils/2.31/0005-poison-system-directories.patch b/package/binutils/2.31/0005-poison-system-directories.patch
new file mode 100644
index 0000000000..90c7ac760a
--- /dev/null
+++ b/package/binutils/2.31/0005-poison-system-directories.patch
@@ -0,0 +1,306 @@
+From 7d1e6ed1d57e839207e0ece7561bd4709032de9f Mon Sep 17 00:00:00 2001
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
+ ld/ld.texi      | 12 ++++++++++++
+ ld/ldfile.c     | 17 +++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 89 insertions(+)
+
+diff --git a/ld/config.in b/ld/config.in
+index d93c9b0..5da2742 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -31,6 +31,9 @@
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
+index 300a272..d68890f 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -822,6 +822,7 @@ with_lib_path
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1486,6 +1487,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15803,7 +15806,18 @@ else
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
+index d10c553..9f1b57b 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
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
+index ba914b9..9df17da 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -180,6 +180,14 @@ typedef struct
+      in the linker script.  */
+   bfd_boolean force_group_allocation;
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
+diff --git a/ld/ld.texi b/ld/ld.texi
+index 40d79dd..137d46c 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -2479,6 +2479,18 @@ string identifying the original linked file does not change.
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
+index b3d166c..3dcbf66 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
+     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
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
+index 04d6fd5..d7df005 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -148,6 +148,8 @@ enum option_values
+   OPTION_REQUIRE_DEFINED_SYMBOL,
+   OPTION_ORPHAN_HANDLING,
+   OPTION_FORCE_GROUP_ALLOCATION,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+ };
+ 
+ /* The initial parser states.  */
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index f31eeb2..25f8497 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -268,6 +268,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = TRUE;
+   command_line.warn_search_mismatch = TRUE;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = TRUE;
++  command_line.error_poison_system_directories = FALSE;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index 86a033a..f07f095 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -543,6 +543,14 @@ static const struct ld_option ld_options[] =
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
+@@ -555,6 +563,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1543,6 +1552,14 @@ parse_args (unsigned argc, char **argv)
+ 	  }
+ 	  break;
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
+@@ -1586,6 +1603,10 @@ parse_args (unsigned argc, char **argv)
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
+2.7.4
+
diff --git a/package/binutils/2.31/0006-Refactored-location-where-GOT-information-is-collect.patch b/package/binutils/2.31/0006-Refactored-location-where-GOT-information-is-collect.patch
new file mode 100644
index 0000000000..306c65fdff
--- /dev/null
+++ b/package/binutils/2.31/0006-Refactored-location-where-GOT-information-is-collect.patch
@@ -0,0 +1,198 @@
+From d930affa2d475d1cc6792f1e6d56bef3d6c617db Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Fri, 2 Mar 2018 17:16:21 +0100
+Subject: [PATCH] Refactored location where GOT information is collected.
+
+Change location where GOT information is collected for ARC target, avoiding
+posible use conflicts of the previous .got field in the symbols hash_entry.
+
+bfd/
+2018-03-01  Cupertino Miranda  <cmiranda@synopsys.com>
+
+	* arc-got.h (get_got_entry_list_for_symbol): Changed.
+	* ef32-arc.c (struct elf_arc_link_hash_entry): Moved and changed.
+	(elf_arc_link_hash_newfunc): Changed.
+	(arc_elf_link_hash_table_create): Removed old initializations.
+	(elf_arc_relocate_section, elf_arc_finish_dynamic_symbol): Changed.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+[Romain: rebase on top of 2.31]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ bfd/arc-got.h   |  6 +++--
+ bfd/elf32-arc.c | 77 +++++++++++++++++++++++++++++++--------------------------
+ 2 files changed, 46 insertions(+), 37 deletions(-)
+
+diff --git a/bfd/arc-got.h b/bfd/arc-got.h
+index a86061bcb38..81ce88fe21a 100644
+--- a/bfd/arc-got.h
++++ b/bfd/arc-got.h
+@@ -156,9 +156,11 @@ get_got_entry_list_for_symbol (bfd *abfd,
+ 			       unsigned long r_symndx,
+ 			       struct elf_link_hash_entry *h)
+ {
+-  if (h != NULL)
++  struct elf_arc_link_hash_entry *h1 =
++    ((struct elf_arc_link_hash_entry *) h);
++  if (h1 != NULL)
+     {
+-      return &h->got.glist;
++      return &h1->got_ents;
+     }
+   else
+     {
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index a48ef0ca15f..ab84de43815 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -160,6 +160,18 @@ struct arc_relocation_data
+   const char *    symbol_name;
+ };
+ 
++/* ARC ELF linker hash entry.  */
++struct elf_arc_link_hash_entry
++{
++  struct elf_link_hash_entry root;
++
++  /* Track dynamic relocs copied for this symbol.  */
++  struct elf_dyn_relocs *dyn_relocs;
++
++  struct got_entry *got_ents;
++};
++
++
+ /* Should be included at this location due to static declarations
+    defined before this point.  */
+ #include "arc-got.h"
+@@ -281,15 +293,6 @@ struct arc_reloc_map
+   unsigned char		    elf_reloc_val;
+ };
+ 
+-/* ARC ELF linker hash entry.  */
+-struct elf_arc_link_hash_entry
+-{
+-  struct elf_link_hash_entry root;
+-
+-  /* Track dynamic relocs copied for this symbol.  */
+-  struct elf_dyn_relocs *dyn_relocs;
+-};
+-
+ /* ARC ELF linker hash table.  */
+ struct elf_arc_link_hash_table
+ {
+@@ -301,28 +304,28 @@ elf_arc_link_hash_newfunc (struct bfd_hash_entry *entry,
+ 			   struct bfd_hash_table *table,
+ 			   const char *string)
+ {
++  struct elf_arc_link_hash_entry * ret =
++    (struct elf_arc_link_hash_entry *) entry;
++
+   /* Allocate the structure if it has not already been allocated by a
+      subclass.  */
+-  if (entry == NULL)
+-    {
+-      entry = (struct bfd_hash_entry *)
+-	  bfd_hash_allocate (table,
+-			     sizeof (struct elf_arc_link_hash_entry));
+-      if (entry == NULL)
+-	return entry;
+-    }
++  if (ret == NULL)
++    ret = (struct elf_arc_link_hash_entry *)
++	bfd_hash_allocate (table, sizeof (struct elf_arc_link_hash_entry));
++  if (ret == NULL)
++    return (struct bfd_hash_entry *) ret;
+ 
+   /* Call the allocation method of the superclass.  */
+-  entry = _bfd_elf_link_hash_newfunc (entry, table, string);
+-  if (entry != NULL)
++  ret = ((struct elf_arc_link_hash_entry *)
++	 _bfd_elf_link_hash_newfunc ((struct bfd_hash_entry *) ret,
++				     table, string));
++  if (ret != NULL)
+     {
+-      struct elf_arc_link_hash_entry *eh;
+-
+-      eh = (struct elf_arc_link_hash_entry *) entry;
+-      eh->dyn_relocs = NULL;
++      ret->dyn_relocs = NULL;
++      ret->got_ents = NULL;
+     }
+ 
+-  return entry;
++  return (struct bfd_hash_entry *) ret;
+ }
+ 
+ /* Destroy an ARC ELF linker hash table.  */
+@@ -352,11 +355,6 @@ arc_elf_link_hash_table_create (bfd *abfd)
+       return NULL;
+     }
+ 
+-  ret->elf.init_got_refcount.refcount = 0;
+-  ret->elf.init_got_refcount.glist = NULL;
+-  ret->elf.init_got_offset.offset = 0;
+-  ret->elf.init_got_offset.glist = NULL;
+-
+   ret->elf.root.hash_table_free = elf_arc_link_hash_table_free;
+ 
+   return &ret->elf.root;
+@@ -1615,10 +1613,14 @@ elf_arc_relocate_section (bfd *			  output_bfd,
+ 	  while (h->root.type == bfd_link_hash_indirect
+ 		 || h->root.type == bfd_link_hash_warning)
+ 	  {
+-	    struct elf_link_hash_entry *h_old = h;
++	    struct elf_arc_link_hash_entry *ah_old =
++	      (struct elf_arc_link_hash_entry *) h;
+ 	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-	    if (h->got.glist == 0 && h_old->got.glist != h->got.glist)
+-	      h->got.glist = h_old->got.glist;
++	    struct elf_arc_link_hash_entry *ah =
++	      (struct elf_arc_link_hash_entry *) h;
++
++	    if (ah->got_ents == 0 && ah_old->got_ents != ah->got_ents)
++	      ah->got_ents = ah_old->got_ents;
+ 	  }
+ 
+ 	  /* TODO: Need to validate what was the intention.  */
+@@ -1636,6 +1638,8 @@ elf_arc_relocate_section (bfd *			  output_bfd,
+ 
+ 	      if (is_reloc_for_GOT (howto) && !bfd_link_pic (info))
+ 		{
++		  struct elf_arc_link_hash_entry *ah =
++		    (struct elf_arc_link_hash_entry *) h;
+ 		  /* TODO: Change it to use arc_do_relocation with
+ 		    ARC_32 reloc.  Try to use ADD_RELA macro.  */
+ 		  bfd_vma relocation =
+@@ -1645,8 +1649,8 @@ elf_arc_relocate_section (bfd *			  output_bfd,
+ 			 + reloc_data.sym_section->output_section->vma)
+ 		      : 0);
+ 
+-		  BFD_ASSERT (h->got.glist);
+-		  bfd_vma got_offset = h->got.glist->offset;
++		  BFD_ASSERT (ah->got_ents);
++		  bfd_vma got_offset = ah->got_ents->offset;
+ 		  bfd_put_32 (output_bfd, relocation,
+ 			      htab->sgot->contents + got_offset);
+ 		}
+@@ -1958,6 +1962,7 @@ elf_arc_check_relocs (bfd *			 abfd,
+       else /* Global one.  */
+ 	h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+ 
++
+       switch (r_type)
+ 	{
+ 	  case R_ARC_32:
+@@ -2404,7 +2409,9 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
+      create respective dynamic relocs.  */
+   /* TODO: Make function to get list and not access the list directly.  */
+   /* TODO: Move function to relocate_section create this relocs eagerly.  */
+-  create_got_dynrelocs_for_got_info (&h->got.glist,
++  struct elf_arc_link_hash_entry *ah =
++    (struct elf_arc_link_hash_entry *) h;
++  create_got_dynrelocs_for_got_info (&ah->got_ents,
+ 				     output_bfd,
+ 				     info,
+ 				     h);
+-- 
+2.14.4
+
diff --git a/package/binutils/2.31/0007-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch b/package/binutils/2.31/0007-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
new file mode 100644
index 0000000000..b6e6d202ec
--- /dev/null
+++ b/package/binutils/2.31/0007-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
@@ -0,0 +1,35 @@
+From 955176bd999fe80c5b937ab8786665079e35c387 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Fri, 2 Mar 2018 17:33:48 +0100
+Subject: [PATCH] Improved robustness. Return FALSE in case of NULL pointer.
+
+bfd/
+2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
+
+	* elf32-arc.c (elf_arc_finish_dynamic_symbol) Return FALSE in case
+	arc_htab is NULL.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+[Romain: rebase on top of 2.31]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ bfd/elf32-arc.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index ab84de43815..33fc72cff6e 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -2420,6 +2420,9 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
+     {
+       struct elf_arc_link_hash_table *arc_htab = elf_arc_hash_table (info);
+ 
++      if(arc_htab == NULL)
++	return FALSE;
++
+       if (h->dynindx == -1
+ 	  || (h->root.type != bfd_link_hash_defined
+ 	      && h->root.type != bfd_link_hash_defweak)
+-- 
+2.14.4
+
diff --git a/package/binutils/2.31/0008-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch b/package/binutils/2.31/0008-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
new file mode 100644
index 0000000000..c3558fe081
--- /dev/null
+++ b/package/binutils/2.31/0008-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
@@ -0,0 +1,43 @@
+From 9d09ce14b4eef2b56f24660fd69a44acd45128b2 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Fri, 2 Mar 2018 17:38:14 +0100
+Subject: [PATCH] Make sure global symbol is not an indirect or warning.
+
+Problem identified in the context of glibc with latest upstream binutils.
+Dynamic symbol space was being reserved but, no actual information for the
+symbol was being set. Data for the symbol was kept initialized with -1.
+No easy test case was possible to be created.
+
+bfd/
+2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
+
+	* elf32-arc.c (elf_arc_check_relocs): Changed.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+[Romain: rebase on top of 2.31]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ bfd/elf32-arc.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 33fc72cff6e..9b72c5b4f4f 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -1960,7 +1960,12 @@ elf_arc_check_relocs (bfd *			 abfd,
+       if (r_symndx < symtab_hdr->sh_info) /* Is a local symbol.  */
+ 	h = NULL;
+       else /* Global one.  */
+-	h = sym_hashes[r_symndx - symtab_hdr->sh_info];
++	{
++	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
++	  while (h->root.type == bfd_link_hash_indirect
++		 || h->root.type == bfd_link_hash_warning)
++	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++	}
+ 
+ 
+       switch (r_type)
+-- 
+2.14.4
+
diff --git a/package/binutils/2.31/0009-PLT-information-was-still-being-generated-when-symbo.patch b/package/binutils/2.31/0009-PLT-information-was-still-being-generated-when-symbo.patch
new file mode 100644
index 0000000000..60bb522e12
--- /dev/null
+++ b/package/binutils/2.31/0009-PLT-information-was-still-being-generated-when-symbo.patch
@@ -0,0 +1,37 @@
+From e4861c68067cb2166b4c2bb9c052abeb6ad9aaa1 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Fri, 2 Mar 2018 17:44:29 +0100
+Subject: [PATCH] PLT information was still being generated when symbol was
+ forced_local.
+
+A change upstream reveiled this issue, triggering an assert when linking glibc.
+
+bfd/
+2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
+
+	* elf32-arc.c (elf_arc_check_relocs): Changed.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+[Romain: rebase on top of 2.31]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ bfd/elf32-arc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 9b72c5b4f4f..b40b463d34d 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -2041,7 +2041,8 @@ elf_arc_check_relocs (bfd *			 abfd,
+ 	  if (h == NULL)
+ 	    continue;
+ 	  else
+-	    h->needs_plt = 1;
++	    if(h->forced_local == 0)
++	      h->needs_plt = 1;
+ 	}
+ 
+       /* Add info to the symbol got_entry_list.  */
+-- 
+2.14.4
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index ed4475ade9..982456332a 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -19,6 +19,9 @@ config BR2_BINUTILS_VERSION_2_29_X
 config BR2_BINUTILS_VERSION_2_30_X
 	bool "binutils 2.30"
 
+config BR2_BINUTILS_VERSION_2_31_X
+	bool "binutils 2.31"
+
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.29)"
 	depends on BR2_arc
@@ -30,6 +33,7 @@ config BR2_BINUTILS_VERSION
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
+	default "2.31"		if BR2_BINUTILS_VERSION_2_31_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index cc13686cc8..67f2a99a68 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,7 @@
 sha512	dc5b6872ae01c07c12d38f3bb7ead06effc6da3265ac872e2d9c6104304f89f85f2645b029a43f308a7938a7299b1928d385205d0a2245674a621649032a138d  binutils-2.28.1.tar.xz
 sha512  d748d22306477d60d921078804d21943248c23fca0707aac9b016a352c01c75ca69e82624ae37fb0bbd03af3b17088a94f60dfe1a86a7ff82e18ece3c24f0fd0  binutils-2.29.1.tar.xz
 sha512  e747ea20d8d79fcd21b9d9f6695059caa7189d60f19256da398e34b789fea9a133c32b192e9693b5828d27683739b0198431bf8b3e39fb3b04884cf89d9aa839  binutils-2.30.tar.xz
+sha512  3448a71c42d790569c1159c1042aa520b2d8ac8af7506fb1f2a4199dfb13b39f1c2271a5cb3a643d10c7d8a388a73f190e90503d4793a016da7893473aa1c635  binutils-2.31.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  bea88164ed48733bad63393fe702e12e651efd113aa4f3fe2e253e05c4c1e5da20b5a99333f0b5528df6d32ce806f799211c568e1916845a87999901dde28817  binutils-arc-2018.03.tar.gz
-- 
2.14.4
