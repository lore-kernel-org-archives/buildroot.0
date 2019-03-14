From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:18:21 +0100
Subject: [Buildroot] [git commit] package/binutils: remove version 2.28
Message-ID: <20190314211546.1688D8EEE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc5d95154e030becb8a5ada0f0876aa4ec4f0295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |   8 +
 package/binutils/2.28.1/0120-sh-conf.patch         |  46 ----
 ...a-fix-memory-corruption-by-broken-sysregs.patch |  42 ---
 package/binutils/2.28.1/0300-ld-makefile.patch     |  41 ---
 .../2.28.1/0301-check-ldrunpath-length.patch       |  36 ---
 .../0500-add-sysroot-fix-from-bug-3049.patch       |  48 ----
 .../2.28.1/0600-poison-system-directories.patch    | 306 ---------------------
 .../binutils/2.28.1/0906-microblaze-pr21180.patch  |  33 ---
 package/binutils/Config.in.host                    |   6 -
 package/binutils/binutils.hash                     |   1 -
 10 files changed, 8 insertions(+), 559 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 93e50f3f60..089fc9539a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2019.05"
 
+config BR2_BINUTILS_VERSION_2_28_X
+	bool "binutils version 2.28 support removed"
+	select BR2_LEGACY
+	help
+	  Support for binutils version 2.28 has been removed. The
+	  current default version (2.31 or later) has been selected
+	  instead.
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
 	bool "gst-plugins-bad apexsink option removed"
 	select BR2_LEGACY
