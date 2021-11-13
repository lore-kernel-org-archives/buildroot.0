Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F69C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:30:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DA7961029
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DA7961029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38A1740264;
	Sat, 13 Nov 2021 13:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGXzY3fJPId3; Sat, 13 Nov 2021 13:30:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6859640219;
	Sat, 13 Nov 2021 13:30:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2D801BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C204180B9E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VX12O-0MveH0 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2CAE80B92
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so12075528wme.0
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7GEAbprTN8BaQBSWAIWFE7kny6yOTKB437Q0xjiCMfU=;
 b=adsplBAF39epGWJhHMBYCvuxne/xMrdan9Yn2ZHTtjYwCMCXZWB8n5unaqdKXFahz0
 PE2mz0diYYCTGFol2J+nonAaQcNtBoPG7DgqVahC3DxiDJn8TEA5t7B3leE2ei5HaGMn
 MqGRIZCdM1TTjZ1g13cQxa3YVEatQX+FKlK0A2h4wQa7UF3MMkXucS2a+tPiQWXwlNqO
 JvsaeEoj8DIfk44bVvLgf6Ir3Ulbf6xu+ZkgEI2vEly4g6SutkcPs3Dyx2uULHbVC3tY
 y75KLWvt8BIlw9tKNr54KBtOrvKc1fPGsKo/8kNkBEVXkJbOGPzEN2O0NLGcepTEWPgb
 sTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7GEAbprTN8BaQBSWAIWFE7kny6yOTKB437Q0xjiCMfU=;
 b=zKjJ9GPo5eoq/llGT+j35lv6XGbU830XXpqZTH/OGHN8zS+CVpy8RoRp4nZb5P0gF9
 VYiBuKnBj7TVGxrpidg/U58wAvAEN8PfiKqqR0QzCHM7lp8FRCXIzs30ZNzdOTk5nh++
 izsunh7QBVDEbs0FFtx6PWr6FvcMWbIqyn/5BolC+27eXs16wYg/gdf3okvMt9BvlOmg
 rTHVwHYC6KuU461tcjOxbfZCgknALsmVxr2dGQs/xO5malTf1CiUy8+OYDeO6oCHdzvk
 Ubt8SpZ4FGJJ5Tt0tJvUyZ5wqLB31vHvazVi4aKX31gVLpoNyVc2qRMT/f1h3pFupB+u
 dWUQ==
X-Gm-Message-State: AOAM530vUezMpPtl+jPec5FnQ9f+qotg5opa/OMNp0v8CRruEVv4QBij
 bR+eaUDx/OnWhW+mtlRgUI5qJdF3og15jg==
X-Google-Smtp-Source: ABdhPJwxBr4L/fBuEKuIebNdJp9E00ktLXAUOG09mK0Ugkezb2s+T/T/KeYWXm86XGqvRNdJjVoQUQ==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr26435971wmq.117.1636810115105; 
 Sat, 13 Nov 2021 05:28:35 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:34 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:21 +0100
Message-Id: <0728305d32054c7b038a21202304e17de58c0eb8.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 10/16 v2] support/misc/utils: introduce
 $(tab)=\t and $(escape)=\x1b
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/misc/utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/misc/utils.mk b/support/misc/utils.mk
index fdc22a2eef..4d0efcced0 100644
--- a/support/misc/utils.mk
+++ b/support/misc/utils.mk
@@ -13,6 +13,8 @@ qstrip = $(strip $(subst ",,$(1)))
 comma := ,
 empty :=
 space := $(empty) $(empty)
+tab := $(empty)	$(empty)
+escape := $(shell printf '\x1b')
 
 # make 4.3:
 # https://lwn.net/Articles/810071/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
