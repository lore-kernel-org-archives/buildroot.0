Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493A0C54E67
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEE64605F0;
	Sat, 23 Mar 2024 20:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXww4lU8OAl7; Sat, 23 Mar 2024 20:28:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C15960606
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C15960606;
	Sat, 23 Mar 2024 20:28:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93EF31BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 801DA404F5
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8oOjSrFzPij for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:28:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA7B4404A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA7B4404A4
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA7B4404A4
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:28:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33ed5b6bf59so2097540f8f.0
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711225726; x=1711830526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F+zvNSGjGVA5p/NmKEZI1kG9bf39vdIj4UkEpxBrGik=;
 b=CtNuupL4FMMs2qP3Tzq3mhRNIEVmJ0NORXdRntpACxEeRfoxUs+P5TtEFbnq8ZAlGS
 F/XYU9PQdhO1nWbSJLRHYzquPTsorYsDIzqgqwaPAplZo9q4dmduHI7b+FbasfKy/cDn
 By4wd8tt+oW3b70tNgGPpgvLq7rucKZkZ0d0AFK6lWFBoiKEXvTmddncn3275ZDRk987
 QjGplKjvZ3y+EZ7aIraffSOXArMU+n1KZsj9j+wwmeptf2Kg2s2hhxOHr8CEOwSa/jFy
 06vk1wQ1t+wS7uoBTO0o3yfOzkalzgkcgGV+fTvh/CPmsn2ajInQwY7YvJvRp2lbC69I
 3XzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTNXgfZ0CMGOdzFOpzXDYZJwmuFm9u+6r4DUidvg9FxOEqXcsmy+iOWwdAdaJr9g1mGGTsyWJJaqbvOjG05AcprZSOWAFEpA==
X-Gm-Message-State: AOJu0YyV6l33qk5vh/T95cc+487DPwlFFFoajl2448phUKEJmnvg0mfs
 HkcNtTKLGO5a58WhkC8joddI75jMMeLIYZHWlXa5OrUmVKvVEEM3Gq2Z/E6+uK8=
X-Google-Smtp-Source: AGHT+IFfWqJWa4UKs3WqncZ0mdxlNOmULDzUYzFZc9cAOm8YDpHjdwjAlZdeDu7bT2F1HHsd73VFiA==
X-Received: by 2002:a05:600c:458c:b0:414:a36:f17e with SMTP id
 r12-20020a05600c458c00b004140a36f17emr2081088wmo.33.1711225725795; 
 Sat, 23 Mar 2024 13:28:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b0041413aefeb9sm3350153wmq.48.2024.03.23.13.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Mar 2024 13:28:45 -0700 (PDT)
Message-ID: <24173878-4e80-4757-a056-1729b286c623@mind.be>
Date: Sat, 23 Mar 2024 21:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20240323163653.1299442-1-fancp2007@gmail.com>
In-Reply-To: <20240323163653.1299442-1-fancp2007@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711225726; x=1711830526; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+zvNSGjGVA5p/NmKEZI1kG9bf39vdIj4UkEpxBrGik=;
 b=Pkod9NuBo2OpeMeEDPaT4GSzLHIuIpdiHc7t7RQRdFS9CJpw5y5KlN3TNOyl3eAUoK
 yTabDNvdOIyFd6RWickOhuaHXIvuA9MutviyOI09Bs4dRJgQ1X1EfR0kd8VbkWaKnp2z
 JsfKLRp2nUgPo/LgfSlN25HMUNh35rITl8xc+tH0+nLU9aWHtN15Pv4wnonh4iGZgGO9
 +AHGWuoO9GL0NOFckGsnw4ts5eE/YqJvw4d7cML2sRcxYiLUe8MRbTe07KJz1QByq+3/
 adXdo9DuTkJwuucw0mw7cYhmjJYg5tkc0flqLzfwaiYhGa31y8Vv42cR9xSR5lTecvqf
 jh/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Pkod9NuB
Subject: Re: [Buildroot] [PATCH] configs/beaglebone_defconfig: bump Linux to
 6.1.80-ti-r34 and U-Boot to 2024.01
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
Cc: Lothar Felten <lothar.felten@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/03/2024 17:36, Scott Fan wrote:
> Tested on beaglebone black.
> 
> [1] https://github.com/beagleboard/linux/releases/tag/6.1.80-ti-r34
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/beaglebone_defconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index e2d67019b1..064f283489 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -17,7 +17,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.46-ti-r13)/linux-6.1.46-ti-r13.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.80-ti-r34)/linux-6.1.80-ti-r34.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
> @@ -31,7 +31,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
