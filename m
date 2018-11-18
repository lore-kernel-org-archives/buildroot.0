From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 20:47:31 +0100
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
 arc-2018.09-rc1
Message-ID: <20181202071556.2F59A8843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d4f23cbe65c79826b1b2071e972803a453934cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps ARC toolchain to arc-2018.09-rc1.
We want to test how new toolchain-rc1 builds packages,
so we can make fixes before release of toolcain.

ARC GNU tools of version arc-2018.09-rc1 bring some quite significant changes like:
* Binutils v2.31.1 with additional ARC patches
* GCC 8.2.1 with additional ARC patches
* glibc 2.28 with additional ARC patches

Please note that it is a release candidate and it might contain some
breakages, please don't use it for production builds.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                    |  4 +-
 .../binutils/arc-2018.03/0002-ld-makefile.patch    | 41 --------------
 .../arc-2018.03/0003-check-ldrunpath-length.patch  | 36 ------------
 .../0004-add-sysroot-fix-from-bug-3049.patch       | 51 -----------------
 .../0005-poison-system-directories.patch           | 60 ++++++++++----------
 package/binutils/binutils.hash                     |  2 +-
 package/binutils/binutils.mk                       |  4 +-
 package/gcc/Config.in.host                         |  6 +-
 .../0860-cilk-fix-build-without-wchar.patch        | 64 ----------------------
 .../0100-uclibc-conf.patch                         |  0
 package/gcc/gcc.hash                               |  2 +-
 package/gdb/Config.in.host                         |  2 +-
 package/gdb/gdb.hash                               |  2 +-
 .../glibc.hash                                     |  2 +-
 package/glibc/glibc.mk                             |  2 +-
 15 files changed, 43 insertions(+), 235 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 59120f3138..b8901210be 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -31,13 +31,13 @@ config BR2_BINUTILS_VERSION_2_31_X
 	bool "binutils 2.31.1"
 
 config BR2_BINUTILS_VERSION_ARC
-	bool "binutils arc (2.29)"
+	bool "binutils arc (2.31)"
 	depends on BR2_arc
 endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2018.03"	if BR2_BINUTILS_VERSION_ARC
