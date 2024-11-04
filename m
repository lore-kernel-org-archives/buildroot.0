Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D093D1BDF2
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C322607A1;
	Mon,  4 Nov 2024 21:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1yGUQ2I3GbGj; Mon,  4 Nov 2024 21:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D00DA60750
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D00DA60750;
	Mon,  4 Nov 2024 21:14:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81861B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EE1160750
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIwKiCMREgwV for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C6F960741
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C6F960741
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C6F960741
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:14:31 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d6ff1cbe1so3407241f8f.3
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 13:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730754869; x=1731359669;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Txok5rDNOXwfZ7lt3Y2ORe1A3+uafC1O2ogzY0Di+AU=;
 b=dUOoovK76Ig43H6Fu8EhiBsjAO5LO7QIGlCSW1R2ZCSWL7aswQCWq00GukrZEA4I27
 kx3euMWdR+k9Vk9ojx6n9P8F3HO8EgtjRi9bQTi8dW0qDhJ92Mn2bt5wGYS/fnZ48hYr
 Y6WhO4rBvuNBICn+9Y3lb1SBS0myTry9NhO0HfCO4Vk2u1hftLamo8hMpEIFPJAOCDWd
 DpLLsAcKrPcZTRK1ZHUys3zu8yeTkIQznJjd98K6Y2sxMjA0d9t8ier/kMTYcpZaIufm
 gTFx7VIEUAwt0Yr12nrqKS8r3YX58RJMRgZD6nem3+rmByu0kdvYW2Zpc/18rq3h7gIG
 nWJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCWTWql7gpx3HsFMzUxJP91KNLG2NpDVc3/p/3X8+GG/2BUreqrqdTBBmEkbLx6c7gxv0VuDpC4vE=@buildroot.org
X-Gm-Message-State: AOJu0YxBfQo1yW9WWYe+rR/T3JV855gbSkrijBTRa6N8sSkBwevTOY0w
 UyoeVvv34dCN1QWbiQk6H49b3nQd0fdv4KJAtiJoNaZnbbf9M9rVQqkIRnnASoA=
X-Google-Smtp-Source: AGHT+IGEplLpAGzuRL0Up7jjdveExaDA+I3btyMTDBC+vibLzS6A4jUObGz+YnoFhhRv8GTVVNN36A==
X-Received: by 2002:a5d:64c7:0:b0:37d:4cd6:6f2b with SMTP id
 ffacd0b85a97d-381be7c6d38mr14613398f8f.14.1730754868963; 
 Mon, 04 Nov 2024 13:14:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116b0dasm14262113f8f.102.2024.11.04.13.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 13:14:28 -0800 (PST)
Message-ID: <82c7b07e-cd1c-403b-9f6e-a06802633cdb@mind.be>
Date: Mon, 4 Nov 2024 22:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Marleen Vos <marleen.vos@mind.be>, Sergey Matyukevich
 <geomatsi@gmail.com>, Bartosz Bilas <b.bilas@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
References: <20241031093311.636608-1-dario.binacchi@amarulasolutions.com>
 <20241031093311.636608-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20241031093311.636608-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1730754869; x=1731359669; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Txok5rDNOXwfZ7lt3Y2ORe1A3+uafC1O2ogzY0Di+AU=;
 b=fzoyXk3D0SPPC/Dvfm+GcuHZP3YdQfi46OmuUw0nLAwNdARe3Jel3rDrgwlekKYxBH
 ZvKk4gcN6118gd6WeRSjk8ZWg+b3kiKfApW9/WSx2SJ1tmHeFPmiE9HdzFHKaTPdXT5I
 OZaIAZ1p1CBD3jzqc2HmFF+Qv2PTCeaT8BToywQUsnZZoe2W3IGyYFvNGfY9BYDmeLR4
 lVweEl/pJD0iu9F43/hxj6FBrl3c1QZF77CJGP+OxfKA3oxPHEWaGBuvvh9DXOXdjESe
 li0gkEvyfgortwc3pa1xXPHa6ct4k89sDlvhprG79w6pBaYbOz2Cj4zGbGij1q/QRzAb
 EPmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fzoyXk3D
Subject: Re: [Buildroot] [PATCH v4 2/2] configs/stm32mp157*_dk*: bump TF-A
 to 2.11, Linux to 6.9.12 and U-Boot to 2024.10
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/10/2024 10:33, Dario Binacchi wrote:
> The patch bumps Arm Trusted Firmware (TF-A) to version 2.11 the Linux

  It was my intention to use as much as possible 
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_X_VERSION in defconfigs, with the 
idea that we get LTS updates automatically when that version is updated.

  This was reverted in commit d40b0c9403346ba63dfbd22a518ce50fcd22d34d for 
stm32mp157c_dk2 and then later by you for stm32mp157a_dk1.

  We never really discussed if it was a good idea to use this 
LATEST_LTS_X_VERSION symbol in defconfigs to begin with - but I saw the fact 
that Thomas merged the patch that introduced it as agreement :-)

  That said, even if we stick to an explicit version for defconfigs, I do think 
it's better to choose one which is LTS upstream - so 2.10, not 2.11.

> kernel to version 6.9.12 and U-Boot to version 2024.10.

  For the kernel, I also think we should stick to longterm versions - so we 
never should have updated to 6.9. I think updating to the last release of an EOL 
branch now is pretty pointless for sure...  At this point, I think the only 
reasonable thing we can do is bump to 6.11.6.

  Regards,
  Arnout

> 
> Tested on STM32MP157C-DK2 Discovery Board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> No changes since v3
> 
> Changes v2 -> v3:
>   - Update TF-A hash file.
> 
> Changes v1 -> v2:
>   - Bump TF-A.
>   
>   .../patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
>   .../common/stm32mp1xx/patches/linux/linux.hash             | 2 +-
>   .../common/stm32mp1xx/patches/uboot/uboot.hash             | 2 +-
>   configs/stm32mp157a_dk1_defconfig                          | 6 +++---
>   configs/stm32mp157c_dk2_defconfig                          | 7 ++++---
>   5 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> index 2bc5030cf2ff..8b77e1f1653a 100644
> --- a/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> +++ b/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  72df0928138de111bf5e75fae47f88a4d1b4930ad52b7902e2b53e117be650c8  arm-trusted-firmware-v2.9-git4.tar.gz
> +sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
> diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
> index 95bd23c8d022..8cde9f620b0d 100644
> --- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
> +++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  f048267b7b88316c9ca708c68d15a9ae802dcfc943c3188c1273eb958c433281  linux-6.9.8.tar.xz
> +sha256  5ae7cc4e0e2f6b9ba630f643985ba0522c7d5e5b9571ba478a3cb513edd4cf22  linux-6.9.12.tar.xz
> diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
> index fe9b4f53dc63..904fa56c02a3 100644
> --- a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
> +++ b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
> +sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
> diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
> index c1ecbd22c198..1a851946b022 100644
> --- a/configs/stm32mp157a_dk1_defconfig
> +++ b/configs/stm32mp157a_dk1_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.12"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> @@ -31,7 +31,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
> index c35d75853f06..89555244049f 100644
> --- a/configs/stm32mp157c_dk2_defconfig
> +++ b/configs/stm32mp157c_dk2_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.12"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> @@ -31,10 +31,11 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>   BR2_TARGET_UBOOT_FORMAT_DTB=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
