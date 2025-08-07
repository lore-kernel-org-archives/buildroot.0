Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B97C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A1F680BE2;
	Thu,  7 Aug 2025 18:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGHrez0xg_Ja; Thu,  7 Aug 2025 18:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DC4580BE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC4580BE9;
	Thu,  7 Aug 2025 18:23:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C2A010A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02411605F1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLsKbk5nboWy for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:23:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2114605C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2114605C3
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2114605C3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b78d13bf10so1307638f8f.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591025; x=1755195825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+PDDDDwJOsp2bWOVH20DYBTDtDptmYtWxU19vioLCA=;
 b=t95mnmhQVfM/Vq7OePAcLVtChnYf8/i8e1AOVTFlTpuLeHQ5PqptACi2AaQdXRbUmA
 nqgBKS74AZtYhLj0H4K6ugsKpVXL0pZKJmU9g054VQhoQDZsqsozPcEMcHtGiYXN2K2O
 dkanb7K7/VS3/rFtHuwNdahah5PuOt5Kr5arTGDCSdP+hSMbgclXqPJyFi9MHTjQ7on/
 CM6Z85VJo1pVjo9Z38BrDL7sixl/DpsUofz2niZucLLAX4lBUHvqedUV8luBf2dYO0YL
 pzD9gQgdQPB0FLiPgFWoq6PX9ctV9BNtvn2XzphEhX+VuOoM0bP4X/8jMNY1BcsKHa0c
 HRig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXHXl9E91/oOPlXnvxNyYaTGAUjFp7uAbsyL+5vpFI+91BxTQyEVnJjoCMxGemR73KwD4fHTa04IY=@buildroot.org
X-Gm-Message-State: AOJu0YyGSTVYNuGQh3rD3zg6ixb+IQ28LRvMMVcu7u+Vki0ABa2PvwR7
 zmx5aAl017BlwXtM4od+l2dIzdDtfdh5dKNxrELWNY8d7tegviP79WRvJW7ogA6n0eQ=
X-Gm-Gg: ASbGncuZKt0hZLm19zAm4eychXoV102Hko7YlP6U93dtEzRqsHnGs6CCCLpDaCm9hnO
 3YZJjPu9i/9FWVPL2915vxR9IUtYS8rzILiOW8bT1mCxCH3bXWfinhBTcSDohBwoEqyhmR4mLuF
 u14C4lPMM2In8FrlrLjRsq3NYg5l+YAvMXKBIQzSg2mOgO56vVdFKoORdKgscelmbRmfaFzO3P6
 ueGqjT9oqfu/GxTZtXLcjhT5rvj/LqSbpwh0xAmyr7kBY/bUIx1/r+rbVa+gIWf1nSq9Uq6x7MZ
 2A/MC1S/9w9r9GtpRLOzshFktR7LuO0P5srcaC3aFmUC4k4q5AyiUeEHHzCzgZs5kSPdwuvCtC/
 i3YQRPpc1poejNA==
X-Google-Smtp-Source: AGHT+IFfwWj1HYkdRE7zFi3vx+HloFwkzUfAzajuhIGRIa2BFmHrjzbJgQkjOwMJqxMA/yyLK9lhuA==
X-Received: by 2002:a05:6000:40de:b0:3a4:e7d3:bd9c with SMTP id
 ffacd0b85a97d-3b900b4d2f8mr203667f8f.17.1754591025457; 
 Thu, 07 Aug 2025 11:23:45 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4595cfea56fsm126424815e9.1.2025.08.07.11.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:45 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:44 +0200
Message-ID: <20250807182344.723252-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250425201824.141234-7-thomas.petazzoni@bootlin.com>
References: <20250425201824.141234-7-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591025; x=1755195825; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+PDDDDwJOsp2bWOVH20DYBTDtDptmYtWxU19vioLCA=;
 b=TQe52tGST7UlKqPM0m0qOIVokzYt553dupA7KBMJhSf2AAon2k6A9DzQYiod6tY3iM
 KPsHemRx0qRBJ7+4HADrLhee+MUxBpWkncySRFt4SwvVunCPd2fAqZcnjzUxDLMb2V+t
 wb46UF68344uLDC1rkRnNHC/to6PSydA8AX4c9EeS6i+58JmBMm0WqUgHK4Pc9T7QN49
 SfjpGGqwM5XtX7k4XKR0GIAuTirHP0TKjGCjQQFt2GWEU8QyEJVolNCXezx9O2J1vk+H
 U6LRQFi/8htmMlLi76SH1nl+rgBxlZ4U5bPVCrYxLjNBI6Ta/GlT7vwffTqd35ht1kWb
 GhZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TQe52tGS
Subject: Re: [Buildroot] [PATCH 6/7] package/gcc: drop dead code related to
 BR2_GCC_SUPPORTS_LIBCILKRTS
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
> The libcilkrts library was removed from gcc 8.x, and gcc 8.x is the
> oldest version we allow building (to still support PowerPC SPE). So it
> means the BR2_GCC_SUPPORTS_LIBCILKRTS is basically dead code because:
> 
> 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> 
> Will never evaluate to 'y' in current Buildroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/gcc/Config.in.host         |  5 -----
>  package/gcc/gcc-final/gcc-final.mk | 19 -------------------
>  2 files changed, 24 deletions(-)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 4258debbd1..8930c2a42a 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -51,11 +51,6 @@ config BR2_GCC_VERSION_15_X
>  
>  endchoice
>  
> -# libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
> -config BR2_GCC_SUPPORTS_LIBCILKRTS
> -	bool
> -	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> -
>  config BR2_GCC_SUPPORTS_DLANG
>  	bool
>  	default y if BR2_aarch64
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 99d7047b5f..43aea72420 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -85,25 +85,6 @@ else
>  HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
>  endif
>  
> -ifeq ($(BR2_GCC_SUPPORTS_LIBCILKRTS),y)
> -
> -# libcilkrts does not support v8
> -ifeq ($(BR2_sparc),y)
> -HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
> -endif
> -
> -# Pthreads are required to build libcilkrts
> -ifeq ($(BR2_PTHREADS_NONE),y)
> -HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
> -endif
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -# disable libcilkrts as there is no static version
> -HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
> -endif
> -
> -endif # BR2_GCC_SUPPORTS_LIBCILKRTS
> -
>  # Disable shared libs like libstdc++ if we do static since it confuses linking
>  ifeq ($(BR2_STATIC_LIBS),y)
>  HOST_GCC_FINAL_CONF_OPTS += --disable-shared
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