+	default "arc-2018.09-rc1"	if BR2_BINUTILS_VERSION_ARC
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
diff --git a/package/binutils/arc-2018.03/0002-ld-makefile.patch b/package/binutils/arc-2018.03/0002-ld-makefile.patch
deleted file mode 100644
index a7cd71e63c..0000000000
--- a/package/binutils/arc-2018.03/0002-ld-makefile.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d4e18ebc6ad810167a2de84b185a5f0d65b9ec2d Mon Sep 17 00:00:00 2001
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
-index 625347f..d5334d2 100644
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
-index ba25177..a2cf228 100644
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
-2.9.4
-
diff --git a/package/binutils/arc-2018.03/0003-check-ldrunpath-length.patch b/package/binutils/arc-2018.03/0003-check-ldrunpath-length.patch
deleted file mode 100644
index 3fbc5031d1..0000000000
--- a/package/binutils/arc-2018.03/0003-check-ldrunpath-length.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3bd211025c890ef2971958915d500a9bb2913a2a Mon Sep 17 00:00:00 2001
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
-index d2551b6..70fcb56 100644
---- a/ld/emultempl/elf32.em
-+++ b/ld/emultempl/elf32.em
-@@ -1463,6 +1463,8 @@ fragment <<EOF
- 	      && command_line.rpath == NULL)
- 	    {
- 	      path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((path) && (strlen (path) == 0))
-+	        path = NULL;
- 	      if (path
- 		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
- 		break;
-@@ -1740,6 +1742,8 @@ gld${EMULATION_NAME}_before_allocation (void)
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+    rpath = NULL;
- 
-   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
-     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
--- 
-2.9.4
-
diff --git a/package/binutils/arc-2018.03/0004-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2018.03/0004-add-sysroot-fix-from-bug-3049.patch
deleted file mode 100644
index 9e11840cee..0000000000
--- a/package/binutils/arc-2018.03/0004-add-sysroot-fix-from-bug-3049.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 378bda0e19d279535b3f4a0e448a658a534a5d67 Mon Sep 17 00:00:00 2001
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
-index 3b37a0a..f7e5473 100644
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
-2.9.4
-
diff --git a/package/binutils/arc-2018.03/0005-poison-system-directories.patch b/package/binutils/arc-2018.09-rc1/0005-poison-system-directories.patch
similarity index 89%
rename from package/binutils/arc-2018.03/0005-poison-system-directories.patch
rename to package/binutils/arc-2018.09-rc1/0005-poison-system-directories.patch
index a7c2761a9d..90c7ac760a 100644
--- a/package/binutils/arc-2018.03/0005-poison-system-directories.patch
+++ b/package/binutils/arc-2018.09-rc1/0005-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From b100e9d16bfe6725b2624902af457ecfa490b150 Mon Sep 17 00:00:00 2001
+From 7d1e6ed1d57e839207e0ece7561bd4709032de9f Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 25 Dec 2015 11:45:38 +0100
 Subject: [PATCH] poison-system-directories
@@ -70,7 +70,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  ld/configure    | 14 ++++++++++++++
  ld/configure.ac | 10 ++++++++++
  ld/ld.h         |  8 ++++++++
- ld/ld.texinfo   | 12 ++++++++++++
+ ld/ld.texi      | 12 ++++++++++++
  ld/ldfile.c     | 17 +++++++++++++++++
  ld/ldlex.h      |  2 ++
  ld/ldmain.c     |  2 ++
@@ -78,10 +78,10 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  9 files changed, 89 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
-index 5d91380..ffe84a7 100644
+index d93c9b0..5da2742 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -21,6 +21,9 @@
+@@ -31,6 +31,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -92,10 +92,10 @@ index 5d91380..ffe84a7 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index da20ab5..63e3da7 100755
+index 300a272..d68890f 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -785,6 +785,7 @@ with_lib_path
+@@ -822,6 +822,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -103,7 +103,7 @@ index da20ab5..63e3da7 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1443,6 +1444,8 @@ Optional Features:
+@@ -1486,6 +1487,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -112,7 +112,7 @@ index da20ab5..63e3da7 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15497,7 +15500,18 @@ else
+@@ -15803,7 +15806,18 @@ else
  fi
  
  
@@ -132,10 +132,10 @@ index da20ab5..63e3da7 100755
  # Check whether --enable-got was given.
  if test "${enable_got+set}" = set; then :
 diff --git a/ld/configure.ac b/ld/configure.ac
-index 34315e6..5ade9a0 100644
+index d10c553..9f1b57b 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
-@@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
+@@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
  AC_SUBST(TARGET_SYSTEM_ROOT)
  AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
  
@@ -153,10 +153,10 @@ index 34315e6..5ade9a0 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index 162e156..7d6d7ef 100644
+index ba914b9..9df17da 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
-@@ -177,6 +177,14 @@ typedef struct
+@@ -180,6 +180,14 @@ typedef struct
       in the linker script.  */
    bfd_boolean force_group_allocation;
  
@@ -171,11 +171,11 @@ index 162e156..7d6d7ef 100644
    /* Big or little endian as set on command line.  */
    enum endian_enum endian;
  
-diff --git a/ld/ld.texinfo b/ld/ld.texinfo
-index bb5f719..78501e4 100644
---- a/ld/ld.texinfo
-+++ b/ld/ld.texinfo
-@@ -2480,6 +2480,18 @@ string identifying the original linked file does not change.
+diff --git a/ld/ld.texi b/ld/ld.texi
+index 40d79dd..137d46c 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -2479,6 +2479,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -195,7 +195,7 @@ index bb5f719..78501e4 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index f7e5473..2cd84d3 100644
+index b3d166c..3dcbf66 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
 @@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
@@ -223,10 +223,10 @@ index f7e5473..2cd84d3 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 5aa7f6b..cb655e0 100644
+index 04d6fd5..d7df005 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -147,6 +147,8 @@ enum option_values
+@@ -148,6 +148,8 @@ enum option_values
    OPTION_REQUIRE_DEFINED_SYMBOL,
    OPTION_ORPHAN_HANDLING,
    OPTION_FORCE_GROUP_ALLOCATION,
@@ -236,10 +236,10 @@ index 5aa7f6b..cb655e0 100644
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index ee5ab11..5f6effd 100644
+index f31eeb2..25f8497 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -270,6 +270,8 @@ main (int argc, char **argv)
+@@ -268,6 +268,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -249,10 +249,10 @@ index ee5ab11..5f6effd 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 08106bc..d619d50 100644
+index 86a033a..f07f095 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -538,6 +538,14 @@ static const struct ld_option ld_options[] =
+@@ -543,6 +543,14 @@ static const struct ld_option ld_options[] =
    { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
      '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
      TWO_DASHES },
@@ -267,7 +267,7 @@ index 08106bc..d619d50 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -550,6 +558,7 @@ parse_args (unsigned argc, char **argv)
+@@ -555,6 +563,7 @@ parse_args (unsigned argc, char **argv)
    int ingroup = 0;
    char *default_dirlist = NULL;
    char *shortopts;
@@ -275,9 +275,9 @@ index 08106bc..d619d50 100644
    struct option *longopts;
    struct option *really_longopts;
    int last_optind;
-@@ -1534,6 +1543,14 @@ parse_args (unsigned argc, char **argv)
-           }
-           break;
+@@ -1543,6 +1552,14 @@ parse_args (unsigned argc, char **argv)
+ 	  }
+ 	  break;
  
 +	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
 +	  command_line.poison_system_directories = FALSE;
