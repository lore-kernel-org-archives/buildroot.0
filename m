Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A8DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 05:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADDAF60C20;
	Sat, 17 Dec 2022 05:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADDAF60C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21h7HI3ksy9F; Sat, 17 Dec 2022 05:14:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D2560BF2;
	Sat, 17 Dec 2022 05:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19D2560BF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE46A1BF38B
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96D8E41BC1
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96D8E41BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b4ZlQ-Orle17 for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 05:13:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE75C41BBF
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE75C41BBF
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 05:13:43 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id a16so4358816qtw.10
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 21:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dURROxIsC08ERbg7eJ/FQJ7NMjh6YpQSanWHAOT/RcA=;
 b=GKACuoKLJTgCEzvssch4YkQ7BDK/e5iSqpqhEsskcn8ZOGdPN982KnwuzvRldDKHZU
 cX2peSFAf6zzhLCbrIQ4ch3g+sUCQgrDhopSJ3V3muO00/nwZ/8Xj4r1sPwzCMgmzQ5Y
 u966Zc67MFjk6O+Na5Ue0FBEmBc8tcAoBcHdxaHU3i2ZascZy+ecHLOGdIg5xi/yaEXT
 16F32RaD1t2thgAWQ+DsNg1lS0v1fQmT3SVI3YmiUbe1Kx7n3p0kuvOxDxgS3nHP88U9
 KKfHYZJ59fTN7tNmEkwN7Xm+QHo9EY52fVrZctKf0ImQp5L1Ml9ca6A6eY4r9b59vYzy
 bgkg==
X-Gm-Message-State: ANoB5pneUhJ9u43XVEPoZlWRN8sZN3ePXk9uoZG8mpzMGrH2ydkZyTS3
 2rO47t2mwvAXsCsErubthIB5e417Bs0=
X-Google-Smtp-Source: AA0mqf7TJIrsLb//f0Dv6BAziKV6ondJMVVarBsWCLfhDc7Val7yZdBID5eMkl+z6/ycc4zF8gK55Q==
X-Received: by 2002:ac8:5e89:0:b0:3a7:f642:1d35 with SMTP id
 r9-20020ac85e89000000b003a7f6421d35mr49500968qtx.56.1671254022289; 
 Fri, 16 Dec 2022 21:13:42 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab
 (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
 by smtp.gmail.com with ESMTPSA id
 q17-20020ac87351000000b003a7fef41526sm2448854qtp.77.2022.12.16.21.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 21:13:41 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 00:13:36 -0500
Message-Id: <20221217051337.3778405-4-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
References: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dURROxIsC08ERbg7eJ/FQJ7NMjh6YpQSanWHAOT/RcA=;
 b=WbDLEG1NI5YqszmeDJ/3abmF9szCrqPTIAxZPbU50pmjjGg82gQGJr5kpEiqTlPiGI
 IUEbTX5+zBEBc5vFa9OrtBZsdHS/h0v7IVLaxfNAm754KA9oCiqbFthYNaxyW1Wy82Zc
 r6W5AP0CAC6/CrfRsIy+FTiHBrWi8P9CTL+EfFR4OuzXUEWcjyWpeTRF/mjHPT2akTaz
 +yLKy+39HHftZjpWS/Ur2wxg2wurTCUK+XH+u6J/LLlVIQEM4DXM8VYrEmcLIihF3BN8
 Pua20jJmPztcBT0EFg5kdliIzlf026wZx0p3c9QZeSfy133h1P1oT19F3DhhPcuttIBG
 AsSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WbDLEG1N
Subject: [Buildroot] [PATCH v2 3/4] arch: Enable support for RISC-V 32-bit
 NOMMU
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
Cc: Mark Corbin <mark@dibsco.co.uk>, Jesse Taube <Mr.Bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Charles Lohr <lohr85@gmail.com>,
 Yimin Gu <ustcymgu@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yimin Gu <ustcymgu@gmail.com>

Allow RV32 to select to be built as a NOMMU architecture.

Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
Cc: Jesse Taube <Mr.Bossman075@gmail.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/Config.in.riscv | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index b5e84389e0..c79cf9b410 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -71,7 +71,6 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
-	select BR2_USE_MMU
 
 config BR2_RISCV_64
 	bool "64-bit"
@@ -82,7 +81,6 @@ endchoice
 config BR2_RISCV_USE_MMU
 	bool "MMU support"
 	default y
-	depends on BR2_RISCV_64
 	select BR2_USE_MMU
 	help
 	  Enable this option if your RISC-V core has a MMU (Memory
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
