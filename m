Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD35FC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 20:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 795D181758;
	Wed,  5 Jun 2024 20:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izr0nNIhROMz; Wed,  5 Jun 2024 20:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C94281761
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C94281761;
	Wed,  5 Jun 2024 20:54:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1A401BF5A9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE3E6405D5
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ml9dZIE5II3m for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 20:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F56F4042C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F56F4042C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F56F4042C
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 20:54:22 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4215b0c4b7dso3116075e9.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 13:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717620860; x=1718225660;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ftp2a4pY51QercCHVdlwnJItV13gYatSTnLzWV2vUhw=;
 b=UY2U3CFHE6wIhz0L0DmHblWgK15acqUchLL4uKwIt7EJGlErEjECO2aHWk4kpwvQKy
 Fy/ljovmOMF0ITJpaSLMcZ/I3lJyZBZ+/pmO+5CEin2JQjsBNmcY1UfpTm1WV7ogWd37
 rnrIHkPBqfgMNsf8qsMRG8q/anGL11uQDWLzXdZv8J3z94TkdvdBUVwStza4skKnTLmB
 1IY97t6iW/kWU/h+7cY9ERpYMaStckuOBf1RxXZYgwd1r1XqMjqz9hIqfyrojqVBqYhy
 XpLRoWLd5Kww+xL+r79kQHC0RxmFDjeWAv2Y57Yd0bu0FPaHaGjXDso6nrUDq7W3x44c
 BSGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoWIkjkMs7w1AX+i5/rdGiJBOB+UPcenzOdsnV9zB62UBDxrtxX+HmvCO+RNAPRlmxoIIprqoO/Ov2UXkkMpvkoGOCmROoBg==
X-Gm-Message-State: AOJu0YzPSYlUfP1o3M2HnJxV2Gl9iQyCsTBZ/pPihDzHdzUHNSt97inW
 j/7j2T/zOBEL3HbFHTLJk2w/SBS6Ze7JUyyEc1hIwHBnAA0amuRugBrUufR4/Si6AXOFn35UxoP
 x
X-Google-Smtp-Source: AGHT+IEEOVfdxZWedz4Jehxa81rMbrt+O8T0+wnal1yCB9+Ot3RXFzsedF5FvGj9e/4KPXedeIYeBQ==
X-Received: by 2002:a05:600c:19c9:b0:421:52ce:6878 with SMTP id
 5b1f17b1804b1-4215632d091mr29213685e9.29.1717620860007; 
 Wed, 05 Jun 2024 13:54:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c19d5besm207935e9.7.2024.06.05.13.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 13:54:19 -0700 (PDT)
Message-ID: <fda26aa0-47a4-4b96-a748-b1d983042afd@mind.be>
Date: Wed, 5 Jun 2024 22:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240605095456.2994962-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240605095456.2994962-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717620860; x=1718225660; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ftp2a4pY51QercCHVdlwnJItV13gYatSTnLzWV2vUhw=;
 b=VD37c8sM5OpAXqolesksEyZNlMo3GhRhp0vAgQssryLB7T9ccAuRciN5yjUrZRrPXb
 vRLh8EI6m6EeZlkCnIVw7/Nanp4A+54h1bMIQ5Qdstz/VuUrFVj/XVPKCmt31aEKRrL5
 zGTyJbyYSOLZ2e9sWMJU9ssjHjyHlcErnJ6Nh/fJpOl7Uo6R7IHwbGbfDsDcvnJaDkXj
 vOwrDP8wyJj5I8q+jm5+B9phR9Bg444XN2QoG9g8AGHd4r9seUXq2Mz5FbuqYtAbqDLY
 LjjEiDG/XUXC8g0qXXjXb/bm6V/cGg3udnkgc08opd2kOVRaqwWjvvmX/teTAfIg1Vrx
 C/7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VD37c8sM
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: add
 hashes
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2024 11:54, Dario Binacchi wrote:
> The patch adds .hash files for Arm trusted firmware, Linux, Linux headers
> and U-Boot and then enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we
> can now drop the defconfig from .checkpackageignore.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                                             | 2 --
>   .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
>   .../imx8mn-bsh-smm-s2/patches/linux-headers/linux-headers.hash  | 1 +
>   board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash     | 2 ++
>   board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash     | 2 ++
>   configs/imx8mn_bsh_smm_s2_defconfig                             | 2 ++
>   configs/imx8mn_bsh_smm_s2_pro_defconfig                         | 2 ++
>   7 files changed, 11 insertions(+), 2 deletions(-)
>   create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>   create mode 120000 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux-headers/linux-headers.hash
>   create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
>   create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 8825d644ab5f..6a0276759e10 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -196,8 +196,6 @@ configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
>   configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
>   configs/imx7d-sdb_defconfig lib_defconfig.ForceCheckHash
>   configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
> -configs/imx8mn_bsh_smm_s2_defconfig lib_defconfig.ForceCheckHash
> -configs/imx8mn_bsh_smm_s2_pro_defconfig lib_defconfig.ForceCheckHash
>   configs/imx8mpico_defconfig lib_defconfig.ForceCheckHash
>   configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
>   configs/imxrt1050-evk_defconfig lib_defconfig.ForceCheckHash
> diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> new file mode 100644
> index 000000000000..80e592dab606
> --- /dev/null
> +++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  fc4cdac7c08fc398b6d4b705285dc13ac2d2b30a7449c6f07e9ccd81207241df  arm-trusted-firmware-v2.5.tar.gz
> diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux-headers/linux-headers.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux-headers/linux-headers.hash
> new file mode 120000
> index 000000000000..5808d92afe89
> --- /dev/null
> +++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux-headers/linux-headers.hash
> @@ -0,0 +1 @@
> +../linux/linux.hash
> \ No newline at end of file
> diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
> new file mode 100644
> index 000000000000..b017ef2a893e
> --- /dev/null
> +++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  3e4d8e561da5703a205ae8d7b2bed6c5c64fc4299eebcbfd20481e63b57d5ee3  linux-6.1.6.tar.xz
> diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
> new file mode 100644
> index 000000000000..7cef5b688ec3
> --- /dev/null
> +++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
> diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
> index 8b2b74395efc..841512ed1a16 100644
> --- a/configs/imx8mn_bsh_smm_s2_defconfig
> +++ b/configs/imx8mn_bsh_smm_s2_defconfig
> @@ -1,5 +1,7 @@
>   BR2_aarch64=y
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>   BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
>   BR2_LINUX_KERNEL=y
> diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
> index e9ff244a3555..b4553ceb5214 100644
> --- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
> +++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
> @@ -1,5 +1,7 @@
>   BR2_aarch64=y
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>   BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
