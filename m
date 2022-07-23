Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78B0C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 319DA4245B;
	Sat, 23 Jul 2022 19:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 319DA4245B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRqqu0H86RKY; Sat, 23 Jul 2022 19:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B366442458;
	Sat, 23 Jul 2022 19:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B366442458
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4A91BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44CEC827A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44CEC827A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xepcSZKe9P9l for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:08:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF11824E2
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CF11824E2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:08:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so6987941wmb.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DXikTl153yxhAJ2uZWxEl4qfk+U3tBFYDU7OonlqcoI=;
 b=J7u8eCmggs4zQkW1dNmUhptI+OaGGlxaGaJ5yAJaocxURnDoBmfYSCHOtoxd8FrB5M
 2hxG0M3jch1x5PUeBhFPw4xLOps0gKcjaPOvJbeYt4Vu+T/4EsxXs4u9T7KW4i4jaSEj
 LwR1BQktTYre4r7O2dikbaA1EfUMoRu4B/CZKcVCSHtSSv6jkY+xlqlTaEdZyCk7J/Kh
 MfKSJ49rAvy6kEJODc5gDfbe6Zplyl2BE0KKmyGneKsj8Ci2JLBPrTWu19OmuxtSLKsz
 FnzHFftt6qExSVCx0t00rG4/9FZtQ80kJohhn+zxQmbuVMIB5qKi/10H4/g0aIqQG2+J
 tY6g==
X-Gm-Message-State: AJIora/DgEpaicUTsxUUHnqJiOyGU3p7AUXJSZ/iLxLj3O8cexBgM1Ws
 3GCVVzFXQULX0ALr0Fco1FIxDA==
X-Google-Smtp-Source: AGRyM1u5OdMTiQHMsYbR8Sz8+jjBJ+VmTd5ITZeq3D9F/B7nzhALp3BTjgAGJQedAcwTSL9y2KdMqw==
X-Received: by 2002:a7b:c04d:0:b0:3a3:269b:1219 with SMTP id
 u13-20020a7bc04d000000b003a3269b1219mr15975671wmc.106.1658603331053; 
 Sat, 23 Jul 2022 12:08:51 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a05600c420300b003a3200bc788sm12128179wmh.33.2022.07.23.12.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 12:08:50 -0700 (PDT)
Message-ID: <fde8fae8-6c4f-41e8-d13f-a2fdbd7934fe@mind.be>
Date: Sat, 23 Jul 2022 21:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Olivier L'Heureux <olivier.lheureux@mind.be>, buildroot@buildroot.org
References: <20220618225710.8640-1-olivier.lheureux@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220618225710.8640-1-olivier.lheureux@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DXikTl153yxhAJ2uZWxEl4qfk+U3tBFYDU7OonlqcoI=;
 b=G2X9y2vMlAhmW/EReAYwefQ/ulV9uC75PeJmVG+tiuSWqRizdf+M1AjXwZOMXY6BsO
 gYoWLCRpPEDFVe1RypI3sx+ObH29LaqMarIBbTXd2cK/hDh3O6F1kJ2LS6/ySXK7Sq+t
 3knfzcTpEvIPbgLYLRAptm/tj+FHXQLzn/sSKe5ckAtrbfnH9gTB3OILaFsCOJz9dTpM
 zUlS/Hq/Sq73vcLzEheO22zXVQjAlL6QLSWRpHe2NgCRKQEn+hIHEnTeQDvy66v4kywO
 DjPOpOCx/PpnKpvXZAkLOAm7GA+AJpaSypDiqbyy/Aci3bNcbMiRTD6DtCSFQQuDrcSd
 90MA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G2X9y2vM
Subject: Re: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: bump version
 to 2.7
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/06/2022 00:57, Olivier L'Heureux wrote:
> Bumped the default version of the "arm-trusted-firmware" (a.k.a. TF-A)
> from 2.5 to 2.7: updated the config and the tarball checksum.
> Work-around CVE-2022-23960.

  I'm not sure what this means... Do you mean that this version fixes a security 
issue?

> 
> Updated the "qemu_aarch64_sbsa_defconfig" accordingly: it was using an
> "arm-trusted-firmware" v2.4, it nows selects version 2.7.
> 
> Updated the license checksum because the license file changed
> slightly: it mentions an additional file ("irq.h") released under a
> dual GPL or MIT license.
> 
> Tested with the "qemu_aarch64_sbsa_defconfig" and QEMU: it boots
> without new warning or error message.
> 
> Release notes:
> <https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html>
> 
> Signed-off-by: Olivier L'Heureux <olivier.lheureux@mind.be>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/arm-trusted-firmware/Config.in                 | 4 ++--
>   boot/arm-trusted-firmware/arm-trusted-firmware.hash | 4 ++--
>   configs/qemu_aarch64_sbsa_defconfig                 | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index b1fc03e10b..f61b62b27e 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -15,7 +15,7 @@ choice
>   	  Select the specific ATF version you want to use
>   
>   config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
> -	bool "v2.5"
> +	bool "v2.7"
>   
>   config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
>   	bool "Custom version"
> @@ -43,7 +43,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
>   
>   config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
>   	string
> -	default "v2.5"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
> +	default "v2.7"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
>   	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
>   	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
>   				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> index 80402ec374..d931610dc4 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  d12a824afcc5cb90d005f9820f3274f1319cef1bb282e40a6a190b75900206d3  arm-trusted-firmware-v2.5.tar.gz
> -sha256  0171b0795501ee90634fbc4a7835e2fb215d9423daf1cf5b0d0682adde12c597  docs/license.rst
> +sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
> +sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst
> diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
> index 2d6134e78c..0d4e8b2c29 100644
> --- a/configs/qemu_aarch64_sbsa_defconfig
> +++ b/configs/qemu_aarch64_sbsa_defconfig
> @@ -39,7 +39,7 @@ BR2_TARGET_GRUB2_ARM64_EFI=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.7"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
