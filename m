From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Jul 2014 19:55:44 +0200
Subject: [Buildroot] [PATCH 2/2] binutils: remove 2.21.1
In-Reply-To: <1405101344-14365-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1405101344-14365-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1405101344-14365-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the following commits:

26974bf6a7c94c0c44722fe072182cfcc49bdb6e use default binutils for sh architecture
6f1cf344d90ea3eabf292b04d993a7be2a785dd6 binutils: Use the default version by default on MIPS

the 2.21.1 binutils version is no longer required, and since it's an
old version, we get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/2.21.1/110-arm-eabi-conf.patch    | 24 -------------
 package/binutils/2.21.1/120-sh-conf.patch          | 42 ----------------------
 .../2.21.1/300-001_ld_makefile_patch.patch         | 24 -------------
 .../2.21.1/300-012_check_ldrunpath_length.patch    | 21 -----------
 package/binutils/2.21.1/500-sysroot.patch          | 36 -------------------
 package/binutils/Config.in.host                    |  6 ----
 6 files changed, 153 deletions(-)
 delete mode 100644 package/binutils/2.21.1/110-arm-eabi-conf.patch
 delete mode 100644 package/binutils/2.21.1/120-sh-conf.patch
 delete mode 100644 package/binutils/2.21.1/300-001_ld_makefile_patch.patch
 delete mode 100644 package/binutils/2.21.1/300-012_check_ldrunpath_length.patch
 delete mode 100644 package/binutils/2.21.1/500-sysroot.patch

