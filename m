From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 15:55:03 -0500
Subject: [Buildroot] [PATCH 1/1] util-linux: fix build failure with older
	systems
Message-ID: <1378414503-4841-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding patch util-linux-002-support-older-machines.patch to fix issues
when building for older systems.

Making all util-linux patches apply cleanly (fuzz fixes)

Fixes http://autobuild.buildroot.org/results/349/349d6ff938b093623618669a1acb390aa2a5fafe
Fixes http://autobuild.buildroot.org/results/57e/57e2c612c46b9e3b5f7bb213fcb3825b23fb7fc7

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 .../util-linux-001-sscanf-no-ms-as.patch           |   12 +-
 .../util-linux-002-support-older-machines.patch    |  208 ++++++++++++++++++++
 ...l-linux-003-program-invocation-short-name.patch |    6 +-
 3 files changed, 216 insertions(+), 10 deletions(-)
 create mode 100644 package/util-linux/util-linux-002-support-older-machines.patch

diff --git a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
index 5d08b9b..72a060e 100644
--- a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
+++ b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
@@ -4,20 +4,18 @@ See https://bugs.gentoo.org/show_bug.cgi?id=406303
 http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-apps/util-linux/files/util-linux-2.21.1-no-printf-alloc.patch?revision=1.2
 ported to util-linux-2.23.2
 
-diff -Nura a/configure.ac b/configure.ac
---- a/configure.ac	2012-12-13 08:16:02.973822890 -0300
-+++ b/configure.ac	2013-03-07 14:50:39.975512873 -0300
-@@ -733,7 +733,6 @@
+--- a/configure.ac	2013-07-30 03:39:26.188738061 -0500
++++ b/configure.ac	2013-09-05 15:31:11.460864363 -0500
+@@ -755,7 +755,6 @@
  UL_BUILD_INIT([libmount])
  UL_REQUIRES_LINUX([libmount])
  UL_REQUIRES_BUILD([libmount], [libblkid])
 -UL_REQUIRES_HAVE([libmount], [scanf_alloc_modifier], [scanf string alloc modifier])
  AM_CONDITIONAL(BUILD_LIBMOUNT, test "x$build_libmount" = xyes)
  AM_CONDITIONAL(BUILD_LIBMOUNT_TESTS, test "x$build_libmount" = xyes -a "x$enable_static" = xyes)
-
-diff -Nura a/libmount/src/tab_parse.c b/libmount/src/tab_parse.c
+ 
 --- a/libmount/src/tab_parse.c	2013-07-30 03:39:26.218738358 -0500
-+++ b/libmount/src/tab_parse.c	2013-09-04 11:22:26.332917445 -0500
++++ b/libmount/src/tab_parse.c	2013-09-05 15:31:11.460864363 -0500
 @@ -22,6 +22,10 @@
  #include "pathnames.h"
  #include "strutils.h"
