Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5E2EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91DE141944;
	Mon, 26 Jun 2023 16:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91DE141944
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvsLeLlk-zc5; Mon, 26 Jun 2023 16:00:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15F9A419C3;
	Mon, 26 Jun 2023 16:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15F9A419C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5531BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11A1E820AF
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11A1E820AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chNeSsDrp9XC for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:00:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E067F820A2
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E067F820A2
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:00:41 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b8033987baso7801535ad.0
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 09:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795241; x=1690387241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oz13VbMiJesfMrEtHGYOrmLjvyBfykWJisBT9skRSAM=;
 b=lsOjikzQ9W4koWC30yCsU+7J5UcOuWuadflibwO4LUD9DYkxinA1Ya7+iEPG+4PdUQ
 rLSowpxMOKI09mAcOMAVuBDqKNArQISnW2OemTiJLrXoesTJi7+kYFhDGtpMtUJ2LXvV
 DWHkhW7h8pjMbFCrFA04nC8AjBJ7TYTRgBvd5UiuPMcFtFdpjtv14sCibBOl6elIJ7j8
 0jAhvwORj/bBI+Am2pGpGEPDwoBSmTxZl8ZzYEibWTd4zHUQdnmOjcFqgWtoMM8Tty62
 yG8kTsiVsGnRrxvQxWKDqWawtDhaI5bKbLKHMWSy+XeW0ZiguTtQsRgp7FpC7FStxDBW
 YkuQ==
X-Gm-Message-State: AC+VfDz2M14LbEYqS+Q3TA0sxjejeVg2J/VVF28WgBjpNiUqcoV7r4ou
 uYeqv/dFtoj2zVT99Yr/XACghxdmef2gpg==
X-Google-Smtp-Source: ACHHUZ7Q50kAHeqhpHZ6rCpobb0APALi/rEM1K7sMmAQXf4w32nNWJiXUeloseoCpA2TKVXbRDm7iQ==
X-Received: by 2002:a17:902:d491:b0:1b7:c09d:3f7a with SMTP id
 c17-20020a170902d49100b001b7c09d3f7amr10228494plg.11.1687795240898; 
 Mon, 26 Jun 2023 09:00:40 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b001ab1b7bae5asm4352343pll.184.2023.06.26.09.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 09:00:40 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 00:00:21 +0800
Message-Id: <20230626160030.93063-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626160030.93063-1-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687795241; x=1690387241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oz13VbMiJesfMrEtHGYOrmLjvyBfykWJisBT9skRSAM=;
 b=SnJwRYe61K/xPqIuzJRTYq0keJZKACB66dVTGwqRCxfvdWQ+W5hk7RZNs1QmUKVTXB
 YQnAo0LPmV+zza5iLiUN4SVDeCZbcCQLOTFEnnRL9dt/p9erFaUXus6CS9qMXxa5Yjmg
 0v5JM9Eum9ijYU/CUC/tZra1u9WeKT00E1WMtghW/LJtFbAa5pO05TwsoaigKMv87eeb
 VhER6JiTQF6l1+jq4AXke2iNiZgUiZqcENZoqQq9uhkc6mHKe9CZLDbjihVmkqNURP4w
 EUh8xGyK/FbUrcC+TWEvzj1tKhHfJY1BxNot5iG4fzPv0uNo0lOlHyh9fst4MZsSdE7G
 1Mgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SnJwRYe6
Subject: [Buildroot] [PATCH 01/10] configs/hifive_unleashed: Update to use
 OpenSBI 1.2
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

Since the rest of RISC-V boards have been switched to use OpenSBI
1.2, let's update hifive_unleashed to use OpenSBI 1.2 too.

Resolves: https://bugs.busybox.net/show_bug.cgi?id=15658
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 configs/hifive_unleashed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 2b6ee6c08e..0440b14ba5 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -38,7 +38,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # Bootloader
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="0.9"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
