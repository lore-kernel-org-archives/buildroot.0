Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB81C369AB
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 18:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A1680F84;
	Sat, 12 Apr 2025 18:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LAI4Xr1k7M9; Sat, 12 Apr 2025 18:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B08581207
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B08581207;
	Sat, 12 Apr 2025 18:40:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C870138
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 18:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A56181184
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 18:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_G9d1s75z73 for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 18:40:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.246;
 helo=fllvem-ot04.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 605BF80EDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 605BF80EDC
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 605BF80EDC
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 18:40:04 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53CIe3xT2395295
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 13:40:03 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53CIe3P9033589
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 13:40:03 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Apr 2025 13:40:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Apr 2025 13:40:03 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53CIe3jP101748;
 Sat, 12 Apr 2025 13:40:03 -0500
Date: Sat, 12 Apr 2025 13:39:58 -0500
Message-ID: <20250412-optee-fixes-v1-0-14bf0f629d1a@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH6z+mcC/x3LSwqAIBRG4a3IHSeoGD22Eg1C/+pOVDQikPaeN
 Pw4nEoFmVFoFpUybi4cQ4PuBLlzCwck+2YyyvTKaiNjugC584MinRonO8A47x21I2X8oQ3L+r4
 fBzMnQV0AAAA=
To: <buildroot@buildroot.org>
CC: Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1744483203;
 bh=jk+TtK7qyaa1L3GYEhWqKJwFT/9SuDRJMDp3HHIkrns=;
 h=From:Subject:Date:To:CC;
 b=inoMTq46WuZk75RJ5Jxa0xOehuJuznvMkUZM2GqVz9KpuWbGeTzN6o3pnLiSya0xI
 T5h43eJrs9M3p8c9OGctq7NO9W8L51KjGOKk6OyGPOQCbzK2OZW/MjfZ/1WUjZI8cv
 6PgEXrc6/OlRMZ1xEgrdxiPlODvSBAlyuyfqyDXU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=inoMTq46
Subject: [Buildroot] [PATCH 0/2] configs: ti_am62{a,
 p}_sk_defconfig: switch to am62x platform flavor
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone!

Turns out we never defined the AM62Ax and AM62Px SA2UL base address in 
optee which causes a build failure. Fortunately the base address is 
exactly the same as with the AM62x SoCs.

Happy Hacking
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (2):
      configs/ti_am62ax_sk_defconfig: switch to am62x op-tee platform flavor
      configs/ti_am62px_sk_defconfig: switch to am62x op-tee platform flavor

 configs/ti_am62ax_sk_defconfig | 2 +-
 configs/ti_am62px_sk_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 11b93ef2081316e37613902944b60e4c799e6314
change-id: 20250412-optee-fixes-c08947e2cddc

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
