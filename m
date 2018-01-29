From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 29 Jan 2018 23:39:39 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/binutils: add support for
 binutils 2.30
Message-ID: <20180129223941.9077-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All patches from binutils 2.29 are kept and slightly adapted to
differences that appeared in binutils 2.30.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/binutils/2.30/0001-sh-conf.patch           |  48 ++++
 package/binutils/2.30/0002-ld-makefile.patch       |  41 +++
 .../2.30/0003-check-ldrunpath-length.patch         |  36 +++
 .../2.30/0004-add-sysroot-fix-from-bug-3049.patch  |  51 ++++
 .../2.30/0005-poison-system-directories.patch      | 306 +++++++++++++++++++++
 ...LINKER-BUG-.rofixup-section-size-mismatch.patch |  31 +++
 package/binutils/Config.in.host                    |   4 +
 package/binutils/binutils.hash                     |   1 +
 package/binutils/binutils.mk                       |   2 +
 9 files changed, 520 insertions(+)
 create mode 100644 package/binutils/2.30/0001-sh-conf.patch
 create mode 100644 package/binutils/2.30/0002-ld-makefile.patch
 create mode 100644 package/binutils/2.30/0003-check-ldrunpath-length.patch
 create mode 100644 package/binutils/2.30/0004-add-sysroot-fix-from-bug-3049.patch
 create mode 100644 package/binutils/2.30/0005-poison-system-directories.patch
 create mode 100644 package/binutils/2.30/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch

