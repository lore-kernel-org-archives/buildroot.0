From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Mar 2010 17:23:23 +0200
Subject: [Buildroot] [git commit master] binutils: add 2.20.1
Message-ID: <20100330152414.9736A2133E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5c36fdfe84a26c8ada225839e44dd8a3e646cf63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1441

[Peter: use gnu.org upstream]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 +-
 toolchain/binutils/2.20.1/110-arm-eabi-conf.patch  |   24 +++++++++++
 toolchain/binutils/2.20.1/120-sh-conf.patch        |   42 ++++++++++++++++++++
 .../2.20.1/300-001_ld_makefile_patch.patch         |   24 +++++++++++
 .../2.20.1/300-012_check_ldrunpath_length.patch    |   21 ++++++++++
 toolchain/binutils/Config.in                       |    5 ++
 toolchain/binutils/binutils.mk                     |    3 +
 7 files changed, 121 insertions(+), 1 deletions(-)
 create mode 100644 toolchain/binutils/2.20.1/110-arm-eabi-conf.patch
 create mode 100644 toolchain/binutils/2.20.1/120-sh-conf.patch
 create mode 100644 toolchain/binutils/2.20.1/300-001_ld_makefile_patch.patch
 create mode 100644 toolchain/binutils/2.20.1/300-012_check_ldrunpath_length.patch

diff --git a/CHANGES b/CHANGES
index de41091..5901d3b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,7 +1,7 @@
 2010.05, Not yet released
 
 	Toolchain: uClibc 0.9.30.3, older 0.9.30.x removed. 2.6.33
-	kernel headers.
+	kernel headers, binutils 2.20.1.
 
 	X.org updated to 7.5.
 
@@ -26,6 +26,7 @@
 	#1273: BR2_INET_IPV6 does not enable IPv6 in pppd
 	#1303: Add librsync package
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
+	#1441: Add binutils 2.20.1
 
 2010.02, Release February 26th, 2010:
 
