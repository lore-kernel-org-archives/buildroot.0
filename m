Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245A8C001B0
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B48F361244;
	Sun, 25 Jun 2023 19:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B48F361244
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2C1jQhPAS9Ly; Sun, 25 Jun 2023 19:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D766C6125C;
	Sun, 25 Jun 2023 19:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D766C6125C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B14001BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 891AB413A3
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891AB413A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56XrZvq5YL4A for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:36:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71839411C6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71839411C6
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:36:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6779:b2ef:a941:20a5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 7FB812003F3;
 Sun, 25 Jun 2023 21:36:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jun 2023 21:36:48 +0200
Date: Sun, 25 Jun 2023 21:36:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230625193648.GA646621@scaer>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-7-dannenberg@ti.com>
 <20230625135435.GC589277@scaer>
 <bd293d20-a3c8-d76d-e711-75daaa5ec136@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd293d20-a3c8-d76d-e711-75daaa5ec136@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687721814;
 bh=qfvEaUGWnnkRhh4Lcu9VIk32bU4cLF1EmBiTu8YIc/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vn++FbEK6gJJpx078gD4WUQA0OvhM/jUK3bwfwwA1ak2RxDWdNhpVJcXPmb7yIIqo
 CiEa73DEfJ77ilFiYvTtdZgJ7Nup5g07lo99tGFRx5dqOZA//c8fb2TyYWosDnKQs7
 769ta0rEXzlfLVieGUH9vh5B3+9pd5fCboTiqonuxFYNKx8kpK9/td22b9n8hKmPDw
 kAAoDHVGoscPH8k3MdeXCYZzgGwCooMhVfDft5yCv9WnZEOrz6Ps7UXZYXwglJdCKx
 ew+jitp3Sh4WOMf2yHYxNFloBzDfeDfgJUIU60TDXTnhXTN0lZoQIlvPQgP32XPVoz
 C7lfi6KVhFGBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vn++FbEK
Subject: Re: [Buildroot] [PATCH v9 06/11] board/ti/am62x_sk|am64x_sk: switch
 to TI SDK v8.6 sources
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, Andreas, All,

On 2023-06-25 16:33 +0200, Arnout Vandecappelle via buildroot spake thusly:
> 
> 
> On 25/06/2023 15:54, Yann E. MORIN wrote:
> >Andreas, All,
> >
> >On 2023-06-22 11:02 -0500, Andreas Dannenberg via buildroot spake thusly:
> >>Switch the following projects to using the same Git source repos and
> >>commit IDs that are used to build the TI SDK v8.6 for AM62x and AM64x
> >>devices to establish a baseline for comparable functionality:
> >>
> >>* TI Linux Kernel v5.10
> >
> >So this means going from a 6.3 kernel back to a 5.10 (the current latest
> >if 6.3, which is what is used in the defconfigs from the two previous
> >patches). That's a bit unfortunate.
> >
> >Do you have plans to update to a more recent kernel in the (near)
> >future? Can't we keep using 6.3 anyway?
> 
>  We don't actually have a clear policy on whether to use upstream or vendor
> kernels for the defconfigs. We have a few boards with both, but IMHO that's
> not a great approach either.
> 
>  Personally, I think it makes sense to focus on vendor kernels for the
> defconfigs. Using upstream is generally easy, you just have to find the
> appropriate device tree. But for the vendor kernel, you have to find the
> repository, which branch is "current", and often also make sure you sync up
> with U-Boot and OP-TEE etc. versions. @Andreas don't take this as law,
> though, it's just personal opinion.
> 
>  That said, I think for each board we should look at what the vendor kernel
> really brings. If everything, including GPU, is working with the upstream
> kernel, it doesn't make sense to use the vendor kernel. I don't know if
> that's the case in this specific situation.
> 
>  Yann, Peter, Romain, Thomas, what do you think?

My position is that we should use upstream as much as possible, and
switch to a fork only when that is needed.

Now, what "it is needed" means is very hazy. Lack of serial, storage,
network upstream certainly means it is not suitable. Lack of support for
some obscure IP block that no one uses or even knows of, is certainly
not a blocker. Then there is the wide gray range of peripherals (GPU, hw
crypto accels, etc...) that some may see as critical while others might
not care about.

So I guess the rule is: deviating from upstream should be dully
motivated, not just "get in sync with Yocto/OE" or whatev'.

What prompted my initial comment above, is that the series introduces
two defconfigs that use the upstream kernel, i.e. 6.3 as of now, but
then this patch dwindles back to use the 5.10-vendor. So, the question
is really, indeed: why use the 5.10-vendor tree when the 6.3-upstream
seems to work?

Or put in other words: does the 6.3-upstream actually works, as
introduced in the previous patches?

I.e. if we do not apply this patch, does the am62x_sk_defconfig and the
am64x_sk_defconfig work?

Regards,
Yann E. MORIN.

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
