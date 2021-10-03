Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FC8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:46:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 894E361A0C
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 894E361A0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65114843E6;
	Sun,  3 Oct 2021 12:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPCMsKEspq3z; Sun,  3 Oct 2021 12:46:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93981848F5;
	Sun,  3 Oct 2021 12:46:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1AE31BF327
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CDE760AD5
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SaS4ijuCGdB for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 12:45:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6E2A60896
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 12:45:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BD3828DBBE; Sun,  3 Oct 2021 12:43:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 14:45:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e827bfd0dddab16e95cd5d1edfc780d96477be37
X-Git-Newrev: c656373aeb78658c1991cc1470995b8f5efa61dc
X-Patchwork-Hint: ignore
Message-Id: <20211003124320.BD3828DBBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/fs/test_iso9660.py:
 add support to test using EFI BIOS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=c656373aeb78658c1991cc1470995b8f5efa61dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ISO9660 tests are only testing BIOS Legacy.
Add support to test an ISO9660 image based on EFI BIOS.
Add support to test an ISO9660 hybrid image based on Legacy and EFI BIOS.
Add dedicated Grub2 builtin config for the EFI compatible cases.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/conf/grub2-efi.cfg       |  2 +
 support/testing/tests/fs/test_iso9660.py | 71 +++++++++++++++++++++++++++++++-
 2 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/support/testing/conf/grub2-efi.cfg b/support/testing/conf/grub2-efi.cfg
new file mode 100644
index 0000000000..11c32e880e
--- /dev/null
+++ b/support/testing/conf/grub2-efi.cfg
@@ -0,0 +1,2 @@
+set root=(cd0)
+set prefix=/boot/grub
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index b294d0ba0c..692291267e 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -25,9 +25,13 @@ BASIC_CONFIG = \
     """.format(infra.filepath("conf/minimal-x86-qemu-kernel.config"))
 
 
-def test_mount_internal_external(emulator, builddir, internal=True):
+def test_mount_internal_external(emulator, builddir, internal=True, efi=False):
     img = os.path.join(builddir, "images", "rootfs.iso9660")
-    emulator.boot(arch="i386", options=["-cdrom", img])
+    if efi:
+        efi_img = os.path.join(builddir, "images", "OVMF.fd")
+        emulator.boot(arch="i386", options=["-cdrom", img, "-bios", efi_img])
+    else:
+        emulator.boot(arch="i386", options=["-cdrom", img])
     emulator.login()
 
     if internal:
@@ -107,6 +111,69 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
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
+        BR2_TARGET_EDK2=y
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
+        BR2_TARGET_EDK2=y
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
