Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0716EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7DA4195C;
	Mon, 26 Jun 2023 16:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A7DA4195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OW4plGGO0B15; Mon, 26 Jun 2023 16:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C25941B90;
	Mon, 26 Jun 2023 16:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C25941B90
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 756501BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F37361324
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F37361324
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6tXx1jhNDwG for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:00:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D823612EC
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D823612EC
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:00:57 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-66872d4a141so1585039b3a.1
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 09:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795256; x=1690387256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+js6cZZfo9hQTja6tJ2Ek2izbQuknZDQW7K08w/0qE=;
 b=KD0hP5iUvHf1HKf/3t5GfJ2rQVUbIwgVgbV9lbSDo5OGBjdk/SAybFxzdggDw09GTS
 4FXqF/hgys3plHMyaEXN5/NZep4ZqGTABI+A1WgiBAL0nxq/AfpGcw6+3xplB8CxPzLv
 Tod/75CqIwMJ7OkT70MTt7CMwvgvR6F78rNwLMDAsvHSBShfx/3UoqgLdJ6FzUAHLrPc
 rsKu/6A4KNayCmOzJd6RD2BJBBHFgalAJZEk2T+KkP7Xs7IxmzPCiweu7lCQwt6cjsdY
 qR6AN0OQXkj5HMpD1OFQ/pwuwyuR70wKDHFqFith40So4Q78gBDvWOTcm5Z0PpRVXYSy
 DHtQ==
X-Gm-Message-State: AC+VfDzrLPjt25MssuH8/F9WotN9uIqeyNyHlfr33/MQAAsyQg1IQxIR
 Plq722J+TSzPEJjSXqdSHvG4BY4zEIHYSA==
X-Google-Smtp-Source: ACHHUZ6k7uNGdj3FvKnBWbH93qcq5ADhdguS0JB71V24wEQ3iNrfVfBk5UV8RCRVZRb107OdwBa5yw==
X-Received: by 2002:a05:6a20:7f99:b0:10e:d4fb:b031 with SMTP id
 d25-20020a056a207f9900b0010ed4fbb031mr21953576pzj.61.1687795256266; 
 Mon, 26 Jun 2023 09:00:56 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b001ab1b7bae5asm4352343pll.184.2023.06.26.09.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 09:00:55 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 00:00:25 +0800
Message-Id: <20230626160030.93063-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626160030.93063-1-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687795256; x=1690387256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w+js6cZZfo9hQTja6tJ2Ek2izbQuknZDQW7K08w/0qE=;
 b=qqTJxf158uaOf5xEux6qxouuLDpPMvpd1BcJgDzRf+mdJItzbxF8eSekRTa+SBJ/23
 mMOO0pToGarWVV1vVcOLxybjUoCRBE7BaIqg0Sc5JT8azk7cS3EROdVvA+/9Q4Ybod0Y
 QbMcxaCnlYIg/tFgGnDASARFEBGfxfGNfKvicugAX+/Lw8NBHF3XY6BQC2/Rl9Uu7GPE
 +VXNJqZzlOvPslYddBqAbEC1dCuuDMWtMgvSWCM/MSBbZIDf6jNJ0uEJO4GugcB+HOPc
 RaguZj+w8SMM8TKPYjfv1ONw0H93CwWKXVlZqQQMpFjRW70CY6j6peKHFFyd5U/HsGlB
 A9iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qqTJxf15
Subject: [Buildroot] [PATCH 05/10] arch/Config.in.riscv: Remove
 BR2_RISCV_ISA_CUSTOM_RVA from BR2_riscv_custom
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

BR2_riscv_custom should only contain the basic I extension. The A
extension should be optional and selected by board configs.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 arch/Config.in.riscv | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index b5e84389e0..853e8deb06 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -35,7 +35,6 @@ config BR2_riscv_g
 config BR2_riscv_custom
 	bool "Custom architecture"
 	select BR2_RISCV_ISA_RVI
-	select BR2_RISCV_ISA_CUSTOM_RVA
 
 endchoice
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
