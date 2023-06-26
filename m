Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8656AEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 151B841B47;
	Mon, 26 Jun 2023 16:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 151B841B47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRBVgSV2jTfA; Mon, 26 Jun 2023 16:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9590241A42;
	Mon, 26 Jun 2023 16:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9590241A42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD5991BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86E4A40493
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86E4A40493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGliTMKqhpJd for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:00:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB592401A4
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB592401A4
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:00:49 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1b7e66ff65fso18815995ad.0
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 09:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795249; x=1690387249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KzsmYNMqX1wP9Ui4cRbuC7/RPTawAjt62P/S4id+mhI=;
 b=a0m7Y36wZrZ4EXyG1pxzMl6UjaQZE6XE4ROAbNdBBfvjDZQAgdyt9/r/QqUzmJzjsl
 DMYppOnp45DiPKp6braUAfkNnAupQXwDH+q56JVNoqDmjhWbNw6W6vSy5p+FnHBBacgD
 +/eRglvwwyaoxL3sffS7C02wWSZGPVe4cBfTkaV7ig0SxnAV1cmNS3cb+kqGv9gHR113
 gjxvWq1iz5xyt2muoX2A/YSM+W+B54wg539Qi1vj1WNkk5+xcT4kypMknTC48ZBdpFad
 kXn1z8cDDKZQpuqvdGkublQ58F1qwaoYnh6SUPC0jjPZgglTe8WA+HSKUT/bSfnMK6pC
 jCjg==
X-Gm-Message-State: AC+VfDwWsCVcXbz1pBtuGdKUskfYgdDpixwjD6+uX1XrVd8pT8ONht3T
 DncLDiGnZRDAMqNeEC5XIdjKMNW0WgrkFQ==
X-Google-Smtp-Source: ACHHUZ5gQ4mtf7ufZuXng6n3O1QkTkwjzlzfXnHtUE/4IJXqw9RIBNrJfCI7bP/J/KHcqP2Iru/tiA==
X-Received: by 2002:a17:903:2656:b0:1b0:3df1:c293 with SMTP id
 je22-20020a170903265600b001b03df1c293mr7287356plb.45.1687795248713; 
 Mon, 26 Jun 2023 09:00:48 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b001ab1b7bae5asm4352343pll.184.2023.06.26.09.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 09:00:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 00:00:23 +0800
Message-Id: <20230626160030.93063-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626160030.93063-1-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687795249; x=1690387249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KzsmYNMqX1wP9Ui4cRbuC7/RPTawAjt62P/S4id+mhI=;
 b=hlPVJUQdbZgs70KAMxwpCYy1HqtRK7Cc8+BHJgJv01EolHF7L0i8kp41kNSh0V5gBg
 clKxTwQgdryMuELF5KwLQSj00q/yKEyCUcXk5kKjKZaBRNbZyBtf53VOSAJdLHGXD/bz
 ruioTQc98iRP/nUY36Bfp2qWI8OmRnr5XZjx45HeKF8vw2lmaIoVbFgZ8PQX/pknygGw
 CHc0bG8BSlRWtlo8xPG3r4Sx9YACJMma7owYr0LXVNCpUZREXRuBClPJL1UwKjpO9415
 kdM7n20lFfVMCK5qZ1STIkKEkA09RfTtx1JbdCnn8abuYEfvbzyXulIoqOI1xdGxLGAW
 ni8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hlPVJUQd
Subject: [Buildroot] [PATCH 03/10] configs/hifive_unleashed: Enable
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

 configs/hifive_unleashed_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 35cb3558f9..80c5e48f96 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -2,6 +2,7 @@
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
