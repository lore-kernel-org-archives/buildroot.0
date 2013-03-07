From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Mar 2013 19:46:37 -0300
Subject: [Buildroot] [PATCH] util-linux: bump version and revamp options
Message-ID: <1362696397-16738-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to latest 2.22.2 version and revamp available options.

* Remove the assumed enable/disable defaults since these seem to change
  quite often, so do what's wise and always enable/disable things.

* Switch from build "X" menu options to just X, add some help and sort.

* Introduce new option to install binaries (or not) to reduce bloat for
  packages that just need libblkid and/or libuuid.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/Config.in                       | 189 ++++++++++++++-------
 .../util-linux-001-sscanf-no-ms-as.patch           |  75 +++++---
 .../util-linux-002-add-missing-rpmatch.patch       |  51 ++++++
 .../util-linux-002-uclibc-build-fix.patch          |  16 --
 .../util-linux-003-fdisk-aarch64-support.patch     |  22 ---
 ...l-linux-003-program-invocation-short-name.patch |  18 ++
 .../util-linux/util-linux-004-xtensa-support.patch |  21 ++-
 package/util-linux/util-linux.mk                   |  88 +++++-----
 8 files changed, 311 insertions(+), 169 deletions(-)
 create mode 100644 package/util-linux/util-linux-002-add-missing-rpmatch.patch
 delete mode 100644 package/util-linux/util-linux-002-uclibc-build-fix.patch
 delete mode 100644 package/util-linux/util-linux-003-fdisk-aarch64-support.patch
 create mode 100644 package/util-linux/util-linux-003-program-invocation-short-name.patch

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 5eab956..799833e 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_UTIL_LINUX
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	help
-	  Various useful/essential Linux utilities.
+	  Various useful/essential linux libraries and utilities.
 
 	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc...
 
@@ -11,96 +11,165 @@ config BR2_PACKAGE_UTIL_LINUX
 
 if BR2_PACKAGE_UTIL_LINUX
 
-############################################
-# default enabled and should be disabled by
-#  --disable-foo
-#
-
-config BR2_PACKAGE_UTIL_LINUX_MOUNT
-	bool "build mount utilties"
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-
-config BR2_PACKAGE_UTIL_LINUX_FSCK
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	bool "build \"fsck\""
+config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	bool "libblkid"
+	help
+	  Install libblkid.
 
 config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	bool "build libmount"
+	# libc lacks UTIME_NOW & UTIME_COMMIT
+	depends on !(BR2_microblazeel || BR2_microblazebe)
+	bool "libmount"
+	help
+	  Install libmount.
 
 config BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	bool "build libuuid and uuid utilities"
-	default y
-
-config BR2_PACKAGE_UTIL_LINUX_UUIDD
-	bool "build \"uuidd\""
+	bool "libuuid"
+	help
+	  Install libuuid.
 
-config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+config BR2_PACKAGE_UTIL_LINUX_BINARIES
+	bool "install utilities"
+	depends on BR2_USE_MMU # fork()
+	# libc lacks UTIME_NOW & UTIME_COMMIT for libmount
+	depends on !(BR2_microblazeel || BR2_microblazebe)
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	bool "build libblkid and blkid utilities"
-	default y
+	help
+	  Install the basic set of util-linux binaries.
+
+if BR2_PACKAGE_UTIL_LINUX_BINARIES
 
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
-	bool "build \"agetty\""
+	bool "agetty"
+	help
+	  Alternative linux getty
+
+config BR2_PACKAGE_UTIL_LINUX_ARCH
+	bool "arch"
+	help
+	  Print machine architecture
 
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
-	bool "build \"fsck.cramfs, mkfs.cramfs\""
+	bool "cramfs utilities"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Build fsck.cramfs and mkfs.cramfs
 
-config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
-	bool "build \"switch_root\""
+config BR2_PACKAGE_UTIL_LINUX_DDATE
+	bool "ddate"
+	help
+	  Convert Gregorian dates to Discordian dates
 
-config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
-	bool "build \"pivot_root\""
+config BR2_PACKAGE_UTIL_LINUX_EJECT
+	bool "eject"
+	help
+	  Eject removable media
 
 config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
-	bool "build \"fallocate\""
+	bool "fallocate"
+	help
+	  Preallocate space to a file
 
-config BR2_PACKAGE_UTIL_LINUX_UNSHARE
-	bool "build \"unshare\""
+config BR2_PACKAGE_UTIL_LINUX_FSCK
+	bool "fsck"
+	help
+	  Check and repair a linux filesystem
 
