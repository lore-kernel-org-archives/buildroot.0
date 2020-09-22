From: Michael Fischer <mf@go-sys.de>
Date: Tue, 22 Sep 2020 16:47:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/util-linux: bump version to 2.36
Message-ID: <20200922144731.2546-1-mf@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patches 0001-0004: already applied upstream

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...0001-blkdiscard-use-O_EXCL-add-force.patch |  86 --------
 ...d-fdisk_set_disklabel_id_from_string.patch | 195 ------------------
 ...k-add-disk-id-to-change-disk-UUID-ID.patch | 139 -------------
 .../0004-include-cleanup-pidfd-inckudes.patch |  40 ----
 package/util-linux/util-linux.hash            |   4 +-
 package/util-linux/util-linux.mk              |   5 +-
 6 files changed, 4 insertions(+), 465 deletions(-)
 delete mode 100644 package/util-linux/0001-blkdiscard-use-O_EXCL-add-force.patch
 delete mode 100644 package/util-linux/0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
 delete mode 100644 package/util-linux/0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
 delete mode 100644 package/util-linux/0004-include-cleanup-pidfd-inckudes.patch

diff --git a/package/util-linux/0001-blkdiscard-use-O_EXCL-add-force.patch b/package/util-linux/0001-blkdiscard-use-O_EXCL-add-force.patch
deleted file mode 100644
index 0ecb867029..0000000000
--- a/package/util-linux/0001-blkdiscard-use-O_EXCL-add-force.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 34fed3ff1740aded9c2aae6b5d67a4eb696f738e Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 9 Jan 2020 11:03:51 +0100
-Subject: [PATCH] blkdiscard: use O_EXCL, add --force
-
-Let's make it more robust and safe. O_EXCL is an elegant way how to avoid
-unwanted discard on mounted device.
-
-Addresses: https://github.com/karelzak/util-linux/issues/915
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- sys-utils/blkdiscard.8 |  5 +++++
- sys-utils/blkdiscard.c | 11 ++++++++---
- 2 files changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/sys-utils/blkdiscard.8 b/sys-utils/blkdiscard.8
-index 1f3a32be9..98c6f36a9 100644
---- a/sys-utils/blkdiscard.8
-+++ b/sys-utils/blkdiscard.8
-@@ -36,6 +36,11 @@ MiB (=1024*1024), and so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is
- optional, e.g., "K" has the same meaning as "KiB") or the suffixes
- KB (=1000), MB (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.
- .TP
-+.BR \-f , " \-\-force"
-+Disable all checking.  Since v2.36 the block device is open in exclusive mode (O_EXCL)
-+by default to avoid collision with mounted filesystem or another kernel subsystem.
-+The force option disables the exclusive access mode.
-+.TP
- .BR \-o , " \-\-offset \fIoffset"
- Byte offset into the device from which to start discarding.  The provided value
- will be aligned to the device sector size.  The default value is zero.
-diff --git a/sys-utils/blkdiscard.c b/sys-utils/blkdiscard.c
-index f9ba5e468..589974f9c 100644
---- a/sys-utils/blkdiscard.c
-+++ b/sys-utils/blkdiscard.c
-@@ -88,6 +88,7 @@ static void __attribute__((__noreturn__)) usage(void)
- 	fputs(_("Discard the content of sectors on a device.\n"), out);
- 
- 	fputs(USAGE_OPTIONS, out);
-+	fputs(_(" -f, --force         disable all checking\n"), out);
- 	fputs(_(" -o, --offset <num>  offset in bytes to discard from\n"), out);
- 	fputs(_(" -l, --length <num>  length of bytes to discard from the offset\n"), out);
- 	fputs(_(" -p, --step <num>    size of the discard iterations within the offset\n"), out);
-@@ -106,7 +107,7 @@ static void __attribute__((__noreturn__)) usage(void)
- int main(int argc, char **argv)
- {
- 	char *path;
--	int c, fd, verbose = 0, secsize;
-+	int c, fd, verbose = 0, secsize, force = 0;
- 	uint64_t end, blksize, step, range[2], stats[2];
- 	struct stat sb;
- 	struct timeval now, last;
-@@ -116,6 +117,7 @@ int main(int argc, char **argv)
- 	    { "help",      no_argument,       NULL, 'h' },
- 	    { "version",   no_argument,       NULL, 'V' },
- 	    { "offset",    required_argument, NULL, 'o' },
-+	    { "force",     no_argument,       NULL, 'f' },
- 	    { "length",    required_argument, NULL, 'l' },
- 	    { "step",      required_argument, NULL, 'p' },
- 	    { "secure",    no_argument,       NULL, 's' },
-@@ -133,8 +135,11 @@ int main(int argc, char **argv)
- 	range[1] = ULLONG_MAX;
- 	step = 0;
- 
--	while ((c = getopt_long(argc, argv, "hVsvo:l:p:z", longopts, NULL)) != -1) {
-+	while ((c = getopt_long(argc, argv, "hfVsvo:l:p:z", longopts, NULL)) != -1) {
- 		switch(c) {
-+		case 'f':
-+			force = 1;
-+			break;
- 		case 'l':
- 			range[1] = strtosize_or_err(optarg,
- 					_("failed to parse length"));
-@@ -176,7 +181,7 @@ int main(int argc, char **argv)
- 		errtryhelp(EXIT_FAILURE);
- 	}
- 
--	fd = open(path, O_WRONLY);
-+	fd = open(path, O_WRONLY | (force ? 0 : O_EXCL));
- 	if (fd < 0)
- 		err(EXIT_FAILURE, _("cannot open %s"), path);
- 
--- 
-2.18.2
-
diff --git a/package/util-linux/0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch b/package/util-linux/0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
deleted file mode 100644
index eb28ae328b..0000000000
--- a/package/util-linux/0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
+++ /dev/null
@@ -1,195 +0,0 @@
-From e5f31446166de7212213c62a019945afb8e197ef Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 14 Jan 2020 11:43:24 +0100
-Subject: [PATCH] libfdisk: add fdisk_set_disklabel_id_from_string()
-
-We have fdisk_set_disklabel_id(), but it's old ask-API based function.
-It's not comfortable if you want to avoid dialog or template.
-
-Addresses: https://github.com/karelzak/util-linux/issues/916
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- libfdisk/docs/libfdisk-sections.txt |  1 +
- libfdisk/src/dos.c                  | 29 ++++++++++++++++++-----------
- libfdisk/src/fdiskP.h               |  2 +-
- libfdisk/src/gpt.c                  | 18 ++++++++++--------
- libfdisk/src/label.c                | 19 ++++++++++++++++++-
- libfdisk/src/libfdisk.h.in          |  1 +
- libfdisk/src/libfdisk.sym           |  3 +++
- 7 files changed, 52 insertions(+), 21 deletions(-)
-
-diff --git a/libfdisk/docs/libfdisk-sections.txt b/libfdisk/docs/libfdisk-sections.txt
-index f148da527..6675c1100 100644
---- a/libfdisk/docs/libfdisk-sections.txt
-+++ b/libfdisk/docs/libfdisk-sections.txt
-@@ -81,6 +81,7 @@ fdisk_list_disklabel
- fdisk_locate_disklabel
- fdisk_reorder_partitions
- fdisk_set_disklabel_id
-+fdisk_set_disklabel_id_from_string
- fdisk_set_partition_type
- fdisk_toggle_partition_flag
- fdisk_verify_disklabel
-diff --git a/libfdisk/src/dos.c b/libfdisk/src/dos.c
-index 53713ec5f..98314dfa6 100644
---- a/libfdisk/src/dos.c
-+++ b/libfdisk/src/dos.c
-@@ -707,12 +707,12 @@ static int dos_create_disklabel(struct fdisk_context *cxt)
- 	return 0;
- }
- 
--static int dos_set_disklabel_id(struct fdisk_context *cxt)
-+static int dos_set_disklabel_id(struct fdisk_context *cxt, const char *str)
- {
--	char *end = NULL, *str = NULL;
-+	char *str0 = str;
- 	unsigned int id, old;
- 	struct fdisk_dos_label *l;
--	int rc;
-+	int rc = 0;
- 
- 	assert(cxt);
- 	assert(cxt->label);
-@@ -722,18 +722,25 @@ static int dos_set_disklabel_id(struct fdisk_context *cxt)
- 
- 	l = self_label(cxt);
- 	old = mbr_get_id(cxt->firstsector);
--	rc = fdisk_ask_string(cxt,
-+
-+	if (!str)
-+		rc = fdisk_ask_string(cxt,
- 			_("Enter the new disk identifier"), &str);
--	if (rc)
--		return rc;
-+	if (!rc) {
-+		char *end = NULL;
- 
--	errno = 0;
--	id = strtoul(str, &end, 0);
--	if (errno || str == end || (end && *end)) {
--		fdisk_warnx(cxt, _("Incorrect value."));
--		return -EINVAL;
-+		errno = 0;
-+		id = strtoul(str, &end, 0);
-+		if (errno || str == end || (end && *end)) {
-+			fdisk_warnx(cxt, _("Incorrect value."));
-+			rc = -EINVAL;
-+		}
- 	}
- 
-+	if (!str0)
-+		free(str);
-+	if (rc)
-+		return -EINVAL;
- 
- 	mbr_set_id(cxt->firstsector, id);
- 	l->non_pt_changed = 1;
-diff --git a/libfdisk/src/fdiskP.h b/libfdisk/src/fdiskP.h
-index fefebae2a..0487466e3 100644
---- a/libfdisk/src/fdiskP.h
-+++ b/libfdisk/src/fdiskP.h
-@@ -220,7 +220,7 @@ struct fdisk_label_operations {
- 	/* get details from label */
- 	int (*get_item)(struct fdisk_context *cxt, struct fdisk_labelitem *item);
- 	/* set disk label ID */
--	int (*set_id)(struct fdisk_context *cxt);
-+	int (*set_id)(struct fdisk_context *cxt, const char *str);
- 
- 
- 	/* new partition */
-diff --git a/libfdisk/src/gpt.c b/libfdisk/src/gpt.c
-index f50bb4441..9608053a2 100644
---- a/libfdisk/src/gpt.c
-+++ b/libfdisk/src/gpt.c
-@@ -2502,11 +2502,11 @@ done:
- 	return rc;
- }
- 
--static int gpt_set_disklabel_id(struct fdisk_context *cxt)
-+static int gpt_set_disklabel_id(struct fdisk_context *cxt, const char *str)
- {
- 	struct fdisk_gpt_label *gpt;
- 	struct gpt_guid uuid;
--	char *str, *old, *new;
-+	char *old, *new;
- 	int rc;
- 
- 	assert(cxt);
-@@ -2514,12 +2514,14 @@ static int gpt_set_disklabel_id(struct fdisk_context *cxt)
- 	assert(fdisk_is_label(cxt, GPT));
- 
- 	gpt = self_label(cxt);
--	if (fdisk_ask_string(cxt,
--			_("Enter new disk UUID (in 8-4-4-4-12 format)"), &str))
--		return -EINVAL;
--
--	rc = string_to_guid(str, &uuid);
--	free(str);
-+	if (!str) {
-+		if (fdisk_ask_string(cxt,
-+				_("Enter new disk UUID (in 8-4-4-4-12 format)"), &str))
-+			return -EINVAL;
-+		rc = string_to_guid(str, &uuid);
-+		free(str);
-+	} else
-+		rc = string_to_guid(str, &uuid);
- 
- 	if (rc) {
- 		fdisk_warnx(cxt, _("Failed to parse your UUID."));
-diff --git a/libfdisk/src/label.c b/libfdisk/src/label.c
-index a18cdeaff..fd4555de2 100644
---- a/libfdisk/src/label.c
-+++ b/libfdisk/src/label.c
-@@ -481,7 +481,24 @@ int fdisk_set_disklabel_id(struct fdisk_context *cxt)
- 		return -ENOSYS;
- 
- 	DBG(CXT, ul_debugobj(cxt, "setting %s disk ID", cxt->label->name));
--	return cxt->label->op->set_id(cxt);
-+	return cxt->label->op->set_id(cxt, NULL);
-+}
-+
-+/**
-+ * fdisk_set_disklabel_id_from_string
-+ * @cxt: fdisk context
-+ *
-+ * Returns: 0 on success, otherwise, a corresponding error.
-+ */
-+int fdisk_set_disklabel_id_from_string(struct fdisk_context *cxt, const char *str)
-+{
-+	if (!cxt || !cxt->label || !str)
-+		return -EINVAL;
-+	if (!cxt->label->op->set_id)
-+		return -ENOSYS;
-+
-+	DBG(CXT, ul_debugobj(cxt, "setting %s disk ID from '%s'", cxt->label->name, str));
-+	return cxt->label->op->set_id(cxt, str);
- }
- 
- /**
-diff --git a/libfdisk/src/libfdisk.h.in b/libfdisk/src/libfdisk.h.in
-index 0669c0a7c..2ba34dc0a 100644
---- a/libfdisk/src/libfdisk.h.in
-+++ b/libfdisk/src/libfdisk.h.in
-@@ -399,6 +399,7 @@ extern int fdisk_get_disklabel_item(struct fdisk_context *cxt, int id, struct fd
- 
- extern int fdisk_get_disklabel_id(struct fdisk_context *cxt, char **id);
- extern int fdisk_set_disklabel_id(struct fdisk_context *cxt);
-+extern int fdisk_set_disklabel_id_from_string(struct fdisk_context *cxt, const char *str);
- 
- extern int fdisk_get_partition(struct fdisk_context *cxt, size_t partno, struct fdisk_partition **pa);
- extern int fdisk_set_partition(struct fdisk_context *cxt, size_t partno, struct fdisk_partition *pa);
-diff --git a/libfdisk/src/libfdisk.sym b/libfdisk/src/libfdisk.sym
-index 96fcadd71..eee2d6bda 100644
---- a/libfdisk/src/libfdisk.sym
-+++ b/libfdisk/src/libfdisk.sym
-@@ -308,3 +308,6 @@ FDISK_2.35 {
- 	fdisk_script_set_table;
- 	fdisk_assign_device_by_fd;
- } FDISK_2.33;
-+FDISK_2.36 {
-+	fdisk_set_disklabel_id_from_string;
-+} FDISK_2.35;
--- 
-2.18.2
-
diff --git a/package/util-linux/0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch b/package/util-linux/0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
deleted file mode 100644
index fe435018f2..0000000000
--- a/package/util-linux/0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 65e27d545cb54ac63536a8b6e7d5def180ddb5b7 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 14 Jan 2020 11:50:46 +0100
-Subject: [PATCH] sfdisk: add --disk-id to change disk UUID/ID
-
-Addresses: https://github.com/karelzak/util-linux/issues/916
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- disk-utils/sfdisk.8 |  5 +++++
- disk-utils/sfdisk.c | 54 +++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 59 insertions(+)
-
-diff --git a/disk-utils/sfdisk.8 b/disk-utils/sfdisk.8
-index 3ff5dd4e6..9ee71e81a 100644
---- a/disk-utils/sfdisk.8
-+++ b/disk-utils/sfdisk.8
-@@ -152,6 +152,11 @@ or a GUID for GPT.  For backward compatibility the options \fB\-c\fR and
- Change the GPT partition UUID.  If \fIuuid\fR is not specified,
- then print the current partition UUID.
- .TP
-+.BR "\-\-disk\-id \fIdevice " [ \fIid ]
-+Change the disk identifier.  If \fIid\fR is not specified,
-+then print the current identifier.  The identifier is UUID for GPT
-+or unsigned integer for MBR.
-+.TP
- .BR \-r , " \-\-reorder " \fIdevice
- Renumber the partitions, ordering them by their start offset.
- .TP
-diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
-index bb6e1c6df..0db797b2d 100644
---- a/disk-utils/sfdisk.c
-+++ b/disk-utils/sfdisk.c
-@@ -86,6 +86,7 @@ enum {
- 	ACT_PARTUUID,
- 	ACT_PARTLABEL,
- 	ACT_PARTATTRS,
-+	ACT_DISKID,
- 	ACT_DELETE
- };
- 
-@@ -1327,6 +1328,46 @@ static int command_partattrs(struct sfdisk *sf, int argc, char **argv)
- 	return write_changes(sf);
- }
- 
-+/*
-+ * sfdisk --disk-id <device> [<str>]
-+ */
-+static int command_diskid(struct sfdisk *sf, int argc, char **argv)
-+{
-+	const char *devname = NULL;
-+	char *str = NULL;
-+
-+	if (!argc)
-+		errx(EXIT_FAILURE, _("no disk device specified"));
-+	devname = argv[0];
-+
-+	if (argc == 2)
-+		str = argv[1];
-+	else if (argc > 2)
-+		errx(EXIT_FAILURE, _("unexpected arguments"));
-+
-+	if (fdisk_assign_device(sf->cxt, devname, !str) != 0)
-+		err(EXIT_FAILURE, _("cannot open %s"), devname);
-+
-+	/* print */
-+	if (!str) {
-+		fdisk_get_disklabel_id(sf->cxt, &str);
-+		if (str)
-+			printf("%s\n", str);
-+		free(str);
-+		fdisk_deassign_device(sf->cxt, 1);
-+		return 0;
-+	}
-+
-+	/* change */
-+	if (sf->backup)
-+		backup_partition_table(sf, devname);
-+
-+	if (fdisk_set_disklabel_id_from_string(sf->cxt, str) != 0)
-+		errx(EXIT_FAILURE, _("%s: failed to set disklabel ID"), devname);
-+
-+	return write_changes(sf);
-+}
-+
- static void sfdisk_print_partition(struct sfdisk *sf, size_t n)
- {
- 	struct fdisk_partition *pa = NULL;
-@@ -1941,6 +1982,9 @@ static void __attribute__((__noreturn__)) usage(void)
- 	fputs(_(" --part-uuid <dev> <part> [<uuid>] print or change partition uuid\n"), out);
- 	fputs(_(" --part-attrs <dev> <part> [<str>] print or change partition attributes\n"), out);
- 
-+	fputs(USAGE_SEPARATOR, out);
-+	fputs(_(" --disk-id <dev> [<str>]           print or change disk label ID (UUID)\n"), out);
-+
- 	fputs(USAGE_SEPARATOR, out);
- 	fputs(_(" <dev>                     device (usually disk) path\n"), out);
- 	fputs(_(" <part>                    partition number\n"), out);
-@@ -2007,6 +2051,7 @@ int main(int argc, char *argv[])
- 		OPT_PARTLABEL,
- 		OPT_PARTTYPE,
- 		OPT_PARTATTRS,
-+		OPT_DISKID,
- 		OPT_BYTES,
- 		OPT_COLOR,
- 		OPT_MOVEDATA,
-@@ -2052,6 +2097,8 @@ int main(int argc, char *argv[])
- 		{ "part-type",  no_argument,    NULL, OPT_PARTTYPE },
- 		{ "part-attrs", no_argument,    NULL, OPT_PARTATTRS },
- 
-+		{ "disk-id",    no_argument,	NULL, OPT_DISKID },
-+
- 		{ "show-pt-geometry", no_argument, NULL, 'G' },		/* deprecated */
- 		{ "unit",    required_argument, NULL, 'u' },		/* deprecated */
- 		{ "Linux",   no_argument,       NULL, 'L' },		/* deprecated */
-@@ -2192,6 +2239,9 @@ int main(int argc, char *argv[])
- 		case OPT_PARTATTRS:
- 			sf->act = ACT_PARTATTRS;
- 			break;
-+		case OPT_DISKID:
-+			sf->act = ACT_DISKID;
-+			break;
- 		case OPT_NOREREAD:
- 			sf->noreread = 1;
- 			break;
-@@ -2296,6 +2346,10 @@ int main(int argc, char *argv[])
- 		rc = command_partattrs(sf, argc - optind, argv + optind);
- 		break;
- 
-+	case ACT_DISKID:
-+		rc = command_diskid(sf, argc - optind, argv + optind);
-+		break;
-+
- 	case ACT_REORDER:
- 		rc = command_reorder(sf, argc - optind, argv + optind);
- 		break;
--- 
-2.18.2
-
diff --git a/package/util-linux/0004-include-cleanup-pidfd-inckudes.patch b/package/util-linux/0004-include-cleanup-pidfd-inckudes.patch
deleted file mode 100644
index 73f3118b0a..0000000000
--- a/package/util-linux/0004-include-cleanup-pidfd-inckudes.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 0a4035ff2e4fd5b5ae0cf8f8665696c2aff53b75 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 10 Mar 2020 11:43:16 +0100
-Subject: [PATCH] include: cleanup pidfd inckudes
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- include/pidfd-utils.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
-index 0baedd2c9..4a6c3a604 100644
---- a/include/pidfd-utils.h
-+++ b/include/pidfd-utils.h
-@@ -3,10 +3,10 @@
- 
- #if defined(__linux__)
- # include <sys/syscall.h>
--# if defined(SYS_pidfd_send_signal)
-+# if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
- #  include <sys/types.h>
- 
--#  ifndef HAVE_PIDFD_OPEN
-+#  ifndef HAVE_PIDFD_SEND_SIGNAL
- static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
- 				    unsigned int flags)
- {
-@@ -14,7 +14,7 @@ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
- }
- #  endif
- 
--#  ifndef HAVE_PIDFD_SEND_SIGNAL
-+#  ifndef HAVE_PIDFD_OPEN
- static inline int pidfd_open(pid_t pid, unsigned int flags)
- {
- 	return syscall(SYS_pidfd_open, pid, flags);
--- 
-2.18.2
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 7f87dc9a17..fce97c4892 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.35/sha256sums.asc
-sha256  21b7431e82f6bcd9441a01beeec3d57ed33ee948f8a5b41da577073c372eb58a  util-linux-2.35.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.36/sha256sums.asc
+sha256  9e4b1c67eb13b9b67feb32ae1dc0d50e08ce9e5d82e1cccd0ee771ad2fa9e0b1  util-linux-2.36.tar.xz
 # License files, locally calculated
 sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 4356b2b569..fae952eb77 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,9 +7,8 @@
 # When making changes to this file, please check if
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
-UTIL_LINUX_VERSION_MAJOR = 2.35
-UTIL_LINUX_VERSION_MINOR = 2
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).$(UTIL_LINUX_VERSION_MINOR)
+UTIL_LINUX_VERSION_MAJOR = 2.36
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.28.0
