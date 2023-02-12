Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D380AC05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 11:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A06660E2E;
	Sun, 12 Feb 2023 11:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A06660E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iq8eqszqStZl; Sun, 12 Feb 2023 11:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F1160E1B;
	Sun, 12 Feb 2023 11:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F1160E1B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AF101BF599
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 11:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0275A41496
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 11:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0275A41496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0k2nvVcdlnI for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 11:17:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89CCA410EA
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89CCA410EA
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 11:17:52 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-16dcb07b805so5628959fac.0
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 03:17:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0INdIO5+3GzoB49D/OcWm1C6KVUCyigo38Egvd/MKXw=;
 b=NYMamcm6FhQsJ9Wt0azRSDyguGNZaLIek3yI1t3KqXOv7mFWTQxCyFNeFsl2uwOmd8
 RnKWUkXsJ/pPhLym5LG4PF2LZf/bYK1MUq468wGNQ0xIEblIs8CG8fAtWGFq0p1PDD16
 bd68PrlpQZqHVByXc6lmqa07nz5Jr8oP2tBhe28ZNTAlytKjeC5KFQvCIlAKiJM+MVqn
 nD/BWMNqsMHNTtM2iZ1/kOlzm7roUeHA72ZVbdzvmfP8/xlXUQDgXpzgYDQW1xV62NSG
 4T0/IGcPxaM8N4v4CIZJE3rpZfjBFMrXZF2K+W+AdLDvCGX0Y26tJzYNpNGaILZ07ZRs
 5T9g==
X-Gm-Message-State: AO0yUKXZERB6vRHxxETA2KP4KTSTF1/fTbBN4zdn2yn23y6fi0YsNfKN
 aVWQEjAKg/cT4Z/STTkhXkP3tZb/oViJQUIinhs=
X-Google-Smtp-Source: AK7set/cGjdlMqE5z4h8JZ68WGTdwv7rGviBM+OS557T+h00CQ+2pBxjlL2NQHKXy1ToJhI+63cQl3xJ+BtUYiw67hI=
X-Received: by 2002:a05:6870:4388:b0:16d:cc4c:de8 with SMTP id
 r8-20020a056870438800b0016dcc4c0de8mr441416oah.18.1676200671359; Sun, 12 Feb
 2023 03:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
 <20230212094205.GK2796@scaer>
 <CADvTj4oC6WXD=n3zMyBMZuCiZvra3PztQ9YhpDfZ72cJqeq0SQ@mail.gmail.com>
 <20230212101112.GL2796@scaer>
 <CADvTj4rnf9zZfsX54nqQONjUdoR-Ok13d=oi9oJRfw6tnP7adA@mail.gmail.com>
 <20230212105722.GM2796@scaer>
In-Reply-To: <20230212105722.GM2796@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 12 Feb 2023 04:17:39 -0700
Message-ID: <CADvTj4qAFrPZKMTieyKDJ--M-Gqm2+bg_7ugnDh3q8Wi2CB08g@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0INdIO5+3GzoB49D/OcWm1C6KVUCyigo38Egvd/MKXw=;
 b=nzds6OZxFf0BOyiQYWbdkAPkVJ0m7lYiuC0MXUfjvR22uJPRoyaVItyYlcQr+ISB5q
 uFabCK919quqp3fzR8uWuSWYDS+TMocR7U+uLtgS66w2XcCYH0SE1pokCfAmy6vAtjiC
 Fvpe5ivxERoHL6IKRJHd2JBMRbLNOb0wut53Yp2veK0cyiyTE1cTWQfGY/Cxa4SmcF32
 0MHjIN/bXLJFVeyp6Cnpk++Ft9oKB2KtfFRinu2ODbuId1WpN8emuTeLfhD/bBnGVvQt
 Ur49QaiNxIxAi8jNAtO8koe7NTj/bhxKpe1kfHYGU/3CMX1jvffq38VFwqBeVPAV6Y6T
 oFcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nzds6OZx
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

