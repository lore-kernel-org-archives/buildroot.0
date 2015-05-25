From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 25 May 2015 05:02:00 -0400
Subject: [Buildroot] [PATCH] binutils: improve poison system directory
	support
Message-ID: <1432544520-665-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mike Frysinger <vapier@chromium.org>

I've added support for the gold linker and reworked a bit the system:
* The command line flags are always available.
* The flag names are tweaked slightly to match existing flag standards.
* We can turn on & off the warning via the command line.
* The configure option controls the default warning behavior.

This makes it easier for distros to take the patch and drop it into their
setups.  If they don't pass the configure flag, then it isn't enabled by
default, and they get the same behavior w/out the patch.  The difference
is that people can still opt in to the warnings/errors via LDFLAGS.

Signed-off-by: Mike Frysinger <vapier@chromium.org>
---
 .../2.25/600-poison-system-directories.patch       | 254 +++++++++++++--------
 1 file changed, 154 insertions(+), 100 deletions(-)

diff --git a/package/binutils/2.25/600-poison-system-directories.patch b/package/binutils/2.25/600-poison-system-directories.patch
index ec3622b..432a6a0 100644
--- a/package/binutils/2.25/600-poison-system-directories.patch
+++ b/package/binutils/2.25/600-poison-system-directories.patch
@@ -1,3 +1,11 @@
+Updates by Mike Frysinger <vapier@chromium.org>:
+* The command line flags are always available.
+* The flag names are tweaked slightly to match existing flag standards.
+* We can turn on & off the warning via the command line.
+* The configure option controls the default warning behavior.
+* Add support for gold.
+Signed-off-by: Mike Frysinger <vapier@chromium.org>
+
 Patch adapted to binutils 2.23.2 and extended to use
 BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
 
@@ -59,9 +67,60 @@ Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-diff -Nura a/ld/config.in b/ld/config.in
---- a/ld/config.in	2014-10-14 04:32:04.000000000 -0300
-+++ b/ld/config.in	2014-12-24 08:07:28.997918918 -0300
+--- a/gold/options.cc
++++ b/gold/options.cc
+@@ -1201,6 +1201,33 @@ General_options::finalize()
+   // in the path, as appropriate.
+   this->add_sysroot();
+ 
++  // Now check if library_path is poisoned.
++  if (this->warn_poison_system_directories())
++    {
++      std::vector<std::string> bad_paths;
++
++      bad_paths.push_back("/lib");
++      bad_paths.push_back("/usr/lib");
++      bad_paths.push_back("/usr/local/lib");
++      bad_paths.push_back("/usr/X11R6/lib");
++
++      for (std::vector<std::string>::const_iterator b = bad_paths.begin();
++	   b != bad_paths.end();
++	   ++b)
++	for (Dir_list::iterator p = this->library_path_.value.begin();
++	     p != this->library_path_.value.end();
++	     ++p)
++	  if (!p->name().compare(0, b->size(), *b))
++	    {
++	      if (this->error_poison_system_directories())
++		gold_fatal(_("library search path \"%s\" is unsafe for "
++			     "cross-compilation"), p->name().c_str());
++	      else
++		gold_warning(_("library search path \"%s\" is unsafe for "
++			       "cross-compilation"), p->name().c_str());
++	    }
++    }
++
+   // --dynamic-list overrides -Bsymbolic and -Bsymbolic-functions.
+   if (this->have_dynamic_list())
+     {
+--- a/gold/options.h
++++ b/gold/options.h
+@@ -1206,6 +1206,13 @@ class General_options
+   DEFINE_bool(warn_multiple_gp, options::TWO_DASHES, '\0', false,
+ 	      N_("Ignored"), NULL);
+ 
++  DEFINE_bool(warn_poison_system_directories, options::TWO_DASHES, '\0', false,
++	      N_("Warn for -L options using system directories"),
++	      N_("Do not warn for -L options using system directories"));
++  DEFINE_bool(error_poison_system_directories, options::TWO_DASHES, '\0', false,
++	      N_("Give an error for -L options using system directories"),
++	      NULL);
++
+   DEFINE_bool(warn_search_mismatch, options::TWO_DASHES, '\0', true,
+ 	      N_("Warn when skipping an incompatible library"),
+ 	      N_("Don't warn when skipping an incompatible library"));
+--- a/ld/config.in
++++ b/ld/config.in
 @@ -11,6 +11,9 @@
     language is requested. */
  #undef ENABLE_NLS
@@ -72,10 +131,9 @@ diff -Nura a/ld/config.in b/ld/config.in
  /* Additional extension a shared object might have. */
  #undef EXTRA_SHLIB_EXTENSION
  
-diff -Nura a/ld/configure b/ld/configure
---- a/ld/configure	2014-12-23 11:22:07.000000000 -0300
-+++ b/ld/configure	2014-12-24 08:07:29.002919088 -0300
-@@ -783,6 +783,7 @@
+--- a/ld/configure
++++ b/ld/configure
+@@ -774,6 +774,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -83,7 +141,7 @@ diff -Nura a/ld/configure b/ld/configure
  enable_gold
  enable_got
  enable_werror
-@@ -1439,6 +1440,8 @@
+@@ -1429,6 +1430,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -92,7 +150,7 @@ diff -Nura a/ld/configure b/ld/configure
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15487,7 +15490,18 @@
+@@ -4339,7 +4342,18 @@ else
  fi
  
  
@@ -111,10 +169,9 @@ diff -Nura a/ld/configure b/ld/configure
  
  # Check whether --enable-got was given.
  if test "${enable_got+set}" = set; then :
-diff -Nura a/ld/configure.ac b/ld/configure.ac
---- a/ld/configure.ac	2014-10-14 04:32:04.000000000 -0300
-+++ b/ld/configure.ac	2014-12-24 08:07:29.002919088 -0300
-@@ -94,6 +94,16 @@
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -87,6 +87,16 @@ AC_SUBST(use_sysroot)
  AC_SUBST(TARGET_SYSTEM_ROOT)
  AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
  
@@ -131,43 +188,37 @@ diff -Nura a/ld/configure.ac b/ld/configure.ac
  dnl Use --enable-gold to decide if this linker should be the default.
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
-diff -Nura a/ld/ldfile.c b/ld/ldfile.c
---- a/ld/ldfile.c	2014-10-14 04:32:04.000000000 -0300
-+++ b/ld/ldfile.c	2014-12-24 08:07:29.002919088 -0300
-@@ -114,6 +114,23 @@
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -116,6 +116,20 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
      new_dirs->name = concat (ld_sysroot, name + 1, (const char *) NULL);
    else
      new_dirs->name = xstrdup (name);
 +
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
++  if (command_line.warn_poison_system_directories
++      && (!strncmp (name, "/lib", 4)
++	  || !strncmp (name, "/usr/lib", 8)
++	  || !strncmp (name, "/usr/local/lib", 14)
++	  || !strncmp (name, "/usr/X11R6/lib", 14)))
++    {
++      if (command_line.error_poison_system_directories)
++	einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
++	         "cross-compilation\n"), name);
++      else
++	einfo (_("%P: warning: library search path \"%s\" is unsafe for "
++	         "cross-compilation\n"), name);
++    }
  }
  
  /* Try to open a BFD for a lang_input_statement.  */
