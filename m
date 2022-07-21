Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9C9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 14:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 084AD84247;
	Thu, 21 Jul 2022 14:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 084AD84247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id USRsSV4rlKD8; Thu, 21 Jul 2022 14:41:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C35A084073;
	Thu, 21 Jul 2022 14:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C35A084073
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9F6B1BF338
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 14:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A068342236
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 14:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A068342236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BWoEHo476Af for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 14:41:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D637F4220F
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D637F4220F
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 14:41:10 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id j1so1739823vsr.4
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 07:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eOKdML3nEbw/VSHBAONnkBVaeRJh9ryAbQRzLkJkr6Q=;
 b=wG4z//lebO+bPP+vpTG3FLQnlgPS9XzbDvPYE108ZvJYPEwuct/4Or7X0AosMbAgJr
 fN5UvAxdLvofMUoCY7kc5jqZzXej3vfWKulggDDyEHfVVEqFiC0XjmT0n0ncLbrDyEvd
 NPtpuMywLsYHmJ5EYDOOnXs07IUmfScWpsHjEqnyAoJCy2UjmOOOpEcOTJIfAOhT6ys0
 XK7ayf0BPELDnfReTGK8ykIU1N3FVGWFe5XsZijliPKT5SvTE6A66tkAyS6WxclGaoDT
 Jn3uXT902x2pwWVcoGsKRDlM7Mx+R1vxL7CrT3AyYr9JqSuTsHpFcx7UlScOHL9rO/6t
 sXpQ==
X-Gm-Message-State: AJIora+8QiQm7fLsc6MrV8cZyXGExWg+noWerE/bSpkKNTmMPlPfMyaw
 X5isMhbTPSZ0C94HuGJT2l6HFexoEHObPLVow94=
X-Google-Smtp-Source: AGRyM1vSef5i4TY2GL+hSv3URLtVmLBi30mNlJoyxqtrHKilXMtaetehrWtFdqETIcTdRYEZUW4ef1KLPzdY3ReQZVk=
X-Received: by 2002:a05:6102:312d:b0:357:6d2a:c115 with SMTP id
 f13-20020a056102312d00b003576d2ac115mr16459545vsh.63.1658414469643; Thu, 21
 Jul 2022 07:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220719130449.334694-1-nolange79@gmail.com>
 <20220719162138.GL2249625@scaer>
 <CADvTj4oVSUD8pRRo=iwoMX3u_ABxf2QX1nr9RpBEOO8w2saOfA@mail.gmail.com>
 <CADYdroOkry3uXZ2vw171SWD5jr6qEKDxEuS5ZSfDEw74MSpgug@mail.gmail.com>
 <CADvTj4pdxz_kYDVG8PryXJ7yASFxgbweWXPEL=E8OqobFBYxBA@mail.gmail.com>
