Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33692C636CA
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 12:11:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E30BF6120E
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 12:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E30BF6120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AF7F82F14;
	Wed, 21 Jul 2021 12:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmoNeyzZDKEu; Wed, 21 Jul 2021 12:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BEF82ECF;
	Wed, 21 Jul 2021 12:11:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 051301BF3F7
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 12:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7D06404C7
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 12:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8-UyVWmqJ9U for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 12:11:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BA9C404AD
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 12:11:21 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ga14so2897971ejc.6
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 05:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/JzAU4+JgWPaBPGzb0FoJTHj9HCwdRQO9m/HsqtbCbw=;
 b=bvBGgF5pqLTHJwt1Fv8x+p6/ci4XVNYg3fqIVTkFK5lYYJGt1T7NCncrgPkU8iUQ3M
 zRpOjBq2l+GreyIoBzbpE/+vFTdbQ8474xFx+COLEG0vIIwnQcKqib8A+1goG3+zDJi7
 DMwF2Hx1eLJx54CyHfy5qnE2B5lya5hAxK6q6dCNaCYYWeHx5VkP8gWsycq93gvK+SfR
 ItdgfHfRwvTc/BI4JgUse+6ONIkHaGl6PWSQ+H+QUh8X+DgiF30GD0iDT39h4icMgvCS
 hy7qEQC0FYCPnJilSlIjtqLvRBOaUDp6lmlGSiPd0fN5AZrllTHGrrhAlmaOYAD/aEpO
 UsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/JzAU4+JgWPaBPGzb0FoJTHj9HCwdRQO9m/HsqtbCbw=;
 b=NIk4bMOM/ezlODzek5qxeNxU9ZR4SXqfssZ+ITTv9AUfP6RJiZSrFsJetTsoNlOA5s
 M+G0naeHdfA3nG/Z0NNuwDFjLUjM3ok77ihUcgCQvkwe8o2NGXG90X/7cWraCtk3Xjon
 xCOTg0ysSpACxN3d46XOwxqWECztYaj8Me/gtFAGCvEFTzjfCl13CJALXfgVjTSRRZ0n
 IavNaBUG+E5BfsGYhKL3lX4sbWrg2gvbiWrgZMs6zANfJFhDK2UQdcLgtaDf+D68uZJO
 SAKdMNY1O6ALXIayoeYGu4C4bMf8z1yOan6bDT0IKK3DWwZiIhVcp79G5chpkVuaFDT5
 1O1g==
X-Gm-Message-State: AOAM533hxxBYfa4WrFeeyrk2OEExCGZA2v5Y/I6sMY6FFEVDYxQwgfe6
 rxe4uLKlSDN7L3nXv5dxxRscETgWO/7Xi2F1xBs=
X-Google-Smtp-Source: ABdhPJxxUV6hy04admhCT9q3b7im6ow85WIsdANffCIdV4jDU0UvEcbRdS/B3ZJSG12Sy4LzJCGzWPcIQ2cY7v1htbg=
X-Received: by 2002:a17:906:1dd2:: with SMTP id
 v18mr28449416ejh.506.1626869479525; 
 Wed, 21 Jul 2021 05:11:19 -0700 (PDT)
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
In-Reply-To: <CAAP7uc+P_zsLA2en7YxWmY2TD4yFZO20QZ3oKcaOj97udtKyXQ@mail.gmail.com>
Date: Wed, 21 Jul 2021 14:11:09 +0200
Message-ID: <CAGm1_ks2ncgwf=dSMNdY+ODX7mDH4ECuQRivXscqy5AW3P-_pA@mail.gmail.com>
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

On Wed, Jul 21, 2021 at 10:07 AM Aleksander Morgado
<aleksander@aleksander.es> wrote:
>
> Hey!
>
> > > > INTROSPECTION_MAKEFILE is the problem. If I replace the path to the
> > > > path inside my BR, everything is working (the same issue is with
> > > > Qmi-1.0.typelib).
> > > >
> > >
> > > The introspection.m4 included in the sources is a bit outdated, the
> > > attached patch syncs it with the newest one I have installed in my
> > > system. I do see some fixes in the INTROSPECTION_MAKEFILE definition
> > > in the patch, so these may be enough. Any chance you can give this
> > > patch a try? You may need to force autoreconf as we're patching a m4
> > > file-
> >
> > >>> libmbim 1.24.8 Patching
> >
> > Applying 0001-build-fix-introspection-setup-in-cross-builds.patch using patch:
> > patching file m4/introspection.m4
> > >>> libmbim 1.24.8 Updating config.sub and config.guess
> > for file in config.guess config.sub; do for i in $(find
> > /home/user/MyProjects/oss/br-test-v2/s2srv/build/libmbim-1.24.8 -name
> > $file); do cp support/gnuconfig/$file $i; done; done
> > >>> libmbim 1.24.8 Configuring
> > >>> libmbim 1.24.8 Autoreconfiguring
> > libtoolize: putting auxiliary files in '.'.
> > libtoolize: copying file './ltmain.sh'
> > libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
> > libtoolize: copying file 'm4/libtool.m4'
> > libtoolize: copying file 'm4/ltoptions.m4'
> > libtoolize: copying file 'm4/ltsugar.m4'
> > libtoolize: copying file 'm4/ltversion.m4'
> > libtoolize: copying file 'm4/lt~obsolete.m4'
> > configure.ac:65: error: Unexpanded AX_ macro found. Please install GNU
> > autoconf-archive
> >       If this token and others are legitimate, please use m4_pattern_allow.
> >       See the Autoconf documentation.
> > configure.ac:66: error: Unexpanded AX_ macro found. Please install GNU
> > autoconf-archive
> >
>
> Gah... forgot autoconf-archive is a prerequisite when autoreconf-ing.

My BR has autoconf-archive installed. Why does it fail?

> I don't have time myself to test it right now, but the steps to do
> this properly would be to git clone the libmbim git repo, switch to
> mbim-1-24 branch, apply the patch, "NOCONFIGURE=1 ./autogen.sh &&
> ./configure --enable-gtk-doc && make && make distcheck". And once you
> have the release tarball, use that in buildroot.
>
> I can probably play with that later today if you don't do it earlier :)

It doesn't work :-( Though I see introspection.m4 file in
output/build/libmbim/m4 folder after replacing the tarball, the result
in Makefile is still the same.

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
