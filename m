Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789C5CD3445
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 20:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B56661BDE;
	Fri,  8 May 2026 20:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6klRu_Ono6J; Fri,  8 May 2026 20:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7046761BDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778273602;
	bh=Vym1DhIvsyA3sDVfoLLTmtwjCg+QeDtWqGY8NcIOwas=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iglXxiEZNqkn/XpwBnVpkjpHjswE/svSfVEAPZbFCJqis8Q+zcjdVfffBMpH9KtjD
	 +OG3IZjzD8mI5t7N8coKkcO+W1PbD3ndCa0aC1Kbjcq34noDwAtvoQaZaaBL6IxOdN
	 CV8KbPg4XW8cXBk5dRR8rPq1Ux7Nn5Zmkqr0paEUbTtoZUeTuCEj97tEb1zWbrDFaY
	 tzWRpSAWYeEj0GXh4EA1oKXvwyq3dMTR8HbNsEMumzrzRfbYzyEirv41VNKH9bxVcC
	 JWqM4XFoCfopR7aCVn8l6yjmeXm4aQ7y54dX1WGtMi+Dyg5s2nNA2te78y4OWD5h0j
	 0RTx2dyGjS94g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7046761BDF;
	Fri,  8 May 2026 20:53:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 434C425B
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27FC5848C3
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJINfHSyuAEz for <buildroot@buildroot.org>;
 Fri,  8 May 2026 20:53:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24CA8848C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24CA8848C1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24CA8848C1
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:53:19 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 23F825FFBA;
 Fri,  8 May 2026 22:53:13 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri,  8 May 2026 22:53:03 +0200
Message-ID: <20260508205303.1367063-2-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508205303.1367063-1-ju.o@free.fr>
References: <20260508205303.1367063-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778273598;
 bh=JcP2NroNgYjtqy/zysnevuEHlxigxHPtQIUVKwQfjZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bzvrx/plRIkgRzjJYVDyxLW7wiLil7bu5uUZW7LFIQYn8C5hHxVQ5YMcW5nNqb+D3
 ZNXLiTAXxRKrfIdarF70OzzvjQW6boeuR0/kbzrOhf/IwF2kzx43Ep7/CaWXg+w4T2
 r+Z41eaFOnnmJ59l3QqPyC65aTgCxh1QMvTBgTUOOOA8/W+IEBij0X6fMwKZ+oIF58
 taGaU9hsPKjGtdm6bpzufyFMZeTnCHWzE2zMEdDDHD2StGj2n8XV0VYgn1zmLFR78Q
 tklq2OU9hBl30QjMeKUZ/kdCTmZwMSBLPlfI+4/YdJYjITTF1JpWkFkgK3FPBdN7Ec
 Vs1/W4KTJnWGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bzvrx/pl
Subject: [Buildroot] [PATCH 2/2] support/testing: test_libcamera.py: bump
 kernel to 6.18 LTS
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

The Linux Kernel vimc driver became stricter on pixel format, after
upstream commit [1] (first included in Kernel v6.11). This commit
changes the RGB format to BGR, to request a supported format.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=4c46cb2a7f1d63fa7b027af05e0393e4fe9ccb52

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_libcamera.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_libcamera.py b/support/testing/tests/package/test_libcamera.py
index c785e340d6..6d83b0c55d 100644
--- a/support/testing/tests/package/test_libcamera.py
+++ b/support/testing/tests/package/test_libcamera.py
@@ -18,7 +18,7 @@ class TestLibCamera(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.76"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
@@ -76,5 +76,5 @@ class TestLibCamera(infra.basetest.BRTest):
 
         # Capture few frames.
         cmd = f"cam --camera {cam_idx} --capture=5"
-        cmd += " --stream width=160,height=120,role=video,pixelformat=RGB888"
+        cmd += " --stream width=160,height=120,role=video,pixelformat=BGR888"
         self.assertRunOk(cmd)
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
