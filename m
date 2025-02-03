Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B8CC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 15:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95F2460648;
	Mon,  3 Feb 2025 15:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qzr4zH_shzw; Mon,  3 Feb 2025 15:30:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89B6D60E50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89B6D60E50;
	Mon,  3 Feb 2025 15:30:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14E8D12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05884820E3
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVIS_RLdnA9S for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 15:30:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DB4F820CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DB4F820CC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DB4F820CC
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:30:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88A05440DB;
 Mon,  3 Feb 2025 15:29:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1teyOb-00CvEl-3B;
 Mon, 03 Feb 2025 16:29:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Feb 2025 16:29:52 +0100
Message-Id: <20250203152952.3079934-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepveeiveethfelteelueelvdffieevgfdvtdeivdetuefgffdtvdeuffevheegffdunecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] fs/ext2: remove ext2 revision 0 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Revision 0 is very old and misses a number of features.  From man mkfs.ext2:

Set  the  file system revision for the new file system.  Note that 1.2
kernels only support revision 0 file systems.  The default is to create
revision 1 file systems.

We are unlikely to have a lot of Linux 1.2.x users, so drop support for it.

As revision 1 is the default, drop the -E revision argument to mkfs.ext2 for
simplicity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
