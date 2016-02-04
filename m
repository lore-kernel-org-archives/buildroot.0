From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Thu,  4 Feb 2016 14:59:29 +0300
Subject: [Buildroot] [PATCH v2] toolchain: bump ARC toolchain components to
	arc-2015.12
Message-ID: <1454587169-10337-1-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change introduces newer ARC toolchain in Buildroot.

That new arc-2015.12 release doesn't bring any significant changes
but mostly is focused on fixes and minor improvements here and there.
Most noticeable changes are:
 * GCC: Source update to v4.8.5
 * GDB: Updated to upstream 7.10 release.

You may find more info on fixes and improvements in that release at:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2015.12

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                    |   2 +-
 .../arc-2015.12-rc1/0001-PR-other-56780.patch      | 236 -----------------
 .../600-poison-system-directories.patch            | 279 ---------------------
 .../binutils/arc-2015.12/0001-PR-other-56780.patch | 236 +++++++++++++++++
 .../600-poison-system-directories.patch            | 279 +++++++++++++++++++++
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 .../arc-2015.12-rc1/100-libstdcxx-uclibc-c99.patch | 273 --------------------
 .../gcc/arc-2015.12-rc1/851-PR-other-56780.patch   | 244 ------------------
 ...900-UPDATE-Fix-handling-complex-PIC-moves.patch | 103 --------
 ...01-UPDATE1-Fix-handling-complex-PIC-moves.patch |  83 ------
 ...950-Don-t-allow-mcompact-casesi-for-ARCv2.patch | 100 --------
 .../gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch | 273 ++++++++++++++++++++
 package/gcc/arc-2015.12/851-PR-other-56780.patch   | 244 ++++++++++++++++++
 package/gcc/gcc.hash                               |   2 +-
 package/gdb/Config.in.host                         |   2 +-
 package/gdb/gdb.hash                               |   2 +-
 18 files changed, 1039 insertions(+), 1325 deletions(-)
 delete mode 100644 package/binutils/arc-2015.12-rc1/0001-PR-other-56780.patch
 delete mode 100644 package/binutils/arc-2015.12-rc1/600-poison-system-directories.patch
 create mode 100644 package/binutils/arc-2015.12/0001-PR-other-56780.patch
 create mode 100644 package/binutils/arc-2015.12/600-poison-system-directories.patch
 delete mode 100644 package/gcc/arc-2015.12-rc1/100-libstdcxx-uclibc-c99.patch
 delete mode 100644 package/gcc/arc-2015.12-rc1/851-PR-other-56780.patch
 delete mode 100644 package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch
 delete mode 100644 package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
 delete mode 100644 package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
 create mode 100644 package/gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch
 create mode 100644 package/gcc/arc-2015.12/851-PR-other-56780.patch

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 7a04d39..df3c385 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -28,7 +28,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2015.12-rc1"	if BR2_arc
+	default "arc-2015.12"	if BR2_arc
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_X
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
diff --git a/package/binutils/arc-2015.12-rc1/0001-PR-other-56780.patch b/package/binutils/arc-2015.12-rc1/0001-PR-other-56780.patch
deleted file mode 100644
index b418a2f..0000000
--- a/package/binutils/arc-2015.12-rc1/0001-PR-other-56780.patch
+++ /dev/null
@@ -1,236 +0,0 @@
-From 7827cdf59a1894abe18aa20043a63c8c875c3fce Mon Sep 17 00:00:00 2001
-From: DJ Delorie <dj@redhat.com>
-Date: Sat, 1 Jun 2013 01:01:44 +0000
-Subject: [PATCH] PR other/56780 merge from gcc
-
-binutils-gdb upstream a4818a052efb4cea976a03a2f7cb0b38b23d12d0
-
-libiberty: fix --enable-install-libiberty flag [PR 56780]
-
-Commit 199570 fixed the --disable-install-libiberty behavior, but it also
-added a bug where the enable path never works because the initial clear
-of target_header_dir wasn't deleted.  So we end up initializing properly
-at the top only to reset it at the end all the time.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 206367 138bc75d-0d04-0410-961f-82ee72b054a4
-
-[Romain
-  rename patch name
-  squash the two upstream commits
-  Remove the ChangeLog]
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- libiberty/Makefile.in  | 24 ++++++++++-----------
- libiberty/configure    | 57 +++++++++++++++++++++++++++-----------------------
- libiberty/configure.ac | 47 ++++++++++++++++++++++-------------------
- 3 files changed, 68 insertions(+), 60 deletions(-)
-
-diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index 0a5da31..4f40c72 100644
---- a/libiberty/Makefile.in
-+++ b/libiberty/Makefile.in
-@@ -354,19 +354,19 @@ install-strip: install
- # since it will be passed the multilib flags.
- MULTIOSDIR = `$(CC) $(CFLAGS) -print-multi-os-directory`
- install_to_libdir: all
--	${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR)
--	$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n
--	( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n )
--	mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)
- 	if test -n "${target_header_dir}"; then \
--	  case "${target_header_dir}" in \
--	    /*)    thd=${target_header_dir};; \
--	    *)     thd=${includedir}/${target_header_dir};; \
--	  esac; \
--	  ${mkinstalldirs} $(DESTDIR)$${thd}; \
--	  for h in ${INSTALLED_HEADERS}; do \
--	    ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
--	  done; \
-+		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
-+		$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n; \
-+		( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n ); \
-+		mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB); \
-+		case "${target_header_dir}" in \
-+		  /*)    thd=${target_header_dir};; \
-+		  *)     thd=${includedir}/${target_header_dir};; \
-+		esac; \
-+		${mkinstalldirs} $(DESTDIR)$${thd}; \
-+		for h in ${INSTALLED_HEADERS}; do \
-+		  ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
-+		done; \
- 	fi
- 	@$(MULTIDO) $(FLAGS_TO_PASS) multi-do DO=install
- 
-diff --git a/libiberty/configure b/libiberty/configure
-index 6e98352..44d1f78 100755
---- a/libiberty/configure
-+++ b/libiberty/configure
-@@ -675,8 +675,8 @@ with_cross_host
- with_newlib
- enable_maintainer_mode
- enable_multilib
--enable_largefile
- enable_install_libiberty
-+enable_largefile
- '
-       ac_precious_vars='build_alias
- host_alias
-@@ -1303,8 +1303,8 @@ Optional Features:
-                           enable make rules and dependencies not useful
-                           (and sometimes confusing) to the casual installer
-   --enable-multilib       build many library versions (default)
-+  --enable-install-libiberty       Install headers and library for end users
-   --disable-largefile     omit support for large files
--  --enable-install-libiberty       Install headers for end users
- 
- Optional Packages:
-   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
-@@ -2784,6 +2784,35 @@ if test $cross_compiling = no && test $multilib = yes \
-    cross_compiling=maybe
- fi
- 
-+# We may wish to install the target headers somewhere.
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether to install libiberty headers and static library" >&5
-+$as_echo_n "checking whether to install libiberty headers and static library... " >&6; }
-+
-+# Check whether --enable-install-libiberty was given.
-+if test "${enable_install_libiberty+set}" = set; then :
-+  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
-+else
-+  enable_install_libiberty=no
-+fi
-+
-+# Option parsed, now set things appropriately.
-+case x"$enable_install_libiberty" in
-+  xyes|x)
-+    target_header_dir=libiberty
-+    ;;
-+  xno)
-+    target_header_dir=
-+    ;;
-+  *)
-+    # This could be sanity-checked in various ways...
-+    target_header_dir="${enable_install_libiberty}"
-+    ;;
-+esac
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $enable_install_libiberty" >&5
-+$as_echo "$enable_install_libiberty" >&6; }
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: target_header_dir = $target_header_dir" >&5
-+$as_echo "$as_me: target_header_dir = $target_header_dir" >&6;}
-+
- 
- ac_ext=c
- ac_cpp='$CPP $CPPFLAGS'
-@@ -5475,7 +5504,6 @@ fi
- 
- setobjs=
- CHECK=
--target_header_dir=
- if test -n "${with_target_subdir}"; then
- 
-   # We are being configured as a target library.  AC_REPLACE_FUNCS
-@@ -5752,29 +5780,6 @@ _ACEOF
- 
-   esac
- 
--  # We may wish to install the target headers somewhere.
--  # Check whether --enable-install-libiberty was given.
--if test "${enable_install_libiberty+set}" = set; then :
--  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
--else
--  enable_install_libiberty=no
--fi
--
--  # Option parsed, now set things appropriately.
--  case x"$enable_install_libiberty" in
--    xyes|x)
--      target_header_dir=libiberty
--      ;;
--    xno)
--      target_header_dir=
--      ;;
--    *)
--      # This could be sanity-checked in various ways...
--      target_header_dir="${enable_install_libiberty}"
--      ;;
--  esac
--
--
- else
- 
-    # Not a target library, so we set things up to run the test suite.
-diff --git a/libiberty/configure.ac b/libiberty/configure.ac
-index 754b66a..04260ec 100644
---- a/libiberty/configure.ac
-+++ b/libiberty/configure.ac
-@@ -128,6 +128,31 @@ if test $cross_compiling = no && test $multilib = yes \
-    cross_compiling=maybe
- fi
- 
-+# We may wish to install the target headers somewhere.
-+AC_MSG_CHECKING([whether to install libiberty headers and static library])
-+dnl install-libiberty is disabled by default
-+
-+AC_ARG_ENABLE(install-libiberty,
-+[  --enable-install-libiberty       Install headers and library for end users],
-+enable_install_libiberty=$enableval,
-+enable_install_libiberty=no)dnl
-+
-+# Option parsed, now set things appropriately.
-+case x"$enable_install_libiberty" in
-+  xyes|x)
-+    target_header_dir=libiberty
-+    ;;
-+  xno)   
-+    target_header_dir=
-+    ;;
-+  *) 
-+    # This could be sanity-checked in various ways...
-+    target_header_dir="${enable_install_libiberty}"
-+    ;;
-+esac
-+AC_MSG_RESULT($enable_install_libiberty)
-+AC_MSG_NOTICE([target_header_dir = $target_header_dir])
-+
- GCC_NO_EXECUTABLES
- AC_PROG_CC
- AC_SYS_LARGEFILE
-@@ -379,7 +404,6 @@ fi
- 
- setobjs=
- CHECK=
--target_header_dir=
- if test -n "${with_target_subdir}"; then
- 
-   # We are being configured as a target library.  AC_REPLACE_FUNCS
-@@ -490,27 +514,6 @@ if test -n "${with_target_subdir}"; then
- 
-   esac
- 
--  # We may wish to install the target headers somewhere.
--  AC_ARG_ENABLE(install-libiberty,
--  [  --enable-install-libiberty       Install headers for end users],
--  enable_install_libiberty=$enableval,
--  enable_install_libiberty=no)dnl
--  
--  # Option parsed, now set things appropriately.
--  case x"$enable_install_libiberty" in
--    xyes|x)
--      target_header_dir=libiberty
--      ;;
--    xno)   
--      target_header_dir=
--      ;;
--    *) 
--      # This could be sanity-checked in various ways...
--      target_header_dir="${enable_install_libiberty}"
--      ;;
--  esac
--
--
- else
- 
-    # Not a target library, so we set things up to run the test suite.
--- 
-1.9.3
-
diff --git a/package/binutils/arc-2015.12-rc1/600-poison-system-directories.patch b/package/binutils/arc-2015.12-rc1/600-poison-system-directories.patch
deleted file mode 100644
index 8a3bdc6..0000000
--- a/package/binutils/arc-2015.12-rc1/600-poison-system-directories.patch
+++ /dev/null
@@ -1,279 +0,0 @@
-Patch adapted to binutils arc-4.8-R3 and extended to use
-BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-    * configure.in (--enable-poison-system-directories): New option.
-    * configure, config.in: Regenerate.
-    * ldfile.c (ldfile_add_library_path): If
-    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
-    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: b/ld/config.in
-===================================================================
---- a/ld/config.in
-+++ b/ld/config.in
-@@ -11,6 +11,9 @@
-    language is requested. */
- #undef ENABLE_NLS
- 
-+/* Define to warn for use of native system library directories */
-+#undef ENABLE_POISON_SYSTEM_DIRECTORIES
-+
- /* Additional extension a shared object might have. */
- #undef EXTRA_SHLIB_EXTENSION
- 
-Index: b/ld/configure
-===================================================================
---- a/ld/configure
-+++ b/ld/configure
-@@ -773,6 +773,7 @@
- enable_targets
- enable_64_bit_bfd
- with_sysroot
-+enable_poison_system_directories
- enable_gold
- enable_got
- enable_werror
-@@ -1428,6 +1429,8 @@
- 			  (and sometimes confusing) to the casual installer
-   --enable-targets        alternative target configurations
-   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
-+  --enable-poison-system-directories
-+                          warn for use of native system library directories
-   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
-   --enable-got=<type>     GOT handling scheme (target, single, negative,
-                           multigot)
-@@ -4338,7 +4341,18 @@
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
-Index: b/ld/configure.in
-===================================================================
---- a/ld/configure.in
-+++ b/ld/configure.in
-@@ -70,6 +70,16 @@
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
-Index: b/ld/ldfile.c
-===================================================================
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -116,6 +116,23 @@
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
-Index: b/ld/ld.h
-===================================================================
---- a/ld/ld.h
-+++ b/ld/ld.h
-@@ -203,6 +203,14 @@
-   /* If TRUE we'll just print the default output on stdout.  */
-   bfd_boolean print_output_format;
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
-Index: b/ld/ldmain.c
-===================================================================
---- a/ld/ldmain.c
-+++ b/ld/ldmain.c
-@@ -265,6 +265,8 @@
-   command_line.warn_search_mismatch = TRUE;
-   command_line.check_section_addresses = -1;
-   command_line.disable_target_specific_optimizations = -1;
-+  command_line.poison_system_directories = TRUE;
-+  command_line.error_poison_system_directories = FALSE;
- 
-   /* We initialize DEMANGLING based on the environment variable
-      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-Index: b/ld/ld.texinfo
-===================================================================
---- a/ld/ld.texinfo
-+++ b/ld/ld.texinfo
-@@ -2156,6 +2156,18 @@
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
-Index: b/ld/lexsup.c
-===================================================================
---- a/ld/lexsup.c
-+++ b/ld/lexsup.c
-@@ -498,6 +498,14 @@
-     TWO_DASHES },
-   { {"wrap", required_argument, NULL, OPTION_WRAP},
-     '\0', N_("SYMBOL"), N_("Use wrapper functions for SYMBOL"), TWO_DASHES },
-+  { {"no-poison-system-directories", no_argument, NULL,
-+     OPTION_NO_POISON_SYSTEM_DIRECTORIES},
-+    '\0', NULL, N_("Do not warn for -L options using system directories"),
-+    TWO_DASHES },
-+  { {"error-poison-system-directories", no_argument, NULL,
-+     OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
-+    '\0', NULL, N_("Give an error for -L options using system directories"),
-+    TWO_DASHES },
- };
- 
- #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -510,6 +518,7 @@
-   int ingroup = 0;
-   char *default_dirlist = NULL;
-   char *shortopts;
-+  char *BR_paranoid_env;
-   struct option *longopts;
-   struct option *really_longopts;
-   int last_optind;
-@@ -1427,9 +1436,21 @@
-               einfo (_("%P%X: --hash-size needs a numeric argument\n"));
-           }
-           break;
-+
-+   case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
-+     command_line.poison_system_directories = FALSE;
-+     break;
-+
-+   case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
-+     command_line.error_poison_system_directories = TRUE;
-+     break;
- 	}
-     }
- 
-+  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
-+  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
-+    command_line.error_poison_system_directories = TRUE;
-+
-   while (ingroup)
-     {
-       lang_leave_group ();
-Index: b/ld/ldlex.h
-===================================================================
---- a/ld/ldlex.h
-+++ b/ld/ldlex.h
-@@ -136,6 +136,8 @@
- #endif /* ENABLE_PLUGINS */
-   OPTION_DEFAULT_SCRIPT,
-   OPTION_PRINT_OUTPUT_FORMAT,
-+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
-+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
- };
- 
- /* The initial parser states.  */
diff --git a/package/binutils/arc-2015.12/0001-PR-other-56780.patch b/package/binutils/arc-2015.12/0001-PR-other-56780.patch
new file mode 100644
index 0000000..b418a2f
--- /dev/null
+++ b/package/binutils/arc-2015.12/0001-PR-other-56780.patch
@@ -0,0 +1,236 @@
+From 7827cdf59a1894abe18aa20043a63c8c875c3fce Mon Sep 17 00:00:00 2001
+From: DJ Delorie <dj@redhat.com>
+Date: Sat, 1 Jun 2013 01:01:44 +0000
+Subject: [PATCH] PR other/56780 merge from gcc
+
+binutils-gdb upstream a4818a052efb4cea976a03a2f7cb0b38b23d12d0
+
+libiberty: fix --enable-install-libiberty flag [PR 56780]
+
+Commit 199570 fixed the --disable-install-libiberty behavior, but it also
+added a bug where the enable path never works because the initial clear
+of target_header_dir wasn't deleted.  So we end up initializing properly
+at the top only to reset it at the end all the time.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 206367 138bc75d-0d04-0410-961f-82ee72b054a4
+
+[Romain
+  rename patch name
+  squash the two upstream commits
+  Remove the ChangeLog]
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ libiberty/Makefile.in  | 24 ++++++++++-----------
+ libiberty/configure    | 57 +++++++++++++++++++++++++++-----------------------
+ libiberty/configure.ac | 47 ++++++++++++++++++++++-------------------
+ 3 files changed, 68 insertions(+), 60 deletions(-)
+
+diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
+index 0a5da31..4f40c72 100644
+--- a/libiberty/Makefile.in
++++ b/libiberty/Makefile.in
+@@ -354,19 +354,19 @@ install-strip: install
+ # since it will be passed the multilib flags.
+ MULTIOSDIR = `$(CC) $(CFLAGS) -print-multi-os-directory`
+ install_to_libdir: all
+-	${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR)
+-	$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n
+-	( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n )
+-	mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)
+ 	if test -n "${target_header_dir}"; then \
+-	  case "${target_header_dir}" in \
+-	    /*)    thd=${target_header_dir};; \
+-	    *)     thd=${includedir}/${target_header_dir};; \
+-	  esac; \
+-	  ${mkinstalldirs} $(DESTDIR)$${thd}; \
+-	  for h in ${INSTALLED_HEADERS}; do \
+-	    ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
+-	  done; \
++		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
++		$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n; \
++		( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n ); \
++		mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB); \
++		case "${target_header_dir}" in \
++		  /*)    thd=${target_header_dir};; \
++		  *)     thd=${includedir}/${target_header_dir};; \
++		esac; \
++		${mkinstalldirs} $(DESTDIR)$${thd}; \
++		for h in ${INSTALLED_HEADERS}; do \
++		  ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
++		done; \
+ 	fi
+ 	@$(MULTIDO) $(FLAGS_TO_PASS) multi-do DO=install
+ 
+diff --git a/libiberty/configure b/libiberty/configure
+index 6e98352..44d1f78 100755
+--- a/libiberty/configure
++++ b/libiberty/configure
+@@ -675,8 +675,8 @@ with_cross_host
+ with_newlib
+ enable_maintainer_mode
+ enable_multilib
+-enable_largefile
+ enable_install_libiberty
++enable_largefile
+ '
+       ac_precious_vars='build_alias
+ host_alias
+@@ -1303,8 +1303,8 @@ Optional Features:
+                           enable make rules and dependencies not useful
+                           (and sometimes confusing) to the casual installer
+   --enable-multilib       build many library versions (default)
++  --enable-install-libiberty       Install headers and library for end users
+   --disable-largefile     omit support for large files
+-  --enable-install-libiberty       Install headers for end users
+ 
+ Optional Packages:
+   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
+@@ -2784,6 +2784,35 @@ if test $cross_compiling = no && test $multilib = yes \
+    cross_compiling=maybe
+ fi
+ 
++# We may wish to install the target headers somewhere.
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether to install libiberty headers and static library" >&5
++$as_echo_n "checking whether to install libiberty headers and static library... " >&6; }
++
++# Check whether --enable-install-libiberty was given.
++if test "${enable_install_libiberty+set}" = set; then :
++  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
++else
++  enable_install_libiberty=no
++fi
++
++# Option parsed, now set things appropriately.
++case x"$enable_install_libiberty" in
++  xyes|x)
++    target_header_dir=libiberty
++    ;;
++  xno)
++    target_header_dir=
++    ;;
++  *)
++    # This could be sanity-checked in various ways...
++    target_header_dir="${enable_install_libiberty}"
++    ;;
++esac
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $enable_install_libiberty" >&5
++$as_echo "$enable_install_libiberty" >&6; }
++{ $as_echo "$as_me:${as_lineno-$LINENO}: target_header_dir = $target_header_dir" >&5
++$as_echo "$as_me: target_header_dir = $target_header_dir" >&6;}
++
+ 
+ ac_ext=c
+ ac_cpp='$CPP $CPPFLAGS'
+@@ -5475,7 +5504,6 @@ fi
+ 
+ setobjs=
+ CHECK=
+-target_header_dir=
+ if test -n "${with_target_subdir}"; then
+ 
+   # We are being configured as a target library.  AC_REPLACE_FUNCS
+@@ -5752,29 +5780,6 @@ _ACEOF
+ 
+   esac
+ 
+-  # We may wish to install the target headers somewhere.
+-  # Check whether --enable-install-libiberty was given.
+-if test "${enable_install_libiberty+set}" = set; then :
+-  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
+-else
+-  enable_install_libiberty=no
+-fi
+-
+-  # Option parsed, now set things appropriately.
+-  case x"$enable_install_libiberty" in
+-    xyes|x)
+-      target_header_dir=libiberty
+-      ;;
+-    xno)
+-      target_header_dir=
+-      ;;
+-    *)
+-      # This could be sanity-checked in various ways...
+-      target_header_dir="${enable_install_libiberty}"
+-      ;;
+-  esac
+-
+-
+ else
+ 
+    # Not a target library, so we set things up to run the test suite.
+diff --git a/libiberty/configure.ac b/libiberty/configure.ac
+index 754b66a..04260ec 100644
+--- a/libiberty/configure.ac
++++ b/libiberty/configure.ac
+@@ -128,6 +128,31 @@ if test $cross_compiling = no && test $multilib = yes \
+    cross_compiling=maybe
+ fi
+ 
++# We may wish to install the target headers somewhere.
++AC_MSG_CHECKING([whether to install libiberty headers and static library])
++dnl install-libiberty is disabled by default
++
++AC_ARG_ENABLE(install-libiberty,
++[  --enable-install-libiberty       Install headers and library for end users],
++enable_install_libiberty=$enableval,
++enable_install_libiberty=no)dnl
++
++# Option parsed, now set things appropriately.
++case x"$enable_install_libiberty" in
++  xyes|x)
++    target_header_dir=libiberty
++    ;;
++  xno)   
++    target_header_dir=
++    ;;
++  *) 
++    # This could be sanity-checked in various ways...
++    target_header_dir="${enable_install_libiberty}"
++    ;;
++esac
++AC_MSG_RESULT($enable_install_libiberty)
++AC_MSG_NOTICE([target_header_dir = $target_header_dir])
++
+ GCC_NO_EXECUTABLES
+ AC_PROG_CC
+ AC_SYS_LARGEFILE
+@@ -379,7 +404,6 @@ fi
+ 
+ setobjs=
+ CHECK=
+-target_header_dir=
+ if test -n "${with_target_subdir}"; then
+ 
+   # We are being configured as a target library.  AC_REPLACE_FUNCS
+@@ -490,27 +514,6 @@ if test -n "${with_target_subdir}"; then
+ 
+   esac
+ 
+-  # We may wish to install the target headers somewhere.
+-  AC_ARG_ENABLE(install-libiberty,
+-  [  --enable-install-libiberty       Install headers for end users],
+-  enable_install_libiberty=$enableval,
+-  enable_install_libiberty=no)dnl
+-  
+-  # Option parsed, now set things appropriately.
+-  case x"$enable_install_libiberty" in
+-    xyes|x)
+-      target_header_dir=libiberty
+-      ;;
+-    xno)   
+-      target_header_dir=
+-      ;;
+-    *) 
+-      # This could be sanity-checked in various ways...
+-      target_header_dir="${enable_install_libiberty}"
+-      ;;
+-  esac
+-
+-
+ else
+ 
+    # Not a target library, so we set things up to run the test suite.
+-- 
+1.9.3
+
diff --git a/package/binutils/arc-2015.12/600-poison-system-directories.patch b/package/binutils/arc-2015.12/600-poison-system-directories.patch
new file mode 100644
index 0000000..8a3bdc6
--- /dev/null
+++ b/package/binutils/arc-2015.12/600-poison-system-directories.patch
@@ -0,0 +1,279 @@
+Patch adapted to binutils arc-4.8-R3 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
+    * configure.in (--enable-poison-system-directories): New option.
+    * configure, config.in: Regenerate.
+    * ldfile.c (ldfile_add_library_path): If
+    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
+    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+Index: b/ld/config.in
+===================================================================
+--- a/ld/config.in
++++ b/ld/config.in
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
+Index: b/ld/configure
+===================================================================
+--- a/ld/configure
++++ b/ld/configure
+@@ -773,6 +773,7 @@
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_werror
+@@ -1428,6 +1429,8 @@
+ 			  (and sometimes confusing) to the casual installer
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -4338,7 +4341,18 @@
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
+Index: b/ld/configure.in
+===================================================================
+--- a/ld/configure.in
++++ b/ld/configure.in
+@@ -70,6 +70,16 @@
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
+Index: b/ld/ldfile.c
+===================================================================
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -116,6 +116,23 @@
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
+Index: b/ld/ld.h
+===================================================================
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -203,6 +203,14 @@
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
+Index: b/ld/ldmain.c
+===================================================================
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -265,6 +265,8 @@
+   command_line.warn_search_mismatch = TRUE;
+   command_line.check_section_addresses = -1;
+   command_line.disable_target_specific_optimizations = -1;
++  command_line.poison_system_directories = TRUE;
++  command_line.error_poison_system_directories = FALSE;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+Index: b/ld/ld.texinfo
+===================================================================
+--- a/ld/ld.texinfo
++++ b/ld/ld.texinfo
+@@ -2156,6 +2156,18 @@
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
+Index: b/ld/lexsup.c
+===================================================================
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -498,6 +498,14 @@
+     TWO_DASHES },
+   { {"wrap", required_argument, NULL, OPTION_WRAP},
+     '\0', N_("SYMBOL"), N_("Use wrapper functions for SYMBOL"), TWO_DASHES },
++  { {"no-poison-system-directories", no_argument, NULL,
++     OPTION_NO_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Do not warn for -L options using system directories"),
++    TWO_DASHES },
++  { {"error-poison-system-directories", no_argument, NULL,
++     OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Give an error for -L options using system directories"),
++    TWO_DASHES },
+ };
+ 
+ #define OPTION_COUNT ARRAY_SIZE (ld_options)
+@@ -510,6 +518,7 @@
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1427,9 +1436,21 @@
+               einfo (_("%P%X: --hash-size needs a numeric argument\n"));
+           }
+           break;
++
++   case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
++     command_line.poison_system_directories = FALSE;
++     break;
++
++   case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
++     command_line.error_poison_system_directories = TRUE;
++     break;
+ 	}
+     }
+ 
++  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
++  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
++    command_line.error_poison_system_directories = TRUE;
++
+   while (ingroup)
+     {
+       lang_leave_group ();
+Index: b/ld/ldlex.h
+===================================================================
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -136,6 +136,8 @@
+ #endif /* ENABLE_PLUGINS */
+   OPTION_DEFAULT_SCRIPT,
+   OPTION_PRINT_OUTPUT_FORMAT,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+ };
+ 
+ /* The initial parser states.  */
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 5d4ddb3..4af5498 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0
 sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
 sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none   xxx  binutils-arc-2015.12-rc1.tar.gz
