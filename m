Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428EDC636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 10:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C48CB40135;
	Sun, 12 Feb 2023 10:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C48CB40135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9NbDDfIwJ8B; Sun, 12 Feb 2023 10:02:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C217B4014E;
	Sun, 12 Feb 2023 10:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C217B4014E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B89831BF332
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 10:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 910184167F
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 10:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 910184167F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFe-EJgbgYTU for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 10:02:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13972415EF
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13972415EF
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 10:02:15 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id dt8so8098405oib.0
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 02:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7sv6X/xyVx5P7tNFRPJscjUVYEvTIa6RyUxXCiGHLr0=;
 b=tTnTkGJP4W9OVShFnrvgIXOcVQJ4DWoJlO282rPhHuwqIZMUWWxHi6Xq6oJ6lDt08b
 yAdOwKSE7Yn/PDX/aGM3uW5V4/RORRi7JFUAPt4xuEgQ9R35NvXzFAw2BqTzmstH97Ae
 Mag/UixRYkHDAMcMMjeRRqjPkvlrfvA3StKvzwrVpWxbZw9gUSrvdSNe4+dQJLp7+1z2
 2qECmuXB89hP3Njq4S5JHfOzJF1g6q3FAlCSppkKMVVt4X4tgpXoav/79BrEp7qkINF5
 6844DQyFm7Y0GY4bZ9a4+t2legGYFGTD21gnpyS0+lV5bF7RHoql9JSwDf3Qp9ii36B4
 GI4w==
X-Gm-Message-State: AO0yUKUdDk2YB1q14d54Z+NF6whjt2pf/TG9sQJumMT5MFMa/ZXWTkLC
 evdBrMpRVeZzYJWERXqY85yLxycS1kyMEGZs30A=
X-Google-Smtp-Source: AK7set8xoVQxk35jdd/3GmUb7gUeKAgh8b0bgQQkGcaxG3VN8fAdGHtvOWkVgLtauRs7OfkXFXrYxdqatUY3ILmDfXo=
X-Received: by 2002:a05:6808:13c3:b0:37d:75ae:a316 with SMTP id
 d3-20020a05680813c300b0037d75aea316mr241037oiw.18.1676196134800; Sun, 12 Feb
 2023 02:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
 <20230212094205.GK2796@scaer>
In-Reply-To: <20230212094205.GK2796@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 12 Feb 2023 03:02:03 -0700
Message-ID: <CADvTj4oC6WXD=n3zMyBMZuCiZvra3PztQ9YhpDfZ72cJqeq0SQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7sv6X/xyVx5P7tNFRPJscjUVYEvTIa6RyUxXCiGHLr0=;
 b=S06/lMIoekqWw0gP6bW/yr1Cl/qu+cKqeKFCqgU+gGMpnmrtH1P4+0WAN9uOLRbPCD
 ba9Va5Bad4Ze74rSfyltKjNCjZZCOWozZOLoaquyjup6D/PES0Yvyc1D82DIRHZUz/fE
 rhG72j5Bl1/G3bv6+b0l8Yy8mx/28N3LpSBKq3MCOUgVe6hGt2ic+eNf+cXIEa4XiY/J
 DFE73yPjul71Wft6H92+gZMVQ8g9sDiBZ4rU7PflgUzHyOIMwr3eeCTcYJsmwSauWAAg
 /y/2M2/rUMufgXLpV0NTZZ+09Uqe5i7CTrPDxoLoespxuC8Rn4ilxdc0TnhP9JDa+mMI
 kVFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S06/lMIo
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order
 for re{install, build, configure}
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Feb 12, 2023 at 2:42 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> Thanks again for working on such grunt work, it's much appreaciated!
>
> On 2022-10-17 21:46 -0600, James Hilliard spake thusly:
> > These command rely on the clean operations being first so that the
> > stamp files being deleted will rebuild the targets.
> >
> > The execution ordering of the clean and rebuild operations may
> > change, for example if --shuffle=reversed is set.
> >
> > To ensure the evaluation order is always correct use double colon
> > rules to make the evaluation order explicit as per make docs:
> >
> > The double-colon rules for a target are executed in the order they
> > appear in the makefile.
>
> I am not convinced that we should switch over to using double-colons.
>
> As I reviewed your other related patch about legal-info [0], the make
> manual [1] suggests that double-colons are rally intended for cases
> where "the method used to update a target differs depending on which
> prerequisite files caused the update" and "double-colon rules really
> make sense are those where the order of executing the recipes would not
> matter".

