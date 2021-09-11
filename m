Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE63C433FE
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:14:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A7C61206
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11A7C61206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B17DF80EAD;
	Sat, 11 Sep 2021 16:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKO3YKfE6fLB; Sat, 11 Sep 2021 16:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE37180F20;
	Sat, 11 Sep 2021 16:14:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C1431BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C02680F20
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fUy1JFpj8UWs for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:13:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C55280EAD
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:13:56 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id e21so10793569ejz.12
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2NC9AvDRNXSJMIey/SZ/toWIdj96I1PC4YSQYG3rmx0=;
 b=U/Opn8d7qvbwFhrjjZ7LqlIKz6ataP6KkQvFX8ojcVYjefBMhLuyoqAbTB8G7nZomq
 UNNzH3zyT8JsITcm9b5BAcJPzJ8Gf8N8ci1e8CcMhIcZZFNuacU0dBpwX9ThgOMNEw8f
 RE09qHhkrAaCb+wQulQmFBysda6RlkvMKO/usHmZ0e8TtxEz+HTaaQuKDydQBqGLO62s
 nIohlipLAqiQapCB5oFfmK+jWPb2YL7Lz0ttg3X9KF8C8vGQTsnemMpDfNGOM+L5U7uq
 oI/8kOrOr8mMGGqCcAnDRGycGERRxNCsdmc3paIAt7xLkol1gdKdKaC5owzWFO/4Udmv
 /KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2NC9AvDRNXSJMIey/SZ/toWIdj96I1PC4YSQYG3rmx0=;
 b=MjvxveptkB6zy0AjZlpbrIlK1uAcJEpIQ1unXn6Omzvntlqf0Yl5apXJQvwTfIX7y7
 edeM82P0QzFGRgVXtIcPFOGHJ2qM0r4KT5tDToJUtbk4R8mR3685OPZulLeo6ZVJWduL
 eDggUf5KOvXs41QckmNpLmOonyYPZ05mEpRXR2ZgEQSEWGYuviKsaMtuN0PBE3XpS4vg
 r7wY8uIZUkanKM0n/rUUFQl0tTBnevtnnHn13zAz4QfzZ0jpQzrfo8HPSrVtC4IxmLK3
 chBd18Ah1rCmV4rjwDJ1J1CU/zSR8b8wlXzM9z46jLqmOfrkmoHklnlpbUgmfJqHszBv
 sSGg==
X-Gm-Message-State: AOAM531INS4f1cQ8pyQoN0yyI5usDxWiFzN151+tfuy88t0RtLm1kdLb
 LckT8Hr72gka8XBaduF0nMXlDIxz5ufgRA==
X-Google-Smtp-Source: ABdhPJzy9q9+mM2IRjGXw4VMv6r2vvI4yTxjCKTUa5XXewsscnnY2hwda9HRr/vV2Q1jVgGzTW8uCQ==
X-Received: by 2002:a17:907:b06:: with SMTP id
 h6mr3449363ejl.130.1631376835077; 
 Sat, 11 Sep 2021 09:13:55 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 4sm1129639edw.45.2021.09.11.09.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 09:13:54 -0700 (PDT)
To: Simon Doppler <dopsi@dopsi.ch>, buildroot@buildroot.org
References: <20210831072031.18391-1-dopsi@dopsi.ch>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <7465b57b-cbce-373a-c101-3b57617d30c4@mind.be>
Date: Sat, 11 Sep 2021 18:13:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831072031.18391-1-dopsi@dopsi.ch>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v4] configs/stm32mp157c_odyssey: new
 defconfig
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 31/08/2021 09:21, Simon Doppler wrote:
> STM32MP157C-Odyssey reference:
> https://wiki.seeedstudio.com/ODYSSEY-STM32MP157C/
> 
> Signed-off-by: Simon Doppler <dopsi@dopsi.ch>

 Applied to master, thanks.

 Still a few comments though.

[snip]
> diff --git a/board/seeed/stm32mp157c-odyssey/linux.config b/board/seeed/stm32mp157c-odyssey/linux.config

 We generally prefer to start from an in-tree config and just apply a config
fragment to it. That doesn't just reduce the size of the file in Buildroot, but
more importantly makes updating the kernel easier because it generally better
reflects changes (e.g., extra errata that should be enabled).

 I haven't tried to create a fragment myself though so I kept this as is.

[snip]
> diff --git a/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-ARM-dts-stm32-fix-stm32mp157c-odyssey-card-detect.patch b/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-ARM-dts-stm32-fix-stm32mp157c-odyssey-card-detect.patch
> new file mode 100644
> index 0000000000..ab2dc5dea8
> --- /dev/null
> +++ b/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-ARM-dts-stm32-fix-stm32mp157c-odyssey-card-detect.patch

 There's no need to put it in the version-specific directory. In fact, it's
better not to: when the kernel is updated, we want the patch to still be applied
(which will likely fail due to a conflict or because it was already applied
upstream). That's better than the patch being forgotten.

[snip]
> +++ b/board/seeed/stm32mp157c-odyssey/readme.txt
> @@ -0,0 +1,38 @@
> +STM32MP157C-Odyssey
> +
> +Intro
> +=====
> +
> +This configuration supports the STM32MP157C-Odyssey platform:
> +
> +  https://wiki.seeedstudio.com/ODYSSEY-STM32MP157C/
> +
> +How to build
> +============
> +
> + $ make stm32mp157c_odyssey_defconfig
> + $ make
> +
> +How to write the microSD card
> +=============================
> +
> +Once the build process is finished you will have an image called
> +"sdcard.img" in the output/images/ directory.
> +
> +Copy the bootable "sdcard.img" onto an microSD card with "dd":
> +
> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> +
> +Boot the board
> +==============
> +
> + (1) Insert the microSD card in connector J21.
> +
> + (2) Connect to the UART connector J24 (located next the the DC jack
> +     J24 and the battery connector J20) and run your serial communication
> +     program on /dev/ttyACM0.
> +
> + (3) Plug a USB-C cable in J6 or a center-positive 12V jack into J17
> +     to power-up the board.
> +
> + (4) The system will start, with the console on UART.

 Very nice readme! I'll use it as an example if I need to show someone how to
write a readme for a board.

> diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
> new file mode 100644
> index 0000000000..078ff74923
> --- /dev/null
> +++ b/configs/stm32mp157c_odyssey_defconfig
> @@ -0,0 +1,31 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_GLOBAL_PATCH_DIR="board/seeed/stm32mp157c-odyssey/patches"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_ROOTFS_OVERLAY="board/seeed/stm32mp157c-odyssey/overlay/"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/seeed/stm32mp157c-odyssey/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.1"

 It would have been nice to update this to a current stable, e.g. 5.10.63 or 5.14.2.

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/seeed/stm32mp157c-odyssey/linux.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-odyssey"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"

 The default 60M is ample for this minimal configuration (it's actually less
than 15MB), so I've kept the default.

 Regards,
 Arnout

> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-odyssey.dtb"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_STM32=y
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-odyssey"
> +BR2_PACKAGE_HOST_GENIMAGE=y
> --
> 2.30.2
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
