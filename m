Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E53C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 186C760F91;
	Fri, 18 Sep 2026 13:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BC3yQiWeZyvA; Fri, 18 Sep 2026 13:09:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6753660F82
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736951;
	b=EhNR9Xa1yqv6yao+8yyFzIpKTX3aZAZt9eW3K7D7oHEcEHvlPQlLfVUaiB3Hzw7XADwh
	 2Xdyg34kAIC/33Uv6+aUZfL1xHwKAcq3evcUHU+hE4Uj5g6hv6yO+vzfLffkxxelJdulu
	 XBKw5NywZ97jf4FAn4+ue3NXfG1N7RXOa/wrL344zV4NCXQOEwoZHwbzBiHiDyiYQ+o49
	 gnHjrXTUIM6sqDsTcgIYX7F1WtCJrQy3rzZQMokEkifzzhXwGF/1CGDtmV3jqKpdS/Xze
	 kqlUKT5E7mGRKbMAX/TzEj635WHp6lqKHAPdaZgP0lmziAgkXUNf1CnBBcMThNYfRPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736951;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b9ATgdby1ZnOd4dMzsMsoTUzWM3DmwhnAYOtDn6rVK0=;
	b=egtF18HPPVFxU/6WfI5H4qY1mzK6bPjokDrBfVk8dF+Xhj5rt+ufBeAGku8VbpVXYR+C
	 AbDemhvUL2Lt8mHNPNBvV/gGnnEiwn9vqLxvRSbidDBwKKZNbW2H58yHHoBHpOFjsdbNG
	 8ncxmjcF4pSgrjXblS8WS6Vh2MsYTZ9a5jyKwl+3gogHGUFX0eaixiDtq5u6AAoAKnR9N
	 AziKXyGc1JnyvrV8Z9PBW3bAFNHFBJY1i6nr0ar0BwB3Q/9URgrjIqYLRLxGiegh5RPM+
	 vvxSKZkIqb///K6+95wSOyE43iR+D04fKIIwrpf/cZl/9ZSPGcEA+8+I4fKTUExYIRw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736951;
	bh=b9ATgdby1ZnOd4dMzsMsoTUzWM3DmwhnAYOtDn6rVK0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mGXXbGktDHI9rWATr53jU0RG4IRcDS/IYOH6xf937x7Wu7KVDD1SN6XsCGZDDfe9u
	 qRgUAXTeITh1TeaMVb0GQiU3AUb+jK4ELD4kS6GW5ylf6RD7SylCU3k6Y9q4i85D/+
	 hzh5thHBGvrMOXA5lup0DF6ncBbhIb5qQKpowRyhUvJ3UddTzQKmik4/ny0gBumb6s
	 6kcDpCCPtLQhBuxTQlV7IVCf5E3XvBJdvRPiB6J2fzrSpmkWKnaNgAxm/HpkHyPrKX
	 1PVeLuvjJ1akXQ2LWKwoJQhWvW4QWZcCZzVUhhtbAilvnckxU29SkqEitLeZTkv/gf
	 9ZRk9dzwCBL5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6753660F82;
	Fri, 18 Sep 2026 13:09:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8A6029B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF56D40348
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpyXWH1oGH_F for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:09:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9E69E400B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736947;
 b=p4awskBiyG45sBxQ2ts+BZWW1cDA/7ga13bMSIA7/0GippbxA0S3vVfoVMk0XCcd+u5I
 aVf84rb0I327NmZ85TvCigbRC2uuVF77TPr4rUCSpwPXeiGnPNozRQRmS1gf6nxTdZXo5
 byZhsfWgltVIB65qIS2LNid1wAdftDm3QIONK8xhFyPtCY1L/A3TKlPVX8gIvx9sI8J3X
 kolbb1vTZgIxw7Fb8agPjy8rka6f1iG/PNXL6QGvnpHO9P7Cjsh8gIxpvWwZexHMSgovp
 xMQaImbzdqej8YfgyFb3slMqYb9ct0s0fXhQFoh0zC6XRwpL9AfUWQbb2goxdBfsqWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736947;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=STdJxRVDQopQP1cRhPPJWIbtRT52eCUDDZ+A0Mf+Fks=;
 b=nf+6ZkvLX5x54A2HYtDVly96XKR2+TQKYl9/EEXKiXaeKPOVwiHSV+RGjUGOutIA7DNz
 f0BTqaa46QLWN0tq18rOSI1mky+m3vcmOpwsRNRJq7eeNtznwiferH2pSX2XqYEMsmfcQ
 K0F9qH6gKYZlyKpdZx2XxgyfF4abgfLr0TRR3qn8twG6gZLDroH8If4Ql3QwFwLrkkfyx
 V/8Kux2XC/l8B8ZOuZfSdsyr+JhX/v86GtyjFv5WEpiUqwH6rdYf/hJx3NTAq1GplSN2L
 Rxj++6B6jKzvBuSNdVV+Aetp1M/FCm95fCLNMk7MNoV+VFQhcyhjQzDwGovjTolKXVA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="foJug+a/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::12"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::12; helo=mail-wr2-x12.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x12.google.com (mail-wr2-x12.google.com
 [IPv6:2a00:1450:4864:30::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E69E400B4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:06 +0000 (UTC)
Received: by mail-wr2-x12.google.com with SMTP id
 ffacd0b85a97d-482f6356f6bso577192f8f.2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736944; x=1790341744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=STdJxRVDQopQP1cRhPPJWIbtRT52eCUDDZ+A0Mf+Fks=;
 b=OSPCW6qbdM0kwVhxsUqWafBRBwD5A8pRK05SSeAzd6K1+IDTA+rgLdMHdiZXfYfB4X
 GKHK9lW08SKLZGUFTI7MI3mP75hrCd3eW3WgAVcQTPD0ILQQVCmQLWwAcrGm9qhKg3Qt
 zd9TSKJJL+8hsDzfZKee1EZ/FFv2KyMKJSKgmukXhopFesNVH8C93ko1F/k84nX3DvGT
 OduSKhiqg2lfit91v7Mhh8twDJ6O772aEMDv20OnQ5pWIZ8zjOz1V9j89Z8tbk4XjLpT
 3McLMysYLS0jGTVEiXqwnuZWbH6L+tJ6/Lzv0smEAdCRv0fnQ9IHF+O6fN2rRjwSpV55
 MWVg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxNKKyaor6l1Nk33u3C5QbRNvBtcTqAUG6suBf5SiK84HTc2M6dyYiYQDYVLhLv/SFPS57OpVMy/dQ=@buildroot.org
X-Gm-Message-State: AFuF++kQzgwlMgwmRXbpzjdEstYF1xBYJM3MeNgI8Y5J+oMXPFgCghKL
 Zs/h1CSRh7xRh+usdtRTCR5kGvN7RWBcjDWsnCb84DeZ73z3pIRLNZXlZELrl7n4DVYdj/abwQ4
 VxN04
X-Gm-Gg: AYBFou2D37JLGuuOTXtJ7ca9PancvynyxdoH3C91Dt6GknsQmo+lmYQ2ZhEwdTg5nIc
 QK/6mWbpFoKqbxV4AHj5UJBZtxLYheX8t1t62Cu/QN9Bk8LKUNuc4zNJsbcaUr73Q3ViUx7ct2h
 J+iZip31a4ZZCMMuGJ6xtVYnDTxZpKJ0hVs5DTDuNw2tMEBgABHFb+083oFiBaJj48cA4UvgDVX
 WPOaGlnxZECmypzbEsX3qFr5jdnatGESj850rkGs4jjdhfgyOu8xAUNOPA55Gk68907TPZfpYpr
 ES769Xp9pINVJ4Poa1cRMy/PuK/at8PtUPRvvVgVh7Iivj5lIIlvlOCjUGegJZjynAzOX2Y/O+0
 +MBRR9x7F3I3HRKbIIjX6J9P2kKnXr4IYgEQP85EXXgFb77BPD8PRVs7oNBAHR7JxHicgTnBnvq
 925GULKJI1cz9BMvcydUfUSxux24SC4vrkDYEkP94+2QZt9aLDHXedKsJt9AIoGj0hqfT9jr/ji
 iM=
X-Received: by 2002:a05:6000:25ef:b0:486:e9ab:2b88 with SMTP id
 ffacd0b85a97d-4871e37ba03mr6700305f8f.24.1789736944144; 
 Fri, 18 Sep 2026 06:09:04 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4871feb5de3sm4375986f8f.1.2026.09.18.06.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:09:03 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:09:02 +0200
Message-ID: <20260918130902.162948-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913160834.1668831-1-thomas.petazzoni@bootlin.com>
References: <20260913160834.1668831-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pulseview: add missing 'select
 BR2_PACKAGE_QT5GUI'
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> BR2_PACKAGE_PULSEVIEW selects BR2_PACKAGE_QT5BASE_PNG and
> BR2_PACKAGE_QT5BASE_WIDGETS, which both depend on
> BR2_PACKAGE_QT5BASE_GUI. It ends working because we also select
> BR2_PACKAGE_QT5SVG, which selects BR2_PACKAGE_QT5BASE_GUI, so there is
> no bug, but it's bit inconsistent to select sub-options that have a
> "depends on" without selecting the option they depend on.
> 
> This not a bug fix, it has no functional implication.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/pulseview/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
> index b1f9dc25d7..b9dbd88c28 100644
> --- a/package/pulseview/Config.in
> +++ b/package/pulseview/Config.in
> @@ -17,6 +17,7 @@ config BR2_PACKAGE_PULSEVIEW
>  	select BR2_PACKAGE_LIBSIGROKCXX
>  	select BR2_PACKAGE_QT5
>  	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_QT5BASE_GUI
>  	select BR2_PACKAGE_QT5BASE_PNG
>  	select BR2_PACKAGE_QT5BASE_WIDGETS
>  	select BR2_PACKAGE_QT5SVG
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
