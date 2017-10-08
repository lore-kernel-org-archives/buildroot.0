From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 16:10:27 +0200
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
	arc-2017.09-rc1
Message-ID: <20171008141542.2B9518105A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bd21f991f3fe244893e230f24f6b7213f28dd74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps ARC toolchain to arc-2017.09-rc1.

The arc-2017.09 series is built on top of upstream GCC 7.1.1 and
Binutils 2.29 so please expect all kinds of breakages related to GCC
7.x as we saw earlier with the move from 4.8 to 6.x :)

Note patches for both GCC and Binutils were updated with
copies from corresponding mainline versions, i.e.
"package/gcc/7.2.0" and "package/binutils/2.29".

Please note that it is a release candidate and it might contain some
breakages, please don't use it for production builds.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: drop binutils patch related to the Blackfin architecture.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                    |   2 +-
 .../0002-ld-makefile.patch}                        |  10 +-
 .../0003-check-ldrunpath-length.patch}             |  12 +--
 .../0004-add-sysroot-fix-from-bug-3049.patch}      |  17 ++--
 .../0005-poison-system-directories.patch}          |  54 +++++-----
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   6 +-
 .../0001-ARC-Fix-tst_movb-pattern.patch            |  55 ----------
 .../gcc/arc-2017.03/301-missing-execinfo_h.patch   |  13 ---
 .../arc-2017.03/940-uclinux-enable-threads.patch   |  19 ----
 package/gcc/arc-2017.09-rc1/0100-uclibc-conf.patch |  29 ++++++
 .../0860-cilk-fix-build-without-wchar.patch}       |  24 +++--
 .../arc-2017.09-rc1/0900-remove-selftests.patch    | 111 +++++++++++++++++++++
 .../0910-Update-uses-for-hw-loop-labels.patch      |  63 ++++++++++++
 package/gcc/gcc.hash                               |   2 +-
 package/gdb/Config.in.host                         |   2 +-
 package/gdb/gdb.hash                               |   2 +-
 18 files changed, 276 insertions(+), 149 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index bce1e91..da9d123 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -22,7 +22,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2017.03"	if BR2_arc
+	default "arc-2017.09-rc1"	if BR2_arc
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
diff --git a/package/binutils/arc-2017.03/0300-PATCH-ld-makefile.patch b/package/binutils/arc-2017.09-rc1/0002-ld-makefile.patch
similarity index 87%
rename from package/binutils/arc-2017.03/0300-PATCH-ld-makefile.patch
rename to package/binutils/arc-2017.09-rc1/0002-ld-makefile.patch
index 6b3cd44..a7cd71e 100644
--- a/package/binutils/arc-2017.03/0300-PATCH-ld-makefile.patch
+++ b/package/binutils/arc-2017.09-rc1/0002-ld-makefile.patch
@@ -1,6 +1,6 @@
-From 32078014f734430e1c68fe40aaf970b9805ecaf5 Mon Sep 17 00:00:00 2001
+From d4e18ebc6ad810167a2de84b185a5f0d65b9ec2d Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 21 Apr 2017 21:19:13 +0300
+Date: Fri, 25 Dec 2015 11:40:53 +0100
 Subject: [PATCH] ld-makefile
 
 [Romain: rebase on top of 2.26]
@@ -11,7 +11,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 9dd31ff..553a107 100644
+index 625347f..d5334d2 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -57,7 +57,7 @@ endif
@@ -24,7 +24,7 @@ index 9dd31ff..553a107 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index c464302..feb34ba 100644
+index ba25177..a2cf228 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
 @@ -446,7 +446,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
@@ -37,5 +37,5 @@ index c464302..feb34ba 100644
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
 -- 
-2.7.4
+2.9.4
 
diff --git a/package/binutils/arc-2017.03/0301-PATCH-check-ldrunpath-length.patch b/package/binutils/arc-2017.09-rc1/0003-check-ldrunpath-length.patch
similarity index 79%
rename from package/binutils/arc-2017.03/0301-PATCH-check-ldrunpath-length.patch
rename to package/binutils/arc-2017.09-rc1/0003-check-ldrunpath-length.patch
index 9bb2341..3fbc503 100644
--- a/package/binutils/arc-2017.03/0301-PATCH-check-ldrunpath-length.patch
+++ b/package/binutils/arc-2017.09-rc1/0003-check-ldrunpath-length.patch
@@ -1,6 +1,6 @@
-From 4a5a8b983fb31a67f976e0dd9cf5e8580ef55098 Mon Sep 17 00:00:00 2001
+From 3bd211025c890ef2971958915d500a9bb2913a2a Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 21 Apr 2017 21:23:55 +0300
+Date: Fri, 25 Dec 2015 11:41:47 +0100
 Subject: [PATCH] check-ldrunpath-length
 
 [Romain: rebase on top of 2.26]
