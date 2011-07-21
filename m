From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Jul 2011 14:54:22 -0300
Subject: [Buildroot] [PATCH 2/4] binutils: add version 2.21.1
In-Reply-To: <1311270864-5771-1-git-send-email-gustavo@zacarias.com.ar>
References: <1311270864-5771-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1311270864-5771-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/binutils/Config.in.host                    |    7 +++-
 .../binutils-2.21.1/110-arm-eabi-conf.patch        |   24 +++++++++++
 package/binutils/binutils-2.21.1/120-sh-conf.patch |   42 ++++++++++++++++++++
 .../300-001_ld_makefile_patch.patch                |   24 +++++++++++
 .../300-012_check_ldrunpath_length.patch           |   21 ++++++++++
 5 files changed, 117 insertions(+), 1 deletions(-)
 create mode 100644 package/binutils/binutils-2.21.1/110-arm-eabi-conf.patch
 create mode 100644 package/binutils/binutils-2.21.1/120-sh-conf.patch
 create mode 100644 package/binutils/binutils-2.21.1/300-001_ld_makefile_patch.patch
 create mode 100644 package/binutils/binutils-2.21.1/300-012_check_ldrunpath_length.patch

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 4a5e8ef..a867b18 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,7 +2,7 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_21
+	default BR2_BINUTILS_VERSION_2_21_1
 	help
 	  Select the version of binutils you wish to use.
 
@@ -37,6 +37,10 @@ choice
 		depends on !BR2_avr32
 		bool "binutils 2.21"
 
+	config BR2_BINUTILS_VERSION_2_21_1
+		depends on !BR2_avr32
+		bool "binutils 2.21.1"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -48,6 +52,7 @@ config BR2_BINUTILS_VERSION
 	default "2.20"		if BR2_BINUTILS_VERSION_2_20
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
+	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
 
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
diff --git a/package/binutils/binutils-2.21.1/110-arm-eabi-conf.patch b/package/binutils/binutils-2.21.1/110-arm-eabi-conf.patch
new file mode 100644
index 0000000..af26329
--- /dev/null
+++ b/package/binutils/binutils-2.21.1/110-arm-eabi-conf.patch
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
diff --git a/package/binutils/binutils-2.21.1/120-sh-conf.patch b/package/binutils/binutils-2.21.1/120-sh-conf.patch
new file mode 100644
index 0000000..071d15a
--- /dev/null
+++ b/package/binutils/binutils-2.21.1/120-sh-conf.patch
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
diff --git a/package/binutils/binutils-2.21.1/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.21.1/300-001_ld_makefile_patch.patch
new file mode 100644
index 0000000..5cb0f61
--- /dev/null
+++ b/package/binutils/binutils-2.21.1/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/binutils-2.21.1/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.21.1/300-012_check_ldrunpath_length.patch
new file mode 100644
index 0000000..df78310
--- /dev/null
+++ b/package/binutils/binutils-2.21.1/300-012_check_ldrunpath_length.patch
@@ -0,0 +1,21 @@
+diff -Nura binutils-2.21.orig/ld/emultempl/elf32.em binutils-2.21/ld/emultempl/elf32.em
+--- binutils-2.21.orig/ld/emultempl/elf32.em	2010-10-29 09:10:36.000000000 -0300
++++ binutils-2.21/ld/emultempl/elf32.em	2010-12-10 09:26:56.746102724 -0300
+@@ -1270,6 +1270,8 @@
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((lib_path) && (strlen (lib_path) == 0))
++	      	lib_path = NULL;
+ 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
+ 						      force))
+ 		break;
+@@ -1497,6 +1499,8 @@
+   rpath = command_line.rpath;
+   if (rpath == NULL)
+     rpath = (const char *) getenv ("LD_RUN_PATH");
++  if ((rpath) && (strlen (rpath) == 0))
++  	rpath = NULL;
+ 
+   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link_next)
+     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
-- 
1.7.3.4
