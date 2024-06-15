Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E4EC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 14:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 891648215C;
	Sat, 15 Jun 2024 14:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Epgl73Eip-Qi; Sat, 15 Jun 2024 14:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4A1B82113
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4A1B82113;
	Sat, 15 Jun 2024 14:30:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEA311BF302
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC0764026F
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Bi_6V__vBoD for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 14:30:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B605400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B605400D7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B605400D7
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 14:30:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4962413F88D;
 Sat, 15 Jun 2024 16:30:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 16:30:13 +0200
Date: Sat, 15 Jun 2024 16:30:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zm2ldZk5DZ966rGj@landeda>
References: <20240514085801.3202503-1-thomas.petazzoni@bootlin.com>
 <Zm1L7ZlBXIV2iowQ@landeda> <20240615144651.5f2e05f5@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615144651.5f2e05f5@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718461819;
 bh=LkuWZlOFzNEPEumgmJ47meTWN+qTEFvQNQnsE52i3i0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ObTd0FwlbnpXEJei4g/xZPu4zylvLbVhvNHXsZa7UoGQhOzLoAFCyfGYA6t5myS5a
 wjs9JXoUp1QXC7xsc1mIfvqb98pTjLpJXbaml9lbF2E4tDA0e+MTPnucGzSoZZp7Pn
 CjmPnvEWN5+tBWf42ikrJYxi2dMB6bckJtE5mIPP9rqtqem89T/SOZW8oWHktwNWXB
 00NKRI1zi+VBU3yEMQ3S8FNEzCZ/S5vTsi6LQnoklbuI4U/p0ot8r6bysyEZl4YwVH
 dPlNzOFEQl5y40Go4Nrlchw23SztmcqbYkXarZVDLP5uDfkvmgvQYMB4ewixR2+feg
 HMAyITmxG4xBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ObTd0Fwl
Subject: Re: [Buildroot] [PATCH] docs,
 package/gcc: switch to Gitlab issue tracker
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-06-15 14:46 +0200, Thomas Petazzoni spake thusly:
> On Sat, 15 Jun 2024 10:08:13 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > It would have been nice if you had suggested a plan to deal with the
> > existing issues.
[--SNIP--]
> My plan was to have no plan at all, and simply "ignore" the existing
> issues. But alternatively, we could do a massive close of all existing
> open issues with a message saying that we moved to Gitlab and that if
> the issue still exists, it should be reopened in Gitlab.
> To me, this is probably good enough.

I am fine with that.

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
