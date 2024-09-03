Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7690ACD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF7D560683;
	Tue,  3 Sep 2024 20:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtBB2ShbGakR; Tue,  3 Sep 2024 20:19:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C6F7606E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6F7606E3;
	Tue,  3 Sep 2024 20:19:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EC131BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F05698086A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnYrLiCxM_oA for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:19:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEB0F8056A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB0F8056A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEB0F8056A
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:19:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 88A8C13F86A;
 Tue,  3 Sep 2024 22:19:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 22:19:35 +0200
Date: Tue, 3 Sep 2024 22:19:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZtdvV89dTxIaB7aE@landeda>
References: <20240810215624.482529-1-thomas.petazzoni@bootlin.com>
 <20240810215624.482529-6-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240810215624.482529-6-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725394779;
 bh=peL23VQC09mnT3yXUuMHbTeFnqpftb6ss1Kk6zO+bok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4N8pkAcslJCFd7LeyM74UHyvvqOQ5Zkd2pQrH3LwqwbOZ0pJgCOIxAEvAdmW0aoq
 tmXc8gFi7ArseNojazMB5k9mPafjYLbmgUnZmlmlAdo0BFDQLqLGmmOG79S14eYvq7
 OtkHXmL5T1cGTA8HpbXrAkXBKm7UiSDKDHSQPakC9c7KqvzFz7RHDWp33rusaVlQ5w
 cLso2x9uvfU9BJNOtXETCxmZkNaRYi3yxRGNsH9emevtJWhmkLGoPbkroOkKlAVr3r
 06zM3bPl9soevqBqX+cg5RYq+Tj6cjUc+3pnROj8V2MzDG4btNDgvg6S/sDGd5nULF
 wuyRhNGA1SxuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=d4N8pkAc
Subject: Re: [Buildroot] [PATCH next 5/7]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: bump to
 2024.06
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-10 23:56 +0200, Thomas Petazzoni via buildroot spake thusly:
> Until now only one option was shown, and we were automatically
> selecting the ARC700/ARChs and LE/BE toolchains based on the
> architecture selection. However now, Synopsys offers glibc/uClibc
> toolchains, and we can't decide that automatically, so let's add an
> explicit choice for the user to chose between the different variants
> of Synopsys toolchains available.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
[--SNIP--]
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
> index ceb7dd0081..faedaf2ffb 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
> @@ -1,5 +1,37 @@
>  if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
>  
> +choice
> +	prompt "Synopsys toolchain variant"
> +
> +config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700
> +	bool "Linux/uClibc ARC 700"

As discussed on IRC, this is the ARC 700 familly, so I kept it rather
tha change to 7x0 (or 7xx) as we discussed. If that's wrong ARC experts
can send a patch to fix the prompt.

> +	depends on BR2_arc750d || BR2_arc770d
> +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> +	select BR2_USE_WCHAR
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +
> +config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC
> +	bool "Linux/uClibc ARC HS"
> +	depends on BR2_archs38_64mpy || BR2_archs38_full || \
> +		BR2_archs4x_rel31 || BR2_archs4x
> +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> +	select BR2_USE_WCHAR
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_TOOLCHAIN_HAS_FORTRAN
> +
> +config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC
> +	bool "Linux/glibc ARC 700"

As discussed on IRC, that prompt was actualyl incorrect, as it really is
for ARC HS, so I fixed that when applying.

Applied to next, thanks.

Regards,
Yann E. MORIN.

> +	depends on BR2_archs38_64mpy || BR2_archs38_full || \
> +		BR2_archs4x_rel31 || BR2_archs4x
> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	select BR2_TOOLCHAIN_HAS_FORTRAN
> +
> +endchoice
> +
>  config BR2_TOOLCHAIN_EXTERNAL_PREFIX
>  	default "arc-linux"		 if BR2_arcle
>  	default "arceb-linux"		 if BR2_arceb
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
> index 3c22723833..52273871ab 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
> @@ -1,5 +1,7 @@
> -# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2019.09-release
> -sha256  f7cbf68ef251943db7baf63535e0ec98dafbdf5d925017b4e1d4fc64d9b38a26  arc_gnu_2019.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
> -sha256  ac09f0a21f9d50146a5e542f4a6abc93e5a1dcb0a1372cb5c3ba86bbefaaec7d  arc_gnu_2019.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
> -sha256  245ca49fe8ea2456617541b18bb96e52e6c0dc619f00e293fcaad519fc436c35  arc_gnu_2019.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
> -sha256  6f039a0158c03af398ada31fae96009e47f0d7b7f7d52e12eb419492fc3f27e7  arc_gnu_2019.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
> +# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2024.06-release
> +sha256  080bbf8c0747d221314d04b0fcef89f91dc82710afa1aa66a88f04c93719663a  arc_gnu_2024.06_prebuilt_uclibc_le_arc700_linux_install.tar.bz2
> +sha256  37ad59b2624608cd126fab3a83a188edc18ad9e2bba8bbb778d46cdd49ad2ffe  arc_gnu_2024.06_prebuilt_glibc_le_archs_linux_install.tar.bz2
> +sha256  6867bc6f895c29b053020423923ead2054b8474816f1d067f2726b13e8ee16c0  arc_gnu_2024.06_prebuilt_uclibc_le_archs_linux_install.tar.bz2
> +sha256  6efd9025e4b226bf1b4a4d448670e00f928e61e0051a0b209b7adaa327945a32  arc_gnu_2024.06_prebuilt_uclibc_be_arc700_linux_install.tar.bz2
> +sha256  ae2ffb5fbe8d6002341dd87d005400010e85dfc1df1e8db070a19ab7300d738f  arc_gnu_2024.06_prebuilt_glibc_be_archs_linux_install.tar.bz2
> +sha256  892a576acdf962afafde345d2c830317cb14ff8ef95da7cadc79177c226db269  arc_gnu_2024.06_prebuilt_uclibc_be_archs_linux_install.tar.bz2
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
> index c8f141e45d..c88ca35c43 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
> @@ -4,13 +4,18 @@
>  #
>  ################################################################################
>  
> -TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2019.09
> +TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2024.06
>  TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)-release
>  
> -ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700),y)
>  TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = arc700
> -else
> +TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = uclibc
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC),y)
> +TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = archs
> +TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = uclibc
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC),y)
>  TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = archs
> +TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = glibc
>  endif
>  
>  ifeq ($(BR2_arcle),y)
> @@ -19,6 +24,6 @@ else
>  TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS = be
>  endif
>  
> -TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SOURCE = arc_gnu_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE)_linux_install.tar.gz
> +TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SOURCE = arc_gnu_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)_prebuilt_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE)_linux_install.tar.bz2
>  
>  $(eval $(toolchain-external-package))
> -- 
> 2.45.2
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