diff --git a/toolchain/binutils/2.20.1/110-arm-eabi-conf.patch b/toolchain/binutils/2.20.1/110-arm-eabi-conf.patch
new file mode 100644
index 0000000..af26329
--- /dev/null
+++ b/toolchain/binutils/2.20.1/110-arm-eabi-conf.patch
@@ -0,0 +1,24 @@
+diff -rdup binutils-2.18.50.0.3.orig/configure binutils-2.18.50.0.3/configure
+--- binutils-2.18.50.0.3.orig/configure	2007-11-22 12:41:26.000000000 +0100
++++ binutils-2.18.50.0.3/configure	2007-11-22 12:45:01.000000000 +0100
+@@ -2245,7 +2245,7 @@ case "${target}" in
+     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
+     libgloss_dir=arm
+     ;;
+-  arm*-*-linux-gnueabi)
++  arm*-*-linux-*gnueabi)
+     noconfigdirs="$noconfigdirs target-qthreads"
+     noconfigdirs="$noconfigdirs target-libobjc"
+     case ${with_newlib} in
+diff -rdup binutils-2.18.50.0.3.orig/configure.ac binutils-2.18.50.0.3/configure.ac
+--- binutils-2.18.50.0.3.orig/configure.ac	2007-11-22 12:41:26.000000000 +0100
++++ binutils-2.18.50.0.3/configure.ac	2007-11-22 12:44:54.000000000 +0100
+@@ -522,7 +522,7 @@ case "${target}" in
+     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
+     libgloss_dir=arm
+     ;;
+-  arm*-*-linux-gnueabi)
++  arm*-*-linux-*gnueabi)
+     noconfigdirs="$noconfigdirs target-qthreads"
+     noconfigdirs="$noconfigdirs target-libobjc"
+     case ${with_newlib} in
diff --git a/toolchain/binutils/2.20.1/120-sh-conf.patch b/toolchain/binutils/2.20.1/120-sh-conf.patch
new file mode 100644
index 0000000..071d15a
--- /dev/null
+++ b/toolchain/binutils/2.20.1/120-sh-conf.patch
@@ -0,0 +1,42 @@
+diff -rdup binutils-2.18.50.0.9.old/configure binutils-2.18.50.0.9/configure
+--- binutils-2.18.50.0.9.old/configure	2008-08-23 17:36:13.000000000 +0200
++++ binutils-2.18.50.0.9/configure	2008-10-14 14:25:22.000000000 +0200
+@@ -2281,7 +2281,7 @@ case "${target}" in
+   am33_2.0-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+-  sh-*-linux*)
++  sh*-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
+@@ -2606,7 +2606,7 @@ case "${target}" in
+   romp-*-*)
+     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${host}" in
+       i[3456789]86-*-vsta) ;; # don't add gprof back in
+       i[3456789]86-*-go32*) ;; # don't add gprof back in
+diff -rdup binutils-2.18.50.0.9.old/configure.ac binutils-2.18.50.0.9/configure.ac
+--- binutils-2.18.50.0.9.old/configure.ac	2008-08-23 17:36:13.000000000 +0200
++++ binutils-2.18.50.0.9/configure.ac	2008-10-14 14:25:11.000000000 +0200
+@@ -530,7 +530,7 @@ case "${target}" in
+   am33_2.0-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+-  sh-*-linux*)
++  sh*-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;    
+   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
+@@ -855,7 +855,7 @@ case "${target}" in
+   romp-*-*)
+     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${host}" in
+       i[[3456789]]86-*-vsta) ;; # don't add gprof back in
+       i[[3456789]]86-*-go32*) ;; # don't add gprof back in
diff --git a/toolchain/binutils/2.20.1/300-001_ld_makefile_patch.patch b/toolchain/binutils/2.20.1/300-001_ld_makefile_patch.patch
new file mode 100644
index 0000000..5cb0f61
--- /dev/null
+++ b/toolchain/binutils/2.20.1/300-001_ld_makefile_patch.patch
@@ -0,0 +1,24 @@
+diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
+--- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
++++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
+@@ -18,7 +18,7 @@
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ 
+ EMUL = @EMUL@
+ EMULATION_OFILES = @EMULATION_OFILES@
+diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.in binutils-2.17.50.0.17/ld/Makefile.in
+--- binutils-2.17.50.0.17.oorig/ld/Makefile.in	2007-06-18 19:29:29.000000000 +0200
++++ binutils-2.17.50.0.17/ld/Makefile.in	2007-06-25 10:00:36.000000000 +0200
+@@ -287,7 +287,7 @@
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ BASEDIR = $(srcdir)/..
+ BFDDIR = $(BASEDIR)/bfd
+ INCDIR = $(BASEDIR)/include
diff --git a/toolchain/binutils/2.20.1/300-012_check_ldrunpath_length.patch b/toolchain/binutils/2.20.1/300-012_check_ldrunpath_length.patch
new file mode 100644
index 0000000..6e80921
--- /dev/null
+++ b/toolchain/binutils/2.20.1/300-012_check_ldrunpath_length.patch
@@ -0,0 +1,21 @@
+diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
+--- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
++++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
+@@ -1007,6 +1007,8 @@
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((lib_path) && (strlen (lib_path) == 0))
++		  lib_path = NULL;
+ 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
+ 						      force))
+ 		break;
+@@ -1191,6 +1193,8 @@
+   rpath = command_line.rpath;
+   if (rpath == NULL)
+     rpath = (const char *) getenv ("LD_RUN_PATH");
++  if ((rpath) && (strlen (rpath) == 0))
++      rpath = NULL;
+   if (! (bfd_elf_size_dynamic_sections
+ 	 (output_bfd, command_line.soname, rpath,
+ 	  command_line.filter_shlib,
diff --git a/toolchain/binutils/Config.in b/toolchain/binutils/Config.in
index b8ce332..57bddfc 100644
--- a/toolchain/binutils/Config.in
+++ b/toolchain/binutils/Config.in
@@ -41,6 +41,10 @@ choice
 		depends on !BR2_avr32 && !BR2_nios2
 		bool "binutils 2.20"
 
+	config BR2_BINUTILS_VERSION_2_20_1
+		depends on !BR2_avr32 && !BR2_nios2
+		bool "binutils 2.20.1"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -53,6 +57,7 @@ config BR2_BINUTILS_VERSION
 	default "2.19"		if BR2_BINUTILS_VERSION_2_19
 	default "2.19.1"	if BR2_BINUTILS_VERSION_2_19_1
 	default "2.20"		if BR2_BINUTILS_VERSION_2_20
+	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index 77e7d3d..b02bcdf 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -7,6 +7,9 @@ BINUTILS_VERSION:=$(call qstrip,$(BR2_BINUTILS_VERSION))
 
 EXTRA_BINUTILS_CONFIG_OPTIONS=$(call qstrip,$(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS))
 BINUTILS_SITE:=$(BR2_KERNEL_MIRROR)/linux/devel/binutils
+ifeq ($(BINUTILS_VERSION),2.20.1)
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
+endif
 ifeq ($(BINUTILS_VERSION),2.20)
 BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 endif
-- 
1.6.3.3
