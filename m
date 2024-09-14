Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC603C02189
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA9E781238;
	Sat, 14 Sep 2024 09:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOV-hFKjSbh2; Sat, 14 Sep 2024 09:14:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B01098453C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B01098453C;
	Sat, 14 Sep 2024 09:14:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A1CC1BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 287AC4065C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T48FOjbMA1RY for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 906E3405FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 906E3405FD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 906E3405FD
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:14:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id F2B2D78034D;
 Sat, 14 Sep 2024 11:14:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 11:14:13 +0200
Date: Sat, 14 Sep 2024 11:14:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZuVT5Ws1CA9j4072@landeda>
References: <cover.1725049576.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1725049576.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726305257;
 bh=Dez796O5RCt1KHzmPRVxbLzsk+HHZstBqj3Ag1ZznXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tZdUQGt0XqEzYuAbVd+t5kuzcjFI3qJYnf0wD3WANSx9VRiKoOqib++0UnO5h6N/y
 1m/Csl9tVQ/FfwRuMhvALyjW5uk0w/+NPueiBQmB18n5CMQXufv4xhVFsWDcy0jo8j
 Dwnt+mEkJGXXCHds7c3okVk/0y74u2VhlPF/0HiQgOY6wbIEvBWUQCINSSaLEWwgWg
 SSNIVMwSHEW5ViyC+Y0VK2H4h9nR8UG/oyaSC9lVcP3KOifn0ZxwSnIm+3EDG40tvs
 6d4xIZCDQPuIr6Si/fb0oImpL0GjTYl5OSx/pp1ZiWJl/vaoorJ33wkinKWC3h4x8j
 pb1M3WlczBa6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tZdUQGt0
Subject: Re: [Buildroot] [PATCH 0/3] system: extend the list of init systems
 (branch yem/init-choice)
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-08-30 22:26 +0200, Yann E. MORIN spake thusly:
> Hello All!
> 
> This little series is a proposal to follow on the discussion with Dario
> and Thomas, about Dario's series adding tiny-init:
>     https://lore.kernel.org/buildroot/ZtF1pHPZqUkUit8N@landeda/T/#mc1ef6288de44b9d35d382187ae14edf3185aa0c5
> 
> Note that, contrary to what was said in that discussion, there is no
> need to add a build dependency from Busybox to tini, as tini does not
> install itself as /init or /sbin/init, so will not be conflicting with
> Busybox.
> 
> Regards,
> Yann E. MORIN.
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (3):
>       system: change label for BR2_INIT_NONE
>       system: classify init systems
>       system: add tini as init system

As suggested by Thomas, series applied to master with reviews from
Dario, thanks!

Regards,
Yann E. MORIN.

>  package/tini/Config.in |  1 +
>  system/Config.in       | 22 +++++++++++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

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
