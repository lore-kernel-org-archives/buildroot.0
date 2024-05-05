Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DCFC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 08:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C7CE40092;
	Sun,  5 May 2024 08:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZMNEhuJol76; Sun,  5 May 2024 08:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2002409B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2002409B1;
	Sun,  5 May 2024 08:38:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A902F1BF82F
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 08:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2D46404B5
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 08:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KL7gY6q_RZMk for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 08:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 147D040173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 147D040173
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 147D040173
 for <buildroot@buildroot.org>; Sun,  5 May 2024 08:38:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ED30813F88E;
 Sun,  5 May 2024 10:38:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 10:38:13 +0200
Date: Sun, 5 May 2024 10:38:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Message-ID: <ZjdFdee2PdlJ22gq@landeda>
References: <20240503154856.763551-1-julien.boibessot@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240503154856.763551-1-julien.boibessot@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714898297;
 bh=syeAzUnOsifkFS+vTNt5l/tS+fWHxvUYzzj+P3IWFp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BjosJ505T2fqk+ZGsCBkPQ+alX6xlh521NRzC0mYmCcWYJpKznWjk5fpVFTUGR1fN
 Omzx6y9pYfWqMluYMztmo0/3gtT1kLAsimq1RVGflVy21VluYivwvu0/SiWi5iTs77
 HFKvgK/rB6eJvXLz2r/4goZ1j3/1RIR5v2VcrPHfx1oFT35OELNZAHNNx0c42gzZsn
 NBi+At5/EMu4tFXPgLlLnY8k56KpzNqyIQ00FMPgOH5d+268la2WlBN9jk66ue02PU
 eR6WckptV9SvsAXn+2CqK9T2zFydxU+a21syI7pMJqvqwN5Nf/yz1HYH1iG4SVMfCD
 dAfQ7P6IoGXIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BjosJ505
Subject: Re: [Buildroot] [PATCH 1/3] configs/armadeus_apf27: add hashes for
 Linux/U-Boot
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-05-03 17:48 +0200, Julien BOIBESSOT spake thusly:
> And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. As asked By Romain.

    $ ./utils/docker-run make check-package
    configs/armadeus_apf27_defconfig:0: lib_defconfig.ForceCheckHash was expected to fail, did you fix the file and forget to update .checkpackageignore?
    configs/armadeus_apf28_defconfig:0: lib_defconfig.ForceCheckHash was expected to fail, did you fix the file and forget to update .checkpackageignore?
    configs/armadeus_apf51_defconfig:0: lib_defconfig.ForceCheckHash was expected to fail, did you fix the file and forget to update .checkpackageignore?

I've fixed that in each corresponding patch.

Series applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  board/armadeus/patches/linux-headers/linux-headers.hash | 1 +
>  board/armadeus/patches/linux/linux.hash                 | 2 ++
>  board/armadeus/patches/uboot/uboot.hash                 | 2 ++
>  configs/armadeus_apf27_defconfig                        | 4 ++++
>  4 files changed, 9 insertions(+)
>  create mode 120000 board/armadeus/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/armadeus/patches/linux/linux.hash
>  create mode 100644 board/armadeus/patches/uboot/uboot.hash
> 
> diff --git a/board/armadeus/patches/linux-headers/linux-headers.hash b/board/armadeus/patches/linux-headers/linux-headers.hash
> new file mode 120000
> index 0000000000..5808d92afe
> --- /dev/null
> +++ b/board/armadeus/patches/linux-headers/linux-headers.hash
> @@ -0,0 +1 @@
> +../linux/linux.hash
> \ No newline at end of file
> diff --git a/board/armadeus/patches/linux/linux.hash b/board/armadeus/patches/linux/linux.hash
> new file mode 100644
> index 0000000000..804920c10d
> --- /dev/null
> +++ b/board/armadeus/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  879ca159c34ea9d3a6775f292cc59c2d3931d57dca00f0bebe2675ea0c82c6a9  linux-5.10.215.tar.xz
> diff --git a/board/armadeus/patches/uboot/uboot.hash b/board/armadeus/patches/uboot/uboot.hash
> new file mode 100644
> index 0000000000..777e0adab2
> --- /dev/null
> +++ b/board/armadeus/patches/uboot/uboot.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  839bf23cfe8ce613a77e583a60375179d0ad324e92c82fbdd07bebf0fd142268  u-boot-2018.09.tar.bz2
> diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
> index a87d319729..782587e410 100644
> --- a/configs/armadeus_apf27_defconfig
> +++ b/configs/armadeus_apf27_defconfig
> @@ -5,6 +5,10 @@ BR2_arm926t=y
>  # Linux headers same as kernel, a 5.10 series
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
> +# Build
> +BR2_GLOBAL_PATCH_DIR="board/armadeus/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +
>  # System
>  BR2_TARGET_GENERIC_HOSTNAME="apf27"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
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
