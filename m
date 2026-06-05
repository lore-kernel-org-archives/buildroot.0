Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB0BCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01774828C5;
	Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPodqgT63O7D; Fri,  5 Jun 2026 12:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF09D82896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663819;
	bh=TkksmrK9Mm64P1GZ+8nM80nd4zC9u+llKfuCmQEG7Gk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dN/viI7j4dlgbeDAFmT0gJKg7IrdDM4MHrButxnb3uy91PCv8JyYNgfuMTiXU6ji3
	 hfbEx7nsxMbwARNWf+Meq+qd4JWovfk+/MmBkL5/tGrRlUeMbmNHWHzFDCve9f0872
	 Gca+11oP8ZHNZF3/9HxCkDv0dWdTNkecLM7gmZeHu91SIGNuct3235TLb4eQlEaMf5
	 Fvqx4NY/YfzLyiG0AE4lMtGzq4OwhSppFsoiPZbYfRdbXKoo1IbXlexYEZ4uJI0R9Y
	 WVWaeXLeQ2dAcR8Ggtgr+Oka/ALgYygekRRF+K5ecgjvU85vyDN8XuQRQiM8u/MZ1N
	 LY61ZMfheI6JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF09D82896;
	Fri,  5 Jun 2026 12:50:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84979388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76A0E4037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCoOqT6Xemdp for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 794364037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 794364037E
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 794364037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso965778f8f.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663813; x=1781268613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cvpzJbG7LE8woQPU7/N/Ab7MsyPLLQ6v5cas9lklMCU=;
 b=eaQk+3x0QHuVOYKRzN6zNMHWdCsXW1yvr7ekpSbhfJqFE9C2VAx34nEVBsK5WVIebW
 JhddyUAuMXpAPynvPBuNZclNa7DnGq4JCw2DBAlOz1NDphRCpiFKnacavNmBsIpsiKHp
 CFzYhUpuQQdwFI/NtCAG8ksz3JFaukIyiyU4YtqPOZ/o2qHYnIAQkd5ZuowIfBu72lVn
 G2TGcIie1xivXv2fae7EzRaZOri/35dVBsbkTAegZ6hMkKcZWkbPqhGm+FSC+Plosq5q
 JcKNRjDBXsndYuDbYatAN2k4I10GFteexhbncYSXr9UsM4auTA3GePOtUNa7NJF3kZOr
 HJ4g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+58Xv7quxN+KOlX/sqXHcYRiYTXr7JAP/cU3T1hYn+EBqEM6a25qodJUtwYXpkLxhsuzLG4xRgUuc=@buildroot.org
X-Gm-Message-State: AOJu0YyFi3Ra9Z4L/3RdBFyL9rXKffb8hduve2DhlQbXNubVaKOy4Utf
 zcQ+FFJ4Mh+JyUJeJdIWyiuDAeUN9AYfb2i4oRlM6C1ElsakBHDaNDSlz+P6IGB38qU=
X-Gm-Gg: Acq92OGhFZuBBplCGVohZz1SMxEHZMiO8n17tThjm9yAr99ibrSD3ttobRlWByUCFKD
 g0/wK56CbOFEPjpwVNLhlniyNpOkQZwVgC2iKCKT4D42XqS2tfZOw9Vwr3VQa2DPwSxOgqOeG1J
 snOVf4YUxtDH459Y0huXYYUY1iiwgs1OtLDl4HUeNCMDP1EGCToxc5/ryNLbv5wPlSbWEtZqpqb
 RCZui7g4fS5/aiu+zoNytzcSyki1S6zyschNbPPnaelLDaR5qchILzA6aN1yWsAHfT/QoAdfDo+
 zMwtfULdEDr4+R1ktqtPyUy6m0OOF5+ynSb/0VkDqymcnjqeLd6RozY4R6feRjaRcyA/1gIHOfg
 NwM9ZAIdHsWbK+7IE8qiEAV88rZ7ZAKOTR6/5HB5YCA3T9erBngc/d7FaLsRw12udxHG8x+dstz
 zAaYiIc9Zebpr5IGEr7BcbadJ+iw==
X-Received: by 2002:a5d:4a48:0:b0:43e:aa88:f1a1 with SMTP id
 ffacd0b85a97d-46030618db7mr3912258f8f.30.1780663813404; 
 Fri, 05 Jun 2026 05:50:13 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344762sm27363468f8f.23.2026.06.05.05.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:13 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:12 +0200
Message-ID: <20260605125012.272716-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260324-qt5-5-15-18-2025-02-x-v1-2-9d25b343a6e3@cherry.de>
References: <20260324-qt5-5-15-18-2025-02-x-v1-2-9d25b343a6e3@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663813; x=1781268613; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cvpzJbG7LE8woQPU7/N/Ab7MsyPLLQ6v5cas9lklMCU=;
 b=Jqk0WacQuGz6/rUKi7m09Meflpn+ewn2eDYrI3/kBXr7+vn7ddP3eKxDJUHhOB0Lsr
 /KVPQFfypw7VuAl/+XvWeRmvWz50+qW40ls2K7Z7doLsnWlDz0Wx9qu1j8sN+tZKQW01
 Y8KOjaytlgnzNj5DKC6E7nv9csLnXxKLu8pIeKlxjgPoweWNDqUoUqkF3gq/JZUIs1it
 CFwSbQ868bgIYWLXcmjOUTdeK+PHwP0ciN7075HjX1tVm7xLJilXtJ9bCR4g3y3zQbWx
 ITHAxmUmda86qWgKv+SSV/GNu8uWmbC7w9GGiJT9sh9OM6Qk0mZ/9ySRNWuxi0Yf7juy
 OQXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Jqk0WacQ
Subject: Re: [Buildroot] [PATCH 2025.02.x 2/5] package/qt5/qt53d: force
 using Buildroot's assimp when selected
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
> If we're adding a dependency to the package, it's for its build system
> to use it. Unfortunately, when -feature-system-assimp is not passed, the
> assimp module from the sources will be used. Moreover, it doesn't build
> currently.
> 
> Unfortunately, qt53d still doesn't build with assimp from Buildroot.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/qt5/qt53d/qt53d.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
> index 459b019902..ae15b58df3 100644
> --- a/package/qt5/qt53d/qt53d.mk
> +++ b/package/qt5/qt53d/qt53d.mk
> @@ -16,6 +16,8 @@ QT53D_CONF_OPTS = --
>  
>  ifeq ($(BR2_PACKAGE_ASSIMP),y)
>  QT53D_DEPENDENCIES += assimp
> +QT53D_CONF_OPTS += \
> +	-feature-system-assimp
>  else
>  QT53D_CONF_OPTS += \
>  	-no-feature-assimp
> 
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
