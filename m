Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95910C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46C0780E17;
	Thu,  7 Aug 2025 18:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoKSjkhBDNmh; Thu,  7 Aug 2025 18:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41DE580E35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41DE580E35;
	Thu,  7 Aug 2025 18:24:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E4614C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7521B40087
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pr168WRoKrBw for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 734A1400B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 734A1400B3
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 734A1400B3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so9174825e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591062; x=1755195862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DVUqGnoFoBC3hwS2yvc0Kt0FreYkPSScX0wd3Mk18nQ=;
 b=bWMVahyafUAK5EHALPtdKDvpZda29p3SE8DUM7//qsQRog59n3F8t2s+f7jO4gFzCj
 liMrRGSivQDYlODqbWPjX3u3KZ8GoqBfuwUYb8mWPs53kLE1ut8NPhyJl6GRuuusdu9K
 baBIjM2a7gDz+Ff3XWqAedZLWAdXJmD3KsEmMWGIlVac6bkqz/xSQnjxsjM1Ojur6Bev
 rdCkxUU5rSecz1sqnjsUA6//WYxF8OGRbT9tLy3nCPBkg/ORTlaJIjwf8Hp4UUswHnW3
 Mp0taXLpgw2SH4obmANRGegc43md4PN5VTWT0pNbXJczZj3WMfmRncWcaHktkel9Bh0e
 e2eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF9tut3fPPoUBPzNZHyQf/Zdgz8kVnyi+taOHJMFr7vbchTBbLuCDqpMNYVcIvRIeb/X4SvjXDJso=@buildroot.org
X-Gm-Message-State: AOJu0YyhI5Q2UzIen2Y61nhMuPoSp1EGglmlbkOM/+jL/D9N/aGG0Z3e
 ZIL/KEhioHcH7NSMXeajDc1nhmbr/v3ADVXJnbCXj2uaygmLOGwqzMFZJelSZzNgn9A=
X-Gm-Gg: ASbGncv/RYtY0MAqS4NFlQYGwY/KjccDGhsTrhmKaKgN5KhXqF9H+tMIFyzE91chsyG
 L/ixs3lmRhCP7iqQE9uAA06772Qwj1pwsBtM3Vreh2omalSEweXS6lRZ0/GvDMZEZTzKll3zNTZ
 k0YlhSD5UQHcJe0JaELK5pfqnIsDuWYAfIQfdehJigqUZXtbCpMFIkX6BgQYK4lXOvGN8UFrfpy
 XG7j7/WRExY+paIwfpqL62lVAdDdKQH56zf90GF2Ed7RK/CGNgSteKbjq3cFxQMW6IpDc8Y2UBn
 bG6rFsBb6mAI8u1PBcFf+nj7upBOSZASPNJmeCHAWvwc3M3LX+pB9atDpkByU4MBlccxKGaxGBR
 BMOZq12yMkitQfg==
X-Google-Smtp-Source: AGHT+IG0oYiGypA6zb4vzEd7SaTrAwZ+ANTcSoF6HkT9nzsV3iXHGtcttvQLHXRSA6gNULXFfZA1PA==
X-Received: by 2002:a05:600c:5494:b0:459:d6a6:77c with SMTP id
 5b1f17b1804b1-459e7136b2dmr63031555e9.33.1754591062541; 
 Thu, 07 Aug 2025 11:24:22 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e79ef4c8sm91022235e9.6.2025.08.07.11.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:22 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:21 +0200
Message-ID: <20250807182421.725124-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724193643.1193871-1-bernd@kuhls.net>
References: <20250724193643.1193871-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591062; x=1755195862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVUqGnoFoBC3hwS2yvc0Kt0FreYkPSScX0wd3Mk18nQ=;
 b=YdssB37LDVnO6Chc6H4inleP+l9FAFRR5YcFfW0d1yNNbstFJOqAnLtmxjhwAr4fR7
 8NocjNz4nwN0B0GkbWk33RnpGGnLRok/dOIekPHH/hYjQ90ttmjQuiYWyT1MLX/Ezs8X
 h1cRoOV6F4SZZ0F5tjaA8d1jMgHO7ssKTYwx/xhp1IQcP3ONIZcheh+7dtSiaLkGIRZO
 HrKCFe4P3VJ/UVUUjv8yOHdrDe9wQMHowCDNL9/hD9wG9RFHB++J+u7UZnB5fumbQFD5
 4S7y/jhuiie4Zq5XY/+do0WCGowHMj0k7FRTklxF/DrGi8bH92nQDtihneEQKdO7CMFY
 D8PA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YdssB37L
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 15}.x series
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  linux/Config.in                      |  2 +-
>  linux/linux.hash                     | 14 +++++++-------
>  package/linux-headers/Config.in.host | 14 +++++++-------
>  3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index f74a0cef53..b4c6624488 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "6.15.6" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.15.8" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index c3426f6a6c..1e6602c878 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,12 +1,12 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  2bb586c954277d070c8fdf6d7275faa93b4807d9bf3353b491d8149cca02b4fc  linux-6.15.6.tar.xz
> -sha256  936fdfd2405b5e0ac38d4e094b07772610c22cd478f4bb257c9bf929e762ff95  linux-6.12.37.tar.xz
> -sha256  3b67c170638142da56b7a9c3295f2483b88e8c4d3bc26b2bda63b6cf0cb9ee3b  linux-6.6.97.tar.xz
> -sha256  0f49bda42fbd7506063d537fec7d4d147c373a0324655fdaf2a65a000c9f7acf  linux-6.1.144.tar.xz
> +sha256  d37e92bc16b962a3025df156647bdad90b2db4ff36c7a6137817fe81ef3f28a6  linux-6.15.8.tar.xz
> +sha256  4811af1317f98d2cccea3c7695969a2c03a27cb02fd2d5327032dd5341842933  linux-6.12.40.tar.xz
> +sha256  d6c0ec4d55b14814f55b62a0b23a2d95faf66877e48fbfb4b83523e4afdf97ba  linux-6.6.100.tar.xz
> +sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  21786ee84981418279fcd60ae6ed98ab2f102b5a4a255bd81b881033f0afff14  linux-5.15.187.tar.xz
> -sha256  2dfa422b6bbe65a6b352a38129d27de918c3f0f05c72ecdd39d46d657ca0f0db  linux-5.10.239.tar.xz
> -sha256  c48158f7735668aac78b9d74bb3616f57a4ea0816ca09f7db83f7834d705b6a9  linux-5.4.295.tar.xz
> +sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
> +sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
> +sha256  3d63614e58bf1befaba3f5713145200d09f26e564832c8948094fdf5b11fa73a  linux-5.4.296.tar.xz
>  # Locally computed
>  sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
>  sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 5c0ec12287..23b65f8dee 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -444,13 +444,13 @@ endchoice
>  
>  config BR2_DEFAULT_KERNEL_HEADERS
>  	string
> -	default "5.4.295"	if BR2_KERNEL_HEADERS_5_4
> -	default "5.10.239"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.187"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.144"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.97"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.37"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.15.6"	if BR2_KERNEL_HEADERS_6_15
> +	default "5.4.296"	if BR2_KERNEL_HEADERS_5_4
> +	default "5.10.240"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.189"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.147"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.6.100"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.40"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.15.8"	if BR2_KERNEL_HEADERS_6_15
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>  	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
