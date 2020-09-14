From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 21:12:59 +0200
Subject: [Buildroot] [git commit] package/f2fs-tools: bump version to 1.14.0
Message-ID: <20200914190420.ED25D8AC01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf566658f28f3e4b362cc8f9235e6b7768af355c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patches.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-mkfs-Makefile.am-fix-build-without-blkid.patch |  30 ----
 .../0002-fsck.f2fs-correct-return-value.patch      | 195 ---------------------
 package/f2fs-tools/f2fs-tools.hash                 |   2 +-
 package/f2fs-tools/f2fs-tools.mk                   |   2 +-
 4 files changed, 2 insertions(+), 227 deletions(-)

diff --git a/package/f2fs-tools/0001-mkfs-Makefile.am-fix-build-without-blkid.patch b/package/f2fs-tools/0001-mkfs-Makefile.am-fix-build-without-blkid.patch
deleted file mode 100644
index aac60e70b6..0000000000
--- a/package/f2fs-tools/0001-mkfs-Makefile.am-fix-build-without-blkid.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7727b6fe0897849d4fc8f75a48326e902f0ab8b2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 22 Sep 2019 10:06:35 +0200
-Subject: [PATCH] mkfs/Makefile.am: fix build without blkid
-
-Commit d56232bc1640e2a3ffc412faff42cd8e77dbb8dd hardcoded -lblkid in
-libf2fs_format_la_LDFLAGS which breaks the build with --without-blkid
-option so use ${libblkid_LIBS} instead
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- mkfs/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
-index cae2f93..83e2389 100644
---- a/mkfs/Makefile.am
-+++ b/mkfs/Makefile.am
-@@ -12,7 +12,7 @@ lib_LTLIBRARIES = libf2fs_format.la
- libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
- libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
- libf2fs_format_la_CPPFLAGS = -I$(top_srcdir)/include
--libf2fs_format_la_LDFLAGS = -lblkid -luuid -L$(top_builddir)/lib -lf2fs \
-+libf2fs_format_la_LDFLAGS = ${libblkid_LIBS} -luuid -L$(top_builddir)/lib -lf2fs \
- 	-version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
- 
- install-exec-hook:
--- 
-2.23.0
-
diff --git a/package/f2fs-tools/0002-fsck.f2fs-correct-return-value.patch b/package/f2fs-tools/0002-fsck.f2fs-correct-return-value.patch
deleted file mode 100644
index b420e27a0e..0000000000
--- a/package/f2fs-tools/0002-fsck.f2fs-correct-return-value.patch
+++ /dev/null
@@ -1,195 +0,0 @@
-From eee12fe5e2e6c5f71bc7cbe25a608b730fd5362e Mon Sep 17 00:00:00 2001
-From: Chao Yu <yuchao0@huawei.com>
-Date: Fri, 7 Aug 2020 10:02:31 +0800
-Subject: [PATCH] fsck.f2fs: correct return value
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-As Norbert Lange reported:
-
-"
-$ fsck.f2fs -a /dev/mmcblk0p5; echo $?
-Info: Fix the reported corruption.
-Info: Mounted device!
-Info: Check FS only on RO mounted device
-Error: Failed to open the device!
-255
-"
-
-Michael La?? reminds:
-
-"
-I think the return value is exactly the problem here. See fsck(8) (
-https://linux.die.net/man/8/fsck) which specifies the return values.
-Systemd looks at these and decides how to proceed:
-
-https://github.com/systemd/systemd/blob/a859abf062cef1511e4879c4ee39c6036ebeaec8/src/fsck/fsck.c#L407
-
-That means, if fsck.f2fs returns 255, then
-the FSCK_SYSTEM_SHOULD_REBOOT bit is set and systemd will reboot.
-"
-
-So the problem here is fsck.f2fs didn't return correct value to userspace
-apps, result in later unexpected behavior of rebooting, let's fix this.
-
-Reported-by: Norbert Lange <nolange79@gmail.com>
-Reported-by: Michael La?? <bevan@bi-co.net>
-Signed-off-by: Chao Yu <yuchao0@huawei.com>
-Signed-off-by: Norbert Lange <nolange79@gmail.com>
----
- fsck/fsck.h | 11 +++++++++++
- fsck/main.c | 45 +++++++++++++++++++++++++++++++--------------
- 2 files changed, 42 insertions(+), 14 deletions(-)
-
-diff --git a/fsck/fsck.h b/fsck/fsck.h
-index ccf4a39..c8aeb06 100644
---- a/fsck/fsck.h
-+++ b/fsck/fsck.h
-@@ -13,6 +13,17 @@
- 
- #include "f2fs.h"
- 
-+enum {
-+	FSCK_SUCCESS                 = 0,
-+	FSCK_ERROR_CORRECTED         = 1 << 0,
-+	FSCK_SYSTEM_SHOULD_REBOOT    = 1 << 1,
-+	FSCK_ERRORS_LEFT_UNCORRECTED = 1 << 2,
-+	FSCK_OPERATIONAL_ERROR       = 1 << 3,
-+	FSCK_USAGE_OR_SYNTAX_ERROR   = 1 << 4,
-+	FSCK_USER_CANCELLED          = 1 << 5,
-+	FSCK_SHARED_LIB_ERROR        = 1 << 7,
-+};
-+
- struct quota_ctx;
- 
- #define FSCK_UNMATCHED_EXTENT		0x00000001
-diff --git a/fsck/main.c b/fsck/main.c
-index 8c62a14..b0f2ec3 100644
---- a/fsck/main.c
-+++ b/fsck/main.c
-@@ -591,7 +591,7 @@ void f2fs_parse_options(int argc, char *argv[])
- 	error_out(prog);
- }
- 
--static void do_fsck(struct f2fs_sb_info *sbi)
-+static int do_fsck(struct f2fs_sb_info *sbi)
- {
- 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
- 	u32 flag = le32_to_cpu(ckpt->ckpt_flags);
-@@ -614,7 +614,7 @@ static void do_fsck(struct f2fs_sb_info *sbi)
- 			} else {
- 				MSG(0, "[FSCK] F2FS metadata   [Ok..]");
- 				fsck_free(sbi);
--				return;
-+				return FSCK_SUCCESS;
- 			}
- 
- 			if (!c.ro)
-@@ -646,7 +646,7 @@ static void do_fsck(struct f2fs_sb_info *sbi)
- 		ret = quota_init_context(sbi);
- 		if (ret) {
- 			ASSERT_MSG("quota_init_context failure: %d", ret);
--			return;
-+			return FSCK_OPERATIONAL_ERROR;
- 		}
- 	}
- 	fsck_chk_orphan_node(sbi);
-@@ -654,8 +654,14 @@ static void do_fsck(struct f2fs_sb_info *sbi)
- 			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, NULL);
- 	fsck_chk_quota_files(sbi);
- 
--	fsck_verify(sbi);
-+	ret = fsck_verify(sbi);
- 	fsck_free(sbi);
-+
-+	if (!c.bug_on)
-+		return FSCK_SUCCESS;
-+	if (!ret)
-+		return FSCK_ERROR_CORRECTED;
-+	return FSCK_ERRORS_LEFT_UNCORRECTED;
- }
- 
- static void do_dump(struct f2fs_sb_info *sbi)
-@@ -763,7 +769,7 @@ static int do_sload(struct f2fs_sb_info *sbi)
- int main(int argc, char **argv)
- {
- 	struct f2fs_sb_info *sbi;
--	int ret = 0;
-+	int ret = 0, ret2;
- 	clock_t start = clock();
- 
- 	f2fs_init_configuration();
-@@ -771,10 +777,15 @@ int main(int argc, char **argv)
- 	f2fs_parse_options(argc, argv);
- 
- 	if (c.func != DUMP && f2fs_devs_are_umounted() < 0) {
--		if (errno == EBUSY)
-+		if (errno == EBUSY) {
-+			if (c.func == FSCK)
-+				return FSCK_OPERATIONAL_ERROR;
- 			return -1;
-+		}
- 		if (!c.ro || c.func == DEFRAG) {
- 			MSG(0, "\tError: Not available on mounted device!\n");
-+			if (c.func == FSCK)
-+				return FSCK_OPERATIONAL_ERROR;
- 			return -1;
- 		}
- 
-@@ -789,8 +800,11 @@ int main(int argc, char **argv)
- 	}
- 
- 	/* Get device */
--	if (f2fs_get_device_info() < 0)
-+	if (f2fs_get_device_info() < 0) {
-+		if (c.func == FSCK)
-+			return FSCK_OPERATIONAL_ERROR;
- 		return -1;
-+	}
- 
- fsck_again:
- 	memset(&gfsck, 0, sizeof(gfsck));
-@@ -808,7 +822,7 @@ fsck_again:
- 
- 	switch (c.func) {
- 	case FSCK:
--		do_fsck(sbi);
-+		ret = do_fsck(sbi);
- 		break;
- #ifdef WITH_DUMP
- 	case DUMP:
-@@ -856,8 +870,8 @@ fsck_again:
- 			char ans[255] = {0};
- retry:
- 			printf("Do you want to fix this partition? [Y/N] ");
--			ret = scanf("%s", ans);
--			ASSERT(ret >= 0);
-+			ret2 = scanf("%s", ans);
-+			ASSERT(ret2 >= 0);
- 			if (!strcasecmp(ans, "y"))
- 				c.fix_on = 1;
- 			else if (!strcasecmp(ans, "n"))
-@@ -869,12 +883,15 @@ retry:
- 				goto fsck_again;
- 		}
- 	}
--	ret = f2fs_finalize_device();
--	if (ret < 0)
--		return ret;
-+	ret2 = f2fs_finalize_device();
-+	if (ret2) {
-+		if (c.func == FSCK)
-+			return FSCK_OPERATIONAL_ERROR;
-+		return ret2;
-+	}
- 
- 	printf("\nDone: %lf secs\n", (clock() - start) / (double)CLOCKS_PER_SEC);
--	return 0;
-+	return ret;
- 
- out_err:
- 	if (sbi->ckpt)
--- 
-2.27.0
-
diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
index 4eb4d14709..dedd884957 100644
--- a/package/f2fs-tools/f2fs-tools.hash
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b39d3ae9224267aab0070b5f17d91d0c5143f6d960166a27f6b11c8c87072c7d  f2fs-tools-1.13.0.tar.gz
+sha256 619263d4e2022152a1472c1d912eaae104f20bd227ce0bb9d41d1d6608094bd1  f2fs-tools-1.14.0.tar.gz
 sha256 662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index a9536dc8e7..ced283d25d 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = 1.13.0
+F2FS_TOOLS_VERSION = 1.14.0
 F2FS_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
 F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
