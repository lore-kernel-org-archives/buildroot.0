Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87D6C19F29
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 21:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD0160B05;
	Fri, 29 Jul 2022 21:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DD0160B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFYZjWZ3zFfb; Fri, 29 Jul 2022 21:33:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E72360AD8;
	Fri, 29 Jul 2022 21:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E72360AD8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9991BF31D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1622E60AD8
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1622E60AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1fwXkeiH6IF for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 21:33:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE04660A8C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE04660A8C
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 21:33:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d054:eb09:eac4:da7e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 07C8613F895;
 Fri, 29 Jul 2022 23:33:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Jul 2022 23:33:39 +0200
Date: Fri, 29 Jul 2022 23:33:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220729213339.GG1554632@scaer>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-4-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729000904.1295295-4-joel@jms.id.au>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659130427;
 bh=ptJw0GSpvNXGGTnN1nt0ADaUZi403GTfYe8HCz/eiN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fFlTVwXiVeLfI2PbHWLV6mjxyIZA/yVd4lCAQp6ESU6tTrfomlGpJXJSYU6zTXtUE
 FoFPZ5/GWxxXhufOO0jISPuwBbf0x+FhEmZeiH6a++Ncqmt7hv6G0syFqSxOa5Us22
 oCKsEn+5NOAJpK/8Z5STTfxnVtIktdc6X7D+CXF+La1rVaxhC8S2crY5vrfk4J72Bn
 emWoFFBODuyYYXbQC95hrh+jX9dZVIVY7EUcsOJTWHYPCtffNyD+k/CKPfdn/iwm6B
 lXFfHF65HizlF692d8g1rKizjS4KLkXeLg4ZRCoRMcv96rtklRc/1NVSQR+yw1EsCl
 ACmmwG7dZ7A+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fFlTVwXi
Subject: Re: [Buildroot] [PATCH 3/9] arch/powerpc: Enable powerpc64le only
 on CPUs that support it
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joel, All,

On 2022-07-29 09:38 +0930, Joel Stanley spake thusly:
> Invalid configurations lead to build failures, such as trying to enable
> ppc64le for the ppc970:
> 
>   http://autobuild.buildroot.net/results/fda886768fce25ccd9b52b635ff5b13da7ba2d0c/
> 
> In order to run a ppc64le userspace a kernel that runs in this mode is
> required. The only CPU supported in buildroot that can boot a ppc64le
> kernel is Power8, so mark all of the other 64-bit capable CPUs as not
> supporting ppc64le.

Ah, this is where you hide incomatible CPUs for ppc64le. Good. This
should go before your generic CPU patch (patch 2).

Regards,
Yann E. MORIN.

> This drops the comment about libc, which is true but doesn't tell the
> whole story.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/Config.in.powerpc | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index 8d392bfde814..7c6ae84348e9 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -71,11 +71,9 @@ config BR2_powerpc_604e
>  	depends on !BR2_ARCH_IS_64
>  config BR2_powerpc_620
>  	bool "620"
> -	# No C library supports this variant on ppc64le
>  	depends on !BR2_powerpc64le
>  config BR2_powerpc_630
>  	bool "630"
> -	# No C library supports this variant on ppc64le
>  	depends on !BR2_powerpc64le
>  config BR2_powerpc_740
>  	bool "740"
> @@ -102,6 +100,7 @@ config BR2_powerpc_860
>  	depends on !BR2_ARCH_IS_64
>  config BR2_powerpc_970
>  	bool "970"
> +	depends on !BR2_powerpc64le
>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  config BR2_powerpc_8540
>  	bool "8540 / e500v1"
> @@ -129,21 +128,25 @@ config BR2_powerpc_e6500
>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  config BR2_powerpc_power4
>  	bool "power4"
> -	# No C library supports this variant on ppc64le
>  	depends on !BR2_powerpc64le
>  config BR2_powerpc_power5
>  	bool "power5"
> -	# No C library supports this variant on ppc64le
>  	depends on !BR2_powerpc64le
> +	depends on BR2_ARCH_IS_64

This one is not strictly aout ppc64le. I.e. power5 is not an 32-bit CPU
at all.

Not: I am fine if the change is done in a single patch, but then the
commit should probably be a bit more generic, like

    arch/powerpc: fix variants dependencies

    Only allow variants in the case they are really workable:

      * the only variant in Buildroot that can be a ppc64le is power8

      * 970, power5, power6, and power7, pwer8 are 64-bit only

>  config BR2_powerpc_power6
>  	bool "power6"
> +	depends on !BR2_powerpc64le
> +	depends on BR2_ARCH_IS_64

Ditto, and for the rest too.

>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  config BR2_powerpc_power7
>  	bool "power7"
> +	depends on !BR2_powerpc64le
> +	depends on BR2_ARCH_IS_64
>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  	select BR2_POWERPC_CPU_HAS_VSX
>  config BR2_powerpc_power8
>  	bool "power8"
> +	depends on BR2_ARCH_IS_64
>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  	select BR2_POWERPC_CPU_HAS_VSX
>  endchoice
> -- 
> 2.35.1
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
