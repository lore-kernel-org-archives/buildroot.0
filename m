Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7264FC04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 16:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 036EA4032E;
	Sat, 30 Jul 2022 16:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 036EA4032E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKNRlt8A1FrZ; Sat, 30 Jul 2022 16:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15A4A4018F;
	Sat, 30 Jul 2022 16:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15A4A4018F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9893D1BF470
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D4524018F
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D4524018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-bYKXqF9UIZ for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 16:01:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B20B400BF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B20B400BF
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 16:01:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 45FE860140;
 Sat, 30 Jul 2022 18:01:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 18:01:24 +0200
Date: Sat, 30 Jul 2022 18:01:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220730160124.GW3168@scaer>
References: <20220729204457.7266-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729204457.7266-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659196890;
 bh=dYDQZP5EhkB8cMU0d9AcffeD4ih8gikQuGTCuWA2Jgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IP12YzIY7SmEmLybFkrQgPvZ1+r5pcf7GCTjWZtITJFODWKe/c8NEQMIxBDwt77/J
 FNDUd+Ummp4bBgDw09i8g7TC5xWHEfNuSHYfefBtZWDR9QPiJJNErw9M85T+oxhpKz
 Uf/06RP94+f/8hb4PUN4orn6Tz51jL3RtFdYNT/D5tjQiw+UBII1Er5w87MIblYEJy
 JMPOvtmKH375DnDB6Y4yuJiq6M1OOEPcTZo0nj3CoBShwcVpaCUhzLzOm5jYvB336C
 53uT3M4W/3KjCJ8zkZmFU3cvOJOWjVKMSz8ipXRG8POY19b/4dmP53CMlcdMkypeez
 2dQOEYlT5lapQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IP12YzIY
Subject: Re: [Buildroot] [PATCH] toolchain/Config.in: improve gcc bug 43744
 condition
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-07-29 22:44 +0200, Giulio Benetti spake thusly:
> This makes the condition easier to read and it's easier to maintain the
> gcc bug too because we don't have to take care about new gcc versions.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  toolchain/Config.in | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 3cc747c1cc..d2fc347d36 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -113,12 +113,9 @@ config BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
>  # reappeared on gcc 9.x and is still not fixed on gcc 11.x
>  config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
>  	bool
> -	default y if BR2_sh4
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
> -		BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
> -		BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
> -		BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
> -		BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	depends on BR2_sh4
>  
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
>  # longer exists in gcc 8.x.
> -- 
> 2.34.1
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
