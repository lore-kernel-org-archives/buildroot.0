From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Jul 2012 14:04:44 -0300
Subject: [Buildroot] [PATCH] busybox: bump 1.20.x series to 1.20.2
Message-ID: <1341248684-18265-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/Config.in                          |    2 +-
 .../busybox-1.20.1/busybox-1.20.1-ash.patch        |   12 ---
 .../busybox-1.20.1/busybox-1.20.1-ifupdown.patch   |   75 -----------------
 .../busybox-1.20.1/busybox-1.20.1-man.patch        |   34 --------
 .../busybox-1.20.1/busybox-1.20.1-mke2fs.patch     |   58 --------------
 .../busybox/busybox-1.20.1/busybox-1.20.1-ps.patch |   84 --------------------
 .../busybox-1.20.1/busybox-1.20.1-tar.patch        |   11 ---
 7 files changed, 1 insertions(+), 275 deletions(-)
 delete mode 100644 package/busybox/busybox-1.20.1/busybox-1.20.1-ash.patch
 delete mode 100644 package/busybox/busybox-1.20.1/busybox-1.20.1-ifupdown.patch
 delete mode 100644 package/busybox/busybox-1.20.1/busybox-1.20.1-man.patch
 delete mode 100644 package/busybox/busybox-1.20.1/busybox-1.20.1-mke2fs.patch
 delete mode 100644 package/busybox/busybox-1.20.1/busybox-1.20.1-ps.patch
 delete mode 100644 package/busybox/busybox-1.20.1/busybox-1.20.1-tar.patch

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index a078644..dedcf18 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -36,7 +36,7 @@ config BR2_BUSYBOX_VERSION
 	string
 	default "1.18.5"	if BR2_BUSYBOX_VERSION_1_18_X
 	default "1.19.4"	if BR2_BUSYBOX_VERSION_1_19_X
