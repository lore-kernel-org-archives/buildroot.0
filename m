Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E7EC07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 08:07:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3C5461019
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 08:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3C5461019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aleksander.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80EC681B7B;
	Wed, 21 Jul 2021 08:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7JXk_hQGnzN7; Wed, 21 Jul 2021 08:07:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEB7581A73;
	Wed, 21 Jul 2021 08:07:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA1751BF2CE
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 08:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9662401F3
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 08:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aleksander-es.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANFXcMvJrY42 for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 08:07:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32BFC4018D
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 08:07:24 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 m14-20020a4a240e0000b029025e4d9b0a3dso378154oof.6
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 01:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WYrPNosMt5G37Gpjm0EWBc327zDD+6TRQbo8FlPPHyY=;
 b=dVsxzTgQ2OQx9zEnTiO0LyFoqunyRmWxkrqGZ2A6T5lxo59T8EQx63WOEyA4F8MwnT
 PjGd+NLUCOLv1bkIm7NdC+31AYtur/N2A66CoDri93M0OHWwvFEqHG72g558uQp/OwzA
 CCuT1UzdzZ2wRONj+RabfzJANRVkvtoOF/BeMH5bOb9i9E6+EQr9IpdqxpkJrTIR7Jgc
 dQip/y+2hFRR9OJmS24EwHmz2EYzLJbv4gcGJ1YAC+qW0ARkUUHZzsU3JtGBYzNIvEAz
 zLjgq6u9qaUH37j/qc8C5ECJykU6n+TqqYwHpeO3Q+D0nMlPV+I2veP9o6O184KAClor
 zz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WYrPNosMt5G37Gpjm0EWBc327zDD+6TRQbo8FlPPHyY=;
 b=UCC/1MBA4OGVZxCgkSX3ene7KGCXdBlmya8bV+0bRqNYd41k22eRLcVXptpbiB8XVT
 sYP0vNVJyQSWLD7YakaG1y8ppwg56VzgVJgZ5OO6k4C51Qzd2xrMfqsY1vB0C18xixD7
 5bKsvZ6PqNzzoNat1cfPrY9xTGTVpwslRlmdNu0AQ1yYZsqld6aWUV7ddEM+b/IDOkBx
 kBXmKNsu/M2vCgMRckGy3+YgHqGNeagzBCNv8Q7B/n9fZK7LV5WJj4mCEdSLTZyqZs2A
 YCzTdyJ9YeutPAks83JpklVrf9oUcaDq7s9iip9y6WfzEm47QpwOJYAukpnzFYrL+pWg
 hQCA==
X-Gm-Message-State: AOAM531lc0A2tHmEob1nM4pSh3UjN09ttNZmbFDF/DVJHpM/1lq2RLxI
 17X7B/q83RF4hoxdZdi3CNYNGnoLH+7BFLfcBaUFlg==
X-Google-Smtp-Source: ABdhPJwo0x/6AXtxP1N/cv4NFXAsbczTAN1sp/05l6kdypaRzevYSvK0E0VQAuQ53+7u0KK3HgZhoTnOsiSw7qdRQD0=
X-Received: by 2002:a4a:754b:: with SMTP id g11mr8142577oof.10.1626854843163; 
 Wed, 21 Jul 2021 01:07:23 -0700 (PDT)
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
In-Reply-To: <CAGm1_kss=siZsRr5q9yZeFU92e_UOf1OBVV2R+J3pGGfg3mBZA@mail.gmail.com>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed, 21 Jul 2021 10:07:12 +0200
Message-ID: <CAAP7uc+P_zsLA2en7YxWmY2TD4yFZO20QZ3oKcaOj97udtKyXQ@mail.gmail.com>
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

Hey!

> > > INTROSPECTION_MAKEFILE is the problem. If I replace the path to the
> > > path inside my BR, everything is working (the same issue is with
> > > Qmi-1.0.typelib).
> > >
> >
> > The introspection.m4 included in the sources is a bit outdated, the
> > attached patch syncs it with the newest one I have installed in my
> > system. I do see some fixes in the INTROSPECTION_MAKEFILE definition
> > in the patch, so these may be enough. Any chance you can give this
> > patch a try? You may need to force autoreconf as we're patching a m4
> > file-
>
> >>> libmbim 1.24.8 Patching
>
> Applying 0001-build-fix-introspection-setup-in-cross-builds.patch using patch:
> patching file m4/introspection.m4
> >>> libmbim 1.24.8 Updating config.sub and config.guess
> for file in config.guess config.sub; do for i in $(find
> /home/user/MyProjects/oss/br-test-v2/s2srv/build/libmbim-1.24.8 -name
> $file); do cp support/gnuconfig/$file $i; done; done
> >>> libmbim 1.24.8 Configuring
> >>> libmbim 1.24.8 Autoreconfiguring
> libtoolize: putting auxiliary files in '.'.
> libtoolize: copying file './ltmain.sh'
> libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
> libtoolize: copying file 'm4/libtool.m4'
> libtoolize: copying file 'm4/ltoptions.m4'
> libtoolize: copying file 'm4/ltsugar.m4'
> libtoolize: copying file 'm4/ltversion.m4'
> libtoolize: copying file 'm4/lt~obsolete.m4'
> configure.ac:65: error: Unexpanded AX_ macro found. Please install GNU
> autoconf-archive
>       If this token and others are legitimate, please use m4_pattern_allow.
>       See the Autoconf documentation.
> configure.ac:66: error: Unexpanded AX_ macro found. Please install GNU
> autoconf-archive
>

Gah... forgot autoconf-archive is a prerequisite when autoreconf-ing.

I don't have time myself to test it right now, but the steps to do
this properly would be to git clone the libmbim git repo, switch to
mbim-1-24 branch, apply the patch, "NOCONFIGURE=1 ./autogen.sh &&
./configure --enable-gtk-doc && make && make distcheck". And once you
have the release tarball, use that in buildroot.

I can probably play with that later today if you don't do it earlier :)


-- 
Aleksander
https://aleksander.es
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
