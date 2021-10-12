Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6567FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:55:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D432A60E09
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D432A60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B2D40753;
	Tue, 12 Oct 2021 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pnKyykTxqUhf; Tue, 12 Oct 2021 20:55:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E14F440775;
	Tue, 12 Oct 2021 20:55:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB8211BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E83FB80E19
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FO5eklQnSjud for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:55:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BEC780E05
 for <buildroot@busybox.net>; Tue, 12 Oct 2021 20:55:01 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ec8so1236971edb.6
 for <buildroot@busybox.net>; Tue, 12 Oct 2021 13:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=70c1vuMRfl1Jg0c459JvRQvQ/1OBgYM7uNbuBiDN2Zg=;
 b=CHYymk0Rf7pHieeOEHPJzpfT51mil7ALiVff2CbyHC2OAuHFRr83P+X4u8HCRDgOMw
 70434ry5ogFK7rE8+lxQR9Wgp4mb98d0imVZs1JpEdhXgogwLL3D+GfQGK0iqDRy89Xl
 79mnnOYsv8wAr+wUkTXrPaYhZJu5fJeeHAz7QSVyu5dvJ/hPGXVukyYlD0PA4+hPtohE
 jrP9/BzoRzj5NoKM2GTZMZ6WbKFcBkvB+56V3QOa+5Xp7D3v3Vxvov2UVTMuRk4edwun
 wUa6a1+M+5cRdgMDkPyI6kQy4NMourlaodABV2f2iNNdh6/9iiAtxqbffEGUP8vri8y7
 QIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=70c1vuMRfl1Jg0c459JvRQvQ/1OBgYM7uNbuBiDN2Zg=;
 b=QbHolM37EPzVYqu+8eOGYKeB24GtyRESssKPIqan+tRH8sQaolGJdkCVBF+Zgbg+fj
 PhRtYvk9GP8494HFnTEvR/RvnAeJ7vv56a7KxHc6wsS7nz1ZXvUWsaomVuowIxBZOyQd
 vUx4aCDvxS6WI8coeeqA2Aex+10x/NUwVDbmwMtHxZd49DiyhDR+Sg7Rw+gD6LR0PBme
 azkvGC9wNqfPq2R1mDWKFR+olUv2uSEzT4BH3nueb0pILJ8H5+9JkwQ6K/1IDvFIgogW
 1agzvnBGTYNHMoBBHGinr/gWD17/0V1l0loCZCqXN5EWWHaSU1+aoJnE1Zrj+dpqP8P6
 E2XA==
X-Gm-Message-State: AOAM533NcqrJGrcM2N7MTKpAW+E8BIAnFk4l0w7gPTkOHatlg7NP3Y3Y
 GsBGNBPmKep94TpJO6VXrRPqqA==
X-Google-Smtp-Source: ABdhPJxMbclX8eGBs9eTyvlNcVqukeQ3Zfl0SnTxTIGaYFewTxM9YaDykhKlZsuotz84wdm9bndhlQ==
X-Received: by 2002:a17:906:2c09:: with SMTP id
 e9mr36035401ejh.410.1634072100124; 
 Tue, 12 Oct 2021 13:55:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g2sm6563791edq.81.2021.10.12.13.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:54:59 -0700 (PDT)
