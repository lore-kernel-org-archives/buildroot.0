Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E1DC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6FA48397A;
	Fri,  2 May 2025 10:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0RfoZvXMbk5; Fri,  2 May 2025 10:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08676839E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08676839E7;
	Fri,  2 May 2025 10:33:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E810A229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8D4A81F10
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbvbPF0yQTHL for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAFFF838E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAFFF838E6
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAFFF838E6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:33:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E3E91C1113; Fri,  2 May 2025 12:33:47 +0200 (CEST)
Message-ID: <2f70cada-09fd-4f87-b94a-d9347f26ad3a@rnout.be>
Date: Fri, 2 May 2025 12:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
References: <20250417152425.3248986-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250417152425.3248986-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rS18zZlwu5dT4JOvit1Px/W7zlm1J1PySdkeKnUkUBI=;
 b=F1+SP1XBBd6n8EDunFGOghXv1hJLmQnkUDPCsR+9ejIN7efftSgeaJ/woWJ3oi/L9/CMDR
 TsY5ynJIrkCl+8+eAjyP/GeaMlgYckBb5RJPQ6vb99IFhvs+B26QRnqp4FDFYRSFHn6Uer
 6CZY6VPt8pO33x0+uqvDKngMR0EJze+DFIBV9zdmDK5te145MHkwhyfomsTkbAmc7YPkcE
 TrXSVPryMFb/6CvThL8a7chsuzmqKepyeyt8rBXtjx4VZztfQ7CF3AWa7B53iCw7BBx8uD
 TuULt36q+c/Nr0fL04sR9HuleF7Npt6c0e3lPQS1lpDZxgBUbZK+GuxqWxb9sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=F1+SP1XB
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux
 to 6.1.134 and U-Boot to 2025.04
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



On 17/04/2025 17:24, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.1.134 and U-Boot to
> version 2025.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 2 +-
>   board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
>   configs/imx6ulz_bsh_smm_m2_defconfig                  | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
> index 6d69eabbd6a4..e300dfeb824c 100644
> --- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
> +++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  61c997b8acbbb8ab184565e96f476ecbb7e773cb35b98a1a4c832d809b2bf719  linux-6.1.120.tar.xz
> +sha256  60c70cdd70ddee384c004242e67844e3dd1fe28f75b26b3586859fff0a07bd23  linux-6.1.134.tar.xz
> diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
> index 904fa56c02a3..80ea21b7cb4c 100644
> --- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
> +++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
> +sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
> diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
> index f12dc8383d80..2169ab446581 100644
> --- a/configs/imx6ulz_bsh_smm_m2_defconfig
> +++ b/configs/imx6ulz_bsh_smm_m2_defconfig
> @@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.120"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.134"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
