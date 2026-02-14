Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0ECEF5851
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 19:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4C1160862;
	Sat, 14 Feb 2026 19:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTVY7Y-4pysB; Sat, 14 Feb 2026 19:57:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E72D1608BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771099023;
	bh=WHfr5829WRAShicqt4HdhPoSznU1j6z2xFiEVnV0Xis=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IY0tPoaIIyeKlzsQMCsrP0TQyC6+dMQmlCr/4pN6/4/W9QMpfqpR4y45OlmbgqbiI
	 /oeHT+sJyaO8FrnBTI1UcTuEbuzi7bYZd8yfTWcDixSdxLty27ryoJ9WK6VIMTD2Jk
	 NL90Ps3sxlunuvLn97+Np7ieD8DXUekRky5X2VRKwNl8HjSSBFmRid8s+g2Vtk/zfT
	 BWvMJ1WyD9rc/FeHJB5/5ubrse31XKtrWGMQIeJo3RnqNaLZNNIcO8S5PeLts2DVy4
	 kNZzkjpb4dO5rifS03i0e2Gk2lN+crlvVQDVeNinPePr0Lrns0VFJQBj6jQD5DQ++B
	 2Yus2J5wcOajw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E72D1608BB;
	Sat, 14 Feb 2026 19:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4050931F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 393EB821A3
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gtk3yD4KOeco for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 19:57:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28EFE811DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EFE811DD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28EFE811DD
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:57:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6187A5FFAA;
 Sat, 14 Feb 2026 20:56:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Feb 2026 20:56:50 +0100
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 20:56:50 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Leon Anavi <leon.anavi@konsulko.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Fabrice Goucem
 <fabrice.goucem@oss.nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20260210000739.3810940-7-giulio.benetti@benettiengineering.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
 <20260210000739.3810940-7-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <08470d05a339900538f80591ca4b2aae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771099019;
 bh=15dzEt8TMULDSrL5KR+VvSzS2rGIm+P3HoL2Mm1XRuY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AGpejhr1LkGUWLMAg2uNaUaHGfJDy8DNGrJNyIARJjOzlTgrsWeQlKlfF8LrvUm3w
 mKg3UWBOVos+FwT3oCESPeVUQS6yby2YBfsmbEbUc2FNFnTfp1mjdmnPJHh7CpH1sd
 vE8u7rboZeyGrE04OeQMf1gH6w3MbEJRcwu685jsJf5ssEju6SPFwCS7kdo3O15CoB
 3WcC7Adk1Peg5U2EkhoP2H7FaK5lye0pfdkVLyGCO7OoOpiMG0NyrXoptImGR2Yxd5
 jEIwF4CYUoCVYhq30AnmU5pUheBhoL1MgNjM/44UmbZV4QfqAfdXhTtmNSAUKlSnOx
 3Uw/ZTQnJAWKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AGpejhr1
Subject: Re: [Buildroot] [PATCH v2 06/13] configs/imx6ullevk: bump Linux to
 6.18.8 and U-Boot to 2026.01
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

Hi Giulio, All,

Thanks for the patch. I have a comment, see below.

On 10/02/2026 01:07, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.8
> * bumps U-Boot to version 2026.01
> * forces check hashes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .checkpackageignore                                 | 1 -
>  board/freescale/imx6ullevk/patches/linux/linux.hash | 1 +
>  board/freescale/imx6ullevk/patches/uboot/uboot.hash | 1 +
>  configs/imx6ullevk_defconfig                        | 9 ++++++---
>  4 files changed, 8 insertions(+), 4 deletions(-)
[...]
> diff --git a/board/freescale/imx6ullevk/patches/linux/linux.hash 
> b/board/freescale/imx6ullevk/patches/linux/linux.hash
> index b138642633..88f216fc5e 100644
> --- a/board/freescale/imx6ullevk/patches/linux/linux.hash
> +++ b/board/freescale/imx6ullevk/patches/linux/linux.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  
> 2166d92e5631ee11bd249d492a1f4009c7635ee36b835fa55384b4ce41e8a63f  
> linux-imx-lf-6.12.49-2.2.0.tar.gz
> +sha256  
> 37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  
> linux-6.18.8.tar.xz

I would like to avoid having two defconfigs (one vendor and one
upstream) sharing the same board global patch directory. This could
become more difficult to maintain, as we may want in the future to
add a patch for one but not the other.

The current (and unfortunate) state is that i.MX defconfigs using
vendor BSP components are using a board directory like
"board/freescale/imx6ullevk" (without a dash) whereas defconfig for
the same board using upstream BSP components are using something
like "board/freescale/imx6ull-evk" (with a dash). See:
https://gitlab.com/buildroot.org/buildroot/-/tree/master/board/freescale/

So, even if the distinction is not very clear at the moment, I
suggest to continue to do the same, for now.

The longer term plan would be to follow the guidelines proposed in:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
that is, defconfig using vendor BSP component would go in:
"board/freescale/imx6ullevk_vendor"
and defconfigs using upstream components would go in:
"board/freescale/imx6ullevk".

> diff --git a/configs/imx6ullevk_defconfig 
> b/configs/imx6ullevk_defconfig
> index 38ea8f6940..279fb89b9d 100644
> --- a/configs/imx6ullevk_defconfig
> +++ b/configs/imx6ullevk_defconfig
> @@ -1,13 +1,15 @@
>  BR2_arm=y
>  BR2_cortex_a7=y
>  BR2_ARM_FPU_NEON_VFPV4=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
> +BR2_GLOBAL_PATCH_DIR="board/freescale/imx6ullevk/patches"

Could you send an updated patch using instead:
BR2_GLOBAL_PATCH_DIR="board/freescale/imx6ull-evk/patches"
and putting dedicated hash files in this directory, please?

> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>  
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.4"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ull-14x14-evk"

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