-	default "1.20.1"	if BR2_BUSYBOX_VERSION_1_20_X
+	default "1.20.2"	if BR2_BUSYBOX_VERSION_1_20_X
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-ash.patch b/package/busybox/busybox-1.20.1/busybox-1.20.1-ash.patch
deleted file mode 100644
index a012a70..0000000
--- a/package/busybox/busybox-1.20.1/busybox-1.20.1-ash.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- busybox-1.20.1/shell/ash.c
-+++ busybox-1.20.1-ash/shell/ash.c
-@@ -6846,8 +6846,7 @@ evalvar(char *p, int flags, struct strli
- 		patloc = expdest - (char *)stackblock();
- 		if (NULL == subevalvar(p, /* varname: */ NULL, patloc, subtype,
- 				startloc, varflags,
--//TODO: | EXP_REDIR too? All other such places do it too
--				/* quotes: */ flags & (EXP_FULL | EXP_CASE),
-+				/* quotes: */ flags & (EXP_FULL | EXP_CASE | EXP_REDIR),
- 				var_str_list)
- 		) {
- 			int amount = expdest - (
diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-ifupdown.patch b/package/busybox/busybox-1.20.1/busybox-1.20.1-ifupdown.patch
deleted file mode 100644
index b2a9456..0000000
--- a/package/busybox/busybox-1.20.1/busybox-1.20.1-ifupdown.patch
+++ /dev/null
@@ -1,75 +0,0 @@
---- busybox-1.20.1/networking/ifupdown.c
-+++ busybox-1.20.1-ifupdown/networking/ifupdown.c
-@@ -140,8 +140,6 @@ static const char keywords_up_down[] ALI
- 	"up\0"
- 	"down\0"
- 	"pre-up\0"
--	"pre-down\0"
--	"post-up\0"
- 	"post-down\0"
- ;
- 
-@@ -895,6 +893,11 @@ static struct interfaces_file_t *read_in
- 				if (rest_of_line[0] == '\0')
- 					bb_error_msg_and_die("option with empty value \"%s\"", buf);
- 
-+				if (strcmp(first_word, "post-up") == 0)
-+					first_word += 5; /* "up" */
-+				else if (strcmp(first_word, "pre-down") == 0)
-+					first_word += 4; /* "down" */
-+
- 				/* If not one of "up", "down",... words... */
- 				if (index_in_strings(keywords_up_down, first_word) < 0) {
- 					int i;
-@@ -963,7 +966,7 @@ static char *setlocalenv(const char *for
- 	return result;
- }
- 
--static void set_environ(struct interface_defn_t *iface, const char *mode)
-+static void set_environ(struct interface_defn_t *iface, const char *mode, const char *opt)
- {
- 	int i;
- 	char **pp;
-@@ -976,7 +979,7 @@ static void set_environ(struct interface
- 	}
- 
- 	/* note: last element will stay NULL: */
--	G.my_environ = xzalloc(sizeof(char *) * (iface->n_options + 6));
-+	G.my_environ = xzalloc(sizeof(char *) * (iface->n_options + 7));
- 	pp = G.my_environ;
- 
- 	for (i = 0; i < iface->n_options; i++) {
-@@ -990,6 +993,7 @@ static void set_environ(struct interface
- 	*pp++ = setlocalenv("%s=%s", "ADDRFAM", iface->address_family->name);
- 	*pp++ = setlocalenv("%s=%s", "METHOD", iface->method->name);
- 	*pp++ = setlocalenv("%s=%s", "MODE", mode);
-+	*pp++ = setlocalenv("%s=%s", "PHASE", opt);
- 	if (G.startup_PATH)
- 		*pp++ = setlocalenv("%s=%s", "PATH", G.startup_PATH);
- }
-@@ -1044,21 +1048,21 @@ static int check(char *str)
- static int iface_up(struct interface_defn_t *iface)
- {
- 	if (!iface->method->up(iface, check)) return -1;
--	set_environ(iface, "start");
-+	set_environ(iface, "start", "pre-up");
- 	if (!execute_all(iface, "pre-up")) return 0;
- 	if (!iface->method->up(iface, doit)) return 0;
-+	set_environ(iface, "start", "post-up");
- 	if (!execute_all(iface, "up")) return 0;
--	if (!execute_all(iface, "post-up")) return 0;
- 	return 1;
- }
- 
- static int iface_down(struct interface_defn_t *iface)
- {
- 	if (!iface->method->down(iface,check)) return -1;
--	set_environ(iface, "stop");
--	if (!execute_all(iface, "pre-down")) return 0;
-+	set_environ(iface, "stop", "pre-down");
- 	if (!execute_all(iface, "down")) return 0;
- 	if (!iface->method->down(iface, doit)) return 0;
-+	set_environ(iface, "stop", "post-down");
- 	if (!execute_all(iface, "post-down")) return 0;
- 	return 1;
- }
diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-man.patch b/package/busybox/busybox-1.20.1/busybox-1.20.1-man.patch
deleted file mode 100644
index f382e07..0000000
--- a/package/busybox/busybox-1.20.1/busybox-1.20.1-man.patch
+++ /dev/null
@@ -1,34 +0,0 @@
---- busybox-1.20.1/miscutils/man.c
-+++ busybox-1.20.1-man/miscutils/man.c
-@@ -129,27 +129,21 @@ static int show_manpage(const char *page
- #endif
- #if ENABLE_FEATURE_SEAMLESS_XZ
- 	strcpy(ext, "xz");
--	if (run_pipe(pager, man_filename, man, level))
-+	if (run_pipe(pager, filename_with_zext, man, level))
- 		return 1;
- #endif
- #if ENABLE_FEATURE_SEAMLESS_BZ2
- 	strcpy(ext, "bz2");
--	if (run_pipe(pager, man_filename, man, level))
-+	if (run_pipe(pager, filename_with_zext, man, level))
- 		return 1;
- #endif
- #if ENABLE_FEATURE_SEAMLESS_GZ
- 	strcpy(ext, "gz");
--	if (run_pipe(pager, man_filename, man, level))
-+	if (run_pipe(pager, filename_with_zext, man, level))
- 		return 1;
- #endif
- 
--#if SEAMLESS_COMPRESSION
--	ext[-1] = '\0';
--#endif
--	if (run_pipe(pager, man_filename, man, level))
--		return 1;
--
--	return 0;
-+	return run_pipe(pager, man_filename, man, level);
- }
- 
- int man_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-mke2fs.patch b/package/busybox/busybox-1.20.1/busybox-1.20.1-mke2fs.patch
deleted file mode 100644
index 659ae2d..0000000
--- a/package/busybox/busybox-1.20.1/busybox-1.20.1-mke2fs.patch
+++ /dev/null
@@ -1,58 +0,0 @@
---- busybox-1.20.1/include/bb_e2fs_defs.h
-+++ busybox-1.20.1-mke2fs/include/bb_e2fs_defs.h
-@@ -422,9 +422,27 @@ struct ext2_super_block {
- 	uint16_t	s_reserved_word_pad;
- 	uint32_t	s_default_mount_opts;
- 	uint32_t	s_first_meta_bg;	/* First metablock group */
-+	/* ext3 additions */
- 	uint32_t	s_mkfs_time;		/* When the filesystem was created */
- 	uint32_t	s_jnl_blocks[17];	/* Backup of the journal inode */
--	uint32_t	s_reserved[172];	/* Padding to the end of the block */
-+	/* 64bit support valid if EXT4_FEATURE_COMPAT_64BIT */
-+/*150*/	uint32_t	s_blocks_count_hi;	/* Blocks count */
-+	uint32_t	s_r_blocks_count_hi;	/* Reserved blocks count */
-+	uint32_t	s_free_blocks_count_hi;	/* Free blocks count */
-+	uint16_t	s_min_extra_isize;	/* All inodes have at least # bytes */
-+	uint16_t	s_want_extra_isize; 	/* New inodes should reserve # bytes */
-+	uint32_t	s_flags;		/* Miscellaneous flags */
-+	uint16_t	s_raid_stride;		/* RAID stride */
-+	uint16_t	s_mmp_interval;		/* # seconds to wait in MMP checking */
-+	uint64_t	s_mmp_block;		/* Block for multi-mount protection */
-+	uint32_t	s_raid_stripe_width;	/* blocks on all data disks (N*stride)*/
-+	uint8_t		s_log_groups_per_flex;	/* FLEX_BG group size */
-+	uint8_t		s_reserved_char_pad2;
-+	uint16_t	s_reserved_pad;
-+	uint32_t	s_reserved[162];	/* Padding to the end of the block */
-+};
-+struct BUG_ext2_super_block {
-+        char bug[sizeof(struct ext2_super_block) == 1024 ? 1 : -1];
- };
- 
- /*
---- busybox-1.20.1/util-linux/mkfs_ext2.c
-+++ busybox-1.20.1-mke2fs/util-linux/mkfs_ext2.c
-@@ -53,11 +53,6 @@
- #define ENABLE_FEATURE_MKFS_EXT2_RESERVED_GDT 0
- #define ENABLE_FEATURE_MKFS_EXT2_DIR_INDEX    1
- 
--// from e2fsprogs
--#define s_reserved_gdt_blocks s_padding1
--#define s_mkfs_time           s_reserved[0]
--#define s_flags               s_reserved[22]
--
- #define EXT2_HASH_HALF_MD4       1
- #define EXT2_FLAGS_SIGNED_HASH   0x0001
- #define EXT2_FLAGS_UNSIGNED_HASH 0x0002
-@@ -482,8 +477,10 @@ int mkfs_ext2_main(int argc UNUSED_PARAM
- 	STORE_LE(sb->s_magic, EXT2_SUPER_MAGIC);
- 	STORE_LE(sb->s_inode_size, inodesize);
- 	// set "Required extra isize" and "Desired extra isize" fields to 28
--	if (inodesize != sizeof(*inode))
--		STORE_LE(sb->s_reserved[21], 0x001C001C);
-+	if (inodesize != sizeof(*inode)) {
-+		STORE_LE(sb->s_min_extra_isize, 0x001c);
-+		STORE_LE(sb->s_want_extra_isize, 0x001c);
-+	}
- 	STORE_LE(sb->s_first_ino, EXT2_GOOD_OLD_FIRST_INO);
- 	STORE_LE(sb->s_log_block_size, blocksize_log2 - EXT2_MIN_BLOCK_LOG_SIZE);
- 	STORE_LE(sb->s_log_frag_size, blocksize_log2 - EXT2_MIN_BLOCK_LOG_SIZE);
diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-ps.patch b/package/busybox/busybox-1.20.1/busybox-1.20.1-ps.patch
deleted file mode 100644
index c8e329e..0000000
--- a/package/busybox/busybox-1.20.1/busybox-1.20.1-ps.patch
+++ /dev/null
@@ -1,84 +0,0 @@
---- busybox-1.20.1/procps/ps.c
-+++ busybox-1.20.1-ps/procps/ps.c
-@@ -69,6 +69,31 @@
- /* Absolute maximum on output line length */
- enum { MAX_WIDTH = 2*1024 };
- 
-+#if ENABLE_FEATURE_PS_TIME || ENABLE_FEATURE_PS_LONG
-+static long get_uptime(void)
-+{
-+#ifdef __linux__
-+	struct sysinfo info;
-+	if (sysinfo(&info) < 0)
-+		return 0;
-+	return info.uptime;
-+#elif 1
-+	char buf[64];
-+	long uptime;
-+	if (open_read_close("/proc/uptime", buf, sizeof(buf)) <= 0)
-+		bb_perror_msg_and_die("can't read %s", "/proc/uptime");
-+	buf[sizeof(buf)-1] = '\0';
-+	sscanf(buf, "%l", &uptime);
-+	return uptime;
-+#else
-+	struct timespec ts;
-+	if (clock_gettime(CLOCK_MONOTONIC, &ts) < 0)
-+		return 0;
-+	return ts.tv_sec;
-+#endif
-+}
-+#endif
-+
- #if ENABLE_DESKTOP
- 
- #include <sys/times.h> /* for times() */
-@@ -197,8 +222,6 @@ static inline unsigned get_HZ_by_waiting
- 
- static unsigned get_kernel_HZ(void)
- {
--	//char buf[64];
--	struct sysinfo info;
- 
- 	if (kernel_HZ)
- 		return kernel_HZ;
-@@ -208,12 +231,7 @@ static unsigned get_kernel_HZ(void)
- 	if (kernel_HZ == (unsigned)-1)
- 		kernel_HZ = get_HZ_by_waiting();
- 
--	//if (open_read_close("/proc/uptime", buf, sizeof(buf)) <= 0)
--	//	bb_perror_msg_and_die("can't read %s", "/proc/uptime");
--	//buf[sizeof(buf)-1] = '\0';
--	///sscanf(buf, "%llu", &seconds_since_boot);
--	sysinfo(&info);
--	seconds_since_boot = info.uptime;
-+	seconds_since_boot = get_uptime();
- 
- 	return kernel_HZ;
- }
-@@ -635,7 +653,7 @@ int ps_main(int argc UNUSED_PARAM, char 
- 	};
- #if ENABLE_FEATURE_PS_LONG
- 	time_t now = now;
--	struct sysinfo info;
-+	long uptime;
- #endif
- 	int opts = 0;
- 	/* If we support any options, parse argv */
-@@ -695,7 +713,7 @@ int ps_main(int argc UNUSED_PARAM, char 
- 		puts("S   UID   PID  PPID   VSZ   RSS TTY   STIME TIME     CMD");
- #if ENABLE_FEATURE_PS_LONG
- 		now = time(NULL);
--		sysinfo(&info);
-+		uptime = get_uptime();
- #endif
- 	}
- 	else {
-@@ -727,7 +745,7 @@ int ps_main(int argc UNUSED_PARAM, char 
- 				char tty[2 * sizeof(int)*3 + 2];
- 				char *endp;
- 				unsigned sut = (p->stime + p->utime) / 100;
--				unsigned elapsed = info.uptime - (p->start_time / 100);
-+				unsigned elapsed = uptime - (p->start_time / 100);
- 				time_t start = now - elapsed;
- 				struct tm *tm = localtime(&start);
- 
diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-tar.patch b/package/busybox/busybox-1.20.1/busybox-1.20.1-tar.patch
deleted file mode 100644
index 4129b65..0000000
--- a/package/busybox/busybox-1.20.1/busybox-1.20.1-tar.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- busybox-1.20.1/archival/libarchive/get_header_tar.c
-+++ busybox-1.20.1-tar/archival/libarchive/get_header_tar.c
-@@ -84,7 +84,7 @@ static unsigned long long getOctal(char 
- 		first >>= 1; /* now 7th bit = 6th bit */
- 		v = first;   /* sign-extend 8 bits to 64 */
- 		while (--len != 0)
--			v = (v << 8) + (unsigned char) *str++;
-+			v = (v << 8) + (uint8_t) *++str;
- 	}
- 	return v;
- }
-- 
1.7.8.6
