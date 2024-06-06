Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D952C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 08:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3C6C8435A;
	Thu,  6 Jun 2024 08:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wviIye2PQ8Cl; Thu,  6 Jun 2024 08:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC59084373
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC59084373;
	Thu,  6 Jun 2024 08:48:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D54CE1BF599
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDC9240496
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmIcfioRtfin for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 08:48:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 598C640168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 598C640168
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 598C640168
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 08:48:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0785713F8A2;
 Thu,  6 Jun 2024 10:48:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 10:48:13 +0200
Date: Thu, 6 Jun 2024 10:48:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <ZmF3zYMOyfnuBKF_@landeda>
References: <20240603124737.222442-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603124737.222442-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717663703;
 bh=wDIKqDpYOWsz5jCAnxpUaX3Ctd6E0MuO5HzqFgzzLcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ICF/F12XtACVJMqriysPzSCDCRNbKe+iFBwqhPkjnqpfGWkOxz5WL/ZtWEwepry65
 fhALHwSvT++4o4qlEizyeOejjTu/NMrKirzPp52asfBAxv+RPF6X7SvpKEDioCYVFa
 XQ8VUalUKOIml7V5r4Adq05S5ggQLAA+Ze1PuJDrbYzp6dz2ms7AcDPKSex5TAQyJS
 91/cfOUEzgpORxqwlj0q242YEAGkXO5+ecbIpEpfSJ8SGIx44WlGb678/AMlofRGFg
 37h/w81p7wit93occFCMbW3z43SKBLRBk9g49Oox8r+DmMoYX5llfT3tE28/gi0n9D
 ltMjhDBH3tHqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ICF/F12X
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynq_*: move hashes
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
Cc: martin.chabot@gmail.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, juju@cotds.org,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2024-06-03 13:47 +0100, Neal Frager via buildroot spake thusly:
> This patch moves the linux and uboot hashes from 'board/zynq/patches' to
> 'board/xilinx/patches'.  The reason for this is that all of the Xilinx boards
> including zynq, zynqmp and versal will be using the same linux and uboot repo.
> By putting the hashes in 'board/xilinx/patches', the same hashes can be shared
> amongst all of the Xilinx boards.

Yes, this is a good move.

> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/{zynq => xilinx}/patches/linux-headers/linux-headers.hash | 0
>  board/{zynq => xilinx}/patches/linux/linux.hash                 | 0
>  board/{zynq => xilinx}/patches/uboot/uboot.hash                 | 0
>  configs/zynq_microzed_defconfig                                 | 2 +-
>  configs/zynq_zc702_defconfig                                    | 2 +-
>  configs/zynq_zc706_defconfig                                    | 2 +-
>  configs/zynq_zed_defconfig                                      | 2 +-
>  7 files changed, 4 insertions(+), 4 deletions(-)
>  rename board/{zynq => xilinx}/patches/linux-headers/linux-headers.hash (100%)
>  rename board/{zynq => xilinx}/patches/linux/linux.hash (100%)
>  rename board/{zynq => xilinx}/patches/uboot/uboot.hash (100%)
> 
> diff --git a/board/zynq/patches/linux-headers/linux-headers.hash b/board/xilinx/patches/linux-headers/linux-headers.hash
> similarity index 100%
> rename from board/zynq/patches/linux-headers/linux-headers.hash
> rename to board/xilinx/patches/linux-headers/linux-headers.hash
> diff --git a/board/zynq/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
> similarity index 100%
> rename from board/zynq/patches/linux/linux.hash
> rename to board/xilinx/patches/linux/linux.hash
> diff --git a/board/zynq/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
> similarity index 100%
> rename from board/zynq/patches/uboot/uboot.hash
> rename to board/xilinx/patches/uboot/uboot.hash
> diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
> index c6ca5a6244..f955a0c4ad 100644
> --- a/configs/zynq_microzed_defconfig
> +++ b/configs/zynq_microzed_defconfig
> @@ -3,7 +3,7 @@ BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> -BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
> index 9e37678d9b..75ebc2a3ba 100644
> --- a/configs/zynq_zc702_defconfig
> +++ b/configs/zynq_zc702_defconfig
> @@ -3,7 +3,7 @@ BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> -BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
> index 9ccf23f6e1..ce539eefaf 100644
> --- a/configs/zynq_zc706_defconfig
> +++ b/configs/zynq_zc706_defconfig
> @@ -3,7 +3,7 @@ BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> -BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
> index 95606caf5c..925faeac8e 100644
> --- a/configs/zynq_zed_defconfig
> +++ b/configs/zynq_zed_defconfig
> @@ -3,7 +3,7 @@ BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> -BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