-config BR2_PACKAGE_UTIL_LINUX_RENAME
-	bool "build \"rename\""
+config BR2_PACKAGE_UTIL_LINUX_KILL
+	bool "kill"
+	help
+	  Send a signal to a process
 
-config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
-	bool "build \"chrt, ionice, taskset\""
+config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
+	bool "login utilities"
+	depends on BR2_ENABLE_LOCALE # linux-pam
+	select BR2_PACKAGE_LINUX_PAM
+	help
+	  Build login utilities (last, login, su, sulogin)
 
-config BR2_PACKAGE_UTIL_LINUX_WALL
-	bool "build \"wall\""
+comment "login utilities require a toolchain with locale support"
+	depends on !BR2_ENABLE_LOCALE
+
+config BR2_PACKAGE_UTIL_LINUX_MESG
+	bool "mesg"
+	help
+	  Control write access to your terminal
+
+config BR2_PACKAGE_UTIL_LINUX_MOUNT
+	bool "mount/umount"
+	help
+	  Mount/unmount filesystems
+
+config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
+	bool "pivot_root"
+	help
+	  Change the root filesystem
 
 config BR2_PACKAGE_UTIL_LINUX_PARTX
-	bool "build \"addpart, delpart, partx\""
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	bool "partition utilities"
+	help
+	  Partition tools (addpart, delpart, partx)
 
-############################################
-# default disabled and should be enabled by
-#  --enable-foo
-#
-config BR2_PACKAGE_UTIL_LINUX_ARCH
-	bool "build \"arch\""
+config BR2_PACKAGE_UTIL_LINUX_RAW
+	bool "raw"
+	help
+	  Build a linux raw character device
 
-config BR2_PACKAGE_UTIL_LINUX_INIT
-	bool "build \"simpleinit, shutdown, initctl\""
+config BR2_PACKAGE_UTIL_LINUX_RENAME
+	bool "rename"
+	help
+	  Rename files
 
-config BR2_PACKAGE_UTIL_LINUX_KILL
-	bool "build \"kill\""
+config BR2_PACKAGE_UTIL_LINUX_RESET
+	bool "reset"
+	help
+	  Reset the terminal
+
+config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
+	bool "schedutils"
+	help
+	  Scheduling utilities (chrt, ionice, taskset)
 
-config BR2_PACKAGE_UTIL_LINUX_LAST
-	bool "build \"last\""
+config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
+	bool "switch_root"
+	help
+	  Switch to another filesystem as the root of the mount tree
 
-config BR2_PACKAGE_UTIL_LINUX_MESG
-	bool "build \"mesg\""
+config BR2_PACKAGE_UTIL_LINUX_UNSHARE
+	bool "unshare"
+	help
+	  Run program with some namespaces unshared from parent
 
-config BR2_PACKAGE_UTIL_LINUX_RAW
-	bool "build \"raw\""
+config BR2_PACKAGE_UTIL_LINUX_UTMPDUMP
+	bool "utmpdump"
+	help
+	  Dump UTMP and WTMP files in raw format
 
-config BR2_PACKAGE_UTIL_LINUX_RESET
-	bool "build \"reset\""
+config BR2_PACKAGE_UTIL_LINUX_UUIDD
+	bool "uuidd"
+	help
+	 UUID generation daemon
 
-config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
-	bool "build \"chfn, chsh, login, newgrp, vipw\""
+config BR2_PACKAGE_UTIL_LINUX_WALL
+	bool "wall"
+	help
+	  Send a message to everybody's terminal
+
+config BR2_PACKAGE_WDCTL
+	bool "wdctl"
+	help
+	  Shows hardware watchdog status
 
 config BR2_PACKAGE_UTIL_LINUX_WRITE
-	bool "build \"write\""
+	bool "write"
+	help
+	  Send a message to another user
+
+endif
 
 endif
 
diff --git a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
index 5b0ac36..6ba7bab 100644
--- a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
+++ b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
@@ -1,29 +1,39 @@
-[PATCH] Fix libmount build under uClibc
+Fix libmount build under uClibc
 
-Taken from gentoo-hardened:
-http://git.overlays.gentoo.org/gitweb/?p=proj/hardened-dev.git;a=commit;h=91879751
+See https://bugs.gentoo.org/show_bug.cgi?id=406303
+Patch from http://repository.timesys.com/buildsources/u/util-linux/util-linux-2.21.2/util-linux-2.21.2-sscanf-no-ms-as.patch ported to util-linux-2.22.2
 
