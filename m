From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri,  7 Feb 2020 20:16:08 -0300
Subject: [Buildroot] [PATCH] package/util-linux: upgrade to version 2.35.1
Message-ID: <20200207231608.1745-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Drop patches already applied upstream and, consequently, AUTORECONF.

util-linux 2.35.1 Release Notes
===============================

build-sys:
   - add --disable-hwclock-gplv3  [Karel Zak]
chrt:
   - Use sched_setscheduler system call directly  [jonnyh64]
lib/randutils:
   - use explicit data types for bit ops  [Karel Zak]
libfdisk:
   - fix __copy_partition()  [Karel Zak]
   - make sure we use NULL after free  [Karel Zak]
libmount:
   - fix x- options use for non-root users  [Karel Zak]
po:
   - update uk.po (from translationproject.org)  [Yuri Chornoivan]
sfdisk:
   - make sure we do not overlap on --move  [Karel Zak]
   - remove broken step alignment for --move  [Karel Zak]

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 ...-make-sure-we-do-not-overlap-on-move.patch |  71 ---------
 ...emove-broken-step-alignment-for-move.patch |  62 --------
 ...-build-sys-add-disable-hwclock-gplv3.patch | 105 --------------
 ...fix-x-options-use-for-non-root-users.patch | 137 ------------------
 package/util-linux/util-linux.hash            |   2 +-
 package/util-linux/util-linux.mk              |   6 +-
 6 files changed, 3 insertions(+), 380 deletions(-)
 delete mode 100644 package/util-linux/0001-sfdisk-make-sure-we-do-not-overlap-on-move.patch
 delete mode 100644 package/util-linux/0002-sfdisk-remove-broken-step-alignment-for-move.patch
 delete mode 100644 package/util-linux/0006-build-sys-add-disable-hwclock-gplv3.patch
 delete mode 100644 package/util-linux/0007-libmount-fix-x-options-use-for-non-root-users.patch

