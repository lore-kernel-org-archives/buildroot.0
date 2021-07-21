Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83979C07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 07:38:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FFCF61181
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 07:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FFCF61181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFBB9605E8;
	Wed, 21 Jul 2021 07:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YEr9CHnPJMFs; Wed, 21 Jul 2021 07:38:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C31605B7;
	Wed, 21 Jul 2021 07:38:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5885B1BF423
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 07:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4715382591
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 07:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucdL1ihDp9vg for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 07:38:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 884748250B
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 07:38:44 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ga14so1799677ejc.6
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 00:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wgcd512l03sSHxOvHAXVY7pX6ve/xXPICzaXtwj+rqY=;
 b=AFnqefQ7K/qIwP9R1OAekuzaCV24OpWuTJ6b+yYcLRyFJjKCDfZquLPMBuoXLYa6wP
 xfZbbsGRJ+cp8wlxNT8jWTWvKm3m+TAB7fLUZQFz+W94kdln824jahVOy92smDor4VPd
 aRn75FJkQaMF+8DI3g59XgtKOFqZcMo67sxwbQoA5xIvmN7RkaPeO5XEwb6QRMhNiRQN
 WVWzkDqMdw0FHh1IXhCer7S8wwP4t1gKZe8mIwv36jKVmqAaQiAsknTMtTzbrLBw8LMw
 Zlhcx8KXtNEpvphcwQUtUXopbW0QQ/aEgbrIwMGR+zVNnkwIgS79n30kbkt7zAq+WHcQ
 5jjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wgcd512l03sSHxOvHAXVY7pX6ve/xXPICzaXtwj+rqY=;
 b=m/AR2oMSY9DEX8JBAv7pnSxwYn8LsMUbyUVxq6fOuta12lONg0N/sxBL+r5ttmbQM0
 c6tmYK5L3ovVGUQ9SiFtJWDu4myA9QNXmMQT8aCRwfOy6IlyPZL1ZJDhZA2EwN/Pbj2I
 V5pVeqiWO34/m53HREWp3yuATTD4/ZijQ6uO8vxvPjO9OoqTyA5haVWk47FPrxmeqjdD
 claaAE13q4kjfPKt1oca1oF4/tVfGqTNrTC9n97/r2JxXurAQsF422/0yopxQUZqstny
 GmabXHRGeVRJ4u/Y6lSQhCBqCd3rwwUXlNaVRxx4WavJTvrVCuXM6pYUpkjBThR9ay2u
 ZNBA==
X-Gm-Message-State: AOAM530PIuEieniqVqSJR1NHeZmicw1/3sMNlVT79vxMgby/ifqncRly
 /8w40Q5yBy5A0Uj3cf7cy65QS8LyYNcHLMAqTEbHXI6fDd0=
X-Google-Smtp-Source: ABdhPJyShn1rAjuzJqtnJwUwRMFi8Yh0OajbtNMVSHr8o9Dd8qFaXDxKDZLLn7uwW2JZCLwUvBfDjRbFso8+nYAdLkc=
X-Received: by 2002:a17:906:48cd:: with SMTP id
 d13mr36111456ejt.311.1626853122789; 
 Wed, 21 Jul 2021 00:38:42 -0700 (PDT)
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
In-Reply-To: <CAAP7ucJ6RHQVuAsXYztzv1ZeGXBusg0VQ=PqKUW2yvS38tTRng@mail.gmail.com>
Date: Wed, 21 Jul 2021 09:38:32 +0200
Message-ID: <CAGm1_kss=siZsRr5q9yZeFU92e_UOf1OBVV2R+J3pGGfg3mBZA@mail.gmail.com>
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

Hi,

On Wed, Jul 21, 2021 at 9:21 AM Aleksander Morgado
<aleksander@aleksander.es> wrote:
>
> Hey,
>
> > INTROSPECTION_MAKEFILE is the problem. If I replace the path to the
> > path inside my BR, everything is working (the same issue is with
> > Qmi-1.0.typelib).
> >
>
> The introspection.m4 included in the sources is a bit outdated, the
> attached patch syncs it with the newest one I have installed in my
> system. I do see some fixes in the INTROSPECTION_MAKEFILE definition
> in the patch, so these may be enough. Any chance you can give this
> patch a try? You may need to force autoreconf as we're patching a m4
> file-

>>> libmbim 1.24.8 Patching

Applying 0001-build-fix-introspection-setup-in-cross-builds.patch using patch:
patching file m4/introspection.m4
>>> libmbim 1.24.8 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find
/home/user/MyProjects/oss/br-test-v2/s2srv/build/libmbim-1.24.8 -name
$file); do cp support/gnuconfig/$file $i; done; done
>>> libmbim 1.24.8 Configuring
>>> libmbim 1.24.8 Autoreconfiguring
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
configure.ac:65: error: Unexpanded AX_ macro found. Please install GNU
autoconf-archive
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:66: error: Unexpanded AX_ macro found. Please install GNU
autoconf-archive

Regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
