Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9EBEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9E4541928;
	Mon, 26 Jun 2023 16:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E4541928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZU9AbDxgf9S; Mon, 26 Jun 2023 16:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C41D14049F;
	Mon, 26 Jun 2023 16:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C41D14049F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5CE41BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE24241991
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE24241991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIUIeqgLskg1 for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:01:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC7FD4195C
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC7FD4195C
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:01:16 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b7e66ff65fso18819445ad.0
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 09:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795276; x=1690387276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OtDn3G3zGatgbrXd0v+vxsOBi1iU95ziQvtuXUFgK3s=;
 b=b7UsunjqT1QlX8BC6LwHiCCkmihVrPaoyVXAvVvH+/FdwjwmqTir3AS4hdYmYY6KjT
 XFr8ZfS/MbPQldZTKHR4d24j45F2WNwM9VCCDcol0J+Kk0yvRB4d6kvj+IGcrn43099c
 B4K8FcRCQX85YAEt8C78Tih3W0TOOioap2XKsl8V2L78AifYCJClRaLpVSxKRjsJDGIq
 IV8y2ICrpGhWibaFSLLX54RXsQempNXQCJHUGJEdcGJPP7lIZO5kSVAHl1wczAjCgYr1
 UkA2MvDx0NyxIUmDMqERn3aK1I6gbIh6ltgoZuw9ah0j8Qv8jccWBAgC7odgsylXqJM1
 bBZg==
X-Gm-Message-State: AC+VfDytgt4bZ2VsIIt/5/8NvXokrdt65vjACEy6NZeUiiwuhK9OHOuF
 /umwojDPvfoJ/pzepaUclXY0TINzFNelCQ==
X-Google-Smtp-Source: ACHHUZ4jZ6E6wIRLgXXun5bse285Nr3UyKxXjyBF3+gn3WN+V+4yWVsJjryM0+HRNc3829YFkJrU6A==
X-Received: by 2002:a17:903:1205:b0:1b3:e90b:93e1 with SMTP id
 l5-20020a170903120500b001b3e90b93e1mr11351163plh.36.1687795275710; 
 Mon, 26 Jun 2023 09:01:15 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b001ab1b7bae5asm4352343pll.184.2023.06.26.09.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 09:01:15 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 00:00:30 +0800
Message-Id: <20230626160030.93063-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626160030.93063-1-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687795276; x=1690387276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OtDn3G3zGatgbrXd0v+vxsOBi1iU95ziQvtuXUFgK3s=;
 b=ekTokYS61PSeD6jqSquOh9IW4Nhtz93uiDPJo7eCw+FrNOG0S17mfeO3n/SvHarP8v
 fb7V7FpS7sz5ZT+0/nbWJW92Q8WHqSHuM14tzaUs1gmuj46CqGCx8yzY3mq1FvebeMGM
 of7tbidTsEL5niFKpTnF1ZLjszZj6kTvXNcXSa6+D9FtPbOigxs4Q43bjSkptgJf/2Is
 7ecCZqxdImFhW3FDgzvhLTQSuANBkM5VXO7OpuGG54HmMbUm7WkYYlCGxhm2mBQZ30sj
 B3dOjrTm+V/nhjRr4WCFR2w5LkCZ0JIKKPBLgWBGR4On+Xr1nfvG89becLDLKINcHClS
 DtCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ekTokYS6
Subject: [Buildroot] [PATCH 10/10] board/sifive: hifive-unleashed: Include
 QEMU instructions in readme.txt
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bin Meng <bmeng@tinylab.org>

The upstream QEMU 'sifive_u' machine supports running upstream U-Boot
for the SiFive HiFive Unleashed board out of the box.

Add the QEMU instructions for testing in readme.txt.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 board/sifive/hifive-unleashed/readme.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/board/sifive/hifive-unleashed/readme.txt b/board/sifive/hifive-unleashed/readme.txt
index 3263913e9c..e9ccb26fa6 100644
--- a/board/sifive/hifive-unleashed/readme.txt
+++ b/board/sifive/hifive-unleashed/readme.txt
@@ -113,3 +113,20 @@ Booting the SPI flash on the board
 
 Make sure that the all DIP switches are set to the off position for
 default boot mode (MSEL mode = 0110) to boot from SPI flash.
+
+Testing under QEMU
+==================
+
+The SD card image can be tested using QEMU:
+
+$ qemu-system-riscv64 -M sifive_u,msel=11 -smp 5 -m 8G \
+    -display none -serial stdio -nic user \
+    -bios output/images/u-boot-spl.bin \
+    -drive file=output/images/sdcard.img,if=sd
+
+The SPI flash image can be tested with a slightly different command:
+
+$ qemu-system-riscv64 -M sifive_u,msel=6 -smp 5 -m 8G \
+    -display none -serial stdio -nic user \
+    -bios output/images/u-boot-spl.bin \
+    -drive file=output/images/spi-nor.img,if=mtd
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
