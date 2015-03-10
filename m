From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Mar 2015 15:19:38 -0300
Subject: [Buildroot] [PATCH] f2fs-tools: bump to version 1.4.1
Message-ID: <1426011578-21977-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And drop the old patches, they're upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-configure-add-check-for-fallocate.patch   | 44 ++++++++++
 ...tools-fix-for-build-big-endian-processors.patch | 95 ----------------------
 ...sible-endianes-bug-in-mkfs.f2fs-roll-forw.patch | 81 ------------------
 ...3-mkfs.f2fs-fix-missing-endian-conversion.patch | 42 ----------
 .../0004-configure-also-check-for-byteswap.h.patch | 35 --------
 .../0005-configure-add-check-for-bswap_64.patch    | 50 ------------
 package/f2fs-tools/f2fs-tools.mk                   |  2 +-
 7 files changed, 45 insertions(+), 304 deletions(-)
 create mode 100644 package/f2fs-tools/0001-configure-add-check-for-fallocate.patch
 delete mode 100644 package/f2fs-tools/0001-f2fs-tools-fix-for-build-big-endian-processors.patch
 delete mode 100644 package/f2fs-tools/0002-mkfs.f2fs-possible-endianes-bug-in-mkfs.f2fs-roll-forw.patch
 delete mode 100644 package/f2fs-tools/0003-mkfs.f2fs-fix-missing-endian-conversion.patch
 delete mode 100644 package/f2fs-tools/0004-configure-also-check-for-byteswap.h.patch
 delete mode 100644 package/f2fs-tools/0005-configure-add-check-for-bswap_64.patch

