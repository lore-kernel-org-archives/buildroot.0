From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Jun 2012 11:19:49 -0300
Subject: [Buildroot] [PATCH 2/3] busybox 1.20.1: add patches for mke2fs and
	ps
In-Reply-To: <1340720390-22117-1-git-send-email-gustavo@zacarias.com.ar>
References: <1340720390-22117-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1340720390-22117-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../busybox-1.20.1/busybox-1.20.1-mke2fs.patch     |   58 ++++++++++++++
 .../busybox/busybox-1.20.1/busybox-1.20.1-ps.patch |   84 ++++++++++++++++++++
 2 files changed, 142 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.20.1/busybox-1.20.1-mke2fs.patch
 create mode 100644 package/busybox/busybox-1.20.1/busybox-1.20.1-ps.patch

diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-mke2fs.patch b/package/busybox/busybox-1.20.1/busybox-1.20.1-mke2fs.patch
new file mode 100644
index 0000000..659ae2d
--- /dev/null
+++ b/package/busybox/busybox-1.20.1/busybox-1.20.1-mke2fs.patch
@@ -0,0 +1,58 @@
+--- busybox-1.20.1/include/bb_e2fs_defs.h
++++ busybox-1.20.1-mke2fs/include/bb_e2fs_defs.h
+@@ -422,9 +422,27 @@ struct ext2_super_block {
+ 	uint16_t	s_reserved_word_pad;
+ 	uint32_t	s_default_mount_opts;
+ 	uint32_t	s_first_meta_bg;	/* First metablock group */
++	/* ext3 additions */
+ 	uint32_t	s_mkfs_time;		/* When the filesystem was created */
+ 	uint32_t	s_jnl_blocks[17];	/* Backup of the journal inode */
+-	uint32_t	s_reserved[172];	/* Padding to the end of the block */
++	/* 64bit support valid if EXT4_FEATURE_COMPAT_64BIT */
++/*150*/	uint32_t	s_blocks_count_hi;	/* Blocks count */
++	uint32_t	s_r_blocks_count_hi;	/* Reserved blocks count */
++	uint32_t	s_free_blocks_count_hi;	/* Free blocks count */
++	uint16_t	s_min_extra_isize;	/* All inodes have at least # bytes */
++	uint16_t	s_want_extra_isize; 	/* New inodes should reserve # bytes */
++	uint32_t	s_flags;		/* Miscellaneous flags */
++	uint16_t	s_raid_stride;		/* RAID stride */
++	uint16_t	s_mmp_interval;		/* # seconds to wait in MMP checking */
++	uint64_t	s_mmp_block;		/* Block for multi-mount protection */
++	uint32_t	s_raid_stripe_width;	/* blocks on all data disks (N*stride)*/
++	uint8_t		s_log_groups_per_flex;	/* FLEX_BG group size */
++	uint8_t		s_reserved_char_pad2;
++	uint16_t	s_reserved_pad;
++	uint32_t	s_reserved[162];	/* Padding to the end of the block */
++};
++struct BUG_ext2_super_block {
++        char bug[sizeof(struct ext2_super_block) == 1024 ? 1 : -1];
+ };
+ 
+ /*
+--- busybox-1.20.1/util-linux/mkfs_ext2.c
++++ busybox-1.20.1-mke2fs/util-linux/mkfs_ext2.c
+@@ -53,11 +53,6 @@
+ #define ENABLE_FEATURE_MKFS_EXT2_RESERVED_GDT 0
+ #define ENABLE_FEATURE_MKFS_EXT2_DIR_INDEX    1
+ 
+-// from e2fsprogs
+-#define s_reserved_gdt_blocks s_padding1
+-#define s_mkfs_time           s_reserved[0]
+-#define s_flags               s_reserved[22]
+-
+ #define EXT2_HASH_HALF_MD4       1
+ #define EXT2_FLAGS_SIGNED_HASH   0x0001
+ #define EXT2_FLAGS_UNSIGNED_HASH 0x0002
+@@ -482,8 +477,10 @@ int mkfs_ext2_main(int argc UNUSED_PARAM
+ 	STORE_LE(sb->s_magic, EXT2_SUPER_MAGIC);
+ 	STORE_LE(sb->s_inode_size, inodesize);
+ 	// set "Required extra isize" and "Desired extra isize" fields to 28
+-	if (inodesize != sizeof(*inode))
+-		STORE_LE(sb->s_reserved[21], 0x001C001C);
++	if (inodesize != sizeof(*inode)) {
++		STORE_LE(sb->s_min_extra_isize, 0x001c);
++		STORE_LE(sb->s_want_extra_isize, 0x001c);
++	}
+ 	STORE_LE(sb->s_first_ino, EXT2_GOOD_OLD_FIRST_INO);
+ 	STORE_LE(sb->s_log_block_size, blocksize_log2 - EXT2_MIN_BLOCK_LOG_SIZE);
+ 	STORE_LE(sb->s_log_frag_size, blocksize_log2 - EXT2_MIN_BLOCK_LOG_SIZE);
diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-ps.patch b/package/busybox/busybox-1.20.1/busybox-1.20.1-ps.patch
new file mode 100644
index 0000000..c8e329e
--- /dev/null
+++ b/package/busybox/busybox-1.20.1/busybox-1.20.1-ps.patch
@@ -0,0 +1,84 @@
+--- busybox-1.20.1/procps/ps.c
++++ busybox-1.20.1-ps/procps/ps.c
+@@ -69,6 +69,31 @@
+ /* Absolute maximum on output line length */
+ enum { MAX_WIDTH = 2*1024 };
+ 
++#if ENABLE_FEATURE_PS_TIME || ENABLE_FEATURE_PS_LONG
++static long get_uptime(void)
++{
++#ifdef __linux__
++	struct sysinfo info;
++	if (sysinfo(&info) < 0)
++		return 0;
++	return info.uptime;
++#elif 1
++	char buf[64];
++	long uptime;
++	if (open_read_close("/proc/uptime", buf, sizeof(buf)) <= 0)
++		bb_perror_msg_and_die("can't read %s", "/proc/uptime");
++	buf[sizeof(buf)-1] = '\0';
++	sscanf(buf, "%l", &uptime);
++	return uptime;
++#else
++	struct timespec ts;
++	if (clock_gettime(CLOCK_MONOTONIC, &ts) < 0)
++		return 0;
++	return ts.tv_sec;
++#endif
++}
++#endif
++
+ #if ENABLE_DESKTOP
+ 
+ #include <sys/times.h> /* for times() */
+@@ -197,8 +222,6 @@ static inline unsigned get_HZ_by_waiting
+ 
+ static unsigned get_kernel_HZ(void)
+ {
+-	//char buf[64];
+-	struct sysinfo info;
+ 
+ 	if (kernel_HZ)
+ 		return kernel_HZ;
+@@ -208,12 +231,7 @@ static unsigned get_kernel_HZ(void)
+ 	if (kernel_HZ == (unsigned)-1)
+ 		kernel_HZ = get_HZ_by_waiting();
+ 
+-	//if (open_read_close("/proc/uptime", buf, sizeof(buf)) <= 0)
+-	//	bb_perror_msg_and_die("can't read %s", "/proc/uptime");
+-	//buf[sizeof(buf)-1] = '\0';
+-	///sscanf(buf, "%llu", &seconds_since_boot);
+-	sysinfo(&info);
+-	seconds_since_boot = info.uptime;
++	seconds_since_boot = get_uptime();
+ 
+ 	return kernel_HZ;
+ }
+@@ -635,7 +653,7 @@ int ps_main(int argc UNUSED_PARAM, char 
+ 	};
+ #if ENABLE_FEATURE_PS_LONG
+ 	time_t now = now;
+-	struct sysinfo info;
++	long uptime;
+ #endif
+ 	int opts = 0;
+ 	/* If we support any options, parse argv */
+@@ -695,7 +713,7 @@ int ps_main(int argc UNUSED_PARAM, char 
+ 		puts("S   UID   PID  PPID   VSZ   RSS TTY   STIME TIME     CMD");
+ #if ENABLE_FEATURE_PS_LONG
+ 		now = time(NULL);
+-		sysinfo(&info);
++		uptime = get_uptime();
+ #endif
+ 	}
+ 	else {
+@@ -727,7 +745,7 @@ int ps_main(int argc UNUSED_PARAM, char 
+ 				char tty[2 * sizeof(int)*3 + 2];
+ 				char *endp;
+ 				unsigned sut = (p->stime + p->utime) / 100;
+-				unsigned elapsed = info.uptime - (p->start_time / 100);
++				unsigned elapsed = uptime - (p->start_time / 100);
+ 				time_t start = now - elapsed;
+ 				struct tm *tm = localtime(&start);
+ 
-- 
1.7.3.4