-For details, see https://bugs.gentoo.org/show_bug.cgi?id=406303
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-diff -Naur util-linux-2.20.1.orig/libmount/src/tab_parse.c util-linux-2.20.1/libmount/src/tab_parse.c
---- util-linux-2.20.1.orig/libmount/src/tab_parse.c	2011-12-12 20:51:06.646614964 -0500
-+++ util-linux-2.20.1/libmount/src/tab_parse.c	2011-12-12 21:02:03.587865010 -0500
-@@ -51,19 +51,21 @@
+diff -Nura util-linux-2.22.2/configure.ac util-linux-2.22.2-sscanf-no-ms-as/configure.ac
+--- util-linux-2.22.2/configure.ac	2012-12-13 08:16:02.973822890 -0300
++++ util-linux-2.22.2-sscanf-no-ms-as/configure.ac	2013-03-07 14:50:39.975512873 -0300
+@@ -733,7 +733,6 @@
+ UL_BUILD_INIT([libmount])
+ UL_REQUIRES_LINUX([libmount])
+ UL_REQUIRES_BUILD([libmount], [libblkid])
+-UL_REQUIRES_HAVE([libmount], [scanf_alloc_modifier], [scanf string alloc modifier])
+ AM_CONDITIONAL(BUILD_LIBMOUNT, test "x$build_libmount" = xyes)
+ AM_CONDITIONAL(BUILD_LIBMOUNT_TESTS, test "x$build_libmount" = xyes -a "x$enable_static" = xyes)
+
+diff -Nura util-linux-2.22.2/libmount/src/tab_parse.c util-linux-2.22.2-sscanf-no-ms-as/libmount/src/tab_parse.c
+--- util-linux-2.22.2/libmount/src/tab_parse.c	2012-12-12 17:04:47.906355128 -0300
++++ util-linux-2.22.2-sscanf-no-ms-as/libmount/src/tab_parse.c	2013-03-07 15:08:29.589503961 -0300
+@@ -58,19 +58,21 @@
   */
  static int mnt_parse_table_line(struct libmnt_fs *fs, char *s)
  {
--	int rc, n = 0;
--	char *src, *fstype, *optstr;
+-	int rc, n = 0, xrc;
+-	char *src = NULL, *fstype = NULL, *optstr = NULL;
 -
 -	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
 -			UL_SCNsA" "	/* (2) target */
 -			UL_SCNsA" "	/* (3) FS type */
 -			UL_SCNsA" "	/* (4) options */
-+	int rc, n = 0, len = strlen (s) + 1;
++	int rc, n = 0, len = strlen (s) + 1, xrc;
 +	char *src     = malloc (sizeof *src * len);
-+  char *fstype  = malloc (sizeof *fstype * len);
-+  char *optstr  = malloc (sizeof *optstr * len);
++	char *fstype  = malloc (sizeof *fstype * len);
++	char *optstr  = malloc (sizeof *optstr * len);
 +
 +	rc = sscanf(s,	"%s"" "	/* (1) source */
 +			"%s"" "	/* (2) target */
@@ -40,20 +50,20 @@ diff -Naur util-linux-2.20.1.orig/libmount/src/tab_parse.c util-linux-2.20.1/lib
 +			fstype,
 +			optstr,
  			&n);
+	xrc = rc;
  
- 	if (rc == 4) {
-@@ -108,16 +110,20 @@
+@@ -132,16 +134,20 @@
   */
  static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
  {
 -	int rc, end = 0;
 +	int rc, end = 0, len = strlen (s) + 1;
  	unsigned int maj, min;
- 	char *fstype, *src, *p;
+	char *fstype = NULL, *src = NULL, *p;
  
-+  fs->root        = malloc (sizeof *fs->root * len);
-+  fs->target      = malloc (sizeof *fs->target * len);
-+  fs->vfs_optstr  = malloc (sizeof *fs->vfs_optstr * len);
++	fs->root        = malloc (sizeof *fs->root * len);
++	fs->target      = malloc (sizeof *fs->target * len);
++	fs->vfs_optstr  = malloc (sizeof *fs->vfs_optstr * len);
 +
  	rc = sscanf(s,	"%u "		/* (1) id */
  			"%u "		/* (2) parent */
@@ -67,17 +77,17 @@ diff -Naur util-linux-2.20.1.orig/libmount/src/tab_parse.c util-linux-2.20.1/lib
  			"%n",		/* number of read bytes */
  
  			&fs->id,
-@@ -139,9 +145,14 @@
+@@ -163,9 +169,14 @@
  	}
  	s = p + 3;
  
 -	rc += sscanf(s,	UL_SCNsA" "	/* (8) FS type */
 -			UL_SCNsA" "	/* (9) source */
 -			UL_SCNsA,	/* (10) fs options (fs specific) */
-+  len           = strlen (s) + 1;
++	len           = strlen (s) + 1;
 +	fstype        = malloc (sizeof *fstype * len);
-+  src           = malloc (sizeof *src * len);
-+  fs->fs_optstr = malloc (sizeof *fs->fs_optstr * len);
++	src           = malloc (sizeof *src * len);
++	fs->fs_optstr = malloc (sizeof *fs->fs_optstr * len);
 +
 +	rc += sscanf(s,	"%s"" "	/* (8) FS type */
 +			"%s"" "	/* (9) source */
@@ -85,3 +95,20 @@ diff -Naur util-linux-2.20.1.orig/libmount/src/tab_parse.c util-linux-2.20.1/lib
  
  			&fstype,
  			&src,
+@@ -274,11 +285,12 @@
+ static int mnt_parse_swaps_line(struct libmnt_fs *fs, char *s)
+ {
+	uintmax_t fsz, usz;
+-	int rc;
+-	char *src = NULL;
++	int rc, len = strlen (s) + 1;
++	char *src = malloc (sizeof *src * len);
++	fs->swaptype = malloc (sizeof *fs->swaptype * len);
+
+-	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
+-			UL_SCNsA" "	/* (2) type */
++	rc = sscanf(s,	"%s"		/* (1) source */
++			"%s"		/* (2) type */
+			"%jd"		/* (3) size */
+			"%jd"		/* (4) used */
+			"%d",		/* priority */
diff --git a/package/util-linux/util-linux-002-add-missing-rpmatch.patch b/package/util-linux/util-linux-002-add-missing-rpmatch.patch
new file mode 100644
index 0000000..d311e3f
--- /dev/null
+++ b/package/util-linux/util-linux-002-add-missing-rpmatch.patch
@@ -0,0 +1,51 @@
+From 51924a4ef0dd8f4906729cb6760d1929049c1983 Mon Sep 17 00:00:00 2001
+From: William Pitcock <nenolod@dereferenced.org>
+Date: Wed, 20 Feb 2013 13:04:02 +0100
+Subject: [PATCH] add missing rpmatch.h everywhere it needs to be
+
+Signed-off-by: William Pitcock <nenolod@dereferenced.org>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ disk-utils/fsck.minix.c | 1 +
+ login-utils/vipw.c      | 1 +
+ term-utils/mesg.c       | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/disk-utils/fsck.minix.c b/disk-utils/fsck.minix.c
+index 1426950..3482200 100644
+--- a/disk-utils/fsck.minix.c
++++ b/disk-utils/fsck.minix.c
+@@ -111,6 +111,7 @@
+ #include "ismounted.h"
+ #include "all-io.h"
+ #include "closestream.h"
++#include "rpmatch.h"
+
+ #define ROOT_INO 1
+ #define YESNO_LENGTH 64
+diff --git a/login-utils/vipw.c b/login-utils/vipw.c
+index 20c05c2..8c47801 100644
+--- a/login-utils/vipw.c
++++ b/login-utils/vipw.c
+@@ -78,6 +78,7 @@
+ #include "setpwnam.h"
+ #include "strutils.h"
+ #include "xalloc.h"
++#include "rpmatch.h"
+
+ #ifdef HAVE_LIBSELINUX
+ # include <selinux/selinux.h>
+diff --git a/term-utils/mesg.c b/term-utils/mesg.c
+index 6ac5a2e..430236f 100644
+--- a/term-utils/mesg.c
++++ b/term-utils/mesg.c
+@@ -58,6 +58,7 @@
+ #include "closestream.h"
+ #include "nls.h"
+ #include "c.h"
++#include "rpmatch.h"
+
+ /* exit codes */
+
+--
+1.8.1.5
diff --git a/package/util-linux/util-linux-002-uclibc-build-fix.patch b/package/util-linux/util-linux-002-uclibc-build-fix.patch
deleted file mode 100644
index f9da863..0000000
--- a/package/util-linux/util-linux-002-uclibc-build-fix.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: util-linux-2.19.1/configure.ac
-===================================================================
---- util-linux-2.19.1.orig/configure.ac
-+++ util-linux-2.19.1/configure.ac
-@@ -250,7 +250,7 @@ esac
-
-
- AC_MSG_CHECKING(whether program_invocation_short_name is defined)
--AC_TRY_COMPILE([#include <argp.h>],
-+AC_TRY_COMPILE([#include <errno.h>],
-                [program_invocation_short_name = "test";],
-                AC_DEFINE(HAVE_PROGRAM_INVOCATION_SHORT_NAME, 1,
-                          [Define if program_invocation_short_name is defined])
-
diff --git a/package/util-linux/util-linux-003-fdisk-aarch64-support.patch b/package/util-linux/util-linux-003-fdisk-aarch64-support.patch
deleted file mode 100644
index 825e82c..0000000
--- a/package/util-linux/util-linux-003-fdisk-aarch64-support.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Add case for the aarch64 architecture
-
-Taken from https://bugs.launchpad.net/ubuntu/+source/util-linux/+bug/1061609
-
-Code written by Wookey.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/fdisk/fdiskbsdlabel.h
-===================================================================
---- a/fdisk/fdiskbsdlabel.h
-+++ b/fdisk/fdiskbsdlabel.h
-@@ -48,7 +48,8 @@
- 
- #if defined (i386) || defined (__sparc__) || defined (__arm__) || \
-     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
--    defined(__x86_64__) || defined (__avr32__) || defined(__cris__)
-+    defined(__x86_64__) || defined (__avr32__) || defined(__cris__) || \
-+    defined(__aarch64__)
- #define BSD_LABELSECTOR   1
- #define BSD_LABELOFFSET   0
- #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__) || defined (__hppa__)
diff --git a/package/util-linux/util-linux-003-program-invocation-short-name.patch b/package/util-linux/util-linux-003-program-invocation-short-name.patch
new file mode 100644
index 0000000..2d2fa5d
--- /dev/null
+++ b/package/util-linux/util-linux-003-program-invocation-short-name.patch
@@ -0,0 +1,18 @@
+uClibc build fix: program_invocation_short_name is defined in errno.h
+and not argp.h
+Update to util-linux-2.22.2 from a previous patch by Khem.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura util-linux-2.22.2.orig/configure.ac util-linux-2.22.2/configure.ac
+--- util-linux-2.22.2.orig/configure.ac	2013-03-07 15:16:18.912418476 -0300
++++ util-linux-2.22.2/configure.ac	2013-03-07 15:16:25.909640745 -0300
+@@ -372,7 +372,7 @@
+
+
+ AC_MSG_CHECKING(whether program_invocation_short_name is defined)
+-AC_TRY_COMPILE([#include <argp.h>],
++AC_TRY_COMPILE([#include <errno.h>],
+	       [program_invocation_short_name = "test";],
+	       AC_DEFINE(HAVE_PROGRAM_INVOCATION_SHORT_NAME, 1,
+			 [Define if program_invocation_short_name is defined])
diff --git a/package/util-linux/util-linux-004-xtensa-support.patch b/package/util-linux/util-linux-004-xtensa-support.patch
index ab294cc..abec5d9 100644
--- a/package/util-linux/util-linux-004-xtensa-support.patch
+++ b/package/util-linux/util-linux-004-xtensa-support.patch
@@ -1,11 +1,16 @@
---- util-linux-2.20.1/fdisk/fdiskbsdlabel.h.orig	2013-01-21 19:17:58.023049856 -0800
-+++ util-linux-2.20.1/fdisk/fdiskbsdlabel.h	2013-01-21 19:18:09.867050151 -0800
-@@ -49,7 +49,7 @@
- #if defined (i386) || defined (__sparc__) || defined (__arm__) || \
+Forward-port of xtensa support patch to util-linux-2.22.2 by ??
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura util-linux-2.22.2/fdisks/fdiskbsdlabel.h util-linux-2.22.2.xtensa/fdisks/fdiskbsdlabel.h
+--- util-linux-2.22.2/fdisks/fdiskbsdlabel.h	2012-12-12 17:04:47.898355058 -0300
++++ util-linux-2.22.2.xtensa/fdisks/fdiskbsdlabel.h	2013-03-07 18:17:32.292723061 -0300
+@@ -48,7 +48,7 @@
+
+ #if defined (__i386__) || defined (__sparc__) || defined (__arm__) || \
      defined (__mips__) || defined (__s390__) || defined (__sh__) || \
-     defined(__x86_64__) || defined (__avr32__) || defined(__cris__) || \
--    defined(__aarch64__)
-+    defined(__aarch64__) || defined(__xtensa__)
+-    defined (__aarch64__) || \
++    defined (__aarch64__) || defined (__xtensa__) || \
+     defined(__x86_64__) || defined (__avr32__) || defined(__cris__)
  #define BSD_LABELSECTOR   1
  #define BSD_LABELOFFSET   0
- #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__) || defined (__hppa__)
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 73ae174..5e88206 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -3,21 +3,21 @@
 # util-linux
 #
 #############################################################
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
-UTIL_LINUX_VERSION_MAJOR = 2.20
+
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION_MAJOR = 2.22
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.bz2
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
-UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, libblkid and libmount LGPLv2+, libuuid BSD-3c
-UTIL_LINUX_LICENSE_FILES = README.licensing COPYING licenses/COPYING.UCB libblkid/COPYING.libblkid libuuid/COPYING.libuuid
+UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, libblkid and libmount LGPLv2.1+, libuuid BSD-3c
+UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
 
 UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
 UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no
-
 UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown
 
 # We don't want the host-busybox dependency to be added automatically
@@ -40,42 +40,40 @@ UTIL_LINUX_DEPENDENCIES += gettext
 UTIL_LINUX_MAKE_OPT += LIBS=-lintl
 endif
 
-#############################################
-#
-# disable default utilities
-#
-UTIL_LINUX_CONF_OPT += \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNT),,--disable-mount) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),,--disable-fsck) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),,--disable-libmount) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),,--disable-libuuid) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_UUIDD),,--disable-uuidd) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),,--disable-libblkid) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),,--disable-agetty) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),,--disable-cramfs) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT),,--disable-switch_root) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),,--disable-pivot_root) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),,--disable-fallocate) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_UNSHARE),,--disable-unshare) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_RENAME),,--disable-rename) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS),,--disable-schedutils) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),,--disable-wall) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),,--disable-partx)
+# Used by cramfs utils
+UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 
-#############################################
-#
-# enable extra utilities
-#
+# Used by login-utils
+UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
+
+# Disable/Enable utilities
 UTIL_LINUX_CONF_OPT += \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_ARCH),--enable-arch) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_INIT),--enable-init) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_RESET),--enable-reset) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-login-utils) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write)
