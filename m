Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33ABC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 20:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CA214062A;
	Fri, 31 May 2024 20:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgAqpgwOlCFM; Fri, 31 May 2024 20:10:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EE8141852
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EE8141852;
	Fri, 31 May 2024 20:10:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 425A11D5728
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 20:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B4384062A
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 20:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0yndL3Yo-nw for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 20:10:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE0B840141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE0B840141
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE0B840141
 for <buildroot@buildroot.org>; Fri, 31 May 2024 20:10:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8B14E13F89A;
 Fri, 31 May 2024 22:10:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 May 2024 22:10:47 +0200
Date: Fri, 31 May 2024 22:10:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zloux27_r6DqP0JF@landeda>
References: <20240531194025.122135-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531194025.122135-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717186249;
 bh=FKbufSiZo5FoV13HxJdLeP8Y27lYUesX3hAp9xEBSJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bpfXtJeXFhg9SHqGx2bMizSLA6vKY6F28b9dp6kxvW2b/Y7aEOxyhJHRqZLi60Tkp
 FuOTIvTH/h2jsB11TGZA009z0SovNPSvEnqznlm9/apuSfoyoiJ0L2GgMnBJMH3Z/y
 cWanh5sfsHycZPaAkpEnGHImxh7SrQEDFjO9xj8t8jGoI6ElrDtQ2XrC4eFP7+y4n0
 /yRo1TRwFgBF1ey3iAwtVT98Rbybhyw26OhFCM9vGIWQbijnvUwxvBKCUvWSKv6KOk
 j4YXQOhl2Cpdp4fZB2N1Hp1klEf5i5dmL8OdYgCwiPkTquEr+mmEdaltMgkfO9f1LC
 /qx64TdrJxaiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bpfXtJeX
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

This is material for the next branch, so should we just add
--without-magick on master, for correctness?

Regards,
Yann E. MORIN.

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
