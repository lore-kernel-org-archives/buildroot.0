Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BA2C79F85
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 13:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A6BE40A7D;
	Sat,  5 Sep 2026 13:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJC51A9f5BkT; Sat,  5 Sep 2026 13:50:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F105B40A60
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788616232;
	b=IXSeI7myOsnRjGzZQhoSOkzwqoDZvwf1RNd8IBwXLoNYQeUuTrldhk4R37n4msaxraqx
	 piYZSm9fbAEb+ZzdLgxTce/zE0kCP3VbGkMl1IV19reOrMmZ92KPkwFsc8csYNAObiDq7
	 yCahgxNOT80c4Wzsjk5jboH362Ak2lCrEA+zrz7dwa/s41GAw1UGCN8/PeuVs58wCKSSD
	 EtT5Y93BNrbdaFinhqEIRUpNLEuh1gSMs/tYNPZlQGhkLcQrQ6T8KZIE/i7h8oHw5lusK
	 tQFmsV6NHzXMoA7Z4jMJ+SwC10G2l1ljL8WRnQZ1kPJ86YcPkvfiBcKpPBQ8zgJMVyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788616232;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IEQIrNBg+VKEUyeEgPRdEKDFJca+vu4KC4AXAZ0WM8w=;
	b=THkH0tZJSsVR1mSDW0qPvTkX1Z/ZTzYSaS2u4cAzo7446XHb4rhGVqQf6/HHBaYsGNhL
	 6zdMgbDsdH8zG4epiSmzAFRZOihKvSxC4REFB0+fedrhX3FdquXZTakrA19ZovZGVaeLg
	 ewabp65PtovP9uGjC5ypcROAZ/4xPiGDg2F1jbTRZAFspWvAH7PCKKlXamRmMgwaSFzGj
	 xUgG4kPeBqLoRM2x10WOffb11N3WAcqEU+HSLl5ehRnchFVo4yKuLcKDYoYZ2y0wSovv9
	 R4ofonhVLlbcoUQ5vC0umQ9RZz0DNreT1gdP0/qdvOUU5RFm3UegvlaDm1zNrD0lXTg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788616232;
	bh=IEQIrNBg+VKEUyeEgPRdEKDFJca+vu4KC4AXAZ0WM8w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EjTm2xXgQfVk0FnXDSV9QZZdaLPqceRhHigPtimYKHudfCRTyXYHCdh+ES7mOC5ou
	 0LA83SIprdBuwBYkjOaPuPJYsOVXVjUk8XdaAy23n989ZDU7WPDxEWSTqqbjAv5Npv
	 wiT15w6QbSgkFbB0z+Pro3Vj85Hy9tG+spFO2+4LVUiuQCqNLFBL4EmWUrOTiCY2yW
	 nspvToW5qAftTrffV+9Tol+fRwJoCtEgpu3DJadGA3u+rp3gx/AXtu4m9RHXu6lixm
	 6qJynp0W9D0+SwGcshkjFs+rPaP/Asxij1qMs0mtheSIoAnuRvUvvfwggF1TmHMvIM
	 bp2EprYlU3e/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F105B40A60;
	Sat,  5 Sep 2026 13:50:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B38CB88
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D1DB40A60
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NaTutqP1akc for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 13:50:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9505B40A58
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788616229;
 b=NAU5R+sipt/VKbtOgqSpxvg1ETHsCFnwg2RYeJ9vmODLXmpThjbhMfIC3+3WMmqmCvhi
 et/N5r54+CsO1fqrtfRG2JGAlk7799lIs2H+ANcNl0cazT4ZU6mLWO6WD98yKVB+4d9Mu
 HXLpU2jFttpoLPcDgvH+YQkd15bpbBk1pe77JUyk8Ccnn26TM5mK7poq/8gX4yuNCnmOK
 1s3IZgsw3w3du3kB7mLQTtVvKaeoWSYBJDyj1Ug0OWqvD/cnV6komCTj9kAJ399Gwr9EN
 Hcll63/GWbyNzzDJByplR6UdRTDwXXUIpN+DNuHxcMS0G6eT/WCmXQZgbs1jECDdNZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788616229;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/0b5L5zhVE+8DU3YwpHPRa00dkTSqsRIv5cHVFt/5so=;
 b=WQ2iQQTjpy2Ckv/qZayj8BvXeK+sIK6kDczeakYUfF8YSsI9zuWILHoql/JEi4naJqN6
 PgFAgXpjG2dWcRE5Nrfc9ZfUHh+8ykdhICEEsIyucsaMG9yCZ+ksDLIX8AyslqSwzPTif
 uqqo5odWJFFlWeSb14ZU4aDs+os2NgPsi6n8FWvyKHUpyJyOh7nmZXSIu3kL7LTWHjd9s
 BezY2F5KwowwnwOaWdfLyJelRd5FETjVXhN78o9nJF4qxebvDo+a/+8S0nnSdgtaeXlXM
 X3P0YXchbFEQbyb/zmeNssOvwkJvFORVeO9fwG3FXYowZfrAnH2IH2NZ3Xmy1YTr9eg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9505B40A58
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 876A78B6FE; Sat,  5 Sep 2026 13:49:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 15:49:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab9097227c6665686b5b65526cb4e3ea084566a7
X-Git-Newrev: a7652a2f4861c154b41928a3239aa27bac2c0383
X-Patchwork-Hint: ignore
Message-Id: <20260905134928.876A78B6FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/catch2: bump to version 3.16.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7652a2f4861c154b41928a3239aa27bac2c0383
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.16.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 0c205fa30b..35c3d52eea 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  be23a52b85cf04cd9587612147a10b023d59ed9757fa1843cc99e615d6c0893c  catch2-3.15.1.tar.gz
+sha256  0957cae5821b17ce07f0833aaa52b5137643a8382203221f363a8303c109af34  catch2-3.16.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index f62eda71f6..d33ec8e289 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.15.1
+CATCH2_VERSION = 3.16.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
