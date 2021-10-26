Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC41C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA19C60F39
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA19C60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 901DD60657;
	Tue, 26 Oct 2021 19:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xRg5kLfapes; Tue, 26 Oct 2021 19:31:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B076607AE;
	Tue, 26 Oct 2021 19:31:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 485131BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3683040130
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2vasrPduACjS for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:31:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B4574011F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:31:41 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r4so868175edi.5
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=G8wP49EFpFbOGL/HWbjZvqBYMkHplpKvfnS1sj0SQ/M=;
 b=NIcGyDe9foEmFvMjGtIm5Rdm5cV1SFaYyLud8+1eCtMRLpxKAadgcMRr8b8co2QLMh
 N0u2a+r/AIiNxeBjYrC6nx9OexDJ2LBtqqNMO1T2RN14yc0AFPMCXD2CuYPCLaZuE6AF
 OCqsqYrzupd1/Dqo/8s7mGhiMCm4s5K1ZPIUWLcxSjqB++55reDGST12PSoNY226Xnk4
 pb3AZtOTnE1Ve/Llm6O5+AKtdrPHWv7V9sRogu39xdi9q8fkIPXnHD5uwhXUkqNStPPC
 aB2eUAJIsGVlSnk4qnLU9SSSne95bp8e2IjUZd/LZn2Sa/R5xWolLXiqVTxDeHTy3MdR
 zsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=G8wP49EFpFbOGL/HWbjZvqBYMkHplpKvfnS1sj0SQ/M=;
 b=GBvqQbvqFdcRqqIo2Jln14T48u6JQqfd9R4pOJQt57RDNkbRGYhpGcRfTYz1NGqufl
 uUEhAufIs33eJU9AzTdpmy8cvXzFfOXQs4bY4HgdXDA1XSNutUF/6aPebr9pGOiTFV/T
 9/fh0EeI8tAVgJceHLPkkY6O3M9jK4MkA28HGQX19olqniUezT6afiZvMe2V9rHAe2zY
 wziCEgeNS3J/HhQo4V6dV1XHfYrCDmeX9cWYp1aPeQGn9td63Y3ew965ovl4hLx52Wer
 EOolEsutVTXnFnzpefMHJRKz+7iFzEutUQ4un6TxQlPjwCaBdw7+tQd5SzlMzo28q+KA
 diiw==
X-Gm-Message-State: AOAM5338Vqcl/T0+cOjc+nxDqEpDRlLf3Fl5SuOt/3JFsPbKqf1MBNW1
 z6QMaDkObJD1nMoCR7DBetLwL4NZ9j6PKQ==
X-Google-Smtp-Source: ABdhPJwxJFNNND7Hq3P/TbXszs6r6tDkiLmJLD6nuNg5emb3mI5yAgc6c5rB2olehr2lfYN11P7c0g==
X-Received: by 2002:a50:fb10:: with SMTP id d16mr36167521edq.378.1635276699361; 
 Tue, 26 Oct 2021 12:31:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s12sm11326318edj.82.2021.10.26.12.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:31:38 -0700 (PDT)
Message-ID: <11d6b992-e485-de97-15c2-a6bfcca42646@mind.be>
Date: Tue, 26 Oct 2021 21:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20211017162839.20278-1-dariobin@libero.it>
 <20211017162839.20278-2-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211017162839.20278-2-dariobin@libero.it>
Subject: Re: [Buildroot] [PATCH 1/2] configs/stm32f469_disco: enable Linux
 DRM support
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/10/2021 18:28, Dario Binacchi wrote:
> The patch [1], which is required for DRM to work properly, has been
> merged into Linux version 5.14-rc3. There's a 5.14.12 now in stable, so
> I took that one.
> 
> After Linux boots, /dev/fb0 will be accessible. You can control the
> brightness of the display after enabling the framebuffer by running the
> following commands:
> 
> ~ # echo 0 0 > /sys/class/graphics/fb0/pan
> ~ # echo 255 >/sys/class/backlight/40016c00.dsi.0/brightness
> 
> The brightness ranges from 0 to 255, as you can see running the
> command:
> 
> ~ # cat /sys/class/backlight/40016c00.dsi.0/max_brightness

  I've added the above text to the readme.txt and applied to master, thanks.

  Regards,
  Arnout

> 
> [1] 24b5b1978cd5 ("clk: stm32f4: fix post divisor setup for I2S/SAI PLLs")
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
>   board/stmicroelectronics/stm32f469-disco/linux.fragment | 8 +++++++-
>   configs/stm32f469_disco_defconfig                       | 4 ++--
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/board/stmicroelectronics/stm32f469-disco/linux.fragment b/board/stmicroelectronics/stm32f469-disco/linux.fragment
> index 90f5e8a8ff..e5d39bf04a 100644
> --- a/board/stmicroelectronics/stm32f469-disco/linux.fragment
> +++ b/board/stmicroelectronics/stm32f469-disco/linux.fragment
> @@ -1 +1,7 @@
> -# CONFIG_XIP_KERNEL is not set
> \ No newline at end of file
> +# CONFIG_XIP_KERNEL is not set
> +CONFIG_DRM=y
> +CONFIG_DRM_STM=y
> +CONFIG_DRM_STM_DSI=y
> +CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
> +CONFIG_FB=y
> +CONFIG_BACKLIGHT_CLASS_DEVICE=y
> diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
> index e538a664e2..438d32150c 100644
> --- a/configs/stm32f469_disco_defconfig
> +++ b/configs/stm32f469_disco_defconfig
> @@ -1,12 +1,12 @@
>   BR2_arm=y
>   BR2_cortex_m4=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.11"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.12"
>   BR2_LINUX_KERNEL_DEFCONFIG="stm32"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux.fragment"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
