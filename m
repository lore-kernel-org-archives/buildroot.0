Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB71C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 22:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3FC94034A;
	Wed, 14 Aug 2024 22:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GM6i9_6P8O6k; Wed, 14 Aug 2024 22:12:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D48724035B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D48724035B;
	Wed, 14 Aug 2024 22:12:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5AAE1BF2A7
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 22:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1E2181229
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 22:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGM1gkFuGhHp for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 22:12:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04EAE81223
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04EAE81223
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04EAE81223
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 22:12:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB5661C0002;
 Wed, 14 Aug 2024 22:12:38 +0000 (UTC)
Date: Thu, 15 Aug 2024 00:12:37 +0200
To: Dong Wang <wangdong115@foxmail.com>
Message-ID: <20240815001237.6404eab5@windsurf>
In-Reply-To: <tencent_96D562A129814C4EA71CECCDB60D1B060707@qq.com>
References: <tencent_7E39529BBE1BB50CB4AA2A429702629C0808@qq.com>
 <tencent_96D562A129814C4EA71CECCDB60D1B060707@qq.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723673559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/iQ977/fqqRybdl5HH0RxNCM3wMa1f3h/SyLLWBsFJQ=;
 b=XpQcdua75CWRHPRIA63pTV9vE/RAtnGs/9A2qjr9inCoR1+VTIiRcN5n4GKzs3sDYWAWEs
 EWetDxfclqCQYs0ZZl8OK/QHYAFEvvLY5jCFkK9ppJhSD55j+J3MawhYuEx2k9gsnfHALx
 jGJvX/H9Yf3KW+WMDOj3upJE3sEuqnTLhF2L9WEYTfqBEIZcwAeis8/IWXZjKhC2dIaStg
 uZMnHTjwZPQW7NTxNRKpRQVNt+E/FJvdlqmxvMY+dGfKaSswGkqXwgqNBScBHyDQGj/MuQ
 04DiHKi9OeAQshtFKXUEstbmYIYvVG0aVWhV2B2OBoSeIJKMNg+CTuCgjiqX9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XpQcdua7
Subject: Re: [Buildroot] [PATCH v2]
 configs/friendlyarm_nanopi_neo_defconfig: new defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dong,

On Wed, 14 Aug 2024 01:02:44 +0800
Dong Wang <wangdong115@foxmail.com> wrote:

> This patch adds a new defconfig for the NanoPi NEO board made by
> FriendlyARM. This board is based on the Allwinner H3 SoC.
> 
> See: https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO
> 
> This patch uses the mainline kernel and u-boot for the board.
> 
> The configurations are based on the previously dropped defconfig
> maintained by Yann E. MORIN <yann.morin.1998@free.fr>.
> 
> Signed-off-by: Dong Wang <wangdong115@foxmail.com>

Thanks a lot for this v2, which I applied to next, but after fixing a
number of things (see below). Also, there's one remaining fix to fix as
a follow-up, see below as well.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index d7d0af3543..9eb54bc2bc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -868,6 +868,10 @@ F:	package/logsurfer/
>  N:	Dominik Michael Rauh <dmrauh@posteo.de>
>  F:	package/gdal/
>  
> +N:	Dong Wang <wangdong115@foxmail.com>
> +F:	board/friendlyarm/nanopi-neo

We like directory paths to end with a final / in the DEVELOPERS file,
so I fixed this.

> diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
> new file mode 100644
> index 0000000000..ec78fd0e56
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo/genimage.cfg
> @@ -0,0 +1,17 @@
> +# Minimal SD card image for the NanoPi NEO.
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = false
> +		image = "u-boot-sunxi-with-spl.bin"
> +		offset = 8K
> +		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)

I don't understand this "size" value, and especially the - 16KB(GPT),
since this image is not using a GPT partition table. Could you clarify,
and perhaps send a follow-up patch to fix this?

> diff --git a/board/friendlyarm/nanopi-neo/patches/linux.hash b/board/friendlyarm/nanopi-neo/patches/linux.hash

The files for those hashes were wrong, I don't know how you generated
them, but they need to be in a subdir for each package:

board
 + friendlyarm
   + nanopi-neo
     + patches
       + linux
         + linux.hash

Also, the hash for linux-headers was missing (as a symlink to linux). I
fixed those issues by just running ./utils/add-custom-hashes.


> diff --git a/configs/friendlyarm_nanopi_neo_defconfig b/configs/friendlyarm_nanopi_neo_defconfig
> new file mode 100644
> index 0000000000..8d1dde247d
> --- /dev/null
> +++ b/configs/friendlyarm_nanopi_neo_defconfig
> @@ -0,0 +1,50 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_FPU_VFPV4=y
> +
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +
> +# Hashes
> +BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-neo/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +
> +# System
> +BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
> +
> +# Image
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.44"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-nanopi-neo"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
> +
> +# Host utilities
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y

dosfstools is no longer needed, as you no longer have a FAT partition.

> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

mtools is also no longer needed.

Thanks again!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
