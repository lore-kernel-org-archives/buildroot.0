Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2BDC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 916C481C19;
	Fri,  2 May 2025 10:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55XQ5Nm0eReu; Fri,  2 May 2025 10:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F7658143F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F7658143F;
	Fri,  2 May 2025 10:54:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38B05229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AA9940E1E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfTAlGPlQUe4 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75B8540E21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75B8540E21
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75B8540E21
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:54:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A411F1C00E6; Fri,  2 May 2025 12:54:51 +0200 (CEST)
Message-ID: <e756a54b-12b9-4161-a845-04231b627ca3@rnout.be>
Date: Fri, 2 May 2025 12:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Cc: Gero Schwaericke <gero.schwaericke@posteo.de>
References: <20250421110915.6696-1-fancp2007@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250421110915.6696-1-fancp2007@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wRMhKDSjIUYn+1OYmm61vrv2VKem/xvfM18HZH8LU/w=;
 b=go8BzleHne0kDhx5nO1B5AjDDsU4NAMstslDCunqXuFdzkD5O5yd1ymCaGFiBSAj/3LPSQ
 fwqCyHmneHddByQVdHwUS5sNHGErhDCw5HvqwO8V7/3i4i8RjGAS4ydRniavUYAMv7pcT0
 MmTPwGM1QKOQo5KZ5Jvmz5rFeb2FZwdDOfqZOc8Qst5lOKmEjOsh5K8QITQYyLzpRioxN7
 BeDumb7MhH9mjMDoyCw4csB64LKuiAjz2LdJTGgbndHmRHYDpNO4KfJNY4JNZdL1GLF/6l
 Y3+w4DLfQWViYKES2+ukAsLRI/ukfytxrD90RvzAnWjccvrdGMy+7fPT3wCW7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=go8BzleH
Subject: Re: [Buildroot] [PATCH] configs/cubieboard1: bump Linux to 6.12.24
 and U-Boot to 2025.04
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



On 21/04/2025 13:08, Scott Fan wrote:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

  Applied to 2025.02.x (only Linux, not U-Boot), thanks.

  Regards,
  Arnout

> ---
>   board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
>   board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
>   configs/cubieboard1_defconfig                        | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
> index 2e30d90bb1..1213da86b1 100644
> --- a/board/cubietech/cubieboard1/patches/linux/linux.hash
> +++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  9423f4bfb4d875417e39cb0b017b5499fea47da56119f0cd28a201735d898f14  linux-6.12.14.tar.xz
> +sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
> diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
> index 50674352d7..80ea21b7cb 100644
> --- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
> +++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
> +sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
> diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
> index 4a4d932f32..9f3ad65386 100644
> --- a/configs/cubieboard1_defconfig
> +++ b/configs/cubieboard1_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.14"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
>   BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
> @@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
