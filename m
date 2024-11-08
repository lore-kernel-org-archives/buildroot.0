Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35347D64072
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 18:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B53546146F;
	Fri,  8 Nov 2024 18:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TM6mU2yEsf00; Fri,  8 Nov 2024 18:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A72C26146B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A72C26146B;
	Fri,  8 Nov 2024 18:24:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A47A4D8F
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 861E942C29
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9joF8pcMpEnV for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 18:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17C3442C25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C3442C25
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17C3442C25
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:24:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4F559B00539;
 Fri,  8 Nov 2024 19:24:05 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Fri,  8 Nov 2024 19:23:57 +0100
Message-ID: <20241108182357.2511203-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731090247;
 bh=mpG3aDDF9I6GbDwy/+mOft9sIWoe8JoEPPg6w3yT/mE=;
 h=From:To:Cc:Subject:Date:From;
 b=XXcdvFRgbR4vDR737Xiyx7XTWnSvdvWV85goTBe1VY0fuD79/KwcdUxWbpQNGqDk4
 /hnqKbOOXDPrCpcgxxwvNH3jm6Irpzy/ZmAWZjaOZdml5s0gltArqmn6n/YlrjE6xe
 pABaBHX5uSqYS0FzirHnk0pP+o8WrfqsNupSEGyyFbKcR03uSQ4SMManI/AsKM4/NL
 NoprPKQW8spy48w9CXx0qtbLNlyD0l3/9VLBtJtkQIvES/L18vWBNuRJJhsJwZE2Vp
 dRtJ2UHGue2uB50LLyVf0Ikp7w4DwahGZfTD+0WKLOAJ8gDfxiusKDw+ZBYQZO7pAO
 jyvclAJV12gLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XXcdvFRg
Subject: [Buildroot] [PATCH v2 1/1] support/testing/tests/boot/test_grub.py:
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

Also, due to an upstream edk2 git submodule issue, this commit
includes a workaround to use https://sources.buildroot.net for this
test. See [3].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f439b47ed6e987306c7de6d9c3be11de04935377
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/0d4177598ce7e73f2b97ac58c21fb177343643e3
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/47fc9e5509837260310cd7e41335fade29b587b1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Add the edk2 download workaround
- Split post script image long line

Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8307626101
---
 support/testing/tests/boot/test_grub.py | 72 +++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index c6e86f7b71..5cbc7fd22b 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -238,3 +238,75 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
 
         cmd = "efivar -l"
         self.assertRunOk(cmd)
+
+
+class TestGrubRiscV64EFI(infra.basetest.BRTest):
+    scripts = [
+        "board/qemu/post-image.sh",
+        "board/qemu/riscv64-virt-efi/assemble-flash-images",
+        "support/scripts/genimage.sh"
+    ]
+    post_image_script = " ".join(scripts)
+    config = \
+        f"""
+        BR2_riscv=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="{post_image_script}"
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
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestGrubRiscV64EFI, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestGrubAArch64EFI.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
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
