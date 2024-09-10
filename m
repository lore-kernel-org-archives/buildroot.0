Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4272EE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 967C6608EF;
	Tue, 10 Sep 2024 20:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTx--nRnkgy7; Tue, 10 Sep 2024 20:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A28F36121C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A28F36121C;
	Tue, 10 Sep 2024 20:54:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D2341BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36B93610EC
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpxLHQyzhBVq for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:52:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B28BB60A88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B28BB60A88
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B28BB60A88
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:52:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1983060132;
 Tue, 10 Sep 2024 22:52:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 10 Sep 2024 22:52:46 +0200
Date: Tue, 10 Sep 2024 22:52:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZuCxngm69xbgmvhk@landeda>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726001569;
 bh=pPyvBf1bFKEJcQAFRYkE+35kwjZ3TS1m7k/HFL4vOAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gjfDw8sa9QB/Hq9xePfxHhybNkmJo3gCOvBUdcrkd6tPyQukzQRhY8SeTYp4Xgo4Y
 YhqvVRN6TPKcH/3xOxd+aq3R61retIuenQR87vv/pD+bT5ZPpSUVsWIQggUw7OlGh+
 KaQO/DTQc1aSUNs3E7LgzmXYHLnPLipEE+K+Wv9KKnXhUtFXwALkw4boHuAs+ZsS6Z
 IY4oI7/XlWpsPtDMs8bEQTMW57eFbIm+OpStFQgB3/hBLIYuWSQj/sBvxAhumEenpP
 aBdPW16zqYxWnvZ4ASfS998Ddp4bp6Gne2At04KFw4gVwqgOkoKjepE4tSKGg+Bol6
 tmzIk8Nk4KChg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gjfDw8sa
Subject: Re: [Buildroot] [PATCH 00/42] codespell spelling fixes A-H
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-09-10 09:07 +0200, Peter Korsgaard spake thusly:
> A collection of small typo fixes found by codespell
> (https://github.com/codespell-project/codespell/).
> 
> I have skipped typo fixes for patches that are direct backports from
> upstream.  Patches for the remaining packages will follow later, as the
> series is already very long.

Whole series applied to master, thanks.

I replied to the few patches where I did additional fixups.

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
