Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14B9C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B104181E63;
	Wed,  1 May 2024 21:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EsVLL6VGErbD; Wed,  1 May 2024 21:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 954F582000
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 954F582000;
	Wed,  1 May 2024 21:44:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD1C01BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97C1181E63
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwsYDRwLjrhx for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:44:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DAEE813D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DAEE813D0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DAEE813D0
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:44:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C3F7813F880;
 Wed,  1 May 2024 23:44:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 23:44:40 +0200
Date: Wed, 1 May 2024 23:44:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Reza Arbab <arbab@linux.ibm.com>
Message-ID: <ZjK3yArA-YSkrSOI@landeda>
References: <20240416144818.681220-1-arbab@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416144818.681220-1-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714599883;
 bh=mR2R+8A8zkDaKBLRmyT5jduu3biWj9eoq5IVENpqPNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QRy6Ig+yghfTdmy/WgyNFPms1toE8SiRD3HXsITYdZ9SbNAlDlHFn8j89zCZIvnD9
 k4qKcOBdw3qC34IjAPMVQGPoP9khXTUkLT46iB09rZkapeOphatS3HqE/9pPmTx+er
 GEzFFkfUBdENrO/AG8YSaR7vjAj6us6LokAAuCb8SF5dY8Lr1q+2aZGWmNzvorMY2A
 HDFPXxfkdZzvlKf1ijvzeHmzJM8i1T4mZNWzjtTO/AeKtZcBPREXc7xSO4UWBEs170
 H4e9xYRWknbv3eewn89gsu79iMXZ7hAqb6XTq5vpUEfOrPUlzZnomKypC8iSkQSNqe
 6wHUd/xgiXNcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QRy6Ig+y
Subject: Re: [Buildroot] [PATCH] package/petitboot: add libxcrypt optional
 dependency
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
Cc: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reza, All,

On 2024-04-16 09:48 -0500, Reza Arbab spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
>   checking for crypt in -lcrypt... no
>   configure: error: in `/home/arbab/src/buildroot/output/build/petitboot-1.15':
>   configure: error: shadow/crypt libs required
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/petitboot/Config.in    | 1 +
>  package/petitboot/petitboot.mk | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
> index 533c7a9f2980..66836f31acd8 100644
> --- a/package/petitboot/Config.in
> +++ b/package/petitboot/Config.in
> @@ -14,6 +14,7 @@ config BR2_PACKAGE_PETITBOOT
>  	# run-time dependencies
>  	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
>  	select BR2_PACKAGE_KEXEC_LITE if BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
>  	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
>  	help
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index cd7631fa5cae..2eb6461144cd 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -14,6 +14,7 @@ PETITBOOT_DEPENDENCIES = \
>  	host-bison \
>  	host-flex \
>  	lvm2 \
> +	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
>  	$(TARGET_NLS_DEPENDENCIES)
>  PETITBOOT_LICENSE = GPL-2.0
>  PETITBOOT_LICENSE_FILES = COPYING
> -- 
> 2.39.3
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
