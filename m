Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F6DD715E5
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 13:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A199560A60;
	Sat, 24 Jan 2026 13:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTDcxPWw2okC; Sat, 24 Jan 2026 13:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9889F60A5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769260440;
	bh=DDfnlDZuA6Xth0wdfqNvuy7gXakqtCKwRi5t1Rc38ZI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=QCzaG9lcF5xmx96l2jeJLj0ZFYQpruZJXS35LZaXFF1qCkuhnmpe1H+44BtodHkqJ
	 J2koHyRnRG+eXn5mSfkSknVL/GkUUHqPYXctv3IRWEAgn/YggIIdHj3NlcwNzQdcQq
	 0sq2wGLSftYZ59iqeSYNdOOK4+fks2Dzn/EnxOzS8pHV0i8FJVjawmlTJjiWT0Pct0
	 QSfFk1oz6K/tgG2uyW/MAExQ005jsAIbk2flLUy9ldxoMaC8eh6qsxqaLiauUVYQFe
	 ufaALMznBSk/zllvl83uBXxox8PP5cQdmbb6YBc/+c1SKfIPR5ucwBkN6NX/bz7XNU
	 yr+i0Zz955r1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9889F60A5A;
	Sat, 24 Jan 2026 13:14:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC3F1358
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 13:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D10260A5A
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 13:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNhz4PZdQ6EY for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 13:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0186A60A4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0186A60A4D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0186A60A4D
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 13:13:56 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2EB8A19F576;
 Sat, 24 Jan 2026 14:13:48 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 24 Jan 2026 14:13:35 +0100
Message-ID: <20260124131337.1022030-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769260433;
 bh=aL35Jj4FDO+Ixe/CO+MeNKaB2w6+jGQVCL5EpGRtE/o=;
 h=From:To:Cc:Subject:Date:From;
 b=cICkiPBAlGaTh0qlEolNvlEV5qTKyRnM5GlpcXMVwZ42PrRIxM/+B1dlgq7vOj8QN
 mYrfY2ZZc6l6Ll5I9q5rJ5TnAxw3fGbEuT+6SmSl24199sr9w5XNQao5mHacRcWVr7
 O+mEJ2htDe1u5ad4Xi9seXg/O4wm022QmJY91J4DFflLi1CiaJCfyOmLbAGu7vU+sV
 3d+5NP26spmHFdo73xJZLvhZehfYg551XZ/jXZNePfSObeqSf/2KTxgXJ75kMew5JR
 mCbGj7HW05jBq79pHcZ+gLbuywv0cfMVXF5urC8I3Qf/ZELQY9EzzgjmXEu/hyc6w5
 75BRrlk4UQEMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cICkiPBA
Subject: [Buildroot] [PATCH 1/3] support/testing: fs/test_iso9660: remove
 32bit EFI tests
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

EDK2 removed OVMF IA32 support in commit [1], which is included in
version edk2-stable202511. This commit removes tests relying on it.

[1] https://github.com/tianocore/edk2/commit/1fb88ffe284782cc79e306306b8d19829b6248b7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/fs/test_iso9660.py | 79 +-----------------------
 1 file changed, 2 insertions(+), 77 deletions(-)

diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 1b86bfbfc1..947aca5f54 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -18,22 +18,9 @@ BASIC_CONFIG = \
     """.format(infra.filepath("conf/minimal-x86-qemu-kernel.config"))
 
 
-def test_mount_internal_external(emulator, builddir, internal=True, efi=False):
+def test_mount_internal_external(emulator, builddir, internal=True):
     img = os.path.join(builddir, "images", "rootfs.iso9660")
-    if efi:
-        efi_img = os.path.join(builddir, "images", "OVMF.fd")
-        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
-        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
-        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
-        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
-        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
-        # This workaround is needed only when efi=True since it imply EDK2 is used.
-        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
-        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
-        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
-        emulator.boot(arch="i386", options=["-cdrom", img, "-bios", efi_img, "-fw_cfg", qemu_fw_cfg])
-    else:
-        emulator.boot(arch="i386", options=["-cdrom", img])
+    emulator.boot(arch="i386", options=["-cdrom", img])
     emulator.login()
 
     if internal:
@@ -114,68 +101,6 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
         self.assertEqual(exit_code, 0)
 
 
-class TestIso9660Grub2EFI(infra.basetest.BRTest):
-    config = BASIC_CONFIG + \
-        """
-        BR2_TARGET_ROOTFS_ISO9660=y
-        BR2_TARGET_ROOTFS_ISO9660_INITRD=y
-        BR2_TARGET_GRUB2=y
-        BR2_TARGET_GRUB2_I386_EFI=y
-        BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat part_msdos part_gpt normal iso9660"
-        BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI="{}"
-        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
-        BR2_TARGET_EDK2=y
-        """.format(infra.filepath("conf/grub2-efi.cfg"),
-                   infra.filepath("conf/grub2.cfg"))
-
-    def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
-                                                 self.builddir, internal=True,
-                                                 efi=True)
-        self.assertEqual(exit_code, 0)
-
-        exit_code = test_touch_file(self.emulator)
-        self.assertEqual(exit_code, 0)
-
-
-class TestIso9660Grub2Hybrid(infra.basetest.BRTest):
-    config = BASIC_CONFIG + \
-        """
-        BR2_TARGET_ROOTFS_ISO9660=y
-        BR2_TARGET_ROOTFS_ISO9660_INITRD=y
-        BR2_TARGET_GRUB2=y
-        BR2_TARGET_GRUB2_I386_PC=y
-        BR2_TARGET_GRUB2_I386_EFI=y
-        BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
-        BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat squash4 part_msdos part_gpt normal iso9660 biosdisk"
-        BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC=""
-        BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal iso9660 efi_gop"
-        BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI="{}"
-        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
-        BR2_TARGET_EDK2=y
-        """.format(infra.filepath("conf/grub2-efi.cfg"),
-                   infra.filepath("conf/grub2.cfg"))
-
-    def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
-                                                 self.builddir, internal=True,
-                                                 efi=False)
-        self.assertEqual(exit_code, 0)
-
-        exit_code = test_touch_file(self.emulator)
-        self.assertEqual(exit_code, 0)
-
-        self.emulator.stop()
-
-        exit_code = test_mount_internal_external(self.emulator,
-                                                 self.builddir, internal=True,
-                                                 efi=True)
-        self.assertEqual(exit_code, 0)
-
-        exit_code = test_touch_file(self.emulator)
-        self.assertEqual(exit_code, 0)
-
-
 #
 # Syslinux
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
