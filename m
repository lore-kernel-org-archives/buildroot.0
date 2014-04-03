From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:22:31 +0200
Subject: [Buildroot] [git commit] util-linux: bump version to 2.24.1
Message-ID: <20140403191843.1FDB19C516@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58442b5eefab37eb6b55b6f63f7a3995c042b7ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed "support older machines" patch as it has been fixed upstream,
fixed up other patches.

This removes some arch-dependencies in fdiskbsdlabel.h, fixing the
build for the ARC-architecture.

This fixes:
http://autobuild.buildroot.net/results/8863799d856ccab51ee8ffd499378574ef166aee/

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../util-linux-001-sscanf-no-ms-as.patch           |    8 +-
 ...-linux-002-program-invocation-short-name.patch} |    0
 .../util-linux-002-support-older-machines.patch    |  208 --------------------
 package/util-linux/util-linux.mk                   |    4 +-
 4 files changed, 6 insertions(+), 214 deletions(-)

diff --git a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
index c95b755..918e846 100644
--- a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
+++ b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
@@ -2,17 +2,17 @@ Fix libmount build under uClibc
 
 See https://bugs.gentoo.org/show_bug.cgi?id=406303
 http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-apps/util-linux/files/util-linux-2.21.1-no-printf-alloc.patch?revision=1.2
-ported to util-linux-2.23.2
+ported to util-linux-2.24
 
 --- a/configure.ac	2013-07-30 03:39:26.188738061 -0500
 +++ b/configure.ac	2013-09-05 15:31:11.460864363 -0500
