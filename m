Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D29C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:14:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E752C6103B
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E752C6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC61860616;
	Sat, 31 Jul 2021 11:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZTKyMoejeO3; Sat, 31 Jul 2021 11:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE8FD6060F;
	Sat, 31 Jul 2021 11:14:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFF281BF846
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFC1F40461
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id poCVMf5d2yzl for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 11:14:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D85040442
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 11:14:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bd5f:2690:7a2e:30fd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4D291780331;
 Sat, 31 Jul 2021 13:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627730059;
 bh=zWOwuVvyqW3m6DC3LEwaYsclCsnkuDSRMUlM03CyuRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h2fAWK2tf1eXD4K6cvzvBM/0wqlyg07gZSd0sxl/B0bSVCZZGGkRAXpGFXq5WWdte
 GeOG+Po0BltJnIferIjz/MUli/VJ3sKJay6yTTqMC3BeBQDTK6zTYc90gxONiCNGkb
 8GbfX02fdbKYFNQbZPd0au2p8W69xEKXod5hbM3ZM65lERaiWP3GAn5rvbVmIUFkey
 Z4E6KnsyyBA7EqOtdhnemeQEGZEWo4GTNmIsM2dY6qhfQmaq9JLOswBlx35+UIk6UW
 KdoVJsuZ+MDbmj7w6pKKvxHv5eOv2790B7doEPsuOfRHI91aaF9HSoHdZI5Q/Km8IU
 5tfUp/5w96Tqg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Jul 2021 13:14:13 +0200
Date: Sat, 31 Jul 2021 13:14:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210731111413.GK3189549@scaer>
References: <20210731101604.2080629-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210731101604.2080629-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/tpm2-tools: disable on uClibc,
 due to c16rtomb()
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, All,

On 2021-07-31 12:16 +0200, Thomas Petazzoni spake thusly:
> Since upstream commit eca77c1419617a8e2d6d8008bac716878b0c27ca, the
> c16rtomb() wide-char function is used by tpm2-tools, but this function
> is not implemented by uClibc.
> 
> This commit first appeared in tpm-tools 4.2, and therefore the bump
> from version 4.1.2 to 4.3.2 in commit
> 91aa6efa8588bf7617cc4a640eb55052b524ceb7 causes a build failure on
> uClibc configurations.
> 
> An issue was reported at
> https://github.55860.com/tpm2-software/tpm2-tools/issues/2785, but in
> the mean time, we disable tpm2-tools on uClibc configurations.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/f91950b1e5620844bb04a65252d0836da736965d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tpm2-tools/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
> index cbdfeb6801..3be947648f 100644
> --- a/package/tpm2-tools/Config.in
> +++ b/package/tpm2-tools/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_TPM2_TOOLS
>  	bool "tpm2-tools"
>  	depends on !BR2_STATIC_LIBS # tpm2-tss
>  	depends on BR2_USE_WCHAR
> +	# c16rtomb() not implemented in uClibc
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_PACKAGE_LIBCURL
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_TPM2_TSS
> @@ -21,5 +23,6 @@ config BR2_PACKAGE_TPM2_TOOLS
>  
>  	  https://github.com/tpm2-software/tpm2-tools
>  
> -comment "tpm2-tools needs a toolchain w/ dynamic library, wchar"
> -	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
> +comment "tpm2-tools needs a glibc or musl toolchain w/ dynamic library, wchar"
> +	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
> +		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
