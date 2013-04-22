From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 22 Apr 2013 13:37:27 +0200
Subject: [Buildroot] [PATCH 3/7] arc: Add support for ARC-specific binutils
In-Reply-To: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1366630651-6857-4-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARC support is not upstream yet...

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/binutils/Config.in.host                    |   17 ++++++---
 .../300-001_ld_makefile_patch.patch                |   24 +++++++++++++
 .../300-012_check_ldrunpath_length.patch           |   21 +++++++++++
 .../binutils/binutils-2.19-arc/500-sysroot.patch   |   36 ++++++++++++++++++++
 package/binutils/binutils.mk                       |    3 ++
 5 files changed, 95 insertions(+), 6 deletions(-)
 create mode 100644 package/binutils/binutils-2.19-arc/300-001_ld_makefile_patch.patch
 create mode 100644 package/binutils/binutils-2.19-arc/300-012_check_ldrunpath_length.patch
 create mode 100644 package/binutils/binutils-2.19-arc/500-sysroot.patch

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index a61a503..b634796 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -12,28 +12,32 @@ choice
 	       depends on BR2_avr32
 	       bool "binutils 2.18-avr32-1.0.1"
 
+	config BR2_BINUTILS_VERSION_2_19_ARC
+		depends on BR2_arc || BR2_arceb
+		bool "binutils 2.19-arc"
+
 	config BR2_BINUTILS_VERSION_2_20_1
-		depends on !BR2_avr32
+		depends on !(BR2_arc || BR2_arceb || BR2_avr32)
 		bool "binutils 2.20.1"
 
 	config BR2_BINUTILS_VERSION_2_21
-		depends on !BR2_avr32
+		depends on !(BR2_arc || BR2_arceb || BR2_avr32)
 		bool "binutils 2.21"
 
 	config BR2_BINUTILS_VERSION_2_21_1
-		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
+		depends on !(BR2_arc || BR2_arceb || BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
 		bool "binutils 2.21.1"
 
 	config BR2_BINUTILS_VERSION_2_22
-		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
+		depends on !(BR2_arc || BR2_arceb || BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
 		bool "binutils 2.22"
 
 	config BR2_BINUTILS_VERSION_2_23_1
-		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
+		depends on !(BR2_arc || BR2_arceb || BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
 		bool "binutils 2.23.1"
 
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
+		depends on !(BR2_arc || BR2_arceb || BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
 		bool "binutils 2.23.2"
 
 endchoice
@@ -41,6 +45,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
+	default "2.19-arc"	if BR2_BINUTILS_VERSION_2_19_ARC
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
diff --git a/package/binutils/binutils-2.19-arc/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.19-arc/300-001_ld_makefile_patch.patch
new file mode 100644
index 0000000..5cb0f61
--- /dev/null
+++ b/package/binutils/binutils-2.19-arc/300-001_ld_makefile_patch.patch
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
diff --git a/package/binutils/binutils-2.19-arc/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.19-arc/300-012_check_ldrunpath_length.patch
new file mode 100644
index 0000000..6e80921
--- /dev/null
+++ b/package/binutils/binutils-2.19-arc/300-012_check_ldrunpath_length.patch
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
diff --git a/package/binutils/binutils-2.19-arc/500-sysroot.patch b/package/binutils/binutils-2.19-arc/500-sysroot.patch
new file mode 100644
index 0000000..d21e4cb
--- /dev/null
+++ b/package/binutils/binutils-2.19-arc/500-sysroot.patch
@@ -0,0 +1,36 @@
+Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
+
+Always try to prepend the sysroot prefix to absolute filenames first.
+
+http://bugs.gentoo.org/275666
+http://sourceware.org/bugzilla/show_bug.cgi?id=10340
+
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -308,18 +308,24 @@
+      directory first.  */
+   if (! entry->is_archive)
+     {
+-      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
++      /* For absolute pathnames, try to always open the file in the
++	 sysroot first. If this fails, try to open the file at the
++	 given location. */
++      entry->sysrooted = is_sysrooted_pathname(entry->filename, FALSE);
++      if (IS_ABSOLUTE_PATH (entry->filename) && ld_sysroot && ! entry->sysrooted)
+ 	{
+ 	  char *name = concat (ld_sysroot, entry->filename,
+ 			       (const char *) NULL);
+ 	  if (ldfile_try_open_bfd (name, entry))
+ 	    {
+ 	      entry->filename = name;
++	      entry->sysrooted = TRUE;
+ 	      return TRUE;
+ 	    }
+ 	  free (name);
+ 	}
+-      else if (ldfile_try_open_bfd (entry->filename, entry))
++
++      if (ldfile_try_open_bfd (entry->filename, entry))
+ 	{
+ 	  entry->sysrooted = IS_ABSOLUTE_PATH (entry->filename)
+ 	    && is_sysrooted_pathname (entry->filename, TRUE);
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 92e0a74..d387c27 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -26,6 +26,9 @@ BINUTILS_SITE = $(BR2_GNU_MIRROR)/binutils
 ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
+ifeq ($(ARCH),arc)
+BINUTILS_SITE = $(BR2_ARC_SITE)
+endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-- 
1.7.0.4
