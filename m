Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B48D41D46
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 12:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A192C4065B;
	Thu, 14 Nov 2024 12:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ms3jukeKe6IE; Thu, 14 Nov 2024 12:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC40640689
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC40640689;
	Thu, 14 Nov 2024 12:07:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A01B7BF
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 12:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80B8D4068D
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 12:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuRdm5PKW9Ed for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 12:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79A7C4065B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A7C4065B
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79A7C4065B
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 12:07:29 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2fb561f273eso5088081fa.2
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 04:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731586047; x=1732190847;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FdvLAxGWDo98J7ltNjRpele4qklbQP9SyDEmdNB5EJI=;
 b=mJCfoSXHbB12ECAzeDn+MNanlnoL+P10rGGK9P67/BSPKpxc0p604eMIJFSnByxumK
 qRzFeJpUTitiWw+2EVP8g8wiiD5sjfUC6S0j9Na5Jze+vwqCk4nxfKpJ2a12sS3Orz+Q
 JmtCkilX8c2EScQbSoUaso/fhmPUsXDQUt4Ig/Kl4Jo/30TMjo4CFQ8WNNfVJykyXHhO
 7rsMyunf9gSZjpA1YqYj6fiMvosoBdI5lxFIjBPW0IAMsljwemvYjLmeeAGRMi10ExZV
 3EUs0bkv74olcAUVaQfQYiBwqsHGHHU5kGjdW2BHZBiSpTKRRAN7GR7+hrQJT6B+/PhC
 zS7w==
X-Gm-Message-State: AOJu0YxWnbEbfoovd9N+X4tj63ut/V2urwKMq/cCN3S/ul1cy25UG1qu
 Iqv/H2QaLhSnICkC8Vfxp4fa2R/C3HhhFpSt0jDX3OI9mFR4yR6e/2V1kw==
X-Google-Smtp-Source: AGHT+IEfDKQeTklsuv7uImPLMoDff4TakIHv3HDo2/zVTqYwB51W8jyhDWZ+AfVlh578/Ytn2TaJsA==
X-Received: by 2002:a05:651c:b2a:b0:2f3:b71a:1e91 with SMTP id
 38308e7fff4ca-2ff426ba42bmr51144291fa.17.1731586046683; 
 Thu, 14 Nov 2024 04:07:26 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d48baa42sm44995825e9.1.2024.11.14.04.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 04:07:26 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 14 Nov 2024 13:05:15 +0100
MIME-Version: 1.0
Message-Id: <20241114-master-v3-1-8895d5a60a0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHrnNWcC/1WNyw6CMBREf4V0bU1f2taV/2FclNsLNBEwLWk0h
 H8XiBJczuTMmZEkjAETuRQjiZhDCn03B3koCDSuq5EGP2cimFBMC0tblwaMVDoNFkoL9lySGX5
 GrMJrFd3uc25CGvr4Xr2ZL+1XIdlPkTllVIIzxgJX6NS1bl14HKFvF+OKG67+cG2kqqRH76Hc4
 ctjFtsLZ1xvM0E51VAZr4Q/ecP3s2maPuyrfy4CAQAA
