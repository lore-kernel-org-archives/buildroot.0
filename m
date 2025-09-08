Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BBDCAC588
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DFA861C44;
	Mon,  8 Sep 2025 10:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rWvWPkZGQFP; Mon,  8 Sep 2025 10:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1896C61BF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1896C61BF1;
	Mon,  8 Sep 2025 10:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4F9A1D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B68661BF1
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cMbYVJO-NS9 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:55:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E65D61514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E65D61514
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E65D61514
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45de6ab6ce7so4783365e9.1
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328947; x=1757933747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7echObA2STn4xUIGuIdHwW8JVOrI/+9/E/ZmkbEf+IY=;
 b=TdkquzbYZmBNtrFCYtSLBOtVicM4HXKh35RaI6sg7fgs21Rdl7YjSYMETFPZt+ASc8
 BHjJaARgyvez5eXo/4wAJHBzFIO8H5yMfSqDWrDJcsXby7TacuXLywm309sxGakLjvhB
 nBmiT8CwFB6sB1srTYGGqmr97XjSgL2oy4EkiaxQ+zZntnyNfD3q4A9D/VaCSwfeowoC
 tVFDOMdBqZPkG/wV45j7rukprIpkYAYmbLqM5qyn3ihJyAEJyydWHlVHMc85EDO2q77T
 HJMPnARDYhVzQe02uETrNKFO+Jx3UAAhXuKNcLtpZHIOTtuz7l56tB5aZh9rSgsqPTy7
 cmeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcdr/FcIF7cP6N4X6erU6j6NhgrGmEyxJVS4gAXvut92neP1sVr5KzM8ftnDHW5h2eGZs9KsX3RyU=@buildroot.org
X-Gm-Message-State: AOJu0Yxxlk1aY/m1jWx7sIEhw5u6Vuwgd6qyEw2rIlPgqxeVa4WgQOCR
 83rkRKw6aAkOwFs32NWTGywncNRV3qjxEvzEKmPrlH5NZt4zGpObbLO/CmJy2303cNc=
X-Gm-Gg: ASbGncuIUJ52AzY3woJ2VINsY9WHUMsScyClThlxQNdQ+EJc4wVAfudra/J4TWbVyRu
 Z43blmqmQ2gOnSCx9jdTTcJ/1YMPD/1uwvlAdSj1gEtGDnZHDa7P3ADm3PBWbJqiXh0G8bg3q5a
 +7F9jKKAVmP4D2xTwCS5/Z0Z5dRAwKL61fkmXGXN0wujvbqrBcYCwBvizhBwVYBC/e5M13e/7jD
 VV9xSFglRNJdrKqm75u7ekLJiFgRzNnxff/Lbmplsh1WE55EPmfBbJkHiKjBtntPhp1j1GnWxk1
 dr0n0ZT18z/65Ff1M19yPTQq/IVAC04i8doiWGgk+e2mzAVQlbD4lLj1SxGf66p/guDkqzEJ76A
 Ps4RY4Fo8g/WRWuruAqmjmE/8uMrBWIT0Is8MeT5NDY/1MQioe7PXga0CATTNI5ilKiUfppujkX
 lCAYdah1CUpKVtZINmO5slytW5
X-Google-Smtp-Source: AGHT+IEh+DJT0iNtmjno5KPaOf1mFh8QI8EYCO9UdfDdtfpG0cAE3w7Rl3oiQWsORjBvRqC9wnmEWQ==
X-Received: by 2002:a05:600c:1993:b0:45c:b5eb:b0c6 with SMTP id
 5b1f17b1804b1-45ddde80fd3mr66155535e9.5.1757328947374; 
 Mon, 08 Sep 2025 03:55:47 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dcfca0aefsm94906865e9.1.2025.09.08.03.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:55:47 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:55:46 +0200
Message-Id: <20250908105546.681669-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250819075441.3288414-1-thomas.petazzoni@bootlin.com>
References: <20250819075441.3288414-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328947; x=1757933747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7echObA2STn4xUIGuIdHwW8JVOrI/+9/E/ZmkbEf+IY=;
 b=X7jFs+Vov+9UHi8eNREcoAZOEZ2dbZyGv9b2sgPHbLbdMf+vfhK/07QWJUSGfS6jUp
 96seOVPJYS60a6ijfwT7yRRkCUTdJjRuu4FhFrhT16OlDUVHMDgNgdzn4U9ztisrdz62
 RmYE3SWukyUPnJjfBw4zc0u+Gvi+Xh0RKQWL8lb0l1+brfyXkk8WXoSh/uzgGnH+p8cW
 boxuMykcbDEUKfp89XKkUhUD0PLVxZYxlffz4Q84HdGj218Z9ROgJqyRm5VyvzywgnZt
 yz8CYSBjtYkDM8nKEVhlCWft6IxkELn2qX6fXHJ3wsKNRU67inREC8+VLqPT+rMdGXsK
 2cnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X7jFs+Vo
