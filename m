Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703DEE67488
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 21:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DD8B60650;
	Thu, 31 Oct 2024 21:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhlW05xt1zAH; Thu, 31 Oct 2024 21:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B7E360671
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B7E360671;
	Thu, 31 Oct 2024 21:35:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C145E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EA4380EAB
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DR1dtjUzB34A for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 21:35:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E3C48174A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E3C48174A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E3C48174A
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:35:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 07024B0053D;
 Thu, 31 Oct 2024 22:35:02 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 Oct 2024 22:33:47 +0100
Message-ID: <20241031213348.2057705-8-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031213348.2057705-1-ju.o@free.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730410507;
 bh=yp9/ujsXm/R/oujSoHywIDEVXOzg4YmF1JFNBrXFKfY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c/oNWnhDjsQYHDBy4gynJthepgO/3J8KRkQ+PkJJ9RJKLp3K8wNFetzbHjmBX5ADv
 o1i0kn5CPfxlJp+9h5j3ma6sWmL6nu2grGqyZnzDbJ4r6Z+pOZ2lHK5Pvkj9ee6/R8
 pwWmI6ZhA/CIOhAFs+5GiTWg8zAfW9shHOYr1URPzOw+2jST8ayrbisI1fKUi3sa9i
 l7s/REC1mkJnOsK81PQ/HFi7CdFvqYCUxbfypLrVSJdL6MRMc9Z60fmuP2Sv7b7Hl5
 aavrc/Ku0hBkOY3L6RMBSp66YitNetlcs59PV5Wa9NrcvghHPe5Pf8Yf5iQZWUxF7E
 2YScNjEYFShbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c/oNWnhD
Subject: [Buildroot] [PATCH v3 7/8] support/testing: test_fwts: update and
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

This commit updates ATF to 2.11, and enables host-qemu in the build,
to be used by the runtime test infrastructure.

Those changes are fixing this test, which is why this commit re-enables
it by removing the skipTest() invocation.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_fwts.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
index 2c9873ee54..5b79a17e33 100644
--- a/support/testing/tests/package/test_fwts.py
+++ b/support/testing/tests/package/test_fwts.py
@@ -26,7 +26,7 @@ class TestFwts(infra.basetest.BRTest):
         BR2_TARGET_GRUB2_ARM64_EFI=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_PACKAGE_FWTS=y
@@ -34,12 +34,10 @@ class TestFwts(infra.basetest.BRTest):
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