-diff -Nura a/ld/ld.h b/ld/ld.h
---- a/ld/ld.h	2014-10-14 04:32:04.000000000 -0300
-+++ b/ld/ld.h	2014-12-24 08:07:29.003919122 -0300
-@@ -161,6 +161,14 @@
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -180,6 +180,13 @@ typedef struct {
    /* If TRUE we'll just print the default output on stdout.  */
    bfd_boolean print_output_format;
  
-+  /* If TRUE (the default) warn for uses of system directories when
-+     cross linking.  */
-+  bfd_boolean poison_system_directories;
++  /* If TRUE warn for uses of system directories when cross linking.  */
++  bfd_boolean warn_poison_system_directories;
 +
 +  /* If TRUE (default FALSE) give an error for uses of system
 +     directories when cross linking instead of a warning.  */
@@ -176,40 +227,55 @@ diff -Nura a/ld/ld.h b/ld/ld.h
    /* Big or little endian as set on command line.  */
    enum endian_enum endian;
  
-diff -Nura a/ld/ldlex.h b/ld/ldlex.h
---- a/ld/ldlex.h	2014-11-04 06:54:41.000000000 -0300
-+++ b/ld/ldlex.h	2014-12-24 08:09:47.477644294 -0300
-@@ -140,6 +140,8 @@
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -138,6 +138,9 @@ enum option_values
+   OPTION_PRINT_OUTPUT_FORMAT,
+   OPTION_PRINT_SYSROOT,
    OPTION_IGNORE_UNRESOLVED_SYMBOL,
++  OPTION_WARN_POISON_SYSTEM_DIRECTORIES,
++  OPTION_NO_WARN_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
    OPTION_PUSH_STATE,
    OPTION_POP_STATE,
-+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
-+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
  };
