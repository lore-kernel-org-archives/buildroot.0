From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Fri, 21 Apr 2017 22:00:46 +0300
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.03-rc1
Message-ID: <1492801246-21302-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps ARC toolchain to arc-2017.03-rc1

Please note that it is a release candidate and it might contain some
breakages, please don't use it for production builds.

Also I have updated pathces for binutils as our auto-generated files in
binutils differ comparing to 2.28.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 package/binutils/Config.in.host                    |  2 +-
 .../0300-PATCH-ld-makefile.patch}                  | 17 +++++++-------
 .../0301-PATCH-check-ldrunpath-length.patch}       | 27 +++++++++++-----------
 .../0500-add-sysroot-fix-from-bug-3049.patch       | 22 ++++++++----------
 .../0600-poison-system-directories.patch           | 24 +++++++++----------
 package/binutils/binutils.hash                     |  2 +-
 package/binutils/binutils.mk                       |  2 +-
 package/gcc/Config.in.host                         |  2 +-
 .../301-missing-execinfo_h.patch                   |  0
 .../860-cilk-wchar.patch                           |  0
 .../940-uclinux-enable-threads.patch               |  0
 package/gcc/gcc.hash                               |  2 +-
 package/gdb/Config.in.host                         |  2 +-
 package/gdb/gdb.hash                               |  2 +-
 14 files changed, 51 insertions(+), 53 deletions(-)
 rename package/binutils/{arc-2017.03-eng008/0300-ld-makefile.patch => arc-2017.03-rc1/0300-PATCH-ld-makefile.patch} (73%)
 rename package/binutils/{arc-2017.03-eng008/0301-check-ldrunpath-length.patch => arc-2017.03-rc1/0301-PATCH-check-ldrunpath-length.patch} (54%)
 rename package/binutils/{arc-2017.03-eng008 => arc-2017.03-rc1}/0500-add-sysroot-fix-from-bug-3049.patch (72%)
 rename package/binutils/{arc-2017.03-eng008 => arc-2017.03-rc1}/0600-poison-system-directories.patch (94%)
 rename package/gcc/{arc-2017.03-eng008 => arc-2017.03-rc1}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{arc-2017.03-eng008 => arc-2017.03-rc1}/860-cilk-wchar.patch (100%)
 rename package/gcc/{arc-2017.03-eng008 => arc-2017.03-rc1}/940-uclinux-enable-threads.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 0165510..308322a 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -20,7 +20,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2017.03-eng008"	if BR2_arc
+	default "arc-2017.03-rc1"	if BR2_arc
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
 	default "2.28"		if BR2_BINUTILS_VERSION_2_28_X
diff --git a/package/binutils/arc-2017.03-eng008/0300-ld-makefile.patch b/package/binutils/arc-2017.03-rc1/0300-PATCH-ld-makefile.patch
similarity index 73%
rename from package/binutils/arc-2017.03-eng008/0300-ld-makefile.patch
rename to package/binutils/arc-2017.03-rc1/0300-PATCH-ld-makefile.patch
index 73cc098..308e54c 100644
--- a/package/binutils/arc-2017.03-eng008/0300-ld-makefile.patch
+++ b/package/binutils/arc-2017.03-rc1/0300-PATCH-ld-makefile.patch
@@ -1,17 +1,18 @@
-From d76a7549b43974fe8564971a3f40459bc495a8a7 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:40:53 +0100
-Subject: [PATCH] ld-makefile
+From 32078014f734430e1c68fe40aaf970b9805ecaf5 Mon Sep 17 00:00:00 2001
+From: Vlad Zakharov <vzakhar@synopsys.com>
+Date: Fri, 21 Apr 2017 21:19:13 +0300
+Subject: [PATCH] [PATCH] ld-makefile
 
 [Romain: rebase on top of 2.26]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
 ---
  ld/Makefile.am | 2 +-
  ld/Makefile.in | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 0b3b049..3871c74 100644
+index 9dd31ff..553a107 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -57,7 +57,7 @@ endif
@@ -24,10 +25,10 @@ index 0b3b049..3871c74 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index ed98f87..530e4c9 100644
+index c464302..feb34ba 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -413,7 +413,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+@@ -446,7 +446,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -37,5 +38,5 @@ index ed98f87..530e4c9 100644
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
 -- 
