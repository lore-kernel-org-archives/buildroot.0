Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C524C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E14D605E5;
	Sun, 28 Apr 2024 18:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UlczgArhXi7b; Sun, 28 Apr 2024 18:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3950860679
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3950860679;
	Sun, 28 Apr 2024 18:06:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A38BD1BF344
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E55D81FB8
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_49V0JgBKS4 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:06:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F263D81FAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F263D81FAF
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F263D81FAF
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:06:19 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d858501412so47950141fa.0
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714327577; x=1714932377;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pZEMi9zG1j6gOe+4eNxm89eiXiT7Z9z6Ph+bS/nUWOw=;
 b=vgUv1v7AHuMHfGQbioK7774P3uEDLj+U/OSvM7AH1/Z5/EYg4K0PqOpdJTYzGqjOil
 i09hHVzRPOhOp250URmwvgoF4PUFZudZ0SdpcJAi3q0maBa9ValGo2fWOvlxGxMVKE5B
 cBm0UgW+JywolFZ6itsdq9M/ZZrisf+6gtRi8TFJ9cbYtFe44CyISsa4zelscge/7sBK
 NwIGhecWVGGItSEJ9w5CjZQgAFv/u3ZY0OGTeBWwUOtHd6L/kajVi1kkYHq6bMYpG9oY
 Pw893T5piGFsAggcPSx/BE+7s9mQTwXj4Lx9LCDDDKENTI41DQvvmizR6CG3sHCMTRik
 HaIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7z5SWj2L70Hqf1oVntu4bZb345axfiHM+lm/mVAoDuxFvd1Icbk6ex4ZXXcsEVoH4mrEtsSPTdn0R6sWTaYY/r2qLBxJF+w==
X-Gm-Message-State: AOJu0YwqAuyxJg6tUs0SX7/XzWy5oJEFyMhJtYd+blRZAPao5DtXyVYK
 x99YYkzsLwkjx9byaYyE0dbsfXZp+ejEgFFggKo14VT4Qb/3RNjCeJ6AyVJy29I=
X-Google-Smtp-Source: AGHT+IEMiDFVnUy3aGWZz6AQQoOfbJm0MqbqaK71J1HxZ3o/TPww+gt4OP4WmgYr3Q9WZduqabWlag==
X-Received: by 2002:a2e:8ec4:0:b0:2dc:b467:cb35 with SMTP id
 e4-20020a2e8ec4000000b002dcb467cb35mr4665325ljl.32.1714327577064; 
 Sun, 28 Apr 2024 11:06:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c4e9100b004182b87aaacsm38582824wmq.14.2024.04.28.11.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 11:06:15 -0700 (PDT)
Message-ID: <c998a4d1-10b8-4b2b-934a-f1e728ba2a7d@mind.be>
Date: Sun, 28 Apr 2024 20:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ismael Luceno <ismael@iodev.co.uk>, buildroot@buildroot.org
References: <20240413042539.32743-1-ismael@iodev.co.uk>
Content-Language: en-GB
In-Reply-To: <20240413042539.32743-1-ismael@iodev.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714327577; x=1714932377; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pZEMi9zG1j6gOe+4eNxm89eiXiT7Z9z6Ph+bS/nUWOw=;
 b=J8SVCt5TkD62xiaiXCrfPL671nEDIckuRTPCxHPdlNSdCJefvc2wkTSPb4MBsEXlUx
 WcRZ0+l1tcBuEQnPBDmoUDUfWBAXsrF5Uoy+satmSlpmcGaj4e/cT1r1YXzCumWRP6qy
 zngzfuXFpkWlzXQOxh2O+X9gggU2eNIwEjPeQkrqHPHUSAZ1GkUs8YorkcdHAYsVXCuU
 +Uz29jO8oB5ZBN09juVpQ5Ty1YCYfaV15HyEJHDMQj7MihDkFrAv4wqz8J+nZUjx685W
 GaZC49KAtXOHGvwjeVjnDFSDDkoKKrS6O/2RF8FwWwP3Ac2ImRA7tNQkl8AmevNx5OTs
 nRFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J8SVCt5T
Subject: Re: [Buildroot] [PATCH] package/axel: bump version to 2.17.14
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/04/2024 06:25, Ismael Luceno wrote:
> Remove ac_cv_prog_cc_c99; axel has been updated to autoconf 2.72, whose C99
> test is compatible with BR2_USE_WCHAR=n.
> 
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/axel/axel.hash | 2 +-
>   package/axel/axel.mk   | 5 +----
>   2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/axel/axel.hash b/package/axel/axel.hash
> index b2ff52876b4b..4902dd7946c1 100644
> --- a/package/axel/axel.hash
> +++ b/package/axel/axel.hash
> @@ -1,2 +1,2 @@
> -sha256  6af9c0238ca4fb850baa17878de0361868e3ff6d9302298d83c6d26931c28723  axel-2.17.13.tar.xz
> +sha256  938ee7c8c478bf6fcc82359bbf9576f298033e8b13908e53e3ea9c45c1443693  axel-2.17.14.tar.xz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/axel/axel.mk b/package/axel/axel.mk
> index 90e5156e064b..ff96ea94b676 100644
> --- a/package/axel/axel.mk
> +++ b/package/axel/axel.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -AXEL_VERSION = 2.17.13
> +AXEL_VERSION = 2.17.14
>   AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
>   AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
>   AXEL_LICENSE = GPL-2.0+
> @@ -12,10 +12,7 @@ AXEL_LICENSE_FILES = COPYING
>   AXEL_CPE_ID_VALID = YES
>   AXEL_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
>   
> -# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
> -# provided by autoconf relies on wchar_t.
>   AXEL_CONF_OPTS = \
> -	ac_cv_prog_cc_c99=-std=c99 \
>   	CFLAGS="$(TARGET_CFLAGS)"
>   
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
