Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFBDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B307561035;
	Sat, 23 Jul 2022 14:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B307561035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3CZ5oMsHUtf; Sat, 23 Jul 2022 14:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB0E61005;
	Sat, 23 Jul 2022 14:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEB0E61005
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 699881BF85D
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4311D84B01
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4311D84B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QxC6CMnO4mvV for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:11:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33FFC84AE9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33FFC84AE9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:11:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:bc2c:46eb:561c:827])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0D31D780506;
 Sat, 23 Jul 2022 16:11:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Jul 2022 16:11:13 +0200
Date: Sat, 23 Jul 2022 16:11:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220723141113.GC2641@scaer>
References: <20220719074042.2214649-1-thomas.petazzoni@bootlin.com>
 <20220719074042.2214649-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220719074042.2214649-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658585476;
 bh=UnIc4dy4aLLYDTrkzENLi7QaCUJ/LwgLklSfBeE6lCM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EcZOMAgGjn6jNwLGB0ikSkcJ0YWMeHKTpbfBDgGvHs/m3znM7aAlrPzuYl2CGQgK5
 aKYl9ndX58vn1A/JM+z0FquGChFdgtPo7tiReJM/9dOPSlIbKU3EE0DKUjuxWoN0xb
 V2Y4PtezRldafUmd1mZofa/06edQ2h2JSLfURrCA5uk4GcawULVOGSyhbGzY9N/XW5
 9LDnf4ETYYmyDhwGCaIWOpBfcNT3/tDRNyMGE+Hy2Ii2G/lSYFg+OFYahKFg1MuRa2
 AYq1HfPn+HzvaEHL78crI6i1Fi/di6G4yX9gCbZNuzxIY9ojtkC7MEHzMc6y3tFqCU
 RaJlr0DqivHbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EcZOMAgG
Subject: Re: [Buildroot] [PATCH 2/4] boot/grub2: update to 2.06
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

Thomas, All,

On 2022-07-19 09:40 +0200, Thomas Petazzoni via buildroot spake thusly:
> The update is very straightforward, as no changes in grub2.mk are
> needed beyond the version bump.
> 
> Spacing in the hash file is adjusted to the new Buildroot standard.
> 
> All patches are dropped as they have all been upstreamed between 2.04
> and 2.06. Here is the full list of patches and their corresponding
> upstream commit:
[--SNIP--]

Applied to master, thanks.

As seen IRL, I'll work on using edk2 as the source for building the OVMF
blobs, which means that the rest of this series will need to be changed.
I've marked the rest changes-requested, but they are on a branch here.

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
