Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730FCE6B25B
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 21:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48CE881A3E;
	Mon, 22 Dec 2025 21:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9wzvt9w9pm8; Mon, 22 Dec 2025 21:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6743B8229B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766440616;
	bh=EioWDqsEVlo/8SvVHR5RUx2rs88PWh+Z6NCF4zuOibI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F++gSw/ia2sd9EoHRo9EoHmfs6uLtOTRLckdhM1YiPlwtQLT9FYxOQ6DDen717Gtr
	 y9CrQCU6G75rdutPDtxUmaVr03T8CgOy7cVnjSd7+n7uxq1zs6mad7dHcCwiyWw+fs
	 aTXxwMyEYmlDEDFxjAbgGaWyPWykDA7kIyYCIDj96rb6drPd8kocLhdA8s4Yt29l7H
	 vynst/+XWO99FTax0JIeGm0S0a/AHt6PuHv1LGPaBvWPs8DIlFiFqR04Nd7ViztqiL
	 9K3rWPb1VupFyzrjSXdjCWT7ETSfRrbPUSUBrFutSXGbUu4AuXRQQGBLtbWiwWkHLl
	 f4O29/3+ONHFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6743B8229B;
	Mon, 22 Dec 2025 21:56:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E19A5BC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D35CD40535
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98aADqcIDXq6 for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 21:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3C6D400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3C6D400F8
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3C6D400F8
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:53 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47d1d8a49f5so18997455e9.3
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 13:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766440611; x=1767045411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vm5+UKyyUx7BboHgEo9v/fyuBrUp0TMLGxk/fUKOKWs=;
 b=tYRC2Df8pDEUl3HanyQG3RKfxqZpfrMJe5htjwNFCm/HwoeA/z3FeJTnDN+kL2shus
 vwC1N+JISwyVkk9aCBW27cNklIfredfakdoiIbo9SBpDnOoBG1/4fOpuX2XyP7c6UGxL
 nGPgwpdz0c19EC8gKIhSGghxxJvjHXDq25rQUu+cEChruvRJyR0oVn8wSS4K1CboM+aJ
 yeWA8Bo3ZB8+9FOKQTOYD9tbNYJQcalUsWnjVQ1qieOKOJaQDbYqrGWV0EmRxLq84gjJ
 IIprH2yJr/t3bBo4mp8raIdxUo13vf8/AhEo1aMohEpvBRzAL50J55aM0qBZagDp0Z4e
 Zeyg==
X-Gm-Message-State: AOJu0YwmeFhe5qbz5YxIyJg4xhskcGFhpbPS4NzT4C9kXJeOIkcy0J+9
 qZgsi6QfpDscxqrdbgrkCwQD5NXK5DX3wYoJFuKGJyTKm5nysA1P3j2bzHCPRg==
X-Gm-Gg: AY/fxX7oRa+Pdk/rJMIPUGvA3Pn/k2+j1YALO1WAEHrhAH8n255wFs/cK9HIEf3OdWx
 LoswIFlw92saWoxjkV//K3LBbe9qC2C8GQZHLMwy7Rc7d7gKZBfNOJiv4okDFXSg2M7mbmjHdJM
 E4rOiStyS7JR/8IB25j3jP4sCqqjN6ddS2ZAHkFFQuVr06QNhxR9nwhS7OzAo20Mpybq1KCG9Qx
 8wzk+aLqmq8c+VezFybYizWu7r1xpa+ZLOB8miuLtvcztRzh11G7nrvFPEGDwBZ2WnQ8mfRopfP
 wCVbH5oJ7GKRJnDDZVW9zan3SkWYpzBJSVwu/wxPULMr1gpUYUfZnI8NNvRQ2bCkFS3OMXXhoJS
 dKjxvgkz9tm37+QUV5eIv+70VmdKqA6jcOT0HfIU+KMwRRoK+1/psKwCcyvAt3uCxURao03NAFC
 aWgwI=
X-Google-Smtp-Source: AGHT+IF29u6qatOaizdEgXnAG4HCuWwrAs8qoSz8xS0bzfD5EORTvwz8BuWLeCmz5WFsrEDew3gyQA==
X-Received: by 2002:a05:600c:348f:b0:477:7925:f7fb with SMTP id
 5b1f17b1804b1-47d1954a710mr116782645e9.10.1766440611503; 
 Mon, 22 Dec 2025 13:56:51 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:2fd5:723d:8ba0:877c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193522cdsm201207645e9.4.2025.12.22.13.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 13:56:51 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 22 Dec 2025 22:56:33 +0100
Message-ID: <20251222215636.975668-5-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222215636.975668-1-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766440611; x=1767045411; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vm5+UKyyUx7BboHgEo9v/fyuBrUp0TMLGxk/fUKOKWs=;
 b=HBB2UACR1W4m8OlQMIfAvvVhslYKelwAxh4Coa3PgIcglRf2QYpxsf2YMPN7gs6MoS
 Z80qtHvl/kxvJPHLEt+aG/HuleX2XOC7rI0Eh6UbK62IvlkfEOgN2g+OaPSOdqYmMzNd
 HQfU+2N1xeVw/dHKvFtufwnMkfM+Og4FFOzkTtFisDuTPPpGXWP6MBPldwUO96wb1kGG
 B8Lz2idiuYXREMOEya4nxMnrXGOYYgEIpIUDqG9Au0Krb8/6truswwdSEUGjd/6XXBHP
 VgAc4hb45eJXw6uhvDxRvFNDafL+ycJksHwlV5q+jGcJP7u8PRZNsVE0AVmpDfpdk8Bs
 yTBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HBB2UACR
Subject: [Buildroot] [PATCH 4/7] package/libecoli: bump version to 0.10.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new version is required to compile grout v0.14.2.

See the release note of the new versions:
https://github.com/rjarry/libecoli/releases/tag/v0.10.1
https://github.com/rjarry/libecoli/releases/tag/v0.10.0
https://github.com/rjarry/libecoli/releases/tag/v0.9.1

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index e200b796bf..4045c7e19d 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ac71cd336d7e19921ed1a0ae35ab14433792c7151d23abe92b247c6e36813246  libecoli-0.8.0.tar.gz
+sha256  ec359850f4f338b607d05200d508736b14eaa30fca8aefdfde980a283afd789d  libecoli-0.10.1.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index ad4fa62914..96617a1689 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.8.0
+LIBECOLI_VERSION = 0.10.1
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
