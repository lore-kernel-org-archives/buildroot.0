Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CCAE7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 23:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECB0B60689;
	Fri, 13 Dec 2024 23:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5wIcEoqG13c; Fri, 13 Dec 2024 23:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 127BC60BD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 127BC60BD8;
	Fri, 13 Dec 2024 23:21:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF10111A4
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 23:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F5BF41588
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 23:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rodP7xn2mNg for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 23:21:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D1B541586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D1B541586
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D1B541586
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 23:21:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6CEF9780316;
 Sat, 14 Dec 2024 00:21:26 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44030])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 00:21:26 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 00:21:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: buildroot@buildroot.org, Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Damien Le Moal <dlemoal@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
In-Reply-To: <20241213070241.3261032-1-niklas.cassel@wdc.com>
References: <20241213070241.3261032-1-niklas.cassel@wdc.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <694bd7f8bf186f6be3a70c0a62d27da9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734132092;
 bh=Yelglcmg42INchMkXALFT40NliJuFxp/S2fAWErdMJg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U2cvwPKM62gbGW90e7zI1B7Bqt3Oxi4/holnpwAFb0ffnzPMcnrN0doqFiMyXZnyl
 D/XUJuEyk3QOcD8HJVqYwldoO90eEtvvmfhSDNmoBQAl0xF5hU0Ba34OEnp13vkC2R
 3JQSHlYdXlTDboJQIS/+X7Id4eAixWY81vcJylFTk5QoRLJq3fEOPnrGYqmbdSw1bQ
 RGyIAu+8DA5YrB3U4nKp3tPUi7N3sPCiSeJcR8ne6EdMqxs4zDm6lBq1nrI4Ln2xrP
 Xtq7MyVVGzBE0S//JfLGT/A3raqIizBnBNtdvIVdW7Hpb52zm9ioU40rQsO4i2sPPw
 MzFh/+9ikj9KA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=U2cvwPKM
Subject: Re: [Buildroot] [PATCH] configs/rock5b: update to linux 6.12.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/12/2024 08:02, Niklas Cassel via buildroot wrote:
> From: Niklas Cassel <cassel@kernel.org>
> 
> Update to Linux 6.12, which also happens to be a LTS release.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Applied to master, thanks.

> ---
>  board/radxa/rock5b/patches/linux/linux.hash | 2 +-
>  configs/rock5b_defconfig                    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/board/radxa/rock5b/patches/linux/linux.hash 
> b/board/radxa/rock5b/patches/linux/linux.hash
> index 005667b1f1..d00eed9a49 100644
> --- a/board/radxa/rock5b/patches/linux/linux.hash
> +++ b/board/radxa/rock5b/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  
> 057263d0afc17d5253794afd3d239ba4da4aa734b22fa36c1665f41b95449b73  
> linux-6.11.3.tar.xz
> +sha256  
> 6f35f821433d8421be7167990747c7c4a0c451958fb96883446301af13d71152  
> linux-6.12.4.tar.xz
> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> index 38b5aad206..f898e86c8c 100644
> --- a/configs/rock5b_defconfig
> +++ b/configs/rock5b_defconfig
> @@ -1,6 +1,6 @@
>  BR2_aarch64=y
>  BR2_cortex_a76_a55=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_TARGET_GENERIC_HOSTNAME="rock5b"
> @@ -12,7 +12,7 @@ 
> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.3"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.4"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> --
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
