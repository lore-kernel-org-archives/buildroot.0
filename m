Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD08D68BE7
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 16:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12EFC845B2;
	Sat, 16 Nov 2024 16:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbtZJFJ0yIDE; Sat, 16 Nov 2024 16:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0689381098
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0689381098;
	Sat, 16 Nov 2024 16:35:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66957B14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 16:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4574440436
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 16:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DiDCxP9eSVSV for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 16:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C957C40363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C957C40363
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C957C40363
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 16:35:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E5334B0051B;
 Sat, 16 Nov 2024 17:35:45 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Nov 2024 17:35:37 +0100
Message-ID: <20241116163537.12530-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731774948;
 bh=QPfpqxaTKopTt83h8dDJR6dS4ZTJaTnAUMLOmyCWFks=;
 h=From:To:Cc:Subject:Date:From;
 b=A2aasCkNj0b8RZKtuRxbVo01bk65M2D039VhmS6gtHlg1Ji91YmawVXz4R+ePtrb3
 hfnByE/pShyLAtN7tEM934vHLolczGIELOVrUM8SbrPDeJd0EV4LcWglP/xC4/pxa9
 NO7X6wDYuVRBedywXAiIVQ1Jt2xTG8aV4oQ1KzB5hy3zmI5JrNvX9jq8kKjVO3cssH
 wfUlZzqrHimrOVRAIbMBmkHDtsafc5ilcwCQX4i6jdvPSGPZsTFclJ5YywzeY9HJeR
 Y1eDogp1Ke7KOcYQTRN5q2MJL6/uLkY/a1q6Uqaiqv/PUK3A54uJO+YbW85xB87dRM
 sz2CowiFRCWTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=A2aasCkN
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/boot/test_edk2.py:
 switch to neoverse-n1 cpu
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The SBSA Reference Platform was updated to use the neoverse-n1 cpu
(armv8.2a) in Qemu v8.1 [1].

Commit c58a2a968 "configs/qemu_aarch64_sbsa_defconfig: switch to
neoverse-n1 (armv8.2a)" [2] reflected this change in
qemu_aarch64_sbsa_defconfig.

This commit updates the	test_edk2 runtime test the same way.

This update is possible with the help of commits [3] and [4].

[1] https://gitlab.com/qemu-project/qemu/-/commit/1877272bad7b08b67312503ee66184279876c7bd
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/c58a2a9687c045379c0f768c8c6c1c1a41842a85
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/0d4177598ce7e73f2b97ac58c21fb177343643e3
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/fba62f2ab13c095de860a07851d148181f4e38bc

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8388684107
---
 support/testing/tests/boot/test_edk2.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 39d7a4dbcc..54a59089da 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -7,6 +7,7 @@ class TestEdk2(infra.basetest.BRTest):
     config = \
         """
         BR2_aarch64=y
+        BR2_neoverse_n1=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_TARGET_ROOTFS_EXT2=y
@@ -63,7 +64,7 @@ class TestEdk2(infra.basetest.BRTest):
         flash1 = os.path.join(self.builddir, "images", "SBSA_FLASH1.fd")
         self.emulator.boot(arch="aarch64",
                            options=["-M", "sbsa-ref",
-                                    "-cpu", "cortex-a57",
+                                    "-cpu", "neoverse-n1",
                                     "-m", "512M",
                                     "-pflash", flash0,
                                     "-pflash", flash1,
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
