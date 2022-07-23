Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEDCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9C96418D4;
	Sat, 23 Jul 2022 12:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9C96418D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjsUXIKIXwEV; Sat, 23 Jul 2022 12:49:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A883F418BE;
	Sat, 23 Jul 2022 12:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A883F418BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE301BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3577640AD1
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3577640AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03NMKjFYKsSr for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:49:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FCFE401A4
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FCFE401A4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:49:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u5so9824955wrm.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=P9Y6tDPjpulfXX5r3RpYDU45QgNz93GYsYaPWIu2ngE=;
 b=gpFKvRCjXjXa88ek2KOfUkLi4xsB3Vo2/fpC17CMrP4mIq+UwLmiwu4UR932822nqG
 ovXVkJxJSvTbdMNoySlZtHJF7kgFYCTliZtlmsCnfXnXp4xVBCNHya+Dmyn2lJLg5OPS
 GJn5VuIyGmfcU5Djaji+8zOQqfjpa0HuxPKnMshn0YbWnCH/fh0MHemITSHIMWQhzOit
 VrExrurOmvjyv6SElfmndR9kXac9SUCoYGsWiP1PglavXE90VOHsyc/YzllckA0hQgv3
 BYwV4TsuLmKcT+9p8ZH17laE9fMKmXwj48c4siYj+shA9AV2qxsx4jTYdzhHHHL4tGk8
 PWiQ==
X-Gm-Message-State: AJIora/6lN5FQuMk5asnLjpV9coVYdJBVi5g6hk+++ixAABKoCwZQU9t
 9CkzBtT7VaWQ2kB2NvU2ublQR29pRzXF+g==
X-Google-Smtp-Source: AGRyM1v9sX7DyvYrCd5S8lwYSzwwE23TCogOtvBUzXLXuo1z94i4GtDAEgFCGqsLruxQi66J+EmbFQ==
X-Received: by 2002:a5d:452d:0:b0:21e:688b:52c2 with SMTP id
 j13-20020a5d452d000000b0021e688b52c2mr2802864wra.338.1658580555444; 
 Sat, 23 Jul 2022 05:49:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a5d4fc9000000b0021e6277bc50sm4608375wrw.36.2022.07.23.05.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 05:49:15 -0700 (PDT)
Message-ID: <dccb4551-2cd4-50b8-7823-91ff3f1b9899@mind.be>
Date: Sat, 23 Jul 2022 14:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
References: <20220722085246.645440-1-etienne.carriere@linaro.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220722085246.645440-1-etienne.carriere@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=P9Y6tDPjpulfXX5r3RpYDU45QgNz93GYsYaPWIu2ngE=;
 b=UqRbf99lli6gflLJMeT16C6fiNfsO/yRIDJ+q3BDA8VvQM+nTRM6oMACIAwH9uxnLZ
 ygMVKgxM3uCNMrrAr2JLUw9VKRZq5dLH43jO6qgFt1iqoPblNrav8t/2exqbFFdiWipu
 3b2jbSP3QhuodEABMiAqzkvkKvJKbSLh6fgZTygozqUVRY7edxRjSDlvvQyuxC8DixmY
 RLE91OO+jN5CA0Y66X9iStni0ZolnjJ+r0az2hxRjsGk2qKbkQIouF6Pwnpc0KWtJR2i
 TYjuFgjZ4j7z0ylUil8Fu7iYRNSFiKmRlPuSKEr+bL89ZzFjVjOudaLC0DJ2/XqLTOM8
 rjdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UqRbf99l
Subject: Re: [Buildroot] [PATCH] configs: qemu_arm_vexpress_tz: bump tf-a
 and u-boot versions
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/07/2022 10:52, Etienne Carriere wrote:
> Bumps TF-A to version v2.7 and U-Boot to version v2022.04 for
> Qemu vexpress/trustzone board config.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/qemu_arm_vexpress_tz_defconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
> index f8956f1c05..576c441154 100644
> --- a/configs/qemu_arm_vexpress_tz_defconfig
> +++ b/configs/qemu_arm_vexpress_tz_defconfig
> @@ -29,7 +29,7 @@ BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragmen
>   # TF-A for booting OP-TEE secure and uboot/linux non secure
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.4"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
> @@ -56,7 +56,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
>   BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/u-boot.config"
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
