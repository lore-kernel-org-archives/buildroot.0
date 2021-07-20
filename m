Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0370C07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 02:35:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C9EB61178
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 02:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C9EB61178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4180882F76;
	Wed, 21 Jul 2021 02:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwUFwQEou_oD; Wed, 21 Jul 2021 02:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB9C682F57;
	Wed, 21 Jul 2021 02:35:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0F061BF32A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 23:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD4D04018A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 23:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id drJkMlIG3xQF for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 23:35:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAF134011C
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 23:35:52 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ga14so484567ejc.6
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 16:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DmrNLaFS6Kmu6aJMKKEp14XjQGKsWumkYvPHZZsGREM=;
 b=oogKhRU+H+2EI5Yyx/iwu9pgm9Ra2UjmyuhfyluZirVLViADG36fJVmlt/J9E3uDHr
 PBv0D851duWMI1HaE7BlUSF15KCUwDoioz2kuaUeYq8I0HSTunXlogus83bv+8/NW6nV
 FcUfR9eVms6IK5wQxF+uSDphpWYVwgHX1ljEQ/MrLhdX3fAF1Jdw+LozF39doSni6bBI
 vGSsc2M508FlmYxyy1danwsCjuBZaDDn2WArCAoZ7hHTZj/jxrlKjLHRjVjhW1LzDBRu
 nb+bx2Q7QHxOmJen/rwVK0YwDjpS3jCpRulVwEYJPvv4Vw8tf8b1uYeP4uRTXerseDSp
 pB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DmrNLaFS6Kmu6aJMKKEp14XjQGKsWumkYvPHZZsGREM=;
 b=QgCDCZVVIBaZqFeXiYeltQ87cl3uxSGyDsRqpxXJS8TLUY1G4t6ZVD2a1Ex+mbeb5U
 LA6IDVa45u0HVDnGjVLGGI5fUwoNiNktL8rBQPqz1nNwkd3sdmQ0zMPBHGHsirY53CwU
 b0bz8WSnWreDpqz6Jq8qHoNC0Rqn8gdVNxyYsiipiIZyvu16+dAGlb9D9he74xr3whNv
 uAEFbge17pkGoUWWn+xUmytyH3oGSiQPmnQjdfzRp/+4TL9ZYcTJ8t4YpH1IggmCIxUi
 Au5i2kl6+zKEdAClpnEuRPF3/a7PO3sL7j4uUakT3LtW2KtpjTHPvu8Be2tzZR1JjcAi
 cdYA==
X-Gm-Message-State: AOAM5324IOOnVuoVwJ8qEb4Dl2uh14M2kcLxJj1QLASOssjqSvpjeaXu
 eRymbMwdCTqB834Sa33AAsZyD5EH4N+4t5FjkGI=
X-Google-Smtp-Source: ABdhPJzSL9HxzOah34HGpY3MEGQrnvrzP/ZiSM9nny7Lp062qh0309axHUnf9BjzEZPEfvrfEQgeqrVgkP3JGrsy0HQ=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr34944370ejb.382.1626824150877; 
 Tue, 20 Jul 2021 16:35:50 -0700 (PDT)
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
In-Reply-To: <CAGm1_ksDv2Kuk_s4+NP3Uc8VxBTLcnpDckLyBz6y_hoAWpasAA@mail.gmail.com>
Date: Wed, 21 Jul 2021 01:35:40 +0200
Message-ID: <CAGm1_ktaWo27F0zNigOOYV7yoMoqGRta_mifiCK0+REB=QYbfw@mail.gmail.com>
To: Aleksander Morgado <aleksander@aleksander.es>
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
From: Yegor Yefremov via buildroot <buildroot@busybox.net>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720233540.K9dKxJvqHGeEFoBFHruuKpRj5ySVlWbm6udgfQS0MDE@z>

