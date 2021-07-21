Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D38C12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 12:55:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 087E16120C
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 12:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 087E16120C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aleksander.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB848405B8;
	Wed, 21 Jul 2021 12:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzsE8_y_WfHn; Wed, 21 Jul 2021 12:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1F62405BA;
	Wed, 21 Jul 2021 12:55:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E14411BF3F7
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 12:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D053782FF9
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 12:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aleksander-es.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9nF9me4BhPL for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 12:55:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EC4E82977
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 12:55:48 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 j1-20020a0568302701b02904d1f8b9db81so1913363otu.12
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 05:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LXQ3SxxLu92lV6OixpROsiEre9/qTjoN3GyJw05RHYs=;
 b=sHff6HZRdrhmPDeAvUARtSaUj1miyTLyseDoSutKZ91a8b7wHyMrEEUBqSazWaLiWA
 g/pOweaeiciB0aH1s07oxTD3etkUMlAqW72yZB8vrgm/jGEQIVbLwrEWMP1xCG285kyi
 BzS+MTXI/mNkKNXLvFlYnjHd8EnIzHSXYtGt9PMHY1EbeM2H4ChU/G2ShvR7I6axtvLY
 qYWYom++1o9MbXLN938UQMOVnp8y2FGoLmMlFK8kLWx/2we9FaRGajkvip4jKUwvbYYy
 YadhVjJuLiHbOOOLWmIWQY/KuiC2oPN4Yvts1kU50uYD1j2ry2w1elBd3CKIWKdzoloI
 seCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LXQ3SxxLu92lV6OixpROsiEre9/qTjoN3GyJw05RHYs=;
 b=Xhqgzu2eDURCSXsMlaviZPD4v7US4C2p6UHbt0rz1iTDidkCqM23Xu6kDc2qHFs6g1
 sPlF9w3iB6BJvVcwOTUSFLhyLeF4LPlHwgHhzHZjouQqhc7ITB+sxApXf/ymhkS0xVXa
 6XR1QaN3fz2++27xu5zRUu9/kryBx04MxrTz7gYg3Q8V37vokc6Fds25rV0D8ad3hqWB
 JHIBZFO1y6BQlmTXJsou5n96/2AQ3+dvlcoiMQmCgo6ezRYsarQ20TcDcEllj2WrZiJC
 jP6xcpoIukj2qusRqzFf/8n0HUPzIbQ2ATZWsJGntIJmrwlCA6cCV9YgduE32ugvxOmG
 NsXQ==
X-Gm-Message-State: AOAM533vYSvu9n1h1awb9tM6DncxO17Qa3gfr8n6+oeTif35WZLALo/Q
 de9SRUhNoqNFVnpii5IwlS+TfCbHpBJGT68oXHnOoa4npGqgAA==
X-Google-Smtp-Source: ABdhPJwBEMEoEYOUtC5Bdv7qWUW+xsBc920Cz55IzqRP4XlrfadnyHM1L4hHyKYYAJAt92aHgfAgp0v25RDPSfQYY5c=
X-Received: by 2002:a05:6830:3143:: with SMTP id
 c3mr11270242ots.229.1626872147973; 
 Wed, 21 Jul 2021 05:55:47 -0700 (PDT)
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
In-Reply-To: <CAGm1_ks2ncgwf=dSMNdY+ODX7mDH4ECuQRivXscqy5AW3P-_pA@mail.gmail.com>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed, 21 Jul 2021 14:55:36 +0200
Message-ID: <CAAP7ucKEMdCYrwECKxUX-6puv1zk=-YabOi-HcXBDAnw72ewng@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
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

> >
> > > > > INTROSPECTION_MAKEFILE is the problem. If I replace the path to the
> > > > > path inside my BR, everything is working (the same issue is with
> > > > > Qmi-1.0.typelib).
> > > > >
> > > >
> > > > The introspection.m4 included in the sources is a bit outdated, the
> > > > attached patch syncs it with the newest one I have installed in my
> > > > system. I do see some fixes in the INTROSPECTION_MAKEFILE definition
> > > > in the patch, so these may be enough. Any chance you can give this
> > > > patch a try? You may need to force autoreconf as we're patching a m4
> > > > file-
> > >
> > > >>> libmbim 1.24.8 Patching
> > >
> > > Applying 0001-build-fix-introspection-setup-in-cross-builds.patch using patch:
> > > patching file m4/introspection.m4
> > > >>> libmbim 1.24.8 Updating config.sub and config.guess
> > > for file in config.guess config.sub; do for i in $(find
> > > /home/user/MyProjects/oss/br-test-v2/s2srv/build/libmbim-1.24.8 -name
> > > $file); do cp support/gnuconfig/$file $i; done; done
> > > >>> libmbim 1.24.8 Configuring
> > > >>> libmbim 1.24.8 Autoreconfiguring
> > > libtoolize: putting auxiliary files in '.'.
> > > libtoolize: copying file './ltmain.sh'
> > > libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
> > > libtoolize: copying file 'm4/libtool.m4'
> > > libtoolize: copying file 'm4/ltoptions.m4'
> > > libtoolize: copying file 'm4/ltsugar.m4'
> > > libtoolize: copying file 'm4/ltversion.m4'
> > > libtoolize: copying file 'm4/lt~obsolete.m4'
> > > configure.ac:65: error: Unexpanded AX_ macro found. Please install GNU
> > > autoconf-archive
> > >       If this token and others are legitimate, please use m4_pattern_allow.
> > >       See the Autoconf documentation.
> > > configure.ac:66: error: Unexpanded AX_ macro found. Please install GNU
> > > autoconf-archive
> > >
> >
> > Gah... forgot autoconf-archive is a prerequisite when autoreconf-ing.
>
> My BR has autoconf-archive installed. Why does it fail?
>
> > I don't have time myself to test it right now, but the steps to do
> > this properly would be to git clone the libmbim git repo, switch to
> > mbim-1-24 branch, apply the patch, "NOCONFIGURE=1 ./autogen.sh &&
> > ./configure --enable-gtk-doc && make && make distcheck". And once you
> > have the release tarball, use that in buildroot.
> >
> > I can probably play with that later today if you don't do it earlier :)
>
> It doesn't work :-( Though I see introspection.m4 file in
> output/build/libmbim/m4 folder after replacing the tarball, the result
> in Makefile is still the same.
>

I've opened this issue in GNOME bugzilla:
https://gitlab.gnome.org/GNOME/gobject-introspection/-/issues/391
I believe I know how to fix it, I'm giving it a try now.

-- 
Aleksander
https://aleksander.es
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
