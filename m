From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Dec 2011 09:24:56 +0100
Subject: [Buildroot] [git commit] binutils: remove deprecated versions
Message-ID: <20111205134652.9F9298F7A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c730a2c16d64f628079952a4218d6de476cad67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove already deprecated binutils version 2.18, 2.19 and 2.19.1.
Keep 2.18-avr32.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/Config.in.host                    |   18 --------
 .../binutils-2.18/100-makeinfo-version.patch       |   32 ---------------
 .../binutils/binutils-2.18/110-arm-eabi-conf.patch |   24 -----------
 .../binutils-2.18/300-001_ld_makefile_patch.patch  |   24 -----------
 .../300-012_check_ldrunpath_length.patch           |   21 ----------
 .../binutils-2.19.1/110-arm-eabi-conf.patch        |   24 -----------
 package/binutils/binutils-2.19.1/120-sh-conf.patch |   42 --------------------
 .../300-001_ld_makefile_patch.patch                |   24 -----------
 .../300-012_check_ldrunpath_length.patch           |   21 ----------
 .../binutils/binutils-2.19/110-arm-eabi-conf.patch |   24 -----------
 package/binutils/binutils-2.19/120-sh-conf.patch   |   42 --------------------
 .../binutils-2.19/300-001_ld_makefile_patch.patch  |   24 -----------
 .../300-012_check_ldrunpath_length.patch           |   21 ----------
 13 files changed, 0 insertions(+), 341 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index f87298a..756bc58 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -8,25 +8,10 @@ choice
 	help
 	  Select the version of binutils you wish to use.
 
-	config BR2_BINUTILS_VERSION_2_18
-		depends on !BR2_avr32
-		depends on BR2_DEPRECATED
-		bool "binutils 2.18"
-
 	config BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
 	       depends on BR2_avr32
 	       bool "binutils 2.18-avr32-1.0.1"
 
-	config BR2_BINUTILS_VERSION_2_19
-		depends on !BR2_avr32
-		depends on BR2_DEPRECATED
-		bool "binutils 2.19"
-
-	config BR2_BINUTILS_VERSION_2_19_1
-		depends on !BR2_avr32
-		depends on BR2_DEPRECATED
-		bool "binutils 2.19.1"
-
 	config BR2_BINUTILS_VERSION_2_20
 		depends on !BR2_avr32
 		bool "binutils 2.20"
