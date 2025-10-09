Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE58CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A7D410DE;
	Thu,  9 Oct 2025 14:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxEpA5vRU-PY; Thu,  9 Oct 2025 14:57:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19AF0410BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19AF0410BD;
	Thu,  9 Oct 2025 14:57:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D980119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ED4D81303
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSq43m3wt6rb for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:57:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F33558119F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F33558119F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F33558119F
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:57:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso8439675e9.3
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021834; x=1760626634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=loe847IYUAdr+NJsjvp2V5Ve+BxLMLuwYm0crl1je9A=;
 b=abgTCISniHJIDqIIdF0QadtNBChXOEdbcj9aN0zyT1bm6p232JeyADgPsUW5pDC9k/
 M38g7122O8CoGgun4+Z0uvNj1ZFajgumIlAR0TVAEV882VSqC2kY/NsQ4ivu+VUOOEOr
 4kbmjpVqNfqnOXDbGDM8Rf94yrMG/YvfGNxajoEwHv7Txel56y5yaw7mYBcqYfK1T30E
 v1ChnbK65Hi9TtHIYmz5K/jIWzwaMcKCLvrBdBaW4Wjl5xAV2VEHQ6aaOKKPaTbbiKFP
 mQ7hZKkVH8MxOYPW2VxX7RhOy5CioQU/NoqIceMAExWFR/nyS5CQGubqTmyfPem2JdbQ
 vDZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVSeDxVXJ5qcc6V4sYG+Yiq3Mv3Ql0InKbe4Yhph1JrWjxCOe90S6sul17CcFREi7E2repzaabHy8=@buildroot.org
X-Gm-Message-State: AOJu0YyPGuPFS9owPtJCV5/dbtKHQK+Scuz3wmA8bunb21yzr4AC5rPo
 EhgMsccY9Cw/QoB3l2RPfttgKInnw1o5aNAAQKRcuWuKI/jxT6nAWWTZaRQNrSQnj+k=
X-Gm-Gg: ASbGnctPbAHwi+53U5gfJ6MOuoCcegzLDMiSxZpJLWkqDkgstmZRh0eFkjZ9GROqF6x
 mAI1Sz9NnAInN9QXp+U4elG8rpjiA+UwXoCulSVxBRihUtXwmXRQLhw+wwyRTIkVusA8JDajHj6
 4IKaEwSdFu0JR6/6jpQGDuQHX10tWm+iIWZR4s2cs7z5d/ajYs1aMcjPMA8JL+yaDc2kLQMwQxt
 3uXrIGN00PaROzsMl0lQ4+5NYVa3Fi7QK5tJOcmjdHpcjF2bRHhsbs62NVDrL0pVP9Wk7A0WjXK
 SdJvovI76MtGnZ8DbrYi/Bb6U1IRVuyx+Vu1inr+KjGiHSnykQRzXlVCsocahezNJmQX6SHH7o/
 HV19fbX0S4U/4GSq2z+E85Ja8rTStnnTW3SN9e/dT
X-Google-Smtp-Source: AGHT+IE05lhWUffuxHKOeHS3Vm6yRJoejHQAtOsfR7WoOLoo1hX8eBZXQbT3lL/p145dVBC+hvy+Nw==
X-Received: by 2002:a05:600c:3acf:b0:45c:b53f:ad9 with SMTP id
 5b1f17b1804b1-46fa9b1ad15mr56511105e9.33.1760021833958; 
 Thu, 09 Oct 2025 07:57:13 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3e3206sm38390145e9.4.2025.10.09.07.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:57:13 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:57:13 +0200
Message-ID: <20251009145713.484333-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250928200636.277674-1-ju.o@free.fr>
References: <20250928200636.277674-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021834; x=1760626634; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=loe847IYUAdr+NJsjvp2V5Ve+BxLMLuwYm0crl1je9A=;
 b=QBygVDP+m2ujyWf0CTcPUP+NDE5j+9xHajcsutx1QhW0m2OXVTaF9Yht3eCG0+YWaj
 xX8FVJKCwwCSZpFniZBEmMH0sLV30y4SoFSjZDWKPd/QPxrbrA1aX6p20cifGaqdS3eO
 P14UTmCRPKNP2nEGuSAWPD0yf3cGBwL76IDBl9Ys6u/Rlg3lyo8+QmatkmYCml1JxSfY
 dkQLSV3bSxhAECrsbmhqxmmJONwjm1Pr+9Z1fMHguwArf+QgcrlL4sFl4G5t5V3ZM7GZ
 Fi7sJAVOCW2V6DEttNwU+kmj08IbKfTVtTfHgGBNXXYaBQTtNJ4F61/yzxN1izWbRt+/
 f8MA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QBygVDP+
Subject: Re: [Buildroot] [PATCH 1/1] package/vulkan-headers: needs C++
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
> Since Buildroot commit [1] "package/vulkan-{headers,loader,tools}:
> bump to 1.4.317 release", the vulkan-headers package is failing at
> configuration time with toolchains without C++ support, with error:
> 
>     The C++ compiler
>       "/bin/false"
>     is not able to compile a simple test program.
> 
> This is due to upstream commit [2], which added CXX to the CMake
> project file.
> 
> This commit fixes the issue by adding the C++ dependency.
> 
> Fixes:
> https://autobuild.buildroot.org/results/10f63398940d52be9a8ee306daf4203ceca25eb8
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/52664093dee0f280db191c391167848dc5b09745
> [2] https://github.com/KhronosGroup/Vulkan-Headers/commit/85256c712ce9ee9755ae74faacc3e6a1d2c5eddf
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.08.x. Thanks

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2068398504
> ---
>  package/vulkan-headers/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/vulkan-headers/Config.in b/package/vulkan-headers/Config.in
> index c0fc8f20b0..fdab31893f 100644
> --- a/package/vulkan-headers/Config.in
> +++ b/package/vulkan-headers/Config.in
> @@ -1,7 +1,11 @@
>  config BR2_PACKAGE_VULKAN_HEADERS
>  	bool "vulkan-headers"
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	help
>  	  The Khronos official Vulkan header files and API
>  	  registry.
>  
>  	  https://github.com/KhronosGroup/Vulkan-Headers
> +
> +comment "vulkan-headers needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