diff --git a/package/binutils/2.28.1/0120-sh-conf.patch b/package/binutils/2.28.1/0120-sh-conf.patch
deleted file mode 100644
index f77599835f..0000000000
--- a/package/binutils/2.28.1/0120-sh-conf.patch
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
-@@ -3943,7 +3943,7 @@ case "${target}" in
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
-@@ -1279,7 +1279,7 @@ case "${target}" in
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
diff --git a/package/binutils/2.28.1/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch b/package/binutils/2.28.1/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch
deleted file mode 100644
index 30103ee05e..0000000000
--- a/package/binutils/2.28.1/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch
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
diff --git a/package/binutils/2.28.1/0300-ld-makefile.patch b/package/binutils/2.28.1/0300-ld-makefile.patch
deleted file mode 100644
index 6710195798..0000000000
--- a/package/binutils/2.28.1/0300-ld-makefile.patch
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
-@@ -452,7 +452,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
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
diff --git a/package/binutils/2.28.1/0301-check-ldrunpath-length.patch b/package/binutils/2.28.1/0301-check-ldrunpath-length.patch
deleted file mode 100644
index 8d673dcfc5..0000000000
--- a/package/binutils/2.28.1/0301-check-ldrunpath-length.patch
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
-@@ -1411,6 +1411,8 @@ fragment <<EOF
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+	      	lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1692,6 +1694,8 @@ gld${EMULATION_NAME}_before_allocation (void)
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
diff --git a/package/binutils/2.28.1/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.28.1/0500-add-sysroot-fix-from-bug-3049.patch
deleted file mode 100644
index 0331088666..0000000000
--- a/package/binutils/2.28.1/0500-add-sysroot-fix-from-bug-3049.patch
+++ /dev/null
@@ -1,48 +0,0 @@
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
-diff --git a/ld/ldfile.c diff --git b/ld/ldfile.c
---- a/ld/ldfile.c	2017-03-02 03:23:54.000000000 -0500
-+++ b/ld/ldfile.c	2017-03-20 09:52:27.687415942 -0400
-@@ -336,18 +336,24 @@
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
-
diff --git a/package/binutils/2.28.1/0600-poison-system-directories.patch b/package/binutils/2.28.1/0600-poison-system-directories.patch
deleted file mode 100644
index bb1a7b438c..0000000000
--- a/package/binutils/2.28.1/0600-poison-system-directories.patch
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
-@@ -17,6 +17,9 @@
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
-@@ -789,6 +789,7 @@ with_lib_path
- enable_targets
- enable_64_bit_bfd
- with_sysroot
-+enable_poison_system_directories
- enable_gold
- enable_got
- enable_compressed_debug_sections
-@@ -1446,6 +1447,8 @@ Optional Features:
-   --disable-largefile     omit support for large files
-   --enable-targets        alternative target configurations
-   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
-+  --enable-poison-system-directories
-+                          warn for use of native system library directories
-   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
-   --enable-got=<type>     GOT handling scheme (target, single, negative,
-                           multigot)
-@@ -15499,7 +15502,18 @@ else
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
-@@ -172,6 +172,14 @@ typedef struct {
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
-@@ -2403,6 +2403,18 @@ string identifying the original linked file does not change.
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
-@@ -146,6 +146,8 @@ enum option_values
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
-@@ -270,6 +270,8 @@ main (int argc, char **argv)
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
-@@ -535,6 +535,14 @@ static const struct ld_option ld_options[] =
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
-@@ -547,6 +555,7 @@ parse_args (unsigned argc, char **argv)
-   int ingroup = 0;
-   char *default_dirlist = NULL;
-   char *shortopts;
-+  char *BR_paranoid_env;
-   struct option *longopts;
-   struct option *really_longopts;
-   int last_optind;
-@@ -1528,6 +1537,14 @@ parse_args (unsigned argc, char **argv)
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
-@@ -1571,6 +1588,10 @@ parse_args (unsigned argc, char **argv)
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
diff --git a/package/binutils/2.28.1/0906-microblaze-pr21180.patch b/package/binutils/2.28.1/0906-microblaze-pr21180.patch
deleted file mode 100644
index 52ac4fdd13..0000000000
--- a/package/binutils/2.28.1/0906-microblaze-pr21180.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Fix ld segfault for microblaze when --gc-sections is used
-Upstream: pending
-https://sourceware.org/bugzilla/show_bug.cgi?id=21180
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur a/bfd/elf32-microblaze.c b/bfd/elf32-microblaze.c
---- a/bfd/elf32-microblaze.c	2016-08-03 09:36:50.000000000 +0200
-+++ b/bfd/elf32-microblaze.c	2017-02-23 19:43:12.612313590 +0100
-@@ -3233,13 +3233,20 @@
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
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index ec1e0d8dd7..9fb8857c3c 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -13,11 +13,6 @@ choice
 	help
 	  Select the version of binutils you wish to use.
 
-config BR2_BINUTILS_VERSION_2_28_X
-	bool "binutils 2.28.1"
-	depends on !BR2_arc
-	depends on !BR2_riscv
-
 config BR2_BINUTILS_VERSION_2_29_X
 	bool "binutils 2.29.1"
 	depends on !BR2_riscv
@@ -39,7 +34,6 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "arc-2018.09-release"	if BR2_BINUTILS_VERSION_ARC
-	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
 	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 873e0dada4..756fa9bd89 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512	dc5b6872ae01c07c12d38f3bb7ead06effc6da3265ac872e2d9c6104304f89f85f2645b029a43f308a7938a7299b1928d385205d0a2245674a621649032a138d  binutils-2.28.1.tar.xz
 sha512  d748d22306477d60d921078804d21943248c23fca0707aac9b016a352c01c75ca69e82624ae37fb0bbd03af3b17088a94f60dfe1a86a7ff82e18ece3c24f0fd0  binutils-2.29.1.tar.xz
 sha512  e747ea20d8d79fcd21b9d9f6695059caa7189d60f19256da398e34b789fea9a133c32b192e9693b5828d27683739b0198431bf8b3e39fb3b04884cf89d9aa839  binutils-2.30.tar.xz
 sha512  0fca326feb1d5f5fe505a827b20237fe3ec9c13eaf7ec7e35847fd71184f605ba1cefe1314b1b8f8a29c0aa9d88162849ee1c1a3e70c2f7407d88339b17edb30  binutils-2.31.1.tar.xz
