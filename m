Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC5AC32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 20:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0FD98138F;
	Wed, 18 Jan 2023 20:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0FD98138F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q14bP7arczG8; Wed, 18 Jan 2023 20:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED578139A;
	Wed, 18 Jan 2023 20:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED578139A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E65C1BF28B
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 20:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A60940B83
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 20:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A60940B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z86FnxBpD6WD for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 20:33:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B774C40B64
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B774C40B64
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 20:33:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 673E15FF88;
 Wed, 18 Jan 2023 21:33:43 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 21:33:43 +0100
Date: Wed, 18 Jan 2023 21:33:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <20230118203343.GK2770@scaer>
References: <20230116080513.21407-1-yegorslists@googlemail.com>
 <20230116212444.GH2770@scaer>
 <CAGm1_kuifU41S1+Yr4eEX90AwA7CXnFtDVr+GES2SewO1PmagA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_kuifU41S1+Yr4eEX90AwA7CXnFtDVr+GES2SewO1PmagA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674074025;
 bh=u3kD9bthmbxEV8X1/nX4QdoTpGcCOfCJKlASiyoX6cc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N8ARqbUCxboF9lAAvaidVNWPEKd6CCGhefmLyG7KzAXeC8RtWaP+w/puy3DoSqZAk
 igbzf8lsIOmCLjg0htNuY0f/1RLRY6Aq/ddIzJRmqDNAE51zkbUeG7kahwRkq96b1W
 hP5lQdVQ5fv46Xg+16yzuyCXiPrZ0BY5cDsqAlteiqGfwyoODQG4OqRpp+YHMe9rTf
 4kQJkV6aBi+Ag+lOnXrySAny1XKgTT+mh2AmIgSmR71YpZuD6ZPOgRMVxqrEJ9kBtC
 IYtbwrBzehBlFqKp54V/4RTq3t/rxKwFIoTOSgxG8TM8mhM1vx9FDAB0j1/EzYc2Cy
 I6IcAfgOfMx7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N8ARqbUC
Subject: Re: [Buildroot] [PATCH] package/util-linux: add an option to enable
 irqtop
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

Yegor, All,

On 2023-01-17 08:57 +0100, Yegor Yefremov via buildroot spake thusly:
> On Mon, Jan 16, 2023 at 10:24 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2023-01-16 09:05 +0100, yegorslists--- via buildroot spake thusly:
> > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > >
> > > irqtop is an IRQ monitoring tool.
> > >
> > > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > > ---
> > >  package/util-linux/Config.in     | 7 +++++++
> > >  package/util-linux/util-linux.mk | 1 +
> > >  2 files changed, 8 insertions(+)
> > >
> > > diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> > > index 917f1bc2b4..c7e4d2d8bc 100644
> > > --- a/package/util-linux/Config.in
> > > +++ b/package/util-linux/Config.in
> > > @@ -161,6 +161,13 @@ config BR2_PACKAGE_UTIL_LINUX_IPCS
> > >       help
> > >         Show information on IPC facilities
> > >
> > > +config BR2_PACKAGE_UTIL_LINUX_IRQTOP
> > > +     bool "irqtop"
> > > +     depends on BR2_USE_MMU # libsmartcols
> > > +     select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
> >
> > I was about to apply this, but I am a bit conflicted... Building irqtop
> > defaults to 'yes' for linux systems, when --disable-irqtop is not
> > specified (unless I misread util-linux' configure.ac).
> >
> > So, today we are providing neither --enable-irqtop nor --disable-irqtop,
> > which means that it is in practice always built.
> >
> > But with your change, it means that now it is by default disabled.
> >
> > So I wanted to add 'default y' for legacy reasons, but we have no other
> > option in util-linux that defaults to 'y', so it would have been a bit
> > odd to do so...
[--SNIP--]
> irqtop is a rather new tool and it is not listed in the
> BR2_PACKAGE_UTIL_LINUX_BINARIES help text. Perhaps, it is not that
> problematic that it is not enabled by default.

irqtop has been in-tree since 2.36, released almost 2.5 years ago now,
and packaged in Buildroot for almost as long, so people may have come
to rely on its presence, even if undocumented.

> I've sent v2 with the added ncurses dependency.

I'll have a look, thanks.

Regards,
Yann E. MORIN.

> Regards,
> Yegor
> 
> > Regards,
> > Yann E. MORIN.
> >
> > > +     help
> > > +       Show information on IRQs
> > > +
> > >  config BR2_PACKAGE_UTIL_LINUX_KILL
> > >       bool "kill"
> > >       help
> > > diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> > > index b53b94ec31..87ec3c19d7 100644
> > > --- a/package/util-linux/util-linux.mk
> > > +++ b/package/util-linux/util-linux.mk
> > > @@ -136,6 +136,7 @@ UTIL_LINUX_CONF_OPTS += \
> > >       $(if $(BR2_PACKAGE_UTIL_LINUX_IPCMK),--enable-ipcmk,--disable-ipcmk) \
> > >       $(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
> > >       $(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
> > > +     $(if $(BR2_PACKAGE_UTIL_LINUX_IRQTOP),--enable-irqtop,--disable-irqtop) \
> > >       $(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
> > >       $(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
> > >       $(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
> > > --
> > > 2.17.0
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
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