+none   xxx  binutils-arc-2015.12.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 7c5955e..5635a09 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2015.12-rc1
+BINUTILS_VERSION = arc-2015.12
 else
 BINUTILS_VERSION = 2.24
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4184ac7..cad6896 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -114,7 +114,7 @@ config BR2_GCC_VERSION
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
 	default "5.3.0"     if BR2_GCC_VERSION_5_X
-	default "arc-2015.12-rc1" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2015.12" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2015.12-rc1/100-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2015.12-rc1/100-libstdcxx-uclibc-c99.patch
deleted file mode 100644
index 0d02ef0..0000000
--- a/package/gcc/arc-2015.12-rc1/100-libstdcxx-uclibc-c99.patch
+++ /dev/null
@@ -1,273 +0,0 @@
-Allow C99-depending features of libstdc++ with uClibc
-
-The libstdc++ code is fairly restrictive on how it checks for C99
-compatibility: it requires *complete* C99 support to enable certain
-features. For example, uClibc provides a good number of C99 features,
-but not C99 complex number support. For this reason, libstdc++
-completely disables many the standard C++ methods that can in fact
-work because uClibc provides the necessary functions.
-
-This patch is similar and highly inspired from
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393, but implemented in
-a way that doesn't involve changing the configure.ac script, as
-autoreconfiguring gcc is complicated. It simply relies on the fact
-that uClibc defines the __UCLIBC__ definition.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/libstdc++-v3/config/locale/generic/c_locale.h
-===================================================================
---- a/libstdc++-v3/config/locale/generic/c_locale.h
-+++ b/libstdc++-v3/config/locale/generic/c_locale.h
-@@ -70,7 +70,7 @@
-     __builtin_va_list __args;
-     __builtin_va_start(__args, __fmt);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
- #else
-     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-Index: b/libstdc++-v3/config/locale/gnu/c_locale.h
-===================================================================
---- a/libstdc++-v3/config/locale/gnu/c_locale.h
-+++ b/libstdc++-v3/config/locale/gnu/c_locale.h
-@@ -88,7 +88,7 @@
-     __builtin_va_list __args;
-     __builtin_va_start(__args, __fmt);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
- #else
-     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-Index: b/libstdc++-v3/include/bits/basic_string.h
-===================================================================
---- a/libstdc++-v3/include/bits/basic_string.h
-+++ b/libstdc++-v3/include/bits/basic_string.h
-@@ -2811,7 +2811,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99) \
-+#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)) \
-      && !defined(_GLIBCXX_HAVE_BROKEN_VSWPRINTF))
- 
- #include <ext/string_conversions.h>
-Index: b/libstdc++-v3/include/bits/locale_facets.tcc
-===================================================================
---- a/libstdc++-v3/include/bits/locale_facets.tcc
-+++ b/libstdc++-v3/include/bits/locale_facets.tcc
-@@ -987,7 +987,7 @@
- 	char __fbuf[16];
- 	__num_base::_S_format_float(__io, __fbuf, __mod);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 	// First try a buffer perhaps big enough (most probably sufficient
- 	// for non-ios_base::fixed outputs)
- 	int __cs_size = __max_digits * 3;
-Index: b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-===================================================================
---- a/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-+++ b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-@@ -572,7 +572,7 @@
-     {
-       const locale __loc = __io.getloc();
-       const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-       // First try a buffer perhaps big enough.
-       int __cs_size = 64;
-       char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
-Index: b/libstdc++-v3/include/c_compatibility/math.h
-===================================================================
---- a/libstdc++-v3/include/c_compatibility/math.h
-+++ b/libstdc++-v3/include/c_compatibility/math.h
-@@ -56,7 +56,7 @@
- using std::floor;
- using std::fmod;
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- using std::fpclassify;
- using std::isfinite;
- using std::isinf;
-Index: b/libstdc++-v3/include/c_compatibility/wchar.h
-===================================================================
---- a/libstdc++-v3/include/c_compatibility/wchar.h
-+++ b/libstdc++-v3/include/c_compatibility/wchar.h
-@@ -103,7 +103,7 @@
- using std::wmemset;
- using std::wcsftime;
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- using std::wcstold;
- using std::wcstoll;
- using std::wcstoull;
-Index: b/libstdc++-v3/include/c_global/cstdlib
-===================================================================
---- a/libstdc++-v3/include/c_global/cstdlib
-+++ b/libstdc++-v3/include/c_global/cstdlib
-@@ -182,7 +182,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef _Exit
- #undef llabs
-Index: b/libstdc++-v3/include/c_global/cwchar
-===================================================================
---- a/libstdc++-v3/include/c_global/cwchar
-+++ b/libstdc++-v3/include/c_global/cwchar
-@@ -232,7 +232,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef wcstold
- #undef wcstoll
-@@ -289,7 +289,7 @@
-   using std::vwscanf;
- #endif
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-   using std::wcstold;
-   using std::wcstoll;
-   using std::wcstoull;
-Index: b/libstdc++-v3/include/c_std/cstdio
-===================================================================
---- a/libstdc++-v3/include/c_std/cstdio
-+++ b/libstdc++-v3/include/c_std/cstdio
-@@ -139,7 +139,7 @@
-   using ::vsprintf;
- } // namespace std
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
-Index: b/libstdc++-v3/include/c_std/cstdlib
-===================================================================
---- a/libstdc++-v3/include/c_std/cstdlib
-+++ b/libstdc++-v3/include/c_std/cstdlib
-@@ -180,7 +180,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef _Exit
- #undef llabs
-Index: b/libstdc++-v3/include/c_std/cwchar
-===================================================================
---- a/libstdc++-v3/include/c_std/cwchar
-+++ b/libstdc++-v3/include/c_std/cwchar
-@@ -228,7 +228,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef wcstold
- #undef wcstoll
-Index: b/libstdc++-v3/include/ext/vstring.h
-===================================================================
---- a/libstdc++-v3/include/ext/vstring.h
-+++ b/libstdc++-v3/include/ext/vstring.h
-@@ -2571,7 +2571,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99))
-+#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)))
- 
- #include <ext/string_conversions.h>
- 
-Index: b/libstdc++-v3/include/tr1/cstdio
-===================================================================
---- a/libstdc++-v3/include/tr1/cstdio
-+++ b/libstdc++-v3/include/tr1/cstdio
-@@ -33,7 +33,7 @@
- 
- #include <cstdio>
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- namespace std _GLIBCXX_VISIBILITY(default)
- {
-Index: b/libstdc++-v3/include/tr1/cstdlib
-===================================================================
---- a/libstdc++-v3/include/tr1/cstdlib
-+++ b/libstdc++-v3/include/tr1/cstdlib
-@@ -35,7 +35,7 @@
- 
- #if _GLIBCXX_HOSTED
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- namespace std _GLIBCXX_VISIBILITY(default)
- {
-Index: b/libstdc++-v3/include/tr1/cwchar
-===================================================================
---- a/libstdc++-v3/include/tr1/cwchar
-+++ b/libstdc++-v3/include/tr1/cwchar
-@@ -52,7 +52,7 @@
-   using std::vwscanf;
- #endif
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-   using std::wcstold;
-   using std::wcstoll;
-   using std::wcstoull;
-Index: b/libstdc++-v3/include/tr1/stdlib.h
-===================================================================
---- a/libstdc++-v3/include/tr1/stdlib.h
-+++ b/libstdc++-v3/include/tr1/stdlib.h
-@@ -33,7 +33,7 @@
- 
- #if _GLIBCXX_HOSTED
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- using std::tr1::atoll;
- using std::tr1::strtoll;
-Index: b/libstdc++-v3/src/c++11/debug.cc
-===================================================================
---- a/libstdc++-v3/src/c++11/debug.cc
-+++ b/libstdc++-v3/src/c++11/debug.cc
-@@ -787,7 +787,7 @@
- 				     int __n __attribute__ ((__unused__)), 
- 				     const char* __fmt, _Tp __s) const throw ()
-     {
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-       std::snprintf(__buf, __n, __fmt, __s);
- #else
-       std::sprintf(__buf, __fmt, __s);
-Index: b/libstdc++-v3/include/c_global/cstdio
-===================================================================
---- a/libstdc++-v3/include/c_global/cstdio
-+++ b/libstdc++-v3/include/c_global/cstdio
-@@ -138,7 +138,7 @@
-   using ::vsprintf;
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
diff --git a/package/gcc/arc-2015.12-rc1/851-PR-other-56780.patch b/package/gcc/arc-2015.12-rc1/851-PR-other-56780.patch
deleted file mode 100644
index feb4339..0000000
--- a/package/gcc/arc-2015.12-rc1/851-PR-other-56780.patch
+++ /dev/null
@@ -1,244 +0,0 @@
-From afe990251bd9b3a063f03da31a3b8d139d033bc3 Mon Sep 17 00:00:00 2001
-From: ian <ian@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Sat, 1 Jun 2013 00:20:49 +0000
-Subject: [PATCH] PR other/56780
-
-* libiberty/configure.ac: Move test for --enable-install-libiberty
-outside of the 'with_target_subdir' test so that it actually gets
-run.  Add output messages to show the test result.
-* libiberty/configure: Regenerate.
-* libiberty/Makefile.in (install_to_libdir): Place the
-installation of the libiberty library in the same guard as that
-used for the headers to prevent it being installed unless
-requested via --enable-install-libiberty.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 199570 138bc75d-0d04-0410-961f-82ee72b054a4
-
-libiberty: fix --enable-install-libiberty flag [PR 56780]
-
-Commit 199570 fixed the --disable-install-libiberty behavior, but it also
-added a bug where the enable path never works because the initial clear
-of target_header_dir wasn't deleted.  So we end up initializing properly
-at the top only to reset it at the end all the time.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 206367 138bc75d-0d04-0410-961f-82ee72b054a4
-
-[Romain
-  squash the two upstream commits
-  Remove the ChangeLog]
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- libiberty/Makefile.in  | 24 ++++++++++-----------
- libiberty/configure    | 57 +++++++++++++++++++++++++++-----------------------
- libiberty/configure.ac | 47 ++++++++++++++++++++++-------------------
- 3 files changed, 68 insertions(+), 60 deletions(-)
-
-diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index f6a3ebd..75ff82d 100644
---- a/libiberty/Makefile.in
-+++ b/libiberty/Makefile.in
-@@ -355,19 +355,19 @@ install-strip: install
- # since it will be passed the multilib flags.
- MULTIOSDIR = `$(CC) $(CFLAGS) -print-multi-os-directory`
- install_to_libdir: all
--	${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR)
--	$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n
--	( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n )
--	mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)
- 	if test -n "${target_header_dir}"; then \
--	  case "${target_header_dir}" in \
--	    /*)    thd=${target_header_dir};; \
--	    *)     thd=${includedir}/${target_header_dir};; \
--	  esac; \
--	  ${mkinstalldirs} $(DESTDIR)$${thd}; \
--	  for h in ${INSTALLED_HEADERS}; do \
--	    ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
--	  done; \
-+		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
-+		$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n; \
-+		( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n ); \
-+		mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB); \
-+		case "${target_header_dir}" in \
-+		  /*)    thd=${target_header_dir};; \
-+		  *)     thd=${includedir}/${target_header_dir};; \
-+		esac; \
-+		${mkinstalldirs} $(DESTDIR)$${thd}; \
-+		for h in ${INSTALLED_HEADERS}; do \
-+		  ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
-+		done; \
- 	fi
- 	@$(MULTIDO) $(FLAGS_TO_PASS) multi-do DO=install
- 
-diff --git a/libiberty/configure b/libiberty/configure
-index 5367027..4feb95a 100755
---- a/libiberty/configure
-+++ b/libiberty/configure
-@@ -675,8 +675,8 @@ with_cross_host
- with_newlib
- enable_maintainer_mode
- enable_multilib
--enable_largefile
- enable_install_libiberty
-+enable_largefile
- '
-       ac_precious_vars='build_alias
- host_alias
-@@ -1303,8 +1303,8 @@ Optional Features:
-                           enable make rules and dependencies not useful
-                           (and sometimes confusing) to the casual installer
-   --enable-multilib       build many library versions (default)
-+  --enable-install-libiberty       Install headers and library for end users
-   --disable-largefile     omit support for large files
--  --enable-install-libiberty       Install headers for end users
- 
- Optional Packages:
-   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
-@@ -2784,6 +2784,35 @@ if test $cross_compiling = no && test $multilib = yes \
-    cross_compiling=maybe
- fi
- 
-+# We may wish to install the target headers somewhere.
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether to install libiberty headers and static library" >&5
-+$as_echo_n "checking whether to install libiberty headers and static library... " >&6; }
-+
-+# Check whether --enable-install-libiberty was given.
-+if test "${enable_install_libiberty+set}" = set; then :
-+  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
-+else
-+  enable_install_libiberty=no
-+fi
-+
-+# Option parsed, now set things appropriately.
-+case x"$enable_install_libiberty" in
-+  xyes|x)
-+    target_header_dir=libiberty
-+    ;;
-+  xno)
-+    target_header_dir=
-+    ;;
-+  *)
-+    # This could be sanity-checked in various ways...
-+    target_header_dir="${enable_install_libiberty}"
-+    ;;
-+esac
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $enable_install_libiberty" >&5
-+$as_echo "$enable_install_libiberty" >&6; }
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: target_header_dir = $target_header_dir" >&5
-+$as_echo "$as_me: target_header_dir = $target_header_dir" >&6;}
-+
- 
- ac_ext=c
- ac_cpp='$CPP $CPPFLAGS'
-@@ -5476,7 +5505,6 @@ fi
- 
- setobjs=
- CHECK=
--target_header_dir=
- if test -n "${with_target_subdir}"; then
- 
-   # We are being configured as a target library.  AC_REPLACE_FUNCS
-@@ -5759,29 +5787,6 @@ _ACEOF
- 
-   esac
- 
--  # We may wish to install the target headers somewhere.
--  # Check whether --enable-install-libiberty was given.
--if test "${enable_install_libiberty+set}" = set; then :
--  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
--else
--  enable_install_libiberty=no
--fi
--
--  # Option parsed, now set things appropriately.
--  case x"$enable_install_libiberty" in
--    xyes|x)
--      target_header_dir=libiberty
--      ;;
--    xno)
--      target_header_dir=
--      ;;
--    *)
--      # This could be sanity-checked in various ways...
--      target_header_dir="${enable_install_libiberty}"
--      ;;
--  esac
--
--
- else
- 
-    # Not a target library, so we set things up to run the test suite.
-diff --git a/libiberty/configure.ac b/libiberty/configure.ac
-index c763894..f17e6b6 100644
---- a/libiberty/configure.ac
-+++ b/libiberty/configure.ac
-@@ -128,6 +128,31 @@ if test $cross_compiling = no && test $multilib = yes \
-    cross_compiling=maybe
- fi
- 
-+# We may wish to install the target headers somewhere.
-+AC_MSG_CHECKING([whether to install libiberty headers and static library])
-+dnl install-libiberty is disabled by default
-+
-+AC_ARG_ENABLE(install-libiberty,
-+[  --enable-install-libiberty       Install headers and library for end users],
-+enable_install_libiberty=$enableval,
-+enable_install_libiberty=no)dnl
-+
-+# Option parsed, now set things appropriately.
-+case x"$enable_install_libiberty" in
-+  xyes|x)
-+    target_header_dir=libiberty
-+    ;;
-+  xno)   
-+    target_header_dir=
-+    ;;
-+  *) 
-+    # This could be sanity-checked in various ways...
-+    target_header_dir="${enable_install_libiberty}"
-+    ;;
-+esac
-+AC_MSG_RESULT($enable_install_libiberty)
-+AC_MSG_NOTICE([target_header_dir = $target_header_dir])
-+
- GCC_NO_EXECUTABLES
- AC_PROG_CC
- AC_SYS_LARGEFILE
-@@ -380,7 +405,6 @@ fi
- 
- setobjs=
- CHECK=
--target_header_dir=
- if test -n "${with_target_subdir}"; then
- 
-   # We are being configured as a target library.  AC_REPLACE_FUNCS
-@@ -492,27 +516,6 @@ if test -n "${with_target_subdir}"; then
- 
-   esac
- 
--  # We may wish to install the target headers somewhere.
--  AC_ARG_ENABLE(install-libiberty,
--  [  --enable-install-libiberty       Install headers for end users],
--  enable_install_libiberty=$enableval,
--  enable_install_libiberty=no)dnl
--  
--  # Option parsed, now set things appropriately.
--  case x"$enable_install_libiberty" in
--    xyes|x)
--      target_header_dir=libiberty
--      ;;
--    xno)   
--      target_header_dir=
--      ;;
--    *) 
--      # This could be sanity-checked in various ways...
--      target_header_dir="${enable_install_libiberty}"
--      ;;
--  esac
--
--
- else
- 
-    # Not a target library, so we set things up to run the test suite.
--- 
-1.9.3
-
diff --git a/package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch b/package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch
deleted file mode 100644
index 48228dc..0000000
--- a/package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From b55922d45fd16f5e8fc7c3885da42b2b9b37754d Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Mon, 18 Jan 2016 16:43:18 +0100
-Subject: [PATCH] UPDATE: Fix handling complex PIC moves.
-
-fwprop is putting in the REG_EQUIV notes which are involving the
-constant pic unspecs.  Then, loop may use those notes for
-optimizations rezulting in complex patterns that are not supported by
-the current implementation. The following piece of code tries to
-convert the complex instruction in simpler ones.
-
-The fix is done in development tree: [arc-4.8-dev b55922d] 
-and will be a part of the next release of ARC GNU tools.
-Once that new release happens this patch must be removed.
-
-
-gcc/
-2016-01-18  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.c (arc_legitimize_pic_address): Handle MINUS
-	operations when doing PIC moves. Make this function static.
-	(arc_legitimate_pc_offset_p): Use
-	arc_raw_symbolic_reference_mentioned_p.
-	* config/arc/arc-protos.h (arc_legitimize_pic_address): Remove.
-
- gcc/config/arc/arc-protos.h |  1 -
- gcc/config/arc/arc.c        | 33 +++++++++++++++++++--------------
- 2 files changed, 19 insertions(+), 15 deletions(-)
-
- 	* config/arc/arc.c (arc_legitimize_pic_address): Handle complex
-diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
-index 464e0ab..5986e06 100644
---- a/gcc/config/arc/arc-protos.h
-+++ b/gcc/config/arc/arc-protos.h
-@@ -53,7 +53,6 @@ extern unsigned int arc_compute_frame_size ();
- extern bool arc_ccfsm_branch_deleted_p (void);
- extern void arc_ccfsm_record_branch_deleted (void);
- 
--extern rtx arc_legitimize_pic_address (rtx, rtx);
- void arc_asm_output_aligned_decl_local (FILE *, tree, const char *,
- 					unsigned HOST_WIDE_INT,
- 					unsigned HOST_WIDE_INT,
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index a89c8ee..f7cae9f 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -5243,19 +5243,7 @@ arc_legitimate_pc_offset_p (rtx addr)
-   if (GET_CODE (addr) != CONST)
-     return false;
-   addr = XEXP (addr, 0);
--  if (GET_CODE (addr) == PLUS)
--    {
--      if (GET_CODE (XEXP (addr, 1)) != CONST_INT)
--	return false;
--      addr = XEXP (addr, 0);
--    }
--  return (GET_CODE (addr) == UNSPEC
--	  && XVECLEN (addr, 0) == 1
--	  && (XINT (addr, 1) == ARC_UNSPEC_GOT
--	      || XINT (addr, 1) == ARC_UNSPEC_GOTOFFPC
--	      || XINT (addr, 1) == UNSPEC_TLS_GD
--	      || XINT (addr, 1) == UNSPEC_TLS_IE)
--	  && GET_CODE (XVECEXP (addr, 0, 0)) == SYMBOL_REF);
-+  return flag_pic && !arc_raw_symbolic_reference_mentioned_p (addr, false);
- }
- 
- /* Return true if ADDR is a valid pic address.
-@@ -5522,7 +5510,7 @@ arc_legitimize_tls_address (rtx addr, enum tls_model model)
-    The return value is the legitimated address.
-    If OLDX is non-zero, it is the target to assign the address to first.  */
- 
--rtx
-+static rtx
- arc_legitimize_pic_address (rtx orig, rtx oldx)
- {
-   rtx addr = orig;
-@@ -5569,6 +5557,23 @@ arc_legitimize_pic_address (rtx orig, rtx oldx)
- 	      /* Check that the unspec is one of the ones we generate?  */
- 	      return orig;
- 	    }
-+	  else if (GET_CODE (addr) == MINUS)
-+	    {
-+	      /* The same story with fwprop.  */
-+	      rtx op0 = XEXP (addr, 0);
-+	      rtx op1 = XEXP (addr, 1);
-+	      gcc_assert (oldx);
-+	      gcc_assert (GET_CODE (op1) == UNSPEC);
-+
-+	      emit_move_insn (oldx,
-+			      gen_rtx_CONST (SImode,
-+					     arc_legitimize_pic_address (op1,
-+									 NULL_RTX)));
-+	      emit_insn (gen_rtx_SET (VOIDmode, oldx,
-+				      gen_rtx_MINUS (SImode, op0, oldx)));
-+	      return oldx;
-+
-+	    }
- 	  else if (GET_CODE (addr) != PLUS)
- 	    {
- 	      /* fwprop is putting in the REG_EQUIV notes which are
--- 
-2.5.0
-
diff --git a/package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch b/package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
deleted file mode 100644
index 28cb7c1..0000000
--- a/package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From f00b0f17d6889d811468c2c77508fbea8bfc377d Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Tue, 19 Jan 2016 14:40:16 +0100
-Subject: [PATCH] UPDATE1: Fix handling complex PIC moves.
-
-The arc_legitimate_pc_offset_p condition is too lax. Updated it.
-
-The fix is done in development tree: [arc-4.8-dev f00b0f1] 
-and will be a part of the next release of ARC GNU tools.
-Once that new release happens this patch must be removed.
-
-gcc/
-2016-01-18  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.c (arc_needs_pcl_p ): New function
-	(arc_legitimate_pc_offset_p): Use arc_needs_pcl_p.
----
- gcc/config/arc/arc.c | 42 ++++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 40 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index f7cae9f..18d88a3 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -5234,6 +5234,45 @@ arc_rtx_costs (rtx x, int code, int outer_code, int opno ATTRIBUTE_UNUSED,
-     }
- }
- 
-+/* Helper used by arc_legitimate_pc_offset_p.  */
-+
-+static bool
-+arc_needs_pcl_p (rtx x)
-+{
-+  register const char *fmt;
-+  register int i, j;
-+
-+  if ((GET_CODE (x) == UNSPEC)
-+      && (XVECLEN (x, 0) == 1)
-+      && (GET_CODE (XVECEXP (x, 0, 0)) == SYMBOL_REF))
-+    switch (XINT (x, 1))
-+      {
-+      case ARC_UNSPEC_GOT:
-+      case ARC_UNSPEC_GOTOFFPC:
-+      case UNSPEC_TLS_GD:
-+      case UNSPEC_TLS_IE:
-+	return true;
-+      default:
-+	break;
-+      }
-+
-+  fmt = GET_RTX_FORMAT (GET_CODE (x));
-+  for (i = GET_RTX_LENGTH (GET_CODE (x)) - 1; i >= 0; i--)
-+    {
-+      if (fmt[i] == 'e')
-+	{
-+	  if (arc_needs_pcl_p (XEXP (x, i)))
-+	    return true;
-+	}
-+      else if (fmt[i] == 'E')
-+	for (j = XVECLEN (x, i) - 1; j >= 0; j--)
-+	  if (arc_needs_pcl_p (XVECEXP (x, i, j)))
-+	    return true;
-+    }
-+
-+  return false;
-+}
-+
- /* Return true if ADDR is an address that needs to be expressed as an
-    explicit sum of pcl + offset.  */
- 
-@@ -5242,8 +5281,7 @@ arc_legitimate_pc_offset_p (rtx addr)
- {
-   if (GET_CODE (addr) != CONST)
-     return false;
--  addr = XEXP (addr, 0);
--  return flag_pic && !arc_raw_symbolic_reference_mentioned_p (addr, false);
-+  return arc_needs_pcl_p (addr);
- }
- 
- /* Return true if ADDR is a valid pic address.
--- 
-2.5.0
-
diff --git a/package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch b/package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
deleted file mode 100644
index dc03a02..0000000
--- a/package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 09463827001a7b8094f4b9460514370a1876d908 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Wed, 20 Jan 2016 16:32:40 +0100
-Subject: [PATCH] Don't allow mcompact-casesi for ARCv2
-
-The compact casesi is not working for arcv2 processors family as it
-makes use of the add_s rx,rx,pcl instruction which is only valid for
-arc6xx and arc700 processors. Also not having this instruction makes
-no much sens to change the compact-casesi pattern to use normal add
-instructions as it nullifies the advantage of short instruction use.
-The default casesi pattern betters suits the arcv2 architecture.
-
-The fix is done in development tree: [arc-4.8-dev 0946382] 
-and will be a part of the next release of ARC GNU tools.
-Once that new release happens this patch must be removed.
-
-gcc/
-2016-01-20  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* common/config/arc/arc-common.c (arc_option_optimization_table):
-	Remove mcompact-casesi option.
-	* config/arc/arc.c (arc_override_options): Use compact-casesi only
-	for arcv1.
-	* config/arc/arc.md (casesi_load): Use short instructions.
----
- gcc/common/config/arc/arc-common.c |  1 -
- gcc/config/arc/arc.c               |  9 +++++----
- gcc/config/arc/arc.md              | 10 ++++++++--
- 3 files changed, 13 insertions(+), 7 deletions(-)
- 
- 	* config/arc/arc.c (arc_legitimize_pic_address): Handle MINUS
-diff --git a/gcc/common/config/arc/arc-common.c b/gcc/common/config/arc/arc-common.c
-index e2e36fa..310bc80 100644
---- a/gcc/common/config/arc/arc-common.c
-+++ b/gcc/common/config/arc/arc-common.c
-@@ -58,7 +58,6 @@ static const struct default_options arc_option_optimization_table[] =
-     { OPT_LEVELS_ALL, OPT_mbbit_peephole, NULL, 1 },
-     { OPT_LEVELS_SIZE, OPT_mq_class, NULL, 1 },
-     { OPT_LEVELS_SIZE, OPT_mcase_vector_pcrel, NULL, 1 },
--    { OPT_LEVELS_SIZE, OPT_mcompact_casesi, NULL, 1 },
-     { OPT_LEVELS_NONE, 0, NULL, 0 }
-   };
- 
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index 18d88a3..f828398 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -1151,6 +1151,11 @@ arc_override_options (void)
-   if (arc_size_opt_level == 3)
-     optimize_size = 1;
- 
-+  if (TARGET_V2)
-+    TARGET_COMPACT_CASESI = 0;
-+  else if (optimize_size == 1)
-+    TARGET_COMPACT_CASESI = 1;
-+
-   if (flag_pic)
-     target_flags |= MASK_NO_SDATA_SET;
- 
-@@ -1163,10 +1168,6 @@ arc_override_options (void)
-   if (!TARGET_Q_CLASS)
-     TARGET_COMPACT_CASESI = 0;
- 
--  /* For the time being don't support COMPACT_CASESI for ARCv2. */
--  if (TARGET_V2)
--    TARGET_COMPACT_CASESI = 0;
--
-   if (TARGET_COMPACT_CASESI)
-     TARGET_CASE_VECTOR_PC_RELATIVE = 1;
- 
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index bc4ac38..ba7c8bc 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -3837,14 +3837,20 @@
-   switch (GET_MODE (diff_vec))
-     {
-     case SImode:
--      return \"ld.as %0,[%1,%2]%&\";
-+      if ((which_alternative == 0) && TARGET_CODE_DENSITY)
-+       return \"ld_s.as %0,[%1,%2]%&\";
-+      else
-+       return \"ld.as %0,[%1,%2]%&\";
-     case HImode:
-       if (ADDR_DIFF_VEC_FLAGS (diff_vec).offset_unsigned)
- 	return \"ldw.as %0,[%1,%2]\";
-       return \"ldw.x.as %0,[%1,%2]\";
-     case QImode:
-       if (ADDR_DIFF_VEC_FLAGS (diff_vec).offset_unsigned)
--	return \"ldb%? %0,[%1,%2]%&\";
-+        if (which_alternative == 0)
-+	 return \"ldb_s %0,[%1,%2]%&\";
-+        else
-+	 return \"ldb %0,[%1,%2]%&\";
-       return \"ldb.x %0,[%1,%2]\";
-     default:
-       gcc_unreachable ();
--- 
-2.5.0
-
diff --git a/package/gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch
new file mode 100644
index 0000000..0d02ef0
--- /dev/null
+++ b/package/gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch
@@ -0,0 +1,273 @@
+Allow C99-depending features of libstdc++ with uClibc
+
+The libstdc++ code is fairly restrictive on how it checks for C99
+compatibility: it requires *complete* C99 support to enable certain
+features. For example, uClibc provides a good number of C99 features,
+but not C99 complex number support. For this reason, libstdc++
+completely disables many the standard C++ methods that can in fact
+work because uClibc provides the necessary functions.
+
+This patch is similar and highly inspired from
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393, but implemented in
+a way that doesn't involve changing the configure.ac script, as
+autoreconfiguring gcc is complicated. It simply relies on the fact
+that uClibc defines the __UCLIBC__ definition.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/libstdc++-v3/config/locale/generic/c_locale.h
+===================================================================
+--- a/libstdc++-v3/config/locale/generic/c_locale.h
++++ b/libstdc++-v3/config/locale/generic/c_locale.h
+@@ -70,7 +70,7 @@
+     __builtin_va_list __args;
+     __builtin_va_start(__args, __fmt);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
+ #else
+     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
+Index: b/libstdc++-v3/config/locale/gnu/c_locale.h
+===================================================================
+--- a/libstdc++-v3/config/locale/gnu/c_locale.h
++++ b/libstdc++-v3/config/locale/gnu/c_locale.h
+@@ -88,7 +88,7 @@
+     __builtin_va_list __args;
+     __builtin_va_start(__args, __fmt);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
+ #else
+     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
+Index: b/libstdc++-v3/include/bits/basic_string.h
+===================================================================
+--- a/libstdc++-v3/include/bits/basic_string.h
++++ b/libstdc++-v3/include/bits/basic_string.h
+@@ -2811,7 +2811,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99) \
++#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)) \
+      && !defined(_GLIBCXX_HAVE_BROKEN_VSWPRINTF))
+ 
+ #include <ext/string_conversions.h>
+Index: b/libstdc++-v3/include/bits/locale_facets.tcc
+===================================================================
+--- a/libstdc++-v3/include/bits/locale_facets.tcc
++++ b/libstdc++-v3/include/bits/locale_facets.tcc
+@@ -987,7 +987,7 @@
+ 	char __fbuf[16];
+ 	__num_base::_S_format_float(__io, __fbuf, __mod);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 	// First try a buffer perhaps big enough (most probably sufficient
+ 	// for non-ios_base::fixed outputs)
+ 	int __cs_size = __max_digits * 3;
+Index: b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
+===================================================================
+--- a/libstdc++-v3/include/bits/locale_facets_nonio.tcc
++++ b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
+@@ -572,7 +572,7 @@
+     {
+       const locale __loc = __io.getloc();
+       const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+       // First try a buffer perhaps big enough.
+       int __cs_size = 64;
+       char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
+Index: b/libstdc++-v3/include/c_compatibility/math.h
+===================================================================
+--- a/libstdc++-v3/include/c_compatibility/math.h
++++ b/libstdc++-v3/include/c_compatibility/math.h
+@@ -56,7 +56,7 @@
+ using std::floor;
+ using std::fmod;
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ using std::fpclassify;
+ using std::isfinite;
+ using std::isinf;
+Index: b/libstdc++-v3/include/c_compatibility/wchar.h
+===================================================================
+--- a/libstdc++-v3/include/c_compatibility/wchar.h
++++ b/libstdc++-v3/include/c_compatibility/wchar.h
+@@ -103,7 +103,7 @@
+ using std::wmemset;
+ using std::wcsftime;
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ using std::wcstold;
+ using std::wcstoll;
+ using std::wcstoull;
+Index: b/libstdc++-v3/include/c_global/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/c_global/cstdlib
++++ b/libstdc++-v3/include/c_global/cstdlib
+@@ -182,7 +182,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef _Exit
+ #undef llabs
+Index: b/libstdc++-v3/include/c_global/cwchar
+===================================================================
+--- a/libstdc++-v3/include/c_global/cwchar
++++ b/libstdc++-v3/include/c_global/cwchar
+@@ -232,7 +232,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef wcstold
+ #undef wcstoll
+@@ -289,7 +289,7 @@
+   using std::vwscanf;
+ #endif
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+   using std::wcstold;
+   using std::wcstoll;
+   using std::wcstoull;
+Index: b/libstdc++-v3/include/c_std/cstdio
+===================================================================
+--- a/libstdc++-v3/include/c_std/cstdio
++++ b/libstdc++-v3/include/c_std/cstdio
+@@ -139,7 +139,7 @@
+   using ::vsprintf;
+ } // namespace std
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
+Index: b/libstdc++-v3/include/c_std/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/c_std/cstdlib
++++ b/libstdc++-v3/include/c_std/cstdlib
+@@ -180,7 +180,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef _Exit
+ #undef llabs
+Index: b/libstdc++-v3/include/c_std/cwchar
+===================================================================
+--- a/libstdc++-v3/include/c_std/cwchar
++++ b/libstdc++-v3/include/c_std/cwchar
+@@ -228,7 +228,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef wcstold
+ #undef wcstoll
+Index: b/libstdc++-v3/include/ext/vstring.h
+===================================================================
+--- a/libstdc++-v3/include/ext/vstring.h
++++ b/libstdc++-v3/include/ext/vstring.h
+@@ -2571,7 +2571,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99))
++#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)))
+ 
+ #include <ext/string_conversions.h>
+ 
+Index: b/libstdc++-v3/include/tr1/cstdio
+===================================================================
+--- a/libstdc++-v3/include/tr1/cstdio
++++ b/libstdc++-v3/include/tr1/cstdio
+@@ -33,7 +33,7 @@
+ 
+ #include <cstdio>
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+Index: b/libstdc++-v3/include/tr1/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/tr1/cstdlib
++++ b/libstdc++-v3/include/tr1/cstdlib
+@@ -35,7 +35,7 @@
+ 
+ #if _GLIBCXX_HOSTED
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+Index: b/libstdc++-v3/include/tr1/cwchar
+===================================================================
+--- a/libstdc++-v3/include/tr1/cwchar
++++ b/libstdc++-v3/include/tr1/cwchar
+@@ -52,7 +52,7 @@
+   using std::vwscanf;
+ #endif
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+   using std::wcstold;
+   using std::wcstoll;
+   using std::wcstoull;
+Index: b/libstdc++-v3/include/tr1/stdlib.h
+===================================================================
+--- a/libstdc++-v3/include/tr1/stdlib.h
++++ b/libstdc++-v3/include/tr1/stdlib.h
+@@ -33,7 +33,7 @@
+ 
+ #if _GLIBCXX_HOSTED
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ using std::tr1::atoll;
+ using std::tr1::strtoll;
+Index: b/libstdc++-v3/src/c++11/debug.cc
+===================================================================
+--- a/libstdc++-v3/src/c++11/debug.cc
++++ b/libstdc++-v3/src/c++11/debug.cc
+@@ -787,7 +787,7 @@
+ 				     int __n __attribute__ ((__unused__)), 
+ 				     const char* __fmt, _Tp __s) const throw ()
+     {
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+       std::snprintf(__buf, __n, __fmt, __s);
+ #else
+       std::sprintf(__buf, __fmt, __s);
+Index: b/libstdc++-v3/include/c_global/cstdio
+===================================================================
+--- a/libstdc++-v3/include/c_global/cstdio
++++ b/libstdc++-v3/include/c_global/cstdio
+@@ -138,7 +138,7 @@
+   using ::vsprintf;
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
diff --git a/package/gcc/arc-2015.12/851-PR-other-56780.patch b/package/gcc/arc-2015.12/851-PR-other-56780.patch
new file mode 100644
index 0000000..feb4339
--- /dev/null
+++ b/package/gcc/arc-2015.12/851-PR-other-56780.patch
@@ -0,0 +1,244 @@
+From afe990251bd9b3a063f03da31a3b8d139d033bc3 Mon Sep 17 00:00:00 2001
+From: ian <ian@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Sat, 1 Jun 2013 00:20:49 +0000
+Subject: [PATCH] PR other/56780
+
+* libiberty/configure.ac: Move test for --enable-install-libiberty
+outside of the 'with_target_subdir' test so that it actually gets
+run.  Add output messages to show the test result.
+* libiberty/configure: Regenerate.
+* libiberty/Makefile.in (install_to_libdir): Place the
+installation of the libiberty library in the same guard as that
+used for the headers to prevent it being installed unless
+requested via --enable-install-libiberty.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 199570 138bc75d-0d04-0410-961f-82ee72b054a4
+
+libiberty: fix --enable-install-libiberty flag [PR 56780]
+
+Commit 199570 fixed the --disable-install-libiberty behavior, but it also
+added a bug where the enable path never works because the initial clear
+of target_header_dir wasn't deleted.  So we end up initializing properly
+at the top only to reset it at the end all the time.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 206367 138bc75d-0d04-0410-961f-82ee72b054a4
+
+[Romain
+  squash the two upstream commits
+  Remove the ChangeLog]
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ libiberty/Makefile.in  | 24 ++++++++++-----------
+ libiberty/configure    | 57 +++++++++++++++++++++++++++-----------------------
+ libiberty/configure.ac | 47 ++++++++++++++++++++++-------------------
+ 3 files changed, 68 insertions(+), 60 deletions(-)
+
+diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
+index f6a3ebd..75ff82d 100644
+--- a/libiberty/Makefile.in
++++ b/libiberty/Makefile.in
+@@ -355,19 +355,19 @@ install-strip: install
+ # since it will be passed the multilib flags.
+ MULTIOSDIR = `$(CC) $(CFLAGS) -print-multi-os-directory`
+ install_to_libdir: all
+-	${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR)
+-	$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n
+-	( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n )
+-	mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)
+ 	if test -n "${target_header_dir}"; then \
+-	  case "${target_header_dir}" in \
+-	    /*)    thd=${target_header_dir};; \
+-	    *)     thd=${includedir}/${target_header_dir};; \
+-	  esac; \
+-	  ${mkinstalldirs} $(DESTDIR)$${thd}; \
+-	  for h in ${INSTALLED_HEADERS}; do \
+-	    ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
+-	  done; \
++		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
++		$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n; \
++		( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n ); \
++		mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB); \
++		case "${target_header_dir}" in \
++		  /*)    thd=${target_header_dir};; \
++		  *)     thd=${includedir}/${target_header_dir};; \
++		esac; \
++		${mkinstalldirs} $(DESTDIR)$${thd}; \
++		for h in ${INSTALLED_HEADERS}; do \
++		  ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
++		done; \
+ 	fi
+ 	@$(MULTIDO) $(FLAGS_TO_PASS) multi-do DO=install
+ 
+diff --git a/libiberty/configure b/libiberty/configure
+index 5367027..4feb95a 100755
+--- a/libiberty/configure
++++ b/libiberty/configure
+@@ -675,8 +675,8 @@ with_cross_host
+ with_newlib
+ enable_maintainer_mode
+ enable_multilib
+-enable_largefile
+ enable_install_libiberty
++enable_largefile
+ '
+       ac_precious_vars='build_alias
+ host_alias
+@@ -1303,8 +1303,8 @@ Optional Features:
+                           enable make rules and dependencies not useful
+                           (and sometimes confusing) to the casual installer
+   --enable-multilib       build many library versions (default)
++  --enable-install-libiberty       Install headers and library for end users
+   --disable-largefile     omit support for large files
+-  --enable-install-libiberty       Install headers for end users
+ 
+ Optional Packages:
+   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
+@@ -2784,6 +2784,35 @@ if test $cross_compiling = no && test $multilib = yes \
+    cross_compiling=maybe
+ fi
+ 
++# We may wish to install the target headers somewhere.
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether to install libiberty headers and static library" >&5
++$as_echo_n "checking whether to install libiberty headers and static library... " >&6; }
++
++# Check whether --enable-install-libiberty was given.
++if test "${enable_install_libiberty+set}" = set; then :
++  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
++else
++  enable_install_libiberty=no
++fi
++
++# Option parsed, now set things appropriately.
++case x"$enable_install_libiberty" in
++  xyes|x)
++    target_header_dir=libiberty
++    ;;
++  xno)
++    target_header_dir=
++    ;;
++  *)
++    # This could be sanity-checked in various ways...
++    target_header_dir="${enable_install_libiberty}"
++    ;;
++esac
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $enable_install_libiberty" >&5
++$as_echo "$enable_install_libiberty" >&6; }
++{ $as_echo "$as_me:${as_lineno-$LINENO}: target_header_dir = $target_header_dir" >&5
++$as_echo "$as_me: target_header_dir = $target_header_dir" >&6;}
++
+ 
+ ac_ext=c
+ ac_cpp='$CPP $CPPFLAGS'
+@@ -5476,7 +5505,6 @@ fi
+ 
+ setobjs=
+ CHECK=
+-target_header_dir=
+ if test -n "${with_target_subdir}"; then
+ 
+   # We are being configured as a target library.  AC_REPLACE_FUNCS
+@@ -5759,29 +5787,6 @@ _ACEOF
+ 
+   esac
+ 
+-  # We may wish to install the target headers somewhere.
+-  # Check whether --enable-install-libiberty was given.
+-if test "${enable_install_libiberty+set}" = set; then :
+-  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
+-else
+-  enable_install_libiberty=no
+-fi
+-
+-  # Option parsed, now set things appropriately.
+-  case x"$enable_install_libiberty" in
+-    xyes|x)
+-      target_header_dir=libiberty
+-      ;;
+-    xno)
+-      target_header_dir=
+-      ;;
+-    *)
+-      # This could be sanity-checked in various ways...
+-      target_header_dir="${enable_install_libiberty}"
+-      ;;
+-  esac
+-
+-
+ else
+ 
+    # Not a target library, so we set things up to run the test suite.
+diff --git a/libiberty/configure.ac b/libiberty/configure.ac
+index c763894..f17e6b6 100644
+--- a/libiberty/configure.ac
++++ b/libiberty/configure.ac
+@@ -128,6 +128,31 @@ if test $cross_compiling = no && test $multilib = yes \
+    cross_compiling=maybe
+ fi
+ 
++# We may wish to install the target headers somewhere.
++AC_MSG_CHECKING([whether to install libiberty headers and static library])
++dnl install-libiberty is disabled by default
++
++AC_ARG_ENABLE(install-libiberty,
++[  --enable-install-libiberty       Install headers and library for end users],
++enable_install_libiberty=$enableval,
++enable_install_libiberty=no)dnl
++
++# Option parsed, now set things appropriately.
++case x"$enable_install_libiberty" in
++  xyes|x)
++    target_header_dir=libiberty
++    ;;
++  xno)   
++    target_header_dir=
++    ;;
++  *) 
++    # This could be sanity-checked in various ways...
++    target_header_dir="${enable_install_libiberty}"
++    ;;
++esac
++AC_MSG_RESULT($enable_install_libiberty)
++AC_MSG_NOTICE([target_header_dir = $target_header_dir])
++
+ GCC_NO_EXECUTABLES
+ AC_PROG_CC
+ AC_SYS_LARGEFILE
+@@ -380,7 +405,6 @@ fi
+ 
+ setobjs=
+ CHECK=
+-target_header_dir=
+ if test -n "${with_target_subdir}"; then
+ 
+   # We are being configured as a target library.  AC_REPLACE_FUNCS
+@@ -492,27 +516,6 @@ if test -n "${with_target_subdir}"; then
+ 
+   esac
+ 
+-  # We may wish to install the target headers somewhere.
+-  AC_ARG_ENABLE(install-libiberty,
+-  [  --enable-install-libiberty       Install headers for end users],
+-  enable_install_libiberty=$enableval,
+-  enable_install_libiberty=no)dnl
+-  
+-  # Option parsed, now set things appropriately.
+-  case x"$enable_install_libiberty" in
+-    xyes|x)
+-      target_header_dir=libiberty
+-      ;;
+-    xno)   
+-      target_header_dir=
+-      ;;
+-    *) 
+-      # This could be sanity-checked in various ways...
+-      target_header_dir="${enable_install_libiberty}"
+-      ;;
+-  esac
+-
+-
+ else
+ 
+    # Not a target library, so we set things up to run the test suite.
+-- 
+1.9.3
+
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 064a727..0ef4e65 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -9,4 +9,4 @@ sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a31
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.3.0/sha512.sum
 sha512  d619847383405fd389f5a2d7225f97fedb01f81478dbb8339047ccba7561a5c20045ab500a8744bffd19ea51892ce09fc37f862f2cfcb42de0f0f8cd8f8da37a  gcc-5.3.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none  xxx  gcc-arc-2015.12-rc1.tar.gz
+none  xxx  gcc-arc-2015.12.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index d5f08b2..6807694 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -52,7 +52,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2015.12-rc1-gdb" if BR2_arc
+	default "arc-2015.12-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 64bc501..3abdcd0 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -4,5 +4,5 @@ sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 # No hash for the ARC & microblaze variants, comes from the github-helper:
-none	xxx	gdb-arc-2015.12-rc1-gdb.tar.gz
+none	xxx	gdb-arc-2015.12-gdb.tar.gz
 none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-- 
2.5.0