diff --git a/package/util-linux/0001-sfdisk-make-sure-we-do-not-overlap-on-move.patch b/package/util-linux/0001-sfdisk-make-sure-we-do-not-overlap-on-move.patch
deleted file mode 100644
index 115e9425fd..0000000000
--- a/package/util-linux/0001-sfdisk-make-sure-we-do-not-overlap-on-move.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 2b26438c4bf90b7836111cc49d847ee89e49bfa8 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 23 Jan 2020 12:44:58 +0100
-Subject: [PATCH] sfdisk: make sure we do not overlap on --move
-
-The area we need to move does not have to be aligned to optimal I/O
-size (step size) -- we need to be sure we do not move data
-after/before the area.
-
-Addresses: https://github.com/karelzak/util-linux/issues/938
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- disk-utils/sfdisk.c | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
-index 0601c3bcf..8f2edb87f 100644
---- a/disk-utils/sfdisk.c
-+++ b/disk-utils/sfdisk.c
-@@ -374,7 +374,7 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
- 	int ok = 0, fd, backward = 0;
- 	fdisk_sector_t nsectors, from, to, step, i, prev;
- 	size_t io, ss, step_bytes, cc;
--	uintmax_t src, dst;
-+	uintmax_t src, dst, nbytes;
- 	int errsv, progress = 0;
- 	struct timeval prev_time;
- 	uint64_t bytes_per_sec = 0;
-@@ -409,6 +409,7 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
- 	from = fdisk_partition_get_start(orig_pa);
- 	to = fdisk_partition_get_start(pa);
- 
-+
- 	if ((to >= from && from + nsectors >= to) ||
- 	    (from >= to && to + nsectors >= from)) {
- 		/* source and target overlay, check if we need to copy
-@@ -434,6 +435,8 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
- 	while (nsectors % step)
- 		step--;
- 
-+	nbytes = nsectors * ss;
-+
- 	DBG(MISC, ul_debug(" step: %ju (%zu bytes)", (uintmax_t)step, step_bytes));
- 
- #if defined(POSIX_FADV_SEQUENTIAL) && defined(HAVE_POSIX_FADVISE)
-@@ -504,7 +507,7 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
- 	gettimeofday(&prev_time, NULL);
- 	prev = 0;
- 
--	for (cc = 1, i = 0; i < nsectors; i += step, cc++) {
-+	for (cc = 1, i = 0; i < nsectors && nbytes > 0; i += step, cc++) {
- 		ssize_t rc;
- 
- 		if (backward)
-@@ -512,6 +515,13 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
- 
- 		DBG(MISC, ul_debug("#%05zu: src=%ju dst=%ju", cc, src, dst));
- 
-+		if (nbytes < step_bytes) {
-+			DBG(MISC, ul_debug(" aligning step from %ju to %ju",
-+						step_bytes, nbytes));
-+			step_bytes = nbytes;
-+		}
-+		nbytes -= step_bytes;
-+
- 		if (!sf->noact) {
- 			/* read source */
- 			if (lseek(fd, src, SEEK_SET) == (off_t) -1)
--- 
-2.18.2
-
diff --git a/package/util-linux/0002-sfdisk-remove-broken-step-alignment-for-move.patch b/package/util-linux/0002-sfdisk-remove-broken-step-alignment-for-move.patch
deleted file mode 100644
index ea0e638e38..0000000000
--- a/package/util-linux/0002-sfdisk-remove-broken-step-alignment-for-move.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 9fabc6d5fae3da9106d41c40af6fbef6265ae11b Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 23 Jan 2020 15:07:32 +0100
-Subject: [PATCH] sfdisk: remove broken step alignment for --move
-
-* remove unnecessary and broken step alignment
-* improve reported information in move log
-* improve final progress bar update
-
-Addresses: https://github.com/karelzak/util-linux/issues/938
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- disk-utils/sfdisk.c | 13 ++++---------
- 1 file changed, 4 insertions(+), 9 deletions(-)
-
-diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
-index 8f2edb87f..bb6e1c6df 100644
---- a/disk-utils/sfdisk.c
-+++ b/disk-utils/sfdisk.c
-@@ -430,11 +430,6 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
- 		step_bytes = io;
- 
- 	step = step_bytes / ss;
--
--	/* align the step (note that nsectors does not have to be power of 2) */
--	while (nsectors % step)
--		step--;
--
- 	nbytes = nsectors * ss;
- 
- 	DBG(MISC, ul_debug(" step: %ju (%zu bytes)", (uintmax_t)step, step_bytes));
-@@ -485,15 +480,15 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
- 		fprintf(f, "# Disk: %s\n", devname);
- 		fprintf(f, "# Partition: %zu\n", partno + 1);
- 		fprintf(f, "# Operation: move data\n");
-+		fprintf(f, "# Sector size: %zu\n", ss);
- 		fprintf(f, "# Original start offset (sectors/bytes): %ju/%ju\n",
- 			(uintmax_t)from, (uintmax_t)from * ss);
- 		fprintf(f, "# New start offset (sectors/bytes): %ju/%ju\n",
- 			(uintmax_t)to, (uintmax_t)to * ss);
- 		fprintf(f, "# Area size (sectors/bytes): %ju/%ju\n",
- 			(uintmax_t)nsectors, (uintmax_t)nsectors * ss);
--		fprintf(f, "# Sector size: %zu\n", ss);
--		fprintf(f, "# Step size (in bytes): %zu\n", step_bytes);
--		fprintf(f, "# Steps: %ju\n", (uintmax_t)(nsectors / step));
-+				fprintf(f, "# Step size (sectors/bytes): %zu/%zu\n", step, step_bytes);
-+		fprintf(f, "# Steps: %ju\n", ((uintmax_t) nsectors / step) + 1);
- 		fprintf(f, "#\n");
- 		fprintf(f, "# <step>: <from> <to> (step offsets in bytes)\n");
- 	}
-@@ -584,7 +579,7 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
- 			fputc(' ', stdout);
- 		fflush(stdout);
- 		fputc('\r', stdout);
--		fprintf(stdout, _("Moved %ju from %ju sectors (%.3f%%)."),
-+		fprintf(stdout, _("Moved %ju from %ju sectors (%.0f%%)."),
- 				i, nsectors,
- 				100.0 / ((double) nsectors/(i+1)));
- 		fputc('\n', stdout);
--- 
-2.18.2
-
diff --git a/package/util-linux/0006-build-sys-add-disable-hwclock-gplv3.patch b/package/util-linux/0006-build-sys-add-disable-hwclock-gplv3.patch
deleted file mode 100644
index e8ed2186a5..0000000000
--- a/package/util-linux/0006-build-sys-add-disable-hwclock-gplv3.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From e8c21c894e69ba0c72ecf69e8297cb20ec5f9c1e Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 27 Jan 2020 16:17:10 +0100
-Subject: [PATCH] build-sys: add --disable-hwclock-gplv3
-
-The currently used date/time parser (for hwclock --set --date <date>)
-is gnulib based code with GPLv3.
-
-This patch allows to avoid this code and replace it with minimalistic
-date/time parser.
-
-Addresses: https://github.com/karelzak/util-linux/issues/891
-Reported-by: Carlos Santos <unixmania@gmail.com>
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- configure.ac            |  9 +++++++++
- sys-utils/Makemodule.am |  5 ++++-
- sys-utils/hwclock.c     | 17 ++++++++++++++---
- 3 files changed, 27 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 84b375543..960e2016d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1558,6 +1558,15 @@ AS_IF([test "x$build_hwclock_cmos" = xyes ], [
-     AC_DEFINE([USE_HWCLOCK_CMOS], [1], [Define to 1 if want to use CMOS clock.])
- ])
- 
-+AC_ARG_ENABLE([hwclock_gplv3],
-+  AS_HELP_STRING([--disable-hwclock-gplv3], [do not use datetime parsing GPLv3 code]),
-+  [], [enable_hwclock_gplv3=yes]
-+)
-+AM_CONDITIONAL([USE_HWCLOCK_GPLv3_DATETIME], [test "x$enable_hwclock_gplv3" = xyes])
-+AS_IF([test "x$enable_hwclock_gplv3" = xyes ], [
-+    AC_DEFINE([USE_HWCLOCK_GPLv3_DATETIME], [1], [use datetime parsing GPLv3 code to hwclock])
-+])
-+
- 
- UL_BUILD_INIT([mkfs], [yes])
- AM_CONDITIONAL([BUILD_MKFS], [test "x$build_mkfs" = xyes])
-diff --git a/sys-utils/Makemodule.am b/sys-utils/Makemodule.am
-index baf851e5b..07228f75f 100644
---- a/sys-utils/Makemodule.am
-+++ b/sys-utils/Makemodule.am
-@@ -451,8 +451,11 @@ dist_man_MANS += \
- PATHFILES += sys-utils/hwclock.8
- hwclock_SOURCES = \
- 	sys-utils/hwclock.c \
--	sys-utils/hwclock.h \
-+	sys-utils/hwclock.h
-+if USE_HWCLOCK_GPLv3_DATETIME
-+hwclock_SOURCES += \
- 	sys-utils/hwclock-parse-date.y
-+endif
- hwclock_LDADD = $(LDADD) libcommon.la -lm
- hwclock_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/sys-utils
- if USE_HWCLOCK_CMOS
-diff --git a/sys-utils/hwclock.c b/sys-utils/hwclock.c
-index 15fc19afd..e736da717 100644
---- a/sys-utils/hwclock.c
-+++ b/sys-utils/hwclock.c
-@@ -3,6 +3,7 @@
-  *
-  * Since 7a3000f7ba548cf7d74ac77cc63fe8de228a669e (v2.30) hwclock is linked
-  * with parse_date.y from gnullib. This gnulib code is distributed with GPLv3.
-+ * Use --disable-hwclock-gplv3 to exclude this code.
-  *
-  *
-  * clock.c was written by Charles Hedrick, hedrick at cs.rutgers.edu, Apr 1992
-@@ -1170,7 +1171,6 @@ int main(int argc, char **argv)
- 	};
- 	struct timeval startup_time;
- 	struct adjtime adjtime = { 0 };
--	struct timespec when = { 0 };
- 	/*
- 	 * The time we started up, in seconds into the epoch, including
- 	 * fractions.
-@@ -1398,11 +1398,22 @@ int main(int argc, char **argv)
- 
- 	if (ctl.set || ctl.predict) {
- 		if (!ctl.date_opt) {
--		warnx(_("--date is required for --set or --predict"));
--		exit(EXIT_FAILURE);
-+			warnx(_("--date is required for --set or --predict"));
-+			exit(EXIT_FAILURE);
- 		}
-+#ifdef USE_HWCLOCK_GPLv3_DATETIME
-+		/* date(1) compatible GPLv3 parser */
-+		struct timespec when = { 0 };
-+
- 		if (parse_date(&when, ctl.date_opt, NULL))
- 			set_time = when.tv_sec;
-+#else
-+		/* minimalistic GPLv2 based parser */
-+		usec_t usec;
-+
-+		if (parse_timestamp(ctl.date_opt, &usec) == 0)
-+			set_time = (time_t) (usec / 1000000);
-+#endif
- 		else {
- 			warnx(_("invalid date '%s'"), ctl.date_opt);
- 			exit(EXIT_FAILURE);
--- 
-2.18.2
-
diff --git a/package/util-linux/0007-libmount-fix-x-options-use-for-non-root-users.patch b/package/util-linux/0007-libmount-fix-x-options-use-for-non-root-users.patch
deleted file mode 100644
index 3572fc0908..0000000000
--- a/package/util-linux/0007-libmount-fix-x-options-use-for-non-root-users.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 88f04bf9e637b14ff5274e4c4981e43ab2c40c2b Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 28 Jan 2020 10:45:07 +0100
-Subject: [PATCH] libmount: fix x- options use for non-root users
-
-libmount returns EPERM for all X- and x- mount options for non-root
-users when evaluate X-mount.mkdir. It's bug, we need to be sensitive
-to only X-mount.mkdir and only if the target directory is missing.
-
-Addresses: https://github.com/karelzak/util-linux/issues/941
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- libmount/src/context.c | 41 ++++++++++++++++++++++-------------------
- sys-utils/mount.8      |  6 +++---
- 2 files changed, 25 insertions(+), 22 deletions(-)
-
-diff --git a/libmount/src/context.c b/libmount/src/context.c
-index 6c536cc15..91fe8e4bf 100644
---- a/libmount/src/context.c
-+++ b/libmount/src/context.c
-@@ -1855,49 +1855,48 @@ end:
- 	return rc;
- }
- 
--/* create a mountpoint if X-mount.mkdir[=<mode>] specified */
--static int mkdir_target(const char *tgt, struct libmnt_fs *fs)
-+static int is_mkdir_required(const char *tgt, struct libmnt_fs *fs, mode_t *mode, int *rc)
- {
- 	char *mstr = NULL;
- 	size_t mstr_sz = 0;
--	mode_t mode = 0;
- 	struct stat st;
--	int rc;
- 
- 	assert(tgt);
- 	assert(fs);
-+	assert(mode);
-+	assert(rc);
-+
-+	*mode = 0;
-+	*rc = 0;
- 
- 	if (mnt_optstr_get_option(fs->user_optstr, "X-mount.mkdir", &mstr, &mstr_sz) != 0 &&
- 	    mnt_optstr_get_option(fs->user_optstr, "x-mount.mkdir", &mstr, &mstr_sz) != 0)   	/* obsolete */
- 		return 0;
- 
--	DBG(CXT, ul_debug("mkdir %s (%s) wanted", tgt, mstr));
--
- 	if (mnt_stat_mountpoint(tgt, &st) == 0)
- 		return 0;
- 
-+	DBG(CXT, ul_debug("mkdir %s (%s) wanted", tgt, mstr));
-+
- 	if (mstr && mstr_sz) {
- 		char *end = NULL;
- 
- 		errno = 0;
--		mode = strtol(mstr, &end, 8);
-+		*mode = strtol(mstr, &end, 8);
- 
- 		if (errno || !end || mstr + mstr_sz != end) {
- 			DBG(CXT, ul_debug("failed to parse mkdir mode '%s'", mstr));
--			return -MNT_ERR_MOUNTOPT;
-+			*rc = -MNT_ERR_MOUNTOPT;
-+			return 0;
- 		}
- 	}
- 
--	if (!mode)
--		mode = S_IRWXU |			/* 0755 */
-+	if (!*mode)
-+		*mode = S_IRWXU |			/* 0755 */
- 		       S_IRGRP | S_IXGRP |
- 		       S_IROTH | S_IXOTH;
- 
--	rc = mkdir_p(tgt, mode);
--	if (rc)
--		DBG(CXT, ul_debug("mkdir %s failed: %m", tgt));
--
--	return rc;
-+	return 1;
- }
- 
- int mnt_context_prepare_target(struct libmnt_context *cxt)
-@@ -1905,6 +1904,7 @@ int mnt_context_prepare_target(struct libmnt_context *cxt)
- 	const char *tgt, *prefix;
- 	int rc = 0;
- 	struct libmnt_ns *ns_old;
-+	mode_t mode = 0;
- 
- 	assert(cxt);
- 	assert(cxt->fs);
-@@ -1946,12 +1946,15 @@ int mnt_context_prepare_target(struct libmnt_context *cxt)
- 	/* X-mount.mkdir target */
- 	if (cxt->action == MNT_ACT_MOUNT
- 	    && (cxt->user_mountflags & MNT_MS_XCOMMENT ||
--		cxt->user_mountflags & MNT_MS_XFSTABCOMM)) {
-+		cxt->user_mountflags & MNT_MS_XFSTABCOMM)
-+	    && is_mkdir_required(tgt, cxt->fs, &mode, &rc)) {
- 
- 		/* supported only for root or non-suid mount(8) */
--		if (!mnt_context_is_restricted(cxt))
--			rc = mkdir_target(tgt, cxt->fs);
--		else
-+		if (!mnt_context_is_restricted(cxt)) {
-+			rc = mkdir_p(tgt, mode);
-+			if (rc)
-+				DBG(CXT, ul_debug("mkdir %s failed: %m", tgt));
-+		} else
- 			rc = -EPERM;
- 	}
- 
-diff --git a/sys-utils/mount.8 b/sys-utils/mount.8
-index 3e57251ed..698b0f011 100644
---- a/sys-utils/mount.8
-+++ b/sys-utils/mount.8
-@@ -1306,14 +1306,14 @@ functionality have been extended to keep existing fstab configurations usable
- without a change.
- .TP
- .BR X-mount.mkdir [ = \fImode\fR ]
--Allow to make a target directory (mountpoint).  The optional argument
-+Allow to make a target directory (mountpoint) if it does not exit yet.
-+The optional argument
- .I mode
- specifies the filesystem access mode used for
- .BR mkdir (2)
- in octal notation.  The default mode is 0755.  This functionality is supported
- only for root users or when mount executed without suid permissions.  The option
--is also supported as x-mount.mkdir, this notation is deprecated for mount.mkdir
--since v2.30.
-+is also supported as x-mount.mkdir, this notation is deprecated since v2.30.
- 
- .SH "FILESYSTEM-SPECIFIC MOUNT OPTIONS"
- You should consult the respective man page for the filesystem first.
--- 
-2.18.2
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index a5a9099125..f9a3d1e867 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.35/sha256sums.asc
-sha256 b3081b560268c1ec3367e035234e91616fa7923a0afc2b1c80a2a6d8b9dfe2c9  util-linux-2.35.tar.xz
+sha256 d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1922c3597f1d7f9  util-linux-2.35.1.tar.xz
 # License files, locally calculated
 sha256 869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
 sha256 9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b867a670a4..549442232e 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -5,13 +5,11 @@
 ################################################################################
 
 UTIL_LINUX_VERSION_MAJOR = 2.35
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION_MINOR = 1
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).$(UTIL_LINUX_VERSION_MINOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-# 0006-build-sys-add-disable-hwclock-gplv3.patch
-UTIL_LINUX_AUTORECONF = YES
-
 # README.licensing claims that some files are GPL-2.0 only, but this is not
 # true. Some files are GPL-3.0+ but only in tests and optionally in hwclock
 # (but we disable that option). rfkill uses an ISC-style license.
-- 
2.18.2