In-Reply-To: <CADvTj4pdxz_kYDVG8PryXJ7yASFxgbweWXPEL=E8OqobFBYxBA@mail.gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 21 Jul 2022 16:40:58 +0200
Message-ID: <CADYdroPBuEMYrjvu9XbBSE6uTiqOtJ832dph_uaoN+eW6-yVHQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eOKdML3nEbw/VSHBAONnkBVaeRJh9ryAbQRzLkJkr6Q=;
 b=AgJ+e3hviakUjDOS7MEZYdMEfyPyFN6ugVEXz0sDp09l+qQwuqFGzWRUdd/4khZ3Np
 YNquxHXGaAmN1qMV4RG7r7RUXLXKm8HmKuCAjzpcYYZO1Nj+Mjia+rARHELTCwYDofGn
 z+plpBNA5CnVi7lWEDlBSid0HFpxqg/ovCLtrd3mrLV9oo5CjcE6U5u0f+iUrqxIveic
 qSXzfPmOtT2qU4AwxNZte4HdqN7btEzGviimACE9ScTqbZi22uq5yAHtK1L+zaKxXhy/
 oQtNRuysE6KkiUP1Jby0Km4FWZ2IxjJFPwk7QT2H/DDtv7Gk26Up0L5XmJWB36bdcTD/
 Zsbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AgJ+e3hv
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 251.3
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mi., 20. Juli 2022 um 18:52 Uhr schrieb James Hilliard
<james.hilliard1@gmail.com>:
>
> On Wed, Jul 20, 2022 at 8:51 AM Norbert Lange <nolange79@gmail.com> wrote:
> >
> > Am Di., 19. Juli 2022 um 23:56 Uhr schrieb James Hilliard
> > <james.hilliard1@gmail.com>:
> > >
> > > FYI I had sent a similar bump earlier:
> > > https://patchwork.ozlabs.org/project/buildroot/patch/20220522011729.117324-1-james.hilliard1@gmail.com/
> > >
> > > On Tue, Jul 19, 2022 at 10:22 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > >
> > > > Norbert, All,
> > > >
> > > > On 2022-07-19 15:04 +0200, Norbert Lange spake thusly:
> > > > > Add config option for the new sysupdate feature.
> > > >
> > > > Honestly, with a package so complex and critical like systemd, I would
> > > > prefer that new features not be added during the bump, but as followup
> > > > patches. The bump should add a force-disable of new features (when
> > > > known), or just leave them as auto-detected or upstream-decided
> > > > defaults.
> >
> > Honestly, I got scolded every time I just left it force-disabled ;)
> > Someone even got to the great lengths of typing the steps into systemd.mk:
> >
> > # - If there are new services:
> > #   - create new options for them (if they really are optional);
> >
> > The features are disabled by default though, so it should not
> > cause havoc.
> >
> > > >
> > > > > Remove upstreamed patch.
> > > > >
> > > > > Update options, manually setdefault options, remove option
> > > >
> > > > Sorry, I don't immediately see what "manually setdefault" means...
> > > > Is there a missing space, and this should be "manually set default" ?
> > > > Or is "setdefault" and actual systemd concept?
> > > >
> > > > (genuinely asking)
> >
> > Missing space
> >
> > > >
> > > > > not available anymore.
> > > > >
> > > > > Set default-user-shell based on wether a couple packages
> > > > > are enabled.
> > > > >
> > > > > Set default-locale to C, this seems the only safe default,
> > > >
> > > > How does that play with BR2_ENABLE_LOCALE_WHITELIST? I think that we
> > > > would want to use the first word of BR2_ENABLE_LOCALE_WHITELIST is it is
> > > > set, falling back to just 'C' otherwise.
> > >
> > > Yeah, we should use 'C.UTF-8' since it's now supported by localedef, I had
> > > sent a patch earlier changing the default but there were uclibc compatibility
> > > issues, since systemd is incompatible with uclibc there's probably a better
> > > approach:
> > > https://patchwork.ozlabs.org/project/buildroot/patch/20220517192439.1034654-1-james.hilliard1@gmail.com/
> > >
> >
> > I on not really familiar how this should be detected, especially if
> > there is an external
> > toolchain used and it should definitely only be one of 'C' or 'C.UTF-8'.
> >
> > The /usr/lib/C.UTF-8 directory has around 2MB, and for my usecase
> > I don't need or want it - unless you need to correctly display/sort strings,
> > apps just copy a binary blob and don't need to know any details.
>
> Main issue is that the regular 'C' locale tends to cause lots of
> issues for anything
> that needs UTF-8 support, which can include a lot of rather unexpected things
> such as simply extracting tar archives with libarchive.
>
> I think python may also not work correctly without a UTF-8 locale:
> https://peps.python.org/pep-0538/

Yeah, that's a rather "fat" installation tho

> I think the only reliably sane locale is C.UTF-8 which is what most distros
> have been moving towards. However there may be cases where just a C
> locale is desired so we may want to have an option for that still, it should not
> however be the default IMO.

As said, that's 2MB for stuff you probably don't use in alot applications
where you would use buildroot instead of a full-blown distro.

>
> >
> > if there is *any* doubt it should be C, and currently there is alot doubt.
>
> Upstream considers C.UTF-8 the preferred default locale:
> https://github.com/systemd/systemd/commit/c9bd01ae902d66acd8647a1cc0167bc0d246cbc8

Thats ok for their primary target (redhat and other full distros),
they also assume
bash to be a reasonable default.

I would not know how to message to buuldroot wether my external toolchain with
an older glibc is "fit" for C.UTF-8.

I will leave it at that for now, just because it doesnt make matters worse
and I dont want to block the version bump.

