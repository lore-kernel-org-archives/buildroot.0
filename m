From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 May 2012 09:25:17 +0200
Subject: [Buildroot] [git commit] busybox: bump 1.20.x version
Message-ID: <20120528074208.826DF96DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a1e83823de62f55ac06f4a67452ee7cc1ce3ace
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                          |    2 +-
 .../busybox-1.20.0/busybox-1.20.0-buildsys.patch   |   20 ------
 .../busybox-1.20.0/busybox-1.20.0-ext4.patch       |   73 --------------------
 .../busybox-1.20.0/busybox-1.20.0-find.patch       |   33 ---------
 .../busybox-1.20.0/busybox-1.20.0-getty.patch      |   17 -----
 .../busybox-1.20.0/busybox-1.20.0-lineedit.patch   |   22 ------
 .../busybox-1.20.0/busybox-1.20.0-mdev.patch       |   72 -------------------
 .../busybox-1.20.0/busybox-1.20.0-sed.patch        |   29 --------
 8 files changed, 1 insertions(+), 267 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 946134d..a078644 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -36,7 +36,7 @@ config BR2_BUSYBOX_VERSION
 	string
 	default "1.18.5"	if BR2_BUSYBOX_VERSION_1_18_X
 	default "1.19.4"	if BR2_BUSYBOX_VERSION_1_19_X