-2.4.3
+2.7.4
 
diff --git a/package/binutils/arc-2017.03-eng008/0301-check-ldrunpath-length.patch b/package/binutils/arc-2017.03-rc1/0301-PATCH-check-ldrunpath-length.patch
similarity index 54%
rename from package/binutils/arc-2017.03-eng008/0301-check-ldrunpath-length.patch
rename to package/binutils/arc-2017.03-rc1/0301-PATCH-check-ldrunpath-length.patch
index 3b4c204..f49a2fa 100644
--- a/package/binutils/arc-2017.03-eng008/0301-check-ldrunpath-length.patch
+++ b/package/binutils/arc-2017.03-rc1/0301-PATCH-check-ldrunpath-length.patch
@@ -1,36 +1,37 @@
-From ebe1cba46df52d7bf86def3d681271fd05fb453b Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:41:47 +0100
-Subject: [PATCH] check-ldrunpath-length
+From 4a5a8b983fb31a67f976e0dd9cf5e8580ef55098 Mon Sep 17 00:00:00 2001
+From: Vlad Zakharov <vzakhar@synopsys.com>
+Date: Fri, 21 Apr 2017 21:23:55 +0300
+Subject: [PATCH] [PATCH] check-ldrunpath-length
 
 [Romain: rebase on top of 2.26]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
 ---
  ld/emultempl/elf32.em | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index 0405d4f..efd3300 100644
+index d4837d0..937da8a 100644
 --- a/ld/emultempl/elf32.em
 +++ b/ld/emultempl/elf32.em
-@@ -1242,6 +1242,8 @@ fragment <<EOF
+@@ -1460,6 +1460,8 @@ fragment <<EOF
  	      && command_line.rpath == NULL)
  	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
+ 	      path = (const char *) getenv ("LD_RUN_PATH");
 +	      if ((lib_path) && (strlen (lib_path) == 0))
-+	      	lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
++	        lib_path = NULL;
+ 	      if (path
+ 		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
  		break;
-@@ -1523,6 +1525,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+@@ -1737,6 +1739,8 @@ gld${EMULATION_NAME}_before_allocation (void)
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
 +  if ((rpath) && (strlen (rpath) == 0))
-+  	rpath = NULL;
++    rpath = NULL;
  
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
 -- 
-2.4.3
+2.7.4
 
diff --git a/package/binutils/arc-2017.03-eng008/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2017.03-rc1/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 72%
rename from package/binutils/arc-2017.03-eng008/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2017.03-rc1/0500-add-sysroot-fix-from-bug-3049.patch
index f67a43e..0331088 100644
--- a/package/binutils/arc-2017.03-eng008/0500-add-sysroot-fix-from-bug-3049.patch
+++ b/package/binutils/arc-2017.03-rc1/0500-add-sysroot-fix-from-bug-3049.patch
@@ -15,21 +15,20 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  ld/ldfile.c | 11 +++++++++--
  1 file changed, 9 insertions(+), 2 deletions(-)
 
-diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 96f9ecc..1439309 100644
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -335,18 +335,25 @@ ldfile_open_file_search (const char *arch,
+diff --git a/ld/ldfile.c diff --git b/ld/ldfile.c
+--- a/ld/ldfile.c	2017-03-02 03:23:54.000000000 -0500
++++ b/ld/ldfile.c	2017-03-20 09:52:27.687415942 -0400
+@@ -336,18 +336,24 @@
       directory first.  */
-   if (! entry->flags.maybe_archive)
+   if (!entry->flags.maybe_archive)
      {
 -      if (entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename))
-+      /* For absolute pathnames, try to always open the file in the
++     /* For absolute pathnames, try to always open the file in the
 +	 sysroot first. If this fails, try to open the file at the
 +	 given location.  */
-+      entry->flags.sysrooted = is_sysrooted_pathname (entry->filename);
-+      if (!entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename)
-+	  && ld_sysroot)
++     entry->flags.sysrooted = is_sysrooted_pathname (entry->filename);
++     if (!entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename)
++     && ld_sysroot)
  	{
  	  char *name = concat (ld_sysroot, entry->filename,
  			       (const char *) NULL);
@@ -42,11 +41,8 @@ index 96f9ecc..1439309 100644
  	  free (name);
  	}
 -      else if (ldfile_try_open_bfd (entry->filename, entry))
