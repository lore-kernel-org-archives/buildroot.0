From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 Nov 2019 16:17:52 +0100
Subject: [Buildroot] [PATCH 3/3] package/binutils: remove version 2.30
In-Reply-To: <20191130151752.419756-1-romain.naour@gmail.com>
References: <20191130151752.419756-1-romain.naour@gmail.com>
Message-ID: <20191130151752.419756-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that binutils 2.33.1 has been introduced, and we have moved to
2.32 as the default version, it is time to drop support for binutils
2.30.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 Config.in.legacy                              |  10 +
 linux/Config.in                               |   5 -
 package/binutils/2.30/0001-sh-conf.patch      |  48 ---
 package/binutils/2.30/0002-ld-makefile.patch  |  41 ---
 .../2.30/0003-check-ldrunpath-length.patch    |  36 ---
 .../0004-add-sysroot-fix-from-bug-3049.patch  |  51 ---
 .../2.30/0005-poison-system-directories.patch | 306 ------------------
 ...ocation-where-GOT-information-is-col.patch | 197 -----------
 ...ustness.-Return-FALSE-in-case-of-NUL.patch |  34 --
 ...obal-symbol-is-not-an-indirect-or-wa.patch |  42 ---
 ...ion-was-still-being-generated-when-s.patch |  35 --
 ...s-const16-for-xtensa-loop-relaxation.patch | 294 -----------------
 package/binutils/Config.in.host               |   5 -
 package/binutils/binutils.hash                |   1 -
 package/gcc/Config.in.host                    |   3 +-
 15 files changed, 11 insertions(+), 1097 deletions(-)
 delete mode 100644 package/binutils/2.30/0001-sh-conf.patch
 delete mode 100644 package/binutils/2.30/0002-ld-makefile.patch
 delete mode 100644 package/binutils/2.30/0003-check-ldrunpath-length.patch
 delete mode 100644 package/binutils/2.30/0004-add-sysroot-fix-from-bug-3049.patch
 delete mode 100644 package/binutils/2.30/0005-poison-system-directories.patch
 delete mode 100644 package/binutils/2.30/0006-ARC-Refactored-location-where-GOT-information-is-col.patch
 delete mode 100644 package/binutils/2.30/0007-ARC-Improved-robustness.-Return-FALSE-in-case-of-NUL.patch
 delete mode 100644 package/binutils/2.30/0008-ARC-Make-sure-global-symbol-is-not-an-indirect-or-wa.patch
 delete mode 100644 package/binutils/2.30/0009-ARC-PLT-information-was-still-being-generated-when-s.patch
 delete mode 100644 package/binutils/2.30/0010-gas-use-literals-const16-for-xtensa-loop-relaxation.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 7167b1d60c..88febed684 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,16 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2020.02"
+
+config BR2_BINUTILS_VERSION_2_30_X
+	bool "binutils version 2.30 support removed"
+	select BR2_LEGACY
+	help
+	  Support for binutils version 2.30 has been removed. The
+	  current default version (2.31 or later) has been selected
+	  instead.
+
 comment "Legacy options removed in 2019.11"
 
 config BR2_PACKAGE_RPI_USERLAND_START_VCFILED
diff --git a/linux/Config.in b/linux/Config.in
index eacd53dafb..2ae850e77b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -9,11 +9,6 @@ config BR2_LINUX_KERNEL
 
 if BR2_LINUX_KERNEL
 
-# https://sourceware.org/bugzilla/show_bug.cgi?id=21458
-comment "Linux kernel in thumb mode may be broken with binutils 2.30"
-	depends on BR2_arm || BR2_armeb
-	depends on BR2_BINUTILS_VERSION_2_30_X
-
 # Packages that need to have a kernel with support for loadable modules,
 # but do not use the kernel-modules infrastructure, should select that
 # option.
