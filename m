From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 27 May 2015 17:17:26 -0500
Subject: [Buildroot] [PATCH v6 22/22] cpio: new package
In-Reply-To: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1432765046-1223-23-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding the cpio archive utility for the target and host. Patches have
been pulled from ArchLinux and Debian to fix CVE issues and compile
issues.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

---
Changes v5 -> v6:
  - No changes
---
 package/Config.in                                  |   1 +
 package/Config.in.host                             |   1 +
 package/cpio/0001-stdio.in.patch                   |  19 ++
 package/cpio/0002-CVE-2014-9112.patch              | 218 +++++++++++++++++++++
 package/cpio/0003-testsuite-CVE-2014-9112.patch    |  36 ++++
 .../0004-check_for_symlinks-CVE-2015-1197.patch    | 158 +++++++++++++++
 package/cpio/0005-stat.patch                       |  31 +++
 package/cpio/Config.in                             |   6 +
 package/cpio/Config.in.host                        |   6 +
 package/cpio/cpio.mk                               |  13 ++
 10 files changed, 489 insertions(+)
 create mode 100644 package/cpio/0001-stdio.in.patch
 create mode 100644 package/cpio/0002-CVE-2014-9112.patch
 create mode 100644 package/cpio/0003-testsuite-CVE-2014-9112.patch
 create mode 100644 package/cpio/0004-check_for_symlinks-CVE-2015-1197.patch
 create mode 100644 package/cpio/0005-stat.patch
 create mode 100644 package/cpio/Config.in
 create mode 100644 package/cpio/Config.in.host
 create mode 100644 package/cpio/cpio.mk

diff --git a/package/Config.in b/package/Config.in
index 23912c2..301a7f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -148,6 +148,7 @@ endmenu
 menu "Filesystem and flash utilities"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
+	source "package/cpio/Config.in"
 	source "package/cramfs/Config.in"
 	source "package/curlftpfs/Config.in"
 	source "package/dosfstools/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 051bc4a..322e4fe 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,6 +1,7 @@
 menu "Host utilities"
 
 	source "package/checkpolicy/Config.in.host"