-+
 +      if (ldfile_try_open_bfd (entry->filename, entry))
  	return TRUE;
  
        if (IS_ABSOLUTE_PATH (entry->filename))
--- 
-2.4.3
 
diff --git a/package/binutils/arc-2017.03-eng008/0600-poison-system-directories.patch b/package/binutils/arc-2017.03-rc1/0600-poison-system-directories.patch
similarity index 94%
rename from package/binutils/arc-2017.03-eng008/0600-poison-system-directories.patch
rename to package/binutils/arc-2017.03-rc1/0600-poison-system-directories.patch
index d16994e..bb1a7b4 100644
--- a/package/binutils/arc-2017.03-eng008/0600-poison-system-directories.patch
+++ b/package/binutils/arc-2017.03-rc1/0600-poison-system-directories.patch
@@ -81,7 +81,7 @@ diff --git a/ld/config.in b/ld/config.in
 index 276fb77..35c58eb 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -14,6 +14,9 @@
+@@ -17,6 +17,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -95,7 +95,7 @@ diff --git a/ld/configure b/ld/configure
 index a446283..d1f9504 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -786,6 +786,7 @@ with_lib_path
+@@ -789,6 +789,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -103,7 +103,7 @@ index a446283..d1f9504 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1442,6 +1443,8 @@ Optional Features:
+@@ -1446,6 +1447,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -112,7 +112,7 @@ index a446283..d1f9504 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15491,7 +15494,18 @@ else
+@@ -15499,7 +15502,18 @@ else
  fi
  
  
@@ -156,7 +156,7 @@ diff --git a/ld/ld.h b/ld/ld.h
 index d84ec4e..3476b26 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