X-Change-ID: 20240729-master-3a7c9cb9c96b
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13231;
 i=rgallaispou@gmail.com; h=from:subject:message-id;
 bh=fzPftRZbcKp7G82lC/7qniQd9YLb5riU2hK2kfz44tU=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnNefNNpn9KSQa65Xvd1r82MTWL4n4eEzf5uMZK
 bXAPhCjJs2JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZzXnzQAKCRDnIYpo1BLC
 tenJD/4g98PuWqdalQ1dwqA/9h5YaAg+FtAQE6k+QAp5H2Hm6ezrBbX6RXdk9Sa7uiXPPUZz0JH
 GkN3yiyVGXVKjK4r0YJH1T4upV6/GpwdEHLz6NF9yEZYgRxoErBjlxyiV55Os99sRKcBcTgiHfI
 u94TKG1qvMdUmRwDVPrP2PEnVUXkVconmwLcRClQc5dAkunp8nJjBu09yMkoYTxVdhm5XNJEjOi
 DdK6I3Z6gbg+9zBNJ2f0+Q4uZZv5o1DQfDJI+4Tb1I39C5C7y82hH7g7pTWBYSBMNnTBMtFkVkk
 PZSANYdCxtqWNnI3SYwVuI84ppThTtH7TlpEAiLrFTHWjO/dURe0tzpGgRrJQGPrTex4v5a12P4
 LXAFuD1SeaMXU2o3si8Q54YYdoCAodb6F9j2mweJqv+mQ5p990cEFl3bABKhiXJbrUqveIisGq6
 6jsnvHG+i00kf/vlHAW7cAk2eFdGcdMclUOFDWKeX++w1xxCbPl3ZGlPkTilOEvXxHarHtQh+lO
 jcXP41W3Npd64r0sVJk5jfIuYP4OQiiHUMnGdXntqhshoIOX50+2//DySOnS67DuuVf3R/ZwXqa
 Pm4X0W5V4qGTtpAcUpcsEdzU0DLsOkuqvGTbbFQwucEq4/vDgn2kjgLhcxY9zhU3NQ9SJnG342e
 YIhG4AqRVWnhcnA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731586047; x=1732190847; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FdvLAxGWDo98J7ltNjRpele4qklbQP9SyDEmdNB5EJI=;
 b=nhWQWL1O8qVAiRSNSNWK2FFUbiEYNfdc399zWWiW88OPIeQqT16LsJR9ZSJFbLJ26v
 hDjDU859cEgmSrGbjRfacHiNj6aKl35qKjiFYG+8+Qoatp83/ui+rUwmS3nAHdzTo4TQ
 1L/qNsHbB0t6ZJ9XfA5FvsPMQVqQj6aPxwm0Lx/pontGg0oIysq0pdTvCBWgBFUhWzU2
 eW6ZYmSxNWRrgPIpZ7USmcvF3gcwxbkQpq4Hgc/TT8l5IOVAnimOsjctnfJQSqq6dfBG
 uUkkrV8rktO6d5DUeVFHXd0EfCjyxPlFrY3UajKSaJPQ/dszZt/E8+rX7zr9v6hk1ywQ
 ptQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nhWQWL1O
Subject: [Buildroot] [PATCH v3] configs/stm32mp135f-dk: new defconfig
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new defconfig for STMicroelectronics board STM32MP135F-DK.

STM32MP135F-DK features can be found here:
  https://www.st.com/en/evaluation-tools/stm32mp135f-dk.html

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
This commit series is a first attempt to improve the organization and
functionality of the STM32 platform in Buildroot. It comes with two
patches:

1. Reorder common ST folder:
   - Rename the common ST folder from stm32mp157 to stm32mp1xx.
   - Update references and paths in related configuration files.
   - Prepare to receive new stm32mp13 board.

2. Add new defconfig for STM32MP13:
   - Introduce a new defconfig file (stm32mp13_dk).
   - Boot following the TF-A/OP-TEE/U-Boot/Linux chain.
   v1:
   - Include generic "multi_v7" defconfig for Linux configuration.
   v2:
   - Include a minimalistic defconfig for Linux configuration.

Since this is a RFC, please feel free to discuss how those changes can
be improved.
---
Changes in v3:
- Change Linux config as per discussed here
https://lists.busybox.net/pipermail/buildroot/2024-November/767651.html
- As introduced in edc0a6b1a4, remove comments in defconfig.
- Use Linux stable v6.11.6 version instead of mainline.
- Use BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
- Remove 'E=0' option in TF-A build command line.
- Use GIT URL and tag version method instead of tarball for OP-TEE
- Change Linux & OP-TEE hashes accordingly
- Link to v2: https://lore.kernel.org/r/20241017-master-v2-1-7cf8d42d5d81@gmail.com

