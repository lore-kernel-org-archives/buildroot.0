Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5764CC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E71A61253;
	Thu, 26 Jun 2025 19:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMhOS8Zaw1C0; Thu, 26 Jun 2025 19:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F668606A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F668606A0;
	Thu, 26 Jun 2025 19:52:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8116310A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DCB9606A0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cel8W4AbwEJi for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:52:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 863F360674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 863F360674
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 863F360674
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:42 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-453608ed113so13630675e9.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967560; x=1751572360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lH4vuFtTRG1o6clIz3MAbL0g2lKBLMRFam1wq8NrBrc=;
 b=v14gVoOrqaC4nRH7M8Vbw5/rOBvFux+2rjvCBWAJs0aHhvSXMh6d7lp5s2YKwkN7D6
 iOHkfjjckTh7xklgcsNG/0eDVUnQk+VC1sAFqz6Nxkdisom52QihR1wYIESbb3RXORvr
 CxRyaN10alJlIxE6u/lbztIT3sUERR8r4v2HzKku1SvizQGkF4Ua9PJ3Krp+IzAOa3TP
 UK6VkzPeL68ldKL8SVcfpYx5IvP1ZV6oMB79zA6dajzR8i6Q/Rb+FWny7wxN9jGCCBK1
 SOBXlJLfhuPd3GMwSyPrBsc5uPYuRIzgMukutN2iwx0Rckqla+T0yFarE2h2CRbTBfvF
 4GAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrH9qfByHuZoBq99SKEUSAkyqf6ch4/QrhJ+4MVb2yDEwl1WJlI0AYJP08AQ/QEdYZ7+wwVMzOxUo=@buildroot.org
X-Gm-Message-State: AOJu0YxbHsGxdTInx/L6fPFSOq7SLFdRARhGI7bx7VbSNyhQq59p21vk
 n+0i4HIxXc3/DReQdutCeH2n/sE0DYXYrynt1Vf0RdgsMf0vYoo4f53SKXRX+WFKaBNpRqjpruH
 flxgw
X-Gm-Gg: ASbGncsgq7C2M23XWyjA1p7nX0uLsKSRIUr03bytBe+gsh8QicjbvSWYuvc0PawF8Dl
 beOz0L8ol82x4VbiNFkx2TZ2PRFkImh4PDL8wuvmm7FwL3cqXZoGiU3Dc5dKVsivLS7OcB5CTVt
 QCjHMlf9Jy1hhVMvC88PYRF2pUmZnCH1LPpO0dXu4ElF2w+HX5C6B02AaR/v+RZVn5luhLhJLwm
 iiyPw/EhoXpArwroEg+kzw45FkUBEK/LV+ZlquPJv9sA1NVedrmhUG9tl6t4CiRHeeJ+aEOGUDB
 w52oFu2qXryZV8HUWvi41F4qk27IElFoVGsIVc4bTG2qtYazpSJhqGwLvKN/jAUxEuidJxxZBLt
 SgxSOm5qvo4Rgmv+JdDU9OzL/lriLarrQ
X-Google-Smtp-Source: AGHT+IHDwfdyehml6/V6h2OcyACofIeYD7JzmwYa2VupPS5e/1EIsKI+ipem/83ViC6nHyFeRQZjeQ==
X-Received: by 2002:a05:6000:2807:b0:3a4:f892:de7f with SMTP id
 ffacd0b85a97d-3a8fee65129mr484245f8f.36.1750967560589; 
 Thu, 26 Jun 2025 12:52:40 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52a26sm718698f8f.51.2025.06.26.12.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:52:39 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:52:31 +0200
Message-ID: <20250626195231.14744-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612171117.3475778-1-bernd@kuhls.net>
References: <20250612171117.3475778-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967560; x=1751572360; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lH4vuFtTRG1o6clIz3MAbL0g2lKBLMRFam1wq8NrBrc=;
 b=QrhNE8d9eS6d9a2RTUlCRtZuxMvC7jN9A1xIbVbfUbR+STBdwRi/zl10UZHc2IaTHy
 eImonsJn0/dFVLxClx3tzN+KGvNUMHHZnCCZWsi05kW9aSZjqbjEV3aTpMbbwK3MyPYV
 nN9rCv+7vjAdA2Txl4bKDIj/VOV4n7qsLRQ2FC+g2BdEjfF8TX0upjcDuV4kYAKhkKSG
 vRzMwAmTbv9D0UKJjHqHsv4dTeGLB5bc0mvLo1D9KRqEF5ZCnfOQyTyTPQ+Yxw3fJI9h
 ZlsmD3lLt8GtrEn24090wVcEP+3taNihaKTxIPyuxe0X6JA6Fdh/23vJ4trO956wpYJD
 EdwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QrhNE8d9
Subject: Re: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 6.{12,
 14}.x series
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

Applied to 2025.05.x. Thanks

> ---
>  linux/Config.in                      | 2 +-
>  linux/linux.hash                     | 4 ++--
>  package/linux-headers/Config.in.host | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index ddd6515446..ef81474ffc 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "6.14.10" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.14.11" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index b69793bf63..c6b3bb7ee1 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,6 +1,6 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  de8b97cfeae74c22f832ee4ca2333c157cc978d98baa122f0ee9c01796a2fe43  linux-6.14.10.tar.xz
> -sha256  a9b020721778384507010177d3929e7d4058f7f6120f05a99d56b5c5c0346a70  linux-6.12.32.tar.xz
> +sha256  3f1ccd0a6dc9c9777cb6fcef357c77e4a2386c84c52b6d5bbcda79c16af33b1b  linux-6.14.11.tar.xz
> +sha256  c0a575630f2603a20bb0641f8df8f955e46c9d7ac1fae8b54b21316e6b52a254  linux-6.12.33.tar.xz
>  sha256  0d79ff359635e9f009f1e330deed5f3aefd8c452b80660bffdc504b877797719  linux-6.6.93.tar.xz
>  sha256  bc3c45faf6f5f0450666c75fa9dad9bc7c0cf7c7cba0dbd94e5cfdc58229c116  linux-6.1.141.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index efe50f98df..e2dc5f8075 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -445,8 +445,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "5.15.185"	if BR2_KERNEL_HEADERS_5_15
>  	default "6.1.141"	if BR2_KERNEL_HEADERS_6_1
>  	default "6.6.93"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.32"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.14.10"	if BR2_KERNEL_HEADERS_6_14
> +	default "6.12.33"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.14.11"	if BR2_KERNEL_HEADERS_6_14
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
