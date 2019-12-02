From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2019 13:45:19 +0100
Subject: [Buildroot] [git commit] package/binutils: add binutils 2.33.1
Message-ID: <20191202134425.4B559839A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7eee918ba35ec5b41e8a084f8888e0d974fc4ba2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Keep sh-conf and poison-system-directories patches.
Remove xtensa patches already in this version [1] [2] [3].

Revert an upstream patch since it prevent booting a sh4 system under
Qemu as reported on the Binutils mailing list [5] [6].
This commit is not related to sh4, it's weird that it is the
only affected architecture.

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2487ef07c28b961c6e2b8c51161f88f93b181d07
[2] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=403b0b61f6d4358aee8493cb1d11814e368942c9
[3] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=548791769dc737f05cb12e5ee4190b7e853beac9
[4] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
[5] https://sourceware.org/ml/binutils/2019-10/msg00105.html
[6] https://sourceware.org/ml/binutils/2019-11/msg00407.html

See:
https://www.sourceware.org/ml/binutils/2019-10/msg00103.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/2.33.1/0001-sh-conf.patch         |  48 ++++
 .../2.33.1/0002-poison-system-directories.patch    | 306 +++++++++++++++++++++
 ...-PR24311-FAIL-S-records-with-constructors.patch | 148 ++++++++++
 package/binutils/Config.in.host                    |   5 +
 package/binutils/binutils.hash                     |   1 +
 5 files changed, 508 insertions(+)