On Tue, Jul 20, 2021 at 12:39 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> On Tue, Jul 20, 2021 at 11:22 AM Aleksander Morgado
> <aleksander@aleksander.es> wrote:
> >
> > On Tue, Jul 20, 2021 at 11:15 AM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > >
> > > On Tue, Jul 20, 2021 at 11:07 AM Aleksander Morgado
> > > <aleksander@aleksander.es> wrote:
> > > >
> > > > > >> I still experience this error [1]. Any ideas?
> > > > > >>
> > > > > >> I have also applied libgudev patches as their build was failing.
> > > > > >>
> > > > > >> [1] http://autobuild.buildroot.net/results/f8a81aad0e262a567a2b31712575472ae92e5518/build-end.log
> > > > > >>
> > > > > >
> > > > > > My eyes are failing, I'm not sure which is the issue that triggers the build error. Is it the -Winline issues? The build should go on in that case, as we don't have -Werror. Not really sure.
> > > > >
> > > > > If I rerun "make", it ends as follows:
> > > > >
> > > > > /usr/bin/make  all-recursive
> > > > > Making all in .
> > > > > Making all in build-aux
> > > > > Making all in templates
> > > > > make[5]: Nothing to be done for 'all'.
> > > > > Making all in mbim-codegen
> > > > > make[5]: Nothing to be done for 'all'.
> > > > > Making all in .
> > > > > make[5]: Nothing to be done for 'all-am'.
> > > > > Making all in data
> > > > > Making all in .
> > > > > make[5]: Nothing to be done for 'all-am'.
> > > > > Making all in pkg-config
> > > > > make[5]: Nothing to be done for 'all'.
> > > > > Making all in src
> > > > > Making all in common
> > > > > Making all in .
> > > > > make[6]: Nothing to be done for 'all-am'.
> > > > > Making all in test
> > > > > make[6]: Nothing to be done for 'all'.
> > > > > Making all in libmbim-glib
> > > > > Making all in generated
> > > > > /usr/bin/make  all-am
> > > > > make[7]: Nothing to be done for 'all-am'.
> > > > > Making all in .
> > > > > make[6]: *** No rule to make target 'Mbim-1.0.typelib', needed by
> > > > > 'all-am'.  Stop.
> > > > > Makefile:802: recipe for target 'all-recursive' failed
> > > > > make[5]: *** [all-recursive] Error 1
> > > > > Makefile:399: recipe for target 'all-recursive' failed
> > > > > make[4]: *** [all-recursive] Error 1
> > > > > Makefile:456: recipe for target 'all-recursive' failed
> > > > > make[3]: *** [all-recursive] Error 1
> > > > > Makefile:388: recipe for target 'all' failed
> > > > > make[2]: *** [all] Error 2
> > > > >
> > > > > The problem seems to be: No rule to make target 'Mbim-1.0.typelib',
> > > > > needed by 'all-am'.
> > > > >
> > > >
> > > > That looks like a problem in the gobject-introspection setup in that
> > > > build. The configure check detects the introspection support:
> > > > ....
> > > > checking for gobject-introspection... yes
> > > > ....
> > > > But then it fails to create the typelib.
> > > >
> > > > Is there any way to manually play with that build?
> > >
> > > I can try to create a minimal config that reproduces this issue.
> > >
> > > Or what tests would you want me to do with my ARM build?
> >
> > We should inspect the generated Makefile, and see whether it contains
> > the gobject introspection bits or not. The Makefile.am in libmbim-glib
> > defines the .gir and .typelib targets, but then we include
> > $(INTROSPECTION_MAKEFILE). In my local PC build, I can see the
> > following in the generated Makefile:
> > INTROSPECTION_MAKEFILE =
> > /usr/share/gobject-introspection-1.0/Makefile.introspection
> >
> > What does the Makefile say in this build, and if there's a path given,
> > does it contain the correct path to the Makefile.introspection file?
>
> INTROSPECTION_MAKEFILE =
> /usr/share/gobject-introspection-1.0/Makefile.introspection
>
> hm.. it doesn't show the BR's location but the location of my host.
> This doesn't look right.
>
> INTROSPECTION_LIBS shows BR location, but INTROSPECTION_GIRDIR = /share/gir-1.0

INTROSPECTION_MAKEFILE is the problem. If I replace the path to the
path inside my BR, everything is working (the same issue is with
Qmi-1.0.typelib).

My Linux host doesn't have
/usr/share/gobject-introspection-1.0/Makefile.introspection. Can it be
that your host does and that's why you don't experience this issue?

Regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
