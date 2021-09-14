Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54164C433FE
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:35:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83C5D61175
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83C5D61175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5622280E91;
	Tue, 14 Sep 2021 09:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4xOQfw-aIiW; Tue, 14 Sep 2021 09:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A270F80D86;
	Tue, 14 Sep 2021 09:35:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52EEC1BF989
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41A3360653
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUySrBMik7Kq for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 09:35:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CDFE6060C
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 09:35:01 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 84A86FF819;
 Tue, 14 Sep 2021 09:35:00 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 11:34:57 +0200
Message-Id: <20210914093457.1389174-9-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914093457.1389174-1-kory.maincent@bootlin.com>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 8/8] support/testing/tests/fs/test_iso9660.py:
 add support to test using EFI BIOS
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The ISO9660 tests are only testing BIOS Legacy.
Add support to test an ISO9660 image based on EFI BIOS.
Add support to test an ISO9660 hybrid image based on Legacy and EFI BIOS.
Add dedicated Grub2 builtin config for the EFI compatible cases.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 support/testing/conf/grub2-efi.cfg       |  2 +
 support/testing/tests/fs/test_iso9660.py | 74 +++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 support/testing/conf/grub2-efi.cfg

diff --git a/support/testing/conf/grub2-efi.cfg b/support/testing/conf/grub2-efi.cfg
new file mode 100644
index 0000000000..11c32e880e
--- /dev/null
+++ b/support/testing/conf/grub2-efi.cfg
@@ -0,0 +1,2 @@
+set root=(cd0)
+set prefix=/boot/grub
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index fffa49caf3..c986f044b3 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -25,9 +25,13 @@ BASIC_CONFIG = \
     """.format(infra.filepath("conf/minimal-x86-qemu-kernel.config"))
 
 
-def test_mount_internal_external(emulator, builddir, internal=True):
+def test_mount_internal_external(emulator, builddir, internal=True, efi=False):
     img = os.path.join(builddir, "images", "rootfs.iso9660")
-    emulator.boot(arch="i386", options=["-cdrom", img])
+    if efi:
+        efi_img = os.path.join(builddir, "host/usr/share/ovmf-ia32/OVMF-pure-efi.fd")
+        emulator.boot(arch="i386", options=["-cdrom", img, "-bios", efi_img])
+    else:
+        emulator.boot(arch="i386", options=["-cdrom", img])
     emulator.login()
 
     if internal:
@@ -53,6 +57,7 @@ class TestIso9660Grub2External(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_ISO9660=y
         # BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
         BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_I386_PC=y
         BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
         BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
         BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC=""
@@ -75,6 +80,7 @@ class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
         BR2_TARGET_ROOTFS_ISO9660_TRANSPARENT_COMPRESSION=y
         BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_I386_PC=y
         BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
         BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
         BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC=""
@@ -96,6 +102,7 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_ISO9660=y
         BR2_TARGET_ROOTFS_ISO9660_INITRD=y
         BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_I386_PC=y
         BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
         BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
         BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC=""
@@ -110,6 +117,69 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
         exit_code = test_touch_file(self.emulator)
         self.assertEqual(exit_code, 0)
 
+
+class TestIso9660Grub2EFI(infra.basetest.BRTest):
+    config = BASIC_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_ISO9660=y
+        BR2_TARGET_ROOTFS_ISO9660_INITRD=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_I386_EFI=y
+        BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat part_msdos part_gpt normal iso9660"
+        BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI="{}"
+        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
+        BR2_PACKAGE_HOST_EDK2_IMAGES=y
+        """.format(infra.filepath("conf/grub2-efi.cfg"),
+                   infra.filepath("conf/grub2.cfg"))
+
+    def test_run(self):
+        exit_code = test_mount_internal_external(self.emulator,
+                                                 self.builddir, internal=True,
+                                                 efi=True)
+        self.assertEqual(exit_code, 0)
+
+        exit_code = test_touch_file(self.emulator)
+        self.assertEqual(exit_code, 0)
+
+
+class TestIso9660Grub2Hybrid(infra.basetest.BRTest):
+    config = BASIC_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_ISO9660=y
+        BR2_TARGET_ROOTFS_ISO9660_INITRD=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_I386_PC=y
+        BR2_TARGET_GRUB2_I386_EFI=y
+        BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
+        BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat squash4 part_msdos part_gpt normal iso9660 biosdisk"
+        BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC=""
+        BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal iso9660 efi_gop"
+        BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI="{}"
+        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
+        BR2_PACKAGE_HOST_EDK2_IMAGES=y
+        """.format(infra.filepath("conf/grub2-efi.cfg"),
+                   infra.filepath("conf/grub2.cfg"))
+
+    def test_run(self):
+        exit_code = test_mount_internal_external(self.emulator,
+                                                 self.builddir, internal=True,
+                                                 efi=False)
+        self.assertEqual(exit_code, 0)
+
+        exit_code = test_touch_file(self.emulator)
+        self.assertEqual(exit_code, 0)
+
+        self.emulator.stop()
+
+        exit_code = test_mount_internal_external(self.emulator,
+                                                 self.builddir, internal=True,
+                                                 efi=True)
+        self.assertEqual(exit_code, 0)
+
+        exit_code = test_touch_file(self.emulator)
+        self.assertEqual(exit_code, 0)
+
+
 #
 # Syslinux
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
