Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8CEC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 13:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED0760F15;
	Mon,  3 Feb 2025 13:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeC95zi9BnGC; Mon,  3 Feb 2025 13:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7724F60EF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7724F60EF1;
	Mon,  3 Feb 2025 13:22:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D43BF185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5E1B82C1E
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNucfCb7P2qk for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 13:22:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0AC1D82C7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AC1D82C7C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AC1D82C7C
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:21:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so44218625e9.3
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 05:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738588918; x=1739193718;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YfCrZfxePU7In5QjCz+oJrqzllKQ37sEiS+vYXa58F8=;
 b=OGnMZ9urdGh1t9Ypc9KWzqeot19hc+2dBdndTM+P7vzl8vPim/KMQbhGDXDVyJVGDR
 FLjGrbp1rTc9/GqndF1zTw5G/OBCl5BMhAekX8osgsHtSl/H/nznMgL2Bn5SC6bejlPd
 SlNu2Ew4CREnM1heiYjdZUcnIXvl7FOrtOQgvRoqkHFsTLLCn0t7cezmIim0mwyaKcUZ
 zry67O/QrdcUpZOlDzpE1tfdXbr7c7+B8seXmTEm0vuSKDLhVzhBICzuuDyWkoWO+wSW
 dpFA2ZodKXgg62Jm+thmH0tZdIGhvEI1flAf+MbGqefVdD2CNfSFfD+uTw6yT1MguVjV
 9S0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzByadkCx8zuQ9fmFK5CWw47fERLPzrW7vpu7baChx9DhKEUNbC1yQMaOY8B685kzhrI2GP02ZcZs=@buildroot.org
X-Gm-Message-State: AOJu0Yw8P8viDI0rpe2X7tWx62N0T7/Dunx/8cDsPNL+9ATaL2mP4egX
 w4AtpCO95Xb9ytM/fcLZYOp57LWHSizJhgNy129PcaVFnd4jj8BwuNHgw84Ru94=
X-Gm-Gg: ASbGncsQepEvDOmSSzeFERdSNpeHS/jbVO39m90YWifmACLhFD2l+Fh8QJTE4ZjY7rR
 DRjr3QSb2Hw5N0s38mfsdnfEaAg12m78tvZrttKqvjBB2gjRVdJHZp5mJr9uUrHh6xSyielnyyw
 UEqNsMUSWZ4wIqNOlV4EmP7Yxt97Poh8+CgRVPirWoaunRr5GYHzheOKqdWNZ6QJ1et1SNkVaAn
 gfqQ7vhqnllGi8MFNqFk7jWLku6BmcYf7AQHhcedfUDffNJ/ps/g6yApE8GIiOAgH24QKAB2tfK
 DyNejfOaWTZlsr7hwNz0TcT8kCJ9Yq1H8tDDRvMuGs+Sjxs=
X-Google-Smtp-Source: AGHT+IH/V0Kt1uBlKi0h9C0fj8lhdJFeFjm7WZg5mCYYJ3XEHXpHX/h/8oG6lKIBFFWS1uKpZzhjMw==
X-Received: by 2002:a05:6000:18a9:b0:385:df6d:6fc7 with SMTP id
 ffacd0b85a97d-38c51b5efb4mr19820465f8f.25.1738588917615; 
 Mon, 03 Feb 2025 05:21:57 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b57a8sm12951291f8f.61.2025.02.03.05.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 05:21:57 -0800 (PST)
Message-ID: <e9576c4f-243b-4a89-a74d-3fee591100a8@mind.be>
Date: Mon, 3 Feb 2025 14:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <rgallaispou@gmail.com>, buildroot@buildroot.org
References: <20250129-master-v5-1-e8079d25a276@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250129-master-v5-1-e8079d25a276@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738588918; x=1739193718; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YfCrZfxePU7In5QjCz+oJrqzllKQ37sEiS+vYXa58F8=;
 b=JkE5w0g9O7o+wAifFW0UN2Sv1AfbtTDEMP3M7V0rglnim9D0hsm5ynJwPR/H5RWdLa
 ke9Gl37NOiA4NIumjqPedtO2TwbSqmVR/+vGA7BoHLf/wXZ4OiKirzmg8LOl2DmRhSd+
 oLezNLJFAcbUKxN1QbLzSyiLysdq7Dcz+U09v6NIsBGnnirm2YHlRDLSYvcYHUhgebX7
 2XOrt+gmTYXx5d4F2BTHVm8p+ffBsxFcjjukwKxbWvgR58ApS710HXrjOahxSWbPZmBT
 aIamOqcSXpZnhJMqG8H90BqzrqFsZm9jq/azcljkxXkhJTls84MF4frDhibN/+rJmBU+
 I4GQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JkE5w0g9
