From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  2 Oct 2020 17:57:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/binutils: add version 2.35.1
Message-ID: <20201002155751.1529784-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See:
https://sourceware.org/pipermail/binutils/2020-July/112530.html (2.35)
https://sourceware.org/pipermail/binutils/2020-September/113375.html (2.35.1)

Tested by https://gitlab.com/kubu93/buildroot/-/pipelines/197379288

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Ignore the qemu_arm_vexpress_defconfig issue in the gitlab pipeline.

 package/binutils/2.35.1/0001-sh-conf.patch    |  48 +++
 .../0002-poison-system-directories.patch      | 306 ++++++++++++++++++
 package/binutils/Config.in.host               |   8 +
 package/binutils/binutils.hash                |   1 +
 4 files changed, 363 insertions(+)
 create mode 100644 package/binutils/2.35.1/0001-sh-conf.patch
 create mode 100644 package/binutils/2.35.1/0002-poison-system-directories.patch

diff --git a/package/binutils/2.35.1/0001-sh-conf.patch b/package/binutils/2.35.1/0001-sh-conf.patch
new file mode 100644
index 0000000000..44d5f4e89a
--- /dev/null
+++ b/package/binutils/2.35.1/0001-sh-conf.patch
@@ -0,0 +1,48 @@
+From ae50e875f4292c99b859cded1d036e401b6ddaec Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:38:13 +0100
+Subject: [PATCH] sh-conf
+
+Likewise, binutils has no idea about any of these new targets either, so we
+fix that up too.. now we're able to actually build a real toolchain for
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
+inept targets than that one, really. Go look, I promise).
+
+[Romain: rebase on top of 2.32]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 54d0339ab9e..c2f51ffcebb 100755
+--- a/configure
++++ b/configure
+@@ -3937,7 +3937,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index a910c4fd6ba..a93d93c81c3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1178,7 +1178,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.25.4
+
diff --git a/package/binutils/2.35.1/0002-poison-system-directories.patch b/package/binutils/2.35.1/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..b77a5e1a66
--- /dev/null
+++ b/package/binutils/2.35.1/0002-poison-system-directories.patch
@@ -0,0 +1,306 @@
+From db405d1bc5607892ddb25433354b46d78e23b343 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+[Romain: rebase on top of 2.33.1]
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
+index 2f4e5ea33e3..8fbb29682b2 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -40,6 +40,9 @@
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
+index 6be5280621f..d62e7b12382 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -826,6 +826,7 @@ with_lib_path
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1493,6 +1494,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15814,7 +15817,18 @@ else
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
+index 172398ff847..b77f8510ca6 100644
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
+index 1790dc81a66..73f832eb169 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -166,6 +166,14 @@ typedef struct
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
+index 2a93e9456ac..3eeb70607fd 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -2655,6 +2655,18 @@ string identifying the original linked file does not change.
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
+index e39170b5d94..fadc248a140 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
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
+index 5ea083ebeb3..417f9b858ce 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -155,6 +155,8 @@ enum option_values
+   OPTION_NON_CONTIGUOUS_REGIONS,
+   OPTION_NON_CONTIGUOUS_REGIONS_WARNINGS,
+   OPTION_DEPENDENCY_FILE,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+ };
+ 
+ /* The initial parser states.  */
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index 08be9030cb5..92dc16399eb 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -321,6 +321,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = TRUE;
+   command_line.warn_search_mismatch = TRUE;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = TRUE;
++  command_line.error_poison_system_directories = FALSE;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index 6cab41cf5df..c497f36b148 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -572,6 +572,14 @@ static const struct ld_option ld_options[] =
+   { {"no-print-map-discarded", no_argument, NULL, OPTION_NO_PRINT_MAP_DISCARDED},
+     '\0', NULL, N_("Do not show discarded sections in map file output"),
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
+@@ -584,6 +592,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1591,6 +1600,14 @@ parse_args (unsigned argc, char **argv)
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
+@@ -1681,6 +1698,10 @@ parse_args (unsigned argc, char **argv)
+       command_line.soname = NULL;
+     }
+ 
++  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
++  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
++    command_line.error_poison_system_directories = TRUE;
++
+   while (ingroup)
+     {
+       einfo (_("%P: missing --end-group; added as last command line option\n"));
+-- 
+2.25.4
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 8fdff2cda3..1154354aeb 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -31,6 +31,13 @@ config BR2_BINUTILS_VERSION_2_34_X
 	# https://github.com/uclinux-dev/elf2flt/issues/12
 	depends on !BR2_BINFMT_FLAT
 
+config BR2_BINUTILS_VERSION_2_35_X
+	bool "binutils 2.35.1"
+	depends on !BR2_csky
+	# https://github.com/uclinux-dev/elf2flt/pull/16
+	# https://github.com/uclinux-dev/elf2flt/issues/12
+	depends on !BR2_BINFMT_FLAT
+
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.31)"
 	depends on BR2_arc
@@ -48,6 +55,7 @@ config BR2_BINUTILS_VERSION
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
 	default "2.33.1"	if BR2_BINUTILS_VERSION_2_33_X
 	default "2.34"		if BR2_BINUTILS_VERSION_2_34_X
+	default "2.35.1"	if BR2_BINUTILS_VERSION_2_35_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index b202771449..b5b73e5c07 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,7 @@
 sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
 sha512  b7a6767c6c7ca6b5cafa7080e6820b7bb3a53b7148348c438d99905defbdf0d30c9744a484ee01c9441a8153901808513366b15ba9533e20c9673c262ade36ac  binutils-2.33.1.tar.xz
 sha512  2c7976939dcf5e8c5b7374cccd39bfe803b1bec73c6abfa0eb17c24e1942574c6bdb874c66a092a82adc443182eacd8a5a8001c19a76101f0c7ba40c27de0bbd  binutils-2.34.tar.xz
+sha512  94ff72708403413b70b247f3af4099ebaa882b6659249869f1ed9941a0f1912e313f08357d470f9fd2359e7f5e5b0eb86285e5eaf883fa8187789d6b1bd304eb  binutils-2.35.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  99c87ea97b43719dd9ce8193d60a5a6f0abc0479e8ebabbd32876f54807cd02d1280c691ef19e12cb79946280d2a4c1562bbb1a175a31ff1533720a623c3059a  binutils-gdb-arc-2020.03-release.tar.gz
-- 
2.25.4
