From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Dec 2014 14:59:24 +0100
Subject: [Buildroot] [git commit] binutils: add version 2.25
Message-ID: <20141224135935.E91D27FCE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=621a2a713e68edd534f906b3b58650a023485db8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/2.25/120-sh-conf.patch            |   29 ++
 .../binutils/2.25/300-001_ld_makefile_patch.patch  |   24 ++
 .../2.25/300-012_check_ldrunpath_length.patch      |   21 ++
 package/binutils/2.25/500-sysroot.patch            |   37 +++
 .../2.25/600-poison-system-directories.patch       |  276 ++++++++++++++++++++
 ...ines-search-code-for-conditional-branches.patch |   90 +++++++
 package/binutils/Config.in.host                    |    5 +
 7 files changed, 482 insertions(+), 0 deletions(-)

diff --git a/package/binutils/2.25/120-sh-conf.patch b/package/binutils/2.25/120-sh-conf.patch
new file mode 100644
index 0000000..ea3d1b6
--- /dev/null
+++ b/package/binutils/2.25/120-sh-conf.patch
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
diff --git a/package/binutils/2.25/300-001_ld_makefile_patch.patch b/package/binutils/2.25/300-001_ld_makefile_patch.patch
new file mode 100644
index 0000000..5cb0f61
--- /dev/null
+++ b/package/binutils/2.25/300-001_ld_makefile_patch.patch
@@ -0,0 +1,24 @@
+diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
+--- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
++++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
+@@ -18,7 +18,7 @@
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ 
+ EMUL = @EMUL@
+ EMULATION_OFILES = @EMULATION_OFILES@
+diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.in binutils-2.17.50.0.17/ld/Makefile.in
+--- binutils-2.17.50.0.17.oorig/ld/Makefile.in	2007-06-18 19:29:29.000000000 +0200
++++ binutils-2.17.50.0.17/ld/Makefile.in	2007-06-25 10:00:36.000000000 +0200
+@@ -287,7 +287,7 @@
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ BASEDIR = $(srcdir)/..
+ BFDDIR = $(BASEDIR)/bfd
+ INCDIR = $(BASEDIR)/include
diff --git a/package/binutils/2.25/300-012_check_ldrunpath_length.patch b/package/binutils/2.25/300-012_check_ldrunpath_length.patch
new file mode 100644
index 0000000..df78310
--- /dev/null
+++ b/package/binutils/2.25/300-012_check_ldrunpath_length.patch
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
diff --git a/package/binutils/2.25/500-sysroot.patch b/package/binutils/2.25/500-sysroot.patch
new file mode 100644
index 0000000..e49c795
--- /dev/null
+++ b/package/binutils/2.25/500-sysroot.patch
@@ -0,0 +1,37 @@
+Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
+
+Always try to prepend the sysroot prefix to absolute filenames first.
+
+http://bugs.gentoo.org/275666
+http://sourceware.org/bugzilla/show_bug.cgi?id=10340
+
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -308,18 +308,25 @@
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
diff --git a/package/binutils/2.25/600-poison-system-directories.patch b/package/binutils/2.25/600-poison-system-directories.patch
new file mode 100644
index 0000000..ec3622b
--- /dev/null
+++ b/package/binutils/2.25/600-poison-system-directories.patch
@@ -0,0 +1,276 @@
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
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
+
+diff -Nura a/ld/config.in b/ld/config.in
+--- a/ld/config.in	2014-10-14 04:32:04.000000000 -0300
++++ b/ld/config.in	2014-12-24 08:07:28.997918918 -0300
+@@ -11,6 +11,9 @@
+    language is requested. */
+ #undef ENABLE_NLS
+ 
++/* Define to warn for use of native system library directories */
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++
+ /* Additional extension a shared object might have. */
+ #undef EXTRA_SHLIB_EXTENSION
+ 
+diff -Nura a/ld/configure b/ld/configure
+--- a/ld/configure	2014-12-23 11:22:07.000000000 -0300
++++ b/ld/configure	2014-12-24 08:07:29.002919088 -0300
+@@ -783,6 +783,7 @@
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_werror
+@@ -1439,6 +1440,8 @@
+   --disable-largefile     omit support for large files
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15487,7 +15490,18 @@
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
+diff -Nura a/ld/configure.ac b/ld/configure.ac
+--- a/ld/configure.ac	2014-10-14 04:32:04.000000000 -0300
++++ b/ld/configure.ac	2014-12-24 08:07:29.002919088 -0300
+@@ -94,6 +94,16 @@
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
+diff -Nura a/ld/ldfile.c b/ld/ldfile.c
+--- a/ld/ldfile.c	2014-10-14 04:32:04.000000000 -0300
++++ b/ld/ldfile.c	2014-12-24 08:07:29.002919088 -0300
+@@ -114,6 +114,23 @@
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
+diff -Nura a/ld/ld.h b/ld/ld.h
+--- a/ld/ld.h	2014-10-14 04:32:04.000000000 -0300
++++ b/ld/ld.h	2014-12-24 08:07:29.003919122 -0300
+@@ -161,6 +161,14 @@
+   /* If TRUE we'll just print the default output on stdout.  */
+   bfd_boolean print_output_format;
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
+diff -Nura a/ld/ldlex.h b/ld/ldlex.h
+--- a/ld/ldlex.h	2014-11-04 06:54:41.000000000 -0300
++++ b/ld/ldlex.h	2014-12-24 08:09:47.477644294 -0300
+@@ -140,6 +140,8 @@
+   OPTION_IGNORE_UNRESOLVED_SYMBOL,
+   OPTION_PUSH_STATE,
+   OPTION_POP_STATE,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+ };
+ 
+ /* The initial parser states.  */
+diff -Nura a/ld/ldmain.c b/ld/ldmain.c
+--- a/ld/ldmain.c	2014-10-14 04:32:04.000000000 -0300
++++ b/ld/ldmain.c	2014-12-24 08:07:29.003919122 -0300
+@@ -266,6 +266,8 @@
+   command_line.warn_mismatch = TRUE;
+   command_line.warn_search_mismatch = TRUE;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = TRUE;
++  command_line.error_poison_system_directories = FALSE;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff -Nura a/ld/ld.texinfo b/ld/ld.texinfo
+--- a/ld/ld.texinfo	2014-12-23 05:47:10.000000000 -0300
++++ b/ld/ld.texinfo	2014-12-24 08:07:29.005919191 -0300
+@@ -2212,6 +2212,18 @@
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
+diff -Nura a/ld/lexsup.c b/ld/lexsup.c
+--- a/ld/lexsup.c	2014-11-04 06:54:41.000000000 -0300
++++ b/ld/lexsup.c	2014-12-24 08:48:50.136583414 -0300
+@@ -513,6 +513,14 @@
+   { {"pop-state", no_argument, NULL, OPTION_POP_STATE},
+     '\0', NULL, N_("Pop state of flags governing input file handling"),
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
+@@ -525,6 +533,7 @@
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1458,6 +1467,14 @@
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
+@@ -1483,6 +1500,10 @@
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
diff --git a/package/binutils/2.25/905-Fix-trampolines-search-code-for-conditional-branches.patch b/package/binutils/2.25/905-Fix-trampolines-search-code-for-conditional-branches.patch
new file mode 100644
index 0000000..8aeb064
--- /dev/null
+++ b/package/binutils/2.25/905-Fix-trampolines-search-code-for-conditional-branches.patch
@@ -0,0 +1,90 @@
+From 415480d6471e67aef97c0241d451ef2423a1da9d Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 25 Nov 2014 21:33:21 +0300
+Subject: [PATCH] Fix trampolines search code for conditional branches
+
+For conditional branches that need more than one trampoline to reach its
+target assembler couldn't always find suitable trampoline because
+post-loop condition check was placed inside the loop, resulting in
+premature loop termination. Move check outside the loop.
+
+This fixes the following build errors seen when assembling huge files
+produced by gcc:
+    Error: jump target out of range; no usable trampoline found
+    Error: operand 1 of 'j' has out of range value '307307'
+
+2014-11-25  Max Filippov  <jcmvbkbc@gmail.com>
+
+gas/
+	* config/tc-xtensa.c (search_trampolines): Move post-loop
+	condition check outside the search loop.
+
+gas/testsuite/
+	* gas/xtensa/trampoline.d: Add expected output for branches.
+	* gas/xtensa/trampoline.s: Add test case for branches.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: d92b6eece424f0ad35d96fdd85bf207295e8c4c3
+Changes to ChangeLogs are dropped.
+
+ gas/config/tc-xtensa.c                | 8 ++++----
+ gas/testsuite/gas/xtensa/trampoline.d | 9 +++++++++
+ gas/testsuite/gas/xtensa/trampoline.s | 7 +++++++
+ 3 files changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
+index d11b0c7..f23ccf8 100644
+--- a/gas/config/tc-xtensa.c
++++ b/gas/config/tc-xtensa.c
+@@ -9514,11 +9514,11 @@ search_trampolines (TInsn *tinsn, fragS *fragP, bfd_boolean unreachable_only)
+ 	      if (next_addr == 0 || addr - next_addr > J_RANGE)
+ 		break;
+ 	    }
+-	  if (abs (addr - this_addr) < J_RANGE)
+-	    return tf;
+-
+-	  return NULL;
+ 	}
++      if (abs (addr - this_addr) < J_RANGE)
++	return tf;
++
++      return NULL;
+     }
+   for ( ; tf; tf = tf->next)
+     {
+diff --git a/gas/testsuite/gas/xtensa/trampoline.d b/gas/testsuite/gas/xtensa/trampoline.d
+index b4f65dc..5ae32a6 100644
+--- a/gas/testsuite/gas/xtensa/trampoline.d
++++ b/gas/testsuite/gas/xtensa/trampoline.d
+@@ -24,3 +24,12 @@
+ .*33462:.*j.0x49407
+ #...
+ .*49407:.*j.0x49407
++.*4940a:.*beqz.n.a2,.0x4940f
++.*4940c:.*j.0x693d1
++#...
++.*693d1:.*j.0x7ddd4
++#...
++.*7ddd4:.*j.0x927f5
++#...
++.*927f5:.*j.0x927f5
++#...
+diff --git a/gas/testsuite/gas/xtensa/trampoline.s b/gas/testsuite/gas/xtensa/trampoline.s
+index 259a3bb..4465786 100644
+--- a/gas/testsuite/gas/xtensa/trampoline.s
++++ b/gas/testsuite/gas/xtensa/trampoline.s
+@@ -19,3 +19,10 @@
+ 	.endr
+ 3:
+ 	j	3b
++	bnez	a2, 4f
++	.rep	50000
++	and	a2, a2, a3
++	_ret
++	.endr
++4:
++	j	4b
+-- 
+1.8.1.4
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 45f604a..af046ae 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -26,6 +26,10 @@ choice
 		depends on !BR2_avr32 && !BR2_bfin
 		bool "binutils 2.24"
 
+	config BR2_BINUTILS_VERSION_2_25
+		depends on !BR2_avr32 && !BR2_bfin
+		bool "binutils 2.25"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -35,6 +39,7 @@ config BR2_BINUTILS_VERSION
 	default "2.22"		if BR2_BINUTILS_VERSION_2_22
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24
+	default "2.25"		if BR2_BINUTILS_VERSION_2_25
 
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
