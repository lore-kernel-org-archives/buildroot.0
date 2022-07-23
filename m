Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA1CC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDE7341681;
	Sat, 23 Jul 2022 15:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDE7341681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1DrCd7CVB6o; Sat, 23 Jul 2022 15:39:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75111415EC;
	Sat, 23 Jul 2022 15:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75111415EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B53081BF46A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FF2384BD5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF2384BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebjR4D0JzZZK for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:39:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB8C84BCD
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACB8C84BCD
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:39:31 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d8so10153382wrp.6
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YGMVlypHYVR7BePKSxyHnypZA5L3ZAK5U28foQxY5eo=;
 b=q5Gn7vdnj2VB+wM5JNDgjZmTbaWA8+enfUAxm34axLNFP7sGsspRE3NLcKibBq9ZAS
 u9qHsPbp2GpqoDp3w/DunF00CU9NJPbQpJOoIlX8h8kufXdulzZbrNdmU01YRBtwlLlh
 85mV4d7z+qmOeyPELgxxemeVafBz3PzIynezT795EFkBVtyIB6g85XbxX6LDEcngfN8c
 fCZSAa5uJ56P3s7IqPVJB6i0bTU++4JsqkWbJlE6CLFMWTOLr5CdNU9fNHf/3oFNsqgJ
 vWqRyeSTiW/LcLf0V8veqOsbDpmMdoDin8h1r7rOO4tZFXzVpm5kxqZMatko+KuwhD/g
 Jg/g==
X-Gm-Message-State: AJIora9zGTB3ui6Tb7//PesnvxrppTnP8qpky0D7DpCfmR1rxqvi/vbc
 JyN8DoG54U2AjNcGGY6lK3r/+A==
X-Google-Smtp-Source: AGRyM1t77bfJPR+4aDs8Cj89nbMUlPxdVYXXnXWp5P4gjV2Nrpg9EUyLAcCf6WoT3BZ262AUkHAd8g==
X-Received: by 2002:a5d:4889:0:b0:21d:eab7:f798 with SMTP id
 g9-20020a5d4889000000b0021deab7f798mr3108922wrq.96.1658590769904; 
 Sat, 23 Jul 2022 08:39:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c190a00b003a342933727sm5663767wmq.3.2022.07.23.08.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 08:39:29 -0700 (PDT)
Message-ID: <fd85ae80-5aba-c8b2-b527-aeb129601e69@mind.be>
Date: Sat, 23 Jul 2022 17:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Xuanhao Shi <x-shi@ti.com>, buildroot@buildroot.org
References: <20220722095503.27868873@windsurf>
 <20220722143341.17115-1-x-shi@ti.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220722143341.17115-1-x-shi@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YGMVlypHYVR7BePKSxyHnypZA5L3ZAK5U28foQxY5eo=;
 b=g8DHow900UetqrcMRsWfTwTzSHCXn54F7mAPq1KjltZ8EfmbElpUmBMKKJUL4K5+sT
 VOYhKhknPi+EzJsBcR9aXEbjYwwvavBEISnvX6gjVQnD0mitsP3ypWyfaqHVunIbCRYa
 B2p+xCwS0DfNNS2xLrIuUrDsxjTv7armRbQH/jigY4HZst65hiOG0Nd6Ef+efzoppZYx
 eQYjkgzh6tBmWkHcUaOHgSfR6ZjnpAxEu47QUjNh1/od4q9MwxoIGZT+ljSIcfwPs+PU
 Kp+cfStCymHMu8p8NmuSnN3XbTxejqBt9BmubMoaRWrTIYa0f4HvHG1ATS7zhMqOks7r
 71Uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g8DHow90
Subject: Re: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add target
 board options
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/07/2022 16:33, Xuanhao Shi via buildroot wrote:
> This is the second try sending this patch, sorry in advance if it's
> duplicated.

  This time it was successful!

  Comments like this however shouldn't be put here, but under a --- line. That 
way, they're automatically removed from the log when it's applied to master.

  Applied to master with that fixed, thanks!

  Regards,
  Arnout

> 
> Some platforms such as TI's k3 outputs a TARGET_BOARD directory
> in their ATF build output paths after PLATFORM.
> $(@D)/build/<PLATFORM>/ does not contain the debug or release
> directories for these platforms.
> They are under $(@D)/build/<PLATFORM>/<TARGET_BOARD>/
> 
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> ---
>   boot/arm-trusted-firmware/Config.in               |  5 +++++
>   boot/arm-trusted-firmware/arm-trusted-firmware.mk | 13 ++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index b1fc03e10b..a9354522b5 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -68,6 +68,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
>   	help
>   	  Target plaform to build for.
>   
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD
> +	string "ATF target board"
> +	help
> +	  Target board to build for.
> +
>   config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH
>   	string "Device Tree Source file paths"
>   	help
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 998de4b814..30ecb187ae 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -41,18 +41,29 @@ endif
>   
>   ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
>   
> +ARM_TRUSTED_FIRMWARE_TARGET_BOARD = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD))
> +
>   ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG),y)
>   ARM_TRUSTED_FIRMWARE_MAKE_OPTS += DEBUG=1
> +ifneq ($(ARM_TRUSTED_FIRMWARE_TARGET_BOARD),)
> +ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)/debug
> +else
>   ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/debug
> +endif
> +else
> +ifneq ($(ARM_TRUSTED_FIRMWARE_TARGET_BOARD),)
> +ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)/release
>   else
>   ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release
>   endif
> +endif
>   
>   ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
>   	CROSS_COMPILE="$(TARGET_CROSS)" \
>   	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE") \
>   	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
> -	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
> +	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
> +	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)
>   
>   ARM_TRUSTED_FIRMWARE_MAKE_ENV += \
>   	$(TARGET_MAKE_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
