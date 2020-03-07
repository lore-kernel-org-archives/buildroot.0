From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 21:22:43 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/util-linux: bump
 to version 2.35
Message-ID: <20200307202451.4AD408FBF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f54798547acf976f0ef5400ed90ab651e1080b2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

This version brings bug fixes, enhancements and a new script utility,
scriptlive. For detailed information see the release notes:

  http://www.kernel.org/pub/linux/utils/util-linux/v2.35/v2.35-ReleaseNotes

Pull some fixed applied after the release.

Disable the use of code under GPLv3 included in hwclock since v2.30. The
subject was discussed upstream[1] and it was decided that hwclock will
be made GPLv2-only again in v2.36, so do it in advance in Buildroot.

Meanwhile, be warned that all OS images selecting hwclock built with
Buildroot since commit 74235a6854 (util-linux: bump to version 2.30)
contain code under GPLv3, which imposes some technical difficulties to
include in embedded systems. For more information see GPLv3, Section 6,
"Conveying Non-Source Forms", and the definitions of User Product and
Installation Information[2].

1. https://lore.kernel.org/util-linux/20200127202152.4jh2w4chch37wgee at ws.net.home/T/#t
2. https://www.gnu.org/licenses/gpl-3.0.html

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4f3af906fb66d540e6cf60712896175f8854a862)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Allow-explicit-wipefs-enable-disablement.patch |  33 ----
 ...fdisk-make-sure-we-do-not-overlap-on-move.patch |  71 ++++++++
 ...isk-remove-broken-step-alignment-for-move.patch |  62 +++++++
 .../0003-blkdiscard-use-O_EXCL-add-force.patch     |  85 +++++++++
 ...sk-add-fdisk_set_disklabel_id_from_string.patch | 194 +++++++++++++++++++++
 ...sfdisk-add-disk-id-to-change-disk-UUID-ID.patch | 138 +++++++++++++++
 .../0006-build-sys-add-disable-hwclock-gplv3.patch | 105 +++++++++++
 ...ount-fix-x-options-use-for-non-root-users.patch | 137 +++++++++++++++
 package/util-linux/Config.in                       |   6 +-
 package/util-linux/util-linux.hash                 |   6 +-
 package/util-linux/util-linux.mk                   |  15 +-
 11 files changed, 808 insertions(+), 44 deletions(-)

