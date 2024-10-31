Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91024E67485
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 21:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57E60408E2;
	Thu, 31 Oct 2024 21:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3cveUH7YeJk; Thu, 31 Oct 2024 21:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1399407E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1399407E3;
	Thu, 31 Oct 2024 21:35:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B2DA5E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18394402C7
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oss7ejuf8V53 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 21:35:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EEF994029F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEF994029F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEF994029F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:35:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6372DB0051E;
 Thu, 31 Oct 2024 22:34:56 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 Oct 2024 22:33:46 +0100
Message-ID: <20241031213348.2057705-7-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031213348.2057705-1-ju.o@free.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730410502;
 bh=JgvrF8s3uFaEDKIJLmufzY0HjYl2xv2OeqBBT8jtE0c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pQwrebr3Fr1kBesuNzzCKpAXBvkogGgarubzDBx4gKr6Upl0YwrbD71zZmUfMLZCz
 6L4B7Iu+s0h6F1ucqFfZ714noX8QmLO86jDPRZRvNBCQWXPgQ7lBAjAhTcoJiHPwP1
 BzhJw9ambdUcUc0xzmFaFaYjXd+BEJgfzsWAmQy5GjMIfnrxaMTNDP5+qm8ki4aOSa
 wkqZxP9gxb1JO0WQARLhiPoRxHK3LNm+5d0yb98z10qZFVWdLR4zmZTLBe8UvJbfEr
 jgLwectmBvrom+suNrW7zsWat+Kr7M99LHMmDQnk8jNLXcJ+bP8Zfsz9uyl7ULSdSv
 9PBn5EnCjYfSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pQwrebr3
Subject: [Buildroot] [PATCH v3 6/8] support/testing: test_edk2: update and
 re-enable the test
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

The EDK2 bump to stable202405 introduced an incompatibility with the
Qemu version 5.2.0 present in the reference Docker image. For that
reason, this test was disabled.

This commit updates ATF to 2.11 and kernel to 6.6.58, and enables
host-qemu in the build, to be used by the runtime test infrastructure.

Those changes are fixing this test, which is why this commit re-enables
it by removing the skipTest() invocation.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_edk2.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 7d350f52d9..e6b7855284 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -16,7 +16,7 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="support/testing/tests/boot/test_edk2/linux.config"
         BR2_TARGET_EDK2=y
@@ -25,18 +25,16 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_TARGET_GRUB2_ARM64_EFI=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_PACKAGE_HOST_GENIMAGE=y
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
         BR2_PACKAGE_HOST_MTOOLS=y
+        BR2_PACKAGE_HOST_QEMU=y
+        BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
-    def setUp(self):
-        self.skipTest("Incompatible QEmu 5.2.0 (Docker image) / "
-                      "EDK2 (stable202405) versions.")
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
