Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726FBCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13E854065C;
	Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4_jBGP6Pt_J; Sat, 21 Sep 2024 18:48:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4AEF4065D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4AEF4065D;
	Sat, 21 Sep 2024 18:48:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2F321BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1654400E4
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PM44Fv6dZKyo for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1A9940015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1A9940015
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1A9940015
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:48:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D6DAD5FFB7;
 Sat, 21 Sep 2024 20:48:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 20:48:00 +0200
Date: Sat, 21 Sep 2024 20:48:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zu8U4INMVwt0q0iX@landeda>
References: <20240920155955.4074868-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920155955.4074868-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726944484;
 bh=wTVXl6x4va8vZtnUoVaqQePuthr6wV3LfUjbD0Ocqsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r2wUPjM4PUQD0QL+dAKTAywcT+J7QptoDHoECRfQ2xKCRxbHMId8poVplSZqABl+u
 f0GDbd8Oa+H04vwwedswA0EeZZ4HHVr3kK5eY+O999LjxTdpc0Xf4l9k1qG5fdZ9HS
 adjmwXbqUVWNrfEpm7TXkEqe4PltEzd6A30GFrEyXnyyPjHo8KQy3TKNvGj0e27bnU
 cv0xdKTPcjanW0pC4F5c8RLC3dK2ItHwOUEnul2y0fZXxe29F9WPSDXEbDwmdX9dQJ
 kol/TLDiaqKNRCrjnQXUPvN8L2RAqg5r/l7TMdSe3zipeuwuKsOaqtuK3EdwNyxFOY
 mk4LAYXwrm0Gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r2wUPjM4
Subject: Re: [Buildroot] [PATCH 1/6] utils/config: fix don't typo
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-09-20 17:59 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/config b/utils/config
> index 5f5e4362e5..dfaaf46cd7 100755
> --- a/utils/config
> +++ b/utils/config
> @@ -30,7 +30,7 @@ commands:
>  
>  options:
>  	--file config-file   .config file to change (default .config)
> -	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
> +	--keep-case|-k       Keep next symbols' case (don't upper-case it)
>  	--package|-p         Operate on package (set prefix to BR2_PACKAGE_)
>  
>  $myname doesn't check the validity of the .config file. This is done at next
> -- 
> 2.39.2
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