@@ -290,7 +290,7 @@ index 08106bc..d619d50 100644
  	case OPTION_PUSH_STATE:
  	  input_flags.pushed = xmemdup (&input_flags,
  					sizeof (input_flags),
-@@ -1577,6 +1594,10 @@ parse_args (unsigned argc, char **argv)
+@@ -1586,6 +1603,10 @@ parse_args (unsigned argc, char **argv)
        command_line.soname = NULL;
      }
  
@@ -302,5 +302,5 @@ index 08106bc..d619d50 100644
      {
        lang_leave_group ();
 -- 
-2.9.4
+2.7.4
 
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index d97f55da8a..01d029abf6 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,4 +5,4 @@ sha512  e747ea20d8d79fcd21b9d9f6695059caa7189d60f19256da398e34b789fea9a133c32b19
 sha512  0fca326feb1d5f5fe505a827b20237fe3ec9c13eaf7ec7e35847fd71184f605ba1cefe1314b1b8f8a29c0aa9d88162849ee1c1a3e70c2f7407d88339b17edb30  binutils-2.31.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  bea88164ed48733bad63393fe702e12e651efd113aa4f3fe2e253e05c4c1e5da20b5a99333f0b5528df6d32ce806f799211c568e1916845a87999901dde28817  binutils-arc-2018.03.tar.gz
+sha512  c28c84a725f1fb81ede687c62d61f6a086f389415426a63f0b7b9923f8ab581b64982c37e7e30dc5f7c4ec106eaff61988ef886a91328d8b8eaba2c76ce6d63d  binutils-arc-2018.09-rc1.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 090065a3e4..8b83aa9e56 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,13 +9,13 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2018.03
+BINUTILS_VERSION = arc-2018.09-rc1
 else
 BINUTILS_VERSION = 2.29.1
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2018.03)
+ifeq ($(BINUTILS_VERSION),arc-2018.09-rc1)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 1d4e946f55..6fcd1f1e65 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -9,10 +9,10 @@ choice
 	  Select the version of gcc you wish to use.
 
 config BR2_GCC_VERSION_ARC
-	bool "gcc arc (7.x)"
+	bool "gcc arc (8.x)"
 	# Only supported architecture
 	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_GCC_VERSION_OR1K
 	bool "gcc or1k (5.x)"
@@ -85,7 +85,7 @@ config BR2_GCC_VERSION
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
 	default "7.3.0"     if BR2_GCC_VERSION_7_X
 	default "8.2.0"     if BR2_GCC_VERSION_8_X
