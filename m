Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7DDC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D4C44056A;
	Sun, 24 Mar 2024 17:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3pbYVX4kfqJM; Sun, 24 Mar 2024 17:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AFAE4026A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AFAE4026A;
	Sun, 24 Mar 2024 17:04:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3966B1BF40A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C1D781826
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKhrD6p2m5Br for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:04:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5475681C56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5475681C56
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5475681C56
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:04:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso26509715e9.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 10:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711299859; x=1711904659;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qT2tiIyWosAnCDo9FTQxhSniKymlRg1wE1U3ugKbj98=;
 b=QYkfpaPoaOzqRxCUDc83UdtSi2OYzqcz0nOzZPwVGtJ+5M/2mcVyqCNhRe8oTnTByL
 Zy5rSbATUbePfkWH2DOjArwqJpUGBlNRABPlpajIhOmdAz9/pVo45OHtQsgljDsRpR8T
 5CBiNgZ3DJaLUqrXLxICyJb3eh61TQZwFFcQd1mGGSWQn2ct/P3BFAR6Ze8tBMrzwrmv
 bHkWFCT9gJEpooLNQ9ODZifzGbEv+0bMcZeoJlYI4V6Vs3ZgK5jCHZQFh9AfS5PoAWK8
 ChuqAxgAiktNS/qm6uNDmPW0wsd0oKnA85yCtIw9EpxxomT7exSkhavvmDh3JyPXeaAo
 Ey9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEu+0SnmR7fE99CgslrPhY2uy+NEYwhmmhKqY/IOnr/u2CqOy+6Ooe8PEv3n+naG2ish9NLtFFwvAyDLrtcOqecZHnaM4pTA==
X-Gm-Message-State: AOJu0YyY7QJd/3uTEJEDQ05CMvzIvvw2y8n480LwV04J5mLlIdSeh28P
 9IgSNIOkz5a4ZP5dNvW4Xpr/vAadPKED+bN7uvmaMnTS+v+gEoBIsMZN7AvbfjMpDNCsGGMbIcr
 n
X-Google-Smtp-Source: AGHT+IFzYXOXQD/u11HEzZOzazALe0h37TyxgJeSH4buopP5ewoA05pFHkmYtoAitsFpJIADd6MQ+Q==
X-Received: by 2002:a05:600c:1f84:b0:414:37f:2798 with SMTP id
 je4-20020a05600c1f8400b00414037f2798mr3516772wmb.6.1711299859333; 
 Sun, 24 Mar 2024 10:04:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b0041469869d11sm5705284wms.47.2024.03.24.10.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 10:04:19 -0700 (PDT)
Message-ID: <d4913294-7a90-43c1-a66a-4c6f3b70b6bb@mind.be>
Date: Sun, 24 Mar 2024 18:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>,
 buildroot@buildroot.org
References: <20240319122344.3107639-1-javad.rahimipetroudi@mind.be>
 <20240319122344.3107639-2-javad.rahimipetroudi@mind.be>
In-Reply-To: <20240319122344.3107639-2-javad.rahimipetroudi@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711299859; x=1711904659; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qT2tiIyWosAnCDo9FTQxhSniKymlRg1wE1U3ugKbj98=;
 b=cvmQcLDEnYSW2Bf/h/R+XqoYZcxKc4dNIYDqhhURqDmv+kROQFFmp1x2zUZHiTr8g7
 KvtvCSrE+EAMO/ADRffuKKfeu5be/5G5LKcmxzJik+pR63HofNm4dkPsNZ6eCaBcDLDE
 uedqntytKs1TcWAN/5F9jcxAfGUUPYLgj1bL+gRj7QbiO7+DfORogj/rrlKm/G9Fkw6D
 uW8x5HobeVuOAKIXbxCrG2IKMGazkjsPS4TVcWLGRAlhouX/zhkwWA+ZOYiBXgNRO351
 Qi3XR2vXD1kFXw6M5OLvWBgW2OmyCbkkD8etPYTEswmremhP8U5IuhGcXsngQ5opR0L5
 LxZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cvmQcLDE
Subject: Re: [Buildroot] [PATCH v4 2/3] configs/avenger96_defconfig: bump
 Linux version to 6.6.22 LTS
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/03/2024 13:23, Javad Rahimipetroudi wrote:
> This patch upgrades Kernel version to 6.6.22 LTS on avenger96 board.
> Beside that, In accordance with the kernel 6.5rc1 commit
> 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
> the device tree path also has been modified to point the device tree in
> the proper location.
> 
> As another change, due to commit 3108eb2e8aa7
> ("mmc: mmci: Set PROBE_PREFER_ASYNCHRONOUS"), the order of SD card and
> eMMC probing has swapped. The SD card is now mmcblk0 instead of
> mmcblk1. Thus, the default root append (mmcblk1p4) in 'extlinux.conf'
> file in the overlay directory of the board is changed, otherwise the
> rootfs was not possible to be detected.
> 
> Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v3 -> v4:
>    - Upgrade Linux version (suggested by Arnout)
>    - Modify commit message (suggested by Arnout)
>    - Modift commit title
> Changes v2 -> v3:
>    - Update the commit to document the reason of changes (suggested by
>      Peter)
> Changes v1 -> v2:
>    - Remove uboot changes from Linux patch to Uboot (suggested by Peter)
>    - Fix the kernel header version for the toolchain.(suggested by Peter)
> 
> ---
>   board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf | 2 +-
>   configs/avenger96_defconfig                               | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
> index 5d506b3dae..7d6d7f8a44 100644
> --- a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
> +++ b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
> @@ -1,4 +1,4 @@
>   label stm32mp157c-dk2-buildroot
>     kernel /boot/zImage
>     devicetree /boot/stm32mp157a-dhcor-avenger96.dtb
> -  append root=/dev/mmcblk1p4 rootwait
> +  append root=/dev/mmcblk0p4 rootwait
> diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
> index 82702bcfc7..218955fc02 100644
> --- a/configs/avenger96_defconfig
> +++ b/configs/avenger96_defconfig
> @@ -3,7 +3,7 @@ BR2_arm=y
>   BR2_cortex_a7=y
>   
>   # Linux headers same as kernel, a 5.8 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # System configuration
>   BR2_GLOBAL_PATCH_DIR="board/arrow/avenger96/patches"
> @@ -13,10 +13,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-im
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.22"
>   BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dhcor-avenger96"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp157a-dhcor-avenger96"
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