On Sun, Feb 12, 2023 at 3:57 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2023-02-12 03:22 -0700, James Hilliard spake thusly:
> > On Sun, Feb 12, 2023 at 3:11 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > >
> > > James, All,
> > >
> > > On 2023-02-12 03:02 -0700, James Hilliard spake thusly:
> > > > On Sun, Feb 12, 2023 at 2:42 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > > On 2022-10-17 21:46 -0600, James Hilliard spake thusly:
> > > > > > To ensure the evaluation order is always correct use double colon
> > > > > > rules to make the evaluation order explicit as per make docs:
> > > > > >
> > > > > > The double-colon rules for a target are executed in the order they
> > > > > > appear in the makefile.
> > > [--SNIP--]
> > > > > So, I'd like that we get another way to fix that, if possible...
> > > > I have unfortunately not found any other method to fix the execution
> > > > ordering...
> > >
> > > What about something along the lines of (untestd!):
> > >
> > >     $(1)-rebuild: $(1): $(1)-clean-for-rebuild
> > >     $(1)-rebuild: $(1)
> >
> > That would appear to be invalid syntax.
> >
> > >
> > > We already use such a construct in package/pkg-kconfig.mk, but only
> > > once, so this is not as if it were widespread either...
> >
> > I don't see anything like that there,
>
>     240:  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/.kconfig_editor_%
>
> So, this looks like it is named "target pattern", and it works with a
> pattern (eh!).
>
>     $ cat Makefile
>      1  all: a
>      2
>      3  a:
>      4          @echo a
>      5
>      6  a-clean:
>      7          @sleep 1
>      8          @echo a-clean
>      9
>     10  a-rebuild: %-rebuild: %-clean
>     11  a-rebuild: a
>
> However, that does not work with parallel builds:
>
>     $ make
>     a
>
>     $ make a
>     a
>
>     $ make a-rebuild
>     a-clean
>     a
>
>     $ make -j a-rebuild
>     a
>     a-clean
>
> However, you stated in a previous reply:
>
>     So unlike the legal-info issue using .NOTPARALLEL would not work
>     here as these make targets do need to work with parallel builds.
>
> I don't think that's true. Indeed, foo-rebuild is usually done after a
> ful build, when iterating over the foo package, iether to test a new
> source tree (with ocerride-ssrcdir) or to test fixes in foo.mk. In
> either case, we do not need a top-level parallel build, because only one
> package, foo, will be built.
>
> So, even in this case, we should be able to use .NOTPARALLEL, no?

Breaking parallel build for foo-rebuild would be rather unexpected behavior
as foo-rebuild does work for full builds as well and one may default to using
foo-rebuild instead of a foo target for various reasons(to ensure that a package
is always rsynced from an overridden source directory for example).

I see no good reason to disable parallel build on it when simply ordering the
dependency execution order fixes the issue.

>
> It also means that the kconfig rule I mentionned above, does not work
> with top-level parallel builds, but that's OK: it's only used to spawn
> kconfig configurators (menuconfig et al.), so it should not be used with
> top-level parallel, and thus should require .NOTPARALLEL as well.

Might be better to use double colon rules there as well, they are more
explicit than using .NOTPARALLEL IMO as .NOTPARALLEL doesn't
specify an execution order, also it can potentially introduce accidental
performance regressions.

>
> Meh, TLPB and shuffling are really uncovering issues everywhere... :-(

Better to make them very obvious so they can be fixed IMO.

Once the known issues are fixed I can run shuffle mode on my autobuilders
to uncover remaining issues.

>
> Regards,
> Yann E. MORIN.
>
> > just this which isn't doing anything
> > unusual with multiple prerequisites that require a specific execution
> > order like the re{install,build,configure} rules in pkg-generic.mk:
> >
> > # Force olddefconfig again on -reconfigure
> > $(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure
> >
> > $(1)-clean-kconfig-for-reconfigure:
> >     rm -f $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
> >
> > >
> > > Still, I think it is more easy to read...
> > >
> > > Regards,
> > > Yann E. MORIN.
> > >
> > > --
> > > .-----------------.--------------------.------------------.--------------------.
> > > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > > '------------------------------^-------^------------------^--------------------'
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
