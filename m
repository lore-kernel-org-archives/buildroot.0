Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130E4E67485
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 21:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB0F407E4;
	Thu, 31 Oct 2024 21:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5lOczlBGg86; Thu, 31 Oct 2024 21:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5AF8408B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5AF8408B3;
	Thu, 31 Oct 2024 21:35:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 390125E46
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3CA5408C0
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8zNgYijbPsi for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 21:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3007408AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3007408AF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3007408AF
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:35:14 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BC486B0051B;
 Thu, 31 Oct 2024 22:35:07 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 Oct 2024 22:33:48 +0100
Message-ID: <20241031213348.2057705-9-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031213348.2057705-1-ju.o@free.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730410513;
 bh=asoq9VIUujg7p9rLO0ui1l/+7xXZJU9Vlwmov5Lmrm8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k2iwC045sOhUGpAx3IVgLyIn393bTPwLTyj5kigm82Xh7AX1hOTG0Ou8X85DxC/X1
 U198UoC/bQZNnDsOMUPL5M/uqIvDXsEOKkoRvTkDPvHrzn1nldq15Ht3kZfUIoIFqR
 oIWj3EwFBrl7h+ontTqkEpTz6zmX1z4ME5FtOC6Vgoc3T2pJOKo1OvhIkxDEcFf0Xr
 iA6HaPcpIzgRjFR0etQkmdYrrSEj9jUloqn2iVejy8i5afU1dP+ig6LFWll7oaCa0J
 AdXXW8glPXenZJDQ/Mikv/SZ8p1V0q6PQmrE7Twl6BwocOJ7w9NUmG8EN5TSfEVG4S
 uNXVL0pxvGyqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=k2iwC045
Subject: [Buildroot] [PATCH v3 8/8] support/testing: test_grub: update and
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

This commit enables host-qemu in the build, to be used by the runtime
test infrastructure.

Since this commit switch to a more recent host-qemu, it also removes
firmware options to workaround old qemu bugs.

Those changes are fixing this test, which is why this commit re-enables
it by removing the skipTest() invocation.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_grub.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 41234de2b9..c753a16c34 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -153,13 +153,11 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_GENIMAGE=y
         BR2_PACKAGE_HOST_MTOOLS=y
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        BR2_PACKAGE_HOST_QEMU=y
+        BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """.format(post_image=infra.filepath("tests/boot/test_grub/post-image-aarch64-efi.sh"),
                    linux_fragment=infra.filepath("tests/boot/test_grub/linux-aarch64-efi.config"))
 
-    def setUp(self):
-        self.skipTest("Incompatible QEmu 5.2.0 (Docker image) / "
-                      "EDK2 (stable202405) versions.")
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "QEMU_EFI.fd")
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