Changes in v2:
- Removed merged patch:
https://gitlab.com/buildroot.org/buildroot/-/commit/f21db2bd83bf3073a50b8bcd79af6e7aed6fb000
- Include a minimalistic defconfig for Linux configuration
- Removed BR2_PACKAGE_HOST_BMAP_TOOLS option.
- Move BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL to the according section.
- Hardcode OP-TEE version using tarball link.
- Use BR2_GLOBAL_PATCH_DIR and add OP-TEE hash to common folder.
- Link to v1: https://lore.kernel.org/r/20240814-master-v1-0-7834f3deddcb@gmail.com
---
 .../common/stm32mp1xx/patches/linux/linux.hash     |   2 +-
 .../stm32mp1xx/patches/optee-os/optee-os.hash      |   2 +
 .../stmicroelectronics/stm32mp135f-dk/linux.config | 190 +++++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf            |   4 +
 board/stmicroelectronics/stm32mp135f-dk/readme.txt |  38 +++++
 configs/stm32mp135f_dk_defconfig                   |  50 ++++++
 6 files changed, 285 insertions(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
index 95bd23c8d022ab5d49b4979b5da47bbdaf105798..42d02c9f7836ccaacf82acfcbc524402cea9c9a3 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f048267b7b88316c9ca708c68d15a9ae802dcfc943c3188c1273eb958c433281  linux-6.9.8.tar.xz
+sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000000000000000000000000000000000..73d4e2c4dafb1a4a94fa26d61017e92faa7d101e
--- /dev/null
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  03b91fd7dfdf890e3966f931f07634a2b6a2911bbee2a02ecc48d4a40cf6a9b8  optee-os-4.3.0-git4.tar.gz
diff --git a/board/stmicroelectronics/stm32mp135f-dk/linux.config b/board/stmicroelectronics/stm32mp135f-dk/linux.config
new file mode 100644
index 0000000000000000000000000000000000000000..25f570846af19baf87caa69c0cfb6fb415f00537
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp135f-dk/linux.config
@@ -0,0 +1,190 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_USELIB=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_ARCH_STM32=y
+CONFIG_ARM_THUMBEE=y
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARM_ERRATA_430973=y
+CONFIG_ARM_ERRATA_720789=y
+CONFIG_ARM_ERRATA_754322=y
+CONFIG_ARM_ERRATA_754327=y
+CONFIG_ARM_ERRATA_764369=y
+CONFIG_ARM_ERRATA_775420=y
+CONFIG_ARM_ERRATA_798181=y
+CONFIG_SMP=y
+CONFIG_MCPM=y
+CONFIG_HIGHMEM=y
+CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_SECCOMP=y
+# CONFIG_ATAGS is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_CMDLINE_PARTITION=y
+CONFIG_CMA=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_CAN=y
+CONFIG_CAN_M_CAN=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=128
+CONFIG_SIMPLE_PM_BUS=y
+CONFIG_ARM_SCMI_PROTOCOL=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_SRAM=y
+CONFIG_EEPROM_AT24=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_KS8851=y
+CONFIG_SMSC911X=y
+CONFIG_STMMAC_ETH=y
+CONFIG_DWMAC_DWC_QOS_ETH=y
+CONFIG_MDIO_BITBANG=y
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_STPMIC1_ONKEY=y
+CONFIG_SERIAL_STM32=y
+CONFIG_SERIAL_STM32_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_STM32F7=y
+CONFIG_SPI=y
+CONFIG_SPI_STM32=y
+CONFIG_SPI_STM32_QSPI=y
+CONFIG_PINCTRL_MCP23S08=y
+CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_STMFX=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_SYSCON_REBOOT_MODE=y
+CONFIG_WATCHDOG=y
+CONFIG_STPMIC1_WATCHDOG=y
+CONFIG_MFD_STM32_LPTIMER=y
+CONFIG_MFD_STPMIC1=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_ARM_SCMI=y
+CONFIG_REGULATOR_STM32_BOOSTER=y
+CONFIG_REGULATOR_STM32_VREFBUF=y
+CONFIG_REGULATOR_STM32_PWR=y
+CONFIG_REGULATOR_STPMIC1=y
+CONFIG_DRM=y
+CONFIG_DRM_STM=y
+CONFIG_DRM_STM_DSI=y
+CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
+CONFIG_DRM_SII902X=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_DYNAMIC_MINORS=y
+CONFIG_USB=m
+CONFIG_USB_OTG=y
+CONFIG_USB_XHCI_HCD=m
+CONFIG_USB_XHCI_PLATFORM=m
+CONFIG_USB_EHCI_HCD=m
+CONFIG_USB_EHCI_HCD_PLATFORM=m
+CONFIG_USB_OHCI_HCD=m
+CONFIG_USB_OHCI_HCD_PLATFORM=m
+CONFIG_USB_DWC2=m
+CONFIG_USB_CHIPIDEA=m
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_ISP1760=m
+CONFIG_USB_HSIC_USB3503=m
+CONFIG_USB_GPIO_VBUS=y
+CONFIG_USB_ISP1301=m
+CONFIG_USB_ULPI=y
+CONFIG_TYPEC=y
+CONFIG_TYPEC_STUSB=y
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK_MINORS=16
+CONFIG_MMC_ARMMMCI=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_DW=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PWM=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_STM32=y
+CONFIG_DMADEVICES=y
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
+CONFIG_COMMON_CLK_SCMI=y
+CONFIG_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_STM32_IPCC=y
+CONFIG_REMOTEPROC=y
+CONFIG_STM32_RPROC=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_RPMSG_TTY=y
+CONFIG_IIO=y
+CONFIG_IIO_SW_TRIGGER=y
+CONFIG_SD_ADC_MODULATOR=y
+CONFIG_STM32_ADC_CORE=y
+CONFIG_STM32_ADC=y
+CONFIG_STM32_ADC_TEMP=y
+CONFIG_STM32_DFSDM_ADC=y
+CONFIG_STM32_LPTIMER_CNT=y
+CONFIG_STM32_DAC=y
+CONFIG_IIO_HRTIMER_TRIGGER=y
+CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
+CONFIG_PWM=y
+CONFIG_PWM_STM32=y
+CONFIG_PWM_STM32_LP=y
+CONFIG_RESET_SCMI=y
+CONFIG_PHY_STM32_USBPHYC=y
+CONFIG_NVMEM_STM32_ROMEM=y
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+CONFIG_COUNTER=y
+CONFIG_STM32_LPTIMER_CNT=y
+CONFIG_STM32_TIMER_CNT=y
+CONFIG_EXT4_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_PRINTK_TIME=y
diff --git a/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000000000000000000000000000000000..0cc49d6a560a90846ead993ff02d38cc7cadc7e7
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp135f-dk-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp135f-dk.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/board/stmicroelectronics/stm32mp135f-dk/readme.txt b/board/stmicroelectronics/stm32mp135f-dk/readme.txt
new file mode 100644
index 0000000000000000000000000000000000000000..46879f88cf00d501966181624ca9a318d2ce94d2
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp135f-dk/readme.txt
@@ -0,0 +1,38 @@
+STM32MP135F Discovery Kit
+
+Intro
+=====
+
+This configuration supports the STM32MP135F Discovery Kit (DK)
+platform:
+
+  https://www.st.com/en/evaluation-tools/stm32mp135f-dk.html
+
+How to build
+============
+
+ $ make stm32mp135f_dk_defconfig
+ $ make
+
+How to write the microSD card
+=============================
+
+Once the build process is finished you will have an image called
+"sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an microSD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Boot the board
+==============
+
+ (1) Insert the microSD card in connector CN15
+
+ (2) Plug a micro-USB cable in connector CN11 and run your serial
+     communication program on /dev/ttyACM0.
+
+ (3) Plug a USB-C cable in CN6 to power-up the board.
+
+ (4) The system will start, with the console on UART, but also visible
+     on the screen.
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
new file mode 100644
index 0000000000000000000000000000000000000000..f8119c53c427d507ee31e5c9dba149182f6537cd
--- /dev/null
+++ b/configs/stm32mp135f_dk_defconfig
@@ -0,0 +1,50 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp135f-dk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_OPTEE_CLIENT=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 DTB_FILE_NAME=stm32mp135f-dk.dtb BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_CUSTOM_GIT=y
+BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL="https://github.com/OP-TEE/optee_os.git"
+BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION="4.3.0"
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
+BR2_TARGET_OPTEE_OS_PLATFORM="stm32mp1"
+BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin u-boot.dtb"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp135f-dk"
+BR2_PACKAGE_HOST_GENIMAGE=y

---
base-commit: e3f464778945d3e7ed31c50d07de02fb2cd85464
change-id: 20240729-master-3a7c9cb9c96b

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
