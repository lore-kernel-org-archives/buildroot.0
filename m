Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED33C12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 13:53:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D58506121E
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 13:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D58506121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aleksander.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 928F84014C;
	Wed, 21 Jul 2021 13:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x85Fmiav67x2; Wed, 21 Jul 2021 13:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D32B4015D;
	Wed, 21 Jul 2021 13:53:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D26051BF3BC
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 13:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9B2D4024D
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 13:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aleksander-es.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aQB-aGVPUv4I for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 13:53:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10214401BB
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 13:53:45 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id u11so2947708oiv.1
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9dTGbYI2zo8PrWFfd6a46l/vC38npco3NfWkMyAJvCs=;
 b=oyoDvxEkAKDbltYL++s9bmWkvy+O2vDUvJ09mKjaCV7hB1vAnFpD47qGv4ixFpeGLd
 Z/cnJFZHHVaBU6vBOqf30wLYiipJSRemG5QwibYLCpykuOPf+WucgCt1+73DQiVIlqa9
 xkoO2JExu9T/G8if+XQ0ZFtRr4OGvAqjf8p9co9sm7KTP/OiS0Xvomdwk4pN6MecSp4t
 3SoQbv/XMp5mnLNxJFd2yahmzcm/DB91TD0kWKD9VrwdH0KxG4lyivpLDZgEAVP4CtjN
 FWGqmd6mBRA7hzxU1P540h/SYibtanGynaHXFAzJwQRJBdqlWNDOKCRSkWK/KWM53+1U
 7F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9dTGbYI2zo8PrWFfd6a46l/vC38npco3NfWkMyAJvCs=;
 b=Y03jtdChtSuIJ+3ZwgRRVqlNoUZJpmJRZn6klnbWADnC9na5O9GXeEfVSUPJ7ZQ9gW
 YOGMBn/OZWsZlnPbia1k58vH7X8E8aEnfjcsAh3o+TMr7jHqeuRFQTQH9kcbXOP8So7B
 NPsmBo4FNt3besn1ABQC30Mco1W9zzFE3lVXpxC8Jwdj+4/L38TKYry5z7fjxOA3mtw/
 2NQxRHE6AdmlnIWsEUCxgFWdoLEd4fSCYQ4pkufEKO7bv7bzjEhFDxGnPSe0iaihkhg6
 w09PmahgfMij5Czg9iZa7NBa9dYJi3hTzz74r7yLjP8Xny9/uDIMTMqW3f5sfxFUHZk+
 0bbg==
X-Gm-Message-State: AOAM531ugc6SsozEOoCbhE6TIjldNjHDkB+4+nP7pl64ALTad3iBA1+V
 BkTL2XXaLXJHLgMldd1LMOVHCYgr2RxFcsaJnZxf2Q==
X-Google-Smtp-Source: ABdhPJw8qRjJskLiDb6Mk4Zh3y+LSNp0qmW2LL9fHAWxJJSSSZNpJFPHiIbuxD+wRbO4V9lKWSz8YHbozsu+Bwjvzc0=
X-Received: by 2002:aca:5306:: with SMTP id h6mr24452626oib.67.1626875624909; 
 Wed, 21 Jul 2021 06:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210712091827.335522-1-aleksander@aleksander.es>
 <20210716225449.382c1426@windsurf>
 <CAGm1_kuFhe7U+qYMRiPP2htmfCDR4kmOKFaX0Vnsfh0XvSQVUA@mail.gmail.com>
 <CAAP7ucKbpPfUROc=rm2U4idc23+MOC8TJ405Qxf-M5CkHnz=TQ@mail.gmail.com>
 <CAGm1_kvyEXaH8ZpZZdq5fWJw2ZDrtXS7ZxE4sDRO_uYQ1aKfvQ@mail.gmail.com>
 <CAAP7uc+0Q9w7UJxRQJLtX7t+7cPh+zHF2dqRGWLOqzT6j8Sf8g@mail.gmail.com>
 <CAGm1_kuTdXuZs=ajf2YGu=pUu+caErdMtMbZ8s2D=Ac_oe=WDw@mail.gmail.com>
 <CAAP7ucLkz=OSXLN+UhpDPEcyNDfnX_deodsQK87iMi9_LiEnyA@mail.gmail.com>
 <CAGm1_ksDv2Kuk_s4+NP3Uc8VxBTLcnpDckLyBz6y_hoAWpasAA@mail.gmail.com>
 <CAGm1_ktaWo27F0zNigOOYV7yoMoqGRta_mifiCK0+REB=QYbfw@mail.gmail.com>
 <CAAP7ucJ6RHQVuAsXYztzv1ZeGXBusg0VQ=PqKUW2yvS38tTRng@mail.gmail.com>
 <CAGm1_kss=siZsRr5q9yZeFU92e_UOf1OBVV2R+J3pGGfg3mBZA@mail.gmail.com>
 <CAAP7uc+P_zsLA2en7YxWmY2TD4yFZO20QZ3oKcaOj97udtKyXQ@mail.gmail.com>
 <CAGm1_ks2ncgwf=dSMNdY+ODX7mDH4ECuQRivXscqy5AW3P-_pA@mail.gmail.com>
 <CAAP7ucKEMdCYrwECKxUX-6puv1zk=-YabOi-HcXBDAnw72ewng@mail.gmail.com>
 <CAGm1_kuutFKGY++CJncN1auo_UZ23gFFnJdU+aL8W-ML-1oD=A@mail.gmail.com>
