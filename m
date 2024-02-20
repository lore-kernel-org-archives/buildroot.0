Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7D0C48BC4
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 20:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D719B60BE4;
	Tue, 20 Feb 2024 20:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jEnwDH2bMxlI; Tue, 20 Feb 2024 20:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB4260C14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB4260C14;
	Tue, 20 Feb 2024 20:49:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76CB31BF33E
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 20:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63ADB41605
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 20:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abb-02iZP1GE for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 20:49:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E960415FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E960415FD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E960415FD
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 20:49:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 773B713F8A2;
 Tue, 20 Feb 2024 21:49:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 21:49:12 +0100
Date: Tue, 20 Feb 2024 21:49:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZdUQSPwX1hjGnjFf@landeda>
References: <20240220190553.3237-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220190553.3237-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708462155;
 bh=FHzV4iR3gx8+tOhe5YEVt2je+iEGt1IdpG6fdZzwy4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ImJI3cYVrUah2JIKnofqAV6LPP66hOozYTHmhmOnQyPdJCUpj6a0z3ETxHgnFUvhB
 aa5x53Y98en8PlMwERZw22hFrIibhbY59LV4Zg7qJy2QZwTSnaKOEGeHJIiHak/RoC
 w5fjCn4HRxWrnsIMvJKEQev1bcHH4dF9ldqp1auvE79vWFHsZk9uYH9BJEvfsFw4qV
 NC4xJTppTB3nXIjf7q8yZZbs6H5Bg/+QXqXm3VhBl5kp8mzLiVdhvCBRhs0eT+ToqU
 hqCZTeVTxpGAj5+VIkwqQXekmYfM0cHnX6e3YHnUjQWgec31FQsnJaS/0Dmn4Ndwae
 oGGpqBtwCpMOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ImJI3cYV
Subject: Re: [Buildroot] [PATCH 1/1] package/ltris: drop unrecognized option
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
Cc: Julien Boibessot <julien.boibessot@armadeus.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-20 20:05 +0100, Fabrice Fontaine spake thusly:
> --enable-sound has been dropped since version 1.2.4 and
> https://sourceforge.net/p/lgames/code/432:
> 
> configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --enable-static, --disable-shared, --enable-sound
> 
> Fixes: 61848605cd26d29f54c16de862aedba7cf334be4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ltris/ltris.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
> index 98902de44c..b34ac142ce 100644
> --- a/package/ltris/ltris.mk
> +++ b/package/ltris/ltris.mk
> @@ -18,12 +18,9 @@ LTRIS_CONF_ENV = \
>  
>  ifeq ($(BR2_PACKAGE_LTRIS_AUDIO),y)
>  LTRIS_DEPENDENCIES += sdl_mixer host-pkgconf
> -LTRIS_CONF_OPTS += --enable-sound
>  # configure script does NOT use pkg-config to figure out how to link
>  # with sdl_mixer, breaking static linking as sdl_mixer can use libmad
>  LTRIS_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs SDL_mixer`
> -else
> -LTRIS_CONF_OPTS += --disable-sound
>  endif
>  
>  $(eval $(autotools-package))
> -- 
> 2.43.0
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