diff --git a/package/binutils/2.30/0001-sh-conf.patch b/package/binutils/2.30/0001-sh-conf.patch
deleted file mode 100644
index 80cf35b118..0000000000
--- a/package/binutils/2.30/0001-sh-conf.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From b30ec72417164a2e990bc986eb0da05b7ef054fa Mon Sep 17 00:00:00 2001
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
-[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure    | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 2d615a9996..18d74ab96e 100755
---- a/configure
-+++ b/configure
-@@ -3835,7 +3835,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
-diff --git a/configure.ac b/configure.ac
-index aae94501e4..b530e54926 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1166,7 +1166,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
--- 
-2.14.3
-
diff --git a/package/binutils/2.30/0002-ld-makefile.patch b/package/binutils/2.30/0002-ld-makefile.patch
deleted file mode 100644
index 992ffaee6c..0000000000
--- a/package/binutils/2.30/0002-ld-makefile.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From bf6f72c4e3c57864417ac1f917404cc83af8ec14 Mon Sep 17 00:00:00 2001
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
-index 6243c12528..3c5d6c8202 100644
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
-index 760c037f9d..6dea692869 100644
---- a/ld/Makefile.in
-+++ b/ld/Makefile.in
-@@ -446,7 +446,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- BASEDIR = $(srcdir)/..
- BFDDIR = $(BASEDIR)/bfd
- INCDIR = $(BASEDIR)/include
--- 
-2.14.3
-
diff --git a/package/binutils/2.30/0003-check-ldrunpath-length.patch b/package/binutils/2.30/0003-check-ldrunpath-length.patch
deleted file mode 100644
index 7af98749da..0000000000
--- a/package/binutils/2.30/0003-check-ldrunpath-length.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c18554e56d2534cbb37d2d065d3782ce4ef2533c Mon Sep 17 00:00:00 2001
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
-index c0925fc9b9..0ce16d73a5 100644
---- a/ld/emultempl/elf32.em
-+++ b/ld/emultempl/elf32.em
-@@ -1470,6 +1470,8 @@ fragment <<EOF
- 	      && command_line.rpath == NULL)
- 	    {
- 	      path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((path) && (strlen (path) == 0))
-+	        path = NULL;
- 	      if (path
- 		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
- 		break;
-@@ -1750,6 +1752,8 @@ gld${EMULATION_NAME}_before_allocation (void)
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+    rpath = NULL;
- 
-   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
-     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
--- 
-2.14.3
-
diff --git a/package/binutils/2.30/0004-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.30/0004-add-sysroot-fix-from-bug-3049.patch
deleted file mode 100644
index a110cf194f..0000000000
--- a/package/binutils/2.30/0004-add-sysroot-fix-from-bug-3049.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 20fff697c52e24700e76d64d202ad7a9228b630e Mon Sep 17 00:00:00 2001
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
- ld/ldfile.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 6532a57d96..eefc2ebefb 100644
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -338,18 +338,24 @@ ldfile_open_file_search (const char *arch,
-      directory first.  */
-   if (!entry->flags.maybe_archive)
-     {
--      if (entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename))
-+     /* For absolute pathnames, try to always open the file in the
-+	 sysroot first. If this fails, try to open the file at the
-+	 given location.  */
-+     entry->flags.sysrooted = is_sysrooted_pathname (entry->filename);
-+     if (!entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename)
-+     && ld_sysroot)
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
-+      if (ldfile_try_open_bfd (entry->filename, entry))
- 	return TRUE;
- 
-       if (IS_ABSOLUTE_PATH (entry->filename))
--- 
-2.14.3
-
diff --git a/package/binutils/2.30/0005-poison-system-directories.patch b/package/binutils/2.30/0005-poison-system-directories.patch
deleted file mode 100644
index 4007be96cf..0000000000
--- a/package/binutils/2.30/0005-poison-system-directories.patch
+++ /dev/null
@@ -1,306 +0,0 @@
-From 28e0da3dede55d02eb64e015d363747772694566 Mon Sep 17 00:00:00 2001
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
-index a846743da6..df3cd5fb60 100644
---- a/ld/config.in
-+++ b/ld/config.in
-@@ -27,6 +27,9 @@
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
-index 066b5146c6..11e7402909 100755
---- a/ld/configure
-+++ b/ld/configure
-@@ -785,6 +785,7 @@ with_lib_path
- enable_targets
- enable_64_bit_bfd
- with_sysroot
-+enable_poison_system_directories
- enable_gold
- enable_got
- enable_compressed_debug_sections
-@@ -1444,6 +1445,8 @@ Optional Features:
-   --disable-largefile     omit support for large files
-   --enable-targets        alternative target configurations
-   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
-+  --enable-poison-system-directories
-+                          warn for use of native system library directories
-   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
-   --enable-got=<type>     GOT handling scheme (target, single, negative,
-                           multigot)
-@@ -15500,7 +15503,18 @@ else
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
-index bada1b50b0..d074a3820b 100644
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
-index ba914b921e..9df17dab6c 100644
---- a/ld/ld.h
-+++ b/ld/ld.h
-@@ -180,6 +180,14 @@ typedef struct
-      in the linker script.  */
-   bfd_boolean force_group_allocation;
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
-index c89915f1aa..df430837e2 100644
---- a/ld/ld.texinfo
-+++ b/ld/ld.texinfo
-@@ -2498,6 +2498,18 @@ string identifying the original linked file does not change.
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
-index eefc2ebefb..bf7063ae8c 100644
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
-     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
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
-index 140ed1d9da..9965cbc04f 100644
---- a/ld/ldlex.h
-+++ b/ld/ldlex.h
-@@ -147,6 +147,8 @@ enum option_values
-   OPTION_REQUIRE_DEFINED_SYMBOL,
-   OPTION_ORPHAN_HANDLING,
-   OPTION_FORCE_GROUP_ALLOCATION,
-+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
-+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
- };
- 
- /* The initial parser states.  */
-diff --git a/ld/ldmain.c b/ld/ldmain.c
-index e02fd3f1ff..5dfe9ba7e8 100644
---- a/ld/ldmain.c
-+++ b/ld/ldmain.c
-@@ -261,6 +261,8 @@ main (int argc, char **argv)
-   command_line.warn_mismatch = TRUE;
-   command_line.warn_search_mismatch = TRUE;
-   command_line.check_section_addresses = -1;
-+  command_line.poison_system_directories = TRUE;
-+  command_line.error_poison_system_directories = FALSE;
- 
-   /* We initialize DEMANGLING based on the environment variable
-      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-diff --git a/ld/lexsup.c b/ld/lexsup.c
-index f2191602d4..037a27a24a 100644
---- a/ld/lexsup.c
-+++ b/ld/lexsup.c
-@@ -538,6 +538,14 @@ static const struct ld_option ld_options[] =
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
-@@ -550,6 +558,7 @@ parse_args (unsigned argc, char **argv)
-   int ingroup = 0;
-   char *default_dirlist = NULL;
-   char *shortopts;
-+  char *BR_paranoid_env;
-   struct option *longopts;
-   struct option *really_longopts;
-   int last_optind;
-@@ -1534,6 +1543,14 @@ parse_args (unsigned argc, char **argv)
- 	  }
- 	  break;
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
-@@ -1577,6 +1594,10 @@ parse_args (unsigned argc, char **argv)
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
-2.14.3
-
diff --git a/package/binutils/2.30/0006-ARC-Refactored-location-where-GOT-information-is-col.patch b/package/binutils/2.30/0006-ARC-Refactored-location-where-GOT-information-is-col.patch
deleted file mode 100644
index 396f2f14f9..0000000000
--- a/package/binutils/2.30/0006-ARC-Refactored-location-where-GOT-information-is-col.patch
+++ /dev/null
@@ -1,197 +0,0 @@
-From 141346d3968bdc82d3e487f3effdc3f835a09403 Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Fri, 2 Mar 2018 17:16:21 +0100
-Subject: [PATCH] [ARC] Refactored location where GOT information is
- collected.
-
-Change location where GOT information is collected for ARC target, avoiding
-posible use conflicts of the previous .got field in the symbols hash_entry.
-
-bfd/
-2018-03-01  Cupertino Miranda  <cmiranda@synopsys.com>
-
-	* arc-got.h (get_got_entry_list_for_symbol): Changed.
-	* ef32-arc.c (struct elf_arc_link_hash_entry): Moved and changed.
-	(elf_arc_link_hash_newfunc): Changed.
-	(arc_elf_link_hash_table_create): Removed old initializations.
-	(elf_arc_relocate_section, elf_arc_finish_dynamic_symbol): Changed.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- bfd/arc-got.h   |  6 ++--
- bfd/elf32-arc.c | 77 +++++++++++++++++++++++++++----------------------
- 2 files changed, 46 insertions(+), 37 deletions(-)
-
-diff --git a/bfd/arc-got.h b/bfd/arc-got.h
-index a86061bcb38f..81ce88fe21a0 100644
---- a/bfd/arc-got.h
-+++ b/bfd/arc-got.h
-@@ -156,9 +156,11 @@ get_got_entry_list_for_symbol (bfd *abfd,
- 			       unsigned long r_symndx,
- 			       struct elf_link_hash_entry *h)
- {
--  if (h != NULL)
-+  struct elf_arc_link_hash_entry *h1 =
-+    ((struct elf_arc_link_hash_entry *) h);
-+  if (h1 != NULL)
-     {
--      return &h->got.glist;
-+      return &h1->got_ents;
-     }
-   else
-     {
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index 5921cc25259e..166a5ef604ff 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -159,6 +159,18 @@ struct arc_relocation_data
-   const char *    symbol_name;
- };
- 
-+/* ARC ELF linker hash entry.  */
-+struct elf_arc_link_hash_entry
-+{
-+  struct elf_link_hash_entry root;
-+
-+  /* Track dynamic relocs copied for this symbol.  */
-+  struct elf_dyn_relocs *dyn_relocs;
-+
-+  struct got_entry *got_ents;
-+};
-+
-+
- /* Should be included at this location due to static declarations
-  * defined before this point.  */
- #include "arc-got.h"
-@@ -275,15 +287,6 @@ struct arc_reloc_map
-   unsigned char		    elf_reloc_val;
- };
- 
--/* ARC ELF linker hash entry.  */
--struct elf_arc_link_hash_entry
--{
--  struct elf_link_hash_entry root;
--
--  /* Track dynamic relocs copied for this symbol.  */
--  struct elf_dyn_relocs *dyn_relocs;
--};
--
- /* ARC ELF linker hash table.  */
- struct elf_arc_link_hash_table
- {
-@@ -295,28 +298,28 @@ elf_arc_link_hash_newfunc (struct bfd_hash_entry *entry,
- 			   struct bfd_hash_table *table,
- 			   const char *string)
- {
-+  struct elf_arc_link_hash_entry * ret =
-+    (struct elf_arc_link_hash_entry *) entry;
-+
-   /* Allocate the structure if it has not already been allocated by a
-      subclass.  */
--  if (entry == NULL)
--    {
--      entry = (struct bfd_hash_entry *)
--	  bfd_hash_allocate (table,
--			     sizeof (struct elf_arc_link_hash_entry));
--      if (entry == NULL)
--	return entry;
--    }
-+  if (ret == NULL)
-+    ret = (struct elf_arc_link_hash_entry *)
-+	bfd_hash_allocate (table, sizeof (struct elf_arc_link_hash_entry));
-+  if (ret == NULL)
-+    return (struct bfd_hash_entry *) ret;
- 
-   /* Call the allocation method of the superclass.  */
--  entry = _bfd_elf_link_hash_newfunc (entry, table, string);
--  if (entry != NULL)
-+  ret = ((struct elf_arc_link_hash_entry *)
-+	 _bfd_elf_link_hash_newfunc ((struct bfd_hash_entry *) ret,
-+				     table, string));
-+  if (ret != NULL)
-     {
--      struct elf_arc_link_hash_entry *eh;
--
--      eh = (struct elf_arc_link_hash_entry *) entry;
--      eh->dyn_relocs = NULL;
-+      ret->dyn_relocs = NULL;
-+      ret->got_ents = NULL;
-     }
- 
--  return entry;
-+  return (struct bfd_hash_entry *) ret;
- }
- 
- /* Destroy an ARC ELF linker hash table.  */
-@@ -346,11 +349,6 @@ arc_elf_link_hash_table_create (bfd *abfd)
-       return NULL;
-     }
- 
--  ret->elf.init_got_refcount.refcount = 0;
--  ret->elf.init_got_refcount.glist = NULL;
--  ret->elf.init_got_offset.offset = 0;
--  ret->elf.init_got_offset.glist = NULL;
--
-   ret->elf.root.hash_table_free = elf_arc_link_hash_table_free;
- 
-   return &ret->elf.root;
-@@ -1598,10 +1596,14 @@ elf_arc_relocate_section (bfd *			  output_bfd,
- 	  while (h->root.type == bfd_link_hash_indirect
- 		 || h->root.type == bfd_link_hash_warning)
- 	  {
--	    struct elf_link_hash_entry *h_old = h;
-+	    struct elf_arc_link_hash_entry *ah_old =
-+	      (struct elf_arc_link_hash_entry *) h;
- 	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
--	    if (h->got.glist == 0 && h_old->got.glist != h->got.glist)
--	      h->got.glist = h_old->got.glist;
-+	    struct elf_arc_link_hash_entry *ah =
-+	      (struct elf_arc_link_hash_entry *) h;
-+
-+	    if (ah->got_ents == 0 && ah_old->got_ents != ah->got_ents)
-+	      ah->got_ents = ah_old->got_ents;
- 	  }
- 
- 	  /* TODO: Need to validate what was the intention.  */
-@@ -1619,6 +1621,8 @@ elf_arc_relocate_section (bfd *			  output_bfd,
- 
- 	      if (is_reloc_for_GOT (howto) && !bfd_link_pic (info))
- 		{
-+		  struct elf_arc_link_hash_entry *ah =
-+		    (struct elf_arc_link_hash_entry *) h;
- 		  /* TODO: Change it to use arc_do_relocation with
- 		    ARC_32 reloc.  Try to use ADD_RELA macro.  */
- 		  bfd_vma relocation =
-@@ -1628,8 +1632,8 @@ elf_arc_relocate_section (bfd *			  output_bfd,
- 			 + reloc_data.sym_section->output_section->vma)
- 		      : 0);
- 
--		  BFD_ASSERT (h->got.glist);
--		  bfd_vma got_offset = h->got.glist->offset;
-+		  BFD_ASSERT (ah->got_ents);
-+		  bfd_vma got_offset = ah->got_ents->offset;
- 		  bfd_put_32 (output_bfd, relocation,
- 			      htab->sgot->contents + got_offset);
- 		}
-@@ -1941,6 +1945,7 @@ elf_arc_check_relocs (bfd *			 abfd,
-       else /* Global one.  */
- 	h = sym_hashes[r_symndx - symtab_hdr->sh_info];
- 
-+
-       switch (r_type)
- 	{
- 	  case R_ARC_32:
-@@ -2387,7 +2392,9 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
-      create respective dynamic relocs.  */
-   /* TODO: Make function to get list and not access the list directly.  */
-   /* TODO: Move function to relocate_section create this relocs eagerly.  */
--  create_got_dynrelocs_for_got_info (&h->got.glist,
-+  struct elf_arc_link_hash_entry *ah =
-+    (struct elf_arc_link_hash_entry *) h;
-+  create_got_dynrelocs_for_got_info (&ah->got_ents,
- 				     output_bfd,
- 				     info,
- 				     h);
--- 
-2.17.1
-
diff --git a/package/binutils/2.30/0007-ARC-Improved-robustness.-Return-FALSE-in-case-of-NUL.patch b/package/binutils/2.30/0007-ARC-Improved-robustness.-Return-FALSE-in-case-of-NUL.patch
deleted file mode 100644
index 0633692cac..0000000000
--- a/package/binutils/2.30/0007-ARC-Improved-robustness.-Return-FALSE-in-case-of-NUL.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4bac50c2c94023cb1b5bf947abfb1c72eeeb12d5 Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Fri, 2 Mar 2018 17:33:48 +0100
-Subject: [PATCH] [ARC] Improved robustness. Return FALSE in case of NULL
- pointer.
-
-bfd/
-2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
-
-	* elf32-arc.c (elf_arc_finish_dynamic_symbol) Return FALSE in case
-	arc_htab is NULL.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- bfd/elf32-arc.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index 166a5ef604ff..72b808b99127 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -2403,6 +2403,9 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
-     {
-       struct elf_arc_link_hash_table *arc_htab = elf_arc_hash_table (info);
- 
-+      if(arc_htab == NULL)
-+	return FALSE;
-+
-       if (h->dynindx == -1
- 	  || (h->root.type != bfd_link_hash_defined
- 	      && h->root.type != bfd_link_hash_defweak)
--- 
-2.17.1
-
diff --git a/package/binutils/2.30/0008-ARC-Make-sure-global-symbol-is-not-an-indirect-or-wa.patch b/package/binutils/2.30/0008-ARC-Make-sure-global-symbol-is-not-an-indirect-or-wa.patch
deleted file mode 100644
index 2ffe9c9733..0000000000
--- a/package/binutils/2.30/0008-ARC-Make-sure-global-symbol-is-not-an-indirect-or-wa.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b182c9f81daa08cf18cd78af3e7aca74640e8551 Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Fri, 2 Mar 2018 17:38:14 +0100
-Subject: [PATCH] [ARC] Make sure global symbol is not an indirect or
- warning.
-
-Problem identified in the context of glibc with latest upstream binutils.
-Dynamic symbol space was being reserved but, no actual information for the
-symbol was being set. Data for the symbol was kept initialized with -1.
-No easy test case was possible to be created.
-
-bfd/
-2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
-
-	* elf32-arc.c (elf_arc_check_relocs): Changed.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- bfd/elf32-arc.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index 72b808b99127..6f6470f6f202 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -1943,7 +1943,12 @@ elf_arc_check_relocs (bfd *			 abfd,
-       if (r_symndx < symtab_hdr->sh_info) /* Is a local symbol.  */
- 	h = NULL;
-       else /* Global one.  */
--	h = sym_hashes[r_symndx - symtab_hdr->sh_info];
-+	{
-+	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
-+	  while (h->root.type == bfd_link_hash_indirect
-+		 || h->root.type == bfd_link_hash_warning)
-+	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
-+	}
- 
- 
-       switch (r_type)
--- 
-2.17.1
-
diff --git a/package/binutils/2.30/0009-ARC-PLT-information-was-still-being-generated-when-s.patch b/package/binutils/2.30/0009-ARC-PLT-information-was-still-being-generated-when-s.patch
deleted file mode 100644
index a5bcb94d11..0000000000
--- a/package/binutils/2.30/0009-ARC-PLT-information-was-still-being-generated-when-s.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e2f2d7f939435280003983ef822acd0844648643 Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Fri, 2 Mar 2018 17:44:29 +0100
-Subject: [PATCH] [ARC] PLT information was still being generated when
- symbol was forced_local.
-
-A change upstream reveiled this issue, triggering an assert when linking glibc.
-
-bfd/
-2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
-
-	* elf32-arc.c (elf_arc_check_relocs): Changed.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- bfd/elf32-arc.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index 6f6470f6f202..184957c7d750 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -2024,7 +2024,8 @@ elf_arc_check_relocs (bfd *			 abfd,
- 	  if (h == NULL)
- 	    continue;
- 	  else
--	    h->needs_plt = 1;
-+	    if(h->forced_local == 0)
-+	      h->needs_plt = 1;
- 	}
- 
-       /* Add info to the symbol got_entry_list.  */
--- 
-2.17.1
-
diff --git a/package/binutils/2.30/0010-gas-use-literals-const16-for-xtensa-loop-relaxation.patch b/package/binutils/2.30/0010-gas-use-literals-const16-for-xtensa-loop-relaxation.patch
deleted file mode 100644
index ed617bcaf7..0000000000
--- a/package/binutils/2.30/0010-gas-use-literals-const16-for-xtensa-loop-relaxation.patch
+++ /dev/null
@@ -1,294 +0,0 @@
-From 0dbdfb7918d0b0cfcb8883b24c1291574bf5bb7c Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Tue, 2 Apr 2019 14:32:42 -0700
-Subject: [PATCH] gas: use literals/const16 for xtensa loop relaxation
-
-Loop opcode relaxation that uses addi/addmi doesn't work well with other
-relaxations that may cause code movement. Instead of encoding fixed loop
-end offset in the relaxed sequence use l32r or a pair of const16 to load
-loop end address. This way the address of the loop end gets a relocation
-record and it gets updated appropriately.
-
-gas/
-2019-04-02  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* config/tc-xtensa.c (convert_frag_immed): Drop
-	convert_frag_immed_finish_loop invocation.
-	(convert_frag_immed_finish_loop): Drop declaration and
-	definition.
-	* config/xtensa-relax.c (widen_spec_list): Replace loop
-	widening that uses addi/addmi with widening that uses l32r
-	and const16.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- gas/config/tc-xtensa.c    | 120 ----------------------------------------------
- gas/config/xtensa-relax.c |  77 ++++++++++++++++++++---------
- 2 files changed, 55 insertions(+), 142 deletions(-)
-
-diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
-index 3bdbbc931cfc..0cc06361cf6f 100644
---- a/gas/config/tc-xtensa.c
-+++ b/gas/config/tc-xtensa.c
-@@ -10668,7 +10668,6 @@ convert_frag_fill_nop (fragS *fragP)
- static fixS *fix_new_exp_in_seg
-   (segT, subsegT, fragS *, int, int, expressionS *, int,
-    bfd_reloc_code_real_type);
--static void convert_frag_immed_finish_loop (segT, fragS *, TInsn *);
- 
- static void
- convert_frag_immed (segT segP,
-@@ -10910,9 +10909,6 @@ convert_frag_immed (segT segP,
- 	}
-     }
- 
--  if (expanded && xtensa_opcode_is_loop (isa, orig_tinsn.opcode) == 1)
--    convert_frag_immed_finish_loop (segP, fragP, &orig_tinsn);
--
-   if (expanded && is_direct_call_opcode (orig_tinsn.opcode))
-     {
-       /* Add an expansion note on the expanded instruction.  */
-@@ -10949,122 +10945,6 @@ fix_new_exp_in_seg (segT new_seg,
- }
- 
- 
--/* Relax a loop instruction so that it can span loop >256 bytes.
--
--                  loop    as, .L1
--          .L0:
--                  rsr     as, LEND
--                  wsr     as, LBEG
--                  addi    as, as, lo8 (label-.L1)
--                  addmi   as, as, mid8 (label-.L1)
--                  wsr     as, LEND
--                  isync
--                  rsr     as, LCOUNT
--                  addi    as, as, 1
--          .L1:
--                  <<body>>
--          label:
--*/
--
--static void
--convert_frag_immed_finish_loop (segT segP, fragS *fragP, TInsn *tinsn)
--{
--  TInsn loop_insn;
--  TInsn addi_insn;
--  TInsn addmi_insn;
--  unsigned long target;
--  static xtensa_insnbuf insnbuf = NULL;
--  unsigned int loop_length, loop_length_hi, loop_length_lo;
--  xtensa_isa isa = xtensa_default_isa;
--  addressT loop_offset;
--  addressT addi_offset = 9;
--  addressT addmi_offset = 12;
--  fragS *next_fragP;
--  int target_count;
--
--  if (!insnbuf)
--    insnbuf = xtensa_insnbuf_alloc (isa);
--
--  /* Get the loop offset.  */
--  loop_offset = get_expanded_loop_offset (tinsn->opcode);
--
--  /* Validate that there really is a LOOP at the loop_offset.  Because
--     loops are not bundleable, we can assume that the instruction will be
--     in slot 0.  */
--  tinsn_from_chars (&loop_insn, fragP->fr_opcode + loop_offset, 0);
--  tinsn_immed_from_frag (&loop_insn, fragP, 0);
--
--  gas_assert (xtensa_opcode_is_loop (isa, loop_insn.opcode) == 1);
--  addi_offset += loop_offset;
--  addmi_offset += loop_offset;
--
--  gas_assert (tinsn->ntok == 2);
--  if (tinsn->tok[1].X_op == O_constant)
--    target = tinsn->tok[1].X_add_number;
--  else if (tinsn->tok[1].X_op == O_symbol)
--    {
--      /* Find the fragment.  */
--      symbolS *sym = tinsn->tok[1].X_add_symbol;
--      gas_assert (S_GET_SEGMENT (sym) == segP
--	      || S_GET_SEGMENT (sym) == absolute_section);
--      target = (S_GET_VALUE (sym) + tinsn->tok[1].X_add_number);
--    }
--  else
--    {
--      as_bad (_("invalid expression evaluation type %d"), tinsn->tok[1].X_op);
--      target = 0;
--    }
--
--  loop_length = target - (fragP->fr_address + fragP->fr_fix);
--  loop_length_hi = loop_length & ~0x0ff;
--  loop_length_lo = loop_length & 0x0ff;
--  if (loop_length_lo >= 128)
--    {
--      loop_length_lo -= 256;
--      loop_length_hi += 256;
--    }
--
--  /* Because addmi sign-extends the immediate, 'loop_length_hi' can be at most
--     32512.  If the loop is larger than that, then we just fail.  */
--  if (loop_length_hi > 32512)
--    as_bad_where (fragP->fr_file, fragP->fr_line,
--		  _("loop too long for LOOP instruction"));
--
--  tinsn_from_chars (&addi_insn, fragP->fr_opcode + addi_offset, 0);
--  gas_assert (addi_insn.opcode == xtensa_addi_opcode);
--
--  tinsn_from_chars (&addmi_insn, fragP->fr_opcode + addmi_offset, 0);
--  gas_assert (addmi_insn.opcode == xtensa_addmi_opcode);
--
--  set_expr_const (&addi_insn.tok[2], loop_length_lo);
--  tinsn_to_insnbuf (&addi_insn, insnbuf);
--
--  fragP->tc_frag_data.is_insn = TRUE;
--  xtensa_insnbuf_to_chars
--    (isa, insnbuf, (unsigned char *) fragP->fr_opcode + addi_offset, 0);
--
--  set_expr_const (&addmi_insn.tok[2], loop_length_hi);
--  tinsn_to_insnbuf (&addmi_insn, insnbuf);
--  xtensa_insnbuf_to_chars
--    (isa, insnbuf, (unsigned char *) fragP->fr_opcode + addmi_offset, 0);
--
--  /* Walk through all of the frags from here to the loop end
--     and mark them as no_transform to keep them from being modified
--     by the linker.  If we ever have a relocation for the
--     addi/addmi of the difference of two symbols we can remove this.  */
--
--  target_count = 0;
--  for (next_fragP = fragP; next_fragP != NULL;
--       next_fragP = next_fragP->fr_next)
--    {
--      next_fragP->tc_frag_data.is_no_transform = TRUE;
--      if (next_fragP->tc_frag_data.is_loop_target)
--	target_count++;
--      if (target_count == 2)
--	break;
--    }
--}
--
- 
- /* A map that keeps information on a per-subsegment basis.  This is
-    maintained during initial assembly, but is invalid once the
-diff --git a/gas/config/xtensa-relax.c b/gas/config/xtensa-relax.c
-index cb296ed85ed2..daf15d52c259 100644
---- a/gas/config/xtensa-relax.c
-+++ b/gas/config/xtensa-relax.c
-@@ -87,13 +87,7 @@
-    when the first and second operands are not the same as specified
-    by the "| %at!=%as" precondition clause.
-    {"l32i %at,%as,%imm | %at!=%as",
--   "LITERAL %imm; l32r %at,%LITERAL; add %at,%at,%as; l32i %at,%at,0"}
--
--   There is special case for loop instructions here, but because we do
--   not currently have the ability to represent the difference of two
--   symbols, the conversion requires special code in the assembler to
--   write the operands of the addi/addmi pair representing the
--   difference of the old and new loop end label.  */
-+   "LITERAL %imm; l32r %at,%LITERAL; add %at,%at,%as; l32i %at,%at,0"}  */
- 
- #include "as.h"
- #include "xtensa-isa.h"
-@@ -306,44 +300,83 @@ static string_pattern_pair widen_spec_list[] =
-   {"l32i %at,%as,%imm | %at!=%as ? IsaUseConst16",
-    "const16 %at,HI16U(%imm); const16 %at,LOW16U(%imm); add %at,%at,%as; l32i %at,%at,0"},
- 
--  /* This is only PART of the loop instruction.  In addition,
--     hardcoded into its use is a modification of the final operand in
--     the instruction in bytes 9 and 12.  */
--  {"loop %as,%label | %as!=1 ? IsaUseLoops",
-+  /* Widening loops with literals.  */
-+  {"loop %as,%label | %as!=1 ? IsaUseLoops ? IsaUseL32R",
-+   "loop %as,%LABEL;"
-+   "rsr.lend    %as;"		/* LEND */
-+   "wsr.lbeg    %as;"		/* LBEG */
-+   "LITERAL     %label;"
-+   "l32r        %as, %LITERAL;"
-+   "nop;"
-+   "wsr.lend    %as;"
-+   "isync;"
-+   "rsr.lcount    %as;"		/* LCOUNT */
-+   "addi    %as, %as, 1;"
-+   "LABEL"},
-+  {"loopgtz %as,%label | %as!=1 ? IsaUseLoops ? IsaUseL32R",
-+   "beqz    %as,%label;"
-+   "bltz    %as,%label;"
-+   "loopgtz %as,%LABEL;"
-+   "rsr.lend    %as;"		/* LEND */
-+   "wsr.lbeg    %as;"		/* LBEG */
-+   "LITERAL     %label;"
-+   "l32r        %as, %LITERAL;"
-+   "nop;"
-+   "wsr.lend    %as;"
-+   "isync;"
-+   "rsr.lcount    %as;"		/* LCOUNT */
-+   "addi    %as, %as, 1;"
-+   "LABEL"},
-+  {"loopnez %as,%label | %as!=1 ? IsaUseLoops ? IsaUseL32R",
-+   "beqz     %as,%label;"
-+   "loopnez %as,%LABEL;"
-+   "rsr.lend    %as;"		/* LEND */
-+   "wsr.lbeg    %as;"		/* LBEG */
-+   "LITERAL     %label;"
-+   "l32r        %as, %LITERAL;"
-+   "nop;"
-+   "wsr.lend    %as;"
-+   "isync;"
-+   "rsr.lcount    %as;"		/* LCOUNT */
-+   "addi    %as, %as, 1;"
-+   "LABEL"},
-+
-+  /* Widening loops with const16.  */
-+  {"loop %as,%label | %as!=1 ? IsaUseLoops ? IsaUseConst16",
-    "loop %as,%LABEL;"
-    "rsr.lend    %as;"		/* LEND */
-    "wsr.lbeg    %as;"		/* LBEG */
--   "addi    %as, %as, 0;"	/* lo8(%label-%LABEL1) */
--   "addmi   %as, %as, 0;"	/* mid8(%label-%LABEL1) */
-+   "const16     %as,HI16U(%label);"
-+   "const16     %as,LOW16U(%label);"
-    "wsr.lend    %as;"
-    "isync;"
-    "rsr.lcount    %as;"		/* LCOUNT */
--   "addi    %as, %as, 1;"	/* density -> addi.n %as, %as, 1 */
-+   "addi    %as, %as, 1;"
-    "LABEL"},
--  {"loopgtz %as,%label | %as!=1 ? IsaUseLoops",
-+  {"loopgtz %as,%label | %as!=1 ? IsaUseLoops ? IsaUseConst16",
-    "beqz    %as,%label;"
-    "bltz    %as,%label;"
-    "loopgtz %as,%LABEL;"
-    "rsr.lend    %as;"		/* LEND */
-    "wsr.lbeg    %as;"		/* LBEG */
--   "addi    %as, %as, 0;"	/* lo8(%label-%LABEL1) */
--   "addmi   %as, %as, 0;"	/* mid8(%label-%LABEL1) */
-+   "const16     %as,HI16U(%label);"
-+   "const16     %as,LOW16U(%label);"
-    "wsr.lend    %as;"
-    "isync;"
-    "rsr.lcount    %as;"		/* LCOUNT */
--   "addi    %as, %as, 1;"	/* density -> addi.n %as, %as, 1 */
-+   "addi    %as, %as, 1;"
-    "LABEL"},
--  {"loopnez %as,%label | %as!=1 ? IsaUseLoops",
-+  {"loopnez %as,%label | %as!=1 ? IsaUseLoops ? IsaUseConst16",
-    "beqz     %as,%label;"
-    "loopnez %as,%LABEL;"
-    "rsr.lend    %as;"		/* LEND */
-    "wsr.lbeg    %as;"		/* LBEG */
--   "addi    %as, %as, 0;"	/* lo8(%label-%LABEL1) */
--   "addmi   %as, %as, 0;"	/* mid8(%label-%LABEL1) */
-+   "const16     %as,HI16U(%label);"
-+   "const16     %as,LOW16U(%label);"
-    "wsr.lend    %as;"
-    "isync;"
-    "rsr.lcount    %as;"		/* LCOUNT */
--   "addi    %as, %as, 1;"	/* density -> addi.n %as, %as, 1 */
-+   "addi    %as, %as, 1;"
-    "LABEL"},
- 
-   /* Relaxing to wide branches.  Order is important here.  With wide
--- 
-2.11.0
-
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index dbecf74606..e4530a4bb2 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -13,10 +13,6 @@ choice
 	help
 	  Select the version of binutils you wish to use.
 
-config BR2_BINUTILS_VERSION_2_30_X
-	bool "binutils 2.30"
-	depends on !BR2_csky
-
 config BR2_BINUTILS_VERSION_2_31_X
 	bool "binutils 2.31.1"
 	depends on !BR2_csky
@@ -43,7 +39,6 @@ config BR2_BINUTILS_VERSION
 	string
 	default "arc-2019.09-eng002"	if BR2_BINUTILS_VERSION_ARC
 	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
-	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
 	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
 	default "2.33.1"	if BR2_BINUTILS_VERSION_2_33_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 172d29886d..eceedfa502 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  e747ea20d8d79fcd21b9d9f6695059caa7189d60f19256da398e34b789fea9a133c32b192e9693b5828d27683739b0198431bf8b3e39fb3b04884cf89d9aa839  binutils-2.30.tar.xz
 sha512  0fca326feb1d5f5fe505a827b20237fe3ec9c13eaf7ec7e35847fd71184f605ba1cefe1314b1b8f8a29c0aa9d88162849ee1c1a3e70c2f7407d88339b17edb30  binutils-2.31.1.tar.xz
 sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
 sha512  b7a6767c6c7ca6b5cafa7080e6820b7bb3a53b7148348c438d99905defbdf0d30c9744a484ee01c9441a8153901808513366b15ba9533e20c9673c262ade36ac  binutils-2.33.1.tar.xz
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e2a4032c90..b55f8e5cb4 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -60,8 +60,7 @@ config BR2_GCC_VERSION_8_X
 config BR2_GCC_VERSION_9_X
 	bool "gcc 9.x"
 	# or1k needs binutils >= 2.32
-	depends on !(BR2_or1k && \
-		(BR2_BINUTILS_VERSION_2_30_X || BR2_BINUTILS_VERSION_2_31_X))
+	depends on !(BR2_or1k && BR2_BINUTILS_VERSION_2_31_X)
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-- 
2.23.0
