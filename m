Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC1FC2BA1A
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 20:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F4A2845D5;
	Thu, 20 Jun 2024 20:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znxInWyZCrAo; Thu, 20 Jun 2024 20:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10CF1845D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10CF1845D8;
	Thu, 20 Jun 2024 20:23:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A73011BF83B
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 20:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A034A42ED8
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 20:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hf4jnHJ6fDA9 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 20:23:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B8B842ED7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B8B842ED7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B8B842ED7
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 20:23:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0DDF913F88E;
 Thu, 20 Jun 2024 22:23:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 20 Jun 2024 22:23:21 +0200
Date: Thu, 20 Jun 2024 22:23:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZnSPuTocFlj6z_Q_@landeda>
References: <20240616070849.2608438-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240616070849.2608438-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718915004;
 bh=DM/24ZpCAdTvjqR7TL8i4rk5UYjR8MYO0NVrhopULxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dMOXMouKmVJ+g9qPNAArgXoQOfNTId5Rnm2JcfsxLTvNMYVQpIt8fpatrqYj3kJ3d
 cEh0+mfjs2FqAbKrh88L3QNb45jYoZ2qHnAgdqMG3NHbG0rMM5w9Jb9OKL44/bIlzi
 LkxOkoEKIkBJBfza/I44V3MVLvejBa74XTx5+onXUjbZXH+qqyZRuEAfU5frJxB/fU
 eEKdwwCDDZUIbDGCI8fXjfR194v45M+4GDNAxCUsdWZ8DBxAbTsPfFOBXh3Mtl9qD0
 UJQmvow0JyTjo0USuGYkh4f+1+lUDnMrV36we/CatrKqvUrjtYBG2c24K/gPv3qH1k
 i4sXrggnrGt3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dMOXMouK
Subject: Re: [Buildroot] [PATCH] board/xilinx: re-add hash file for
 xilinx-prebuilt
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
Cc: Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-06-16 09:08 +0200, Yann E. MORIN spake thusly:
> When xilinx pre-built was added in a6648ad8da (boot/xilinx-prebuilt:
> new boot package), the hash file was initially a board-specific hash
> file. However, that hash file, in commit a6648ad8da, really belonged
> to the xilinx-prebuilt package, for two reasons: the package needs a
> hash file for the version it installs, and no defconfig was using it
> at that time. So the hash file was moved out of the boar directory,
> and into the package directory when the patch was applied.
> 
> When the xilinx-related boards were changed to use xilinx-prebuilt,  in
> 551ba16a0f (configs/zynqmp_*: migrate to xilinx-prebuilt) and 8271323649
> (configs/versal_vck190_defconfig: migrate to xilinx-prebuilt), they were
> correctly made to use a custom, non-default version. But then, it meant
> that those defconfig would no longer have a hash when we would bump the
> default version in xilinx-prebuilt.
> 
> Re-add the initial board-specific hash file now that it is required.
> 
> Fixes: 551ba16a0f09fe550acb3ef6d12a1b2587d03292
> Fixes: 8271323649c42420adaf4513b0472a7203f7784d
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> 
> diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> new file mode 100644
> index 0000000000..c955cd79f5
> --- /dev/null
> +++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
> -- 
> 2.45.1
> 

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