@@ -47,10 +32,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "2.18"		if BR2_BINUTILS_VERSION_2_18
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "2.19"		if BR2_BINUTILS_VERSION_2_19
-	default "2.19.1"	if BR2_BINUTILS_VERSION_2_19_1
 	default "2.20"		if BR2_BINUTILS_VERSION_2_20
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
diff --git a/package/binutils/binutils-2.18/100-makeinfo-version.patch b/package/binutils/binutils-2.18/100-makeinfo-version.patch
deleted file mode 100644
index d911d62..0000000
--- a/package/binutils/binutils-2.18/100-makeinfo-version.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-diff -u binutils-2.18-orig/configure binutils-2.18/configure
---- binutils-2.18-orig/configure	2007-08-06 16:29:40.000000000 -0400
-+++ binutils-2.18/configure	2007-09-27 22:41:51.000000000 -0400
-@@ -6125,10 +6125,10 @@
-   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
-   *)
- 
--    # For an installed makeinfo, we require it to be from texinfo 4.4 or
-+    # For an installed makeinfo, we require it to be from texinfo 4.6 or
-     # higher, else we use the "missing" dummy.
-     if ${MAKEINFO} --version \
--       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
-+       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
-       :
-     else
-       MAKEINFO="$MISSING makeinfo"
-diff -u binutils-2.18-orig/configure.ac binutils-2.18/configure.ac
---- binutils-2.18-orig/configure.ac	2007-08-28 16:24:26.000000000 -0400
-+++ binutils-2.18/configure.ac	2007-09-27 22:41:00.000000000 -0400
-@@ -2400,10 +2400,10 @@
-   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
-   *)
- changequote(,)
--    # For an installed makeinfo, we require it to be from texinfo 4.4 or
-+    # For an installed makeinfo, we require it to be from texinfo 4.6 or
-     # higher, else we use the "missing" dummy.
-     if ${MAKEINFO} --version \
--       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
-+       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
-       :
-     else
-       MAKEINFO="$MISSING makeinfo"
diff --git a/package/binutils/binutils-2.18/110-arm-eabi-conf.patch b/package/binutils/binutils-2.18/110-arm-eabi-conf.patch
deleted file mode 100644
index 04e19be..0000000
--- a/package/binutils/binutils-2.18/110-arm-eabi-conf.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/configure binutils-2.17.50.0.17/configure
---- binutils-2.17.50.0.17.oorig/configure	2007-06-18 19:29:28.000000000 +0200
-+++ binutils-2.17.50.0.17/configure	2007-06-25 09:58:36.000000000 +0200
-@@ -2224,7 +2224,7 @@
-   arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     noconfigdirs="$noconfigdirs target-libjava target-libobjc"
-     ;;
-diff -u binutils-2.17.50.0.17.oorig/configure.ac binutils-2.17.50.0.17/configure.ac
---- binutils-2.17.50.0.17.oorig/configure.ac	2007-06-18 19:29:28.000000000 +0200
-+++ binutils-2.17.50.0.17/configure.ac	2007-06-25 09:58:36.000000000 +0200
-@@ -513,7 +513,7 @@
-   arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     noconfigdirs="$noconfigdirs target-libjava target-libobjc"
-     ;;
diff --git a/package/binutils/binutils-2.18/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.18/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/package/binutils/binutils-2.18/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/binutils-2.18/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.18/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/package/binutils/binutils-2.18/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
---- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
-@@ -1007,6 +1007,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+		  lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1191,6 +1193,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+      rpath = NULL;
-   if (! (bfd_elf_size_dynamic_sections
- 	 (output_bfd, command_line.soname, rpath,
- 	  command_line.filter_shlib,
diff --git a/package/binutils/binutils-2.19.1/110-arm-eabi-conf.patch b/package/binutils/binutils-2.19.1/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/package/binutils/binutils-2.19.1/110-arm-eabi-conf.patch
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
diff --git a/package/binutils/binutils-2.19.1/120-sh-conf.patch b/package/binutils/binutils-2.19.1/120-sh-conf.patch
deleted file mode 100644
index 071d15a..0000000
--- a/package/binutils/binutils-2.19.1/120-sh-conf.patch
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
diff --git a/package/binutils/binutils-2.19.1/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.19.1/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/package/binutils/binutils-2.19.1/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/binutils-2.19.1/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.19.1/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/package/binutils/binutils-2.19.1/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
---- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
-@@ -1007,6 +1007,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+		  lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1191,6 +1193,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+      rpath = NULL;
-   if (! (bfd_elf_size_dynamic_sections
- 	 (output_bfd, command_line.soname, rpath,
- 	  command_line.filter_shlib,
diff --git a/package/binutils/binutils-2.19/110-arm-eabi-conf.patch b/package/binutils/binutils-2.19/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/package/binutils/binutils-2.19/110-arm-eabi-conf.patch
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
diff --git a/package/binutils/binutils-2.19/120-sh-conf.patch b/package/binutils/binutils-2.19/120-sh-conf.patch
deleted file mode 100644
index 071d15a..0000000
--- a/package/binutils/binutils-2.19/120-sh-conf.patch
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
diff --git a/package/binutils/binutils-2.19/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.19/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/package/binutils/binutils-2.19/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/binutils-2.19/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.19/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/package/binutils/binutils-2.19/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
---- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
-@@ -1007,6 +1007,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+		  lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1191,6 +1193,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+      rpath = NULL;
-   if (! (bfd_elf_size_dynamic_sections
- 	 (output_bfd, command_line.soname, rpath,
- 	  command_line.filter_shlib,
