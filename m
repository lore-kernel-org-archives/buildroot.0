From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Nov 2011 08:11:01 -0300
Subject: [Buildroot] [PATCH 3/4] binutils: add version 2.22
In-Reply-To: <1322651462-20300-1-git-send-email-gustavo@zacarias.com.ar>
References: <1322651462-20300-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1322651462-20300-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/binutils/Config.in.host                    |    7 ++++-
 package/binutils/binutils-2.22/120-sh-conf.patch   |   29 ++++++++++++++++++++
 .../binutils-2.22/300-001_ld_makefile_patch.patch  |   24 ++++++++++++++++
 .../300-012_check_ldrunpath_length.patch           |   21 ++++++++++++++
 4 files changed, 80 insertions(+), 1 deletions(-)
 create mode 100644 package/binutils/binutils-2.22/120-sh-conf.patch
 create mode 100644 package/binutils/binutils-2.22/300-001_ld_makefile_patch.patch
 create mode 100644 package/binutils/binutils-2.22/300-012_check_ldrunpath_length.patch

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 756bc58..f829549 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,7 +3,7 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
-	default BR2_BINUTILS_VERSION_2_21_1 if (BR2_UCLIBC_VERSION_0_9_32 || BR2_UCLIBC_VERSION_SNAPSHOT)
+	default BR2_BINUTILS_VERSION_2_22 if (BR2_UCLIBC_VERSION_0_9_32 || BR2_UCLIBC_VERSION_SNAPSHOT)
 	default BR2_BINUTILS_VERSION_2_21
 	help
 	  Select the version of binutils you wish to use.
@@ -28,6 +28,10 @@ choice
 		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_30 || BR2_UCLIBC_VERSION_0_9_31)
 		bool "binutils 2.21.1"
 
+	config BR2_BINUTILS_VERSION_2_22
+		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_30 || BR2_UCLIBC_VERSION_0_9_31)
+		bool "binutils 2.22"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -37,6 +41,7 @@ config BR2_BINUTILS_VERSION
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
+	default "2.22"		if BR2_BINUTILS_VERSION_2_22
 
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
diff --git a/package/binutils/binutils-2.22/120-sh-conf.patch b/package/binutils/binutils-2.22/120-sh-conf.patch
new file mode 100644
index 0000000..ea3d1b6
--- /dev/null
+++ b/package/binutils/binutils-2.22/120-sh-conf.patch
@@ -0,0 +1,29 @@
+r10231 | lethal | 2005-05-02 09:58:00 -0400 (Mon, 02 May 2005) | 13 lines
+
+Likewise, binutils has no idea about any of these new targets either, so we 
+fix that up too.. now we're able to actually build a real toolchain for 
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more 
+inept targets than that one, really. Go look, I promise).
+
+--- a/configure
++++ b/configure
+@@ -1495,7 +1495,7 @@
+   mips*-*-*)
+     noconfigdirs="$noconfigdirs gprof"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+--- a/configure.ac
++++ b/configure.ac
+@@ -712,7 +712,7 @@
+   mips*-*-*)
+     noconfigdirs="$noconfigdirs gprof"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
diff --git a/package/binutils/binutils-2.22/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.22/300-001_ld_makefile_patch.patch
new file mode 100644
index 0000000..5cb0f61
--- /dev/null
+++ b/package/binutils/binutils-2.22/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/binutils-2.22/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.22/300-012_check_ldrunpath_length.patch
new file mode 100644
index 0000000..df78310
--- /dev/null
+++ b/package/binutils/binutils-2.22/300-012_check_ldrunpath_length.patch
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
