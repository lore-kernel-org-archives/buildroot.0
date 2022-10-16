Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EC8C4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 16:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED31D40936;
	Sun, 16 Oct 2022 16:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED31D40936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-QLFKlOvtUt; Sun, 16 Oct 2022 16:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A46C840445;
	Sun, 16 Oct 2022 16:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A46C840445
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 300E61BF471
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 16:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16D8940947
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 16:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D8940947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5IqXMRYgoht for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 16:45:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91E14409AC
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91E14409AC
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 16:45:19 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id h12so9111152pjk.0
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 09:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=icg9WkR5QjPOmNAMCDF4tibFdkr2+pAHbQ+AajslUgc=;
 b=j8eZrq2JjSRx+c/s6+hCVGdC1JPy+kcih/X3Rd7TlQbHA9CcIbl+dV4U4fePtxR8Iu
 FEsJFD5zysdVYk4bREEM5fQU/XULb/HN+q6uahEbveDGOywbwv/ioqMBslp0cmPlg0Ok
 aEW+hlaGVKS+JSSeWKLSCOX5noO+VTkuAz2hf9Xa2PxoFya096V30nxDIVZG+TXp4VBg
 cwhhW+63CmPWu656YxsORwP88Y4A7ALEeYVwoE7QXwjV4PaHi/sk/FGlmJFLfyUwmxr1
 nRjVFJvJKKENgrbKqmwsIlFpmOTG3r2vw4Ccx1zvb5yLoQzIXR1HSTSqcDawPcsSGndF
 YKYQ==
X-Gm-Message-State: ACrzQf3eEnjmqrVPgn3oGs5p6VSO4HrSGSlod8YuW5h1P5uBKn/tjYbt
 XPVxHrDWyLoaFLaIWJ6Ptd/+U+cNjowmm36snfc=
X-Google-Smtp-Source: AMsMyM5Pzof9fRKT8aqbXlRXF7Mhnho35KwqVEf2isio8tMDU0c0GbfOiPrNiIJmpfHB2XUq/0p6RIGJgEMwcfj53y4=
X-Received: by 2002:a17:90b:1643:b0:20c:c7c7:d598 with SMTP id
 il3-20020a17090b164300b0020cc7c7d598mr28994735pjb.97.1665938718707; Sun, 16
 Oct 2022 09:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
 <CAPi7W828RqJOB3wUx3y68PFHE+M+pt5Ohck+-E-YzPim-C54eQ@mail.gmail.com>
 <CADvTj4p15dWwuUN0rz4D5_tQi+UzuTdoFq76ewYh00xaULhp8A@mail.gmail.com>
 <20221016075056.GI2503@scaer>
 <CADvTj4rBi3uu2bXJy=Tp76NV6Yjk7--EtDOm0kmxi47XOVsQ=Q@mail.gmail.com>
 <20221016160505.GK2503@scaer>
In-Reply-To: <20221016160505.GK2503@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Oct 2022 12:45:06 -0400
Message-ID: <CADvTj4q+ztJca7+MEcOK5-gd94155C0X1s0_5-SvCxp=XXOptg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=icg9WkR5QjPOmNAMCDF4tibFdkr2+pAHbQ+AajslUgc=;
 b=JeYQ5l6om12UhX1ynPj4JPZQNRemhIjhLcOpDDkwofBtxBf4aK29z4pLjkoc8s2huF
 I6n/uQmf72vI9URrKrgfBUrXV+LdMDkDM6+/+b81vxqNLoWJlyb47UXKR9WBPInV4QTQ
 wjJxbM1kA0pVkVfxK9du/BiFaEHPCIvx0H9cn73feRKPnjetfhBV5WdqLaD0fI2ZbTJo
 yukHt9sZM5gBWzvMRZHvd5vbXD7ymRqT3rq2DfGQVpNDDFToipTNwa8wrmdypP6AfGNt
 9WczhZXBsf9VxjafKDVo4OqOrtZNl9IgaL0LBWr+KNGXs/Fo5jQMnObOszUz0jNp0Wey
 0A/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JeYQ5l6o
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 16, 2022 at 12:05 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> +Thomas, Peter, Arnout
>
> On 2022-10-16 11:44 -0400, James Hilliard spake thusly:
> > On Sun, Oct 16, 2022 at 3:51 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2022-10-15 19:21 -0400, James Hilliard spake thusly:
> [--SNIP--]
> > > > Yes, all my autobuilders were recently changed to use make master(will be
> > > > make version 4.4 once released) with top level --shuffle=random.
> > > By disabling parallel build because you are using ana as yet unreleased
> > > version, we remove the parallel build for everyone, which is not very
> > > nice at all.
> > Failures with shuffle mode indicate that the package is not parallel compatible
> > on existing make releases as well, it just makes those bugs more visible.
>
> I never said they were not, and I even said (further on) that it *is*
> interesting to find such bugs.
>
> However, the behaviour so far has been ordering of prerequisites (and
> goals!), and for some packages, that ordering was enough to work in a
> parallel make.
>
> For example, the bearsll parallel issue is caused by the ordering so
> the mkdir is very early. Yes, it is incorrect, but it happens to always
> work in practice. And yes it is easy to fix, here's a patch:

