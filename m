Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934A6CCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 23:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 608A86170E;
	Wed, 15 Oct 2025 23:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRNaFeGH-9xp; Wed, 15 Oct 2025 23:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 824E961745
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 824E961745;
	Wed, 15 Oct 2025 23:13:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EDF8968
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B97C40AF9
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sghfZ0WsyL3R for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 23:13:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91C2B40D9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91C2B40D9D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91C2B40D9D
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:13:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 027FFB978D7A; Wed, 15 Oct 2025 23:35:31 +0200 (CEST)
Message-ID: <df3cd390-eee1-4cc8-8fa0-0b052aa82af6@rnout.be>
Date: Wed, 15 Oct 2025 23:35:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Cc: Lothar Felten <lothar.felten@gmail.com>
References: <20251014134349.728861-1-fancp2007@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251014134349.728861-1-fancp2007@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1760564132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=/SZD0QYDoRZAI30IWfUhtTTKPJ+WnhJ2rYub/dIpHXM=;
 b=VJyTs0ZKj4Oh0CTs58fdxhJ1IANL01Jtyrs5lE9tGPIRDC4QtQx85YKZTFE/uLQa3IQ9bV
 J7jUwJK4zXSzMnhYHzBbAR92UBF32g6txO4Sx3MPVP4ltUawffXPPTnfmW9cbXU3VJhyIO
 Vdo4oz1RPAHm0TAxawl42A6eOJjzc8zhUSIhJCfCAvPlcrpjW8WFJX/ntd51EWO8I41LwJ
 R2NWp1QLEiSFiJDRWL9AhWETeq90Ambos3tLEnFcc+Re28HVTMB5aofQY1V6r49X0hjHjb
 gCy/vGKFp5MtvPHiioDAQym7hhHXJ5W7uq8X1v1BmlQIMZIBvWOjpaXy5wft6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VJyTs0ZK
Subject: Re: [Buildroot] [PATCH 1/2] configs/beaglebone: bump Linux to
 6.12.34-ti-arm32-r12 and U-Boot to 2025.10
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



On 14/10/2025 15:43, Scott Fan wrote:
> The patch bumps the Linux kernel to version 6.12.34-ti-arm32-r12 and
> U-Boot to version 2025.10.
> 
> Tested on beaglebone black.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

  Applied both to master, thanks.

  Since about a year, we are also migrating the defconfigs to use the bootlin 
toolchains instead of the internal toolchain (to save build time, e.g. in CI). 
So if you touch this defconfig again, please also switch to the bootlin stable 
glibc toolchain.

  Regards,
  Arnout

> ---
>   board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
>   board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
>   configs/beaglebone_defconfig                          | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
> index f2c09d9872..e70a999129 100644
> --- a/board/beagleboard/beaglebone/patches/linux/linux.hash
> +++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  3654ca31003d90d20b195b23f8d60b78fcffbf0fd7fed6116c22719e20ac933d  linux-6.12.23-ti-arm32-r11.tar.gz
> +sha256  1db327d0743e97ec725fefe05065a6fb779abe3063845fc3b551a4a716247c0a  linux-6.12.34-ti-arm32-r12.tar.gz
> diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
> index 440526977b..98a5c53aaf 100644
> --- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
> +++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
> +sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index bb63fda375..86bf6bce9a 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.23-ti-arm32-r11)/linux-6.12.23-ti-arm32-r11.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.34-ti-arm32-r12)/linux-6.12.34-ti-arm32-r12.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
> @@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