-@@ -164,6 +164,14 @@ typedef struct {
+@@ -172,6 +172,14 @@ typedef struct {
    /* If set, display the target memory usage (per memory region).  */
    bfd_boolean print_memory_usage;
  
@@ -175,7 +175,7 @@ diff --git a/ld/ld.texinfo b/ld/ld.texinfo
 index 1dd7492..fb1438e 100644
 --- a/ld/ld.texinfo
 +++ b/ld/ld.texinfo
-@@ -2332,6 +2332,18 @@ string identifying the original linked file does not change.
+@@ -2403,6 +2403,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -226,7 +226,7 @@ diff --git a/ld/ldlex.h b/ld/ldlex.h
 index 6f11e7b..0ca3110 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -144,6 +144,8 @@ enum option_values
+@@ -146,6 +146,8 @@ enum option_values
    OPTION_PRINT_MEMORY_USAGE,
    OPTION_REQUIRE_DEFINED_SYMBOL,
    OPTION_ORPHAN_HANDLING,
@@ -239,7 +239,7 @@ diff --git a/ld/ldmain.c b/ld/ldmain.c
 index bb0b9cc..a23c56c 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -257,6 +257,8 @@ main (int argc, char **argv)
+@@ -270,6 +270,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -252,7 +252,7 @@ diff --git a/ld/lexsup.c b/ld/lexsup.c
 index 4cad209..be7d584 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -530,6 +530,14 @@ static const struct ld_option ld_options[] =
+@@ -535,6 +535,14 @@ static const struct ld_option ld_options[] =
    { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
      '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
      TWO_DASHES },
@@ -267,7 +267,7 @@ index 4cad209..be7d584 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -542,6 +550,7 @@ parse_args (unsigned argc, char **argv)
+@@ -547,6 +555,7 @@ parse_args (unsigned argc, char **argv)
    int ingroup = 0;
    char *default_dirlist = NULL;
    char *shortopts;
@@ -275,7 +275,7 @@ index 4cad209..be7d584 100644
    struct option *longopts;
    struct option *really_longopts;
    int last_optind;
-@@ -1516,6 +1525,14 @@ parse_args (unsigned argc, char **argv)
+@@ -1528,6 +1537,14 @@ parse_args (unsigned argc, char **argv)
            }
            break;
  
@@ -290,7 +290,7 @@ index 4cad209..be7d584 100644
  	case OPTION_PUSH_STATE:
  	  input_flags.pushed = xmemdup (&input_flags,
  					sizeof (input_flags),
-@@ -1559,6 +1576,10 @@ parse_args (unsigned argc, char **argv)
+@@ -1571,6 +1588,10 @@ parse_args (unsigned argc, char **argv)
        command_line.soname = NULL;
      }
  
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index c59e5f2..be3f703 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12c
 sha512	ede2e4e59a800260eea8c14eafbaee94e30abadafd5c419a3370f9f62213cf027d6400a1d4970b6958bd4d220e675dcd483a708107016e7abd5c99d7392ba8fd  binutils-2.28.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  4f259849ee191b41b820a24ce3db37ade7a07290f6178c09d3935bf88b777b7aa36a40ba681bd5da765d9c6943ab52fa2975179bf9bf48260ae0a39692c3600c  binutils-arc-2017.03-eng008.tar.gz
+sha512  536d252a4dae94803eb95a400e16d43c8e709276e3baed1d0c07fd764b2457b7845a0b3de9c78ab10211ab7e18a49c3a988570fc434357a72aac05cee9ca6beb  binutils-arc-2017.03-rc1.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ecba965..03fd3a5 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2017.03-eng008
+BINUTILS_VERSION = arc-2017.03-rc1
 else
 BINUTILS_VERSION = 2.27
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e6a38e8..9cf4571 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -106,7 +106,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.3.0"     if BR2_GCC_VERSION_6_X
-	default "arc-2017.03-eng008" if BR2_GCC_VERSION_ARC
+	default "arc-2017.03-rc1" if BR2_GCC_VERSION_ARC
 	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2017.03-eng008/301-missing-execinfo_h.patch b/package/gcc/arc-2017.03-rc1/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2017.03-eng008/301-missing-execinfo_h.patch
rename to package/gcc/arc-2017.03-rc1/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2017.03-eng008/860-cilk-wchar.patch b/package/gcc/arc-2017.03-rc1/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/arc-2017.03-eng008/860-cilk-wchar.patch
rename to package/gcc/arc-2017.03-rc1/860-cilk-wchar.patch
diff --git a/package/gcc/arc-2017.03-eng008/940-uclinux-enable-threads.patch b/package/gcc/arc-2017.03-rc1/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/arc-2017.03-eng008/940-uclinux-enable-threads.patch
rename to package/gcc/arc-2017.03-rc1/940-uclinux-enable-threads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 65f9d03..052a825 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,6 +12,6 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  234dd9b1bdc9a9c6e352216a7ef4ccadc6c07f156006a59759c5e0e6a69f0abcdc14630eff11e3826dd6ba5933a8faa43043f3d1d62df6bd5ab1e82862f9bf78  gcc-6.3.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  571c9af48b403f528f27d3a71aa11c05890b1e856cda6797a44c45958bced41a4cea3226aef7429d83e85605205dff1657d39a3a7f0cce33064913ac3dc42977  gcc-arc-2017.03-eng008.tar.gz
+sha512  e4fe5a179b8feabf932a8a6f4794ff6907b868a65487412d855a4b3671aa24ec8544a44f3b63e69ea2c12fcd4d8028d0619d40bf016ee7c1a5b5a99aa9315ef3  gcc-arc-2017.03-rc1.tar.gz
 # Locally calculated (fetched from Github)
 sha512  841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f  gcc-musl-5.4.0.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 8e4c48a..cbb157e 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -56,7 +56,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2017.03-eng008-gdb" if BR2_arc
+	default "arc-2017.03-rc1-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 1308134..efb5b11 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7
 
 # Locally calculated (fetched from Github)
 sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-sha512  aa8e2df52d75089f436f1692bbe348e641fa356822b9a116601df68963cdc203f220cbe3569d8721fecd5c6bbbfcaf2a1a2ee7296b0ee895f7e321951ca4c3c7  gdb-arc-2017.03-eng008-gdb.tar.gz
+sha512  0bd0ec8169ee059493675db59170f09a6c16d12408a426d6f07892a72d43b73e3ef0059ea409e9fb72998da6cb762d336b852d2e13e2817a0a0fe976e20803bd  gdb-arc-2017.03-rc1-gdb.tar.gz
-- 
2.7.4
