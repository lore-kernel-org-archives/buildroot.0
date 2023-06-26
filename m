Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8DCEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E22F941B4E;
	Mon, 26 Jun 2023 16:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E22F941B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X73ILh274XZ1; Mon, 26 Jun 2023 16:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBBAD41B68;
	Mon, 26 Jun 2023 16:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBBAD41B68
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCB101BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5FBA61324
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5FBA61324
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFTd3dZP2f9f for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:00:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E9DF612EC
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E9DF612EC
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:00:53 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b80ddce748so4813605ad.3
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 09:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795252; x=1690387252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+wLPcUXp/114KUYtzXM6sz8/KM+LafV7vNaVJcODX8=;
 b=OfrBy6iFBNYZjxLDx64c0EPXnxDA3F2lkbV9ONAHpDeR9TClVcIlcU7pL6suKyngKk
 1f+W/wPfH4lt6QdLv7aLy+Xx3l70DGSANOHX0ZIvyBvpPSAvo3rDcUsEO325rjGwv+rp
 2o3Zg8v8HSWt5NQM4aA6hXBu7hhxQnuUgYBXRvCIIPnZKAHt7JNJI7BNyiwwhurm/6Ay
 V8iMs71I631JpABFBIHAUWzN/CRttLqwtR3vW7SpLz1Mu/TaScyk1lkEIGtN1avNtmwq
 Wd/Apwho85UrX0g7/t/i/aeQRF2cDp9nJ0kLg6lGKNKn+Cdh/tOiYh9znGxDa5QxeY5K
 UhaQ==
X-Gm-Message-State: AC+VfDxIoq+tBChM8i2PuXc5/R1gCqPUjEoBWaF5qC8rUC6bcpgZfnyI
 z7TT7qwXPUfFLDWGWBuM3No0FxAwBTdIhA==
X-Google-Smtp-Source: ACHHUZ71pGEBz0n14c/A2v0FSVubLiUqPEkkXqkekV4bM32oPZyHtZ0j8eAoBJSi2PD7EJylyLKFdw==
X-Received: by 2002:a17:902:cec9:b0:1aa:ef83:34be with SMTP id
 d9-20020a170902cec900b001aaef8334bemr3778710plg.47.1687795252509; 
 Mon, 26 Jun 2023 09:00:52 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b001ab1b7bae5asm4352343pll.184.2023.06.26.09.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 09:00:52 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 00:00:24 +0800
Message-Id: <20230626160030.93063-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626160030.93063-1-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687795252; x=1690387252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n+wLPcUXp/114KUYtzXM6sz8/KM+LafV7vNaVJcODX8=;
 b=bKGQRmds4F9RckgevsbkkTlvD+aB4L4FoMuhq+DUuHXp/hn+IvWRJZyCMsYWEm6g/l
 TwIJcGzgre+laH+4pbegTz3pgr6xFMc1FrAuW55bSC/VO+g5VnYEr/dagKR/+7dJnH2y
 zYB64iodI0TmI/UsaU4GIry3K+3sxlrAKw4Y/DiLsZmtnIyWUTVNv+hStbA3XSEsWAdf
 7Hd638LFk4exJqpozqpjrjgdIlLLtv2b+Gp9ztuniNeA5wwnVijMwnNaHUvqFEdWwriJ
 od+FrlWeEBIuRRgMzjUZEOaosBj+HkMu41UkJPBMy+kgRq+zIM6DNaH2FDgHihEoFQ/J
 JvAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bKGQRmds
Subject: [Buildroot] [PATCH 04/10] configs/beaglev_defconfig: Enable
 BR2_RISCV_ISA_CUSTOM_RVA explicitly
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

BR2_RISCV_ISA_CUSTOM_RVA is currently not explicitly listed as it is
selected by BR2_riscv_custom. This looks confusing. Let's enable it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 configs/beaglev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 79af8c2ece..42c732b973 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -1,6 +1,7 @@
 BR2_riscv=y
 BR2_riscv_custom=y
 BR2_RISCV_ISA_CUSTOM_RVM=y
+BR2_RISCV_ISA_CUSTOM_RVA=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
