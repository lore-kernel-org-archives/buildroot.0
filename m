Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAC5D59F75
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75BA3402DE;
	Wed,  6 Nov 2024 21:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9HkZM3Z-nyd; Wed,  6 Nov 2024 21:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDF39401FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDF39401FF;
	Wed,  6 Nov 2024 21:51:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BAA9B8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C38A40260
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fA3t2dB3YZZP for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47C7D4026B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47C7D4026B
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47C7D4026B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:51:13 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43155afca99so8252995e9.1
 for <buildroot@buildroot.org>; Wed, 06 Nov 2024 13:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730929871; x=1731534671;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bg3dG8bjd1/sS6juFgoRzPWfn8vvY1EoHuB80TsknCk=;
 b=dQJvnvqfC+N66xS57A5/SIcP/X68C4jtvrj1zMtjMLA9SOK5qUlzWPFQtBUnB6MrOd
 8bJrhabafZcjtTjBBphnbMtSZDGww01KUhOOIlqrwqgvvJ0AIqZ3sHwo2OrjdtFcd+rW
 bPEdPUDRYIxA/0x2zcCDQs/Elb4lKdFCGxA0y9Qx53XvmbjbRss5+pxvuet5UrJRDTpJ
 ZY4SrAWYo0Ntj7T1WkjKhcl/YXOzqLDHLAlE/ZHdYGkLw5p47+tCFn4r0ibFaHOfxKbX
 nZKy1iDi7hukX9K8d3Dp1WGF5w0RgkW1ax8wcFTZUUGcLeHgXY7KY4FFbTxAHCcrGBfw
 sTXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGBhBEfDCjvvlxnt/M0WWbnLX5VYOf5zYlsaJ4WXdnQlISogi2wxjASmMukQA8fwuoPGi139wZLdQ=@buildroot.org
X-Gm-Message-State: AOJu0YxwfQhGxh8AdGBD/rSv9wRqLrlmDYPBkksN8UYDvlSaGruIqqJE
 go8XV8XZ1MTzds4Lob8jksJpq+LInxJzBjujlYN+j+E59FDx/oxTkMGgv5hFpTU=
X-Google-Smtp-Source: AGHT+IHLNOl5y2t0+PepTzXrTfkHYF3xGbia3Ag5+VTprxYiZ9WTMY+M/5XWxPj8q/a6109AQO3rNg==
X-Received: by 2002:a05:6000:2709:b0:381:ed32:d606 with SMTP id
 ffacd0b85a97d-381ed32d7f6mr69318f8f.11.1730929871590; 
 Wed, 06 Nov 2024 13:51:11 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116b11esm20134171f8f.104.2024.11.06.13.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 13:51:10 -0800 (PST)
Message-ID: <2313fa16-4ca2-458f-9f78-8009ac5265d1@mind.be>
Date: Wed, 6 Nov 2024 22:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, buildroot@buildroot.org
References: <20240812-am62px-v1-1-9d16fa5a13fa@ti.com>
Content-Language: en-GB
In-Reply-To: <20240812-am62px-v1-1-9d16fa5a13fa@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1730929871; x=1731534671; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bg3dG8bjd1/sS6juFgoRzPWfn8vvY1EoHuB80TsknCk=;
 b=ePr5759JnfCti5VeGCjHu5Fl+6Vr3JvO8ypHXWTQVpS2tLk/BxQOoTLbqXLgprimcD
 TnbgbD5mQFDQAZ9Rzej3z8B0NBCvu8R98aWVskbpFM16CLW8Kpq6VVfDcognM5zF2RPf
 4hnGDi7nRZYipMIcfCx3jxmyJxKgNsAQ10A7iPd00uAgyFR4Abr5yeIDe5Cnp6mOcMip
 QYEYWHggQ8UdsT9Dukx3rDhGEnlcnDoNOefwZU//q0FkvCm2PIOsJovIarJ3mgFy8W5W
 Iky1eWg2rIcfaprBdTDSNNWXtaP5Xy1Q1EiQYTx3zHwwDsECs0MP3NNO71GuOnCpNdm9
 N09Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ePr5759J
Subject: Re: [Buildroot] [PATCH] configs/ti_am62px_sk_defconfig: add initial
 support
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



On 12/08/2024 19:04, Bryan Brattlof via buildroot wrote:
> Introduce the initial base-port support for the SK-AM62P reference board
> made by Texas Instruments.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

  Applied to master, thanks, with one change as discussed below and a few more 
remarks.

[snip]
> diff --git a/board/ti/am62px-sk/genimage.cfg b/board/ti/am62px-sk/genimage.cfg
> new file mode 100644
> index 0000000000000..b0a1bee8b991b
> --- /dev/null
> +++ b/board/ti/am62px-sk/genimage.cfg
> @@ -0,0 +1,33 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"tiboot3.bin",
> +			"tispl.bin",
> +			"u-boot.img",
> +			"k3-am62p5-sk.dtb",
> +			"Image"
> +		}
> +
> +		file extlinux/extlinux.conf {
> +			image = extlinux.conf
> +		}
> +	}

  In the last developer meeting, we made a few decisions about streamlining 
defconfigs [1]. One of the conclusions was:

     If U-Boot supports the extlinux method of booting (i.e. kernel, dts and
     extlinux.conf in the rootfs), then preferably use this method.

  That could apply here. Only, you still need tiboot3.bin, tispl.bin and 
u-boot.img in a FAT partition I guess. We haven't actually discussed that situation.

> +
> +	size = 64M
> +}

[snip]
> +How to Build
> +============
> +
> +Select the default configuration for the target:
> +
> +$ make ti_am62px_sk_defconfig
> +
> +Optional: modify the configuration:
> +
> +$ make menuconfig
> +
> +IMPORTANT: make sure to use the tiboot3 firmware that match with the TI
> +K3 SoC boot ROM (tiboot3-am62px-{hs-fs/hs}-evm.bin) used on the board.

  This is not entirely clear, I copied another sentence from the other readmes:

Use the BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN to name which tiboot3.bin
security variant we want to use.

[snip]
> diff --git a/configs/ti_am62px_sk_defconfig b/configs/ti_am62px_sk_defconfig
> new file mode 100644
> index 0000000000000..4937fb704cc11
> --- /dev/null
> +++ b/configs/ti_am62px_sk_defconfig
> @@ -0,0 +1,46 @@
> +BR2_aarch64=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
> +BR2_GLOBAL_PATCH_DIR="board/ti/am62px-sk/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am62p5-sk.dtb -l am62px-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62px-sk/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"

  This is something we didn't discuss, but: I think we should use LTS versions 
wherever possible. But perhaps that's not possible here because support wasn't 
yet upstream in 6.6.

  As said, this was not discussed. I would very much appreciate your opinion on 
this as a board vendor.


> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am62p5-sk"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"

  For TF-A I would even prefer to use 
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION (which is the whole 
reason I introduced that :-) ).


  Regards,
  Arnout

[1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs


> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
> +BR2_TARGET_OPTEE_OS=y
> +BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62px"
> +BR2_TARGET_TI_K3_R5_LOADER=y
> +BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
> +BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62px_evm_r5"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62px_evm_a53"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_USE_BINMAN=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> 
> ---
> base-commit: 74b46d08da7adc49b01f7af7ebb9e1421b8a9362
> change-id: 20240628-am62px-dca81ec9ab04
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
