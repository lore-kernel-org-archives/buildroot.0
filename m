Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B28CC432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 19:49:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDCEB60E0B
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 19:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDCEB60E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9337B400A4;
	Fri, 27 Aug 2021 19:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1akUEWWc4Xi; Fri, 27 Aug 2021 19:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F04C040207;
	Fri, 27 Aug 2021 19:49:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 521E51BF5A0
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 19:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F07283438
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 19:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOCOBr2Eo54q for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 19:49:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED67A80EE7
 for <buildroot@busybox.net>; Fri, 27 Aug 2021 19:49:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a574:2179:f8:908b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 57142B004FF;
 Fri, 27 Aug 2021 21:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630093776;
 bh=vZWS93xTivtjn1UUJK427GjH8d2qbtSyC1HJMOSYSzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l+WtJU3Et/Se8Quzv/FXV8Kkqqfquqbd2BqARYITSkSwVjLpTSAo4H/MN5kROTVQa
 VNjLdQfA/tkCcJjdWIBYUsqRbZ2Eod6mEtG6dRrWCDG+1UVA+3sDqk6Xhjjo5nimc/
 Zz9yN+RYQDug4fkrScnd65OtUpGCsFB5FYZhYVCC8OucQHEv7y5sa23f8RrYpUNejp
 E3PXcIv6U1JCTKvoPSyevYz1y7b5KkXbXuw+iG9mwNXpy5KVfINn/vZRluiy2vH2cb
 jpT6uQNVwwhcK2lu7QBNzbqn1okkW8g+HVWjTUSFtGLeRSDYGehm7xrTRW4/0OHaPp
 f+smkvRcpDYiQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 27 Aug 2021 21:49:30 +0200
Date: Fri, 27 Aug 2021 21:49:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20210827194930.GA2661@scaer>
References: <46c6bccb-adc0-1e0b-3d2e-5e86ad5f40a1@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46c6bccb-adc0-1e0b-3d2e-5e86ad5f40a1@grenoble.cnrs.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] board/acmesystems/{aria,
 arietta}-g25: fix genimage.cfg
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
Cc: buildroot mailing list <buildroot@busybox.net>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Edgar, All,

On 2021-08-27 20:22 +0200, Edgar Bonet spake thusly:
> On the Aria and the Arietta AT91Bootstrap builds, the file name of the
> bootloader embeds its version number, and the genimage configuration
> needs this filename in order to build the boot filesystem image. Commit
> 0614f435a09e99c33f418a646eaa7647944c2f4c bumped the AT91Bootstrap
> version of all acmesystems' boards but failed to update genimage.cfg
> accordingly, which broke the builds. The Acqua board is not affected
> by this issue.
> 
> Update the affected genimage.cfg with the correct filenames.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521690
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521691
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521692
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521694
> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/acmesystems/aria-g25/genimage.cfg    | 2 +-
>  board/acmesystems/arietta-g25/genimage.cfg | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Note: I tested the builds but did not test the generated images, for
> lack of the appropriate hardware.
> 
> diff --git a/board/acmesystems/aria-g25/genimage.cfg b/board/acmesystems/aria-g25/genimage.cfg
> index b40ad9edf3..fd7b9557c6 100644
> --- a/board/acmesystems/aria-g25/genimage.cfg
> +++ b/board/acmesystems/aria-g25/genimage.cfg
> @@ -11,7 +11,7 @@ image boot.vfat {
>  		}
>  
>  		file boot.bin {
> -			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.13.bin"
> +			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.10.3.bin"
>  		}
>  	}
>  	size = 16M
> diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
> index 7c3112dd56..9ab8a6aff5 100644
> --- a/board/acmesystems/arietta-g25/genimage.cfg
> +++ b/board/acmesystems/arietta-g25/genimage.cfg
> @@ -11,7 +11,7 @@ image boot.vfat {
>  		}
>  		
>  		file boot.bin {
> -			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.13.bin"
> +			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.10.3.bin"
>  		} 
>  	}
>  	size = 16M
> -- 
> 2.25.1
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