Message-ID: <4570a800-018a-e213-8abd-d672b316376f@mind.be>
Date: Tue, 12 Oct 2021 22:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20211006103207.1366438-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006103207.1366438-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] configs/mx6cubox: bump Linux and U-Boot
 versions
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 12:32, Francois Perrad wrote:
> remove merged patches
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...xi-Fix-the-mmc-device-for-the-rootfs.patch | 29 --------------
>   ...2-mx6cuboxi-Fix-the-console-variable.patch | 40 -------------------
>   configs/mx6cubox_defconfig                    |  5 +--
>   3 files changed, 2 insertions(+), 72 deletions(-)
>   delete mode 100644 board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch
>   delete mode 100644 board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch
> 
> diff --git a/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch b/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch
> deleted file mode 100644
> index b9755a042..000000000
> --- a/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 96db7c072b96f9b7a1d9a986eff20353f7459004 Mon Sep 17 00:00:00 2001
> -From: Fabio Estevam <festevam@gmail.com>
> -Date: Sun, 18 Jul 2021 19:08:36 -0300
> -Subject: [PATCH] mx6cuboxi: Fix the mmc device for the rootfs
> -
> -After the comversion to DM_MMC, the rootfs is mmc 1, so
> -adjust it accordingly.
> -
> -Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ----
> - include/configs/mx6cuboxi.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
> -index 55717c77ab38..1a06f29b8c17 100644
> ---- a/include/configs/mx6cuboxi.h
> -+++ b/include/configs/mx6cuboxi.h
> -@@ -57,7 +57,7 @@
> - 	"console=" CONSOLE_DEV ",115200\0" \
> - 	"bootm_size=0x10000000\0" \
> - 	"mmcdev=" __stringify(CONFIG_SYS_MMC_ENV_DEV) "\0" \
> --	"finduuid=part uuid mmc 0:1 uuid\0" \
> -+	"finduuid=part uuid mmc 1:1 uuid\0" \
> - 	"update_sd_firmware=" \
> - 		"if test ${ip_dyn} = yes; then " \
> - 			"setenv get_cmd dhcp; " \
> ---
> -2.25.1
> -
> diff --git a/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch b/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch
> deleted file mode 100644
> index c02134101..000000000
> --- a/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From ab1dd9332c379164925aee755a013dbd8839501b Mon Sep 17 00:00:00 2001
> -From: Fabio Estevam <festevam@gmail.com>
> -Date: Mon, 19 Jul 2021 16:48:07 -0300
> -Subject: [PATCH 2/2] mx6cuboxi: Fix the console variable
> -
> -Do not pass the console baudrate to the 'console' variable
> -to avoid the baudrate being passed twice when using extlinux.conf:
> -
> -cat /proc/cmdline
> -root=PARTUUID=00000000-01 rootwait rw console=ttymxc0,115200,115200
> -
> -Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ----
> - include/configs/mx6cuboxi.h | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
> -index 1a06f29b8c17..9e5083b0d876 100644
> ---- a/include/configs/mx6cuboxi.h
> -+++ b/include/configs/mx6cuboxi.h
> -@@ -38,7 +38,6 @@
> - /* Command definition */
> -
> - #define CONFIG_MXC_UART_BASE	UART1_BASE
> --#define CONSOLE_DEV	"ttymxc0"
> -
> - #ifndef CONFIG_SPL_BUILD
> - #define CONFIG_EXTRA_ENV_SETTINGS \
> -@@ -54,7 +53,7 @@
> - 	"ramdiskaddr=0x13000000\0" \
> - 	"initrd_high=0xffffffff\0" \
> - 	"ip_dyn=yes\0" \
> --	"console=" CONSOLE_DEV ",115200\0" \
> -+	"console=ttymxc0\0" \
> - 	"bootm_size=0x10000000\0" \
> - 	"mmcdev=" __stringify(CONFIG_SYS_MMC_ENV_DEV) "\0" \
> - 	"finduuid=part uuid mmc 1:1 uuid\0" \
> ---
> -2.25.1
> -
> diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
> index 60bfd1709..d0ce2f9a6 100644
> --- a/configs/mx6cubox_defconfig
> +++ b/configs/mx6cubox_defconfig
> @@ -13,12 +13,11 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>   BR2_ROOTFS_OVERLAY="board/solidrun/mx6cubox/rootfs_overlay"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
> -BR2_GLOBAL_PATCH_DIR="board/solidrun/mx6cubox/patches"
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.48"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.70"
>   BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-cubox-i imx6dl-cubox-i-emmc-som-v15 imx6dl-cubox-i-som-v15 imx6dl-hummingboard imx6dl-hummingboard-emmc-som-v15 imx6dl-hummingboard-som-v15 imx6q-cubox-i imx6q-cubox-i-emmc-som-v15 imx6q-cubox-i-som-v15 imx6q-hummingboard imx6q-hummingboard-emmc-som-v15 imx6q-hummingboard-som-v15"
> @@ -33,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
>   BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