diff --git a/package/binutils/2.33.1/0001-sh-conf.patch b/package/binutils/2.33.1/0001-sh-conf.patch
new file mode 100644
index 0000000000..035100db82
--- /dev/null
+++ b/package/binutils/2.33.1/0001-sh-conf.patch
@@ -0,0 +1,48 @@
+From 3220c7e65ccfe41eceaaa6f1707f7f5775d9a4b0 Mon Sep 17 00:00:00 2001
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
+index 6a9719f6091..796641b6aa3 100755
+--- a/configure
++++ b/configure
+@@ -3865,7 +3865,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index 7433badc217..dce082fb58e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1158,7 +1158,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.23.0
+
diff --git a/package/binutils/2.33.1/0002-poison-system-directories.patch b/package/binutils/2.33.1/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..9eafcbe18c
--- /dev/null
+++ b/package/binutils/2.33.1/0002-poison-system-directories.patch
@@ -0,0 +1,306 @@
+From 276cba370773e8f12dc8b186b71827a01d5c9097 Mon Sep 17 00:00:00 2001
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
+index d93c9b08300..5da2742beac 100644
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
+index b532ef94fa2..65d12cbf883 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -823,6 +823,7 @@ with_lib_path
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1487,6 +1488,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15804,7 +15807,18 @@ else
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
+index ee62d10ac58..bc3e14e729d 100644
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
+index 55078a9637b..511e9bc34b7 100644
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
+index b3447050ed2..efd50edd85c 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -2557,6 +2557,18 @@ string identifying the original linked file does not change.
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
+index 7f60319390e..0bcc06db964 100644
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
+index 32a7a6409e8..c02b64bf92f 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -150,6 +150,8 @@ enum option_values
+   OPTION_FORCE_GROUP_ALLOCATION,
+   OPTION_PRINT_MAP_DISCARDED,
+   OPTION_NO_PRINT_MAP_DISCARDED,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+ };
+ 
+ /* The initial parser states.  */
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index e24194ef87d..2d683cb6c5a 100644
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
+index 1c15ac29c0c..8b714e10a40 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -549,6 +549,14 @@ static const struct ld_option ld_options[] =
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
+@@ -561,6 +569,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1549,6 +1558,14 @@ parse_args (unsigned argc, char **argv)
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
+@@ -1600,6 +1617,10 @@ parse_args (unsigned argc, char **argv)
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
+2.23.0
+
diff --git a/package/binutils/2.33.1/0003-Revert-PR24311-FAIL-S-records-with-constructors.patch b/package/binutils/2.33.1/0003-Revert-PR24311-FAIL-S-records-with-constructors.patch
new file mode 100644
index 0000000000..046d0d6f36
--- /dev/null
+++ b/package/binutils/2.33.1/0003-Revert-PR24311-FAIL-S-records-with-constructors.patch
@@ -0,0 +1,148 @@
+From 7a8213503e25998e2610d5a8c0b19eefb5e41596 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 30 Nov 2019 03:12:37 +0100
+Subject: [PATCH] Revert "PR24311, FAIL: S-records with constructors"
+
+This reverts commit ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e.
+
+Revert this patch since it prevent booting a sh4 system under
+Qemu as reported on the Binutils mailing list [1].
+This commit is not related to sh4, it's weird that it is the
+only affected architecture.
+
+[1] https://sourceware.org/ml/binutils/2019-10/msg00105.html
+[2] https://sourceware.org/ml/binutils/2019-11/msg00407.html
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ bfd/merge.c | 52 ++++++++++++++++++++++------------------------------
+ 1 file changed, 22 insertions(+), 30 deletions(-)
+
+diff --git a/bfd/merge.c b/bfd/merge.c
+index 632c8523903..fb7c0858beb 100644
+--- a/bfd/merge.c
++++ b/bfd/merge.c
+@@ -621,7 +621,7 @@ is_suffix (const struct sec_merge_hash_entry *A,
+ 
+ /* This is a helper function for _bfd_merge_sections.  It attempts to
+    merge strings matching suffixes of longer strings.  */
+-static struct sec_merge_sec_info *
++static bfd_boolean
+ merge_strings (struct sec_merge_info *sinfo)
+ {
+   struct sec_merge_hash_entry **array, **a, *e;
+@@ -633,7 +633,7 @@ merge_strings (struct sec_merge_info *sinfo)
+   amt = sinfo->htab->size * sizeof (struct sec_merge_hash_entry *);
+   array = (struct sec_merge_hash_entry **) bfd_malloc (amt);
+   if (array == NULL)
+-    return NULL;
++    return FALSE;
+ 
+   for (e = sinfo->htab->first, a = array; e; e = e->next)
+     if (e->alignment)
+@@ -703,6 +703,11 @@ merge_strings (struct sec_merge_info *sinfo)
+ 	}
+     }
+   secinfo->sec->size = size;
++  if (secinfo->sec->alignment_power != 0)
++    {
++      bfd_size_type align = (bfd_size_type) 1 << secinfo->sec->alignment_power;
++      secinfo->sec->size = (secinfo->sec->size + align - 1) & -align;
++    }
+ 
+   /* And now adjust the rest, removing them from the chain (but not hashtable)
+      at the same time.  */
+@@ -719,7 +724,7 @@ merge_strings (struct sec_merge_info *sinfo)
+ 	    e->u.index = e->u.suffix->u.index + (e->u.suffix->len - e->len);
+ 	  }
+       }
+-  return secinfo;
++  return TRUE;
+ }
+ 
+ /* This function is called once after all SEC_MERGE sections are registered
+@@ -735,8 +740,7 @@ _bfd_merge_sections (bfd *abfd,
+ 
+   for (sinfo = (struct sec_merge_info *) xsinfo; sinfo; sinfo = sinfo->next)
+     {
+-      struct sec_merge_sec_info *secinfo;
+-      bfd_size_type align;
++      struct sec_merge_sec_info * secinfo;
+ 
+       if (! sinfo->chain)
+ 	continue;
+@@ -747,7 +751,6 @@ _bfd_merge_sections (bfd *abfd,
+       secinfo->next = NULL;
+ 
+       /* Record the sections into the hash table.  */
+-      align = 1;
+       for (secinfo = sinfo->chain; secinfo; secinfo = secinfo->next)
+ 	if (secinfo->sec->flags & SEC_EXCLUDE)
+ 	  {
+@@ -755,25 +758,18 @@ _bfd_merge_sections (bfd *abfd,
+ 	    if (remove_hook)
+ 	      (*remove_hook) (abfd, secinfo->sec);
+ 	  }
+-	else
+-	  {
+-	    if (!record_section (sinfo, secinfo))
+-	      return FALSE;
+-	    if (align)
+-	      {
+-		align = (bfd_size_type) 1 << secinfo->sec->alignment_power;
+-		if ((secinfo->sec->size & (align - 1)) != 0)
+-		  align = 0;
+-	      }
+-	  }
++	else if (! record_section (sinfo, secinfo))
++	  return FALSE;
++
++      if (secinfo)
++	continue;
+ 
+       if (sinfo->htab->first == NULL)
+ 	continue;
+ 
+       if (sinfo->htab->strings)
+ 	{
+-	  secinfo = merge_strings (sinfo);
+-	  if (!secinfo)
++	  if (!merge_strings (sinfo))
+ 	    return FALSE;
+ 	}
+       else
+@@ -793,7 +789,8 @@ _bfd_merge_sections (bfd *abfd,
+ 		  e->secinfo->first_str = e;
+ 		  size = 0;
+ 		}
+-	      size = (size + e->alignment - 1) & ~((bfd_vma) e->alignment - 1);
++	      size = (size + e->alignment - 1)
++		     & ~((bfd_vma) e->alignment - 1);
+ 	      e->u.index = size;
+ 	      size += e->len;
+ 	      secinfo = e->secinfo;
+@@ -801,16 +798,11 @@ _bfd_merge_sections (bfd *abfd,
+ 	  secinfo->sec->size = size;
+ 	}
+ 
+-      /* If the input sections were padded according to their alignments,
+-	 then pad the output too.  */
+-      if (align)
+-	secinfo->sec->size = (secinfo->sec->size + align - 1) & -align;
+-
+-      /* Finally remove all input sections which have not made it into
+-	 the hash table at all.  */
+-      for (secinfo = sinfo->chain; secinfo; secinfo = secinfo->next)
+-	if (secinfo->first_str == NULL)
+-	  secinfo->sec->flags |= SEC_EXCLUDE | SEC_KEEP;
++	/* Finally remove all input sections which have not made it into
++	   the hash table at all.  */
++	for (secinfo = sinfo->chain; secinfo; secinfo = secinfo->next)
++	  if (secinfo->first_str == NULL)
++	    secinfo->sec->flags |= SEC_EXCLUDE | SEC_KEEP;
+     }
+ 
+   return TRUE;
+-- 
+2.23.0
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 7246411de0..cf2542a8c6 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -25,6 +25,10 @@ config BR2_BINUTILS_VERSION_2_32_X
 	bool "binutils 2.32"
 	depends on !BR2_csky
 
