Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E837FD35E40
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 20:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F3280BE0;
	Tue,  5 Nov 2024 20:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMyBprvt518h; Tue,  5 Nov 2024 20:41:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AB9980DD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AB9980DD7;
	Tue,  5 Nov 2024 20:41:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A2A03B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 20:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88D2B80DD7
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 20:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgpnVAI1sf8K for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 20:41:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7655D80BE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7655D80BE0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7655D80BE0
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 20:41:54 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0D42EB00596;
 Tue,  5 Nov 2024 21:41:49 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  5 Nov 2024 21:41:44 +0100
Message-ID: <20241105204144.2563973-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730839312;
 bh=rVa35zheuZmKt7TPrkKCd8zfjhymL84rntfZpScAIUY=;
 h=From:To:Cc:Subject:Date:From;
 b=dXdUH+rPYuDdX5wThaD1ZtEkECIVTpLoQDMMaxgzbiA+FKPw/1TbxKzY1QekQS3l5
 yQpjF44yhtIrHmdHVXtgFpHMV+Q1QNnIoEw3269c0fnbkd/vrbqbnvKOp6d7L5YnhI
 T9YNY60olMIjcKg5xWBz8fCazwsr3sG+9zE2wnq+YN116rhKIxsIRBGCTPgh6ymNeX
 eIHbKpj/HkD3qy7QonMCS2NScJ+m/BEhekx4b/2awXMT9IqKCXYiVo+o9pDttKUMaS
 w1CG0w2d9QL9rwQ2VGYHJldflMuVR9PzT2LmuhXYkNeT3kIMoaAAERprGdaBTH9zxw
 aUKc/yMEmQ7Cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dXdUH+rP
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/boot/test_grub.py:
 new test for RISCV64 EFI
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

Commit f439b47ed "boot/grub2: add RISC-V 64bit EFI support" [1]
introduced the grub2 RISC-V UEFI support.

At that time, it was not possible to have a runtime test for this.
qemu-system-riscv64 is not in the Buildroot Docker reference image,
and the base distribution (Debian 11) does not provide a
sufficiently recent version. A qemu-system-riscv64 >= 8.0.0 is needed.

Commit 0d4177598 "support/testing/infra/emulator.py: add build host
dir to qemu search path" [2] added the capability to use the
Buildroot host-qemu package inside runtime test.

With this support, it is now possible to add a runtime test for a
grub2 UEFI boot on RISC-V 64bit.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f439b47ed6e987306c7de6d9c3be11de04935377
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/0d4177598ce7e73f2b97ac58c21fb177343643e3

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_grub.py | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index c753a16c34..d9b5ed2143 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -172,3 +172,47 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
 
         cmd = "efivar -l"
         self.assertRunOk(cmd)
+
+
+class TestGrubRiscV64EFI(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_riscv=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/riscv64-virt-efi/assemble-flash-images support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/riscv64-virt-efi/genimage.cfg"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.59"
+        BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+        BR2_PACKAGE_EFIVAR=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_EDK2=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_RISCV64_EFI=y
+        BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        BR2_PACKAGE_HOST_QEMU=y
+        BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
+        """
+
+    def test_run(self):
+        disk = os.path.join(self.builddir, "images", "disk.img")
+        flash0 = os.path.join(self.builddir, "images", "RISCV_VIRT_CODE.fd")
+        flash1 = os.path.join(self.builddir, "images", "RISCV_VIRT_VARS.fd")
+        qemu_opts = [
+            "-M", "virt,pflash0=pflash0,pflash1=pflash1,acpi=off",
+            "-blockdev", f"node-name=pflash0,driver=file,read-only=on,filename={flash0}",
+            "-blockdev", f"node-name=pflash1,driver=file,filename={flash1}",
+            "-drive", f"file={disk},format=raw,if=virtio"
+        ]
+        self.emulator.boot(arch="riscv64", options=qemu_opts)
+        self.emulator.login()
+
+        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
+        self.assertRunOk(cmd)
+
+        cmd = "efivar -l"
+        self.assertRunOk(cmd)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