@@ -10,10 +10,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index d4837d0..937da8a 100644
+index d2551b6..70fcb56 100644
 --- a/ld/emultempl/elf32.em
 +++ b/ld/emultempl/elf32.em
-@@ -1460,6 +1460,8 @@ fragment <<EOF
+@@ -1463,6 +1463,8 @@ fragment <<EOF
  	      && command_line.rpath == NULL)
  	    {
  	      path = (const char *) getenv ("LD_RUN_PATH");
@@ -22,7 +22,7 @@ index d4837d0..937da8a 100644
  	      if (path
  		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
  		break;
-@@ -1737,6 +1739,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+@@ -1740,6 +1742,8 @@ gld${EMULATION_NAME}_before_allocation (void)
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
@@ -32,5 +32,5 @@ index d4837d0..937da8a 100644
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
 -- 
-2.7.4
+2.9.4
 
diff --git a/package/binutils/arc-2017.03/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2017.09-rc1/0004-add-sysroot-fix-from-bug-3049.patch
similarity index 80%
rename from package/binutils/arc-2017.03/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2017.09-rc1/0004-add-sysroot-fix-from-bug-3049.patch
index 0331088..9e11840 100644
--- a/package/binutils/arc-2017.03/0500-add-sysroot-fix-from-bug-3049.patch
+++ b/package/binutils/arc-2017.09-rc1/0004-add-sysroot-fix-from-bug-3049.patch
@@ -1,4 +1,4 @@
-From 30628870e583375f8927c04398c7219c6e9f703c Mon Sep 17 00:00:00 2001
+From 378bda0e19d279535b3f4a0e448a658a534a5d67 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 25 Dec 2015 11:42:48 +0100
 Subject: [PATCH] add sysroot fix from bug #3049
@@ -12,13 +12,14 @@ Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
 [Romain: rebase on top of 2.26]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
- ld/ldfile.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
+ ld/ldfile.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
 
-diff --git a/ld/ldfile.c diff --git b/ld/ldfile.c
---- a/ld/ldfile.c	2017-03-02 03:23:54.000000000 -0500
-+++ b/ld/ldfile.c	2017-03-20 09:52:27.687415942 -0400
-@@ -336,18 +336,24 @@
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 3b37a0a..f7e5473 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -338,18 +338,24 @@ ldfile_open_file_search (const char *arch,
       directory first.  */
    if (!entry->flags.maybe_archive)
      {
@@ -45,4 +46,6 @@ diff --git a/ld/ldfile.c diff --git b/ld/ldfile.c
  	return TRUE;
  
        if (IS_ABSOLUTE_PATH (entry->filename))
+-- 
+2.9.4
 
diff --git a/package/binutils/arc-2017.03/0600-poison-system-directories.patch b/package/binutils/arc-2017.09-rc1/0005-poison-system-directories.patch
similarity index 89%
rename from package/binutils/arc-2017.03/0600-poison-system-directories.patch
rename to package/binutils/arc-2017.09-rc1/0005-poison-system-directories.patch
index bb1a7b4..a7c2761 100644
--- a/package/binutils/arc-2017.03/0600-poison-system-directories.patch
+++ b/package/binutils/arc-2017.09-rc1/0005-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From be366461dd49e760440fb28eaee5164eb281adcc Mon Sep 17 00:00:00 2001
+From b100e9d16bfe6725b2624902af457ecfa490b150 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 25 Dec 2015 11:45:38 +0100
 Subject: [PATCH] poison-system-directories
@@ -78,10 +78,10 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  9 files changed, 89 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
-index 276fb77..35c58eb 100644
+index 5d91380..ffe84a7 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -17,6 +17,9 @@
+@@ -21,6 +21,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -92,10 +92,10 @@ index 276fb77..35c58eb 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index a446283..d1f9504 100755
+index da20ab5..63e3da7 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -789,6 +789,7 @@ with_lib_path
+@@ -785,6 +785,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -103,7 +103,7 @@ index a446283..d1f9504 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1446,6 +1447,8 @@ Optional Features:
+@@ -1443,6 +1444,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -112,7 +112,7 @@ index a446283..d1f9504 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15499,7 +15502,18 @@ else
+@@ -15497,7 +15500,18 @@ else
  fi
  
  
@@ -132,7 +132,7 @@ index a446283..d1f9504 100755
  # Check whether --enable-got was given.
  if test "${enable_got+set}" = set; then :
 diff --git a/ld/configure.ac b/ld/configure.ac
-index 188172d..2cd8443 100644
+index 34315e6..5ade9a0 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
@@ -153,12 +153,12 @@ index 188172d..2cd8443 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index d84ec4e..3476b26 100644
+index 162e156..7d6d7ef 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
-@@ -172,6 +172,14 @@ typedef struct {
-   /* If set, display the target memory usage (per memory region).  */
-   bfd_boolean print_memory_usage;
+@@ -177,6 +177,14 @@ typedef struct
+      in the linker script.  */
+   bfd_boolean force_group_allocation;
  
 +  /* If TRUE (the default) warn for uses of system directories when
 +     cross linking.  */
@@ -172,10 +172,10 @@ index d84ec4e..3476b26 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texinfo b/ld/ld.texinfo
-index 1dd7492..fb1438e 100644
+index bb5f719..78501e4 100644
 --- a/ld/ld.texinfo
 +++ b/ld/ld.texinfo
-@@ -2403,6 +2403,18 @@ string identifying the original linked file does not change.
+@@ -2480,6 +2480,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -195,11 +195,11 @@ index 1dd7492..fb1438e 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 1439309..086b354 100644
+index f7e5473..2cd84d3 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -114,6 +114,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
-     new_dirs->name = concat (ld_sysroot, name + 1, (const char *) NULL);
+@@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
+     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
    else
      new_dirs->name = xstrdup (name);
 +
@@ -223,20 +223,20 @@ index 1439309..086b354 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 6f11e7b..0ca3110 100644
+index 5aa7f6b..cb655e0 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -146,6 +146,8 @@ enum option_values
-   OPTION_PRINT_MEMORY_USAGE,
+@@ -147,6 +147,8 @@ enum option_values
    OPTION_REQUIRE_DEFINED_SYMBOL,
    OPTION_ORPHAN_HANDLING,
+   OPTION_FORCE_GROUP_ALLOCATION,
 +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
 +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
  };
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index bb0b9cc..a23c56c 100644
+index ee5ab11..5f6effd 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
 @@ -270,6 +270,8 @@ main (int argc, char **argv)
@@ -249,10 +249,10 @@ index bb0b9cc..a23c56c 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 4cad209..be7d584 100644
+index 08106bc..d619d50 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -535,6 +535,14 @@ static const struct ld_option ld_options[] =
+@@ -538,6 +538,14 @@ static const struct ld_option ld_options[] =
    { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
      '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
      TWO_DASHES },
@@ -267,7 +267,7 @@ index 4cad209..be7d584 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -547,6 +555,7 @@ parse_args (unsigned argc, char **argv)
+@@ -550,6 +558,7 @@ parse_args (unsigned argc, char **argv)
    int ingroup = 0;
    char *default_dirlist = NULL;
    char *shortopts;
@@ -275,7 +275,7 @@ index 4cad209..be7d584 100644
    struct option *longopts;
    struct option *really_longopts;
    int last_optind;
-@@ -1528,6 +1537,14 @@ parse_args (unsigned argc, char **argv)
+@@ -1534,6 +1543,14 @@ parse_args (unsigned argc, char **argv)
            }
            break;
  
@@ -290,7 +290,7 @@ index 4cad209..be7d584 100644
  	case OPTION_PUSH_STATE:
  	  input_flags.pushed = xmemdup (&input_flags,
  					sizeof (input_flags),
-@@ -1571,6 +1588,10 @@ parse_args (unsigned argc, char **argv)
+@@ -1577,6 +1594,10 @@ parse_args (unsigned argc, char **argv)
        command_line.soname = NULL;
      }
  
@@ -302,5 +302,5 @@ index 4cad209..be7d584 100644
      {
        lang_leave_group ();
 -- 
-2.4.3
+2.9.4
 
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 6e35c5c..59bcbcb 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512	dc5b6872ae01c07c12d38f3bb7ead06effc6da3265ac872e2d9c6104304f89f85f2645b02
 sha512  d748d22306477d60d921078804d21943248c23fca0707aac9b016a352c01c75ca69e82624ae37fb0bbd03af3b17088a94f60dfe1a86a7ff82e18ece3c24f0fd0  binutils-2.29.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  07d5639e74eafe8fced259870c1a7dedee67c534573dda53fb78ee1ffeec9e17479fdde41dccd03b1cf0248023acbef7f66013398b2f722e4a8891ac680d1d16  binutils-arc-2017.03.tar.gz
+sha512  7017056456805c472930a13997e5d5da1031492da7534b09ecaab7c1953ea62513f2c12292c16ec5740acb63493802a30642e28e103919215d0d11e1da997bcb  binutils-arc-2017.09-rc1.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 34739d7..7ab422e 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2017.03
+BINUTILS_VERSION = arc-2017.09-rc1
 else
 BINUTILS_VERSION = 2.28.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0926560..1115554 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -9,10 +9,10 @@ choice
 	  Select the version of gcc you wish to use.
 
 config BR2_GCC_VERSION_ARC
-	bool "gcc arc (6.x)"
+	bool "gcc arc (7.x)"
 	# Only supported architecture
 	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_GCC_VERSION_OR1K
 	bool "gcc or1k (5.x)"
@@ -92,7 +92,7 @@ config BR2_GCC_VERSION
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
 	default "7.2.0"     if BR2_GCC_VERSION_7_X
-	default "arc-2017.03" if BR2_GCC_VERSION_ARC
+	default "arc-2017.09-rc1" if BR2_GCC_VERSION_ARC
 	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2017.03/0001-ARC-Fix-tst_movb-pattern.patch b/package/gcc/arc-2017.03/0001-ARC-Fix-tst_movb-pattern.patch
deleted file mode 100644
index 3b09a13..0000000
--- a/package/gcc/arc-2017.03/0001-ARC-Fix-tst_movb-pattern.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 08235ef444fd32d311fc9edb65895133820462e3 Mon Sep 17 00:00:00 2001
-From: claziss <claziss@synopsys.com>
-Date: Wed, 24 May 2017 12:53:43 +0200
-Subject: [PATCH] [ARC] Fix tst_movb pattern.
-
-The tst_movb pattern is missing guarding when spitting.
-
-gcc/
-2017-05-24  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.md (tst_movb): Add guard when splitting.
-
-testsuite/
-2017-05-24  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* gcc.target/arc/pr9001195952.c: New test.
----
- gcc/config/arc/arc.md                       |  2 +-
- gcc/testsuite/gcc.target/arc/pr9001195952.c | 11 +++++++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
- create mode 100755 gcc/testsuite/gcc.target/arc/pr9001195952.c
-
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index e78abaaafc42..d5510aeb0600 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -863,7 +863,7 @@ archs4xd, archs4xd_slow"
-    (clobber (match_scratch:SI 3 "=X,X,X,X,X,X,Rrq,Rrq,c"))]
-   "TARGET_NPS_BITOPS"
-   "movb.f.cl %3,%1,%p2,%p2,%s2"
--  "reload_completed
-+  "TARGET_NPS_BITOPS && reload_completed
-    && (extract_constrain_insn_cached (insn), (which_alternative & ~1) != 6)"
-   [(set (match_dup 0) (match_dup 4))])
- 
-diff --git a/gcc/testsuite/gcc.target/arc/pr9001195952.c b/gcc/testsuite/gcc.target/arc/pr9001195952.c
-new file mode 100755
-index 000000000000..252438d8d78b
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/arc/pr9001195952.c
-@@ -0,0 +1,11 @@
-+/* { dg-do compile } */
-+/* { dg-skip-if "" { ! { clmcpu } } } */
-+/* { dg-options "-mcpu=archs -Os -w -fpic" } */
-+
-+/* tst_movb split pattern is wrong for anything else than NPS
-+   chip.  */
-+__bswap_32___bsx() {
-+  int a = __builtin_bswap32(__bswap_32___bsx);
-+  if (a & 1048575)
-+    zlog_warn();
-+}
--- 
-2.7.4
-
diff --git a/package/gcc/arc-2017.03/301-missing-execinfo_h.patch b/package/gcc/arc-2017.03/301-missing-execinfo_h.patch
deleted file mode 100644
index 2d0e7ba..0000000
--- a/package/gcc/arc-2017.03/301-missing-execinfo_h.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: b/boehm-gc/include/gc.h
-===================================================================
---- a/boehm-gc/include/gc.h
-+++ b/boehm-gc/include/gc.h
-@@ -503,7 +503,7 @@
- #if defined(__linux__) || defined(__GLIBC__)
- # include <features.h>
- # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
--     && !defined(__ia64__)
-+     && !defined(__ia64__) && !defined(__UCLIBC__)
- #   ifndef GC_HAVE_BUILTIN_BACKTRACE
- #     define GC_HAVE_BUILTIN_BACKTRACE
- #   endif
diff --git a/package/gcc/arc-2017.03/940-uclinux-enable-threads.patch b/package/gcc/arc-2017.03/940-uclinux-enable-threads.patch
deleted file mode 100644
index 5532656..0000000
--- a/package/gcc/arc-2017.03/940-uclinux-enable-threads.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Enable POSIX threads for uClinux targets
-Reported upstream:
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71721
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-6.1.0.orig/gcc/config.gcc gcc-6.1.0/gcc/config.gcc
---- gcc-6.1.0.orig/gcc/config.gcc	2016-04-11 12:14:59.000000000 +0200
-+++ gcc-6.1.0/gcc/config.gcc	2016-07-02 20:04:25.732169982 +0200
-@@ -833,6 +833,9 @@
- *-*-uclinux*)
-   extra_options="$extra_options gnu-user.opt"
-   use_gcc_stdint=wrap
-+  case ${enable_threads} in
-+    "" | yes | posix) thread_file='posix' ;;
-+  esac
-   tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC SINGLE_LIBC"
-   ;;
- *-*-rdos*)
diff --git a/package/gcc/arc-2017.09-rc1/0100-uclibc-conf.patch b/package/gcc/arc-2017.09-rc1/0100-uclibc-conf.patch
new file mode 100644
index 0000000..d354baf
--- /dev/null
+++ b/package/gcc/arc-2017.09-rc1/0100-uclibc-conf.patch
@@ -0,0 +1,29 @@
+From 326b880b20e5f8187dbda736b4c4c662cbfb00ca Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 2 May 2017 22:36:15 +0200
+Subject: [PATCH] uclibc-conf
+
+[Romain: convert to git patch]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ contrib/regression/objs-gcc.sh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/contrib/regression/objs-gcc.sh b/contrib/regression/objs-gcc.sh
+index 60b0497..6dc7ead 100755
+--- a/contrib/regression/objs-gcc.sh
++++ b/contrib/regression/objs-gcc.sh
+@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-gnu ]
+  then
+   make all-gdb all-dejagnu all-ld || exit 1
+   make install-gdb install-dejagnu install-ld || exit 1
++elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
++ then
++  make all-gdb all-dejagnu all-ld || exit 1
++  make install-gdb install-dejagnu install-ld || exit 1
+ elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
+   make bootstrap || exit 1
+   make install || exit 1
+-- 
+2.9.3
+
diff --git a/package/gcc/arc-2017.03/860-cilk-wchar.patch b/package/gcc/arc-2017.09-rc1/0860-cilk-fix-build-without-wchar.patch
similarity index 79%
rename from package/gcc/arc-2017.03/860-cilk-wchar.patch
rename to package/gcc/arc-2017.09-rc1/0860-cilk-fix-build-without-wchar.patch
index 1d9916f..61ab01c 100644
--- a/package/gcc/arc-2017.03/860-cilk-wchar.patch
+++ b/package/gcc/arc-2017.09-rc1/0860-cilk-fix-build-without-wchar.patch
@@ -1,4 +1,7 @@
-[PATCH] cilk: fix build without wchar
+From 714739e69ead1d9823233af40645277f6d4633ea Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Tue, 2 May 2017 23:21:46 +0200
+Subject: [PATCH] cilk: fix build without wchar
 
 When building against uClibc with wchar support disabled, WCHAR_MIN and
 WCHAR_MAX are not defined leading to compilation errors.