+config BR2_BINUTILS_VERSION_2_33_X
+	bool "binutils 2.33.1"
+	depends on !BR2_csky
+
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.31)"
 	depends on BR2_arc
@@ -42,6 +46,7 @@ config BR2_BINUTILS_VERSION
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
 	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
+	default "2.33.1"	if BR2_BINUTILS_VERSION_2_33_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 586e619c6c..ac63ad5f52 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,7 @@
 sha512  e747ea20d8d79fcd21b9d9f6695059caa7189d60f19256da398e34b789fea9a133c32b192e9693b5828d27683739b0198431bf8b3e39fb3b04884cf89d9aa839  binutils-2.30.tar.xz
 sha512  0fca326feb1d5f5fe505a827b20237fe3ec9c13eaf7ec7e35847fd71184f605ba1cefe1314b1b8f8a29c0aa9d88162849ee1c1a3e70c2f7407d88339b17edb30  binutils-2.31.1.tar.xz
 sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
+sha512  b7a6767c6c7ca6b5cafa7080e6820b7bb3a53b7148348c438d99905defbdf0d30c9744a484ee01c9441a8153901808513366b15ba9533e20c9673c262ade36ac  binutils-2.33.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  3840770da5ede0248f6a6605e3f1743210acd9f4da7de48720ef566cc2aae52ea9e84c285a0a6d39eb15bd7ad197d543b6e407ec9e1a00739989e574d4e04384  binutils-gdb-arc-2019.09-rc1.tar.gz
