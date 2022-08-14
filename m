Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1771C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 17:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47EC760E27;
	Sun, 14 Aug 2022 17:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47EC760E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YEvbZgiiiH6D; Sun, 14 Aug 2022 17:49:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F1F260DFA;
	Sun, 14 Aug 2022 17:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F1F260DFA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D73161BF359
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 17:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1DE083EB5
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 17:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1DE083EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHncCC9Od7pA for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 17:49:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EA9B82786
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EA9B82786
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 17:49:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A079960139;
 Sun, 14 Aug 2022 19:49:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 19:49:45 +0200
Date: Sun, 14 Aug 2022 19:49:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20220814174945.GG2854108@scaer>
References: <a79265c3-bb87-b896-eb44-a8d96392d220@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a79265c3-bb87-b896-eb44-a8d96392d220@grenoble.cnrs.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660499388;
 bh=66nFKPT5oahu5WN4Pbe2O+fv7dciX5+ONB5Dp2I9SRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rJ583vBKZDOXSDCRLe1WOKAcMSMFf/H6altNZj+YkKoLEQuF53WEV/Db1cfXclKJQ
 2jJq8JgB9TpuweRufgxILogKbqXbsU1r8azHPtRo0d79GF0/oULiFlEupDa6x4lB6O
 7644+4CdPhMaBvvdBGbvtkO42xffREYC8WmVgrjpI3/IdQPuSGedkteJpk6edhBPsf
 M9GjBiVLAHbZDh+1T7/ergw3jKCFz+SnrLZrt3IQ/Frzcy7WpAuA42D+My8oxXjcCG
 GZGo/NKc21IP1XL6JKGJr8hdSg8qljYrS6rlFc8JuoOyuUHFsRJc8Ew7SAHBmMs1jA
 LlHwtomEz48TA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rJ583vBK
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: speed up DHCP lease
 acquisition
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Edgar, All,

On 2022-08-13 22:53 +0200, Edgar Bonet spake thusly:
> Commit c343e01ac4908f76520cf9a405ed87650e78dc62 made udhcpc send a
> single DHCP request (instead of 3) before going to the background, thus
> speeding up the boot process if the DHCP lease is not obtained
> immediately. Unfortunately, this can also slow down the acquisition of
> the lease as, after going to the background, udhcpc waits for 20 seconds
> (instead of 3) before retrying.
> 
> Speed up the lease acquisition by setting the retry timeout to 3
> seconds.
> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

I was unsure whether to consider this a fix or a new feature, but I
think we can really consider it a fix for a regresion, so: applied to
master, thanks.

And thanks for the detailed example!

Regards,
Yann E. MORIN.

> ---
> Hello!
> 
> While testing 2022.08-rc1 with acmesystems_acqua_a5_512mb_defconfig on a
> real Acqua board (and Ubuntu 20.04 host), I noticed that my board became
> very slow in getting a DHCP lease, which was a fast process on 2022.05.
> Wireshark showed the following DHCP traffic ("<" = received from the
> board, ">" = sent to the board):
> 
>     time (s)  packet
>     ---------------------
>     03.24 < DHCP Discover
>     06.24 > DHCP Offer
>     26.28 < DHCP Discover
>     26.28 > DHCP Offer
>     26.28 < DHCP Request
>     26.28 > DHCP ACK
> 
> Looking at the log 2022.05..2022.08-rc1, I identified the regression to
> be in commit c343e01ac4908f76520cf9a405ed87650e78dc62. This commit adds
> the option -t1 to the udhcpc command, which makes it go to the
> background after only one try, and has the unfortunate side effect of
> introducing a 20-second delay.
> 
> With this patch applied, the lease is acquired much faster:
> 
>     03.26 < DHCP Discover
>     06.26 > DHCP Offer
>     09.28 < DHCP Discover
>     09.29 > DHCP Offer
>     09.29 < DHCP Request
>     09.29 > DHCP ACK
> 
> Regards,
> 
> Edgar.
> 
>  package/busybox/busybox.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
> index 2409cbcce1..137e44c870 100644
> --- a/package/busybox/busybox.config
> +++ b/package/busybox/busybox.config
> @@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=0
>  CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
>  CONFIG_FEATURE_UDHCP_RFC3397=y
>  CONFIG_FEATURE_UDHCP_8021Q=y
> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-t1 -b -R -O search"
> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-t1 -A3 -b -R -O search"
>  
>  #
>  # Print Utilities
> -- 
> 2.25.1
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
