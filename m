Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C703C4707C
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD7D0843A7;
	Mon, 15 Jan 2024 21:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD7D0843A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JT3fWSxBWACY; Mon, 15 Jan 2024 21:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E5F8437F;
	Mon, 15 Jan 2024 21:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E5F8437F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAD751BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9416C83D9D
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9416C83D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21X2iXTGrbQ1 for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:41:46 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C974C83B5E
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C974C83B5E
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55982826812so130019a12.2
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705354904; x=1705959704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mwaqtoTK/Y3MuLoYSuHpSX0leWmN+nafmEssw3aDTPs=;
 b=X526+37uzyb3MkCE9DDc+OQg3QrxD5qF/0QFpVD2BZntESaK/Z8cOA2JXk2DsZthgG
 KNt0Uv1L65SC41CUQBBtHDUZdgPb4Wq9LxEv/EfuIl8q31q2Cc7jd+F2ZExy1vFS8PSD
 yIIDo3jFj3wXHhIphLA5sHv+XhMAMt9fH6q7bw7QDsaiFCKm0GMdhwMkfb6W0N3O9GEg
 KTZKzaMsi7uoC9TfQBO3o3yqr0q0r2Ty6DoM0iZ8WA9AHwTdNCnzkhlA94PGRTPbe19d
 UhHa6Bl+yc/PrxniAo78UFZqsuf+rRg+QlH8mfI0xEnVZ2EjEwMISjUesE1JKyHpzU8p
 kdsQ==
X-Gm-Message-State: AOJu0YxRzyy2c8BdM0nWXZKNvqz1dHsSBrZxGlMHp4wIDzFBaaEe2dHT
 OajosencWLnigIs33cuSi6vMBIu/ONM=
X-Google-Smtp-Source: AGHT+IHCAiwrP4Xnb4NoxtXDzSKZKw43d4ROPpCIXXmr+73b7qMwf/vVmuOYfr6ORhGtphDaSMOaew==
X-Received: by 2002:a05:6402:3486:b0:559:8761:7a3d with SMTP id
 v6-20020a056402348600b0055987617a3dmr11519edc.17.1705354903836; 
 Mon, 15 Jan 2024 13:41:43 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 dj15-20020a05640231af00b0055845b1b318sm5927402edb.65.2024.01.15.13.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:41:43 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 22:41:35 +0100
Message-ID: <20240115214137.2350453-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115214137.2350453-1-petr.vorel@gmail.com>
References: <20240115214137.2350453-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705354904; x=1705959704; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mwaqtoTK/Y3MuLoYSuHpSX0leWmN+nafmEssw3aDTPs=;
 b=fGixoJ+2P18aEf1HRJdNR5g5IweLF8tcj8d2TV/CQEtQGIrZ6TPrudhJ0/xPD4SHfS
 NSHZSFM7b0pWNJCJOIIfflauoTqnrpKztqkJragd+Ckgb/+Ik6Ugl66L705lTvtZutzL
 vjMpVkoYSPff1ZzonQHLK4rf+cPFNXvXFSfUgITHGN9jKhlMzVFXbfd6eCq7X5CC07He
 vKuJZLs0DAKFuqhHd4ihOd+FttBLzPHV7ecfuSYKG4rLD3kCPzoUFSsKVdIb50Oealpr
 6g71cJqcLXXzuCsqpBIrYS4VfH2AdPJay/qLqaytRcMxhmzT/jqCYUq90bhmY/SBM9gX
 Jz8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fGixoJ+2
Subject: [Buildroot] [PATCH 1/3] linux: bump latest version to 6.6
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Bernd Kuhls <bernd@kuhls.net>, Petr Vorel <petr.vorel@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9f9cf55d96..aa6f846338 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.6)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.7)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
