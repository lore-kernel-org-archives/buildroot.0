Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A31BCD128A
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 13:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1557D4083E;
	Mon,  8 Apr 2024 13:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJga4YOhlGx4; Mon,  8 Apr 2024 13:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94E3440834
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E3440834;
	Mon,  8 Apr 2024 13:47:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDE621BF59F
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D826240AE6
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ggyZqo8LNIO for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 13:47:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E0A14017B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E0A14017B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E0A14017B
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 13:47:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-345600106d3so1314442f8f.0
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 06:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712584020; x=1713188820;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uhxSf21QiMRFBCpUlv4T2OGsQCIZzSNePAsKmyb3BBE=;
 b=Yy+cx2V3lCZCDFUWdWrPGSj9sPstN/06pP1Lo7l0pE7kyld2MA43TBUyrvzRrKWOB/
 17Jeou4FQxUZUWN4YWf6h3juG71QGF1Pgd+bQWgDfxZBMt54pB65bN7OEXlWQWDPXu94
 mMyMRH87q6kwVNcD0GW62hzL6jeE5q24N8J8Ld42Pe+vHbiHBGl1WG6Bo0svuiT1mmaX
 gyubEBk5AeihXj7PUVZ2oZsqGg07ysOYLEANovYizUZta8iu+nXwG8NdcRQDIpdteibz
 LsP++wPT9KJtKHS1olq03WYRJP+nxWavRivZAKUdo6jzSM8z5MQPAvhVMhPf6x184vwg
 jJsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+TUgA4CTjjDCYGwumKid7oCVzOLlPE1bS98QAuNQDz8+AMA9HkgD7Nz0VGtMgL7xwSgGwJ4sjOzmY4S+d/pMEtur7pHCRLQ==
X-Gm-Message-State: AOJu0YyhGFz4zH/rKFikOQW/ypo6Q7DooYxOj9aiMFhU43X8VMQwsmS0
 uy0z3f509Fm9Iw/1YosId2p2hUn61DgS5Fby37oSXShpLSsXO/UujTQvJTIrmTU=
X-Google-Smtp-Source: AGHT+IHiPA8VXPvvx/JYCccTNix/6WZ2cptRGwgCwzOmlevyCFO3vJqP6gjU/IOfujivzvbD3ezEXA==
X-Received: by 2002:a05:6000:1847:b0:344:3dd:5092 with SMTP id
 c7-20020a056000184700b0034403dd5092mr6191449wri.16.1712584020006; 
 Mon, 08 Apr 2024 06:47:00 -0700 (PDT)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 d2-20020adff842000000b00343c06d75bfsm9051262wrq.61.2024.04.08.06.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 06:46:57 -0700 (PDT)
Message-ID: <854d8028-aee4-40d4-8303-a49c3cd50481@mind.be>
Date: Mon, 8 Apr 2024 15:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-17-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20240407103512.1112712-17-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712584020; x=1713188820; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uhxSf21QiMRFBCpUlv4T2OGsQCIZzSNePAsKmyb3BBE=;
 b=cVAxR58Mb1qbWq1yIKHhvRaqBKJ3cKdkwCr55In+G774wZHemHjX9ie3hvjeW0rr+H
 WpBxv3yM0SbczXcGPXoxs6F8t/Knq/8DC47I2tmYM5YIm+J7290oB6ng0md7KWwEEbrJ
 YPtKaFOXFdhZo29l4boEtyqTO2B1rJxg8hhBeX7KX2rMoRCWH9+1DjsdpqhUv/J2yI3R
 mTEsMro2ngLsaWAqg6KgAUdojFFWCwSmeVyQ41ofQhVCKa+3GORyJjtQS5v+R6fjJe05
 r3Dn49ueH289QedBtrjSmSNGtGqtczdthveWssMr0jpuPXz8jKUJF3SxMc70e5jlhcTJ
 hI7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cVAxR58M
Subject: Re: [Buildroot] [PATCH v12 16/16] package/ti-k3: switch ti_am6{2,
 4}x_sk_defconfig to HS-FS by default
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
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 12:35, Romain Naour wrote:
>  From Andreas Dannenberg (TI K3 architect) [1]:
> 
>    "HS-FS should be the default for all TI AM6x devices. This is our
>    "production silicon" and what's used for (almost) all projects,
>    especially new projects. This being said having support for GP device
>    variants still is desirable for existing boards/projects, such as the
>    current BeaglePlay boards (amongst earlier version of TI starter kit
>    EVMs for AM6x)."

  Andreas, BeaglePlay would anyway be a separate defconfig (it has another 
device tree), no? I think it's more relevant to have a BeaglePlay defconfig than 
to have a ti_am62x_sk GP defconfig.

> 
> See further details on e2e Forum [2]:
> 
>    "Unfortunately with this transition any existing GP device based AM62x
>    (and AM64x) boards will no longer boot with MMC/SD card images generated"
> 
> For such existing GP device based AM62x (and AM64x) boards, users have
> to provide the tiboot3.bin name using BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN.

  Please add this information to board/ti/am6{2,4}x-sk/readme.txt


> [1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1210443/faq-am625-generating-sitara-am62x-am62ax-am64x-gp-device-bootable-mmc-sd-card-images-using-sdk-v8-6-and-yocto
> [2] http://lists.busybox.net/pipermail/buildroot/2024-February/685821.html

  You swapped those two references (the first quote above comes from [2]).


  Regards,
  Arnout

> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   configs/ti_am62x_sk_defconfig | 1 -
>   configs/ti_am64x_sk_defconfig | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index fa2c008d4c..5c7b97b3b0 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -29,7 +29,6 @@ BR2_TARGET_TI_K3_R5_LOADER=y
>   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
>   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
>   BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
> -BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
> index f7c6d16b35..28e97f94e2 100644
> --- a/configs/ti_am64x_sk_defconfig
> +++ b/configs/ti_am64x_sk_defconfig
> @@ -29,7 +29,6 @@ BR2_TARGET_TI_K3_R5_LOADER=y
>   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
>   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
>   BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
> -BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am64x-gp-evm.bin"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