diff --git a/package/util-linux/0001-Allow-explicit-wipefs-enable-disablement.patch b/package/util-linux/0001-Allow-explicit-wipefs-enable-disablement.patch
deleted file mode 100644
index 85021e2978..0000000000
--- a/package/util-linux/0001-Allow-explicit-wipefs-enable-disablement.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a76cd5f6abace269b60ef6f1b95526a2d09fd331 Mon Sep 17 00:00:00 2001
-From: Sam Voss <sam.voss@gmail.com>
-Date: Mon, 14 Oct 2019 21:19:16 -0500
-Subject: [PATCH] wipefs: Allow explicitly enable/disablement
-
-Currently if `--disable-all-packages` is set, there is no configure
-option for re-enabling `wipefs`.
-
-As the current default for `wipefs` is "enabled", add `--disable-` flag
-to maintain backward compatibility.
-
-Signed-off-by: Sam Voss <sam.voss@gmail.com>
----
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index fc8a9507f..f70f8d1ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1286,7 +1286,11 @@ UL_BUILD_INIT([findfs], [check])
- UL_REQUIRES_BUILD([findfs], [libblkid])
- AM_CONDITIONAL([BUILD_FINDFS], [test "x$build_findfs" = xyes])
- 
--UL_BUILD_INIT([wipefs], [check])
-+AC_ARG_ENABLE([wipefs],
-+  AS_HELP_STRING([--disable-wipefs], [do not build wipefs]),
-+  [], [UL_DEFAULT_ENABLE([wipefs], [check])]
-+)
-+UL_BUILD_INIT([wipefs])
- UL_REQUIRES_BUILD([wipefs], [libblkid])
- UL_REQUIRES_BUILD([wipefs], [libsmartcols])
- AM_CONDITIONAL([BUILD_WIPEFS], [test "x$build_wipefs" = xyes])
diff --git a/package/util-linux/0001-sfdisk-make-sure-we-do-not-overlap-on-move.patch b/package/util-linux/0001-sfdisk-make-sure-we-do-not-overlap-on-move.patch
new file mode 100644
index 0000000000..115e9425fd
--- /dev/null
+++ b/package/util-linux/0001-sfdisk-make-sure-we-do-not-overlap-on-move.patch
@@ -0,0 +1,71 @@
+From 2b26438c4bf90b7836111cc49d847ee89e49bfa8 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 23 Jan 2020 12:44:58 +0100
+Subject: [PATCH] sfdisk: make sure we do not overlap on --move
+
+The area we need to move does not have to be aligned to optimal I/O
+size (step size) -- we need to be sure we do not move data
+after/before the area.
+
+Addresses: https://github.com/karelzak/util-linux/issues/938
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ disk-utils/sfdisk.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
+index 0601c3bcf..8f2edb87f 100644
+--- a/disk-utils/sfdisk.c
++++ b/disk-utils/sfdisk.c
+@@ -374,7 +374,7 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
+ 	int ok = 0, fd, backward = 0;
+ 	fdisk_sector_t nsectors, from, to, step, i, prev;
+ 	size_t io, ss, step_bytes, cc;
+-	uintmax_t src, dst;
++	uintmax_t src, dst, nbytes;
+ 	int errsv, progress = 0;
+ 	struct timeval prev_time;
+ 	uint64_t bytes_per_sec = 0;
+@@ -409,6 +409,7 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
+ 	from = fdisk_partition_get_start(orig_pa);
+ 	to = fdisk_partition_get_start(pa);
+ 
++
+ 	if ((to >= from && from + nsectors >= to) ||
+ 	    (from >= to && to + nsectors >= from)) {
+ 		/* source and target overlay, check if we need to copy
+@@ -434,6 +435,8 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
+ 	while (nsectors % step)
+ 		step--;
+ 
++	nbytes = nsectors * ss;
++
+ 	DBG(MISC, ul_debug(" step: %ju (%zu bytes)", (uintmax_t)step, step_bytes));
+ 
+ #if defined(POSIX_FADV_SEQUENTIAL) && defined(HAVE_POSIX_FADVISE)
+@@ -504,7 +507,7 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
+ 	gettimeofday(&prev_time, NULL);
+ 	prev = 0;
+ 
+-	for (cc = 1, i = 0; i < nsectors; i += step, cc++) {
++	for (cc = 1, i = 0; i < nsectors && nbytes > 0; i += step, cc++) {
+ 		ssize_t rc;
+ 
+ 		if (backward)
+@@ -512,6 +515,13 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
+ 
+ 		DBG(MISC, ul_debug("#%05zu: src=%ju dst=%ju", cc, src, dst));
+ 
++		if (nbytes < step_bytes) {
++			DBG(MISC, ul_debug(" aligning step from %ju to %ju",
++						step_bytes, nbytes));
++			step_bytes = nbytes;
++		}
++		nbytes -= step_bytes;
++
+ 		if (!sf->noact) {
+ 			/* read source */
+ 			if (lseek(fd, src, SEEK_SET) == (off_t) -1)
+-- 
+2.18.2
+
diff --git a/package/util-linux/0002-sfdisk-remove-broken-step-alignment-for-move.patch b/package/util-linux/0002-sfdisk-remove-broken-step-alignment-for-move.patch
new file mode 100644
index 0000000000..ea0e638e38
--- /dev/null
+++ b/package/util-linux/0002-sfdisk-remove-broken-step-alignment-for-move.patch
@@ -0,0 +1,62 @@
+From 9fabc6d5fae3da9106d41c40af6fbef6265ae11b Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 23 Jan 2020 15:07:32 +0100
+Subject: [PATCH] sfdisk: remove broken step alignment for --move
+
+* remove unnecessary and broken step alignment
+* improve reported information in move log
+* improve final progress bar update
+
+Addresses: https://github.com/karelzak/util-linux/issues/938
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ disk-utils/sfdisk.c | 13 ++++---------
+ 1 file changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
+index 8f2edb87f..bb6e1c6df 100644
+--- a/disk-utils/sfdisk.c
++++ b/disk-utils/sfdisk.c
+@@ -430,11 +430,6 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
+ 		step_bytes = io;
+ 
+ 	step = step_bytes / ss;
+-
+-	/* align the step (note that nsectors does not have to be power of 2) */
+-	while (nsectors % step)
+-		step--;
+-
+ 	nbytes = nsectors * ss;
+ 
+ 	DBG(MISC, ul_debug(" step: %ju (%zu bytes)", (uintmax_t)step, step_bytes));
+@@ -485,15 +480,15 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
+ 		fprintf(f, "# Disk: %s\n", devname);
+ 		fprintf(f, "# Partition: %zu\n", partno + 1);
+ 		fprintf(f, "# Operation: move data\n");
++		fprintf(f, "# Sector size: %zu\n", ss);
+ 		fprintf(f, "# Original start offset (sectors/bytes): %ju/%ju\n",
+ 			(uintmax_t)from, (uintmax_t)from * ss);
+ 		fprintf(f, "# New start offset (sectors/bytes): %ju/%ju\n",
+ 			(uintmax_t)to, (uintmax_t)to * ss);
+ 		fprintf(f, "# Area size (sectors/bytes): %ju/%ju\n",
+ 			(uintmax_t)nsectors, (uintmax_t)nsectors * ss);
+-		fprintf(f, "# Sector size: %zu\n", ss);
+-		fprintf(f, "# Step size (in bytes): %zu\n", step_bytes);
+-		fprintf(f, "# Steps: %ju\n", (uintmax_t)(nsectors / step));
++				fprintf(f, "# Step size (sectors/bytes): %zu/%zu\n", step, step_bytes);
++		fprintf(f, "# Steps: %ju\n", ((uintmax_t) nsectors / step) + 1);
+ 		fprintf(f, "#\n");
+ 		fprintf(f, "# <step>: <from> <to> (step offsets in bytes)\n");
+ 	}
+@@ -584,7 +579,7 @@ static int move_partition_data(struct sfdisk *sf, size_t partno, struct fdisk_pa
+ 			fputc(' ', stdout);
+ 		fflush(stdout);
+ 		fputc('\r', stdout);
+-		fprintf(stdout, _("Moved %ju from %ju sectors (%.3f%%)."),
++		fprintf(stdout, _("Moved %ju from %ju sectors (%.0f%%)."),
+ 				i, nsectors,
+ 				100.0 / ((double) nsectors/(i+1)));
+ 		fputc('\n', stdout);
+-- 
+2.18.2
+
diff --git a/package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch b/package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch
new file mode 100644
index 0000000000..191608e080
--- /dev/null
+++ b/package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch
@@ -0,0 +1,85 @@
+From 34fed3ff1740aded9c2aae6b5d67a4eb696f738e Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 9 Jan 2020 11:03:51 +0100
+Subject: [PATCH] blkdiscard: use O_EXCL, add --force
+
+Let's make it more robust and safe. O_EXCL is an elegant way how to avoid
+unwanted discard on mounted device.
+
+Addresses: https://github.com/karelzak/util-linux/issues/915
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ sys-utils/blkdiscard.8 |  5 +++++
+ sys-utils/blkdiscard.c | 11 ++++++++---
+ 2 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/sys-utils/blkdiscard.8 b/sys-utils/blkdiscard.8
+index 1f3a32be9..98c6f36a9 100644
+--- a/sys-utils/blkdiscard.8
++++ b/sys-utils/blkdiscard.8
+@@ -36,6 +36,11 @@ MiB (=1024*1024), and so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is
+ optional, e.g., "K" has the same meaning as "KiB") or the suffixes
+ KB (=1000), MB (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.
+ .TP
++.BR \-f , " \-\-force"
++Disable all checking.  Since v2.36 the block device is open in exclusive mode (O_EXCL)
++by default to avoid collision with mounted filesystem or another kernel subsystem.
++The force option disables the exclusive access mode.
++.TP
+ .BR \-o , " \-\-offset \fIoffset"
+ Byte offset into the device from which to start discarding.  The provided value
+ will be aligned to the device sector size.  The default value is zero.
+diff --git a/sys-utils/blkdiscard.c b/sys-utils/blkdiscard.c
+index f9ba5e468..589974f9c 100644
+--- a/sys-utils/blkdiscard.c
++++ b/sys-utils/blkdiscard.c
+@@ -88,6 +88,7 @@ static void __attribute__((__noreturn__)) usage(void)
+ 	fputs(_("Discard the content of sectors on a device.\n"), out);
+ 
+ 	fputs(USAGE_OPTIONS, out);
++	fputs(_(" -f, --force         disable all checking\n"), out);
+ 	fputs(_(" -o, --offset <num>  offset in bytes to discard from\n"), out);
+ 	fputs(_(" -l, --length <num>  length of bytes to discard from the offset\n"), out);
+ 	fputs(_(" -p, --step <num>    size of the discard iterations within the offset\n"), out);
+@@ -106,7 +107,7 @@ static void __attribute__((__noreturn__)) usage(void)
+ int main(int argc, char **argv)
+ {
+ 	char *path;
+-	int c, fd, verbose = 0, secsize;
++	int c, fd, verbose = 0, secsize, force = 0;
+ 	uint64_t end, blksize, step, range[2], stats[2];
+ 	struct stat sb;
+ 	struct timeval now, last;
+@@ -116,6 +117,7 @@ int main(int argc, char **argv)
+ 	    { "help",      no_argument,       NULL, 'h' },
+ 	    { "version",   no_argument,       NULL, 'V' },
+ 	    { "offset",    required_argument, NULL, 'o' },
++	    { "force",     no_argument,       NULL, 'f' },
+ 	    { "length",    required_argument, NULL, 'l' },
+ 	    { "step",      required_argument, NULL, 'p' },
+ 	    { "secure",    no_argument,       NULL, 's' },
+@@ -133,8 +135,11 @@ int main(int argc, char **argv)
+ 	range[1] = ULLONG_MAX;
+ 	step = 0;
+ 
+-	while ((c = getopt_long(argc, argv, "hVsvo:l:p:z", longopts, NULL)) != -1) {
++	while ((c = getopt_long(argc, argv, "hfVsvo:l:p:z", longopts, NULL)) != -1) {
+ 		switch(c) {
++		case 'f':
++			force = 1;
++			break;
+ 		case 'l':
+ 			range[1] = strtosize_or_err(optarg,
+ 					_("failed to parse length"));
+@@ -176,7 +181,7 @@ int main(int argc, char **argv)
+ 		errtryhelp(EXIT_FAILURE);
+ 	}
+ 
+-	fd = open(path, O_WRONLY);
++	fd = open(path, O_WRONLY | (force ? 0 : O_EXCL));
+ 	if (fd < 0)
+ 		err(EXIT_FAILURE, _("cannot open %s"), path);
+ 
+-- 
+2.18.2
+
diff --git a/package/util-linux/0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch b/package/util-linux/0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
new file mode 100644
index 0000000000..40854e4b8d
--- /dev/null
+++ b/package/util-linux/0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
@@ -0,0 +1,194 @@
+From e5f31446166de7212213c62a019945afb8e197ef Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 14 Jan 2020 11:43:24 +0100
+Subject: [PATCH] libfdisk: add fdisk_set_disklabel_id_from_string()
+
+We have fdisk_set_disklabel_id(), but it's old ask-API based function.
+It's not comfortable if you want to avoid dialog or template.
+
+Addresses: https://github.com/karelzak/util-linux/issues/916
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ libfdisk/docs/libfdisk-sections.txt |  1 +
+ libfdisk/src/dos.c                  | 29 ++++++++++++++++++-----------
+ libfdisk/src/fdiskP.h               |  2 +-
+ libfdisk/src/gpt.c                  | 18 ++++++++++--------
+ libfdisk/src/label.c                | 19 ++++++++++++++++++-
+ libfdisk/src/libfdisk.h.in          |  1 +
+ libfdisk/src/libfdisk.sym           |  3 +++
+ 7 files changed, 52 insertions(+), 21 deletions(-)
+
+diff --git a/libfdisk/docs/libfdisk-sections.txt b/libfdisk/docs/libfdisk-sections.txt
+index f148da527..6675c1100 100644
+--- a/libfdisk/docs/libfdisk-sections.txt
++++ b/libfdisk/docs/libfdisk-sections.txt
+@@ -81,6 +81,7 @@ fdisk_list_disklabel
+ fdisk_locate_disklabel
+ fdisk_reorder_partitions
+ fdisk_set_disklabel_id
++fdisk_set_disklabel_id_from_string
+ fdisk_set_partition_type
+ fdisk_toggle_partition_flag
+ fdisk_verify_disklabel
+diff --git a/libfdisk/src/dos.c b/libfdisk/src/dos.c
+index 53713ec5f..98314dfa6 100644
+--- a/libfdisk/src/dos.c
++++ b/libfdisk/src/dos.c
+@@ -707,12 +707,12 @@ static int dos_create_disklabel(struct fdisk_context *cxt)
+ 	return 0;
+ }
+ 
+-static int dos_set_disklabel_id(struct fdisk_context *cxt)
++static int dos_set_disklabel_id(struct fdisk_context *cxt, const char *str)
+ {
+-	char *end = NULL, *str = NULL;
++	char *str0 = str;
+ 	unsigned int id, old;
+ 	struct fdisk_dos_label *l;
+-	int rc;
++	int rc = 0;
+ 
+ 	assert(cxt);
+ 	assert(cxt->label);
+@@ -722,18 +722,25 @@ static int dos_set_disklabel_id(struct fdisk_context *cxt)
+ 
+ 	l = self_label(cxt);
+ 	old = mbr_get_id(cxt->firstsector);
+-	rc = fdisk_ask_string(cxt,
++
++	if (!str)
++		rc = fdisk_ask_string(cxt,
+ 			_("Enter the new disk identifier"), &str);
+-	if (rc)
+-		return rc;
++	if (!rc) {
++		char *end = NULL;
+ 
+-	errno = 0;
+-	id = strtoul(str, &end, 0);
+-	if (errno || str == end || (end && *end)) {
+-		fdisk_warnx(cxt, _("Incorrect value."));
+-		return -EINVAL;
++		errno = 0;
++		id = strtoul(str, &end, 0);
++		if (errno || str == end || (end && *end)) {
++			fdisk_warnx(cxt, _("Incorrect value."));
++			rc = -EINVAL;
++		}
+ 	}
+ 
++	if (!str0)
++		free(str);
++	if (rc)
++		return -EINVAL;
+ 
+ 	mbr_set_id(cxt->firstsector, id);
+ 	l->non_pt_changed = 1;
+diff --git a/libfdisk/src/fdiskP.h b/libfdisk/src/fdiskP.h
+index fefebae2a..0487466e3 100644
+--- a/libfdisk/src/fdiskP.h
++++ b/libfdisk/src/fdiskP.h
+@@ -220,7 +220,7 @@ struct fdisk_label_operations {
+ 	/* get details from label */
+ 	int (*get_item)(struct fdisk_context *cxt, struct fdisk_labelitem *item);
+ 	/* set disk label ID */
+-	int (*set_id)(struct fdisk_context *cxt);
++	int (*set_id)(struct fdisk_context *cxt, const char *str);
+ 
+ 
+ 	/* new partition */
+diff --git a/libfdisk/src/gpt.c b/libfdisk/src/gpt.c
+index f50bb4441..9608053a2 100644
+--- a/libfdisk/src/gpt.c
++++ b/libfdisk/src/gpt.c
+@@ -2502,11 +2502,11 @@ done:
+ 	return rc;
+ }
+ 
+-static int gpt_set_disklabel_id(struct fdisk_context *cxt)
++static int gpt_set_disklabel_id(struct fdisk_context *cxt, const char *str)
+ {
+ 	struct fdisk_gpt_label *gpt;
+ 	struct gpt_guid uuid;
+-	char *str, *old, *new;
++	char *old, *new;
+ 	int rc;
+ 
+ 	assert(cxt);
+@@ -2514,12 +2514,14 @@ static int gpt_set_disklabel_id(struct fdisk_context *cxt)
+ 	assert(fdisk_is_label(cxt, GPT));
+ 
+ 	gpt = self_label(cxt);
+-	if (fdisk_ask_string(cxt,
+-			_("Enter new disk UUID (in 8-4-4-4-12 format)"), &str))
+-		return -EINVAL;
+-
+-	rc = string_to_guid(str, &uuid);
+-	free(str);
++	if (!str) {
++		if (fdisk_ask_string(cxt,
++				_("Enter new disk UUID (in 8-4-4-4-12 format)"), &str))
++			return -EINVAL;
++		rc = string_to_guid(str, &uuid);
++		free(str);
++	} else
++		rc = string_to_guid(str, &uuid);
+ 
+ 	if (rc) {
+ 		fdisk_warnx(cxt, _("Failed to parse your UUID."));
+diff --git a/libfdisk/src/label.c b/libfdisk/src/label.c
+index a18cdeaff..fd4555de2 100644
+--- a/libfdisk/src/label.c
++++ b/libfdisk/src/label.c
+@@ -481,7 +481,24 @@ int fdisk_set_disklabel_id(struct fdisk_context *cxt)
+ 		return -ENOSYS;
+ 
+ 	DBG(CXT, ul_debugobj(cxt, "setting %s disk ID", cxt->label->name));
+-	return cxt->label->op->set_id(cxt);
++	return cxt->label->op->set_id(cxt, NULL);
++}
++
++/**
++ * fdisk_set_disklabel_id_from_string
++ * @cxt: fdisk context
++ *
++ * Returns: 0 on success, otherwise, a corresponding error.
++ */
++int fdisk_set_disklabel_id_from_string(struct fdisk_context *cxt, const char *str)
++{
++	if (!cxt || !cxt->label || !str)
++		return -EINVAL;
++	if (!cxt->label->op->set_id)
++		return -ENOSYS;
++
++	DBG(CXT, ul_debugobj(cxt, "setting %s disk ID from '%s'", cxt->label->name, str));
++	return cxt->label->op->set_id(cxt, str);
+ }
+ 
+ /**
+diff --git a/libfdisk/src/libfdisk.h.in b/libfdisk/src/libfdisk.h.in
+index 0669c0a7c..2ba34dc0a 100644
+--- a/libfdisk/src/libfdisk.h.in
++++ b/libfdisk/src/libfdisk.h.in
+@@ -399,6 +399,7 @@ extern int fdisk_get_disklabel_item(struct fdisk_context *cxt, int id, struct fd
+ 
+ extern int fdisk_get_disklabel_id(struct fdisk_context *cxt, char **id);
+ extern int fdisk_set_disklabel_id(struct fdisk_context *cxt);
++extern int fdisk_set_disklabel_id_from_string(struct fdisk_context *cxt, const char *str);
+ 
+ extern int fdisk_get_partition(struct fdisk_context *cxt, size_t partno, struct fdisk_partition **pa);
+ extern int fdisk_set_partition(struct fdisk_context *cxt, size_t partno, struct fdisk_partition *pa);
+diff --git a/libfdisk/src/libfdisk.sym b/libfdisk/src/libfdisk.sym
+index 96fcadd71..eee2d6bda 100644
+--- a/libfdisk/src/libfdisk.sym
++++ b/libfdisk/src/libfdisk.sym
+@@ -308,3 +308,6 @@ FDISK_2.35 {
+ 	fdisk_script_set_table;
+ 	fdisk_assign_device_by_fd;
+ } FDISK_2.33;
++FDISK_2.36 {
++	fdisk_set_disklabel_id_from_string;
++} FDISK_2.35;
+-- 
+2.18.2
+
diff --git a/package/util-linux/0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch b/package/util-linux/0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
new file mode 100644
index 0000000000..cc96fbb1fa
--- /dev/null
+++ b/package/util-linux/0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
@@ -0,0 +1,138 @@
+From 65e27d545cb54ac63536a8b6e7d5def180ddb5b7 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 14 Jan 2020 11:50:46 +0100
+Subject: [PATCH] sfdisk: add --disk-id to change disk UUID/ID
+
+Addresses: https://github.com/karelzak/util-linux/issues/916
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ disk-utils/sfdisk.8 |  5 +++++
+ disk-utils/sfdisk.c | 54 +++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+)
+
+diff --git a/disk-utils/sfdisk.8 b/disk-utils/sfdisk.8
+index 3ff5dd4e6..9ee71e81a 100644
+--- a/disk-utils/sfdisk.8
++++ b/disk-utils/sfdisk.8
+@@ -152,6 +152,11 @@ or a GUID for GPT.  For backward compatibility the options \fB\-c\fR and
+ Change the GPT partition UUID.  If \fIuuid\fR is not specified,
+ then print the current partition UUID.
+ .TP
++.BR "\-\-disk\-id \fIdevice " [ \fIid ]
++Change the disk identifier.  If \fIid\fR is not specified,
++then print the current identifier.  The identifier is UUID for GPT
++or unsigned integer for MBR.
++.TP
+ .BR \-r , " \-\-reorder " \fIdevice
+ Renumber the partitions, ordering them by their start offset.
+ .TP
+diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
+index bb6e1c6df..0db797b2d 100644
+--- a/disk-utils/sfdisk.c
++++ b/disk-utils/sfdisk.c
+@@ -86,6 +86,7 @@ enum {
+ 	ACT_PARTUUID,
+ 	ACT_PARTLABEL,
+ 	ACT_PARTATTRS,
++	ACT_DISKID,
+ 	ACT_DELETE
+ };
+ 
+@@ -1327,6 +1328,46 @@ static int command_partattrs(struct sfdisk *sf, int argc, char **argv)
+ 	return write_changes(sf);
+ }
+ 
++/*
++ * sfdisk --disk-id <device> [<str>]
++ */
++static int command_diskid(struct sfdisk *sf, int argc, char **argv)
++{
++	const char *devname = NULL;
++	char *str = NULL;
++
++	if (!argc)
++		errx(EXIT_FAILURE, _("no disk device specified"));
++	devname = argv[0];
++
++	if (argc == 2)
++		str = argv[1];
++	else if (argc > 2)
++		errx(EXIT_FAILURE, _("unexpected arguments"));
++
++	if (fdisk_assign_device(sf->cxt, devname, !str) != 0)
++		err(EXIT_FAILURE, _("cannot open %s"), devname);
++
++	/* print */
++	if (!str) {
++		fdisk_get_disklabel_id(sf->cxt, &str);
++		if (str)
++			printf("%s\n", str);
++		free(str);
++		fdisk_deassign_device(sf->cxt, 1);
++		return 0;
++	}
++
++	/* change */
++	if (sf->backup)
++		backup_partition_table(sf, devname);
++
++	if (fdisk_set_disklabel_id_from_string(sf->cxt, str) != 0)
++		errx(EXIT_FAILURE, _("%s: failed to set disklabel ID"), devname);
++
++	return write_changes(sf);
++}
++
+ static void sfdisk_print_partition(struct sfdisk *sf, size_t n)
+ {
+ 	struct fdisk_partition *pa = NULL;
+@@ -1941,6 +1982,9 @@ static void __attribute__((__noreturn__)) usage(void)
+ 	fputs(_(" --part-uuid <dev> <part> [<uuid>] print or change partition uuid\n"), out);
+ 	fputs(_(" --part-attrs <dev> <part> [<str>] print or change partition attributes\n"), out);
+ 
++	fputs(USAGE_SEPARATOR, out);
++	fputs(_(" --disk-id <dev> [<str>]           print or change disk label ID (UUID)\n"), out);
++
+ 	fputs(USAGE_SEPARATOR, out);
+ 	fputs(_(" <dev>                     device (usually disk) path\n"), out);
+ 	fputs(_(" <part>                    partition number\n"), out);
+@@ -2007,6 +2051,7 @@ int main(int argc, char *argv[])
+ 		OPT_PARTLABEL,
+ 		OPT_PARTTYPE,
+ 		OPT_PARTATTRS,
++		OPT_DISKID,
+ 		OPT_BYTES,
+ 		OPT_COLOR,
+ 		OPT_MOVEDATA,
+@@ -2052,6 +2097,8 @@ int main(int argc, char *argv[])
+ 		{ "part-type",  no_argument,    NULL, OPT_PARTTYPE },
+ 		{ "part-attrs", no_argument,    NULL, OPT_PARTATTRS },
+ 
++		{ "disk-id",    no_argument,	NULL, OPT_DISKID },
++
+ 		{ "show-pt-geometry", no_argument, NULL, 'G' },		/* deprecated */
+ 		{ "unit",    required_argument, NULL, 'u' },		/* deprecated */
+ 		{ "Linux",   no_argument,       NULL, 'L' },		/* deprecated */
+@@ -2192,6 +2239,9 @@ int main(int argc, char *argv[])
+ 		case OPT_PARTATTRS:
+ 			sf->act = ACT_PARTATTRS;
+ 			break;
++		case OPT_DISKID:
++			sf->act = ACT_DISKID;
++			break;
+ 		case OPT_NOREREAD:
+ 			sf->noreread = 1;
+ 			break;
+@@ -2296,6 +2346,10 @@ int main(int argc, char *argv[])
+ 		rc = command_partattrs(sf, argc - optind, argv + optind);
+ 		break;
+ 
++	case ACT_DISKID:
++		rc = command_diskid(sf, argc - optind, argv + optind);
++		break;
++
+ 	case ACT_REORDER:
+ 		rc = command_reorder(sf, argc - optind, argv + optind);
+ 		break;
+-- 
+2.18.2
+
diff --git a/package/util-linux/0006-build-sys-add-disable-hwclock-gplv3.patch b/package/util-linux/0006-build-sys-add-disable-hwclock-gplv3.patch
new file mode 100644
index 0000000000..e8ed2186a5
--- /dev/null
+++ b/package/util-linux/0006-build-sys-add-disable-hwclock-gplv3.patch
@@ -0,0 +1,105 @@
+From e8c21c894e69ba0c72ecf69e8297cb20ec5f9c1e Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 27 Jan 2020 16:17:10 +0100
+Subject: [PATCH] build-sys: add --disable-hwclock-gplv3
+
+The currently used date/time parser (for hwclock --set --date <date>)
+is gnulib based code with GPLv3.
+
+This patch allows to avoid this code and replace it with minimalistic
+date/time parser.
+
+Addresses: https://github.com/karelzak/util-linux/issues/891
+Reported-by: Carlos Santos <unixmania@gmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ configure.ac            |  9 +++++++++
+ sys-utils/Makemodule.am |  5 ++++-
+ sys-utils/hwclock.c     | 17 ++++++++++++++---
+ 3 files changed, 27 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 84b375543..960e2016d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1558,6 +1558,15 @@ AS_IF([test "x$build_hwclock_cmos" = xyes ], [
+     AC_DEFINE([USE_HWCLOCK_CMOS], [1], [Define to 1 if want to use CMOS clock.])
+ ])
+ 
++AC_ARG_ENABLE([hwclock_gplv3],
++  AS_HELP_STRING([--disable-hwclock-gplv3], [do not use datetime parsing GPLv3 code]),
++  [], [enable_hwclock_gplv3=yes]
++)
++AM_CONDITIONAL([USE_HWCLOCK_GPLv3_DATETIME], [test "x$enable_hwclock_gplv3" = xyes])
++AS_IF([test "x$enable_hwclock_gplv3" = xyes ], [
++    AC_DEFINE([USE_HWCLOCK_GPLv3_DATETIME], [1], [use datetime parsing GPLv3 code to hwclock])
++])
++
+ 
+ UL_BUILD_INIT([mkfs], [yes])
+ AM_CONDITIONAL([BUILD_MKFS], [test "x$build_mkfs" = xyes])
+diff --git a/sys-utils/Makemodule.am b/sys-utils/Makemodule.am
+index baf851e5b..07228f75f 100644
+--- a/sys-utils/Makemodule.am
++++ b/sys-utils/Makemodule.am
+@@ -451,8 +451,11 @@ dist_man_MANS += \
+ PATHFILES += sys-utils/hwclock.8
+ hwclock_SOURCES = \
+ 	sys-utils/hwclock.c \
+-	sys-utils/hwclock.h \
++	sys-utils/hwclock.h
++if USE_HWCLOCK_GPLv3_DATETIME
++hwclock_SOURCES += \
+ 	sys-utils/hwclock-parse-date.y
++endif
+ hwclock_LDADD = $(LDADD) libcommon.la -lm
+ hwclock_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/sys-utils
+ if USE_HWCLOCK_CMOS
+diff --git a/sys-utils/hwclock.c b/sys-utils/hwclock.c
+index 15fc19afd..e736da717 100644
+--- a/sys-utils/hwclock.c
++++ b/sys-utils/hwclock.c
+@@ -3,6 +3,7 @@
+  *
+  * Since 7a3000f7ba548cf7d74ac77cc63fe8de228a669e (v2.30) hwclock is linked
+  * with parse_date.y from gnullib. This gnulib code is distributed with GPLv3.
++ * Use --disable-hwclock-gplv3 to exclude this code.
+  *
+  *
+  * clock.c was written by Charles Hedrick, hedrick at cs.rutgers.edu, Apr 1992
+@@ -1170,7 +1171,6 @@ int main(int argc, char **argv)
+ 	};
+ 	struct timeval startup_time;
+ 	struct adjtime adjtime = { 0 };
+-	struct timespec when = { 0 };
+ 	/*
+ 	 * The time we started up, in seconds into the epoch, including
+ 	 * fractions.
+@@ -1398,11 +1398,22 @@ int main(int argc, char **argv)
+ 
+ 	if (ctl.set || ctl.predict) {
+ 		if (!ctl.date_opt) {
+-		warnx(_("--date is required for --set or --predict"));
+-		exit(EXIT_FAILURE);
++			warnx(_("--date is required for --set or --predict"));
++			exit(EXIT_FAILURE);
+ 		}
++#ifdef USE_HWCLOCK_GPLv3_DATETIME
++		/* date(1) compatible GPLv3 parser */
++		struct timespec when = { 0 };
++
+ 		if (parse_date(&when, ctl.date_opt, NULL))
+ 			set_time = when.tv_sec;
++#else
++		/* minimalistic GPLv2 based parser */
++		usec_t usec;
++
++		if (parse_timestamp(ctl.date_opt, &usec) == 0)
++			set_time = (time_t) (usec / 1000000);
++#endif
+ 		else {
+ 			warnx(_("invalid date '%s'"), ctl.date_opt);
+ 			exit(EXIT_FAILURE);
+-- 
+2.18.2
+
diff --git a/package/util-linux/0007-libmount-fix-x-options-use-for-non-root-users.patch b/package/util-linux/0007-libmount-fix-x-options-use-for-non-root-users.patch
new file mode 100644
index 0000000000..3572fc0908
--- /dev/null
+++ b/package/util-linux/0007-libmount-fix-x-options-use-for-non-root-users.patch
@@ -0,0 +1,137 @@
+From 88f04bf9e637b14ff5274e4c4981e43ab2c40c2b Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 28 Jan 2020 10:45:07 +0100
+Subject: [PATCH] libmount: fix x- options use for non-root users
+
+libmount returns EPERM for all X- and x- mount options for non-root
+users when evaluate X-mount.mkdir. It's bug, we need to be sensitive
+to only X-mount.mkdir and only if the target directory is missing.
+
+Addresses: https://github.com/karelzak/util-linux/issues/941
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ libmount/src/context.c | 41 ++++++++++++++++++++++-------------------
+ sys-utils/mount.8      |  6 +++---
+ 2 files changed, 25 insertions(+), 22 deletions(-)
+
+diff --git a/libmount/src/context.c b/libmount/src/context.c
+index 6c536cc15..91fe8e4bf 100644
+--- a/libmount/src/context.c
++++ b/libmount/src/context.c
+@@ -1855,49 +1855,48 @@ end:
+ 	return rc;
+ }
+ 
+-/* create a mountpoint if X-mount.mkdir[=<mode>] specified */
+-static int mkdir_target(const char *tgt, struct libmnt_fs *fs)
++static int is_mkdir_required(const char *tgt, struct libmnt_fs *fs, mode_t *mode, int *rc)
+ {
+ 	char *mstr = NULL;
+ 	size_t mstr_sz = 0;
+-	mode_t mode = 0;
+ 	struct stat st;
+-	int rc;
+ 
+ 	assert(tgt);
+ 	assert(fs);
++	assert(mode);
++	assert(rc);
++
++	*mode = 0;
++	*rc = 0;
+ 
+ 	if (mnt_optstr_get_option(fs->user_optstr, "X-mount.mkdir", &mstr, &mstr_sz) != 0 &&
+ 	    mnt_optstr_get_option(fs->user_optstr, "x-mount.mkdir", &mstr, &mstr_sz) != 0)   	/* obsolete */
+ 		return 0;
+ 
+-	DBG(CXT, ul_debug("mkdir %s (%s) wanted", tgt, mstr));
+-
+ 	if (mnt_stat_mountpoint(tgt, &st) == 0)
+ 		return 0;
+ 
++	DBG(CXT, ul_debug("mkdir %s (%s) wanted", tgt, mstr));
++
+ 	if (mstr && mstr_sz) {
+ 		char *end = NULL;
+ 
+ 		errno = 0;
+-		mode = strtol(mstr, &end, 8);
++		*mode = strtol(mstr, &end, 8);
+ 
+ 		if (errno || !end || mstr + mstr_sz != end) {
+ 			DBG(CXT, ul_debug("failed to parse mkdir mode '%s'", mstr));
+-			return -MNT_ERR_MOUNTOPT;
++			*rc = -MNT_ERR_MOUNTOPT;
++			return 0;
+ 		}
+ 	}
+ 
+-	if (!mode)
+-		mode = S_IRWXU |			/* 0755 */
++	if (!*mode)
++		*mode = S_IRWXU |			/* 0755 */
+ 		       S_IRGRP | S_IXGRP |
+ 		       S_IROTH | S_IXOTH;
+ 
+-	rc = mkdir_p(tgt, mode);
+-	if (rc)
+-		DBG(CXT, ul_debug("mkdir %s failed: %m", tgt));
+-
+-	return rc;
++	return 1;
+ }
+ 
+ int mnt_context_prepare_target(struct libmnt_context *cxt)
+@@ -1905,6 +1904,7 @@ int mnt_context_prepare_target(struct libmnt_context *cxt)
+ 	const char *tgt, *prefix;
+ 	int rc = 0;
+ 	struct libmnt_ns *ns_old;
++	mode_t mode = 0;
+ 
+ 	assert(cxt);
+ 	assert(cxt->fs);
+@@ -1946,12 +1946,15 @@ int mnt_context_prepare_target(struct libmnt_context *cxt)
+ 	/* X-mount.mkdir target */
+ 	if (cxt->action == MNT_ACT_MOUNT
+ 	    && (cxt->user_mountflags & MNT_MS_XCOMMENT ||
+-		cxt->user_mountflags & MNT_MS_XFSTABCOMM)) {
++		cxt->user_mountflags & MNT_MS_XFSTABCOMM)
++	    && is_mkdir_required(tgt, cxt->fs, &mode, &rc)) {
+ 
+ 		/* supported only for root or non-suid mount(8) */
+-		if (!mnt_context_is_restricted(cxt))
+-			rc = mkdir_target(tgt, cxt->fs);
+-		else
++		if (!mnt_context_is_restricted(cxt)) {
++			rc = mkdir_p(tgt, mode);
++			if (rc)
++				DBG(CXT, ul_debug("mkdir %s failed: %m", tgt));
++		} else
+ 			rc = -EPERM;
+ 	}
+ 
+diff --git a/sys-utils/mount.8 b/sys-utils/mount.8
+index 3e57251ed..698b0f011 100644
+--- a/sys-utils/mount.8
++++ b/sys-utils/mount.8
+@@ -1306,14 +1306,14 @@ functionality have been extended to keep existing fstab configurations usable
+ without a change.
+ .TP
+ .BR X-mount.mkdir [ = \fImode\fR ]
+-Allow to make a target directory (mountpoint).  The optional argument
++Allow to make a target directory (mountpoint) if it does not exit yet.
++The optional argument
+ .I mode
+ specifies the filesystem access mode used for
+ .BR mkdir (2)
+ in octal notation.  The default mode is 0755.  This functionality is supported
+ only for root users or when mount executed without suid permissions.  The option
+-is also supported as x-mount.mkdir, this notation is deprecated for mount.mkdir
+-since v2.30.
++is also supported as x-mount.mkdir, this notation is deprecated since v2.30.
+ 
+ .SH "FILESYSTEM-SPECIFIC MOUNT OPTIONS"
+ You should consult the respective man page for the filesystem first.
+-- 
+2.18.2
+
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 3609da79ad..996f0cd7fa 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -57,9 +57,9 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	  flock, fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize,
 	  ldattach, look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie,
 	  mkfs, mkswap, namei, prlimit, readprofile, renice, rev,
-	  rtcwake, script, scriptreplay, setarch, setsid, sfdisk,
-	  swaplabel, swapoff, swapon, uuidgen, uuidparse, whereis,
-	  wipefs
+	  rtcwake, script, scriptlive, scriptreplay, setarch, setsid,
+	  sfdisk, swaplabel, swapoff, swapon, uuidgen, uuidparse,
+	  whereis, wipefs
 
 	  The setarch utility also installs architecture-specific
 	  symlinks like linux32, linux64, uname26, i386 and x86_64.
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 7a83a03c1d..a5a9099125 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,7 +1,7 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.34/sha256sums.asc
-sha256 743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5  util-linux-2.34.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.35/sha256sums.asc
+sha256 b3081b560268c1ec3367e035234e91616fa7923a0afc2b1c80a2a6d8b9dfe2c9  util-linux-2.35.tar.xz
 # License files, locally calculated
-sha256 4335620e8f478ee4dc4d26540448d39469091ef1d8e3fbbbb8bf753206ceac74  README.licensing
+sha256 869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
 sha256 9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
 sha256 ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.BSD-4-Clause-UC
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-or-later
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7bd7a89e18..b867a670a4 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,13 +4,17 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION_MAJOR = 2.34
+UTIL_LINUX_VERSION_MAJOR = 2.35
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-# README.licensing claims that some files are GPL-2.0 only, but this is not true.
-# Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
+# 0006-build-sys-add-disable-hwclock-gplv3.patch
+UTIL_LINUX_AUTORECONF = YES
+
+# README.licensing claims that some files are GPL-2.0 only, but this is not
+# true. Some files are GPL-3.0+ but only in tests and optionally in hwclock
+# (but we disable that option). rfkill uses an ISC-style license.
 UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid), ISC (rfkill)
 UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-3-Clause \
@@ -18,12 +22,13 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.GPL-2.0-or-later \
 	Documentation/licenses/COPYING.ISC \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown
-UTIL_LINUX_AUTORECONF = YES
+
 UTIL_LINUX_LIBS = $(TARGET_NLS_LIBS)
 
 # system depends on util-linux so we enable systemd support
@@ -109,7 +114,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_HARDLINK),--enable-hardlink,--disable-hardlink) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock,--disable-hwclock) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock --disable-hwclock-gplv3,--disable-hwclock) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