diff --git a/package/binutils/2.30/0001-sh-conf.patch b/package/binutils/2.30/0001-sh-conf.patch
new file mode 100644
index 0000000000..80cf35b118
--- /dev/null
+++ b/package/binutils/2.30/0001-sh-conf.patch
@@ -0,0 +1,48 @@
+From b30ec72417164a2e990bc986eb0da05b7ef054fa Mon Sep 17 00:00:00 2001
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
+index 2d615a9996..18d74ab96e 100755
+--- a/configure
++++ b/configure
+@@ -3835,7 +3835,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index aae94501e4..b530e54926 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1166,7 +1166,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.14.3
+
diff --git a/package/binutils/2.30/0002-ld-makefile.patch b/package/binutils/2.30/0002-ld-makefile.patch
new file mode 100644
index 0000000000..992ffaee6c
--- /dev/null
+++ b/package/binutils/2.30/0002-ld-makefile.patch
@@ -0,0 +1,41 @@
+From bf6f72c4e3c57864417ac1f917404cc83af8ec14 Mon Sep 17 00:00:00 2001
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
+index 6243c12528..3c5d6c8202 100644
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
+index 760c037f9d..6dea692869 100644
+--- a/ld/Makefile.in
++++ b/ld/Makefile.in
+@@ -446,7 +446,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ BASEDIR = $(srcdir)/..
+ BFDDIR = $(BASEDIR)/bfd
+ INCDIR = $(BASEDIR)/include
+-- 
+2.14.3
+
diff --git a/package/binutils/2.30/0003-check-ldrunpath-length.patch b/package/binutils/2.30/0003-check-ldrunpath-length.patch
new file mode 100644
index 0000000000..7af98749da
--- /dev/null
+++ b/package/binutils/2.30/0003-check-ldrunpath-length.patch
@@ -0,0 +1,36 @@
+From c18554e56d2534cbb37d2d065d3782ce4ef2533c Mon Sep 17 00:00:00 2001
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
+index c0925fc9b9..0ce16d73a5 100644
+--- a/ld/emultempl/elf32.em
++++ b/ld/emultempl/elf32.em
+@@ -1470,6 +1470,8 @@ fragment <<EOF
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((path) && (strlen (path) == 0))
++	        path = NULL;
+ 	      if (path
+ 		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
+ 		break;
+@@ -1750,6 +1752,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+   rpath = command_line.rpath;
+   if (rpath == NULL)
+     rpath = (const char *) getenv ("LD_RUN_PATH");
++  if ((rpath) && (strlen (rpath) == 0))
++    rpath = NULL;
+ 
+   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
+     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
+-- 
+2.14.3
+
diff --git a/package/binutils/2.30/0004-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.30/0004-add-sysroot-fix-from-bug-3049.patch
new file mode 100644
index 0000000000..a110cf194f
--- /dev/null
+++ b/package/binutils/2.30/0004-add-sysroot-fix-from-bug-3049.patch
@@ -0,0 +1,51 @@
+From 20fff697c52e24700e76d64d202ad7a9228b630e Mon Sep 17 00:00:00 2001
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
+index 6532a57d96..eefc2ebefb 100644
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
+2.14.3
+
diff --git a/package/binutils/2.30/0005-poison-system-directories.patch b/package/binutils/2.30/0005-poison-system-directories.patch
new file mode 100644
index 0000000000..4007be96cf
--- /dev/null
+++ b/package/binutils/2.30/0005-poison-system-directories.patch
@@ -0,0 +1,306 @@
+From 28e0da3dede55d02eb64e015d363747772694566 Mon Sep 17 00:00:00 2001
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
+index a846743da6..df3cd5fb60 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -27,6 +27,9 @@
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
+index 066b5146c6..11e7402909 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -785,6 +785,7 @@ with_lib_path
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1444,6 +1445,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15500,7 +15503,18 @@ else
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
+index bada1b50b0..d074a3820b 100644
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
+index ba914b921e..9df17dab6c 100644
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
+diff --git a/ld/ld.texinfo b/ld/ld.texinfo
+index c89915f1aa..df430837e2 100644
+--- a/ld/ld.texinfo
++++ b/ld/ld.texinfo
+@@ -2498,6 +2498,18 @@ string identifying the original linked file does not change.
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
+index eefc2ebefb..bf7063ae8c 100644
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
+index 140ed1d9da..9965cbc04f 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -147,6 +147,8 @@ enum option_values
+   OPTION_REQUIRE_DEFINED_SYMBOL,
+   OPTION_ORPHAN_HANDLING,
+   OPTION_FORCE_GROUP_ALLOCATION,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+ };
+ 
+ /* The initial parser states.  */
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index e02fd3f1ff..5dfe9ba7e8 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -261,6 +261,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = TRUE;
+   command_line.warn_search_mismatch = TRUE;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = TRUE;
++  command_line.error_poison_system_directories = FALSE;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index f2191602d4..037a27a24a 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -538,6 +538,14 @@ static const struct ld_option ld_options[] =
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
+@@ -550,6 +558,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1534,6 +1543,14 @@ parse_args (unsigned argc, char **argv)
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
+@@ -1577,6 +1594,10 @@ parse_args (unsigned argc, char **argv)
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
+2.14.3
+
diff --git a/package/binutils/2.30/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch b/package/binutils/2.30/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
new file mode 100644
index 0000000000..0ce2cf2288
--- /dev/null
+++ b/package/binutils/2.30/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
@@ -0,0 +1,31 @@
+From c3bd478ac1b7e83765230505eb08a0acf2fe3867 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 29 Jul 2017 14:08:20 +0200
+Subject: [PATCH] Fixes: LINKER BUG: .rofixup section size mismatch
+
+Workaround from adi-toolchain commit:
+af414ec1fb628ddb1562f062f3db49823ca14ca2
+[#6798] binutils-2.21/bfd: temp workaround for rofixup mismatch errors.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ bfd/elf32-bfin.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-bfin.c b/bfd/elf32-bfin.c
+index 478b8d4731..a38519b585 100644
+--- a/bfd/elf32-bfin.c
++++ b/bfd/elf32-bfin.c
+@@ -4655,7 +4655,8 @@ bfinfdpic_check_relocs (bfd *abfd, struct bfd_link_info *info,
+ 
+ 	case R_BFIN_FUNCDESC:
+ 	  picrel->fd++;
+-	  picrel->relocsfd++;
++	  if (bfd_get_section_flags (abfd, sec) & SEC_ALLOC)
++	    picrel->relocsfd++;
+ 	  break;
+ 
+ 	/* This relocation describes the C++ object vtable hierarchy.
+-- 
+2.14.3
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 4a2992a79b..1ab3257f46 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -20,6 +20,9 @@ config BR2_BINUTILS_VERSION_2_28_X
 config BR2_BINUTILS_VERSION_2_29_X
 	bool "binutils 2.29.1"
 
+config BR2_BINUTILS_VERSION_2_30_X
+	bool "binutils 2.30"
+
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.29)"
 	depends on BR2_arc
@@ -31,6 +34,7 @@ config BR2_BINUTILS_VERSION
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
+	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index a7d4cdd453..d2ffffe9de 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,7 @@
 sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12cc842822bfc402836be86f479660cef3791aa62f3753d8a1a6f564cb  binutils-2.27.tar.bz2
 sha512	dc5b6872ae01c07c12d38f3bb7ead06effc6da3265ac872e2d9c6104304f89f85f2645b029a43f308a7938a7299b1928d385205d0a2245674a621649032a138d  binutils-2.28.1.tar.xz
 sha512  d748d22306477d60d921078804d21943248c23fca0707aac9b016a352c01c75ca69e82624ae37fb0bbd03af3b17088a94f60dfe1a86a7ff82e18ece3c24f0fd0  binutils-2.29.1.tar.xz
+sha512  e747ea20d8d79fcd21b9d9f6695059caa7189d60f19256da398e34b789fea9a133c32b192e9693b5828d27683739b0198431bf8b3e39fb3b04884cf89d9aa839  binutils-2.30.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  cefff7521dc4ebd8b9773af4f173821ad82dcb3f1fbd0bfdf03e148ba8cec1262b876b221da628ff5db16c30b18c6cbf5ffbec0fddb4677182524684c4c232c1  binutils-arc-2017.09-release.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 473fcac181..e12fb86c93 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -25,6 +25,8 @@ ifeq ($(BINUTILS_VERSION),2.28.1)
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 else ifeq ($(BINUTILS_VERSION),2.29.1)
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
+else ifeq ($(BINUTILS_VERSION),2.30)
+BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 else
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.bz2
 endif
-- 
2.14.3
