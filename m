Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7F9CA1000
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 17:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D157D6067F;
	Sat, 30 Aug 2025 17:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ag1N2U0f044h; Sat, 30 Aug 2025 17:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15340607C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15340607C3;
	Sat, 30 Aug 2025 17:09:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE18769
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5051401EC
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8zSY6MlqW2a for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 17:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7B49401DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7B49401DD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7B49401DD
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:09:13 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0DA585FF95;
 Sat, 30 Aug 2025 19:09:09 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 30 Aug 2025 19:09:04 +0200
Message-ID: <20250830170904.1857479-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756573751;
 bh=fQUS0Z248HXGfleFlUbEFE9TsbYqIZrsIAfY8bgrFWM=;
 h=From:To:Cc:Subject:Date:From;
 b=T4OUw2iYRCj2ia7Ju9oLAEi76C7uxkI8cYdC/zahm2tch2YqFbeNby8G/iW+CaYut
 h45etF7+HOWPQy3pvHWes30GMPmNqcC7CpW/yF4Cb/ONgM+My7glNqvZu0hL10fsNL
 qvlXE8wMCFTuqEReRXtbtA4eriZVzwQ4g+auLuJ6s3vMOLDJi+seJiCUMJZiqMYCWi
 xvB8tG0jU6YTeFfYxG9De7/2zAP6sPMvCDWpFXpVt3PzZFmYX3vg9whjGZJFXEPSAs
 L6ITuENJ1VxZBoAiugJYsx/S3qSooYkeAevzdn664hACzbRUfUQ/aSj9hK2iGYObsh
 UnIklWKYHNabg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=T4OUw2iY
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/package/test_fwts.py:
 switch to neoverse-n2 cpu
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

The SBSA Reference Platform was updated to neoverse-n2 (armv9.0a)
in Qemu v9.1 [1].

The Armv9-A and Neoverse N2 core support was added in Buildroot
commit [2].

Since the test_fwts uses the Qemu sbsa-ref machine, this commit
aligns it to use the neoverse-n2 cpu.

[1] https://gitlab.com/qemu-project/qemu/-/commit/b1d592e7b0a7301eae8e3baa99744ac35db3cd2a
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/9845bd4541cb03e97e577281f3c64f00c6ead881

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_fwts.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
index e33adcaea4..90bf086a58 100644
--- a/support/testing/tests/package/test_fwts.py
+++ b/support/testing/tests/package/test_fwts.py
@@ -7,7 +7,7 @@ class TestFwts(infra.basetest.BRTest):
     config = \
         """
         BR2_aarch64=y
-        BR2_neoverse_n1=y
+        BR2_neoverse_n2=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_TARGET_ROOTFS_EXT2=y
@@ -45,7 +45,7 @@ class TestFwts(infra.basetest.BRTest):
         flash1 = os.path.join(self.builddir, "images", "SBSA_FLASH1.fd")
         self.emulator.boot(arch="aarch64",
                            options=["-M", "sbsa-ref",
-                                    "-cpu", "neoverse-n1",
+                                    "-cpu", "neoverse-n2",
                                     "-m", "512M",
                                     "-pflash", flash0,
                                     "-pflash", flash1,
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