Subject: Re: [Buildroot] [PATCH v5] configs/stm32mp135f-dk: new defconfig
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Raphael,

On 29/01/2025 19:32, Raphael Gallais-Pou wrote:
> Add new defconfig for STMicroelectronics board STM32MP135F-DK.
> 
> STM32MP135F-DK features can be found here:
>    https://www.st.com/en/evaluation-tools/stm32mp135f-dk.html
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

  Since it's already v5, I've applied to master. However, there were a few 
things we decided in September about defconfigs [1]. Since these things haven't 
made it into the manual yet, you're forgiven for not knowing :-)

  In particular, the following points are not followed by the defconfig.

* The defconfig should use a Bootlin toolchain (stable, glibc) if that is 
available and works.
* If the kernel config builds modules, and the board has hotpluggable hardware 
(USB), then it makes sense to also enable mdev.


  Again, since this is new stuff, it's completely optional to apply it. But it 
sure would be nice if you could do so!

  Thank you,

  Regards,
  Arnout


[1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs



> ---
> This commit series is a first attempt to improve the organization and
> functionality of the STM32 platform in Buildroot. It comes with two
> patches:
> 
> 1. Reorder common ST folder:
>     - Rename the common ST folder from stm32mp157 to stm32mp1xx.
>     - Update references and paths in related configuration files.
>     - Prepare to receive new stm32mp13 board.
> 
> 2. Add new defconfig for STM32MP13:
>     - Introduce a new defconfig file (stm32mp13_dk).
>     - Boot following the TF-A/OP-TEE/U-Boot/Linux chain.
>     v1:
>     - Include generic "multi_v7" defconfig for Linux configuration.
>     v2:
>     - Include a minimalistic defconfig for Linux configuration.
> ---
> Changes in v5:
> - Rebase on latest buildroot/master...
> - ... in order to use BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
>    introduced in 0f3791f25f - boot/optee-os: add custom version option.
> - Link to v4: https://lore.kernel.org/r/20241216-master-v4-1-010141012037@gmail.com
> 
> Changes in v4:
> - Rebase on latest buildroot/next branch.
> - Add BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11 option to fix build
> - Link to v3: https://lore.kernel.org/r/20241114-master-v3-1-8895d5a60a0f@gmail.com
> 
> Changes in v3:
> - Change Linux config as per discussed here
> https://lists.busybox.net/pipermail/buildroot/2024-November/767651.html
> - As introduced in edc0a6b1a4, remove comments in defconfig.
> - Use Linux stable v6.11.6 version instead of mainline.
> - Use BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
> - Remove 'E=0' option in TF-A build command line.
> - Use GIT URL and tag version method instead of tarball for OP-TEE
> - Change Linux & OP-TEE hashes accordingly
> - Link to v2: https://lore.kernel.org/r/20241017-master-v2-1-7cf8d42d5d81@gmail.com
> 
> Changes in v2:
> - Removed merged patch:
> https://gitlab.com/buildroot.org/buildroot/-/commit/f21db2bd83bf3073a50b8bcd79af6e7aed6fb000
> - Include a minimalistic defconfig for Linux configuration
> - Removed BR2_PACKAGE_HOST_BMAP_TOOLS option.
> - Move BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL to the according section.
> - Hardcode OP-TEE version using tarball link.
> - Use BR2_GLOBAL_PATCH_DIR and add OP-TEE hash to common folder.
> - Link to v1: https://lore.kernel.org/r/20240814-master-v1-0-7834f3deddcb@gmail.com
> ---
>   .../common/stm32mp1xx/patches/linux/linux.hash     |   2 +-
>   .../stm32mp1xx/patches/optee-os/optee-os.hash      |   2 +
>   .../stmicroelectronics/stm32mp135f-dk/linux.config | 190 +++++++++++++++++++++
>   .../overlay/boot/extlinux/extlinux.conf            |   4 +
>   board/stmicroelectronics/stm32mp135f-dk/readme.txt |  38 +++++
>   configs/stm32mp135f_dk_defconfig                   |  50 ++++++
>   6 files changed, 285 insertions(+), 1 deletion(-)
> 
> diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
> index 95bd23c8d022ab5d49b4979b5da47bbdaf105798..42d02c9f7836ccaacf82acfcbc524402cea9c9a3 100644
> --- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
> +++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  f048267b7b88316c9ca708c68d15a9ae802dcfc943c3188c1273eb958c433281  linux-6.9.8.tar.xz
> +sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
> diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
> new file mode 100644
> index 0000000000000000000000000000000000000000..73d4e2c4dafb1a4a94fa26d61017e92faa7d101e
> --- /dev/null
> +++ b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  03b91fd7dfdf890e3966f931f07634a2b6a2911bbee2a02ecc48d4a40cf6a9b8  optee-os-4.3.0-git4.tar.gz
> diff --git a/board/stmicroelectronics/stm32mp135f-dk/linux.config b/board/stmicroelectronics/stm32mp135f-dk/linux.config
> new file mode 100644
> index 0000000000000000000000000000000000000000..25f570846af19baf87caa69c0cfb6fb415f00537
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32mp135f-dk/linux.config
> @@ -0,0 +1,190 @@
> +CONFIG_SYSVIPC=y
> +CONFIG_POSIX_MQUEUE=y
> +CONFIG_USELIB=y
> +CONFIG_NO_HZ=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_PREEMPT=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_LOG_BUF_SHIFT=16
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_ARCH_STM32=y
> +CONFIG_ARM_THUMBEE=y
> +# CONFIG_CACHE_L2X0 is not set
> +CONFIG_ARM_ERRATA_430973=y
> +CONFIG_ARM_ERRATA_720789=y
> +CONFIG_ARM_ERRATA_754322=y
> +CONFIG_ARM_ERRATA_754327=y
> +CONFIG_ARM_ERRATA_764369=y
> +CONFIG_ARM_ERRATA_775420=y
> +CONFIG_ARM_ERRATA_798181=y
> +CONFIG_SMP=y
> +CONFIG_MCPM=y
> +CONFIG_HIGHMEM=y
> +CONFIG_FORCE_MAX_ZONEORDER=12
> +CONFIG_SECCOMP=y
> +# CONFIG_ATAGS is not set
> +CONFIG_ZBOOT_ROM_TEXT=0x0
> +CONFIG_ZBOOT_ROM_BSS=0x0
> +CONFIG_ARM_APPENDED_DTB=y
> +CONFIG_ARM_ATAG_DTB_COMPAT=y
> +CONFIG_VFP=y
> +CONFIG_NEON=y
> +CONFIG_KERNEL_MODE_NEON=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +CONFIG_PARTITION_ADVANCED=y
> +CONFIG_CMDLINE_PARTITION=y
> +CONFIG_CMA=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_CAN=y
> +CONFIG_CAN_M_CAN=y
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_DMA_CMA=y
> +CONFIG_CMA_SIZE_MBYTES=128
> +CONFIG_SIMPLE_PM_BUS=y
> +CONFIG_ARM_SCMI_PROTOCOL=y
> +CONFIG_MTD=y
> +CONFIG_MTD_CMDLINE_PARTS=y
> +CONFIG_MTD_BLOCK=y
> +CONFIG_MTD_M25P80=y
> +CONFIG_MTD_NAND=y
> +CONFIG_MTD_NAND_STM32_FMC2=y
> +CONFIG_MTD_SPI_NOR=y
> +# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> +CONFIG_MTD_UBI=y
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_BLK_DEV_RAM=y
> +CONFIG_BLK_DEV_RAM_SIZE=65536
> +CONFIG_SRAM=y
> +CONFIG_EEPROM_AT24=y
> +CONFIG_NETDEVICES=y
> +CONFIG_VIRTIO_NET=y
> +CONFIG_KS8851=y
> +CONFIG_SMSC911X=y
> +CONFIG_STMMAC_ETH=y
> +CONFIG_DWMAC_DWC_QOS_ETH=y
> +CONFIG_MDIO_BITBANG=y
> +CONFIG_INPUT_JOYDEV=y
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_INPUT_TOUCHSCREEN=y
> +CONFIG_TOUCHSCREEN_EDT_FT5X06=y
> +CONFIG_INPUT_MISC=y
> +CONFIG_INPUT_STPMIC1_ONKEY=y
> +CONFIG_SERIAL_STM32=y
> +CONFIG_SERIAL_STM32_CONSOLE=y
> +CONFIG_SERIAL_DEV_BUS=y
> +CONFIG_HW_RANDOM=y
> +CONFIG_I2C_CHARDEV=y
> +CONFIG_I2C_MUX=y
> +CONFIG_I2C_STM32F7=y
> +CONFIG_SPI=y
> +CONFIG_SPI_STM32=y
> +CONFIG_SPI_STM32_QSPI=y
> +CONFIG_PINCTRL_MCP23S08=y
> +CONFIG_PINCTRL_SINGLE=y
> +CONFIG_PINCTRL_STMFX=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_GPIO=y
> +CONFIG_POWER_RESET_GPIO_RESTART=y
> +CONFIG_POWER_RESET_SYSCON=y
> +CONFIG_POWER_RESET_SYSCON_POWEROFF=y
> +CONFIG_SYSCON_REBOOT_MODE=y
> +CONFIG_WATCHDOG=y
> +CONFIG_STPMIC1_WATCHDOG=y
> +CONFIG_MFD_STM32_LPTIMER=y
> +CONFIG_MFD_STPMIC1=y
> +CONFIG_REGULATOR=y
> +CONFIG_REGULATOR_FIXED_VOLTAGE=y
> +CONFIG_REGULATOR_ARM_SCMI=y
> +CONFIG_REGULATOR_STM32_BOOSTER=y
> +CONFIG_REGULATOR_STM32_VREFBUF=y
> +CONFIG_REGULATOR_STM32_PWR=y
> +CONFIG_REGULATOR_STPMIC1=y
> +CONFIG_DRM=y
> +CONFIG_DRM_STM=y
> +CONFIG_DRM_STM_DSI=y
> +CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
> +CONFIG_DRM_SII902X=y
> +CONFIG_BACKLIGHT_LCD_SUPPORT=y
> +# CONFIG_LCD_CLASS_DEVICE is not set
> +CONFIG_BACKLIGHT_CLASS_DEVICE=y
> +# CONFIG_BACKLIGHT_GENERIC is not set
> +CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
> +CONFIG_SOUND=y
> +CONFIG_SND=y
> +CONFIG_SND_DYNAMIC_MINORS=y
> +CONFIG_USB=m
> +CONFIG_USB_OTG=y
> +CONFIG_USB_XHCI_HCD=m
> +CONFIG_USB_XHCI_PLATFORM=m
> +CONFIG_USB_EHCI_HCD=m
> +CONFIG_USB_EHCI_HCD_PLATFORM=m
> +CONFIG_USB_OHCI_HCD=m
> +CONFIG_USB_OHCI_HCD_PLATFORM=m
> +CONFIG_USB_DWC2=m
> +CONFIG_USB_CHIPIDEA=m
> +CONFIG_USB_CHIPIDEA_HOST=y
> +CONFIG_USB_ISP1760=m
> +CONFIG_USB_HSIC_USB3503=m
> +CONFIG_USB_GPIO_VBUS=y
> +CONFIG_USB_ISP1301=m
> +CONFIG_USB_ULPI=y
> +CONFIG_TYPEC=y
> +CONFIG_TYPEC_STUSB=y
> +CONFIG_MMC=y
> +CONFIG_MMC_BLOCK_MINORS=16
> +CONFIG_MMC_ARMMMCI=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_DW=y
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_PWM=y
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_STM32=y
> +CONFIG_DMADEVICES=y
> +CONFIG_STM32_DMA=y
> +CONFIG_STM32_DMAMUX=y
> +CONFIG_STM32_MDMA=y
> +CONFIG_COMMON_CLK_SCMI=y
> +CONFIG_HWSPINLOCK=y
> +CONFIG_HWSPINLOCK_STM32=y
> +CONFIG_STM32_IPCC=y
> +CONFIG_REMOTEPROC=y
> +CONFIG_STM32_RPROC=y
> +CONFIG_RPMSG_VIRTIO=y
> +CONFIG_RPMSG_TTY=y
> +CONFIG_IIO=y
> +CONFIG_IIO_SW_TRIGGER=y
> +CONFIG_SD_ADC_MODULATOR=y
> +CONFIG_STM32_ADC_CORE=y
> +CONFIG_STM32_ADC=y
> +CONFIG_STM32_ADC_TEMP=y
> +CONFIG_STM32_DFSDM_ADC=y
> +CONFIG_STM32_LPTIMER_CNT=y
> +CONFIG_STM32_DAC=y
> +CONFIG_IIO_HRTIMER_TRIGGER=y
> +CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
> +CONFIG_PWM=y
> +CONFIG_PWM_STM32=y
> +CONFIG_PWM_STM32_LP=y
> +CONFIG_RESET_SCMI=y
> +CONFIG_PHY_STM32_USBPHYC=y
> +CONFIG_NVMEM_STM32_ROMEM=y
> +CONFIG_TEE=y
> +CONFIG_OPTEE=y
> +CONFIG_COUNTER=y
> +CONFIG_STM32_LPTIMER_CNT=y
> +CONFIG_STM32_TIMER_CNT=y
> +CONFIG_EXT4_FS=y
> +CONFIG_MSDOS_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_PRINTK_TIME=y
> diff --git a/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf
> new file mode 100644
> index 0000000000000000000000000000000000000000..0cc49d6a560a90846ead993ff02d38cc7cadc7e7
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf
> @@ -0,0 +1,4 @@
> +label stm32mp135f-dk-buildroot
> +  kernel /boot/zImage
> +  devicetree /boot/stm32mp135f-dk.dtb
> +  append root=/dev/mmcblk0p4 rootwait
> diff --git a/board/stmicroelectronics/stm32mp135f-dk/readme.txt b/board/stmicroelectronics/stm32mp135f-dk/readme.txt
> new file mode 100644
> index 0000000000000000000000000000000000000000..46879f88cf00d501966181624ca9a318d2ce94d2
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32mp135f-dk/readme.txt
> @@ -0,0 +1,38 @@
> +STM32MP135F Discovery Kit
> +
> +Intro
> +=====
> +
> +This configuration supports the STM32MP135F Discovery Kit (DK)
> +platform:
> +
> +  https://www.st.com/en/evaluation-tools/stm32mp135f-dk.html
> +
> +How to build
> +============
> +
> + $ make stm32mp135f_dk_defconfig
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
> + (1) Insert the microSD card in connector CN15
> +
> + (2) Plug a micro-USB cable in connector CN11 and run your serial
> +     communication program on /dev/ttyACM0.
> +
> + (3) Plug a USB-C cable in CN6 to power-up the board.
> +
> + (4) The system will start, with the console on UART, but also visible
> +     on the screen.
> diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..387fe3a4143235dfca12a97d1ccbd7e34e4fe149
> --- /dev/null
> +++ b/configs/stm32mp135f_dk_defconfig
> @@ -0,0 +1,50 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
> +BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp135f-dk"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_OPTEE_CLIENT=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 DTB_FILE_NAME=stm32mp135f-dk.dtb BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
> +BR2_TARGET_OPTEE_OS=y
> +BR2_TARGET_OPTEE_OS_CUSTOM_VERSION=y
> +BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE="4.3.0"
> +BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
> +BR2_TARGET_OPTEE_OS_PLATFORM="stm32mp1"
> +BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin u-boot.dtb"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp135f-dk"
> +BR2_PACKAGE_HOST_GENIMAGE=y
> 
> ---
> base-commit: 15891236dbfb20ea971877918e9579b246f7c43c
> change-id: 20240729-master-3a7c9cb9c96b
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