+	source "package/cpio/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
diff --git a/package/cpio/0001-stdio.in.patch b/package/cpio/0001-stdio.in.patch
new file mode 100644
index 0000000..89728e1
--- /dev/null
+++ b/package/cpio/0001-stdio.in.patch
@@ -0,0 +1,19 @@
+Patch pulled from Arch Linux repo at the link below
+
+https://projects.archlinux.org/svntogit/packages.git/plain/trunk/cpio-2.11-stdio.in.patch?h=packages/cpio
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+
+diff -urNp cpio-2.11-orig/gnu/stdio.in.h cpio-2.11/gnu/stdio.in.h
+--- cpio-2.11-orig/gnu/stdio.in.h	2010-03-10 10:27:03.000000000 +0100
++++ cpio-2.11/gnu/stdio.in.h	2012-06-04 10:23:23.804471185 +0200
+@@ -139,7 +139,9 @@ _GL_WARN_ON_USE (fflush, "fflush is not 
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+ #undef gets
++#if HAVE_RAW_DECL_GETS
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
diff --git a/package/cpio/0002-CVE-2014-9112.patch b/package/cpio/0002-CVE-2014-9112.patch
new file mode 100644
index 0000000..20b27b5
--- /dev/null
+++ b/package/cpio/0002-CVE-2014-9112.patch
@@ -0,0 +1,218 @@
+Patch pulled from Arch Linux repo at the link below
+
+https://projects.archlinux.org/svntogit/packages.git/plain/trunk/cpio-2.11-CVE-2014-9112.patch?h=packages/cpio
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+
+diff --git a/src/copyin.c b/src/copyin.c
+index d505407..db8ee66 100644
+--- a/src/copyin.c
++++ b/src/copyin.c
+@@ -124,10 +124,30 @@ tape_skip_padding (int in_file_des, off_t offset)
+   if (pad != 0)
+     tape_toss_input (in_file_des, pad);
+ }
+-
++
++static char *
++get_link_name (struct cpio_file_stat *file_hdr, int in_file_des)
++{
++  char *link_name;
++  
++  if (file_hdr->c_filesize < 0 || file_hdr->c_filesize > SIZE_MAX-1)
++    {
++      error (0, 0, _("%s: stored filename length is out of range"),
++	     file_hdr->c_name);
++      link_name = NULL;
++    }
++  else
++    {
++      link_name = xmalloc (file_hdr->c_filesize + 1);
++      tape_buffered_read (link_name, in_file_des, file_hdr->c_filesize);
++      link_name[file_hdr->c_filesize] = '\0';
++      tape_skip_padding (in_file_des, file_hdr->c_filesize);
++    }
++  return link_name;
++}
+ 
+ static void
+-list_file(struct cpio_file_stat* file_hdr, int in_file_des)
++list_file (struct cpio_file_stat* file_hdr, int in_file_des)
+ {
+   if (verbose_flag)
+     {
+@@ -136,21 +156,16 @@ list_file(struct cpio_file_stat* file_hdr, int in_file_des)
+ 	{
+ 	  if (archive_format != arf_tar && archive_format != arf_ustar)
+ 	    {
+-	      char *link_name = NULL;	/* Name of hard and symbolic links.  */
+-
+-	      link_name = (char *) xmalloc ((unsigned int) file_hdr->c_filesize + 1);
+-	      link_name[file_hdr->c_filesize] = '\0';
+-	      tape_buffered_read (link_name, in_file_des, file_hdr->c_filesize);
+-	      long_format (file_hdr, link_name);
+-	      free (link_name);
+-	      tape_skip_padding (in_file_des, file_hdr->c_filesize);
+-	      return;
++	      char *link_name = get_link_name (file_hdr, in_file_des);
++	      if (link_name)
++		{
++		  long_format (file_hdr, link_name);
++		  free (link_name);
++		}
+ 	    }
+ 	  else
+-	    {
+-	      long_format (file_hdr, file_hdr->c_tar_linkname);
+-	      return;
+-	    }
++	    long_format (file_hdr, file_hdr->c_tar_linkname);
++	  return;
+ 	}
+       else
+ #endif
+@@ -650,10 +665,7 @@ copyin_link(struct cpio_file_stat *file_hdr, int in_file_des)
+ 
+   if (archive_format != arf_tar && archive_format != arf_ustar)
+     {
+-      link_name = (char *) xmalloc ((unsigned int) file_hdr->c_filesize + 1);
+-      link_name[file_hdr->c_filesize] = '\0';
+-      tape_buffered_read (link_name, in_file_des, file_hdr->c_filesize);
+-      tape_skip_padding (in_file_des, file_hdr->c_filesize);
++      link_name = get_link_name (file_hdr, in_file_des);
+     }
+   else
+     {
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index b3e8e60..cf186da 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -52,6 +52,8 @@ TESTSUITE_AT = \
+  setstat04.at\
+  setstat05.at\
+  symlink.at\
++ symlink-bad-length.at\
++ symlink-long.at\
+  version.at
+ 
+ TESTSUITE = $(srcdir)/testsuite
+diff --git a/tests/symlink-bad-length.at b/tests/symlink-bad-length.at
+new file mode 100644
+index 0000000..cbf4aa7
+--- /dev/null
++++ b/tests/symlink-bad-length.at
+@@ -0,0 +1,49 @@
++# Process this file with autom4te to create testsuite.  -*- Autotest -*-
++# Copyright (C) 2014 Free Software Foundation, Inc.
++
++# This program is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3, or (at your option)
++# any later version.
++
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
++# 02110-1301 USA.
++
++# Cpio v2.11 did segfault with badly set symlink length.
++# References:
++# http://lists.gnu.org/archive/html/bug-cpio/2014-11/msg00007.html
++
++AT_SETUP([symlink-bad-length])
++AT_KEYWORDS([symlink-long copyout])
++
++AT_DATA([ARCHIVE.base64],
++[x3EjAIBAtIEtJy8nAQAAAHRUYW0FAAAADQBGSUxFAABzb21lIGNvbnRlbnQKAMdxIwBgQ/+hLScv
++JwEAAAB0VEhuBQD/////TElOSwAARklMRcdxAAAAAAAAAAAAAAEAAAAAAAAACwAAAAAAVFJBSUxF
++UiEhIQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
++])
++
++AT_CHECK([
++base64 -d ARCHIVE.base64 > ARCHIVE || AT_SKIP_TEST
++cpio -ntv < ARCHIVE
++test $? -eq 2
++],
++[0],
++[-rw-rw-r--   1 10029    10031          13 Nov 25 13:52 FILE
++],[cpio: LINK: stored filename length is out of range
++cpio: premature end of file
++])
++
++AT_CLEANUP
+diff --git a/tests/symlink-long.at b/tests/symlink-long.at
+new file mode 100644
+index 0000000..d3def2d
+--- /dev/null
++++ b/tests/symlink-long.at
+@@ -0,0 +1,46 @@
++# Process this file with autom4te to create testsuite.  -*- Autotest -*-
++# Copyright (C) 2014 Free Software Foundation, Inc.
++
++# This program is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3, or (at your option)
++# any later version.
++
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
++# 02110-1301 USA.
++
++# Cpio v2.11.90 changed the way symlink name is read from archive.
++# References:
++# http://lists.gnu.org/archive/html/bug-cpio/2014-11/msg00007.html
++
++AT_SETUP([symlink-long])
++AT_KEYWORDS([symlink-long copyout])
++
++AT_CHECK([
++
++# len(dirname) > READBUFSIZE
++dirname=
++for i in {1..52}; do
++    dirname="xxxxxxxxx/$dirname"
++    mkdir "$dirname"
++done
++ln -s "$dirname" x || AT_SKIP_TEST
++
++echo x | cpio -o > ar
++list=`cpio -tv < ar | sed 's|.*-> ||'`
++test "$list" = "$dirname" && echo success || echo fail
++],
++[0],
++[success
++],[2 blocks
++2 blocks
++])
++
++AT_CLEANUP
+diff --git a/tests/testsuite.at b/tests/testsuite.at
+index 8f3330b..590bdcb 100644
+--- a/tests/testsuite.at
++++ b/tests/testsuite.at
+@@ -31,6 +31,8 @@ m4_include([version.at])
+ 
+ m4_include([inout.at])
+ m4_include([symlink.at])
++m4_include([symlink-bad-length.at])
++m4_include([symlink-long.at])
+ m4_include([interdir.at])
+ 
+ m4_include([setstat01.at])
diff --git a/package/cpio/0003-testsuite-CVE-2014-9112.patch b/package/cpio/0003-testsuite-CVE-2014-9112.patch
new file mode 100644
index 0000000..47fc4c6
--- /dev/null
+++ b/package/cpio/0003-testsuite-CVE-2014-9112.patch
@@ -0,0 +1,36 @@
+Patch pulled from Arch Linux repo at the link below
+
+https://projects.archlinux.org/svntogit/packages.git/plain/trunk/cpio-2.11-testsuite-CVE-2014-9112.patch?h=packages/cpio
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+
+diff --git a/tests/symlink-bad-length.at b/tests/symlink-bad-length.at
+index cbf4aa7..d8d250b 100644
+--- a/tests/symlink-bad-length.at
++++ b/tests/symlink-bad-length.at
+@@ -37,13 +37,20 @@ AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
+ 
+ AT_CHECK([
+ base64 -d ARCHIVE.base64 > ARCHIVE || AT_SKIP_TEST
+-cpio -ntv < ARCHIVE
+-test $? -eq 2
++TZ=UTC cpio -ntv < ARCHIVE 2>stderr
++rc=$?
++cat stderr | grep -v \
++    -e 'stored filename length is out of range' \
++    -e 'premature end of file' \
++    -e 'archive header has reverse byte-order' \
++    -e 'memory exhausted' \
++    >&2
++echo >&2 STDERR
++test "$rc" -ne 0
+ ],
+ [0],
+-[-rw-rw-r--   1 10029    10031          13 Nov 25 13:52 FILE
+-],[cpio: LINK: stored filename length is out of range
+-cpio: premature end of file
++[-rw-rw-r--   1 10029    10031          13 Nov 25 11:52 FILE
++],[STDERR
+ ])
+ 
+ AT_CLEANUP
diff --git a/package/cpio/0004-check_for_symlinks-CVE-2015-1197.patch b/package/cpio/0004-check_for_symlinks-CVE-2015-1197.patch
new file mode 100644
index 0000000..fd89a8d
--- /dev/null
+++ b/package/cpio/0004-check_for_symlinks-CVE-2015-1197.patch
@@ -0,0 +1,158 @@
+Patch pulled from Arch Linux repo at the link below
+
+https://projects.archlinux.org/svntogit/packages.git/plain/trunk/cpio-2.11-check_for_symlinks-CVE-2015-1197.patch?h=packages/cpio
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+
+Index: cpio-2.11/src/copyin.c
+===================================================================
+--- cpio-2.11.orig/src/copyin.c	2014-07-01 14:02:39.991007263 +0200
++++ cpio-2.11/src/copyin.c	2014-07-22 16:05:28.171344584 +0200
+@@ -686,6 +686,51 @@ copyin_link(struct cpio_file_stat *file_
+   free (link_name);
+ }
+ 
++
++static int
++path_contains_symlink(char *path)
++{
++  struct stat st;
++  char *slash;
++  char *nextslash;
++
++  /* we got NULL pointer or empty string */
++  if (!path || !*path) {
++    return false;
++  }
++
++  slash = path;
++
++  while ((nextslash = strchr(slash + 1, '/')) != NULL) {
++    slash = nextslash;
++    *slash = '\0';
++
++    if (lstat(path, &st) != 0) {
++      if (errno == ELOOP) {
++        /* ELOOP - too many symlinks */
++        *slash = '/';
++        return true;
++      } else if (errno == ENOMEM) {
++        /* No memory for lstat - terminate */
++        xalloc_die();
++      } else {
++        /* cannot lstat path - give up */
++        *slash = '/';
++        return false;
++      }
++    }
++
++    if (S_ISLNK(st.st_mode)) {
++      *slash = '/';
++      return true;
++    }
++
++    *slash = '/';
++  }
++
++  return false;
++}
++
+ static void
+ copyin_file (struct cpio_file_stat *file_hdr, int in_file_des)
+ {
+@@ -1463,6 +1508,23 @@ process_copy_in ()
+ 	{
+ 	  /* Copy the input file into the directory structure.  */
+ 
++          /* Can we write files over symlinks? */
++          if (!extract_over_symlinks)
++            {
++              if (path_contains_symlink(file_hdr.c_name))
++                {
++                  /* skip the file */
++                  /*
++                  fprintf(stderr, "Can't write over symlinks. Skipping %s\n", file_hdr.c_name);
++                  tape_toss_input (in_file_des, file_hdr.c_filesize);
++                  tape_skip_padding (in_file_des, file_hdr.c_filesize);
++                  continue;
++                  */
++                  /* terminate */
++	          error (1, 0, _("Can't write over symlinks: %s\n"), file_hdr.c_name);
++                }
++            }
++
+ 	  /* Do we need to rename the file? */
+ 	  if (rename_flag || rename_batch_file)
+ 	    {
+Index: cpio-2.11/src/global.c
+===================================================================
+--- cpio-2.11.orig/src/global.c	2014-07-17 16:33:09.768900927 +0200
++++ cpio-2.11/src/global.c	2014-07-21 17:45:58.563494706 +0200
+@@ -187,6 +187,9 @@ bool to_stdout_option = false;
+ /* The name this program was run with.  */
+ char *program_name;
+ 
++/* Extract files over symbolic links */
++bool extract_over_symlinks;
++
+ /* A pointer to either lstat or stat, depending on whether
+    dereferencing of symlinks is done for input files.  */
+ int (*xstat) ();
+Index: cpio-2.11/src/main.c
+===================================================================
+--- cpio-2.11.orig/src/main.c	2014-07-01 14:02:39.840005051 +0200
++++ cpio-2.11/src/main.c	2014-07-17 20:33:47.839215571 +0200
+@@ -57,7 +57,8 @@ enum cpio_options {
+   FORCE_LOCAL_OPTION,            
+   DEBUG_OPTION,                  
+   BLOCK_SIZE_OPTION,             
+-  TO_STDOUT_OPTION
++  TO_STDOUT_OPTION,
++  EXTRACT_OVER_SYMLINKS
+ };
+ 
+ const char *program_authors[] =
+@@ -222,6 +223,8 @@ static struct argp_option options[] = {
+    N_("Create leading directories where needed"), GRID+1 },
+   {"no-preserve-owner", NO_PRESERVE_OWNER_OPTION, 0, 0,
+    N_("Do not change the ownership of the files"), GRID+1 },
++  {"extract-over-symlinks", EXTRACT_OVER_SYMLINKS, 0, 0,
++   N_("Force writing over symbolic links"), GRID+1 },
+   {"unconditional", 'u', NULL, 0,
+    N_("Replace all files unconditionally"), GRID+1 },
+   {"sparse", SPARSE_OPTION, NULL, 0,
+@@ -413,6 +416,10 @@ crc newc odc bin ustar tar (all-caps als
+       no_chown_flag = true;
+       break;
+ 
++    case EXTRACT_OVER_SYMLINKS:		        /* --extract-over-symlinks */
++      extract_over_symlinks = true;
++      break;
++
+     case 'o':		/* Copy-out mode.  */
+       if (copy_function != 0)
+ 	error (PAXEXIT_FAILURE, 0, _("Mode already defined"));
+Index: cpio-2.11/src/extern.h
+===================================================================
+--- cpio-2.11.orig/src/extern.h	2014-07-01 14:02:39.907006032 +0200
++++ cpio-2.11/src/extern.h	2014-07-17 17:11:20.948908806 +0200
+@@ -95,6 +95,7 @@ extern char input_is_special;
+ extern char output_is_special;
+ extern char input_is_seekable;
+ extern char output_is_seekable;
++extern bool extract_over_symlinks;
+ extern int (*xstat) ();
+ extern void (*copy_function) ();
+ 
+Index: cpio-2.11/doc/cpio.1
+===================================================================
+--- cpio-2.11.orig/doc/cpio.1	2009-02-14 19:15:50.000000000 +0100
++++ cpio-2.11/doc/cpio.1	2014-07-21 23:00:33.878746855 +0200
+@@ -22,6 +22,7 @@ cpio \- copy files to and from archives
+ [\-\-owner=[user][:.][group]] [\-\-no-preserve-owner] [\-\-message=message]
+ [\-\-force\-local] [\-\-no\-absolute\-filenames] [\-\-sparse]
+ [\-\-only\-verify\-crc] [\-\-to\-stdout] [\-\-quiet] [\-\-rsh-command=command]
++[\-\-extract\-over\-symlinks]
+ [\-\-help] [\-\-version] [pattern...] [< archive]
+ 
+ .B cpio
diff --git a/package/cpio/0005-stat.patch b/package/cpio/0005-stat.patch
new file mode 100644
index 0000000..fd824fc
--- /dev/null
+++ b/package/cpio/0005-stat.patch
@@ -0,0 +1,31 @@
+Pulled from the Gentoo sources repository at
+
+https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-arch/cpio/files/cpio-2.11-stat.patch?revision=1.1
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+
+http://bugs.gentoo.org/328531
+
+From 3a7a1820d4cecbd77c7b74c785af5942510bf080 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org.ua>
+Date: Thu, 22 Jul 2010 13:13:34 +0300
+Subject: [PATCH] Minor fix.
+
+* src/filetypes.h: Remove declarations of stat and lstat.
+---
+ src/filetypes.h |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/src/filetypes.h b/src/filetypes.h
+index f80faab..81f0c32 100644
+--- a/src/filetypes.h
++++ b/src/filetypes.h
+@@ -81,5 +81,3 @@
+ #ifndef S_ISLNK
+ #define lstat stat
+ #endif
+-int lstat ();
+-int stat ();
+-- 
+1.7.3
+
diff --git a/package/cpio/Config.in b/package/cpio/Config.in
new file mode 100644
index 0000000..3ee74f6
--- /dev/null
+++ b/package/cpio/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_CPIO
+	bool "cpio"
+	help
+	  cpio archive utility for creation and extraction.
+
+	  https://www.gnu.org/software/cpio/
diff --git a/package/cpio/Config.in.host b/package/cpio/Config.in.host
new file mode 100644
index 0000000..e927952
--- /dev/null
+++ b/package/cpio/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_CPIO
+	bool "host cpio"
+	help
+	  cpio archive utility for creation and extraction.
+
+	  https://www.gnu.org/software/cpio/
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
new file mode 100644
index 0000000..25f4975
--- /dev/null
+++ b/package/cpio/cpio.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# cpio
+#
+################################################################################
+
+CPIO_VERSION = 2.11
+CPIO_SITE = http://ftp.gnu.org/gnu/cpio
+CPIO_LICENSE = GPLv3
+CPIO_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
