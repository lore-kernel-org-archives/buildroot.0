Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEE2D715E8
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 13:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD36340A12;
	Sat, 24 Jan 2026 13:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Dwd4i8x7Idy; Sat, 24 Jan 2026 13:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0A6B40A13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769260445;
	bh=F+mGU66J1Qs9JWX4tpGUu3qULDGNhU5eyTJKqfeNQ38=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dUMPphw9mkaqYCI2N5OD/ejj+cZAK+41d4zuIY1PA9ZT493LOUEd7kR3su8NBb2rz
	 U/GnuFHcsGarryuKUpuYPHnpNDkGIhdBjEBIn/AAq+AVkejgVm7RHzA99CRGHQFmgw
	 zYtt9d4c04+EUSTA7F0qQYA3v1xNEbQwaB7l3m/EXlttqR+/+I3ah7LXjm+w7AWgxw
	 3jIpriiSsPByaNwtf/hUiF9rMkKMwIh1mAa6s7Vh+lh/fNOgwkHeq68RhB3Tot/QDO
	 vPZr1U+u+5wEhX3/fEdPtp45N9/PFfGZiO1uEo5Hs/oT8IjPLSatO6qFX/SuGRGjut
	 vwFbiNgM+5i4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A6B40A13;
	Sat, 24 Jan 2026 13:14:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA4B0358
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 13:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFA2A83BB3
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 13:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IX7ZvFf3SXEf for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 13:14:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFF8883BAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFF8883BAD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFF8883BAD
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 13:14:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0B73B19F5A7;
 Sat, 24 Jan 2026 14:13:54 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 24 Jan 2026 14:13:36 +0100
Message-ID: <20260124131337.1022030-2-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124131337.1022030-1-ju.o@free.fr>
References: <20260124131337.1022030-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769260440;
 bh=a2hhb7rQjUWDvFPBmXMnJ0KF9TG7ovF75FMATSWRXZ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FwxpCMeReJ684trrR3xH7mQ50j68MKG57WtrJicHLV3j4+0UGZdU1u6WpxpnUBplc
 QwHh/KHL9XWWDt3esCc3NLVVcSSyZiRWu3pyyn48d53gOhHgNvt5SKdbeYMhCrGOGI
 90nfsbSnqWzu/3veycQUc0GiC4biwMxIppxCRyrKixrTks+w9q8pjL3fPI5/Y0Q/aL
 tlzrymDUmayVmcLLYsAdRYXVTPSBmcCJOy+gjE4rth0jC9WmIYkSfd5hv8LoU/l4M7
 yVijRnl2bgLIdG8JfxolvjJZrLqfKmRmdS+aTYLYjcY4xnQpqbCNba1adAiP6b01/M
 pkxI8Svxa2ksA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FwxpCMeR
Subject: [Buildroot] [PATCH 2/3] support/testing: boot/test_grub: remove
 32bit EFI test
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
version edk2-stable202511. This commit removes the test relying on it.

[1] https://github.com/tianocore/edk2/commit/1fb88ffe284782cc79e306306b8d19829b6248b7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_grub.py | 50 -------------------------
 1 file changed, 50 deletions(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 7ce7066875..061bfc9a2f 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -32,56 +32,6 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
         self.emulator.login()
 
 
-class TestGrubi386EFI(infra.basetest.BRTest):
-    config = \
-        """
-        BR2_x86_core2=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
-        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
-        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
-        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
-        BR2_LINUX_KERNEL_INSTALL_TARGET=y
-        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-        BR2_PACKAGE_EFIVAR=y
-        BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_EDK2=y
-        BR2_TARGET_GRUB2=y
-        BR2_TARGET_GRUB2_I386_EFI=y
-        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
-        BR2_PACKAGE_HOST_GENIMAGE=y
-        BR2_PACKAGE_HOST_MTOOLS=y
-        BR2_PACKAGE_HOST_DOSFSTOOLS=y
-        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
-
-    def test_run(self):
-        hda = os.path.join(self.builddir, "images", "disk.img")
-        bios = os.path.join(self.builddir, "images", "OVMF.fd")
-        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
-        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
-        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
-        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
-        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
-        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
-        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
-        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
-        self.emulator.boot(arch="i386", options=["-bios", bios, "-hda", hda, "-fw_cfg", qemu_fw_cfg])
-        self.emulator.login()
-
-        cmd = "modprobe efivarfs"
-        self.assertRunOk(cmd)
-
-        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
-        self.assertRunOk(cmd)
-
-        cmd = "efivar -l"
-        self.assertRunOk(cmd)
-
-
 class TestGrubX8664EFI(infra.basetest.BRTest):
     config = \
         """
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