-@@ -755,7 +755,6 @@
+@@ -769,7 +769,6 @@ AC_ARG_ENABLE([libmount],
  UL_BUILD_INIT([libmount])
  UL_REQUIRES_LINUX([libmount])
  UL_REQUIRES_BUILD([libmount], [libblkid])
 -UL_REQUIRES_HAVE([libmount], [scanf_alloc_modifier], [scanf string alloc modifier])
- AM_CONDITIONAL(BUILD_LIBMOUNT, test "x$build_libmount" = xyes)
- AM_CONDITIONAL(BUILD_LIBMOUNT_TESTS, test "x$build_libmount" = xyes -a "x$enable_static" = xyes)
+ AM_CONDITIONAL([BUILD_LIBMOUNT], [test "x$build_libmount" = xyes])
+ AM_CONDITIONAL([BUILD_LIBMOUNT_TESTS], [test "x$build_libmount" = xyes -a "x$enable_static" = xyes])
  
 --- a/libmount/src/tab_parse.c	2013-07-30 03:39:26.218738358 -0500
 +++ b/libmount/src/tab_parse.c	2013-09-05 15:31:11.460864363 -0500
diff --git a/package/util-linux/util-linux-003-program-invocation-short-name.patch b/package/util-linux/util-linux-002-program-invocation-short-name.patch
similarity index 100%
rename from package/util-linux/util-linux-003-program-invocation-short-name.patch
rename to package/util-linux/util-linux-002-program-invocation-short-name.patch
diff --git a/package/util-linux/util-linux-002-support-older-machines.patch b/package/util-linux/util-linux-002-support-older-machines.patch
deleted file mode 100644
index 5736a98..0000000
--- a/package/util-linux/util-linux-002-support-older-machines.patch
+++ /dev/null
@@ -1,208 +0,0 @@
-This patch was adopted from 
-http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-core/util-linux/util-linux/util-linux-native.patch
-
-Support older hosts with latest util-linux-native
-
-mkostemp is not defined on older machines.  So we detect this and
-provide a define that uses mkstemp instead.
-
-O_CLOEXEC is not defined on older machines.  It is however defined
-in the 'c.h' header.  Fix up the users to include 'c.h'.
-
-fdisks/fdisksunlabel.c was modified to use qsort_r, however
-this is not defined on older hosts.  Revert:
-  commit c69bbca9c1f6645097bd20fe3a21f5a99a2a0698
-  fdisk: (sun): use ask API, remove global variable
-
-Upstream-Status: Inappropriate [other]
-Patches revert upstream changes in order to support older
-machines.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
---- a/configure.ac	2013-09-05 15:31:11.460864363 -0500
-+++ b/configure.ac	2013-09-05 15:31:21.590981268 -0500
-@@ -323,6 +323,7 @@
- 	llseek \
- 	lseek64 \
- 	mempcpy \
-+	mkostemp \
- 	nanosleep \
- 	personality \
- 	posix_fadvise \
---- a/include/c.h	2013-07-30 03:39:26.200738180 -0500
-+++ b/include/c.h	2013-09-05 15:31:21.590981268 -0500
-@@ -236,6 +236,13 @@
- #endif
- 
- /*
-+ * mkostemp replacement
-+ */
-+#ifndef HAVE_MKOSTEMP
-+#define mkostemp(template, flags) mkstemp(template)
-+#endif
-+
-+/*
-  * MAXHOSTNAMELEN replacement
-  */
- static inline size_t get_hostname_max(void)
---- a/lib/randutils.c	2013-06-13 02:46:10.408650519 -0500
-+++ b/lib/randutils.c	2013-09-05 15:31:21.650099925 -0500
-@@ -16,6 +16,7 @@
- #include <sys/syscall.h>
- 
- #include "randutils.h"
-+#include "c.h"
- 
- #ifdef HAVE_TLS
- #define THREAD_LOCAL static __thread
---- a/lib/wholedisk.c	2013-06-13 02:46:10.411650545 -0500
-+++ b/lib/wholedisk.c	2013-09-05 15:31:21.650099925 -0500
-@@ -10,6 +10,7 @@
- 
- #include "blkdev.h"
- #include "wholedisk.h"
-+#include "c.h"
- 
- int is_whole_disk_fd(int fd, const char *name)
- {
---- a/fdisks/fdisksunlabel.c	2013-07-30 03:39:26.197738150 -0500
-+++ b/fdisks/fdisksunlabel.c	2013-09-05 15:31:21.650099925 -0500
-@@ -383,10 +383,10 @@
- 	}
- }
- 
--static int verify_sun_cmp(int *a, int *b, void *data)
--{
--    unsigned int *verify_sun_starts = (unsigned int *) data;
-+static unsigned int *verify_sun_starts;
- 
-+static int verify_sun_cmp(int *a, int *b)
-+{
-     if (*a == -1)
- 	    return 1;
-     if (*b == -1)
-@@ -401,7 +401,6 @@
-     uint32_t starts[SUN_MAXPARTITIONS], lens[SUN_MAXPARTITIONS], start, stop;
-     uint32_t i,j,k,starto,endo;
-     int array[SUN_MAXPARTITIONS];
--    unsigned int *verify_sun_starts;
- 
-     assert(cxt);
-     assert(cxt->label);
-@@ -442,16 +441,14 @@
- 	    }
- 	}
-     }
--
-     for (i = 0; i < SUN_MAXPARTITIONS; i++) {
-         if (lens[i])
-             array[i] = i;
-         else
-             array[i] = -1;
-     }
--    qsort_r(array,ARRAY_SIZE(array),sizeof(array[0]),
--	  (int (*)(const void *,const void *,void *)) verify_sun_cmp,
--	  verify_sun_starts);
-+    qsort(array,ARRAY_SIZE(array),sizeof(array[0]),
-+	  (int (*)(const void *,const void *)) verify_sun_cmp);
- 
-     if (array[0] == -1) {
- 	fdisk_info(cxt, _("No partitions defined"));
-@@ -468,6 +465,7 @@
-     start = (starts[array[i]] + lens[array[i]]);
-     if (start < stop)
-         fdisk_warnx(cxt, _("Unused gap - sectors %d-%d"), start, stop);
-+
-     return 0;
- }
- 
-@@ -746,18 +744,12 @@
- 	}
- }
- 
--
- void fdisk_sun_set_alt_cyl(struct fdisk_context *cxt)
- {
- 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
--	uintmax_t res;
--	int rc = fdisk_ask_number(cxt, 0,			/* low */
--			be16_to_cpu(sunlabel->acyl),		/* default */
--			65535,					/* high */
--			_("Number of alternate cylinders"),	/* query */
--			&res);					/* result */
--	if (!rc)
--		sunlabel->acyl = cpu_to_be16(res);
-+	sunlabel->acyl =
-+		cpu_to_be16(read_int(cxt, 0, be16_to_cpu(sunlabel->acyl), 65535, 0,
-+				_("Number of alternate cylinders")));
- }
- 
- void fdisk_sun_set_ncyl(struct fdisk_context *cxt, int cyl)
-@@ -769,54 +761,33 @@
- void fdisk_sun_set_xcyl(struct fdisk_context *cxt)
- {
- 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
--	uintmax_t res;
--	int rc = fdisk_ask_number(cxt, 0,			/* low */
--			be16_to_cpu(sunlabel->apc),		/* default */
--			cxt->geom.sectors,			/* high */
--			_("Extra sectors per cylinder"),	/* query */
--			&res);					/* result */
--	if (!rc)
--		sunlabel->apc = cpu_to_be16(res);
-+	sunlabel->apc =
-+		cpu_to_be16(read_int(cxt, 0, be16_to_cpu(sunlabel->apc), cxt->geom.sectors, 0,
-+				_("Extra sectors per cylinder")));
- }
- 
- void fdisk_sun_set_ilfact(struct fdisk_context *cxt)
- {
- 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
--	uintmax_t res;
--	int rc = fdisk_ask_number(cxt, 1,			/* low */
--			be16_to_cpu(sunlabel->intrlv),		/* default */
--			32,					/* high */
--			_("Interleave factor"),	/* query */
--			&res);					/* result */
--	if (!rc)
--		sunlabel->intrlv = cpu_to_be16(res);
-+	sunlabel->intrlv =
-+		cpu_to_be16(read_int(cxt, 1, be16_to_cpu(sunlabel->intrlv), 32, 0,
-+				_("Interleave factor")));
- }
- 
- void fdisk_sun_set_rspeed(struct fdisk_context *cxt)
- {
- 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
--	uintmax_t res;
--	int rc = fdisk_ask_number(cxt, 1,			/* low */
--			be16_to_cpu(sunlabel->rpm),		/* default */
--			USHRT_MAX,				/* high */
--			_("Rotation speed (rpm)"),		/* query */
--			&res);					/* result */
--	if (!rc)
--		sunlabel->rpm = cpu_to_be16(res);
--
-+	sunlabel->rpm =
-+		 cpu_to_be16(read_int(cxt, 1, be16_to_cpu(sunlabel->rpm), 100000, 0,
-+				_("Rotation speed (rpm)")));
- }
- 
- void fdisk_sun_set_pcylcount(struct fdisk_context *cxt)
- {
- 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
--	uintmax_t res;
--	int rc = fdisk_ask_number(cxt, 0,			/* low */
--			be16_to_cpu(sunlabel->pcyl),		/* default */
--			USHRT_MAX,				/* high */
--			_("Number of physical cylinders"),	/* query */
--			&res);					/* result */
--	if (!rc)
--		sunlabel->pcyl = cpu_to_be16(res);
-+	sunlabel->pcyl =
-+		cpu_to_be16(read_int(cxt, 0, be16_to_cpu(sunlabel->pcyl), 65535, 0,
-+				_("Number of physical cylinders")));
- }
- 
- static int sun_write_disklabel(struct fdisk_context *cxt)
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 20b3d35..d661447 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
-UTIL_LINUX_VERSION_MAJOR = 2.23
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
+UTIL_LINUX_VERSION_MAJOR = 2.24
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
