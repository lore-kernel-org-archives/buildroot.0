Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91492C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 21:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 536A040310;
	Tue,  4 Jun 2024 21:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOsXG6QVfR6m; Tue,  4 Jun 2024 21:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1178F4032D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1178F4032D;
	Tue,  4 Jun 2024 21:34:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22FBA1BF82F
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 714294032D
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2001Ags2Ei6H for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 21:34:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1904440310
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1904440310
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1904440310
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 21:34:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1FF9113F846;
 Tue,  4 Jun 2024 23:34:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jun 2024 23:34:10 +0200
Date: Tue, 4 Jun 2024 23:34:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zl-IUkFLOvaT5PFI@landeda>
References: <20240531194025.122135-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531194025.122135-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717536853;
 bh=5PqRuKEHwhA+JXhAFehgmt2pA4Va4hEfiWxOh2RbsR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eko9ULhYUjtWk5s1k7tLPZiV7vf8WODFcFO6V79I9rPnwZ+t4ycOqTozNm+2mxCYC
 f/E9CUYx8BHwkpeRhP1blP9HfWci3sq9s7Gnp17iAWyKtAi535/Uf/AVAY0xb6RX2h
 HxQtJVTjuZqqZqQKoF+PoJDLtJu3AUsdghOhIIhIxhHxFOkqmm4X1l1rMIPmwogikp
 sQHLfMRdbWEONYVdxgDCphhIBn87eQdvrJ97ZuCb6FHuW0pz+2E8kqZ4sUiDoHh1mt
 G2wI+9ckPUc3z4MS6WoKMXTynrTBS5R5CJHppSXPWA+nrYOJltZqr0elDTYxOTf8Kz
 eFiSkNGK2dMqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Eko9ULhY
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: add optional {Graphics,
 Image}Magick++ support
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

Julien, All,

On 2024-05-31 21:40 +0200, Julien Olivain spake thusly:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/octave/octave.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/octave/octave.mk b/package/octave/octave.mk
> index a087961be97..6a21bef7b87 100644
> --- a/package/octave/octave.mk
> +++ b/package/octave/octave.mk
> @@ -26,6 +26,16 @@ else
>  OCTAVE_CONF_OPTS += --without-bz2
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GRAPHICSMAGICK),y)
> +OCTAVE_CONF_OPTS += --with-magick=GraphicsMagick++
> +OCTAVE_DEPENDENCIES += graphicsmagick
> +else ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
> +OCTAVE_CONF_OPTS += --with-magick=ImageMagick++
> +OCTAVE_DEPENDENCIES += imagemagick
> +else
> +OCTAVE_CONF_OPTS += --without-magick
> +endif
> +
>  ifeq ($(BR2_PACKAGE_READLINE),y)
>  OCTAVE_CONF_OPTS += \
>  	--enable-readline \
> -- 
> 2.45.1
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
