Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB76C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26BC760635;
	Sun, 28 Apr 2024 18:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOeurAibsgZa; Sun, 28 Apr 2024 18:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB0126066B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB0126066B;
	Sun, 28 Apr 2024 18:22:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 811C21BF344
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 782DB4016F
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPT4edrYQvNX for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:22:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D9CD40105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D9CD40105
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D9CD40105
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:22:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3499f1bed15so2755884f8f.1
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714328522; x=1714933322;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mh2eZcTZZ0Nb4qr5X3FLNLcvmKUMGwDRfBiNVukXHlM=;
 b=iPc8a+SdGxVjm8o0TRN7L/H8A7j6Q+8h8ln1xtu6gMQtXtWPl8iTAgstAuiHlf8/dN
 aZE/kLL03FDIpem/06vzBkVpTnCfU9ZDf7+rdzLkNxV+Eh1yYOU2l7JFObf3s8EpdEwy
 H9CsJ14YxG2H0nO5sUD5USWyAHcZAQjEMt40WKI8JZQzmaYE/HxfL4WOq3qkP4GmrNy5
 Rfya3C0B6i0nGwuHbAHvfS5sndc52P+d/SgBCalXjTPDVbXrKYSFGjIsU9WgVhq0myVx
 dKpuTQN7+izxgUHi19RghoaKclJV2JOesmm43iBRhwsqDZYjqPuuNo5ySo/B0C2Sbshb
 yKwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXu1d5wMYx4c3YXx/fg3bAH38ROEf7IchyQPHN7TcFgxXvOle7uy7aZ5KZ0r9TP3pI4tcrhrUt1Gx1PvnCCbl7voDvXPlxlA==
X-Gm-Message-State: AOJu0Yxp0m4L4vxd7727MuuvJqAr0/Qy2x0QWqmafIzTaadUzTWuIIUi
 Edso4vvC+pxZlvnVTAfI/OKQkBJh4qBJz2bcyOcAlNNVM8Jq4bCrGd0WWLX78gfvHaGmKYg/x1q
 K
X-Google-Smtp-Source: AGHT+IH5zrN6eM2/t99dWKtBJR6ORbp+hheqnz45HqvsBFtVy1qAzQ8z1iALlLLhikhoNjwUYPNpcg==
X-Received: by 2002:a5d:6592:0:b0:34d:760:f8b3 with SMTP id
 q18-20020a5d6592000000b0034d0760f8b3mr1210294wru.10.1714328522234; 
 Sun, 28 Apr 2024 11:22:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a5d6950000000b003477d26736dsm27577600wrw.94.2024.04.28.11.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 11:22:01 -0700 (PDT)
Message-ID: <48bd141c-6fdf-4bb9-a5fe-aa4666ed8701@mind.be>
Date: Sun, 28 Apr 2024 20:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lukasz Tekieli <tekieli.lukasz@gmail.com>, buildroot@buildroot.org
References: <20240414180034.510216-1-tekieli.lukasz@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240414180034.510216-1-tekieli.lukasz@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714328522; x=1714933322; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mh2eZcTZZ0Nb4qr5X3FLNLcvmKUMGwDRfBiNVukXHlM=;
 b=MgvvntkTKK+SS/f+zfZVe/kZZRtReAF8U8br2p1f9/VRxw1KSuRkpAC2aHGtL2K/pJ
 H5Ebx4JPo1hCR38h1zF+EiwYiV2w3Fl+5+cCvZ9KGCtmUOsGLLPeamdohxjmos7I3OE8
 1/hbITTtgTmalYa1nXloWvOnbhRAVqQxdz7/DGcczNVSqA6QQ9ApjqfEGHpbVYEVcMmD
 yE4Vo+MtEaxrNrKO3dxYxP8EQsaKMQRxHhHXhLn9RnbciKKocXREzA5EM5bV2xY/7oc0
 c8VnnggZ5IPtvq4rpwXcAJvz/3e4pvAVdgWAcYsq5mgepsqRXslg1AIs2vVtPkNiMKqE
 WYSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MgvvntkT
Subject: Re: [Buildroot] [PATCH 1/1] configs/visionfive2: update kernel to
 upstream 6.8.2
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2024 20:00, Lukasz Tekieli wrote:
> The configuration is based on defconfig from starfive's kernel fork [1].
> 
> [1] https://github.com/starfive-tech/linux/blob/076ede06c00a4069cd9f90d609eaf35bf1bdc68a/arch/riscv/configs/starfive_visionfive2_defconfig
> 
> Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>


  Applied to master, thanks.

  We now want hashes for the custom kernel and bootloader that are used in the 
defconfigs. See for example commit 99a3698729dad14ff75f9914dd8555bb73d2da02 
which added them for the nezha_defconfig.

  Regards,
  Arnout

> ---
>   board/visionfive2/linux_defconfig             | 234 ++++++++++++++++++
>   .../overlay/boot/extlinux/extlinux.conf       |   2 +-
>   configs/visionfive2_defconfig                 |  10 +-
>   3 files changed, 240 insertions(+), 6 deletions(-)
>   create mode 100644 board/visionfive2/linux_defconfig
> 
> diff --git a/board/visionfive2/linux_defconfig b/board/visionfive2/linux_defconfig
> new file mode 100644
> index 0000000000..d6d1a65247
> --- /dev/null
> +++ b/board/visionfive2/linux_defconfig
> @@ -0,0 +1,234 @@
> +CONFIG_SYSVIPC=y
> +# CONFIG_CROSS_MEMORY_ATTACH is not set
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_PSI=y
> +# CONFIG_CPU_ISOLATION is not set
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_CGROUPS=y
> +CONFIG_CGROUP_SCHED=y
> +CONFIG_CGROUP_PIDS=y
> +CONFIG_CGROUP_CPUACCT=y
> +CONFIG_NAMESPACES=y
> +CONFIG_BLK_DEV_INITRD=y
> +# CONFIG_RD_BZIP2 is not set
> +# CONFIG_RD_LZMA is not set
> +# CONFIG_RD_XZ is not set
> +# CONFIG_RD_LZO is not set
> +# CONFIG_RD_LZ4 is not set
> +CONFIG_EXPERT=y
> +# CONFIG_SYSFS_SYSCALL is not set
> +CONFIG_PERF_EVENTS=y
> +CONFIG_SOC_STARFIVE=y
> +CONFIG_ERRATA_SIFIVE=y
> +CONFIG_NONPORTABLE=y
> +CONFIG_SMP=y
> +# CONFIG_RISCV_ISA_SVPBMT is not set
> +# CONFIG_COMPAT is not set
> +CONFIG_HIBERNATION=y
> +CONFIG_CPU_IDLE=y
> +CONFIG_RISCV_SBI_CPUIDLE=y
> +CONFIG_CPU_FREQ=y
> +CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
> +CONFIG_CPU_FREQ_GOV_POWERSAVE=y
> +CONFIG_CPU_FREQ_GOV_USERSPACE=y
> +CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
> +CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
> +CONFIG_CPUFREQ_DT=y
> +CONFIG_JUMP_LABEL=y
> +# CONFIG_STACKPROTECTOR is not set
> +# CONFIG_GCC_PLUGINS is not set
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +CONFIG_MODULE_COMPRESS_ZSTD=y
> +# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
> +CONFIG_BLK_WBT=y
> +# CONFIG_BLK_DEBUG_FS is not set
> +CONFIG_PARTITION_ADVANCED=y
> +# CONFIG_MQ_IOSCHED_DEADLINE is not set
> +# CONFIG_MQ_IOSCHED_KYBER is not set
> +CONFIG_KSM=y
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_IP_ADVANCED_ROUTER=y
> +CONFIG_IP_MULTIPLE_TABLES=y
> +CONFIG_IP_PNP=y
> +CONFIG_INET_DIAG=m
> +# CONFIG_IPV6_SIT is not set
> +CONFIG_IPV6_MULTIPLE_TABLES=y
> +# CONFIG_WIRELESS is not set
> +# CONFIG_ETHTOOL_NETLINK is not set
> +CONFIG_PCI=y
> +CONFIG_PCIEPORTBUS=y
> +CONFIG_PCI_HOST_GENERIC=y
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +# CONFIG_STANDALONE is not set
> +# CONFIG_PREVENT_FIRMWARE_BUILD is not set
> +CONFIG_FW_LOADER=m
> +CONFIG_SIFIVE_CCACHE=y
> +CONFIG_EFI_DISABLE_RUNTIME=y
> +CONFIG_MTD=y
> +CONFIG_MTD_SPI_NOR=y
> +CONFIG_ZRAM=y
> +CONFIG_ZRAM_MEMORY_TRACKING=y
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_BLK_DEV_LOOP_MIN_COUNT=1
> +CONFIG_BLK_DEV_NVME=y
> +CONFIG_SCSI=y
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_BLK_DEV_SR=y
> +CONFIG_NETDEVICES=y
> +CONFIG_STMMAC_ETH=y
> +CONFIG_DWMAC_DWC_QOS_ETH=y
> +# CONFIG_DWMAC_GENERIC is not set
> +CONFIG_DWMAC_STARFIVE=y
> +CONFIG_MICROCHIP_PHY=y
> +CONFIG_MOTORCOMM_PHY=y
> +# CONFIG_WLAN is not set
> +# CONFIG_INPUT_KEYBOARD is not set
> +# CONFIG_INPUT_MOUSE is not set
> +# CONFIG_SERIO is not set
> +# CONFIG_VT is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_LDISC_AUTOLOAD is not set
> +CONFIG_SERIAL_8250=y
> +# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> +# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_NR_UARTS=6
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=6
> +CONFIG_SERIAL_8250_EXTENDED=y
> +CONFIG_SERIAL_8250_MANY_PORTS=y
> +CONFIG_SERIAL_8250_DW=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_HW_RANDOM=y
> +CONFIG_HW_RANDOM_JH7110=y
> +# CONFIG_I2C_COMPAT is not set
> +CONFIG_I2C_CHARDEV=y
> +# CONFIG_I2C_HELPER_AUTO is not set
> +CONFIG_I2C_DESIGNWARE_PLATFORM=y
> +CONFIG_SPI=y
> +CONFIG_SPI_CADENCE_QUADSPI=y
> +CONFIG_SPI_PL022=y
> +CONFIG_SPI_SPIDEV=y
> +# CONFIG_PTP_1588_CLOCK is not set
> +CONFIG_GPIOLIB_FASTPATH_LIMIT=128
> +CONFIG_GPIO_SYSFS=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_GPIO_RESTART=y
> +CONFIG_SENSORS_SFCTEMP=y
> +CONFIG_THERMAL=y
> +CONFIG_CPU_THERMAL=y
> +CONFIG_THERMAL_EMULATION=y
> +CONFIG_WATCHDOG=y
> +CONFIG_MFD_AXP20X_I2C=y
> +CONFIG_REGULATOR=y
> +CONFIG_REGULATOR_FIXED_VOLTAGE=y
> +CONFIG_REGULATOR_AXP20X=y
> +CONFIG_MEDIA_SUPPORT=y
> +CONFIG_V4L_PLATFORM_DRIVERS=y
> +CONFIG_VIDEO_CADENCE_CSI2RX=y
> +CONFIG_VIDEO_IMX219=y
> +CONFIG_DRM=y
> +CONFIG_BACKLIGHT_CLASS_DEVICE=y
> +CONFIG_SOUND=y
> +CONFIG_SND=y
> +CONFIG_SND_SOC=y
> +CONFIG_SND_DESIGNWARE_I2S=y
> +CONFIG_SND_SOC_STARFIVE=y
> +CONFIG_SND_SOC_JH7110_PWMDAC=y
> +CONFIG_SND_SOC_JH7110_TDM=y
> +CONFIG_SND_SOC_WM8960=y
> +CONFIG_SND_SIMPLE_CARD=y
> +CONFIG_USB=y
> +CONFIG_USB_XHCI_HCD=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_HCD_PLATFORM=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_HCD_PLATFORM=y
> +CONFIG_USB_STORAGE=y
> +CONFIG_USB_UAS=y
> +CONFIG_USB_CDNS_SUPPORT=y
> +CONFIG_USB_CDNS3=y
> +CONFIG_USB_CDNS3_GADGET=y
> +CONFIG_USB_CDNS3_HOST=y
> +CONFIG_USB_CDNS3_STARFIVE=y
> +CONFIG_USB_GADGET=y
> +CONFIG_USB_CONFIGFS=y
> +CONFIG_USB_CONFIGFS_F_FS=y
> +CONFIG_MMC=y
> +# CONFIG_PWRSEQ_EMMC is not set
> +# CONFIG_PWRSEQ_SIMPLE is not set
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_SDHCI_OF_DWCMSHC=y
> +CONFIG_MMC_DW=y
> +CONFIG_MMC_DW_STARFIVE=y
> +CONFIG_DMADEVICES=y
> +CONFIG_AMBA_PL08X=y
> +CONFIG_DW_AXI_DMAC=y
> +CONFIG_DMATEST=y
> +# CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
> +CONFIG_STAGING=y
> +CONFIG_STAGING_MEDIA=y
> +CONFIG_VIDEO_STARFIVE_CAMSS=y
> +CONFIG_CLK_STARFIVE_JH7110_AON=y
> +CONFIG_CLK_STARFIVE_JH7110_STG=y
> +CONFIG_CLK_STARFIVE_JH7110_ISP=y
> +CONFIG_CLK_STARFIVE_JH7110_VOUT=y
> +# CONFIG_IOMMU_SUPPORT is not set
> +CONFIG_PWM=y
> +CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=y
> +CONFIG_PHY_STARFIVE_JH7110_PCIE=y
> +CONFIG_PHY_STARFIVE_JH7110_USB=y
> +CONFIG_EXT4_FS=y
> +CONFIG_BTRFS_FS=y
> +CONFIG_BTRFS_FS_POSIX_ACL=y
> +# CONFIG_DNOTIFY is not set
> +CONFIG_FANOTIFY=y
> +CONFIG_AUTOFS_FS=y
> +CONFIG_MSDOS_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_FAT_DEFAULT_UTF8=y
> +CONFIG_EXFAT_FS=y
> +CONFIG_NTFS_FS=y
> +CONFIG_NTFS_RW=y
> +CONFIG_PROC_KCORE=y
> +CONFIG_PROC_CHILDREN=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_EFIVAR_FS=y
> +CONFIG_JFFS2_FS=y
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V4=y
> +CONFIG_NFS_V4_1=y
> +CONFIG_NFS_V4_2=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_NLS_DEFAULT="iso8859-15"
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_ISO8859_15=y
> +CONFIG_LSM=""
> +CONFIG_CRYPTO_ZSTD=y
> +# CONFIG_RAID6_PQ_BENCHMARK is not set
> +# CONFIG_DEBUG_MISC is not set
> +CONFIG_STRIP_ASM_SYMS=y
> +CONFIG_DEBUG_SECTION_MISMATCH=y
> +# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> +CONFIG_DEBUG_FS=y
> +# CONFIG_SLUB_DEBUG is not set
> +CONFIG_DEBUG_RODATA_TEST=y
> +CONFIG_DEBUG_WX=y
> +CONFIG_SOFTLOCKUP_DETECTOR=y
> +CONFIG_WQ_WATCHDOG=y
> +# CONFIG_SCHED_DEBUG is not set
> +CONFIG_STACKTRACE=y
> +CONFIG_RCU_CPU_STALL_TIMEOUT=60
> +# CONFIG_RCU_TRACE is not set
> +# CONFIG_FTRACE is not set
> +# CONFIG_RUNTIME_TESTING_MENU is not set
> diff --git a/board/visionfive2/overlay/boot/extlinux/extlinux.conf b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
> index 6e2c5660d6..fd772f3675 100644
> --- a/board/visionfive2/overlay/boot/extlinux/extlinux.conf
> +++ b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
> @@ -1,4 +1,4 @@
>   label linux
>     kernel /boot/Image
> -  devicetree /boot/jh7110-visionfive-v2.dtb
> +  devicetree /boot/jh7110-starfive-visionfive-2-v1.3b.dtb
>     append console=ttyS0,115200 root=/dev/mmcblk1p3
> diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
> index c8576a35a7..247854d4d1 100644
> --- a/configs/visionfive2_defconfig
> +++ b/configs/visionfive2_defconfig
> @@ -1,15 +1,15 @@
>   BR2_riscv=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   BR2_SYSTEM_DHCP="eth0"
>   BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive2/genimage.cfg"
>   BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,05533e9c31d6f0da20efc2d436a3b0f6d516ed4b)/linux-05533e9c31d6f0da20efc2d436a3b0f6d516ed4b.tar.gz"
> -BR2_LINUX_KERNEL_DEFCONFIG="starfive_visionfive2"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.2"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-visionfive-v2"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-starfive-visionfive-2-v1.3b"
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
