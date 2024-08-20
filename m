Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9014AC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 538FA40B8C;
	Tue, 20 Aug 2024 21:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQ9pYm59yqGd; Tue, 20 Aug 2024 21:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24ECC40B9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24ECC40B9D;
	Tue, 20 Aug 2024 21:41:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C36BC1BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD6DF6071E
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zq5NyNxfA3aM for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3D22606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D22606FF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3D22606FF
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:41:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6394113F86E;
 Tue, 20 Aug 2024 23:41:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Aug 2024 23:41:12 +0200
Date: Tue, 20 Aug 2024 23:41:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZsUNeFXH9a5adqFJ@landeda>
References: <20240820172343.2124306-1-dario.binacchi@amarulasolutions.com>
 <ZsUMb1U7cYJvrODe@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsUMb1U7cYJvrODe@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724190076;
 bh=POSaUT9OiZ98BzRTDRHYZzuncEv+dg/N3cQ7DP9ZZNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d+llRwnHIfjRXN+l824ZFShS2XDhlWxkgWlra7//lMamLlnMzwIySyJs87ibDS4We
 1SmaBLgiCIRviLEp5223ZXMmwhkMxMYyGDA1R8xmfemCwezR+SOF+6EH72sEXT6l/s
 rjGwdd8yvTZ80rehFC4Z+cBR3dlU1GttFRoUHNx2sURcBnZRyNPbJ4Jqfoz4dAU2DU
 +5q59CgbDNqWzZ4jCz0iP6sx/5JLAiPqvWU3bChBmw5Iv7iytOMjfIMVa2R/svbLgr
 YYAWDqoTzQyEGoHxtM5ZVmb3soveA6e35+15tw3l+fdMtd0kMIU7tEN1uX6YAG6n1h
 DojZGUvA9Sgbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d+llRwnH
Subject: Re: [Buildroot] [PATCH v2] package/ntpsec: fix host building
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
Cc: linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-08-20 23:36 +0200, Yann E. MORIN spake thusly:
> On 2024-08-20 19:23 +0200, Dario Binacchi spake thusly:
> > The following build failure on xtensa:
[--SNIP--]
> > Fixes:
> >  - http://autobuild.buildroot.org/results/9321a637f2c340ce8dcb24249676bb6c44d0dfc6
> I've added a little blurb that explains how long it has been happening,
> so what branches it should be backported to.
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Applied to master, thanks.

Thomas was slightly faster than me, so he pushed to master.

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
