Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A916CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 241A040A1D;
	Tue,  3 Sep 2024 19:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paXIrhm-AOpj; Tue,  3 Sep 2024 19:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDF9440A1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDF9440A1F;
	Tue,  3 Sep 2024 19:24:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3FB1BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 292A680891
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-aqSU2zvWSa for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B2EA8088A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B2EA8088A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B2EA8088A
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:24:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3D20913F879;
 Tue,  3 Sep 2024 21:24:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 21:24:30 +0200
Date: Tue, 3 Sep 2024 21:24:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZtdibkjGC5Zl7_DB@landeda>
References: <20240903085745.2594893-1-michael@amarulasolutions.com>
 <20240903205015.06fd36ac@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903205015.06fd36ac@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725391474;
 bh=0qGe5NztizMqH6bZBRjNNcN/CiTQQsIjfsxtu0jt2SM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XBMJKiPK1fvUrtbKN1VyBP7QQ2WfY94k/8w+n310VesoXz+C/RMysyJsT4a/EuiPJ
 eEsCAw64UooHn+l5K7qUvL42lz3tD4MSr4tvXA0L/l/0ASLLskgvv2V0WLQJR740Ao
 Bkml8S78ibCasgAgrcvianUeRfB9vdYUX3SXp9aLhxZicLrbrupyIBAiTTjwtJpUUf
 cp3tz0YKb1x4JD1zyFSMyyZsb2D0xqXK5SfZYPlgbXahuDlyLJsVMIPbBpN56NGj4i
 JFOfkQn5853Bdmxap3Byt/H+PjZv6ZOxZxv9jbeLgJa1+abUAg1pr/BID2pJ++F9lL
 njqrLpz1GDTgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XBMJKiPK
Subject: Re: [Buildroot] [PATCH V2 1/2] scripts/cve: Avoid to do a complete
 clone of cve git repository
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2024-09-03 20:50 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Tue,  3 Sep 2024 10:57:44 +0200
> Michael Trimarchi <michael@amarulasolutions.com> wrote:
> 
> > Just a simple clone and pull with --depth 1 should be enough to parse the
> > cve and generate the pkg-stats report.
> > 
> > From a full clone and a depth-1 clone, and the size delta is 2.9GiB vs. 2.2GiB.
> > The download size does change: from 983.55MiB down to 270.78MiB.
> > it's a net time win too: 2m17s vs 1min7s (on a 100Mbps link).
> > 
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > ---
> > V1->V2:
> >     - Add statistics from Yann E. Morin
> >     - Use git pull --depth 1 for update the repo
> 
> Applied to next, thanks!

I don't understand: Michael said in the first iteration that we should
drop the package:
    https://lore.kernel.org/buildroot/CAOf5uw=m4LOk97OT1dTP=2-uP6QZ1WQyHfKYSQmWCirDaxXvgQ@mail.gmail.com/

Only the first clone is slow, the following calls will just pull (mostly
nothing most of the time), so the optimisation is not really worth it.

Also, in the download backend for git, we stopped doing shallow clone
because they were causing issues (but might not be applicable here).

Anyway, too late, that's been applied...

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
