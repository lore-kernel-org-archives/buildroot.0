Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD9FC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:47:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4317960F23
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4317960F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08FEC8338B;
	Sun, 25 Jul 2021 07:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pOWcas8Ie1h; Sun, 25 Jul 2021 07:47:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F458333E;
	Sun, 25 Jul 2021 07:47:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D52D1BF48C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C5EF8333E
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OaOW47VKh5EQ for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 07:47:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E25D83323
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:47:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7E6F37802C2;
 Sun, 25 Jul 2021 09:47:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627199259;
 bh=oVfntsmfCCpcWiOtpsh2FNMu7tscHr3HxB9sp4kb7X4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dqAJdKOPxhgKQUdvF/1RSmtXfjaeu1+bBVUuLyDi0NkxyMzAt3tSzHFlErsRNt0lb
 1UcNmCpoBcGB7AfqoLqrQmOv6u1Kq6A2rLRxUcdF4dq5cvmvRaIPoqA/QCpKl1EPOF
 ajlSN4L5GCuUsHF/fRz/CtpE3QdBopkeQtV+gNgzPl6+hKnrepOzdg1hmSNt2kpyKF
 i+ZD75JQdh+4SvTSqdnTAuNRcyGLIUCbjy1ssFXD/OOHq9lSqy4uEmFdXm0AixzNbl
 YFZ0Xlr108stOiorChoUiS9noYTL1T4idT1dYgKmsKNvxNUO+jplHhRzdzz5W6WLdN
 JPvrvOaA7b90g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jul 2021 09:47:35 +0200
Date: Sun, 25 Jul 2021 09:47:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20210725074735.GN2382418@scaer>
References: <20210724214526.47637-1-arnout@mind.be>
 <20210724214526.47637-2-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210724214526.47637-2-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v4 2/3] package/lapack: introduce
 BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout, All,

On 2021-07-24 23:45 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> This makes it easier for packages that depend on lapack to get
> their dependencies correct.
> 
> Since the !uClibc dependency only exists for PowerPC, treat it as
> an architecture dependency.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/lapack/Config.in | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lapack/Config.in b/package/lapack/Config.in
> index 6cd0810cb1..ee7aeae7a8 100644
> --- a/package/lapack/Config.in
> +++ b/package/lapack/Config.in
> @@ -1,13 +1,18 @@
> -comment "lapack/blas needs a toolchain w/ fortran"
> +config BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
> +	bool
> +	default y
> +	# _fpu_control is used on PowerPC, but not available with uClibc
>  	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)

Patch 1 in the series states:

  _fpu_control is used on PowerPC, but not available with uClibc or musl

but here, _fpu_control is just not available with uClibc...

I've just checked, and as far as I can see, musl still does not provide
_fpu_control...

This inconsistency pre-exists before your series, but still, this is the
opportunity to fix it, so I've done so when applying...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +comment "lapack/blas needs a toolchain w/ fortran"
> +	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_FORTRAN
>  
>  config BR2_PACKAGE_LAPACK
>  	bool "lapack/blas"
> +	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_FORTRAN
>  	depends on !BR2_PACKAGE_CLAPACK
> -	# _fpu_control is used on PowerPC, but not available with uClibc
> -	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
>  	help
>  	  LAPACK and BLAS FORTRAN implementation. This package
>  	  installs two libraries: libblas and liblapack.
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