@@ -6,15 +9,17 @@ WCHAR_MAX are not defined leading to compilation errors.
 Fix it by only including the wchar code if available.
 
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Romain: convert to git patch]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
- libcilkrts/include/cilk/reducer_min_max.h |    8 ++++++++
+ libcilkrts/include/cilk/reducer_min_max.h | 8 ++++++++
  1 file changed, 8 insertions(+)
 
-Index: b/libcilkrts/include/cilk/reducer_min_max.h
-===================================================================
+diff --git a/libcilkrts/include/cilk/reducer_min_max.h b/libcilkrts/include/cilk/reducer_min_max.h
+index 641aa82..4f8e010 100644
 --- a/libcilkrts/include/cilk/reducer_min_max.h
 +++ b/libcilkrts/include/cilk/reducer_min_max.h
-@@ -3154,7 +3154,9 @@
+@@ -3289,7 +3289,9 @@ __CILKRTS_BEGIN_EXTERN_C
  CILK_C_REDUCER_MAX_INSTANCE(char,               char,       CHAR_MIN)
  CILK_C_REDUCER_MAX_INSTANCE(unsigned char,      uchar,      0)
  CILK_C_REDUCER_MAX_INSTANCE(signed char,        schar,      SCHAR_MIN)
@@ -24,7 +29,7 @@ Index: b/libcilkrts/include/cilk/reducer_min_max.h
  CILK_C_REDUCER_MAX_INSTANCE(short,              short,      SHRT_MIN)
  CILK_C_REDUCER_MAX_INSTANCE(unsigned short,     ushort,     0)
  CILK_C_REDUCER_MAX_INSTANCE(int,                int,        INT_MIN)
