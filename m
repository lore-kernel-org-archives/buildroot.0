Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F2DCE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3D974050C;
	Mon, 17 Nov 2025 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aHdU1ZPCAEJ0; Mon, 17 Nov 2025 19:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D60BE40626
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D60BE40626;
	Mon, 17 Nov 2025 19:53:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1AF0158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3E2240626
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TbIgq3IbZCK for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:53:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E117A4050C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E117A4050C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E117A4050C
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:53:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1BA3B9796C0; Mon, 17 Nov 2025 20:53:52 +0100 (CET)
Message-ID: <292b5622-f086-4d9c-bcf6-68d47403c0e3@rnout.be>
Date: Mon, 17 Nov 2025 20:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Cc: Gero Schwaericke <gero.schwaericke@posteo.de>
References: <20251013145721.1236674-1-fancp2007@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251013145721.1236674-1-fancp2007@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=8h/kzF+XQ9chjp9SLrIf+MXQO0p1ZSsL1idbJsNiu4c=;
 b=dAFTM609j4K6AJ8VDqvORqrwvxlQuPJmNi55d9RZM2WiawaKjvLLsx8OlP+UyM6BhQ3xgG
 TNG9h8vrWWHipYPxxMFoiOpbIr5cHKHHEGTuryjlBm1SnCCv4na795l/U0RwbAHAUxoqky
 +KajaZtRAZiJkuCkkyS4jLE8dHpG9SXL+WSbvBd5XsgpTp/gkLDsT+xBn3scnZHu5jKUzO
 a1PVOPOD/o2pohrjeTnw74HqX4+1UMO1LJmc4mOQR4hMSxqss+MXNQdaL6rnY9ITDQcJg3
 IGsZtJhAOTXqXBqNf4yInXgAKGKRm9DsTIDxaXdtLvO+wppRA3T70LJzozoO0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dAFTM609
Subject: Re: [Buildroot] [PATCH 1/2] configs/cubieboard1: bump Linux to
 6.12.52 and U-Boot to 2025.10
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



On 13/10/2025 16:57, Scott Fan wrote:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

  Applied both to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
>   board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
>   configs/cubieboard1_defconfig                        | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
> index 823f6a55a3..9ef8b4af9c 100644
> --- a/board/cubietech/cubieboard1/patches/linux/linux.hash
> +++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  4804528a29cd20309a0b41c30e5aeffc35fa21ee3358f4a706d4586d003bc1fb  linux-6.12.42.tar.xz
> +sha256  b4850cf670a032c70f38b713a27d62046c5f747caf028c5f50b18f98606a9eb1  linux-6.12.52.tar.xz
> diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
> index 440526977b..98a5c53aaf 100644
> --- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
> +++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
> +sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
> diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
> index 8a25129311..7948ab3b19 100644
> --- a/configs/cubieboard1_defconfig
> +++ b/configs/cubieboard1_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.42"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.52"
>   BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
> @@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
