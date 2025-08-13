Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B734CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 22:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C18878439E;
	Wed, 13 Aug 2025 22:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrFN4sgHM7qi; Wed, 13 Aug 2025 22:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E63B684385
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E63B684385;
	Wed, 13 Aug 2025 22:28:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 112E2271
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 22:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02E4184385
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 22:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dk57Trb3X_98 for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 22:28:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 492F38434E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492F38434E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 492F38434E
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 22:28:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 85638B0051E;
 Thu, 14 Aug 2025 00:28:10 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 14 Aug 2025 00:28:10 +0200
MIME-Version: 1.0
Date: Thu, 14 Aug 2025 00:28:10 +0200
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org, breno.lima@nxp.com
In-Reply-To: <20250812231417.1249446-1-festevam@gmail.com>
References: <20250812231417.1249446-1-festevam@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a5c00e8fdbda87c8acabff7639a682e7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755124092;
 bh=7rGltZEdKMuQyBy8FRt7puYP5Bm03N/cOpuniOht/MY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eDUOS8EmUULTu+jToyIjwim+qA/Y7ExGAQ3bxr0e7sqh4V/2d71IORrBGKNo+HOrs
 n0KC/egi/KhMnbVk2dD/wBc7uDEfh+rmUawSzAFvdiSqxPh3l8oxfwfgK8rHRu/bJF
 MDuzjzjdJjZwbrlctl7aKohYXgrfJ+EITwW1VrazK6PWPD773A1xWa37b2+XxL4CeX
 etQrf8q2lWICOXPQ77+1gWX1pWEqWr+wNoWqseYS7K5IaNpEZaQSDHu7qZaZzn0a2I
 iRkIMqbtcF4BAz+DysGQEEEBYw03uAgiaZ5VF3Xom7/7jXZtT+Vv8WVXGhI+2FyaWf
 5oZAZ1hqbNZcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eDUOS8Em
Subject: Re: [Buildroot] [PATCH] freescale_imx93evk_defconfig: Add OP-TEE OS
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabio, Breno,

Thanks for the patch.  I have few comments.

In order to match other commits in "configs", could you reword the
title as: "configs/freescale_imx93evk: Add OP-TEE OS support"

Also, this patch enables BR2_TARGET_OPTEE_OS=y in this defconfig
which also has BR2_DOWNLOAD_FORCE_CHECK_HASHES=y.

So running the commands:

     make freescale_imx93evk_defconfig
     make source

Are failing with error:

     ERROR: No hash found for imx-optee-os-lf-6.12.3-1.0.0.tar.gz

This commit should also add optee-os hashes in
board/freescale/imx93evk/patches (which is the path set in
BR2_GLOBAL_PATCH_DIR).

Could you send an updated patch fixing those issues, please?

On 13/08/2025 01:14, Fabio Estevam wrote:
> From: Breno Lima <breno.lima@nxp.com>
> 
> Add OP-TEE OS Support from the NXP BSP lf-6.12.3-1.0.0 version.
> 
> The i.MX93 Boot Container requires a raw TEE binary without a TEE 
> header.
> Update the imx9-bootloader-prepare.sh script and Config.in accordingly
> to ensure compatibility with this requirement.
> 
> Signed-off-by: Breno Lima <breno.lima@nxp.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/common/imx/imx9-bootloader-prepare.sh | 2 +-
>  boot/optee-os/Config.in                               | 2 +-
>  configs/freescale_imx93evk_defconfig                  | 7 +++++++
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh 
> b/board/freescale/common/imx/imx9-bootloader-prepare.sh
> index 2db887a785..a267114d43 100755
> --- a/board/freescale/common/imx/imx9-bootloader-prepare.sh
> +++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
> @@ -20,7 +20,7 @@ main ()
>  		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
>  			-ap "${BINARIES_DIR}/bl31.bin" a55 ${ATF_LOAD_ADDR} \
>  			-ap "${BINARIES_DIR}/u-boot-hash.bin" a55 0x80200000 \
> -			-ap "${BINARIES_DIR}/tee.bin" a55 0x96000000 \
> +			-ap "${BINARIES_DIR}/tee-raw.bin" a55 0x96000000 \
>  			-out "${BINARIES_DIR}/u-boot-atf-container.img"
>  	else
>  		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> index 433dae90d8..e737d2a0ac 100644
> --- a/boot/optee-os/Config.in
> +++ b/boot/optee-os/Config.in
> @@ -167,7 +167,7 @@ config BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES
> 
>  config BR2_TARGET_OPTEE_OS_CORE_IMAGES
>  	string "Binary boot images"
> -	default "tee.bin tee-*_v2.bin"
> +	default "tee.bin tee-raw.bin tee-*_v2.bin"
>  	help
>  	  Names of generated image files that are installed in the
>  	  output images/ directory.
> diff --git a/configs/freescale_imx93evk_defconfig 
> b/configs/freescale_imx93evk_defconfig
> index 1140747825..0a39859342 100644
> --- a/configs/freescale_imx93evk_defconfig
> +++ b/configs/freescale_imx93evk_defconfig
> @@ -25,6 +25,13 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call 
> github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
> +BR2_TARGET_OPTEE_OS=y
> +BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
> +BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call 
> github,nxp-imx,imx-optee-os,lf-6.12.3-1.0.0)/imx-optee-os-lf-6.12.3-1.0.0.tar.gz"
> +BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
> +BR2_TARGET_OPTEE_OS_PLATFORM="imx"
> +BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="mx93evk"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> --
> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
