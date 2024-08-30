Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E4BCA0EF3
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 21:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 365F06145C;
	Fri, 30 Aug 2024 21:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7XMezfjVdju; Fri, 30 Aug 2024 21:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2377261461
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2377261461;
	Fri, 30 Aug 2024 21:46:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1EE01BF295
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 21:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32174402BC
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 21:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Btbq5QcPoqgs for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 21:46:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C10CC400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10CC400C5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C10CC400C5
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 21:46:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7A68F13F861;
 Fri, 30 Aug 2024 23:45:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 30 Aug 2024 23:45:57 +0200
Date: Fri, 30 Aug 2024 23:45:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <ZtI9lc9khk4QR7_v@landeda>
References: <20240618194001.1907396-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618194001.1907396-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725054360;
 bh=8iAFGCsLB3++ZeLvWRceVf2/cDu1Tk3aGrMFiYqjSrQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F+TfPcNgIBOFtnM+doVGEGX3eN3fWut9D3/jkoZI8oIihBT6cK/VNNRRVQkowM8wa
 SyppxCVjvbJXHQc8AVB/hapXp7cHdl3R09818yzi7zQL3c26/nKPqy9WDIlH3403hi
 uYqqdebx9lEa0uRXsDaNzFT48W+36nsutQO0ZIfvn6DQGBBZZEU3kPOWoW5bntVnIY
 4Q5ex9s4OYJESAT2YN6BHpH8WGinnt82oDrjZ1UVG5bolqj4BDTdj22zJsDOmtH4p9
 9I1u6l6LNFgULbC4U5CQvC/SeDo/ULT/kvaFmARXCWiK1V4gr7Z/yb8EWBvbW787Vx
 UH2XYTFfMZvwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=F+TfPcNg
Subject: Re: [Buildroot] [PATCH 0/2] Improvements for U-Boot on RPi boards
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
Cc: =?utf-8?B?Sm9zw6k=?= Mendes <jp.baltazar.mendes@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-06-18 21:39 +0200, Fiona Klute via buildroot spake thusly:
> I'm working on a system that needs U-Boot to manage booting on an
> RPi-based board. These two patches make working with this setup
> easier, though they aren't a complete setup (they do not include a
> boot script, and do not prescribe where the Linux kernel is stored).
> 
> If there's interest it should be possible to expand this into an
> RPi/U-Boot defconfig.

It would be tremendously useful to have a rpi[12345] defconfig that uses
u-boot, indeed!

Regards,
Yann E. MORIN.

> Fiona Klute (2):
>   board/raspberrypi: Support boot.scr for U-Boot
>   board/raspberrypi: Enable nullglob for DTBs
> 
>  board/raspberrypi/post-image.sh | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> --
> 2.45.2
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