-	default "1.20.0"	if BR2_BUSYBOX_VERSION_1_20_X
+	default "1.20.1"	if BR2_BUSYBOX_VERSION_1_20_X
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-buildsys.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-buildsys.patch
deleted file mode 100644
index ae9ea5c..0000000
--- a/package/busybox/busybox-1.20.0/busybox-1.20.0-buildsys.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- busybox-1.20.0/archival/libarchive/Kbuild.src
-+++ busybox-1.20.0-buildsys/archival/libarchive/Kbuild.src
-@@ -45,7 +45,7 @@ lib-$(CONFIG_UNXZ)
- lib-$(CONFIG_CPIO)                      += get_header_cpio.o
- lib-$(CONFIG_DPKG)                      += $(DPKG_FILES)
- lib-$(CONFIG_DPKG_DEB)                  += $(DPKG_FILES)
--lib-$(CONFIG_GUNZIP)                    += decompress_gunzip.o
-+lib-$(CONFIG_GUNZIP)                    += open_transformer.o decompress_gunzip.o
- lib-$(CONFIG_RPM2CPIO)                  += decompress_gunzip.o get_header_cpio.o
- lib-$(CONFIG_RPM)                       += open_transformer.o decompress_gunzip.o get_header_cpio.o
- lib-$(CONFIG_TAR)                       += get_header_tar.o
-@@ -60,7 +60,7 @@ lib-$(CONFIG_FEATURE_SEAMLESS_GZ)
- lib-$(CONFIG_FEATURE_SEAMLESS_BZ2)      += open_transformer.o decompress_bunzip2.o
- lib-$(CONFIG_FEATURE_SEAMLESS_LZMA)     += open_transformer.o decompress_unlzma.o
- lib-$(CONFIG_FEATURE_SEAMLESS_XZ)       += open_transformer.o decompress_unxz.o
--lib-$(CONFIG_FEATURE_COMPRESS_USAGE)    += decompress_bunzip2.o
-+lib-$(CONFIG_FEATURE_COMPRESS_USAGE)    += open_transformer.o decompress_bunzip2.o
- lib-$(CONFIG_FEATURE_COMPRESS_BBCONFIG) += decompress_bunzip2.o
- lib-$(CONFIG_FEATURE_TAR_TO_COMMAND)    += data_extract_to_command.o
- 
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-ext4.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-ext4.patch
deleted file mode 100644
index d54ccf8..0000000
--- a/package/busybox/busybox-1.20.0/busybox-1.20.0-ext4.patch
+++ /dev/null
@@ -1,73 +0,0 @@
---- busybox-1.20.0/util-linux/volume_id/ext.c
-+++ busybox-1.20.0-ext4/util-linux/volume_id/ext.c
-@@ -39,10 +39,50 @@ struct ext2_super_block {
- 	uint8_t	volume_name[16];
- } PACKED;
- 
--#define EXT3_FEATURE_COMPAT_HAS_JOURNAL		0x00000004
--#define EXT3_FEATURE_INCOMPAT_JOURNAL_DEV	0x00000008
- #define EXT_SUPERBLOCK_OFFSET			0x400
- 
-+/* for s_flags */
-+#define EXT2_FLAGS_TEST_FILESYS			0x0004
-+
-+/* for s_feature_compat */
-+#define EXT3_FEATURE_COMPAT_HAS_JOURNAL		0x0004
-+
-+/* for s_feature_ro_compat */
-+#define EXT2_FEATURE_RO_COMPAT_SPARSE_SUPER	0x0001
-+#define EXT2_FEATURE_RO_COMPAT_LARGE_FILE	0x0002
-+#define EXT2_FEATURE_RO_COMPAT_BTREE_DIR	0x0004
-+#define EXT4_FEATURE_RO_COMPAT_HUGE_FILE	0x0008
-+#define EXT4_FEATURE_RO_COMPAT_GDT_CSUM		0x0010
-+#define EXT4_FEATURE_RO_COMPAT_DIR_NLINK	0x0020
-+#define EXT4_FEATURE_RO_COMPAT_EXTRA_ISIZE	0x0040
-+
-+/* for s_feature_incompat */
-+#define EXT2_FEATURE_INCOMPAT_FILETYPE		0x0002
-+#define EXT3_FEATURE_INCOMPAT_RECOVER		0x0004
-+#define EXT3_FEATURE_INCOMPAT_JOURNAL_DEV	0x0008
-+#define EXT2_FEATURE_INCOMPAT_META_BG		0x0010
-+#define EXT4_FEATURE_INCOMPAT_EXTENTS		0x0040 /* extents support */
-+#define EXT4_FEATURE_INCOMPAT_64BIT		0x0080
-+#define EXT4_FEATURE_INCOMPAT_MMP		0x0100
-+#define EXT4_FEATURE_INCOMPAT_FLEX_BG		0x0200
-+
-+#define EXT2_FEATURE_RO_COMPAT_SUPP	(EXT2_FEATURE_RO_COMPAT_SPARSE_SUPER| \
-+					 EXT2_FEATURE_RO_COMPAT_LARGE_FILE| \
-+					 EXT2_FEATURE_RO_COMPAT_BTREE_DIR)
-+#define EXT2_FEATURE_INCOMPAT_SUPP	(EXT2_FEATURE_INCOMPAT_FILETYPE| \
-+					 EXT2_FEATURE_INCOMPAT_META_BG)
-+#define EXT2_FEATURE_INCOMPAT_UNSUPPORTED	~EXT2_FEATURE_INCOMPAT_SUPP
-+#define EXT2_FEATURE_RO_COMPAT_UNSUPPORTED	~EXT2_FEATURE_RO_COMPAT_SUPP
-+
-+#define EXT3_FEATURE_RO_COMPAT_SUPP	(EXT2_FEATURE_RO_COMPAT_SPARSE_SUPER| \
-+					 EXT2_FEATURE_RO_COMPAT_LARGE_FILE| \
-+					 EXT2_FEATURE_RO_COMPAT_BTREE_DIR)
-+#define EXT3_FEATURE_INCOMPAT_SUPP	(EXT2_FEATURE_INCOMPAT_FILETYPE| \
-+					 EXT3_FEATURE_INCOMPAT_RECOVER| \
-+					 EXT2_FEATURE_INCOMPAT_META_BG)
-+#define EXT3_FEATURE_INCOMPAT_UNSUPPORTED	~EXT3_FEATURE_INCOMPAT_SUPP
-+#define EXT3_FEATURE_RO_COMPAT_UNSUPPORTED	~EXT3_FEATURE_RO_COMPAT_SUPP
-+
- int FAST_FUNC volume_id_probe_ext(struct volume_id *id /*,uint64_t off*/)
- {
- #define off ((uint64_t)0)
-@@ -66,11 +106,15 @@ int FAST_FUNC volume_id_probe_ext(struct
- 	dbg("ext: label '%s' uuid '%s'", id->label, id->uuid);
- 
- #if ENABLE_FEATURE_BLKID_TYPE
--	if ((le32_to_cpu(es->feature_compat) & EXT3_FEATURE_COMPAT_HAS_JOURNAL) != 0)
-+	if ((es->feature_ro_compat & cpu_to_le32(EXT4_FEATURE_RO_COMPAT_HUGE_FILE | EXT4_FEATURE_RO_COMPAT_DIR_NLINK))
-+	 || (es->feature_incompat & cpu_to_le32(EXT4_FEATURE_INCOMPAT_EXTENTS | EXT4_FEATURE_INCOMPAT_64BIT))
-+	) {
-+		id->type = "ext4";
-+	}
-+	else if (es->feature_compat & cpu_to_le32(EXT3_FEATURE_COMPAT_HAS_JOURNAL))
- 		id->type = "ext3";
- 	else
- 		id->type = "ext2";
- #endif
--
- 	return 0;
- }
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-find.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-find.patch
deleted file mode 100644
index f913cda..0000000
--- a/package/busybox/busybox-1.20.0/busybox-1.20.0-find.patch
+++ /dev/null
@@ -1,33 +0,0 @@
---- busybox-1.20.0/findutils/find.c
-+++ busybox-1.20.0-find/findutils/find.c
-@@ -831,6 +831,11 @@ static action*** parse_params(char **arg
- 	                        PARM_name      ,
- 	                        PARM_iname     ,
- 	IF_FEATURE_FIND_PATH(   PARM_path      ,)
-+#if ENABLE_DESKTOP
-+	/* -wholename is a synonym for -path */
-+	/* We support it because Linux kernel's "make tags" uses it */
-+	IF_FEATURE_FIND_PATH(   PARM_wholename ,)
-+#endif
- 	IF_FEATURE_FIND_PATH(   PARM_ipath     ,)
- 	IF_FEATURE_FIND_REGEX(  PARM_regex     ,)
- 	IF_FEATURE_FIND_TYPE(   PARM_type      ,)
-@@ -869,6 +874,9 @@ static action*** parse_params(char **arg
- 	                         "-name\0"
- 	                         "-iname\0"
- 	IF_FEATURE_FIND_PATH(   "-path\0"   )
-+#if ENABLE_DESKTOP
-+	IF_FEATURE_FIND_PATH(   "-wholename\0")
-+#endif
- 	IF_FEATURE_FIND_PATH(   "-ipath\0"  )
- 	IF_FEATURE_FIND_REGEX(  "-regex\0"  )
- 	IF_FEATURE_FIND_TYPE(   "-type\0"   )
-@@ -1076,7 +1084,7 @@ static action*** parse_params(char **arg
- 			ap->iname = (parm == PARM_iname);
- 		}
- #if ENABLE_FEATURE_FIND_PATH
--		else if (parm == PARM_path || parm == PARM_ipath) {
-+		else if (parm == PARM_path IF_DESKTOP(|| parm == PARM_wholename) || parm == PARM_ipath) {
- 			action_path *ap;
- 			dbg("%d", __LINE__);
- 			ap = ALLOC_ACTION(path);
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-getty.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-getty.patch
deleted file mode 100644
index ed52159..0000000
--- a/package/busybox/busybox-1.20.0/busybox-1.20.0-getty.patch
+++ /dev/null
@@ -1,17 +0,0 @@
---- busybox-1.20.0/loginutils/getty.c
-+++ busybox-1.20.0-getty/loginutils/getty.c
-@@ -561,8 +561,14 @@ int getty_main(int argc UNUSED_PARAM, ch
- 		 */
- 		fd = open("/dev/tty", O_RDWR | O_NONBLOCK);
- 		if (fd >= 0) {
-+			/* TIOCNOTTY sends SIGHUP to the foreground
-+			 * process group - which may include us!
-+			 * Make sure to not die on it:
-+			 */
-+			sighandler_t old = signal(SIGHUP, SIG_IGN);
- 			ioctl(fd, TIOCNOTTY);
- 			close(fd);
-+			signal(SIGHUP, old);
- 		}
- 	}
- 
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-lineedit.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-lineedit.patch
deleted file mode 100644
index ee236ff..0000000
--- a/package/busybox/busybox-1.20.0/busybox-1.20.0-lineedit.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- busybox-1.20.0/libbb/lineedit.c
-+++ busybox-1.20.0-lineedit/libbb/lineedit.c
-@@ -1352,8 +1352,7 @@ static void load_history(line_input_t *s
- 		/* fill temp_h[], retaining only last MAX_HISTORY lines */
- 		memset(temp_h, 0, sizeof(temp_h));
- 		idx = 0;
--		if (!ENABLE_FEATURE_EDITING_SAVE_ON_EXIT)
--			st_parm->cnt_history_in_file = 0;
-+		st_parm->cnt_history_in_file = 0;
- 		while ((line = xmalloc_fgetline(fp)) != NULL) {
- 			if (line[0] == '\0') {
- 				free(line);
-@@ -1361,8 +1360,7 @@ static void load_history(line_input_t *s
- 			}
- 			free(temp_h[idx]);
- 			temp_h[idx] = line;
--			if (!ENABLE_FEATURE_EDITING_SAVE_ON_EXIT)
--				st_parm->cnt_history_in_file++;
-+			st_parm->cnt_history_in_file++;
- 			idx++;
- 			if (idx == st_parm->max_history)
- 				idx = 0;
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-mdev.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-mdev.patch
deleted file mode 100644
index 8a36c53..0000000
--- a/package/busybox/busybox-1.20.0/busybox-1.20.0-mdev.patch
+++ /dev/null
@@ -1,72 +0,0 @@
---- busybox-1.20.0/util-linux/mdev.c
-+++ busybox-1.20.0-mdev/util-linux/mdev.c
-@@ -661,37 +661,45 @@ static int FAST_FUNC dirAction(const cha
- static void load_firmware(const char *firmware, const char *sysfs_path)
- {
- 	int cnt;
--	int firmware_fd, loading_fd, data_fd;
-+	int firmware_fd, loading_fd;
- 
- 	/* check for /lib/firmware/$FIRMWARE */
- 	xchdir("/lib/firmware");
--	firmware_fd = xopen(firmware, O_RDONLY);
--
--	/* in case we goto out ... */
--	data_fd = -1;
-+	firmware_fd = open(firmware, O_RDONLY); /* can fail */
- 
- 	/* check for /sys/$DEVPATH/loading ... give 30 seconds to appear */
- 	xchdir(sysfs_path);
- 	for (cnt = 0; cnt < 30; ++cnt) {
- 		loading_fd = open("loading", O_WRONLY);
--		if (loading_fd != -1)
-+		if (loading_fd >= 0)
- 			goto loading;
- 		sleep(1);
- 	}
- 	goto out;
- 
-  loading:
--	/* tell kernel we're loading by "echo 1 > /sys/$DEVPATH/loading" */
--	if (full_write(loading_fd, "1", 1) != 1)
--		goto out;
--
--	/* load firmware into /sys/$DEVPATH/data */
--	data_fd = open("data", O_WRONLY);
--	if (data_fd == -1)
--		goto out;
--	cnt = bb_copyfd_eof(firmware_fd, data_fd);
-+	cnt = 0;
-+	if (firmware_fd >= 0) {
-+		int data_fd;
-+
-+		/* tell kernel we're loading by "echo 1 > /sys/$DEVPATH/loading" */
-+		if (full_write(loading_fd, "1", 1) != 1)
-+			goto out;
-+
-+		/* load firmware into /sys/$DEVPATH/data */
-+		data_fd = open("data", O_WRONLY);
-+		if (data_fd < 0)
-+			goto out;
-+		cnt = bb_copyfd_eof(firmware_fd, data_fd);
-+		if (ENABLE_FEATURE_CLEAN_UP)
-+			close(data_fd);
-+	}
- 
--	/* tell kernel result by "echo [0|-1] > /sys/$DEVPATH/loading" */
-+	/* Tell kernel result by "echo [0|-1] > /sys/$DEVPATH/loading"
-+	 * Note: we emit -1 if firmware file wasn't found.
-+	 * There are cases when otherwise kernel would wait for minutes
-+	 * before timing out.
-+	 */
- 	if (cnt > 0)
- 		full_write(loading_fd, "0", 1);
- 	else
-@@ -701,7 +709,6 @@ static void load_firmware(const char *fi
- 	if (ENABLE_FEATURE_CLEAN_UP) {
- 		close(firmware_fd);
- 		close(loading_fd);
--		close(data_fd);
- 	}
- }
- 
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-sed.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-sed.patch
deleted file mode 100644
index 70dc63f..0000000
--- a/package/busybox/busybox-1.20.0/busybox-1.20.0-sed.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- busybox-1.20.0/editors/sed.c
-+++ busybox-1.20.0-sed/editors/sed.c
-@@ -743,7 +743,7 @@ static int do_subst_command(sed_cmd_t *s
- 		 */
- 		if (!G.regmatch[0].rm_so && !G.regmatch[0].rm_eo && match_count) {
- 			pipe_putc(*line++);
--			continue;
-+			goto next;
- 		}
- 
- 		match_count++;
-@@ -755,7 +755,7 @@ static int do_subst_command(sed_cmd_t *s
- 		) {
- 			for (i = 0; i < G.regmatch[0].rm_eo; i++)
- 				pipe_putc(*line++);
--			continue;
-+			goto next;
- 		}
- 
- 		/* print everything before the match */
-@@ -773,7 +773,7 @@ static int do_subst_command(sed_cmd_t *s
- 		/* if we're not doing this globally, get out now */
- 		if (sed_cmd->which_match != 0)
- 			break;
--
-+ next:
- 		if (*line == '\0')
- 			break;
- 