Yeah, I think a lot of these are bugs that usually don't appear most of the
time but may randomly pop up under high load highly parallel conditions.

Randomly failing parallel builds has been an issue I've seen pop up a good
bit for my project builds so I wanted to try and find a way to make them
more visible.

>
>     diff -durN a/mk/mkrules.sh b/mk/mkrules.sh
>     --- a/mk/mkrules.sh 2018-08-14 22:41:54.000000000 +0200
>     +++ b/mk/mkrules.sh 2022-10-16 17:54:22.282069851 +0200
>     @@ -531,23 +531,23 @@
>      (for f in $coresrc ; do
>         b="$(basename "$f" .c)\$O"
>         g="$(escsep "$f")"
>     -   printf '\n$(OBJDIR)$P%s: %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
>     +   printf '\n$(OBJDIR)$P%s: $(OBJDIR) %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
>      done
>
>      for f in $toolssrc ; do
>         b="$(basename "$f" .c)\$O"
>         g="$(escsep "$f")"
>     -   printf '\n$(OBJDIR)$P%s: %s $(HEADERSTOOLS)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
>     +   printf '\n$(OBJDIR)$P%s: $(OBJDIR) %s $(HEADERSTOOLS)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
>      done
>
>      for f in $testcryptosrc $testspeedsrc ; do
>         b="$(basename "$f" .c)\$O"
>         g="$(escsep "$f")"
>     -   printf '\n$(OBJDIR)$P%s: %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
>     +   printf '\n$(OBJDIR)$P%s: $(OBJDIR) %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
>      done
>
>      for f in $testx509src ; do
>         b="$(basename "$f" .c)\$O"
>         g="$(escsep "$f")"
>     -   printf '\n$(OBJDIR)$P%s: %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) -DSRCDIRNAME=".." $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
>     +   printf '\n$(OBJDIR)$P%s: $(OBJDIR) %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) -DSRCDIRNAME=".." $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
>      done) >> Rules.mk
>     Binary files a/mk/.mkrules.sh.swp and b/mk/.mkrules.sh.swp differ
>
> And then adding a CONFIGURE_CMDS that runs mk/mkrules.sh to regenerate
> the Makefile.
>
> > I'm running shuffle with -j1 because that way it's obvious in the logs where the
> > failure is getting hit, otherwise these bugs tend to be transient and
> > difficult to
> > trace as they otherwise are timing dependent.
>
> Yes, this is very interesting to find such bugs, but disabling parallel
> build in packages is not nice when they can be (easily) fixed.

Yeah, I hadn't investigated the root cause in detail as bearssl didn't
appear to be very widely used. At least with per-package directories
disabling parallel build for an individual package shouldn't meaningfully
slow down the build in most cases AFAIU.

I agree fixing the root cause is ideal, I thought our typical approach was
to just mark parallel incompatible stuff with MAKE1 and then fix things
later on as needed. If a lot of packages have dependency ordering issues
I assume we would want to prioritise fixing popular packages that have
long build times first.

What do you think the best strategy there would be?

>
> > > Notes:
> > >   - it *is* interesting to find those bugs;
> > >   - it is sad that the default mode for --shuffle will be random, not
> > >     none.
> > Default is equivalent to none,
>
> Yeah, I noticed the hard way after having my patch rejected in makem as
> you may have noticed. :-/
>
> > I modified my autobuilder runner to pass
> > --shuffle=random.
>
> Again, that is very interesting, but please, please, conordinate with
> the rest of us when you do such changes, because that is very weird, as
> Fabrice noted, to suddenly get build failures out of the blue when
> nothing seemed to have otherwise changed.

I've been experimenting a bit in general with autobuilder settings to try
and fix some issues with poor coverage.

One other reason for testing with shuffle=random is to make higher kconfig
probability values more useful(as otherwise build failures will be concentrated
in packages early in the dependency ordering) :
https://patchwork.ozlabs.org/project/buildroot/patch/20220514214612.3221647-1-james.hilliard1@gmail.com/

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