This appears to be the only documented method of enforcing execution
order without disabling parallel builds...that I've come across at least.

>
> So, we'd use a mechanism where order should not matter, to solve an
> issue with ordering. That'd be weird...
>
> Yes, the manual states that "double-colon rules for a target are
> executed in the order they appear in the makefile", but that really
> looks like a side-effect of another goal.

Yeah, I agree it's not really the intended use case for double-colon rules,
however the ordering behavior is documented so I would not expect it to
break.

>
> Also, we'd need to carefully review all our Makefile to ensure that
> there are no other cases wehre ordering of prerequisites matter. We'd
> also have to be careful every time we introduce a new rule and remember
> to check whether it depends on the ordering prereauisites or not, adn
> worse yet, also whether we can afford the rule to be parallel-safe or
> not (see the explanation for that in the legal-info review).

So unlike the legal-info issue using .NOTPARALLEL would not work
here as these make targets do need to work with parallel builds.

>
> Having colons and double-colons is going to be quite a headache... We
> already have issues with remembering that we need to use $$ to expand
> variables in some places, and the rules there are relatively clean and
> explicit, but for the :: case, I'm afraid that's going to be a bit more
> complex.

I don't think we have all that many of these issues, but I could be wrong.

The clean-for-re{install, build, configure} make targets are a bit hacky
to begin with so I don't think make was intended to handle those cases
in the first place. We're already in unintended feature use case territory
here so this doesn't seem to make things much worse.

>
> We currently have a single location where we use double-colon:
>     support/kconfig/Makefile.br
>
> which is added by our patch against kconfig:
>     support/kconfig/patches/10-br-build-system.patch
>
> which dates back to 2010:
>     7c524dd0b683 Clean up our patches against kconfig
>
> which got in three in 2007:
>     a665ed34960b - pull kconfig from linux-2.6.21.5
>
> So, I'd like that we get another way to fix that, if possible...

I have unfortunately not found any other method to fix the execution
ordering...

>
> Again, thanks a lot for spending efforts in that area, this is really
> great!
>
> [0] https://lore.kernel.org/buildroot/20230212091914.GJ2796@scaer/
> [1] https://www.gnu.org/software/make/manual/make.html#Double_002dColon
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/pkg-generic.mk | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index f24e03a325..6cb461af90 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -1057,17 +1057,20 @@ endif
> >                       rm -f $$($(2)_TARGET_INSTALL_IMAGES)
> >                       rm -f $$($(2)_TARGET_INSTALL_HOST)
> >
> > -$(1)-reinstall:              $(1)-clean-for-reinstall $(1)
> > +$(1)-reinstall::             $(1)-clean-for-reinstall
> > +$(1)-reinstall::             $(1)
> >
> >  $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
> >                       rm -f $$($(2)_TARGET_BUILD)
> >
> > -$(1)-rebuild:                $(1)-clean-for-rebuild $(1)
> > +$(1)-rebuild::               $(1)-clean-for-rebuild
> > +$(1)-rebuild::               $(1)
> >
> >  $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
> >                       rm -f $$($(2)_TARGET_CONFIGURE)
> >
> > -$(1)-reconfigure:    $(1)-clean-for-reconfigure $(1)
> > +$(1)-reconfigure::   $(1)-clean-for-reconfigure
> > +$(1)-reconfigure::   $(1)
> >
> >  # define the PKG variable for all targets, containing the
> >  # uppercase package variable prefix
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
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