>
> >
> > > >
> > > > Furthermore, that is not a novelty with v251; v250 already had that
> > > > option, so that should be a separate, preliminary patch.
> > > >
> > > > > users can override this in `/etc/locale.conf`.
> > > >
> > > > > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > > > > ---
> > > > [--SNIP--]
> > > > > diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> > > > > index 3572b25965..838ed13fd5 100644
> > > > > --- a/package/systemd/systemd.hash
> > > > > +++ b/package/systemd/systemd.hash
> > > > > @@ -1,5 +1,5 @@
> > > > >  # sha256 locally computed
> > > > > -sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
> > > > > +sha256  11c9c3fcc13d689615dd2ea79161d1b992087cf1e2a23856d7d7ade0efbddc54  systemd-251.3.tar.gz
> > > > >  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
> > > > >  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
> > > > >  sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> > > > > @@ -11,4 +11,4 @@ sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENS
> > > > >  sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
> > > > >  sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
> > > > >  sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
> > > > > -sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
> > > > > +sha256  177ff657698bc940f9888b7f69e5d734b0933c2859ea264fde8de1700cec40dd  LICENSES/README.md
> > > >
> > > > What has changed in that license file? How does it impact (or not) the
> > > > licensing info we carry?
> > > >
> > > > We have hashes for license files, so that we know they licensing terms
> > > > change when a package is updated. Silently changing the hash kind of
> > > > defeats the purpose for those hashes...
> >
> > One line got added, no changes in the license text itself :
> >
> >  * the following sources are licensed under the **CC0-1.0** license:
> >     - src/systemctl/systemd-sysv-install.SKELETON
> >     - tools/check-includes.pl
> >     - all examples under man/
> > +   - config files and examples under /network
> >
> > The line is still valid IMHO:
> > "CC0-1.0 (few source files, see LICENSES/README.md)"
> >
> > > >
> > > > > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > > > > index 46a4e8de2c..b6fffc553f 100644
> > > > > --- a/package/systemd/systemd.mk
> > > > > +++ b/package/systemd/systemd.mk
> > > > [--SNIP--]
> > > > > @@ -472,6 +474,20 @@ else
> > > > >  SYSTEMD_CONF_OPTS += -Dsysext=false
> > > > >  endif
> > > > >
> > > > > +ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
> > > > > +SYSTEMD_CONF_OPTS += -Dsysupdate=true
> > > > > +else
> > > > > +SYSTEMD_CONF_OPTS += -Dsysupdate=false
> > > > > +endif
> > > > > +
> > > > > +ifeq ($(BR2_PACKAGE_BASH),y)
> > > > > +SYSTEMD_CONF_OPTS += -Ddefault-user-shell=/bin/bash
> > > > > +else ifeq ($(BR2_PACKAGE_ZSH),y)
> > > > > +SYSTEMD_CONF_OPTS += -Ddefault-user-shell=/bin/zsh
> > > > > +else
> > > > > +SYSTEMD_CONF_OPTS += -Ddefault-user-shell=/bin/sh
> > > > > +endif
> > > >
> > > > We already have BR2_SYSTEM_BIN_SH which defines what /bin/sh is, and so
> > > > I think we should use exactly /bin/sh as the default shell:
> > > >
> > > >     ifneq ($(BR2_SYSTEM_BIN_SH_NONE),y)
> > > >     SYSTEMD_CONF_OPTS += -Ddefault-user-shell=/bin/sh
> > > >     endif
> > > >
> > > > If there is not default shell for the system, then there is none for
> > > > users as well. Systemd-defined users that want a specific shell will
> > > > have to explicitly request it: if they have a requirement for a specific
> > > > shell, they can't rely on whatever the default is, so usng /bin/sh is
> > > > exactly what we want.
> > > >
> > > > If BR2_SYSTEM_BIN_SH is empty, it is perfectly possible that there is no
> > > > shell available at all (no standalone shell, no shell in busybox), so we
> > > > don't want to set any default either.
> >
> > If you don't set anything, then '/bin/sh' will be used, so I guess ill
> > just set that
> > unconditionally.
>
> Well /bin/bash is the default if nothing is specified so we should
> override that:
> https://github.com/systemd/systemd-stable/blob/v251.3/meson_options.txt#L223-L224

OK

Regards, Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