- 
- /* The initial parser states.  */
-diff -Nura a/ld/ldmain.c b/ld/ldmain.c
---- a/ld/ldmain.c	2014-10-14 04:32:04.000000000 -0300
-+++ b/ld/ldmain.c	2014-12-24 08:07:29.003919122 -0300
-@@ -266,6 +266,8 @@
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -266,6 +266,19 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
-+  command_line.poison_system_directories = TRUE;
++  command_line.warn_poison_system_directories =
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++    TRUE;
++#else
++    FALSE;
++#endif
 +  command_line.error_poison_system_directories = FALSE;
++
++  {
++    const char *BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
++    if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
++      command_line.error_poison_system_directories = TRUE;
++  }
  
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-diff -Nura a/ld/ld.texinfo b/ld/ld.texinfo
---- a/ld/ld.texinfo	2014-12-23 05:47:10.000000000 -0300
-+++ b/ld/ld.texinfo	2014-12-24 08:07:29.005919191 -0300
-@@ -2212,6 +2212,18 @@
+--- a/ld/ld.texinfo
++++ b/ld/ld.texinfo
+@@ -2175,6 +2175,24 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
 +
-+ at kindex --no-poison-system-directories
-+ at item --no-poison-system-directories
++ at kindex --warn-poison-system-directories
++ at item --warn-poison-system-directories
++Warn for @option{-L} options using system directories such as
++ at file{/usr/lib} when cross linking.  This option is intended for use
++in environments that want to detect and reject incorrect link settings.
++
++ at kindex --no-warn-poison-system-directories
++ at item --no-warn-poison-system-directories
 +Do not warn for @option{-L} options using system directories such as
 + at file{/usr/lib} when cross linking.  This option is intended for use
 +in chroot environments when such directories contain the correct
@@ -222,55 +288,43 @@ diff -Nura a/ld/ld.texinfo b/ld/ld.texinfo
  @end table
  
  @c man end
-diff -Nura a/ld/lexsup.c b/ld/lexsup.c
---- a/ld/lexsup.c	2014-11-04 06:54:41.000000000 -0300
-+++ b/ld/lexsup.c	2014-12-24 08:48:50.136583414 -0300
-@@ -513,6 +513,14 @@
-   { {"pop-state", no_argument, NULL, OPTION_POP_STATE},
-     '\0', NULL, N_("Pop state of flags governing input file handling"),
-     TWO_DASHES },
-+  { {"no-poison-system-directories", no_argument, NULL,
-+    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -507,6 +507,18 @@ static const struct ld_option ld_options[] =
+     OPTION_IGNORE_UNRESOLVED_SYMBOL},
+     '\0', N_("SYMBOL"),
+     N_("Unresolved SYMBOL will not cause an error or warning"), TWO_DASHES },
++  { {"warn-poison-system-directories", no_argument, NULL,
++     OPTION_WARN_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Warn for -L options using system directories"),
++    TWO_DASHES },
++  { {"no-warn-poison-system-directories", no_argument, NULL,
++     OPTION_NO_WARN_POISON_SYSTEM_DIRECTORIES},
 +    '\0', NULL, N_("Do not warn for -L options using system directories"),
 +    TWO_DASHES },
 +  { {"error-poison-system-directories", no_argument, NULL,
-+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++     OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
 +    '\0', NULL, N_("Give an error for -L options using system directories"),
 +    TWO_DASHES },
- };
- 
- #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -525,6 +533,7 @@
-   int ingroup = 0;
-   char *default_dirlist = NULL;
-   char *shortopts;
-+  char *BR_paranoid_env;
-   struct option *longopts;
-   struct option *really_longopts;
-   int last_optind;
-@@ -1458,6 +1467,14 @@
+   { {"push-state", no_argument, NULL, OPTION_PUSH_STATE},
+     '\0', NULL, N_("Push state of flags governing input file handling"),
+     TWO_DASHES },
+@@ -1442,6 +1454,18 @@ parse_args (unsigned argc, char **argv)
+               einfo (_("%P%X: --hash-size needs a numeric argument\n"));
            }
            break;
- 
-+	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
-+	  command_line.poison_system_directories = FALSE;
-+	  break;
 +
-+	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
-+	  command_line.error_poison_system_directories = TRUE;
-+	  break;
++   case OPTION_WARN_POISON_SYSTEM_DIRECTORIES:
++     command_line.warn_poison_system_directories = TRUE;
++     break;
 +
++   case OPTION_NO_WARN_POISON_SYSTEM_DIRECTORIES:
++     command_line.warn_poison_system_directories = FALSE;
++     break;
++
++   case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
++     command_line.error_poison_system_directories = TRUE;
++     break;
+ 
  	case OPTION_PUSH_STATE:
  	  input_flags.pushed = xmemdup (&input_flags,
- 					sizeof (input_flags),
-@@ -1483,6 +1500,10 @@
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
-- 
2.4.1