diff --git a/package/binutils/2.21.1/110-arm-eabi-conf.patch b/package/binutils/2.21.1/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/package/binutils/2.21.1/110-arm-eabi-conf.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -rdup binutils-2.18.50.0.3.orig/configure binutils-2.18.50.0.3/configure
---- binutils-2.18.50.0.3.orig/configure	2007-11-22 12:41:26.000000000 +0100
-+++ binutils-2.18.50.0.3/configure	2007-11-22 12:45:01.000000000 +0100
-@@ -2245,7 +2245,7 @@ case "${target}" in
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-*gnueabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
-diff -rdup binutils-2.18.50.0.3.orig/configure.ac binutils-2.18.50.0.3/configure.ac
---- binutils-2.18.50.0.3.orig/configure.ac	2007-11-22 12:41:26.000000000 +0100
-+++ binutils-2.18.50.0.3/configure.ac	2007-11-22 12:44:54.000000000 +0100
-@@ -522,7 +522,7 @@ case "${target}" in
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-*gnueabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
diff --git a/package/binutils/2.21.1/120-sh-conf.patch b/package/binutils/2.21.1/120-sh-conf.patch
deleted file mode 100644
index 071d15a..0000000
--- a/package/binutils/2.21.1/120-sh-conf.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-diff -rdup binutils-2.18.50.0.9.old/configure binutils-2.18.50.0.9/configure
---- binutils-2.18.50.0.9.old/configure	2008-08-23 17:36:13.000000000 +0200
-+++ binutils-2.18.50.0.9/configure	2008-10-14 14:25:22.000000000 +0200
-@@ -2281,7 +2281,7 @@ case "${target}" in
-   am33_2.0-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
--  sh-*-linux*)
-+  sh*-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
-   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
-@@ -2606,7 +2606,7 @@ case "${target}" in
-   romp-*-*)
-     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${host}" in
-       i[3456789]86-*-vsta) ;; # don't add gprof back in
-       i[3456789]86-*-go32*) ;; # don't add gprof back in
-diff -rdup binutils-2.18.50.0.9.old/configure.ac binutils-2.18.50.0.9/configure.ac
---- binutils-2.18.50.0.9.old/configure.ac	2008-08-23 17:36:13.000000000 +0200
-+++ binutils-2.18.50.0.9/configure.ac	2008-10-14 14:25:11.000000000 +0200
-@@ -530,7 +530,7 @@ case "${target}" in
-   am33_2.0-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
--  sh-*-linux*)
-+  sh*-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;    
-   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
-@@ -855,7 +855,7 @@ case "${target}" in
-   romp-*-*)
-     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${host}" in
-       i[[3456789]]86-*-vsta) ;; # don't add gprof back in
-       i[[3456789]]86-*-go32*) ;; # don't add gprof back in
diff --git a/package/binutils/2.21.1/300-001_ld_makefile_patch.patch b/package/binutils/2.21.1/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/package/binutils/2.21.1/300-001_ld_makefile_patch.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
---- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
-@@ -18,7 +18,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- 
- EMUL = @EMUL@
- EMULATION_OFILES = @EMULATION_OFILES@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.in binutils-2.17.50.0.17/ld/Makefile.in
---- binutils-2.17.50.0.17.oorig/ld/Makefile.in	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.in	2007-06-25 10:00:36.000000000 +0200
-@@ -287,7 +287,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- BASEDIR = $(srcdir)/..
- BFDDIR = $(BASEDIR)/bfd
- INCDIR = $(BASEDIR)/include
diff --git a/package/binutils/2.21.1/300-012_check_ldrunpath_length.patch b/package/binutils/2.21.1/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index df78310..0000000
--- a/package/binutils/2.21.1/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -Nura binutils-2.21.orig/ld/emultempl/elf32.em binutils-2.21/ld/emultempl/elf32.em
---- binutils-2.21.orig/ld/emultempl/elf32.em	2010-10-29 09:10:36.000000000 -0300
-+++ binutils-2.21/ld/emultempl/elf32.em	2010-12-10 09:26:56.746102724 -0300
-@@ -1270,6 +1270,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+	      	lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1497,6 +1499,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+  	rpath = NULL;
- 
-   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link_next)
-     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
diff --git a/package/binutils/2.21.1/500-sysroot.patch b/package/binutils/2.21.1/500-sysroot.patch
deleted file mode 100644
index d21e4cb..0000000
--- a/package/binutils/2.21.1/500-sysroot.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
-
-Always try to prepend the sysroot prefix to absolute filenames first.
-
-http://bugs.gentoo.org/275666
-http://sourceware.org/bugzilla/show_bug.cgi?id=10340
-
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -308,18 +308,24 @@
-      directory first.  */
-   if (! entry->is_archive)
-     {
--      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
-+      /* For absolute pathnames, try to always open the file in the
-+	 sysroot first. If this fails, try to open the file at the
-+	 given location. */
-+      entry->sysrooted = is_sysrooted_pathname(entry->filename, FALSE);
-+      if (IS_ABSOLUTE_PATH (entry->filename) && ld_sysroot && ! entry->sysrooted)
- 	{
- 	  char *name = concat (ld_sysroot, entry->filename,
- 			       (const char *) NULL);
- 	  if (ldfile_try_open_bfd (name, entry))
- 	    {
- 	      entry->filename = name;
-+	      entry->sysrooted = TRUE;
- 	      return TRUE;
- 	    }
- 	  free (name);
- 	}
--      else if (ldfile_try_open_bfd (entry->filename, entry))
-+
-+      if (ldfile_try_open_bfd (entry->filename, entry))
- 	{
- 	  entry->sysrooted = IS_ABSOLUTE_PATH (entry->filename)
- 	    && is_sysrooted_pathname (entry->filename, TRUE);
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index de45b43..de8b780 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -12,11 +12,6 @@ choice
 		depends on BR2_avr32
 		bool "binutils 2.18-avr32-1.0.1"
 
-	config BR2_BINUTILS_VERSION_2_21_1
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
-		depends on !BR2_ARM_EABIHF
-		bool "binutils 2.21.1"
-
 	config BR2_BINUTILS_VERSION_2_22
 		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.22"
@@ -35,7 +30,6 @@ config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
 	default "arc-4.8-R3"	if BR2_arc
-	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
 	default "2.22"		if BR2_BINUTILS_VERSION_2_22
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24
-- 
2.0.0