Subject: Re: [Buildroot] [PATCH] configs/{canaan_kd233,
 sipeed*}: use BR2_LINUX_KENREL_IMAGE_TARGET_NAME
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
> Since commit cb4f11a6964902990ce774ff7144b24a1ffd635c ("linux: handle
> empty BR2_LINUX_KERNEL_IMAGE_TARGET_NAME situation"), we error out if
> BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y but
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME is empty, which is exactly the case
> of the RISC-V configurations being fixed by this commit.
> 
> They define the BR2_LINUX_KERNEL_IMAGE_NAME variable, but not
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME, while BR2_LINUX_KERNEL_IMAGE_NAME
> will automatically default to BR2_LINUX_KERNEL_IMAGE_TARGET_NAME if
> BR2_LINUX_KERNEL_IMAGE_NAME is not provided.
> 
> It probably used to work because specifying an empty make target was
> generating the right images, and they did have the name specified in
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME. But with the additional check
> added in cb4f11a6964902990ce774ff7144b24a1ffd635c this scenario is no
> longer supported.
> 
> Fixes:
> 
>               canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273088
>            sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771237
>     sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771342
>           sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771387
>    sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771472
>             sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771505
>      sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771581
>           sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771663
>    sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771885
> 
> Cc: Damien Le Moal <dlemoal@kernel.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  configs/canaan_kd233_defconfig            | 2 +-
>  configs/sipeed_maix_bit_defconfig         | 2 +-
>  configs/sipeed_maix_bit_sdcard_defconfig  | 2 +-
>  configs/sipeed_maix_dock_defconfig        | 2 +-
>  configs/sipeed_maix_dock_sdcard_defconfig | 2 +-
>  configs/sipeed_maix_go_defconfig          | 2 +-
>  configs/sipeed_maix_go_sdcard_defconfig   | 2 +-
>  configs/sipeed_maixduino_defconfig        | 2 +-
>  configs/sipeed_maixduino_sdcard_defconfig | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
> index 491a834477..47d0b55e90 100644
> --- a/configs/canaan_kd233_defconfig
> +++ b/configs/canaan_kd233_defconfig
> @@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/kd233/linux-cpio.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
>  BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
> index 00c6a993d8..c3fc9192c6 100644
> --- a/configs/sipeed_maix_bit_defconfig
> +++ b/configs/sipeed_maix_bit_defconfig
> @@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-cpio.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
>  BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
> index 5127bfeae6..4ae824a26b 100644
> --- a/configs/sipeed_maix_bit_sdcard_defconfig
> +++ b/configs/sipeed_maix_bit_sdcard_defconfig
> @@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_bit"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
> diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
> index d97e185311..73372056a3 100644
> --- a/configs/sipeed_maix_dock_defconfig
> +++ b/configs/sipeed_maix_dock_defconfig
> @@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-dock/linux-cpio.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
>  BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
> index a755872cfd..66317d968c 100644
> --- a/configs/sipeed_maix_dock_sdcard_defconfig
> +++ b/configs/sipeed_maix_dock_sdcard_defconfig
> @@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_dock"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
> diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
> index a4d976353f..bb64dccdf4 100644
> --- a/configs/sipeed_maix_go_defconfig
> +++ b/configs/sipeed_maix_go_defconfig
> @@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-go/linux-cpio.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
>  BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
> index 6067fea785..a3076c3e12 100644
> --- a/configs/sipeed_maix_go_sdcard_defconfig
> +++ b/configs/sipeed_maix_go_sdcard_defconfig
> @@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_go"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
> diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
> index 37c6eb4582..27bf958c76 100644
> --- a/configs/sipeed_maixduino_defconfig
> +++ b/configs/sipeed_maixduino_defconfig
> @@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maixduino/linux-cpio.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
>  BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
> index 0a460f15d3..1b6db4f8a4 100644
> --- a/configs/sipeed_maixduino_sdcard_defconfig
> +++ b/configs/sipeed_maixduino_sdcard_defconfig
> @@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maixduino"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
