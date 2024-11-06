Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF44AD59F75
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8297A6068A;
	Wed,  6 Nov 2024 22:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7l8NycIDPkz; Wed,  6 Nov 2024 22:25:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84D5160A70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D5160A70;
	Wed,  6 Nov 2024 22:25:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F197B8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCA146068A
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmhTsbsSyaLu for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F239606B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F239606B8
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F239606B8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso2822215e9.3
 for <buildroot@buildroot.org>; Wed, 06 Nov 2024 14:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730931879; x=1731536679;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sSeJ+cSp3+D6vmJJMY3/HIunPBFrNoMiPJPniwa/jKw=;
 b=U0cNYDOub6F6P1I78HNn7TD1r87bVS8dCM8uqCENildt+cut8RH3dgkvqKFMosJMbI
 Rvoxu8dGiXsmTZko4+11+59sVrbO/zypsXfmffsU/pk75rLI0ahZ8QUcunruGet3i4yI
 lTTYR75nL/rMlpMN1OcO4ZZbN2losaFodC2ucfIuMsQQd7QG6mqRMeaMPXcBmuxqjOY2
 l0stNB3TGjnjPU1ijwPUBwb4tzlzbcB2IA4KN2GjhGtTX3jTxydAT6rdvxG2PET0DyJB
 jYFLlDri/IYeNlWBbQ3roZ30DSVeg1uwZNlm1hTsa3XBGbt9lzYYaNEzzpq7ruopKzzg
 /cBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+u3aW3OYKm0PJKYIDbqr2oZpe2pcKbGZcQ7R5Ip4oiq1lI8tTla0d32jsj2yfJbRcKtusdzgGrV8=@buildroot.org
X-Gm-Message-State: AOJu0Yw3gNJL78KBJFdmcUHyIyLB8fpGA5d2alN7Gr5VlJe2xYg/duDr
 bQ/HoMKTEsvwgy2nDP4sePBOlW/hhdSo7SV0DUETzrXHGSNI7cRyr+8Hclid53ri8HRtXjgnVNi
 E
X-Google-Smtp-Source: AGHT+IF9kGdsRlQUVt/0OPXSCs/L9LLVlKkDpbAjPVTZreOzTfMXyrBGtqZZ6eretQfRGC//0OxHFg==
X-Received: by 2002:a05:600c:4688:b0:431:5957:27e8 with SMTP id
 5b1f17b1804b1-4327b7ea52dmr199664165e9.28.1730931879007; 
 Wed, 06 Nov 2024 14:24:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa73a2d8sm36857665e9.41.2024.11.06.14.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 14:24:37 -0800 (PST)
Message-ID: <11cb561c-1f5b-4608-9726-3ffc48625d60@mind.be>
Date: Wed, 6 Nov 2024 23:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <rgallaispou@gmail.com>, buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241017-master-v2-1-7cf8d42d5d81@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241017-master-v2-1-7cf8d42d5d81@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1730931879; x=1731536679; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sSeJ+cSp3+D6vmJJMY3/HIunPBFrNoMiPJPniwa/jKw=;
 b=dKPrq90srPWR1Z1ez3yrnqVgB5zagdpNiWyHHP6MaDQieDHhQoinYK25R3QdYSME3S
 SKETltMtHWxOe8yUqtLDZBE5NHZ0y3X9sHW4ER0DwWjswxSYab8v9S2oM4o8V3ELEcf8
 Q0ju58g/lb5WNxzMKR867IwjbDHXp6HHZwb8QcVMwRV29sYJXhEg2B6eDesda5eW2mOL
 Gxexjy7r/1XARGihlk7O4DswArXO5bp7wu6yYdM0gt3VcGyFtlBmhrOunvURcGk1/SoJ
 rMsseHNi+fBZE830jyb9x0MPSEaDCMw5pBvqB3rq3mDcvJbLCetThgQ6TAd8LiRHL8gV
 6fHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dKPrq90s
Subject: Re: [Buildroot] [PATCH v2] configs/stm32mp135f-dk: new defconfig
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

  Hi Raphael,

  Although this is good enough to merge, I have a few comments that you still 
may want to include. If you tell me you have no time it can be merged as is.

On 17/10/2024 23:28, Raphael Gallais-Pou wrote:
[snip]
> diff --git a/board/stmicroelectronics/stm32mp135f-dk/linux.config b/board/stmicroelectronics/stm32mp135f-dk/linux.config
> new file mode 100644
> index 0000000000000000000000000000000000000000..533f22345b0c6fe69edf7fc901996809377f6162
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
> +CONFIG_PINCTRL_MCP23S08=m

  IIUC this chip exists on the board, so there's no reason to make it a module, 
right?

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
> +CONFIG_USB=y
> +CONFIG_USB_OTG=y
> +CONFIG_USB_XHCI_HCD=y
> +CONFIG_USB_XHCI_PLATFORM=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_HCD_PLATFORM=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_HCD_PLATFORM=y
> +CONFIG_USB_DWC2=y
> +CONFIG_USB_CHIPIDEA=y
> +CONFIG_USB_CHIPIDEA_HOST=y
> +CONFIG_USB_ISP1760=y
> +CONFIG_USB_HSIC_USB3503=y
> +CONFIG_USB_GPIO_VBUS=y
> +CONFIG_USB_ISP1301=y
> +CONFIG_USB_ULPI=y

  If there are pluggable ports, it makes sense to enable all possible USB device 
drivers as modules.

  Same for the gadgets BTW.

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
> +CONFIG_COUNTER=m
> +CONFIG_STM32_LPTIMER_CNT=m
> +CONFIG_STM32_TIMER_CNT=m

  Again, no reason for these to be modules.

> +CONFIG_EXT4_FS=y
> +CONFIG_MSDOS_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_PRINTK_TIME=y

[snip]
> diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..d41821bdaf6e94c255e38f468752dcd28abb6bbb
> --- /dev/null
> +++ b/configs/stm32mp135f_dk_defconfig
> @@ -0,0 +1,64 @@
> +# Architecture

  In the mean time we decided to save all defconfigs as a defconfig, without 
comments etc.

> +BR2_arm=y
> +BR2_cortex_a7=y
> +
> +# Linux headers same as kernel, a 6.9 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
> +
> +# System configuration
> +BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"

  Not agreed on yet in the community, but I would like to use LTS versions if 
possible (so 6.6.x). If that is too old, then a 6.11 would be better of course.


> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp135f-dk"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# Filesystem
> +BR2_PACKAGE_OPTEE_CLIENT=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Bootloaders
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"

  Again, no agreement has been reached, but I'd prefer 
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION.


> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 DTB_FILE_NAME=stm32mp135f-dk.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"

  Is the E=0 actually needed?

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
> +BR2_TARGET_OPTEE_OS=y
> +BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
> +BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="https://github.com/OP-TEE/optee_os/archive/refs/tags/4.3.0.tar.gz"

  We also decided to avoid github tarballs and instead use the git download 
method, because then the hash is actually guaranteed to be stable.


  Regards,
  Arnout

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
> +
> +# Additional tools
> +BR2_PACKAGE_HOST_GENIMAGE=y
> 
> ---
> base-commit: e3f464778945d3e7ed31c50d07de02fb2cd85464
> change-id: 20240729-master-3a7c9cb9c96b
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