-@@ -3306,7 +3308,9 @@
+@@ -3441,7 +3443,9 @@ __CILKRTS_BEGIN_EXTERN_C
  CILK_C_REDUCER_MAX_INDEX_INSTANCE(char,               char,       CHAR_MIN)
  CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned char,      uchar,      0)
  CILK_C_REDUCER_MAX_INDEX_INSTANCE(signed char,        schar,      SCHAR_MIN)
@@ -34,7 +39,7 @@ Index: b/libcilkrts/include/cilk/reducer_min_max.h
  CILK_C_REDUCER_MAX_INDEX_INSTANCE(short,              short,      SHRT_MIN)
  CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned short,     ushort,     0)
  CILK_C_REDUCER_MAX_INDEX_INSTANCE(int,                int,        INT_MIN)
-@@ -3432,7 +3436,9 @@
+@@ -3567,7 +3571,9 @@ __CILKRTS_BEGIN_EXTERN_C
  CILK_C_REDUCER_MIN_INSTANCE(char,               char,       CHAR_MAX)
  CILK_C_REDUCER_MIN_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
  CILK_C_REDUCER_MIN_INSTANCE(signed char,        schar,      SCHAR_MAX)
@@ -44,7 +49,7 @@ Index: b/libcilkrts/include/cilk/reducer_min_max.h
  CILK_C_REDUCER_MIN_INSTANCE(short,              short,      SHRT_MAX)
  CILK_C_REDUCER_MIN_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
  CILK_C_REDUCER_MIN_INSTANCE(int,                int,        INT_MAX)