In-Reply-To: <CAGm1_kuutFKGY++CJncN1auo_UZ23gFFnJdU+aL8W-ML-1oD=A@mail.gmail.com>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed, 21 Jul 2021 15:53:33 +0200
Message-ID: <CAAP7ucLWHjn4UucCyFOapHdmEvKmq9WqXgAOiZQ754NUpB6CDQ@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>, Aduskett@gmail.com
Subject: Re: [Buildroot] [PATCH] package/libmbim: bump to version 1.24.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hey,

> > > > > > > INTROSPECTION_MAKEFILE is the problem. If I replace the path to the
> > > > > > > path inside my BR, everything is working (the same issue is with
> > > > > > > Qmi-1.0.typelib).
> > > > > > >
> > > > > >
> > > > > > The introspection.m4 included in the sources is a bit outdated, the
> > > > > > attached patch syncs it with the newest one I have installed in my
> > > > > > system. I do see some fixes in the INTROSPECTION_MAKEFILE definition
> > > > > > in the patch, so these may be enough. Any chance you can give this
> > > > > > patch a try? You may need to force autoreconf as we're patching a m4
> > > > > > file-
> > > > >
> > > > > >>> libmbim 1.24.8 Patching
> > > > >
> > > > > Applying 0001-build-fix-introspection-setup-in-cross-builds.patch using patch:
> > > > > patching file m4/introspection.m4
> > > > > >>> libmbim 1.24.8 Updating config.sub and config.guess
> > > > > for file in config.guess config.sub; do for i in $(find
> > > > > /home/user/MyProjects/oss/br-test-v2/s2srv/build/libmbim-1.24.8 -name
> > > > > $file); do cp support/gnuconfig/$file $i; done; done
> > > > > >>> libmbim 1.24.8 Configuring
> > > > > >>> libmbim 1.24.8 Autoreconfiguring
> > > > > libtoolize: putting auxiliary files in '.'.
> > > > > libtoolize: copying file './ltmain.sh'
> > > > > libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
> > > > > libtoolize: copying file 'm4/libtool.m4'
> > > > > libtoolize: copying file 'm4/ltoptions.m4'
> > > > > libtoolize: copying file 'm4/ltsugar.m4'
> > > > > libtoolize: copying file 'm4/ltversion.m4'
> > > > > libtoolize: copying file 'm4/lt~obsolete.m4'
> > > > > configure.ac:65: error: Unexpanded AX_ macro found. Please install GNU
> > > > > autoconf-archive
> > > > >       If this token and others are legitimate, please use m4_pattern_allow.
> > > > >       See the Autoconf documentation.
> > > > > configure.ac:66: error: Unexpanded AX_ macro found. Please install GNU
> > > > > autoconf-archive
> > > > >
> > > >
> > > > Gah... forgot autoconf-archive is a prerequisite when autoreconf-ing.
> > >
> > > My BR has autoconf-archive installed. Why does it fail?
> > >
> > > > I don't have time myself to test it right now, but the steps to do
> > > > this properly would be to git clone the libmbim git repo, switch to
> > > > mbim-1-24 branch, apply the patch, "NOCONFIGURE=1 ./autogen.sh &&
> > > > ./configure --enable-gtk-doc && make && make distcheck". And once you
> > > > have the release tarball, use that in buildroot.
> > > >
> > > > I can probably play with that later today if you don't do it earlier :)
> > >
> > > It doesn't work :-( Though I see introspection.m4 file in
> > > output/build/libmbim/m4 folder after replacing the tarball, the result
> > > in Makefile is still the same.
> > >
> >
> > I've opened this issue in GNOME bugzilla:
> > https://gitlab.gnome.org/GNOME/gobject-introspection/-/issues/391
> > I believe I know how to fix it, I'm giving it a try now.
>

Nah, it's getting out of hand, don't have time to get deep into
solving the bug today I'm afraid.

I think it could be some lack of alignment between the latest
gobject-introspection release and what buildroot is doing in
GOBJECT_INTROSPECTION_INSTALL_WRAPPERS (in
package/gobject-introspection/gobject-introspection.mk). That logic is
replacing how girdir and typelibdir are being built, using exec_prefix
instead of datadir and libdir, and in my build, that gives us some
unexpected results when INTROSPECTION_GIRDIR and
INTROSPECTION_TYPELIBDIR are built:

INTROSPECTION_GIRDIR = /share/gir-1.0
INTROSPECTION_TYPELIBDIR = /lib/girepository-1.0

As if the exec_prefix replacement gave an empty string?

And the same kind of issue when building INTROSPECTION_MAKEFILE. The
buildroot specific wrappers attempt to define a datarootdir based on
$(libdir)/../share, but still, we're getting a path to the host prefix
instead:

INTROSPECTION_MAKEFILE =
/usr/share/gobject-introspection-1.0/Makefile.introspection

The fact that libmbim ships its own introspection.m4 file also doesn't
help clear the issue, even if I think it could be unrelated to the
actual problem (the bug is reproduced in the very same way when
updating the file in libmbim to the newest one). E.g. the
gobject-introspection from release 1.68 does some AS_AC_EXPAND()
operations on datadir and libdir, and the one shipped with libmbim
doesn't do any of that. Maybe I should also make it a requirement when
building from git, instead of shipping our own, so that the
introspection.m4 from /usr/share/aclocal is used, not sure about that
though.

Adding Adam Duskett in CC to see if he has any idea about this
problem. It's easily reproducible here as well, with a clean buildroot
build using glibc toolchain, python3 enabled, gobject-introspection
enabled, and libmbim enabled (and without gobject-introspection in the
host). Adam, could you help us solve this issue?

>
> Just curious, are you going to port mm and libs to meson?
>

libmbim and libqmi are already ported in git master, next releases
will support both autotools and meson. MM is not ported yet, patches
welcome :)

-- 
Aleksander
https://aleksander.es
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