-	default "arc-2018.03" if BR2_GCC_VERSION_ARC
+	default "arc-2018.09-rc1" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2018.03/0860-cilk-fix-build-without-wchar.patch b/package/gcc/arc-2018.03/0860-cilk-fix-build-without-wchar.patch
deleted file mode 100644
index 61ab01c713..0000000000
--- a/package/gcc/arc-2018.03/0860-cilk-fix-build-without-wchar.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 714739e69ead1d9823233af40645277f6d4633ea Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Tue, 2 May 2017 23:21:46 +0200
-Subject: [PATCH] cilk: fix build without wchar
-
-When building against uClibc with wchar support disabled, WCHAR_MIN and
-WCHAR_MAX are not defined leading to compilation errors.
-
-Fix it by only including the wchar code if available.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Romain: convert to git patch]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libcilkrts/include/cilk/reducer_min_max.h | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/libcilkrts/include/cilk/reducer_min_max.h b/libcilkrts/include/cilk/reducer_min_max.h
-index 641aa82..4f8e010 100644
---- a/libcilkrts/include/cilk/reducer_min_max.h
-+++ b/libcilkrts/include/cilk/reducer_min_max.h
-@@ -3289,7 +3289,9 @@ __CILKRTS_BEGIN_EXTERN_C
- CILK_C_REDUCER_MAX_INSTANCE(char,               char,       CHAR_MIN)
- CILK_C_REDUCER_MAX_INSTANCE(unsigned char,      uchar,      0)
- CILK_C_REDUCER_MAX_INSTANCE(signed char,        schar,      SCHAR_MIN)
-+#ifdef WCHAR_MIN
- CILK_C_REDUCER_MAX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
-+#endif
- CILK_C_REDUCER_MAX_INSTANCE(short,              short,      SHRT_MIN)
- CILK_C_REDUCER_MAX_INSTANCE(unsigned short,     ushort,     0)
- CILK_C_REDUCER_MAX_INSTANCE(int,                int,        INT_MIN)
-@@ -3441,7 +3443,9 @@ __CILKRTS_BEGIN_EXTERN_C
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(char,               char,       CHAR_MIN)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned char,      uchar,      0)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(signed char,        schar,      SCHAR_MIN)
-+#ifdef WCHAR_MIN
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
-+#endif
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(short,              short,      SHRT_MIN)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned short,     ushort,     0)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(int,                int,        INT_MIN)
-@@ -3567,7 +3571,9 @@ __CILKRTS_BEGIN_EXTERN_C
- CILK_C_REDUCER_MIN_INSTANCE(char,               char,       CHAR_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(signed char,        schar,      SCHAR_MAX)
-+#ifdef WCHAR_MAX
- CILK_C_REDUCER_MIN_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
-+#endif
- CILK_C_REDUCER_MIN_INSTANCE(short,              short,      SHRT_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(int,                int,        INT_MAX)
-@@ -3719,7 +3725,9 @@ __CILKRTS_BEGIN_EXTERN_C
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(char,               char,       CHAR_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(signed char,        schar,      SCHAR_MAX)
-+#ifdef WCHAR_MAX
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
-+#endif
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(short,              short,      SHRT_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(int,                int,        INT_MAX)
--- 
-2.9.3
-
diff --git a/package/gcc/arc-2018.03/0100-uclibc-conf.patch b/package/gcc/arc-2018.09-rc1/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/arc-2018.03/0100-uclibc-conf.patch
rename to package/gcc/arc-2018.09-rc1/0100-uclibc-conf.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 079bf7a2f6..bde5ae9f85 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -10,6 +10,6 @@ sha512  ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19
 sha512  64898a165f67e136d802a92e7633bf1b06c85266027e52127ea025bf5fc2291b5e858288aac0bdba246e6cdf7c6ec88bc8e0e7f3f6f1985f4297710cafde56ed  gcc-8.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  7c6555d629957d154c9c0524fc2c82301c9ab9192f5b9175c47b1f2dde298ac032e86360d91866c3c4d001cf8e191a90dc88f3c900ebfc367c5888ab7bf2ce79  gcc-arc-2018.03.tar.gz
+sha512  13b876c8397fd73ad8e41220f4467a9f22cd97e1d075c114a6247e81c3330830522bbe1befc4be7021aeb588416248fdd0738ba63dace39451fc4757d17befcf  gcc-arc-2018.09-rc1.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index df8817d91d..a2c2303594 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -93,7 +93,7 @@ config BR2_PACKAGE_GDB_NEEDS_CXX11
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2018.03-gdb" if BR2_arc
+	default "arc-2018.09-rc1-gdb" if BR2_arc
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0
 	default "8.1.1"    if BR2_GDB_VERSION_8_1 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index f7c7b80327..aa6544b46c 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e
 sha512  11cc481bebc51eb6db73249ecb62b8c07455cf3db169f4860b3a83114849fbd2b5860a2db64488ba6c5909cf07b255c04770f1e36059eae6bee16d2a3581be90	gdb-8.2.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  b17e4066730491f6a75b00eab78012f67cc445fe95ecd82c06cda7c1255190e6c471ac89b92f2fcdba4790b0046756b9cecf1f827537afcb44e1e578345852ad 	gdb-arc-2018.03-gdb.tar.gz
+sha512  c263782d64650352a5d9009883391a80a04298938aa02a8cbf90f7dbd58b5e92d81acf71df3e9f80e9f26dc125e66890486d7c2d07f78608b75de01d8e1cf2fe 	gdb-arc-2018.09-rc1-gdb.tar.gz
diff --git a/package/glibc/arc-2018.03-release/glibc.hash b/package/glibc/arc-2018.09-rc1/glibc.hash
similarity index 75%
rename from package/glibc/arc-2018.03-release/glibc.hash
rename to package/glibc/arc-2018.09-rc1/glibc.hash
index f3b10d9105..4fc89c2823 100644
--- a/package/glibc/arc-2018.03-release/glibc.hash
+++ b/package/glibc/arc-2018.09-rc1/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  e08ab67b2db2d0f0e8f3311d23c54fb8f6d4c1ef6fa0b4047fd5da400e3ce9de  glibc-arc-2018.03-release.tar.gz
+sha256  b7a6c16f06e1296a64edf5aa4394d82d76719ea8c2af73a72616a030cb3d475d  glibc-arc-2018.09-rc1.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 708c22f723..f68760059b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2018.03-release
+GLIBC_VERSION =  arc-2018.09-rc1
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
