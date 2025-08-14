Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38EDCA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB4D180E92;
	Thu, 14 Aug 2025 20:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkekCdf7iLzQ; Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 919FD80E2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 919FD80E2A;
	Thu, 14 Aug 2025 20:32:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 706C193E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63099404AB
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5p1hSpw77CeO for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A89B402F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A89B402F5
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A89B402F5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b9e415a68fso1259506f8f.2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203519; x=1755808319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+xUHJNPiqtVLY/i9hysnkdA8h1lsj4HK+MKroDofNY=;
 b=A/jWijmDLyn8G13345ZjmcSpmtaoceKuwmY+sXNyZ/nWNyHEROz3vvtBTyX+Gt54Wy
 Uyc4E6JhXONXrF0Y+p+2pFYGYNAqce0+N0aEd5XlgFzmqUqpkaZ54q/e34xJdrP42jRg
 Z41NBIdC30QaQP2K0xFxXkVfvlPpH5lphk1YUvehpSh9FZUc1UL5CAvWaupTgbpj+CT3
 NmcfzM/l6AVHk4dWFMuI6+IeCgvVclUJM/xz8m3IQor/o6CKszBDF5qYTpe6vw5wGVwE
 o67UQZeCNJc6clNheRQivM9Um/qBLwgHENp1mh5bJC+0c0xgAzw6qHfsEpk3p1juZwmc
 nPVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbm2oEClTXPqEBNEA1QYXX562HOaKNf84GWGbXAdkgUYOb4kbHcErSBAY/ebWsYlpP+uTYe7ae1qs=@buildroot.org
X-Gm-Message-State: AOJu0YxcjLYIlFJBFYIBz3eEyD8uiTbSMhvleZzg3ttVTY5yRTkOuO/2
 WimB181gHZOKmaI6Gf2Zmwnqj6GCeYg46Hx2/yIxMcDRChSN+6Su478o1ADtRe4f7RU=
X-Gm-Gg: ASbGnctWNwx5ddx4AVvA01JEi998WAS9Eg56HXtf1F9hTVWuVqgQlHEt59qmJgVQzX1
 UNxLu03DEIYEWnGKPaD1MmdPP7mGXTXE2aIJuNgROCVxDN+28IV03PrZbQtXTVR9OGljzujDcvI
 MXPFwo4eYLSokc1kvPaa0sh01KYYMM1B7VJ5YOeD7BN00iePUGYJ1Fdu8hLB/JRZ8iHMlP/TM6D
 xg/AL8l7frvWeA4Hn+RcrHPhQLItpfwbQOZwuMLORokhKDO1ez+e4MYZlX4/lWeMKLYC1QXdjtG
 sYzlPnv1K/9y6fQBRKBlkyISRMJSkP7JkdbCZ/eFGKe4RgXQVSDr5X7xt9//hQRicBv5ExccxWF
 hArXYeNa3zLxd9A==
X-Google-Smtp-Source: AGHT+IH4vgmJALZLxu3BZqFs7jc1x9x0/5LfV+A76FyXWb3tA5l8dLPTBlq/U4ETizkvwoo0rY0eXw==
X-Received: by 2002:a05:6000:40de:b0:3b9:13e4:966d with SMTP id
 ffacd0b85a97d-3bb26c88aecmr64218f8f.59.1755203519203; 
 Thu, 14 Aug 2025 13:31:59 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1fe2c019sm13268585e9.17.2025.08.14.13.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:58 -0700 (PDT)
To: Florian Larysch <fl@n621.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:58 +0200
Message-ID: <20250814203158.2816156-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804141631.7089-1-fl@n621.de>
References: <20250804141631.7089-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203519; x=1755808319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+xUHJNPiqtVLY/i9hysnkdA8h1lsj4HK+MKroDofNY=;
 b=dRt5/vnnlcSQxEP3aXNtliuX8APU63kl7ylpFSy+q9DVTv7FYMD1EDqem/vDhyNuNE
 wHSVy+b6Jhz25MaMaN2vh7QhZSNfsklh2tY0+5Td94qQtTtKTrzKvINP6je5cKfITPHC
 244Dw6fxVFeIY1ZmLJvkaKCUXkST4B3gbSx6+TXwZJpVWcZItzSeUpg11s+Qftemnr+b
 YriIS8hN4xjSa0FhHFSFZ+5gTTDa8i1d2U1qHKOECPfHvxA3M7cVWYn672IUzj8jdL21
 FjlbqXJmoHtCSk1DW/Ymu+5NPAs4hb0rxTA+rZBK3vqmplV19KdO1XKKTXRyoQbae45m
 JTJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dRt5/vnn
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump version to 1.2.8
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
> Bugfix release for the 1.2.x series.
> 
> Release notes:
> https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/91a1ce183fe8a77843ebe72d62aae51e5ce62737/NEWS
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/pipewire/pipewire.hash | 2 +-
>  package/pipewire/pipewire.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
> index 9ffe95cbea..2e6a9ae3aa 100644
> --- a/package/pipewire/pipewire.hash
> +++ b/package/pipewire/pipewire.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  3c00292f9a419610c9eeb6e45b958d460afb601ecc6894012574a3b9f118616a  pipewire-1.2.7.tar.bz2
> +sha256  7670f617220cc053948fc8f2c1ff788192479ef5d4f373d878ac8a7cab76a71c  pipewire-1.2.8.tar.bz2
>  sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
>  sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index 9ad92546cc..c1dc2aa0cc 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PIPEWIRE_VERSION = 1.2.7
> +PIPEWIRE_VERSION = 1.2.8
>  PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
>  PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
>  PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
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
