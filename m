From: Norbert Lange <nolange79@gmail.com>
Date: Wed,  5 Aug 2020 11:42:28 +0200
Subject: [Buildroot] [PATCH] package/f2fs-tools: fsck should use correct
 returncodes
Message-ID: <20200805094229.287492-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fsck.f2fs does not implement the returncodes from the fsck interface.
This is particularly bad if systemd is used with a root f2fs partition,
as it will interpret the rc as order to reboot.

for thread & pending upstream fix see:
https://sourceforge.net/p/linux-f2fs/mailman/message/37078057/

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 ...002-f2fs_return_correct_return_value.patch | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 package/f2fs-tools/0002-f2fs_return_correct_return_value.patch

diff --git a/package/f2fs-tools/0002-f2fs_return_correct_return_value.patch b/package/f2fs-tools/0002-f2fs_return_correct_return_value.patch
new file mode 100644
index 0000000000..bcaf7d657e
--- /dev/null
+++ b/package/f2fs-tools/0002-f2fs_return_correct_return_value.patch
@@ -0,0 +1,127 @@
+fsck.f2fs does not implement the returncodes from the fsck interface.
+This is particularly bad if systemd is used with a root f2fs partition,
+as it will interpret the rc as order to reboot.
+
+see: https://sourceforge.net/p/linux-f2fs/mailman/message/37078057/
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+diff -burN f2fs-tools-1.13.0.org/fsck/fsck.h f2fs-tools-1.13.0/fsck/fsck.h
+--- f2fs-tools-1.13.0.org/fsck/fsck.h	2019-09-25 04:20:31.000000000 +0200
++++ f2fs-tools-1.13.0/fsck/fsck.h	2020-08-05 11:23:43.130438002 +0200
+@@ -13,6 +13,17 @@
+
+ #include "f2fs.h"
+
++enum {
++	FSCK_SUCCESS                 = 0,
++	FSCK_ERROR_CORRECTED         = 1 << 0,
++	FSCK_SYSTEM_SHOULD_REBOOT    = 1 << 1,
++	FSCK_ERRORS_LEFT_UNCORRECTED = 1 << 2,
++	FSCK_OPERATIONAL_ERROR       = 1 << 3,
++	FSCK_USAGE_OR_SYNTAX_ERROR   = 1 << 4,
++	FSCK_USER_CANCELLED          = 1 << 5,
++	FSCK_SHARED_LIB_ERROR        = 1 << 7,
++};
++
+ struct quota_ctx;
+
+ #define FSCK_UNMATCHED_EXTENT		0x00000001
+diff -burN f2fs-tools-1.13.0.org/fsck/main.c f2fs-tools-1.13.0/fsck/main.c
+--- f2fs-tools-1.13.0.org/fsck/main.c	2019-09-25 04:20:31.000000000 +0200
++++ f2fs-tools-1.13.0/fsck/main.c	2020-08-05 11:24:57.748057865 +0200
+@@ -591,7 +591,7 @@
+ 	error_out(prog);
+ }
+
+-static void do_fsck(struct f2fs_sb_info *sbi)
++static int do_fsck(struct f2fs_sb_info *sbi)
+ {
+ 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
+ 	u32 flag = le32_to_cpu(ckpt->ckpt_flags);
+@@ -614,7 +614,7 @@
+ 			} else {
+ 				MSG(0, "[FSCK] F2FS metadata   [Ok..]");
+ 				fsck_free(sbi);
+-				return;
++				return FSCK_SUCCESS;
+ 			}
+
+ 			if (!c.ro)
+@@ -646,7 +646,7 @@
+ 		ret = quota_init_context(sbi);
+ 		if (ret) {
+ 			ASSERT_MSG("quota_init_context failure: %d", ret);
+-			return;
++			return FSCK_OPERATIONAL_ERROR;
+ 		}
+ 	}
+ 	fsck_chk_orphan_node(sbi);
+@@ -654,8 +654,14 @@
+ 			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, NULL);
+ 	fsck_chk_quota_files(sbi);
+
+-	fsck_verify(sbi);
++	ret = fsck_verify(sbi);
+ 	fsck_free(sbi);
++
++	if (!c.bug_on)
++		return FSCK_SUCCESS;
++	if (!ret)
++		return FSCK_ERROR_CORRECTED;
++	return FSCK_ERRORS_LEFT_UNCORRECTED;
+ }
+
+ static void do_dump(struct f2fs_sb_info *sbi)
+@@ -771,10 +777,15 @@
+ 	f2fs_parse_options(argc, argv);
+
+ 	if (c.func != DUMP && f2fs_devs_are_umounted() < 0) {
+-		if (errno == EBUSY)
++		if (errno == EBUSY) {
++			if (c.func == FSCK)
++				return FSCK_OPERATIONAL_ERROR;
+ 			return -1;
++		}
+ 		if (!c.ro || c.func == DEFRAG) {
+ 			MSG(0, "\tError: Not available on mounted device!\n");
++			if (c.func == FSCK)
++				return FSCK_OPERATIONAL_ERROR;
+ 			return -1;
+ 		}
+
+@@ -789,8 +800,11 @@
+ 	}
+
+ 	/* Get device */
+-	if (f2fs_get_device_info() < 0)
++	if (f2fs_get_device_info() < 0) {
++		if (c.func == FSCK)
++			return FSCK_OPERATIONAL_ERROR;
+ 		return -1;
++	}
+
+ fsck_again:
+ 	memset(&gfsck, 0, sizeof(gfsck));
+@@ -808,7 +822,7 @@
+
+ 	switch (c.func) {
+ 	case FSCK:
+-		do_fsck(sbi);
++		ret = do_fsck(sbi);
+ 		break;
+ #ifdef WITH_DUMP
+ 	case DUMP:
+@@ -870,8 +884,11 @@
+ 		}
+ 	}
+ 	ret = f2fs_finalize_device();
+-	if (ret < 0)
++	if (ret) {
++		if (c.func == FSCK)
++			return FSCK_OPERATIONAL_ERROR;
+ 		return ret;
++	}
+
+ 	printf("\nDone: %lf secs\n", (clock() - start) / (double)CLOCKS_PER_SEC);
+ 	return 0;
-- 
2.27.0
