From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Dec 2014 13:27:19 -0300
Subject: [Buildroot] [PATCH] f2fs-tools: add big-endian fixes/patches from
	upstream
Message-ID: <1419352039-9384-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/8f9/8f97186489134619de7086028a59523d528b0d51/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...tools-fix-for-build-big-endian-processors.patch | 95 ++++++++++++++++++++++
 ...sible-endianes-bug-in-mkfs.f2fs-roll-forw.patch | 81 ++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 package/f2fs-tools/0001-f2fs-tools-fix-for-build-big-endian-processors.patch
 create mode 100644 package/f2fs-tools/0002-mkfs.f2fs-possible-endianes-bug-in-mkfs.f2fs-roll-forw.patch

diff --git a/package/f2fs-tools/0001-f2fs-tools-fix-for-build-big-endian-processors.patch b/package/f2fs-tools/0001-f2fs-tools-fix-for-build-big-endian-processors.patch
new file mode 100644
index 0000000..e0c9233
--- /dev/null
+++ b/package/f2fs-tools/0001-f2fs-tools-fix-for-build-big-endian-processors.patch
@@ -0,0 +1,95 @@
+From f3a1ea9c7af493b873641fa4263e1b2101fc277b Mon Sep 17 00:00:00 2001
+From: Jaegeuk Kim <jaegeuk@kernel.org>
+Date: Mon, 22 Sep 2014 22:22:33 -0700
+Subject: [PATCH] f2fs-tools: fix for build big-endian processors
+
+This patch fixes build failure on big-endian systems.
+
+Reported-and-Tested-by: Jan Engelhardt <jengelh@inai.de>
+Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ include/f2fs_fs.h | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 60 insertions(+)
+
+diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
+index 6367e05..df37cdf 100644
+--- a/include/f2fs_fs.h
++++ b/include/f2fs_fs.h
+@@ -5,6 +5,9 @@
+  *             http://www.samsung.com/
+  *
+  * Dual licensed under the GPL or LGPL version 2 licenses.
++ *
++ * The byteswap codes are copied from:
++ *   samba_3_master/lib/ccan/endian/endian.h under LGPL 2.1
+  */
+ #ifndef __F2FS_FS_H__
+ #define __F2FS_FS_H__
+@@ -26,6 +29,63 @@ typedef u32		nid_t;
+ typedef u8		bool;
+ typedef unsigned long	pgoff_t;
+ 
++#if HAVE_BYTESWAP_H
++#include <byteswap.h>
++#else
++/**
++ * bswap_16 - reverse bytes in a uint16_t value.
++ * @val: value whose bytes to swap.
++ *
++ * Example:
++ *	// Output contains "1024 is 4 as two bytes reversed"
++ *	printf("1024 is %u as two bytes reversed\n", bswap_16(1024));
++ */
++static inline uint16_t bswap_16(uint16_t val)
++{
++	return ((val & (uint16_t)0x00ffU) << 8)
++		| ((val & (uint16_t)0xff00U) >> 8);
++}
++
++/**
++ * bswap_32 - reverse bytes in a uint32_t value.
++ * @val: value whose bytes to swap.
++ *
++ * Example:
++ *	// Output contains "1024 is 262144 as four bytes reversed"
++ *	printf("1024 is %u as four bytes reversed\n", bswap_32(1024));
++ */
++static inline uint32_t bswap_32(uint32_t val)
++{
++	return ((val & (uint32_t)0x000000ffUL) << 24)
++		| ((val & (uint32_t)0x0000ff00UL) <<  8)
++		| ((val & (uint32_t)0x00ff0000UL) >>  8)
++		| ((val & (uint32_t)0xff000000UL) >> 24);
++}
++#endif /* !HAVE_BYTESWAP_H */
++
++#if !HAVE_BSWAP_64
++/**
++ * bswap_64 - reverse bytes in a uint64_t value.
++ * @val: value whose bytes to swap.
++ *
++ * Example:
++ *	// Output contains "1024 is 1125899906842624 as eight bytes reversed"
++ *	printf("1024 is %llu as eight bytes reversed\n",
++ *		(unsigned long long)bswap_64(1024));
++ */
++static inline uint64_t bswap_64(uint64_t val)
++{
++	return ((val & (uint64_t)0x00000000000000ffULL) << 56)
++		| ((val & (uint64_t)0x000000000000ff00ULL) << 40)
++		| ((val & (uint64_t)0x0000000000ff0000ULL) << 24)
++		| ((val & (uint64_t)0x00000000ff000000ULL) <<  8)
++		| ((val & (uint64_t)0x000000ff00000000ULL) >>  8)
++		| ((val & (uint64_t)0x0000ff0000000000ULL) >> 24)
++		| ((val & (uint64_t)0x00ff000000000000ULL) >> 40)
++		| ((val & (uint64_t)0xff00000000000000ULL) >> 56);
++}
++#endif
++
+ #if __BYTE_ORDER == __LITTLE_ENDIAN
+ #define le16_to_cpu(x)	((__u16)(x))
+ #define le32_to_cpu(x)	((__u32)(x))
+-- 
+2.0.4
+
diff --git a/package/f2fs-tools/0002-mkfs.f2fs-possible-endianes-bug-in-mkfs.f2fs-roll-forw.patch b/package/f2fs-tools/0002-mkfs.f2fs-possible-endianes-bug-in-mkfs.f2fs-roll-forw.patch
new file mode 100644
index 0000000..a7c28fc
--- /dev/null
+++ b/package/f2fs-tools/0002-mkfs.f2fs-possible-endianes-bug-in-mkfs.f2fs-roll-forw.patch
@@ -0,0 +1,81 @@
+From fe067853b0945a2ae18004e0a58023694e0779b9 Mon Sep 17 00:00:00 2001
+From: joerg jungermann <jj@borkum.net>
+Date: Thu, 25 Sep 2014 22:05:12 -0700
+Subject: [PATCH] mkfs.f2fs: possible endianes bug in mkfs.f2fs roll-forward
+ speed
+
+I might found a bug in mkfs.f2fs. while experimenting with f2fs on my big
+endian MIPS32 device (platform lantiq, 14.07-rc3, uclibc).
+
+I ran into an issue that mkfs.f2fs, was not able to format block devices if I
+did not specify the sector count manually.
+
+I hunted it down to lib/libf2fs.c.
+After I found that the detected sector count equals to the wanted sector count
+shifted left (32+9) times.
+
+I found two issues:
+Firstly it uses ioctl BLKGETSIZE, which writes to an uint32_t the size of the
+device.
+As c->total_sectors is of type uint64_t, the value is written in to the first
+4 bytes.
+That explained the left shift of 32 bits.
+
+Secondly BLKGETSIZE determines the size of the device in bytes (AFAIK, learned
+by observation).
+In the first branch of the if-block patched below, the c->total_sectors is
+calculated by
+  c->total_sectors = stat_buf.st_size / c->sector_size;
+The else branch omits the devision. sector_sice is mostly 512, that explained
+the left shift by 9 bytes.
+
+ * fixes sector count calculation
+ * uses BLKGETSIZE64 if avail
+
+Signed-off-by: joerg jungermann <jj@borkum.net>
+Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ lib/libf2fs.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/lib/libf2fs.c b/lib/libf2fs.c
+index 01ef4e9..73c551b 100644
+--- a/lib/libf2fs.c
++++ b/lib/libf2fs.c
+@@ -422,6 +422,9 @@ int f2fs_get_device_info(struct f2fs_configuration *c)
+ {
+ 	int32_t fd = 0;
+ 	uint32_t sector_size;
++#ifndef BLKGETSIZE64
++	uint32_t total_sectors;
++#endif
+ 	struct stat stat_buf;
+ 	struct hd_geometry geom;
+ 	u_int64_t wanted_total_sectors = c->total_sectors;
+@@ -454,11 +457,20 @@ int f2fs_get_device_info(struct f2fs_configuration *c)
+ 			}
+ 		}
+ 
+-		if (ioctl(fd, BLKGETSIZE, &c->total_sectors) < 0) {
++#ifdef BLKGETSIZE64
++		if (ioctl(fd, BLKGETSIZE64, &c->total_sectors) < 0) {
+ 			MSG(0, "\tError: Cannot get the device size\n");
+ 			return -1;
+ 		}
+-
++		c->total_sectors /= c->sector_size;
++#else
++		if (ioctl(fd, BLKGETSIZE, &total_sectors) < 0) {
++			MSG(0, "\tError: Cannot get the device size\n");
++			return -1;
++		}
++		total_sectors /= c->sector_size;
++		c->total_sectors = total_sectors;
++#endif
+ 		if (ioctl(fd, HDIO_GETGEO, &geom) < 0)
+ 			c->start_sector = 0;
+ 		else
+-- 
+2.0.4
+
-- 
2.0.4
