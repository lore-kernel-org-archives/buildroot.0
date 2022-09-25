Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A736CC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 19:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D70F40895;
	Sun, 25 Sep 2022 19:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D70F40895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Je2KzA6alvJI; Sun, 25 Sep 2022 19:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7840B405C7;
	Sun, 25 Sep 2022 19:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7840B405C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDA581BF577
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B82EF405C7
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B82EF405C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WdCQid_pT9bO for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 19:51:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 012F6404A8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 012F6404A8
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 19:51:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4a9f:7e6b:a045:201d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E1F9D5FF27;
 Sun, 25 Sep 2022 21:50:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 21:50:59 +0200
Date: Sun, 25 Sep 2022 21:50:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220925195059.GE1419013@scaer>
References: <20220925152452.353907-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925152452.353907-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664135463;
 bh=mFNHa8tb+yIXRp0yPL6gN7ImGhbPjCjj6yrHqQeaoSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MiisOuUTO9+lVNKLPIGgy1mWVQ18rQMlMrdfiuX5dTaWLOmkUJdhBOuaMIHvOPabC
 FhSNPfldSBYae4C68Dm9kY5u0tcSol1pKo8n0reRkOGA4r+bxLrn6DsQac/DSpuYHM
 tX5xzivQen7JjfH5TdgewzJgw76YyIznrdRp55JiJVZOm/+/PEMDaFDmJE3kxv/Lca
 mesCeveXE4IVCk9eLxmRDhRSeTvwzOef7lo/dHXqGG/twWLGNkfmH7JYeM7lveQ4tz
 /YHXM+WYihBn36X+YOeM/VSMdbtpWyUNmcCbzmpNj3D2KSAXK+Ol1RB2gZcRc3LUeG
 SOxY8vfRyJ0mQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MiisOuUT
Subject: Re: [Buildroot] [PATCH 1/1] package/vdr: fix build with gcc >= 11
 and uclibc < 1.0.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-09-25 17:24 +0200, Fabrice Fontaine spake thusly:
> Drop static from first patch to fix the following build failure with
> gcc >= 11 and uclibc < 1.0.0 (prior to
> https://github.com/wbx-github/uclibc-ng/commit/5c484467f718a25e94a88b11bdbb670ddb1c0d0f):
[--SNIP--]
>  diff -uwNr vdr-2.3.1.org/skinlcars.c vdr-2.3.1/skinlcars.c
>  --- vdr-2.3.1.org/skinlcars.c	2015-09-01 12:07:07.000000000 +0200
> @@ -14,7 +16,7 @@ diff -uwNr vdr-2.3.1.org/skinlcars.c vdr-2.3.1/skinlcars.c
>   
>  +/* uclibc and dietlibc do not have this junk -ReneR */
>  +#if defined (__UCLIBC__) || defined (__dietlibc__)
> -+static int getloadavg (double loadavg[], int nelem)
> ++int getloadavg (double loadavg[], int nelem)

If you drop the static, the getlaodavag will come clashing with the one
defined in the C library: uClibc-ng does have a getloadavg since version
1.0.42, which we do have in Buildroot now.

So, what the patch should do, is really test whether getlaodavg is
available or not. But this is a generic-pacakge, so it's not going to be
trivial.

Regards,
Yann E. MORIN.

>  +{
>  +  int fd;
>  +
> -- 
> 2.35.1
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
