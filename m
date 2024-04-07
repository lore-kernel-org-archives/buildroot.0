Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1672CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2AA9820B2;
	Sun,  7 Apr 2024 16:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUSRdhfO24b9; Sun,  7 Apr 2024 16:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A886D820B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A886D820B3;
	Sun,  7 Apr 2024 16:13:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 150411BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 021F740CB6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeKO8fBJZFl2 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0CBDC404A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CBDC404A3
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CBDC404A3
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:13:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4164c9debf6so4093485e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 09:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712506380; x=1713111180;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=11r2bzp/SToaDfcwIjouRcb9qsTZHL6+e8DVEsgMKo4=;
 b=c62yE7pjEnXXfWRPOmOYyeoflgZNCjoGD8QwouXiX643FhEQ9X+muNZywv8COQ7mlH
 5Fp4bM38MT6a6yBcHZDz57Jh9AznSaH0Eqz3vkKJ2mwzcoz3FmGNvqvwgmX5dmZDio7Q
 RG82w6+AHga4voDDAUuymf9IzDjgyXXD4qzPJvYj5E0Vo09oHCpi0PcVeSkFZldaIV1s
 zj0fCJjox4Sc+T50etF7F7BFznpIWw+Xr93sMovljz8ckbayKjXARItcLMicbEUmb8SL
 28PVtJ2DQmy/F5NSJgS+x3PaSIbP2mmAzsnmGCpFwIkk0QuBFIxOFxBYqScum+7e2J+x
 JkAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSCzyUW53ncRNXLJ+tHYVv5T5QVcrU+bQEsM+r/Sg5+Mo9w4rXjQfWkcNvrxfh6pJRBVMG5AAKCdHZutg/4Oyuox9oSfn5RA==
X-Gm-Message-State: AOJu0YxKZxIqjMaKb6Q0NxFgy5I7sZKW3UrRPvUSd5bkvc/y30WLtDtO
 9GHgnvv4I7Dvadzj23ze2gxJYy4ho6c2JB9UnXvPx6c2R+Xyx6cw5yxhfDTDPko+5Vhu6W//XAN
 Q
X-Google-Smtp-Source: AGHT+IEGiGIYCt88FntJzVA5RDTFatidRtkU+2pAIYLhkQX0E1oBwCx/LXdvICwAjdHbOhyVXsJkZA==
X-Received: by 2002:a05:600c:5253:b0:416:7396:6b14 with SMTP id
 fc19-20020a05600c525300b0041673966b14mr133174wmb.5.1712506379943; 
 Sun, 07 Apr 2024 09:12:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 jg1-20020a05600ca00100b00414688af147sm13546418wmb.20.2024.04.07.09.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 09:12:59 -0700 (PDT)
Message-ID: <a09050a4-85f0-474c-a44a-9fc22a5cac4a@mind.be>
Date: Sun, 7 Apr 2024 18:12:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Gouarin <dgouarin@gmail.com>, buildroot@buildroot.org
References: <20240306113724.121900-1-dgouarin@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240306113724.121900-1-dgouarin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712506380; x=1713111180; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=11r2bzp/SToaDfcwIjouRcb9qsTZHL6+e8DVEsgMKo4=;
 b=cDB25b2svak8//6TTJcg81HGZJwuN8d6OdDBEN26487Oe1wUtiPJKW+EhHU9bLDQHY
 mxAAaervY2n9oK1eNnuonMRRUa+A9bmxCgVMyoMstudYsz10AAKz//YoNPYaW2rgYqMm
 4G+yq2HhgxopPFUItbLyGgyWzO2zfP10W9koXTfI0mWQh7AAzjdb1hQUVB47NCJBK3Jj
 yj643D+JRNxKOidJ550Rg/NS9Qa+ZxiYqsYlgVti7tZn3muafCd+pbf1DTV3NZ30gbTK
 /v8XBISVz/CCTi3C/V1iDi7xuWsB+qm29HInhGPS5FN4Gwcc8bUHPaHf8kqzfXQhM++T
 ml/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cDB25b2s
Subject: Re: [Buildroot] [PATCH 1/1] package/fmc: enable also for aarch64
 QorIQ processors
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: ju.o@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/03/2024 12:37, David Gouarin wrote:
> QorIQ processors family also includes LS Series wich are based on aarch64
> 
> Signed-off-by: David Gouarin <dgouarin@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/fmc/Config.in   |  6 +++---
>   package/fmlib/Config.in | 10 ++++++++--
>   2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/package/fmc/Config.in b/package/fmc/Config.in
> index c89a87c99e..1c6ae5e80a 100644
> --- a/package/fmc/Config.in
> +++ b/package/fmc/Config.in
> @@ -1,14 +1,14 @@
>   comment "fmc needs a toolchain w/ C++"
> -	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
> +	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
>   	depends on !BR2_INSTALL_LIBSTDCPP
>   
>   comment "fmc needs a Linux kernel to be built"
> -	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
> +	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
>   	depends on !BR2_LINUX_KERNEL
>   
>   config BR2_PACKAGE_FMC
>   	bool "fmc"
> -	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
> +	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_LINUX_KERNEL # fmlib
>   	select BR2_PACKAGE_TCLAP
> diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
> index 97d55d1250..459d5bf102 100644
> --- a/package/fmlib/Config.in
> +++ b/package/fmlib/Config.in
> @@ -1,10 +1,10 @@
>   comment "fmlib needs a Linux kernel to be built"
> -	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
> +	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
>   	depends on !BR2_LINUX_KERNEL
>   
>   config BR2_PACKAGE_FMLIB
>   	bool "fmlib"
> -	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
> +	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
>   	depends on BR2_LINUX_KERNEL
>   	help
>   	  The Frame Manager library provides Freescale PowerPC platforms
> @@ -33,6 +33,10 @@ config BR2_FMLIB_QORIQ_FAMILY_T2080
>   	bool "t208x"
>   	depends on BR2_powerpc_e6500
>   
> +config BR2_FMLIB_QORIQ_FAMILY_ARM
> +	bool "arm"
> +	depends on BR2_aarch64
> +
>   endchoice
>   
>   config BR2_PACKAGE_FMLIB_ARCHTYPE
> @@ -40,11 +44,13 @@ config BR2_PACKAGE_FMLIB_ARCHTYPE
>   	default "ppce500mc" if BR2_powerpc_e500mc
>   	default "ppc64e6500" if BR2_powerpc_e6500 && BR2_powerpc64
>   	default "ppc32e6500" if BR2_powerpc_e6500 && BR2_powerpc
> +	default "arm" if BR2_aarch64
>   
>   config BR2_PACKAGE_FMLIB_PLATFORM
>   	string
>   	default "P4080" if BR2_FMLIB_QORIQ_FAMILY_P4080
>   	default "T4240" if BR2_FMLIB_QORIQ_FAMILY_T4240
>   	default "FMAN_V3H" if BR2_FMLIB_QORIQ_FAMILY_T2080
> +	default "arm" if BR2_aarch64
>   
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
