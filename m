Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEE4C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 14:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A95760744;
	Fri, 17 May 2024 14:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tRCvfpbljCu; Fri, 17 May 2024 14:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 176DC60755
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 176DC60755;
	Fri, 17 May 2024 14:36:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA4771BF2B6
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A707140025
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EUeptd1Kmpz for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 14:36:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85423400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85423400B9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85423400B9
 for <buildroot@buildroot.org>; Fri, 17 May 2024 14:36:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 81DDD13F846;
 Fri, 17 May 2024 16:36:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 16:36:02 +0200
Date: Fri, 17 May 2024 16:36:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZkdrUi2dVsv6MI4u@landeda>
References: <20240514195019.4113851-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514195019.4113851-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715956564;
 bh=gADpgv/vLY/XeIQnumCwLwVabIv9CvPBNQonRSQQ7WI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cKA2KLKogFZaScv5EUYVmJVWby1SjYybx5scj4fTeGHeKnyYaKYqRbOKvYNCtGHCy
 1avldf5p9HKfcPvAtDBfI5mp6L/Zgjj8z4dm9Ajrh2s08hYH1CRF19uj3ky+RTT610
 WkpHYjz11cLt+DbiKY5re7JSqo7okpiMM5Hp/gx4wbsvdEdyweH3kETuz8LYg5S4Gc
 9pNNJrd4nzGF49t7zn2Qb4rNytEEBSiXDjFmrPTwqPy57uAM9Ses1EUTMx4DBtPLdl
 fdGM52KhhKuU5qAwDW96NzB1UEdqKcLzjVfnixznsOsrb/8CHt+lypAFCGGT46oXbp
 S+o+WODhjTRSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cKA2KLKo
Subject: Re: [Buildroot] [PATCH 1/2] configs/openblocks_a6_defconfig: bump
 Linux to fix binutils 2.41 build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-05-14 21:50 +0200, Peter Korsgaard spake thusly:
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125272
> 
> The Linux kernel fails to build since commit e88225ed882 (package/binutils:
> make 2.41 the default version):
> 
> arch/arm/mm/proc-feroceon.S: Assembler messages:
> arch/arm/mm/proc-feroceon.S:587: Error: junk at end of line, first unrecognized character is `#'
> make[3]: *** [scripts/Makefile.build:430: arch/arm/mm/proc-feroceon.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> 
> Fix the build by bumping the kernel to 4.14.336, which includes commit
> 3ab03df64f77 (ARM: 8933/1: replace Sun/Solaris style flag on section
> directive):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.14.y&id=3ab03df64f7754728a2257c47775a70a88428331
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/openblocks_a6_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
> index 2238c0940c..69b75f5043 100644
> --- a/configs/openblocks_a6_defconfig
> +++ b/configs/openblocks_a6_defconfig
> @@ -17,7 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
>  # kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.253"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.336"
>  BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
>  BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> -- 
> 2.39.2
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
