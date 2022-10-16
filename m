Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327D1C433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 19:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A991360E7E;
	Sun, 16 Oct 2022 19:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A991360E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8DWcD3_HVHaO; Sun, 16 Oct 2022 19:19:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8F4F60B35;
	Sun, 16 Oct 2022 19:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8F4F60B35
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98EB31BF337
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 19:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80488409FC
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 19:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80488409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AMRH43eoMGDu for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 19:19:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25ADC409F1
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25ADC409F1
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 19:19:05 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 x31-20020a17090a38a200b0020d2afec803so9162946pjb.2
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 12:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NVer3lsE5Zm7RU//3jM5BFlehN2MsGPmaXwcP26DbjI=;
 b=UWOgKKR95zamwpzrakvYSBGdTU3/0DoRPc3Lgv61WjaBLuQLUjcrzzbtKakplQqPp4
 xXZ11h0JtY3WuAFeKtgw4HYKk9LZVkeK90criE68gGVposEXftqAVL8dcFL10OZD3at0
 xiZfjWhOcbWpP1zVXoD4E8JRmR4HjROXgkfDOKJf798s/EwV9i1VMZyVf9wyGNoWKjr1
 hjqLs6j1bph3YtSXDjcaT/BCjhHn/mkiJhwO0oixRRbGITjDJyyELkMlhceX80mzMqhU
 1jR8Jo70mQuKg6XAXsQgOnbHmafpy1sD432J7ylVbrX9UiqOrrAzPewY3h7QLtjIyZte
 TM5w==
X-Gm-Message-State: ACrzQf3rwYM++psXe5dvCCaSvK+QrQKHe5tw4lY3q00Br10OUWqt3EW4
 kuMW+0PXtR/nY36F/xiMN0sshehV+xnlOgSjcIaKNfcWXiXjyw==
X-Google-Smtp-Source: AMsMyM447vvXP4Y1qA9fy7+RZR+asmPA/Efr4c+lsrO7zMukkYbOL/oDAi/AF9FMOd6Hf97LSgOztO7zFoGocEpEKZA=
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id
 n18-20020a170902e55200b00179e79571c5mr8370657plf.57.1665947944492; Sun, 16
 Oct 2022 12:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221015005611.4054933-1-james.hilliard1@gmail.com>
 <20221016162654.GL2503@scaer> <20221016163543.GM2503@scaer>
 <CADvTj4rWp4_G_eBqcCoT4Y7Z40=DkeZ215MyUAXKksOu8aXazQ@mail.gmail.com>
 <20221016184607.GN2503@scaer>
In-Reply-To: <20221016184607.GN2503@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Oct 2022 15:18:52 -0400
Message-ID: <CADvTj4rdTE7MhM-YPUf8PT2zbt1XevwkQq4V-gUDVF4ULPhhTg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NVer3lsE5Zm7RU//3jM5BFlehN2MsGPmaXwcP26DbjI=;
 b=a6s4bazME7sWBds80Gvh0iWSkMixyhCC8UU7B/DLUHvASczbQcEpMQVy3n/r5VaS0D
 osf77Ecpu8h/YIJ7/ZUa+kD3peIfNL3dAahjVK5VXoPDXAlfcRZZ4WX4UK4OL9iJvmDP
 lfwYWKbmXMogg+051o1GaMXwU0i5XJsj1GyRWYQQOQtEL0x1YWjAguoNl5kKJNHPwZIj
 7l3tnwdCNmX2/SYyiMeraeA/lACmoY86kKjkf0isWvC9xtj2jPYbijQDBLKzog6Svjfy
 AwUqzLSrUy/Z5ijhsWcyVe0wqr7eENUPlFHD8IA41qJIWqXuOGl377toNEeq07uHczBS
 yewA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=a6s4bazM
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

On Sun, Oct 16, 2022 at 2:46 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-10-16 12:53 -0400, James Hilliard spake thusly:
> > On Sun, Oct 16, 2022 at 12:35 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
> > > > > -MAKE1 := $(HOSTMAKE) -j1
> > > > > +MAKE1 := $(HOSTMAKE) --eval .NOTPARALLEL:
> > > >
> > > > Packages that do not build in parallel do not because their rules assume
> > > > the ordering is kept.
> > > >
> > > > I don't see how replacing -j1 with --eval .NOTPARALLEL: would cause the
> > > > ordering to be restored.
> > >
> > > Ah, it's in the --shuffle documentation, not in the .NOTPARALLEL one (and
> > > reading .texi source is not my main ability).
> > >
> > > Still, I think my proposal is better, because it is more explicit.
> >
> > We don't want to modify the shuffle value
>
> In this case, yes, we do want to disable shuffling.
>
> Packages that do not build in parallel, do not exactly because of the
> build ordering. So far, we resorted to just forcing -j1 for those
> packages, because -j1 hid away the build order issue.
>
> So, shuffling them even in -j1, would cause build failures.
>
> And as you said, and as the make manual states, .NOTPARALLEL disables
> shuffling.
>
> I.e., technically, those two lines are equivalent (assuming make 4.4):
>
>     MAKE1 := $(HOSTMAKE) --eval .NOTPARALLEL:
>     MAKE1 := $(HOSTMAKE) -j1 --shuffle=none
>
> Except the latter is explicit about its goals: single job and no
> shuffling, while the former is only explicit about not parallel (also I
> do not like that --eval, it feels horribly weird, especially with the
> trailing colon).
>
> What I am saying, is that I prefer we explicitly disable shuffling,
> rather than rely on the implicit behaviour of .NOTPARALLEL.
>
> Finally, my proposal only appends --shuffle=none if it finds --shuffle
> in MAKEFLAGS. If it is not present, we do not need it, either because
> we are make 4.3-or-earlier, or we are make 4.4 without shuffling.

I'll test a little more and send a patch based on that.

>
> > as it's useful for
> > reproducing failures,
>
> This is irrelevant to set MAKE1, because with MAKE1 we know the build
> ordering matters, and that we explicitly state that we do not want to
> be bothered by it.
>
> > although there's currently a bug which doesn't set the seed correctly:
> > https://savannah.gnu.org/bugs/index.php?63215
> >
> > Using .NOTPARALLEL should ensure the shuffle value is still passed down
>
> Sorry, but .NOTPARALLEL disables shuffling, so I am lost: why would it
> matter to have the seed passed down?

Nevermind, it seems --shuffle=none works the same, I assumed it would
cause the submake to drop the initial seed value(for printing in the event
of an error) but it apparently doesn't at least with this patch:
https://savannah.gnu.org/bugs/index.php?63215#comment0

>
> > so that it appears in the failure message(once that bug is fixed) while
> > still disabling parallel build for the parallel incompatible package.
>
> Parallel-incompatible packages are incompatible exactly because the
> build ordering does matter to them, so we do not want to shuffle them.

Right, but we still want to see the seed value on error, even if the package
is using MAKE1, seems to work fine with --shuffle=none though.

>
> > We want to be able to reproduce failures by passing the shuffle seed to the
> > top level make invocation.
>
> This is about debugging our dependency issues, not about the packages'
> Makefiles.

Well seed is supposed to get passed down all the way, otherwise it wouldn't
properly test parallel issues as those can affect both cases.

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