+	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_ARCH),--enable-arch,--disable-arch) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),--enable-cramfs,--disable-cramfs) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_DDATE),--enable-ddate,--disable-ddate) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-su --enable-sulogin,--disable-last --disable-login --disable-su --disable-sulogin) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNT),--enable-mount,--disable-mount) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),,--disable-partx) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),--enable-pivot_root,--disable-pivot_root) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw,--disable-raw) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_RENAME),--enable-rename,--disable-rename) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_RESET),--enable-reset,--disable-reset) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS),--enable-schedutils,--disable-schedutils) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT),--enable-switch_root,--disable-switch_root) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_UNSHARE),--enable-unshare,--disable-unshare) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_UTMPDUMP),--enable-utmpdump,--disable-utmpdump) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_UUIDD),--enable-uuidd,--disable-uuidd) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),--enable-wall,--disable-wall) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write)
 
 # In the host version of util-linux, we so far only require libuuid,
 # and none of the util-linux utilities, so we disable all of them.
@@ -87,6 +85,18 @@ HOST_UTIL_LINUX_CONF_OPT += \
 	--disable-fallocate --disable-unshare --disable-rename \
 	--disable-schedutils --disable-wall --disable-partx
 
+# Avoid building the tools if they are disabled since we can't install on
+# a per-directory basis.
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),)
+define UTIL_LINUX_DISABLE_TOOLS
+	$(SED) '/schedutils/d' -e '/text-utils/d' -e '/term-utils/d' \
+		-e '/login-utils/d' -e '/mount-deprecated/d' \
+		-e '/sys-utils/d' -e '/misc-utils/d' -e '/disk-utils/d' \
+		-e '/fdisks/d' $(@D)/Makefile.am
+endef
+UTIL_LINUX_PRE_PATCH_HOOKS += UTIL_LINUX_DISABLE_TOOLS
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
1.8.1.5
