Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FCFC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 09:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4870418FC;
	Sat, 13 May 2023 09:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4870418FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mvBfdTRivjJY; Sat, 13 May 2023 09:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB1F418F8;
	Sat, 13 May 2023 09:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DB1F418F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D10471BF5E9
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 09:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B782C60FB8
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 09:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B782C60FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l2cNxyLj6_qh for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 09:04:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0255E60F98
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0255E60F98
 for <buildroot@buildroot.org>; Sat, 13 May 2023 09:04:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 04E1919F755;
 Sat, 13 May 2023 11:04:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 11:04:17 +0200
Date: Sat, 13 May 2023 11:04:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230513090417.GH2582048@scaer>
References: <20230509201153.2413972-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230509201153.2413972-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683968662;
 bh=rROdLUydYu7cotIKfY6CClagJK0N4GswTzlvGMQLiEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ntSvbdKLebOkFCht6yJ1UqJEsxwcIMb+7hWtjDnuPJrrx5Q76x9EVGQnq+rMHP0AF
 sgk1+NhtvupQWl3WxXVUp6ldfsyvL18+kNSj8KQllmIqF0sd/RezstxOb02m80QMh+
 tlQvP3kWGkUAe7yZcHEVYq9qFggRriVk7La3uGIym2MuQAPyknt2Uu8bjUx7tlH588
 mF73c/m7hvyiCihpJcZgQ5yNjV78muirqiOB3DIlaMXpd/i009Fvvaypm3dINOsjO4
 tDfUSZbq3yxsNhguwu1ejU2sHIZmKAMdmoY7bFLZ+HCpxmnusfZj8nZ+NH/gzrWnLj
 a2Z3MxOJHL6rA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ntSvbdKL
Subject: Re: [Buildroot] [PATCH 0/4] manage CAN devices on MMU-less systems
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
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Dario Binacchi <dariobin@libero.it>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2023-05-09 22:11 +0200, Dario Binacchi spake thusly:
> This series is the result of the work done to add support for the bxCAN
> controller to the Linux kernel ([1], [2]). Since these are MMU-less
> systems, I had to apply some patches to the userspace tools required to
> test the driver. I also submitted a patch to busybox ([3]), but it has
> not been accepted yet, and I don't know if it will be in the future. In
> the meantime, the rtnl-link-can application can be used.
> 
> This series allows the use of CAN devices on MMU-less systems before it
> is possible to bump can-utils and libmnl to the new versions containing
> these patches.
> 
> [1] https://lore.kernel.org/all/20230328084710.jnrwvydewx3atxti@pengutronix.de/
> [2] https://lore.kernel.org/all/20230509-silt-gullible-a010971857fc-mkl@pengutronix.de/
> [3] http://lists.busybox.net/pipermail/busybox/2023-April/090294.html
> 
> Dario Binacchi (4):
>   package/can-utils: bump to version 2023.03
>   package/can-utils: enable compilation on MMU-less systems
>   package/libmnl: add rtnl-link-can example
>   package/libmnl: simplify LIBMNL_EXAMPLES_INSTALL_TARGETS setting

All 4 patches applied to master, thanks.

I just tweaked the Upstream: tag for the libmnl patch, to point to the
actual URL instead of just the sha1:
    https://git.netfilter.org/libmnl/commit/?id=80442c4e32cde0b27b471c5c9688ee8488f14bec

Regards,
Yann E. MORIN.

>  ...ograms-using-fork-on-MMU-less-system.patch | 257 +++++++++
>  package/can-utils/Config.in                   |   1 -
>  package/can-utils/can-utils.hash              |   2 +-
>  package/can-utils/can-utils.mk                |   2 +-
>  .../0001-examples-add-rtnl-link-can.patch     | 504 ++++++++++++++++++
>  package/libmnl/libmnl.mk                      |  15 +-
>  6 files changed, 770 insertions(+), 11 deletions(-)
>  create mode 100644 package/can-utils/0001-Don-t-compile-programs-using-fork-on-MMU-less-system.patch
>  create mode 100644 package/libmnl/0001-examples-add-rtnl-link-can.patch
> 
> -- 
> 2.32.0
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