diff --git a/package/util-linux/util-linux-002-support-older-machines.patch b/package/util-linux/util-linux-002-support-older-machines.patch
new file mode 100644
index 0000000..5736a98
--- /dev/null
+++ b/package/util-linux/util-linux-002-support-older-machines.patch
@@ -0,0 +1,208 @@
+This patch was adopted from 
+http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-core/util-linux/util-linux/util-linux-native.patch
+
+Support older hosts with latest util-linux-native
+
+mkostemp is not defined on older machines.  So we detect this and
+provide a define that uses mkstemp instead.
+
+O_CLOEXEC is not defined on older machines.  It is however defined
+in the 'c.h' header.  Fix up the users to include 'c.h'.
+
+fdisks/fdisksunlabel.c was modified to use qsort_r, however
+this is not defined on older hosts.  Revert:
+  commit c69bbca9c1f6645097bd20fe3a21f5a99a2a0698
+  fdisk: (sun): use ask API, remove global variable
+
+Upstream-Status: Inappropriate [other]
+Patches revert upstream changes in order to support older
+machines.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+--- a/configure.ac	2013-09-05 15:31:11.460864363 -0500
++++ b/configure.ac	2013-09-05 15:31:21.590981268 -0500
+@@ -323,6 +323,7 @@
+ 	llseek \
+ 	lseek64 \
+ 	mempcpy \
++	mkostemp \
+ 	nanosleep \
+ 	personality \
+ 	posix_fadvise \
+--- a/include/c.h	2013-07-30 03:39:26.200738180 -0500
++++ b/include/c.h	2013-09-05 15:31:21.590981268 -0500
+@@ -236,6 +236,13 @@
+ #endif
+ 
+ /*
++ * mkostemp replacement
++ */
++#ifndef HAVE_MKOSTEMP
++#define mkostemp(template, flags) mkstemp(template)
++#endif
++
++/*
+  * MAXHOSTNAMELEN replacement
+  */
+ static inline size_t get_hostname_max(void)
+--- a/lib/randutils.c	2013-06-13 02:46:10.408650519 -0500
++++ b/lib/randutils.c	2013-09-05 15:31:21.650099925 -0500
+@@ -16,6 +16,7 @@
+ #include <sys/syscall.h>
+ 
+ #include "randutils.h"
++#include "c.h"
+ 
+ #ifdef HAVE_TLS
+ #define THREAD_LOCAL static __thread
+--- a/lib/wholedisk.c	2013-06-13 02:46:10.411650545 -0500
++++ b/lib/wholedisk.c	2013-09-05 15:31:21.650099925 -0500
+@@ -10,6 +10,7 @@
+ 
+ #include "blkdev.h"
+ #include "wholedisk.h"
++#include "c.h"
+ 
+ int is_whole_disk_fd(int fd, const char *name)
+ {
+--- a/fdisks/fdisksunlabel.c	2013-07-30 03:39:26.197738150 -0500
++++ b/fdisks/fdisksunlabel.c	2013-09-05 15:31:21.650099925 -0500
+@@ -383,10 +383,10 @@
+ 	}
+ }
+ 
+-static int verify_sun_cmp(int *a, int *b, void *data)
+-{
+-    unsigned int *verify_sun_starts = (unsigned int *) data;
++static unsigned int *verify_sun_starts;
+ 
++static int verify_sun_cmp(int *a, int *b)
++{
+     if (*a == -1)
+ 	    return 1;
+     if (*b == -1)
+@@ -401,7 +401,6 @@
+     uint32_t starts[SUN_MAXPARTITIONS], lens[SUN_MAXPARTITIONS], start, stop;
+     uint32_t i,j,k,starto,endo;
+     int array[SUN_MAXPARTITIONS];
+-    unsigned int *verify_sun_starts;
+ 
+     assert(cxt);
+     assert(cxt->label);
+@@ -442,16 +441,14 @@
+ 	    }
+ 	}
+     }
+-
+     for (i = 0; i < SUN_MAXPARTITIONS; i++) {
+         if (lens[i])
+             array[i] = i;
+         else
+             array[i] = -1;
+     }
+-    qsort_r(array,ARRAY_SIZE(array),sizeof(array[0]),
+-	  (int (*)(const void *,const void *,void *)) verify_sun_cmp,
+-	  verify_sun_starts);
++    qsort(array,ARRAY_SIZE(array),sizeof(array[0]),
++	  (int (*)(const void *,const void *)) verify_sun_cmp);
+ 
+     if (array[0] == -1) {
+ 	fdisk_info(cxt, _("No partitions defined"));
+@@ -468,6 +465,7 @@
+     start = (starts[array[i]] + lens[array[i]]);
+     if (start < stop)
+         fdisk_warnx(cxt, _("Unused gap - sectors %d-%d"), start, stop);
++
+     return 0;
+ }
+ 
+@@ -746,18 +744,12 @@
+ 	}
+ }
+ 
+-
+ void fdisk_sun_set_alt_cyl(struct fdisk_context *cxt)
+ {
+ 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
+-	uintmax_t res;
+-	int rc = fdisk_ask_number(cxt, 0,			/* low */
+-			be16_to_cpu(sunlabel->acyl),		/* default */
+-			65535,					/* high */
+-			_("Number of alternate cylinders"),	/* query */
+-			&res);					/* result */
+-	if (!rc)
+-		sunlabel->acyl = cpu_to_be16(res);
++	sunlabel->acyl =
++		cpu_to_be16(read_int(cxt, 0, be16_to_cpu(sunlabel->acyl), 65535, 0,
++				_("Number of alternate cylinders")));
+ }
+ 
+ void fdisk_sun_set_ncyl(struct fdisk_context *cxt, int cyl)
+@@ -769,54 +761,33 @@
+ void fdisk_sun_set_xcyl(struct fdisk_context *cxt)
+ {
+ 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
+-	uintmax_t res;
+-	int rc = fdisk_ask_number(cxt, 0,			/* low */
+-			be16_to_cpu(sunlabel->apc),		/* default */
+-			cxt->geom.sectors,			/* high */
+-			_("Extra sectors per cylinder"),	/* query */
+-			&res);					/* result */
+-	if (!rc)
+-		sunlabel->apc = cpu_to_be16(res);
++	sunlabel->apc =
++		cpu_to_be16(read_int(cxt, 0, be16_to_cpu(sunlabel->apc), cxt->geom.sectors, 0,
++				_("Extra sectors per cylinder")));
+ }
+ 
+ void fdisk_sun_set_ilfact(struct fdisk_context *cxt)
+ {
+ 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
+-	uintmax_t res;
+-	int rc = fdisk_ask_number(cxt, 1,			/* low */
+-			be16_to_cpu(sunlabel->intrlv),		/* default */
+-			32,					/* high */
+-			_("Interleave factor"),	/* query */
+-			&res);					/* result */
+-	if (!rc)
+-		sunlabel->intrlv = cpu_to_be16(res);
++	sunlabel->intrlv =
++		cpu_to_be16(read_int(cxt, 1, be16_to_cpu(sunlabel->intrlv), 32, 0,
++				_("Interleave factor")));
+ }
+ 
+ void fdisk_sun_set_rspeed(struct fdisk_context *cxt)
+ {
+ 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
+-	uintmax_t res;
+-	int rc = fdisk_ask_number(cxt, 1,			/* low */
+-			be16_to_cpu(sunlabel->rpm),		/* default */
+-			USHRT_MAX,				/* high */
+-			_("Rotation speed (rpm)"),		/* query */
+-			&res);					/* result */
+-	if (!rc)
+-		sunlabel->rpm = cpu_to_be16(res);
+-
++	sunlabel->rpm =
++		 cpu_to_be16(read_int(cxt, 1, be16_to_cpu(sunlabel->rpm), 100000, 0,
++				_("Rotation speed (rpm)")));
+ }
+ 
+ void fdisk_sun_set_pcylcount(struct fdisk_context *cxt)
+ {
+ 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
+-	uintmax_t res;
+-	int rc = fdisk_ask_number(cxt, 0,			/* low */
+-			be16_to_cpu(sunlabel->pcyl),		/* default */
+-			USHRT_MAX,				/* high */
+-			_("Number of physical cylinders"),	/* query */
+-			&res);					/* result */
+-	if (!rc)
+-		sunlabel->pcyl = cpu_to_be16(res);
++	sunlabel->pcyl =
++		cpu_to_be16(read_int(cxt, 0, be16_to_cpu(sunlabel->pcyl), 65535, 0,
++				_("Number of physical cylinders")));
+ }
+ 
+ static int sun_write_disklabel(struct fdisk_context *cxt)
diff --git a/package/util-linux/util-linux-003-program-invocation-short-name.patch b/package/util-linux/util-linux-003-program-invocation-short-name.patch
index 5d04e35..95fea3f 100644
--- a/package/util-linux/util-linux-003-program-invocation-short-name.patch
+++ b/package/util-linux/util-linux-003-program-invocation-short-name.patch
@@ -1,6 +1,6 @@
---- a/configure.ac	2013-07-30 03:39:26.188738061 -0500
-+++ b/configure.ac	2013-08-27 16:20:09.882953093 -0500
-@@ -386,7 +386,7 @@
+--- a/configure.ac	2013-09-05 15:31:21.590981268 -0500
++++ b/configure.ac	2013-09-05 15:31:29.160981049 -0500
+@@ -387,7 +387,7 @@
  
  AC_MSG_CHECKING([whether program_invocation_short_name is defined])
  AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
-- 
1.7.1
