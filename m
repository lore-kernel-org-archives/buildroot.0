Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FEFEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21C0A405AE;
	Mon, 26 Jun 2023 16:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21C0A405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0tbnrp-UJLd; Mon, 26 Jun 2023 16:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 084A340235;
	Mon, 26 Jun 2023 16:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 084A340235
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 121DE1BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB7494194E
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB7494194E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsQWmU2YERrZ for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:01:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A13041AEF
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A13041AEF
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:01:12 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b80bce2592so4940095ad.2
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 09:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795272; x=1690387272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=trN12mdq35hwNo0wVVcY6JZTdMqbzcJlBuUGeH10IgQ=;
 b=HWakcuwdURag9fGrffxPWLIELBimnns7paHV4GHujucGr+azeHtJmbd3T8tAoNjaG9
 KvhJlvXc7zpDuqsYL4/QVBQsBY26ENa47i8vOS+GjBPZeP+Nd6ZkvZJ9FfRYfEcxyIEW
 RCLpn60uwQ/kzd0gL/0s+ZoODldqlGO2tRFfs66A9MZepQwl0UVAhDjwhdg2Ooxb6314
 7ZePWZtrAvqKwPenn4gGpMX5Bk+B7QltFsR5DP4Z92ShYKx2sjGlgWwwrTaPXZn10RKT
 9rQ6n5PMM8Sh6AAcV6v1eGaYq5J/NqUj4ii8Uf0hsNXaszN+RyondxU/wbXHuJ+x5DNd
 Zs9w==
X-Gm-Message-State: AC+VfDz5C8f83BpGIVSk7ssTV5kSU+BY+7m2cuYOzJDeCag2anO9zYHH
 vQ8aZ7GvsoGpL/S5cL+vARDbGKGbvVp2Dw==
X-Google-Smtp-Source: ACHHUZ74AICzyMVpFosRhacqM7WQ0Q9pqDDeBXF2lgtOy/4VcwPIjOW/h3lIC2Pgbuk2cS2BFW3bxQ==
X-Received: by 2002:a17:902:c085:b0:1b6:a972:4414 with SMTP id
 j5-20020a170902c08500b001b6a9724414mr4036430pld.3.1687795271873; 
 Mon, 26 Jun 2023 09:01:11 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b001ab1b7bae5asm4352343pll.184.2023.06.26.09.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 09:01:11 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 00:00:29 +0800
Message-Id: <20230626160030.93063-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626160030.93063-1-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687795272; x=1690387272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=trN12mdq35hwNo0wVVcY6JZTdMqbzcJlBuUGeH10IgQ=;
 b=pgMR55Hitn3NPh8EH2ZhK5WBNJWWd77ukuS5cCwFWOurwDmJg/jlqAzFHV+4XTrVOS
 85uu2vu/LUhAiI/BfGdhvMStbTW0kKXlyRlS62S9DglIp4AOAMxTKQtccVRxz11svs7L
 9GMcY0zbHTpTvTFF3hSneZ8mrTwjTEAh2r1zuksQnu8/+be6qfEll7Z8Iaz37Vn3OaY1
 I/22hojYCZOi7nY9H+wtF0XyOWFnvDexPc/ZIbG2LUyHk1um0611OQeZXsshi4oZl+5S
 N/+sgpNVgqXAjTAvbtU3s/jPeNFUVc7ax92m2gLJQ5gT7ampxzV+qU76d4HDJQPPuadp
 IHuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pgMR55Hi
Subject: [Buildroot] [PATCH 09/10] board/sifive: hifive-unleashed: Update
 rootfs offset
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

As the rootfs size is set to 60M, let's put it right on the 4M offset
in the SD card, so that the generated sdcard.img can be exactly 64M.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 board/sifive/hifive-unleashed/genimage_sdcard.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
index 079ac5ed26..99e3525a8c 100644
--- a/board/sifive/hifive-unleashed/genimage_sdcard.cfg
+++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
@@ -17,6 +17,7 @@ image sdcard.img {
 
 	partition rootfs {
 		image = "rootfs.ext4"
+		offset = 4076K
 		partition-type-uuid = 0fc63daf-8483-4772-8e79-3d69d8477de4
 		bootable = true
 	}
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
