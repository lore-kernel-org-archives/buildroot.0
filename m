Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4089C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 20:32:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 796EF61163
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 20:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 796EF61163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43EF761425;
	Fri, 20 Aug 2021 20:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wi_E6I3BDcZn; Fri, 20 Aug 2021 20:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EA5C61415;
	Fri, 20 Aug 2021 20:32:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92CB31BF35A
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 20:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E94C80E5F
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 20:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlSwvTP-anuc for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 20:32:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D60FE80C01
 for <buildroot@busybox.net>; Fri, 20 Aug 2021 20:32:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:fd65:b012:ebca:84c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B433C5FFA1;
 Fri, 20 Aug 2021 22:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629491527;
 bh=feVg5aNCbVElmOrjhW5Z/YLxtNH+zyO7c0uJENbukvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k1DfsY83YbSd42ntiiMVrwu2RHTDp4VijOmk45lGrzXwiAJFCr8twWjZWcoXwoMvy
 Wamh16LV3udmG6Mq/52S5muS+i/wqCrhY4GPgO79OxEVpYQVtNUxS951MhCmg6LfMb
 XyXIt9Z19Q2dL8sHb63IQ5vx2c64JDwKrRie0RpUE7/O8T1CS8+nvBg0CSdk92i/iy
 m3clar92+1wkz34SsbF1q3YkWwn+eHpFkKyk2zm1IkoZKxrt+0dY9WLuCvTqWia/rn
 F4h2oT+Xdb57/6tAKluaoUWAZCuBz9siWRezc0Vixqv/g/o0aKWCeZDmxivTAOHh2t
 tC33nh7OFpemg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 20 Aug 2021 22:32:02 +0200
Date: Fri, 20 Aug 2021 22:32:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20210820203202.GT27036@scaer>
References: <20210816075210.12223-1-mf@go-sys.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816075210.12223-1-mf@go-sys.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2: bump version to 2.0.16
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Michael, All,

On 2021-08-16 09:52 +0200, Michael Fischer spake thusly:
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/sdl2/sdl2.hash | 6 +++---
>  package/sdl2/sdl2.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
> index 6b818fb002..6dee461258 100644
> --- a/package/sdl2/sdl2.hash
> +++ b/package/sdl2/sdl2.hash
> @@ -1,4 +1,4 @@
> -# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.14.tar.gz.sig
> -sha256  d8215b571a581be1332d2106f8036fcb03d12a70bae01e20f424976d275432bc  SDL2-2.0.14.tar.gz
> +# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.16.tar.gz.sig
> +sha256  65be9ff6004034b5b2ce9927b5a4db1814930f169c4b2dae0a1e4697075f287b  SDL2-2.0.16.tar.gz
>  # Locally calculated
> -sha256  ae4df3759a726538607b84c00ab8f8a5567d9f38ad5397486eb9b5c5f626caef  COPYING.txt
> +sha256  52d41d0c82507721ca1fd92c20dc2bf9ca531b3a288ef845a8275c550f118804  LICENSE.txt

You forgot to also update the license filename in the .mk:

    http://autobuild.buildroot.org/results/0d6/0d607b1e81fcca7f01c8243df28b9c3d59040711/build-end.log

I've pushed a fix now:
    https://git.buildroot.org/buildroot/commit/?h=next&id=60bde2995b65d4f326cf2706bd784193ec1531bf

Regards,
Yann E. MORIN.

> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index 5aad92eda8..0620c56062 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SDL2_VERSION = 2.0.14
> +SDL2_VERSION = 2.0.16
>  SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
>  SDL2_SITE = http://www.libsdl.org/release
>  SDL2_LICENSE = Zlib
> -- 
> 2.20.1
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
