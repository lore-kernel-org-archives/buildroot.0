Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61432C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 20:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 131216060A;
	Tue,  9 Apr 2024 20:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMI-BYQK6ZCb; Tue,  9 Apr 2024 20:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2358860659
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2358860659;
	Tue,  9 Apr 2024 20:50:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74FBC1BF3A4
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DDEF4063B
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11PLSSWWR-lj for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 20:50:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FB7940634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB7940634
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FB7940634
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 20:50:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7881213F88E;
 Tue,  9 Apr 2024 22:50:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 Apr 2024 22:50:01 +0200
Date: Tue, 9 Apr 2024 22:50:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZhWp-ftUZj1_npHh@landeda>
References: <20240403121807.2087547-1-robimarko@gmail.com>
 <20240408223621.39b37892@windsurf> <20240408213807.GA44146@pevik>
 <20240409214656.721dc7c3@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240409214656.721dc7c3@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712695805;
 bh=lDPjg5Oqrj8/Yi2AKNQK8OS7sCxuZ6dn81mZfe+PzUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ooIiJPXYa/X8GNmZI/cmDpr5yHjJBRWQRBoBgR1J5kZPCkujntMRBYLYfU5zuKeKa
 J/wyL4fu8QjRti/nWWBXNL075LEReiDX71D6MD8IoZDFA3SyHKDi1eJxD1FUPqmiln
 bkCTo+qLPrzoZrQnF6RBI4UG2T9MPws0j9S2ajKOihA3dxVvRzxQZhBGyXuGy5jOlG
 VuEB8l5Emfaq62YHCXGZ15cZzopx/fatHGTt2WLY6X61A+odwW3lp5StXtePot1uJ3
 zzLq7wTFAuRV7hVxnSC2NwWQiBmjY9iB1sBIRsk8S9P1S3CGw7M1qMrqqI8SLc7FdX
 OPS3dvRCNpjkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ooIiJPXY
Subject: Re: [Buildroot] [PATCH 1/1] kconfig/lxdialog: fix check() with GCC14
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Robert Marko <robimarko@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Petr, All,

On 2024-04-09 21:46 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Mon, 8 Apr 2024 23:38:07 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:
> 
> > FYI I gave up kconfig update after big rewrites in the Linux kernel
> > made by Masahiro Yamada (the new kbuild and kconfig maintainer), because the
> > code changes were quite big but kconfig in Buildroot is IMHO not missing any
> > significant usability function. But I can be wrong, Thomas let me know if you
> > miss something significant which would justify the update. Obviously we would
> > get some fixes, but also major rewrite, which would likely require changes in
> > other parts of Buildroot.
> 
> I have no idea what are the new interesting features that have been
> added in the upstream scripts/kconfig/ (if any). However, keeping our
> support/kconfig/ reasonably up-to-date is not only about new features,
> it's also about staying compatible with reasonably recent
> libraries/tools (more recent ncurses, Gtk, Qt, more recent GCC, like
> this issue illustrates).

The kernel's kconfig has dropped the possibility to include files from
within a choice, so what we're doing now in a few places will not work;
  - toolchain/toolchain-external/Config.in
  - package/openssl/Config.in

and so on...

Unless that was reverted upstream...

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
