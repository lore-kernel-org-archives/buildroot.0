Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FE0C04FFE
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 16:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3192606C2;
	Mon, 20 May 2024 16:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwKvZmhAflIk; Mon, 20 May 2024 16:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC9B96066D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC9B96066D;
	Mon, 20 May 2024 16:59:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0531BF38E
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 16:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 281F76066D
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 16:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIaFQJ5ZefYc for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 16:59:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.161;
 helo=smtpcmd14161.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 661F36061A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 661F36061A
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 661F36061A
 for <buildroot@buildroot.org>; Mon, 20 May 2024 16:59:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 96LrstlYV0ADe96LrskWdd; Mon, 20 May 2024 18:59:08 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 18:58:01 +0200
Message-Id: <20240520165801.2247467-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJIy6rnefndnZG+mqg9U46eWkd0LIpdsYdQO/4Eox5hugFM6G1EuIOpyXsMLZIFv+j6/QSNTOLFK6E3+iX6IrMC5vJDGph0I7sOzy6VSSL5qzOX7WGDk
 XRvZj8uXH3qho9s7kVx1d2I1Xe54BCHBdISc3Vrxuor31XsqnhiN5ddU57muRNn5EDuD9TO1F78ULPs2EZANQloTXYwYfyBZsd8GZtCftxcxLmjOhSBW31vU
 JJJFYvvHTcTuxIIqk+Bs8JeY5uaqK/zA0p+Lq6Z2s3os+tHzNXq4m4bRJfh94hCwgYHxBflqPfGjb7YudS6cFw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1716224348; bh=Cay7OLeC6PQaeIoWBfVQrCHhCZCOI5uYaDBu0FzDAfk=;
 h=From:To:Subject:Date:MIME-Version;
 b=FXoJVd59yquhLcqhU6YzcXmZnpPmM1HrV42P/chQYoKFXTq62GFSU+LpsHLih5cxw
 pyWtPZZcPRj5rdtoDUjuSZJ318OFQ8ewU/SJUY0RBVSVLXAQWA3/czZHFpbKNZvirT
 DeI9Zp2nGOqvDbT1vZEQx8Tigankyw8jrUQ4+nh9fLcoPghfW6hjSrewKjmEMAYh6j
 HmwC5/6q5WBmmyDnpctci4PEx2ahN/2JxviDfjP02tK+D8I2Y1ngeDBRp//0WNW3wg
 QBEhutqhO9oQoOtdIDB6QeqA7RmCMHkzR3O855jVyih7+cEE82cMx7xSO+fzfcB4Gk
 Qr4HxdzH5ohIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FXoJVd59
Subject: [Buildroot] [PATCH] configs/amarula_vyasa_rk3288_defconfig: bump to
 Linux version 6.1.91
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596548

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/amarula_vyasa_rk3288_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 7976537225..0dd47f498f 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.91"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
