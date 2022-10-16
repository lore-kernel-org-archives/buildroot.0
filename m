Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB92C4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 16:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABDB94151E;
	Sun, 16 Oct 2022 16:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABDB94151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9pl6aZbgOp4; Sun, 16 Oct 2022 16:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22A894146F;
	Sun, 16 Oct 2022 16:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22A894146F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 348121BF471
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 16:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C6358177A
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 16:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C6358177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Odv6pnL4vYVr for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 16:53:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14D658176F
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14D658176F
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 16:53:19 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id 70so9067062pjo.4
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 09:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CX1kAhaP0FsKANnt8wR86BiLWBwdg3WMrsoIzJXRe8E=;
 b=PQP/gsrQyKHINk2rkAmo5qDOBBNq9gIajuKrW4084NM15VgFqjjkP/kgpCEUk4SXmJ
 fMDurxUFVIgztv7R4uK6n6nbtOlLEhsaRgiFBr+0SYN6IxIrnoGD9O+ErRTz5bho5k7/
 utL3+rbOeXbRD4Oou+hRblMl9hEVoD53kn1WdbHC347/qtGxxxGsRFUo6b5EOfMs6fPb
 sJ9C7IVjhwGUABXI5XdZEC8v/ZbJ1cMXJWkey1YzU8d38w/gVQJ9J/hBkbJHTNLLVSXp
 Y0B1n4l0c0jA9P1SvB4yekk6jaiRuAPJ2qv2rcQuzehmA3D36ArLjlguDOmVcJFZqmf+
 rxPw==
X-Gm-Message-State: ACrzQf2inh8hucWqU0pc9g2z0HqON+/1+27zWFuP0lHy/i4IKX1yq9fg
 pq5xDS1mErqrFDUMpqJHnqdBD3lnv9+15G+qYpSDYY+GUEpZWw==
X-Google-Smtp-Source: AMsMyM5MQBgDV2xh16y+Cx0GP+rYhIFfyr73KrK+eLlq+mQOfAUt0niHiSoQFHX7fnrQk54BpswxSmHe6zdW85FcPiA=
X-Received: by 2002:a17:90b:1643:b0:20c:c7c7:d598 with SMTP id
 il3-20020a17090b164300b0020cc7c7d598mr29023494pjb.97.1665939198422; Sun, 16
 Oct 2022 09:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221015005611.4054933-1-james.hilliard1@gmail.com>
 <20221016162654.GL2503@scaer> <20221016163543.GM2503@scaer>
In-Reply-To: <20221016163543.GM2503@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Oct 2022 12:53:06 -0400
Message-ID: <CADvTj4rWp4_G_eBqcCoT4Y7Z40=DkeZ215MyUAXKksOu8aXazQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CX1kAhaP0FsKANnt8wR86BiLWBwdg3WMrsoIzJXRe8E=;
 b=qqdXxsZPO+YDvgl6ePEFSFS85KkG9fdMOsrqKKzIO8S5EhO6Na3uN73yXP63+8+QCW
 tMg1OOJQa9DfaofvkSPIN/FlrSvyWJRg+rHo2ZsT/LmruGE5sjDmD9tIBWUeRZiHu5s3
 ni5rrfCju89pekon4MJVXC0jZGSqyi2lJm6Yqx6SmJGWt1blHZz2khicpB3QiyaZ+GEd
 EHIXXlgDRnwNdvJK6UF+X+tqxtCoim9g93qcWmaM6WrdBu1vExiHhzLQ78nqOq7n05V4
 HQzyr6EDg7egROc2YsMXlXyfbFY7372Ez6XndaAJajghDMVboCHN1O28P11oP/nVxl1J
 IdEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qqdXxsZP
Subject: Re: [Buildroot] [PATCH 1/1] package/Makefile.in: set .NOTPARALLEL
 for MAKE1
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

On Sun, Oct 16, 2022 at 12:35 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> On 2022-10-16 18:26 +0200, Yann E. MORIN spake thusly:
> > James, All,
> >
> > On 2022-10-14 18:56 -0600, James Hilliard spake thusly:
> > > Make 4.4 introduces a shuffle mode which randomizes prerequisites
> > > in order to better flush out issues with parallel builds, as this
> > > mode randomizes prerequisites even when using -j1 builds we must
> > > instead explicitely mark parallel incompatible builds using the
> > > .NOTPARALLEL special target which disables prerequisites
> > > randomization when running in shuffle mode.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  package/Makefile.in | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/package/Makefile.in b/package/Makefile.in
> > > index 43d214bcbe..2327849a1f 100644
> > > --- a/package/Makefile.in
> > > +++ b/package/Makefile.in
> > > @@ -17,7 +17,7 @@ else
> > >  PARALLEL_JOBS := $(BR2_JLEVEL)
> > >  endif
> > >
> > > -MAKE1 := $(HOSTMAKE) -j1
> > > +MAKE1 := $(HOSTMAKE) --eval .NOTPARALLEL:
> >
> > Packages that do not build in parallel do not because their rules assume
> > the ordering is kept.
> >
> > I don't see how replacing -j1 with --eval .NOTPARALLEL: would cause the
> > ordering to be restored.
>
> Ah, it's in the --shuffle documentation, not in the .NOTPARALLEL one (and
> reading .texi source is not my main ability).
>
> Still, I think my proposal is better, because it is more explicit.

We don't want to modify the shuffle value as it's useful for
reproducing failures,
although there's currently a bug which doesn't set the seed correctly:
https://savannah.gnu.org/bugs/index.php?63215

Using .NOTPARALLEL should ensure the shuffle value is still passed down
so that it appears in the failure message(once that bug is fixed) while
still disabling parallel build for the parallel incompatible package.

We want to be able to reproduce failures by passing the shuffle seed to the
top level make invocation.

>
> Regards,
> Yann E. MORIN.
>
> > Instead, I would have expected we do something like:
> >
> >     # Only build one job at a time, *and* to not randomise goals and
> >     # prerequisites ordering in make 4.4+
> >     MAKE1 := $(HOSTMAKE) -j1 $(if $(findstring --shuffle,$(MAKEFLAGS)),--shuffle=none)
> >
> > Regards,
> > Yann E. MORIN.
> >
> > >  override MAKE = $(HOSTMAKE) \
> > >     $(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
> > >
> > > --
> > > 2.34.1
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
