Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FAAC2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 11:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70055401B1;
	Sat,  6 Jul 2024 11:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaOiBmsj4ITP; Sat,  6 Jul 2024 11:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47AA840441
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47AA840441;
	Sat,  6 Jul 2024 11:07:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 234081BF23B
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 11:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C67F408A4
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 11:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zg7gg2TvHr0b for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 11:07:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F74B40891
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F74B40891
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F74B40891
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 11:07:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 95E35B0055E;
 Sat,  6 Jul 2024 13:06:57 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 13:06:42 +0200
Message-ID: <20240706110642.939667-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720264020;
 bh=DeBuyzZtmDUMxZV8Z4WkcdY3YFYGXeTB9l+wWiMzsWE=;
 h=From:To:Cc:Subject:Date:From;
 b=g+OiRCVAaGsK7rzoF0p0ckKkEgNsh2ZHJICvkCNghsUE+/gfQyFI+xtIWi52sZmQo
 hdcO/jzknr8XAMqFJH2A13uGXrkqplDvmwLg0vuxrKXMFTP52OTO9u392vgDZogTST
 fKuwwwRQARNmcHgeS5oOGr16aOabE+dwpWJe/5Xq0m/yVN1fX42A3Jk5ORGQ2kwu0D
 NNOY7wtTHRQhqxx+NQtPVpCbhsp9VBop8+ZUCUn1gngveMClHzJFF9QKBNoTiE9K9U
 2VPG6WvF6v4YDqwtTy/6gc3GWEF12/qaY0ZwhXT7C0OqtsbtKn1rhhV8M2fcdDy2FL
 kB/mRg6yGX/gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=g+OiRCVA
Subject: [Buildroot] [PATCH 1/1] configs/visionfive2: fix build by adding
 kernel header version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>,
 Francois Dugast <francois.dugast.foss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit d9e6d2d081 "configs/visionfive2: update kernel to upstream
6.8.2" removed the config directive:

    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y

but forgot to add:

    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y

It was most likely generated with a "make savedefconfig", while Linux
kernel v6.8 was the default at that time. After commit aa70c331a2
"linux: bump latest version to 6.9", the defconfig failed to build
with error:

    Incorrect selection of kernel headers: expected 6.9.x, got 6.8.x

This commit fixes the defconfig by adding back the kernel custom header
version.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7271150175

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/visionfive2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index dae9608eeb1..18e0997f19d 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -1,4 +1,5 @@
 BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
 BR2_GLOBAL_PATCH_DIR="board/visionfive2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