diff --git a/package/f2fs-tools/0001-configure-add-check-for-fallocate.patch b/package/f2fs-tools/0001-configure-add-check-for-fallocate.patch
new file mode 100644
index 0000000..7da3809
--- /dev/null
+++ b/package/f2fs-tools/0001-configure-add-check-for-fallocate.patch
@@ -0,0 +1,44 @@
+From c23b371d55c6b8553be209494f71d4abe952887d Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Mar 2015 15:10:35 -0300
+Subject: [PATCH] configure: add check for fallocate
+
+We need to check for fallocate() rather than just linux/falloc.h +
+FALLOC_FL_PUNCH_HOLE since in uClibc we've got both but still not
+fallocate() itself since it's only implemented in newer unreleased
+versions.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac             | 1 +
+ mkfs/f2fs_format_utils.c | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ae451b8..900b84a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -68,6 +68,7 @@ AC_TYPE_SIZE_T
+ # Checks for library functions.
+ AC_FUNC_GETMNTENT
+ AC_CHECK_FUNCS_ONCE([
++	fallocate
+ 	getmntent
+ 	memset
+ ])
+diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
+index a0f85f5..ee48411 100644
+--- a/mkfs/f2fs_format_utils.c
++++ b/mkfs/f2fs_format_utils.c
+@@ -46,7 +46,7 @@ int f2fs_trim_device()
+ #if defined(WITH_BLKDISCARD) && defined(BLKDISCARD)
+ 	MSG(0, "Info: Discarding device\n");
+ 	if (S_ISREG(stat_buf.st_mode)) {
+-#ifdef FALLOC_FL_PUNCH_HOLE
++#ifdef HAVE_FALLOCATE
+ 		if (fallocate(config.fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+ 				range[0], range[1]) < 0) {
+ 			MSG(0, "Info: fallocate(PUNCH_HOLE|KEEP_SIZE) is failed\n");
+-- 
+2.0.5
+
diff --git a/package/f2fs-tools/0001-f2fs-tools-fix-for-build-big-endian-processors.patch b/package/f2fs-tools/0001-f2fs-tools-fix-for-build-big-endian-processors.patch
deleted file mode 100644
index e0c9233..0000000
--- a/package/f2fs-tools/0001-f2fs-tools-fix-for-build-big-endian-processors.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From f3a1ea9c7af493b873641fa4263e1b2101fc277b Mon Sep 17 00:00:00 2001
-From: Jaegeuk Kim <jaegeuk@kernel.org>
-Date: Mon, 22 Sep 2014 22:22:33 -0700
-Subject: [PATCH] f2fs-tools: fix for build big-endian processors
-
-This patch fixes build failure on big-endian systems.
-
-Reported-and-Tested-by: Jan Engelhardt <jengelh@inai.de>
-Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- include/f2fs_fs.h | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 60 insertions(+)
-
-diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
-index 6367e05..df37cdf 100644
---- a/include/f2fs_fs.h
-+++ b/include/f2fs_fs.h
-@@ -5,6 +5,9 @@
-  *             http://www.samsung.com/
-  *
-  * Dual licensed under the GPL or LGPL version 2 licenses.
-+ *
-+ * The byteswap codes are copied from:
-+ *   samba_3_master/lib/ccan/endian/endian.h under LGPL 2.1
-  */
- #ifndef __F2FS_FS_H__
- #define __F2FS_FS_H__
-@@ -26,6 +29,63 @@ typedef u32		nid_t;
- typedef u8		bool;
- typedef unsigned long	pgoff_t;
- 
-+#if HAVE_BYTESWAP_H
-+#include <byteswap.h>
-+#else
-+/**
-+ * bswap_16 - reverse bytes in a uint16_t value.
-+ * @val: value whose bytes to swap.
-+ *
-+ * Example:
-+ *	// Output contains "1024 is 4 as two bytes reversed"
-+ *	printf("1024 is %u as two bytes reversed\n", bswap_16(1024));
-+ */
-+static inline uint16_t bswap_16(uint16_t val)
-+{
-+	return ((val & (uint16_t)0x00ffU) << 8)
-+		| ((val & (uint16_t)0xff00U) >> 8);
-+}
-+
-+/**
-+ * bswap_32 - reverse bytes in a uint32_t value.
-+ * @val: value whose bytes to swap.
-+ *
-+ * Example:
-+ *	// Output contains "1024 is 262144 as four bytes reversed"
-+ *	printf("1024 is %u as four bytes reversed\n", bswap_32(1024));
-+ */
-+static inline uint32_t bswap_32(uint32_t val)
-+{
-+	return ((val & (uint32_t)0x000000ffUL) << 24)
-+		| ((val & (uint32_t)0x0000ff00UL) <<  8)
-+		| ((val & (uint32_t)0x00ff0000UL) >>  8)
-+		| ((val & (uint32_t)0xff000000UL) >> 24);
-+}
-+#endif /* !HAVE_BYTESWAP_H */
-+
-+#if !HAVE_BSWAP_64
-+/**
-+ * bswap_64 - reverse bytes in a uint64_t value.
-+ * @val: value whose bytes to swap.
-+ *
-+ * Example:
-+ *	// Output contains "1024 is 1125899906842624 as eight bytes reversed"
-+ *	printf("1024 is %llu as eight bytes reversed\n",
-+ *		(unsigned long long)bswap_64(1024));
-+ */
-+static inline uint64_t bswap_64(uint64_t val)
-+{
-+	return ((val & (uint64_t)0x00000000000000ffULL) << 56)
-+		| ((val & (uint64_t)0x000000000000ff00ULL) << 40)
-+		| ((val & (uint64_t)0x0000000000ff0000ULL) << 24)
-+		| ((val & (uint64_t)0x00000000ff000000ULL) <<  8)
-+		| ((val & (uint64_t)0x000000ff00000000ULL) >>  8)
-+		| ((val & (uint64_t)0x0000ff0000000000ULL) >> 24)
-+		| ((val & (uint64_t)0x00ff000000000000ULL) >> 40)
-+		| ((val & (uint64_t)0xff00000000000000ULL) >> 56);
-+}
-+#endif
-+
- #if __BYTE_ORDER == __LITTLE_ENDIAN
- #define le16_to_cpu(x)	((__u16)(x))
- #define le32_to_cpu(x)	((__u32)(x))
--- 
-2.0.4
-
diff --git a/package/f2fs-tools/0002-mkfs.f2fs-possible-endianes-bug-in-mkfs.f2fs-roll-forw.patch b/package/f2fs-tools/0002-mkfs.f2fs-possible-endianes-bug-in-mkfs.f2fs-roll-forw.patch
deleted file mode 100644
index a7c28fc..0000000
--- a/package/f2fs-tools/0002-mkfs.f2fs-possible-endianes-bug-in-mkfs.f2fs-roll-forw.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From fe067853b0945a2ae18004e0a58023694e0779b9 Mon Sep 17 00:00:00 2001
-From: joerg jungermann <jj@borkum.net>
-Date: Thu, 25 Sep 2014 22:05:12 -0700
-Subject: [PATCH] mkfs.f2fs: possible endianes bug in mkfs.f2fs roll-forward
- speed
-
-I might found a bug in mkfs.f2fs. while experimenting with f2fs on my big
-endian MIPS32 device (platform lantiq, 14.07-rc3, uclibc).
-
-I ran into an issue that mkfs.f2fs, was not able to format block devices if I
-did not specify the sector count manually.
-
-I hunted it down to lib/libf2fs.c.
-After I found that the detected sector count equals to the wanted sector count
-shifted left (32+9) times.
-
-I found two issues:
-Firstly it uses ioctl BLKGETSIZE, which writes to an uint32_t the size of the
-device.
-As c->total_sectors is of type uint64_t, the value is written in to the first
-4 bytes.
-That explained the left shift of 32 bits.
-
-Secondly BLKGETSIZE determines the size of the device in bytes (AFAIK, learned
-by observation).
-In the first branch of the if-block patched below, the c->total_sectors is
-calculated by
-  c->total_sectors = stat_buf.st_size / c->sector_size;
-The else branch omits the devision. sector_sice is mostly 512, that explained
-the left shift by 9 bytes.
-
- * fixes sector count calculation
- * uses BLKGETSIZE64 if avail
-
-Signed-off-by: joerg jungermann <jj@borkum.net>
-Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- lib/libf2fs.c | 16 ++++++++++++++--
- 1 file changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/lib/libf2fs.c b/lib/libf2fs.c
-index 01ef4e9..73c551b 100644
---- a/lib/libf2fs.c
-+++ b/lib/libf2fs.c
-@@ -422,6 +422,9 @@ int f2fs_get_device_info(struct f2fs_configuration *c)
- {
- 	int32_t fd = 0;
- 	uint32_t sector_size;
-+#ifndef BLKGETSIZE64
-+	uint32_t total_sectors;
-+#endif
- 	struct stat stat_buf;
- 	struct hd_geometry geom;
- 	u_int64_t wanted_total_sectors = c->total_sectors;
-@@ -454,11 +457,20 @@ int f2fs_get_device_info(struct f2fs_configuration *c)
- 			}
- 		}
- 
--		if (ioctl(fd, BLKGETSIZE, &c->total_sectors) < 0) {
-+#ifdef BLKGETSIZE64
-+		if (ioctl(fd, BLKGETSIZE64, &c->total_sectors) < 0) {
- 			MSG(0, "\tError: Cannot get the device size\n");
- 			return -1;
- 		}
--
-+		c->total_sectors /= c->sector_size;
-+#else
-+		if (ioctl(fd, BLKGETSIZE, &total_sectors) < 0) {
-+			MSG(0, "\tError: Cannot get the device size\n");
-+			return -1;
-+		}
-+		total_sectors /= c->sector_size;
-+		c->total_sectors = total_sectors;
-+#endif
- 		if (ioctl(fd, HDIO_GETGEO, &geom) < 0)
- 			c->start_sector = 0;
- 		else
--- 
-2.0.4
-
diff --git a/package/f2fs-tools/0003-mkfs.f2fs-fix-missing-endian-conversion.patch b/package/f2fs-tools/0003-mkfs.f2fs-fix-missing-endian-conversion.patch
deleted file mode 100644
index 3197385..0000000
--- a/package/f2fs-tools/0003-mkfs.f2fs-fix-missing-endian-conversion.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-commit 0b4d168d07b54f1dc6db0c4da11a939222e817f2
-Author: Changman Lee <cm224.lee@samsung.com>
-Date:   Thu Nov 13 20:15:05 2014 +0900
-
-    mkfs.f2fs: fix missing endian conversion
-    
-    This is for conversion from cpu to little endian and vice versa.
-    
-    Signed-off-by: Changman Lee <cm224.lee@samsung.com>
-    Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
-
-diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
-index 0a9d728..c0028a3 100644
---- a/mkfs/f2fs_format.c
-+++ b/mkfs/f2fs_format.c
-@@ -71,7 +71,7 @@ static void configure_extension_list(void)
- 		memcpy(super_block.extension_list[i++], *extlist, name_len);
- 		extlist++;
- 	}
--	super_block.extension_count = i;
-+	super_block.extension_count = cpu_to_le32(i);
- 
- 	if (!ext_str)
- 		return;
-@@ -86,7 +86,7 @@ static void configure_extension_list(void)
- 			break;
- 	}
- 
--	super_block.extension_count = i;
-+	super_block.extension_count = cpu_to_le32(i);
- 
- 	free(config.extension_list);
- }
-@@ -211,7 +211,7 @@ static int f2fs_prepare_super_block(void)
- 	if (max_sit_bitmap_size >
- 			(CHECKSUM_OFFSET - sizeof(struct f2fs_checkpoint) + 65)) {
- 		max_nat_bitmap_size = CHECKSUM_OFFSET - sizeof(struct f2fs_checkpoint) + 1;
--		super_block.cp_payload = F2FS_BLK_ALIGN(max_sit_bitmap_size);
-+		super_block.cp_payload = cpu_to_le32(F2FS_BLK_ALIGN(max_sit_bitmap_size));
- 	} else {
- 		max_nat_bitmap_size = CHECKSUM_OFFSET - sizeof(struct f2fs_checkpoint) + 1
- 			- max_sit_bitmap_size;
diff --git a/package/f2fs-tools/0004-configure-also-check-for-byteswap.h.patch b/package/f2fs-tools/0004-configure-also-check-for-byteswap.h.patch
deleted file mode 100644
index 786c27d..0000000
--- a/package/f2fs-tools/0004-configure-also-check-for-byteswap.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7b9da72b1779cbc7b6c092523877860ef9315a36 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Thu, 25 Dec 2014 18:39:19 +0100
-Subject: [PATCH] configure: also check for byteswap.h
-
-include/f2fs_fs.h checks the HAVE_BYTESWAP_H conditional, but it is
-never checked for in configure.
-
-Add that header to the list of headers checked for.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Note: not exactly the same as submitted upstreram, because they already
-check for more headers.
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d66cb73..7cfd9b4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -57,7 +57,7 @@ PKG_CHECK_MODULES([libuuid], [uuid])
- 
- # Checks for header files.
- AC_CHECK_HEADERS([linux/fs.h fcntl.h mntent.h stdlib.h string.h \
--		sys/ioctl.h sys/mount.h unistd.h])
-+		sys/ioctl.h sys/mount.h unistd.h byteswap.h])
- 
- # Checks for typedefs, structures, and compiler characteristics.
- AC_C_INLINE
--- 
-1.9.1
-
diff --git a/package/f2fs-tools/0005-configure-add-check-for-bswap_64.patch b/package/f2fs-tools/0005-configure-add-check-for-bswap_64.patch
deleted file mode 100644
index 8523f02..0000000
--- a/package/f2fs-tools/0005-configure-add-check-for-bswap_64.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From e436e40b57125472ba732a5d39407ff52f008f52 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Thu, 25 Dec 2014 18:52:00 +0100
-Subject: [PATCH] configure: add check for bswap_64
-
-include/f2fs_fs.h checks the HAVE_BSWAP_64 conidtional, but configure
-nevers checks for it.
-
-Add a check that the function is indeed declared, and fix the variable
-name to match the naming scheme of autoconf (and not those of WAF like
-is used by samba), and adapt the check as suggested in the autoconf
-manual.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac      | 3 +++
- include/f2fs_fs.h | 2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7cfd9b4..ae451b8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -72,6 +72,9 @@ AC_CHECK_FUNCS_ONCE([
- 	memset
- ])
- 
-+AS_IF([test "$ac_cv_header_byteswap_h" = "yes"],
-+      [AC_CHECK_DECLS([bswap_64],,,[#include <byteswap.h>])])
-+
- # Install directories
- AC_PREFIX_DEFAULT([/usr])
- AC_SUBST([sbindir], [/sbin])
-diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
-index 0c3ba04..4dc2426 100644
---- a/include/f2fs_fs.h
-+++ b/include/f2fs_fs.h
-@@ -63,7 +63,7 @@ static inline uint32_t bswap_32(uint32_t val)
- }
- #endif /* !HAVE_BYTESWAP_H */
- 
--#if !HAVE_BSWAP_64
-+#if defined HAVE_DECL_BSWAP_64 && !HAVE_DECL_BSWAP_64
- /**
-  * bswap_64 - reverse bytes in a uint64_t value.
-  * @val: value whose bytes to swap.
--- 
-1.9.1
-
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 2035506..e5c4a54 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = baac4b4e6f41ceb02511da49dd3707674f3fea21
+F2FS_TOOLS_VERSION = fd32210229d4ad7d1c916c74a0dfc150aae4c89e
 F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 F2FS_TOOLS_SITE_METHOD = git
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
-- 
2.0.5