-@@ -3584,7 +3590,9 @@
+@@ -3719,7 +3725,9 @@ __CILKRTS_BEGIN_EXTERN_C
  CILK_C_REDUCER_MIN_INDEX_INSTANCE(char,               char,       CHAR_MAX)
  CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
  CILK_C_REDUCER_MIN_INDEX_INSTANCE(signed char,        schar,      SCHAR_MAX)
@@ -54,3 +59,6 @@ Index: b/libcilkrts/include/cilk/reducer_min_max.h
  CILK_C_REDUCER_MIN_INDEX_INSTANCE(short,              short,      SHRT_MAX)
  CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
  CILK_C_REDUCER_MIN_INDEX_INSTANCE(int,                int,        INT_MAX)
+-- 
+2.9.3
+
diff --git a/package/gcc/arc-2017.09-rc1/0900-remove-selftests.patch b/package/gcc/arc-2017.09-rc1/0900-remove-selftests.patch
new file mode 100644
index 0000000..a3bc7a5
--- /dev/null
+++ b/package/gcc/arc-2017.09-rc1/0900-remove-selftests.patch
@@ -0,0 +1,111 @@
+From 63f0917d90eb83d267dc517fdfb6523a74b1917c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 3 May 2017 00:37:06 +0200
+Subject: [PATCH] remove selftests
+
+When the gcc archive is extracted by the gcc.mk, the gcc/testsuite
+is excluded:
+
+HOST_GCC_EXCLUDES = \
+	libjava/* libgo/* \
+	gcc/testsuite/* libstdc++-v3/testsuite/*
+
+The new Makefile target from the "Selftest framework" [1] added a dependency
+on the gcc/testsuite/Makefile.
+Revert partially the commit [1] to allow building gcc without selftest.
+
+[1] https://github.com/gcc-mirror/gcc/commit/99b4f3a2d5bf2c137de9731e27b483eb6b462fd9
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/Makefile.in | 46 +++++-----------------------------------------
+ 1 file changed, 5 insertions(+), 41 deletions(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 74d1912..652a554 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -1581,14 +1581,13 @@ OBJS = \
+ OBJS-libcommon = diagnostic.o diagnostic-color.o diagnostic-show-locus.o \
+ 	edit-context.o \
+ 	pretty-print.o intl.o \
+-	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o \
+-	selftest.o
++	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o
+ 
+ # Objects in libcommon-target.a, used by drivers and by the core
+ # compiler and containing target-dependent code.
+ OBJS-libcommon-target = $(common_out_object_file) prefix.o params.o \
+ 	opts.o opts-common.o options.o vec.o hooks.o common/common-targhooks.o \
+-	hash-table.o file-find.o spellcheck.o selftest.o
++	hash-table.o file-find.o spellcheck.o
+ 
+ # This lists all host objects for the front ends.
+ ALL_HOST_FRONTEND_OBJS = $(foreach v,$(CONFIG_LANGUAGES),$($(v)_OBJS))
+@@ -1865,10 +1864,10 @@ config.status: $(srcdir)/configure $(srcdir)/config.gcc
+ quickstrap: all
+ 	cd $(toplevel_builddir) && $(MAKE) all-target-libgcc
+ 
+-all.internal: start.encap rest.encap doc selftest
++all.internal: start.encap rest.encap doc
+ # This is what to compile if making a cross-compiler.
+ all.cross: native gcc-cross$(exeext) cpp$(exeext) specs \
+-	libgcc-support lang.all.cross doc selftest @GENINSRC@ srcextra
++	libgcc-support lang.all.cross doc @GENINSRC@ srcextra
+ # This is what must be made before installing GCC and converting libraries.
+ start.encap: native xgcc$(exeext) cpp$(exeext) specs \
+ 	libgcc-support lang.start.encap @GENINSRC@ srcextra
+@@ -1888,41 +1887,6 @@ endif
+ # This does the things that can't be done on the host machine.
+ rest.cross: specs
+ 
+-# GCC's selftests.
+-# Specify a dummy input file to placate the driver.
+-# Specify -nostdinc to work around missing WIND_BASE environment variable
+-# required for *-wrs-vxworks-* targets.
+-# Specify -o /dev/null so the output of -S is discarded. More importantly
+-# It does not try to create a file with the name "null.s" on POSIX and
+-# "nul.s" on Windows. Because on Windows "nul" is a reserved file name.
+-# Specify the path to gcc/testsuite/selftests within the srcdir
+-# as an argument to -fself-test.
+-SELFTEST_FLAGS = -nostdinc -x c /dev/null -S -o /dev/null \
+-	-fself-test=$(srcdir)/testsuite/selftests
+-
+-# Run the selftests during the build once we have a driver and a cc1,
+-# so that self-test failures are caught as early as possible.
+-# Use "s-selftest" to ensure that we only run the selftests if the
+-# driver, cc1, or selftest data change.
+-.PHONY: selftest
+-selftest: s-selftest
+-s-selftest: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs \
+-  $(srcdir)/testsuite/selftests
+-	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS)
+-	$(STAMP) $@
+-
+-# Convenience method for running selftests under gdb:
+-.PHONY: selftest-gdb
+-selftest-gdb: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs
+-	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS) \
+-	  -wrapper gdb,--args
+-
+-# Convenience method for running selftests under valgrind:
+-.PHONY: selftest-valgrind
+-selftest-valgrind: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs
+-	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS) \
+-	  -wrapper valgrind,--leak-check=full
+-
+ # Recompile all the language-independent object files.
+ # This is used only if the user explicitly asks for it.
+ compilations: $(BACKEND)
+@@ -2076,7 +2040,7 @@ gcc-nm.c: gcc-ar.c
+ 	cp $^ $@
+ 
+ COLLECT2_OBJS = collect2.o collect2-aix.o tlink.o vec.o ggc-none.o \
+-  collect-utils.o file-find.o hash-table.o selftest.o
++  collect-utils.o file-find.o hash-table.o
+ COLLECT2_LIBS = @COLLECT2_LIBS@
+ collect2$(exeext): $(COLLECT2_OBJS) $(LIBDEPS)
+ # Don't try modifying collect2 (aka ld) in place--it might be linking this.
+-- 
+2.9.3
+
diff --git a/package/gcc/arc-2017.09-rc1/0910-Update-uses-for-hw-loop-labels.patch b/package/gcc/arc-2017.09-rc1/0910-Update-uses-for-hw-loop-labels.patch
new file mode 100644
index 0000000..c703909
--- /dev/null
+++ b/package/gcc/arc-2017.09-rc1/0910-Update-uses-for-hw-loop-labels.patch
@@ -0,0 +1,63 @@
+From cb7f97fb860b5286d3470ccda0f623f4657780a3 Mon Sep 17 00:00:00 2001
+From: claziss <claziss@synopsys.com>
+Date: Tue, 19 Sep 2017 15:45:19 +0200
+Subject: [PATCH] [ARC][ZOL] Update uses for hw-loop labels.
+
+Make sure we mark the hw-loop labels as beeing used.
+
+gcc/
+2017-09-19  Claudiu Zissulescu  <claziss@synopsys.com>
+
+	* config/arc/arc.c (hwloop_optimize): Update hw-loop's end/start
+	labels number of usages.
+
+gcc/testsuite
+2017-09-19  Claudiu Zissulescu  <claziss@synopsys.com>
+
+	* gcc.target/arc/loop-2.cpp: New test.
+---
+ gcc/config/arc/arc.c                    |  3 +++
+ gcc/testsuite/gcc.target/arc/arc.exp    |  2 +-
+ gcc/testsuite/gcc.target/arc/loop-2.cpp | 18 ++++++++++++++++++
+ 3 files changed, 22 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/arc/loop-2.cpp
+
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index 5c0a872cc97..cc7fc624ff2 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -7613,6 +7613,9 @@ hwloop_optimize (hwloop_info loop)
+   /* Insert the loop end label before the last instruction of the
+      loop.  */
+   emit_label_after (end_label, loop->last_insn);
++  /* Make sure we mark the begining and end label as used.  */
++  LABEL_NUSES (loop->end_label)++;
++  LABEL_NUSES (loop->start_label)++;
+ 
+   return true;
+ }
+diff --git a/gcc/testsuite/gcc.target/arc/loop-2.cpp b/gcc/testsuite/gcc.target/arc/loop-2.cpp
+new file mode 100644
+index 00000000000..d1dc917ba47
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arc/loop-2.cpp
+@@ -0,0 +1,18 @@
++/* { dg-options "-O2" } *
++/* { dg-do assemble } */
++
++/* This file fails to assemble if we forgot to increase the number of
++   uses for loop's start and end labels.  */
++int a, c, d;
++int *b;
++void fn1(int p1) {
++  if (d == 5)
++    for (int i; i < p1; ++i)
++      if (c)
++        b[i] = c;
++      else
++        int t = a = t;
++  else
++    for (int i; i < p1; ++i)
++      b[i] = 0;
++}
+
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index f35a2e2..7d4d435 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,6 +8,6 @@ sha512  02c60e54527c7adf584798d5251f8a0b80c93d5deafce82501b2c28e6692e0bd783927bb
 sha512  f853cd6530b4055d8d8289da74687cb4c6d5f363598d386332d31852b581bac76c3adb7d61889edec3b779f63d8646f0122840f12965ce4a4389ba535dbbb6e1  gcc-7.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  282f76b8b63372f5b4426092b80d36da96cd0bda2a8588405b9ec22806c69fafb696b0e0df65bc36c3c3aa8ce5befc24246fd5c6ddb21dcde01f45f7b11ff7c4  gcc-arc-2017.03.tar.gz
+sha512  c30255dc937e23f6388b4c640455114bcf86cffe923191e32d33ffcde6c4980e9d1811e85877fed3e414ed069cc3e2013993ed76331088ff0846ac50421cb426  gcc-arc-2017.09-rc1.tar.gz
 # Locally calculated (fetched from Github)
 sha512  841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f  gcc-musl-5.4.0.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 3e59187..c2cfc34 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -64,7 +64,7 @@ endif
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2017.03-gdb" if BR2_arc
+	default "arc-2017.09-rc1-gdb" if BR2_arc
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index d82aa1c..d891d25 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7
 sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  8ec849a5ea1c16f104c51c4813c35ab229e460eef0025967673b87316f62b5171f05448cda018464914d43d2da50b2902eb7f9f060d0af1368a9db111f959668	gdb-arc-2017.03-gdb.tar.gz
+sha512  4c6f800ff8f95740b8f7f0544d332c2c36ba693c51f6d3d99a0b0ca5a617cb67bcc6f60bd481cd4b884494f9bce531ac5cb270d1c6f8fc5c067100ec77c098d8 	gdb-arc-2017.09-rc1-gdb.tar.gz
