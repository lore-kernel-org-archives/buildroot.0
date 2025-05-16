Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A6DC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADEF041976;
	Fri, 16 May 2025 10:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hPfN9bpg3et; Fri, 16 May 2025 10:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCDD941988
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDD941988;
	Fri, 16 May 2025 10:54:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F6313D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6BCC41988
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_fpXj5rq1cf for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:54:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06F8641976
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06F8641976
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06F8641976
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 06E511C0DFB; Fri, 16 May 2025 12:54:01 +0200 (CEST)
Message-ID: <8aec62a5-8352-4302-8000-7f028f948e8d@rnout.be>
Date: Fri, 16 May 2025 12:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
References: <20250506194502.2960556-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250506194502.2960556-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=X2VXdjQbM7/OQzSq5ewcd/eOR4JE+kOdUlFRsaj4ZVc=;
 b=g5Pq/Sj64snPslarVcFqX9DM6MKaxUhpQkjFNBAUtYLjyhTPPs+Ai9OcaPmUg0KWqWhWT+
 tZrclOW+e8s6THhjfKmY/pcC6tNpJD4JMCPIAONFvDbCCECGshJRMZy5SnKyv1C5cR4w33
 rhSCgtjCrLtTLGIGYiAFX3wkR4OHCETVkAxj4BprAgSwSngkO2ltKhktRTqsIEvdizXAqU
 Y+wjgNXl6VfbXx+byw0Xq6HZTX0IHp+YQ1N4vXyEcld/64Cb/DvGpcQd6F2z9tP0v4XYX3
 2hBRB1BZU4tkMkQdUqV0NY0eJ3E2J3GhmFSjTgfKOfwYiLWP+HRIBz9N5oCEvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=g5Pq/Sj6
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx28evk: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/05/2025 21:45, Julien Olivain wrote:
> This commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the defconfig
> and adds custom hash files. The exception entry in .checkpackageignore
> is also removed.
> 
> Cc: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, after adapting for the rename which is not in 2025.02.x, 
thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/9947424115
> ---
>   .checkpackageignore                                             | 1 -
>   .../freescale/imx28evk/patches/linux-headers/linux-headers.hash | 1 +
>   board/freescale/imx28evk/patches/linux/linux.hash               | 2 ++
>   board/freescale/imx28evk/patches/uboot/uboot.hash               | 2 ++
>   configs/imx28evk_defconfig                                      | 2 ++
>   5 files changed, 7 insertions(+), 1 deletion(-)
>   create mode 120000 board/freescale/imx28evk/patches/linux-headers/linux-headers.hash
>   create mode 100644 board/freescale/imx28evk/patches/linux/linux.hash
>   create mode 100644 board/freescale/imx28evk/patches/uboot/uboot.hash
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 7bfc457c90..038e3d6dc6 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -139,7 +139,6 @@ configs/engicam_imx6qdl_icore_qt5_defconfig lib_defconfig.ForceCheckHash
>   configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
>   configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
>   configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
> -configs/imx28evk_defconfig lib_defconfig.ForceCheckHash
>   configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
>   configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
>   configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
> diff --git a/board/freescale/imx28evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx28evk/patches/linux-headers/linux-headers.hash
> new file mode 120000
> index 0000000000..5808d92afe
> --- /dev/null
> +++ b/board/freescale/imx28evk/patches/linux-headers/linux-headers.hash
> @@ -0,0 +1 @@
> +../linux/linux.hash
> \ No newline at end of file
> diff --git a/board/freescale/imx28evk/patches/linux/linux.hash b/board/freescale/imx28evk/patches/linux/linux.hash
> new file mode 100644
> index 0000000000..8aeb3785b4
> --- /dev/null
> +++ b/board/freescale/imx28evk/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> +sha256  af54b449f4fb93b8e8daa346144a7309e8e95174bd962c4b5917cf56120456d9  linux-6.6.26.tar.xz
> diff --git a/board/freescale/imx28evk/patches/uboot/uboot.hash b/board/freescale/imx28evk/patches/uboot/uboot.hash
> new file mode 100644
> index 0000000000..97a2b4eaf9
> --- /dev/null
> +++ b/board/freescale/imx28evk/patches/uboot/uboot.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
> diff --git a/configs/imx28evk_defconfig b/configs/imx28evk_defconfig
> index 8c428e3fec..d34f413440 100644
> --- a/configs/imx28evk_defconfig
> +++ b/configs/imx28evk_defconfig
> @@ -1,5 +1,7 @@
>   BR2_arm=y
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_GLOBAL_PATCH_DIR="board/freescale/imx28evk/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>   BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/mxs/post-image.sh"
>   BR2_LINUX_KERNEL=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
