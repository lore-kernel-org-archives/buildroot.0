Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A74BC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13CC36FC59;
	Fri, 28 Feb 2025 17:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKwx5uAKuLgX; Fri, 28 Feb 2025 17:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BFD0708FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BFD0708FC;
	Fri, 28 Feb 2025 17:09:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F877711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4730442513
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtTZZtVgIQZo for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B10A042C13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B10A042C13
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACC1A85E25; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 18:48:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a92b74c20cfd21830814ec7010144dabab86a0d6
X-Git-Newrev: ba38576aa6e8b965fddda0858e520cbd87db006e
X-Patchwork-Hint: ignore
Message-Id: <20250228163026.ACC1A85E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] fs/ext2: remove ext2 revision
 0 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ba38576aa6e8b965fddda0858e520cbd87db006e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Revision 0 is very old and misses a number of features.  From man mkfs.ext2:

Set  the  file system revision for the new file system.  Note that 1.2
kernels only support revision 0 file systems.  The default is to create
revision 1 file systems.

We are unlikely to have a lot of Linux 1.2.x users, so drop support for it.

As revision 1 is the default, drop the -E revision argument to mkfs.ext2 for
simplicity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                     |  7 +++++++
 fs/ext2/Config.in                    | 16 ++--------------
 fs/ext2/ext2.mk                      |  1 -
 support/testing/tests/fs/test_ext.py | 20 --------------------
 4 files changed, 9 insertions(+), 35 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index abc65d0c9a..edca3eef47 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_TARGET_ROOTFS_EXT2_2r0
+	bool "ext2 rev0 support been removed"
+	select BR2_LEGACY
+	help
+	  Support for ext2 revision 0 format has been removed and
+	  revision 1 is now unconditionally used.
+
 config BR2_GDB_VERSION_13
 	bool "gdb 13.x has been removed"
 	select BR2_LEGACY
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 7d42621202..c50f22626a 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -13,10 +13,6 @@ choice
 	bool "ext2/3/4 variant"
 	default BR2_TARGET_ROOTFS_EXT2_2r1
 
-config BR2_TARGET_ROOTFS_EXT2_2r0
-	bool "ext2 (rev0)"
-	select BR2_TARGET_ROOTFS_EXT2_2
-
 config BR2_TARGET_ROOTFS_EXT2_2r1
 	bool "ext2 (rev1)"
 	select BR2_TARGET_ROOTFS_EXT2_2
@@ -35,12 +31,6 @@ config BR2_TARGET_ROOTFS_EXT2_GEN
 	default 3 if BR2_TARGET_ROOTFS_EXT2_3
 	default 4 if BR2_TARGET_ROOTFS_EXT2_4
 
-# All ext generations are revision 1, except ext2r0, which is revision 0
-config BR2_TARGET_ROOTFS_EXT2_REV
-	int
-	default 0   if BR2_TARGET_ROOTFS_EXT2_2r0
-	default 1   if !BR2_TARGET_ROOTFS_EXT2_2r0
-
 config BR2_TARGET_ROOTFS_EXT2_LABEL
 	string "filesystem label"
 	default "rootfs"
@@ -85,8 +75,7 @@ config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 
 config BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS
 	string "additional mke2fs options"
-	# Note: ext2 rev0 does not support filesystem options.
-	default "-O ^64bit" if !BR2_TARGET_ROOTFS_EXT2_2r0
+	default "-O ^64bit"
 	help
 	  Specify a space-separated list of mke2fs options, including
 	  any ext2/3/4 filesystem features.
@@ -101,8 +90,7 @@ config BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS
 	  support. This default value has been chosen because U-Boot
 	  versions before 2017.02 don't support this filesystem
 	  option: using it may make the filesystem unreadable by
-	  U-Boot. Note: this default does not apply to the old ext2
-	  (rev0) which does not support filesystem options.
+	  U-Boot.
 
 choice
 	prompt "Compression method"
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index b49a8456f4..89e0e7b9b3 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -18,7 +18,6 @@ ROOTFS_EXT2_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 
 ROOTFS_EXT2_OPTS = \
 	-d $(TARGET_DIR) \
-	-E revision=$(BR2_TARGET_ROOTFS_EXT2_REV) \
 	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
 	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
 	-L "$(ROOTFS_EXT2_LABEL)" \
diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 699f3ed932..7612ad2b30 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -38,26 +38,6 @@ def boot_img_and_check_fs_type(emulator, builddir, fs_type):
 
 
 class TestExt2(infra.basetest.BRTest):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
-        """
-        BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_2r0=y
-        BR2_TARGET_ROOTFS_EXT2_LABEL="foobaz"
-        BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        out = dumpe2fs_run(self.builddir, "rootfs.ext2")
-        self.assertEqual(dumpe2fs_getprop(out, VOLNAME_PROP), "foobaz")
-        self.assertEqual(dumpe2fs_getprop(out, REVISION_PROP), "0 (original)")
-
-        exit_code = boot_img_and_check_fs_type(self.emulator,
-                                               self.builddir, "ext2")
-        self.assertEqual(exit_code, 0)
-
-
-class TestExt2r1(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
