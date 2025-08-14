Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9E8CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA5FB80E4B;
	Thu, 14 Aug 2025 20:32:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sr5V9m3mA4Bs; Thu, 14 Aug 2025 20:32:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAA8E80EFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA8E80EFC;
	Thu, 14 Aug 2025 20:32:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4EDA1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D74B240494
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLra_M70lB9o for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDCD24046C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDCD24046C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDCD24046C
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b0d224dso7279875e9.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203535; x=1755808335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qv30ityFGyapI/I264N5kIfsjxlMlfx+Fk1FheSjtC4=;
 b=FDze1ZeMDrb1D++b2l2MgP9MVfBsjQDeO+jsG31DLJvCQWalugjLYKloCMPyEcebNA
 d7lz9TZicfmhyaDehmliq/DS5Qb9D+fijHFQH6W2TQoSpuAE+w3hS5R+WTcLSmzvb2z7
 M3cB3P+OlJasHuW+MwMc5HoWJ5zZ8C3ye1Yo9rQvYXQUa1ib/27mGq8BsmXawouHwD4z
 py5zfqOJkAE1OvFKqsBIEHswplWF7n++wQTzOZeG8TOQbNGA5uIS/y4grMkFlwl7Gg8z
 dFXKc1b5ChPvJYwodcxdShcfWZ5l4bIQUELXXn9BbHj1EKXq9HPFgekF1x/iZiUZjYGV
 gP4A==
X-Gm-Message-State: AOJu0Yx/Ka1XLpdeHC2MzJYHtr6YKXr/LXgRnatbij1Y6dTb4ylw0Koa
 UwMl6efTV/rlJFSKmEVhAatLMTDAXHNGrWOUbJMKDOpafp3b7zNhV58zpgbDJdyWsBEJPaVfryv
 TASYprm4=
X-Gm-Gg: ASbGncuURuteNBcgy7CAHnqLhXrs6Jmz5l8+a2XXgVjNuIcOolRsikKnAmAEZK8irSb
 uOHDMftV6iXOmFimosbQT/TBKrQojAWXtcQykxQ3dEimSYjmTLCI1bf72Z9kVw44Dmv1UWBP/Ru
 4teYrLl1tgczn1mlpnRKIzBADF6IyqAi/VXszBfd8pde1jUJEbAqtqFRI3fe6Jtb69BFFY6wBNt
 wc2KZBPRX2qnO/f52j2sdXrkaJrb9Sxki15cj+0D4l933Dubc/4xs+Lq2V5NH2P6mu5P0qBYH6f
 XYOsrgsnnNdPSMDG257OdhJU2LqDkCVCSPddtDLkjrD7fpwc4NPxc8JeEpy29Fb2Ea0/KLURh1N
 4WAtcpoCICyQXpQ==
X-Google-Smtp-Source: AGHT+IFbTL3FI+E3XMAm5XtbvRfKkHzMLRu+Fwk/CciKqfKcxi06hWnV4tivrKABZBAUmY1c9Moz7g==
X-Received: by 2002:a05:600c:1c28:b0:456:285b:db3c with SMTP id
 5b1f17b1804b1-45a20bc8b9amr3412845e9.3.1755203535032; 
 Thu, 14 Aug 2025 13:32:15 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c61a383sm33649365e9.0.2025.08.14.13.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:14 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:14 +0200
Message-ID: <20250814203214.2816809-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809210855.354805-2-thomas.perale@mind.be>
References: <20250809210855.354805-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203535; x=1755808335; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qv30ityFGyapI/I264N5kIfsjxlMlfx+Fk1FheSjtC4=;
 b=NKXi07MPBvJAvWxr1GBZg7RSX/30FCcL1wJSjIbG0Ey6pej0CzPh7bRjMa3JlMCeaE
 3wS5/obL3RKdGROcLjA2ZZHWTKSuCw5hlwtp5TKZG8JuZ/YI30f2mD7d37TNYEbfs70Q
 XJA/e6y632PiIs+HRfl0APgPIeWPs9aQOUU6KiY3VOJBoBgS7hVOrIWpIsM9tsCt3yiG
 3aYWPQBgV8j2a9+Y4OPsnSX0fNPDV7+bNu+M7txWVClyV1NFBfKw8JDhsNSJ9BC5eOC+
 X/OlBpbOXI0BHBGGtqVeogTe667P8CRgpkzz0MAFOEJeQBmCjYljVnaNb9C1bxXBSWAz
 PY5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NKXi07MP
Subject: Re: [Buildroot] [PATCH v2 2/2] package/cpuinfo: add thread
 requirement comment
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
> When the package was introduced in [1], it lacked a kconfig comment
> indicating that it requires a toolchain with thread support.
> 
> [1] ea1cc1af55 package/cpuinfo: new package
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/cpuinfo/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
> index 257480f068..64477c2bd7 100644
> --- a/package/cpuinfo/Config.in
> +++ b/package/cpuinfo/Config.in
> @@ -15,3 +15,6 @@ config BR2_PACKAGE_CPUINFO
>  	  host CPU.
>  
>  	  https://github.com/pytorch/cpuinfo
> +
> +comment "cpuinfo needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
