Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0A1E7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 21:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 289478455C;
	Tue, 17 Dec 2024 21:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4Ur4hykP8d3; Tue, 17 Dec 2024 21:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 318A680AE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 318A680AE2;
	Tue, 17 Dec 2024 21:30:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DE58E3
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 21:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E206817B3
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 21:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-oGIjmbFaRR for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 21:29:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1774180AE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1774180AE2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1774180AE2
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 21:29:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 46747780333;
 Tue, 17 Dec 2024 22:29:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60136])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Dec 2024 22:29:53 +0100
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 22:29:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Gero Schwaericke <gero.schwaericke@posteo.de>
In-Reply-To: <20241217130027.1120436-1-fancp2007@gmail.com>
References: <20241217130027.1120436-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <931958a0d6bf42d6677da892456ef520@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734470995;
 bh=1ZOrNNnl5Hm3XEI7cpAmOnTrjV1Ok2MWKMkp84B9Wx0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BP9mIVvpZiAY4v8+vJOgqz7eVl+zdns7BEwgl/9En3B37h68npfIettqIgttvn6l2
 3SAX5xhCQ5R4y+00eJKU4NfbCmzrrd+4C+U5SJNeK6tU66mxFnlHQSfEaYE1zgROaU
 K+REyrGarrAB0CzPHDJtawpoYaLW9Pc+exKu02jsDprQdAQ5AhQGB0kKff9ZZozmUP
 YRuuqz9UXLs5LseRBZYbj6Kw3TSq4INR25HAXEY/UzaqExIIlqryGflwCJXW1B4fWw
 7dyRayZezMGXx7I8ugzB/dpZl0xmSsK8IHCckKRjypZZ0SWFolo+WXmnzeIxo35YgL
 bs8BatCBuHShw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BP9mIVvp
Subject: Re: [Buildroot] [PATCH] configs/cubieboard1_defconfig: bump Linux
 to 6.12.5
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

On 17/12/2024 14:00, Scott Fan wrote:
> Bump Linux kernel version to 6.12.5 and update the hash accordingly.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.

> ---
>  board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
>  configs/cubieboard1_defconfig                        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash 
> b/board/cubietech/cubieboard1/patches/linux/linux.hash
> index 4759f8354e..450cb12423 100644
> --- a/board/cubietech/cubieboard1/patches/linux/linux.hash
> +++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  
> 62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  
> linux-6.11.11.tar.xz
> +sha256  
> 39207fce1ce42838e085261bae0af5ce4a0843aa777cfc0f5c49bc7729602bcd  
> linux-6.12.5.tar.xz
> diff --git a/configs/cubieboard1_defconfig 
> b/configs/cubieboard1_defconfig
> index 6d189bcf95..400b009546 100644
> --- a/configs/cubieboard1_defconfig
> +++ b/configs/cubieboard1_defconfig
> @@ -1,6 +1,6 @@
>  BR2_arm=y
>  BR2_cortex_a8=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard1/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard1/rootfs_overlay"
> @@ -8,7 +8,7 @@ 
> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c 
> board/cubietech/cubieboard1/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.5"
>  BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
