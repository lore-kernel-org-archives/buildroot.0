Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8159CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:33:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5710F60F50
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5710F60F50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aleksander.es
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1719260723;
	Sun, 19 Sep 2021 08:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oRO9rYbYq6Zj; Sun, 19 Sep 2021 08:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BF776071F;
	Sun, 19 Sep 2021 08:33:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9A8D1BF2AB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B80C382AC8
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aleksander-es.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OMxHVL16-PcA for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 08:33:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DD73829BB
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 08:33:36 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g8so48061302edt.7
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 01:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=rhFok9o6/SnUHVXazWgGIttCi6sB1JXEQuXn6OkqL6I=;
 b=G254VjN99cNcray7YYMZl0zd3u47uTmaGS7Dfp4jfWR4pbNUtgziQH9MaBI5g07sUp
 Wo4c8q9r57v5kAUjOY5D7KNBEyCDduyVoVbwpJYjvtRRvpbb3Fx0c6M/kSRabDC0mV9q
 nPFvLtVHXwhQC1z6YPwSk44EHCCgo4I9pAam/46n3GStG4oCb3Iy1v9gW5vvYfL9HZU2
 A8ol9RDD3LycpkvXZoa/1tTTahj8TplaBHxXfVbb6iVGLDDZ0aj1AF1I6C2KMrMjHmYk
 hk+8ypJgPcrg139hTGYVQH5BQY2xdNgZc8zvHZYQQJFZquUMfgPNEdS8YennlfkUzmq1
 +dLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=rhFok9o6/SnUHVXazWgGIttCi6sB1JXEQuXn6OkqL6I=;
 b=jLTGIAR6MdmLmlQWMv3zi7hHafS7Jh7ng1r+2VvH9kmihBjH5XPzlwK9WOFUC8DHDk
 tlTsRJLDJng/1ohoD+7UvvtjPmnHKejrzwssvcA2Dfxe5XMm2XdoAL5FUPLFyOSEvzg2
 vhB/+AWZL2M66PAmheFcEyHsfjR2ESiXMBBgr7RTmvS0pbdqwcrW7JK/i+6Sv0mAFVXp
 jQzU+2Gd7sNYkBg3GZGlr0oAomtN+TR67V/uWw8xKH3dvTZg0zaseyGwxW4zR4D6IZMf
 luC2AwK9JEybq9BMJ4XSyX8CBadZ3XN5ycPKmHLax4tnYdGb4bJ95T8VlaVO8wLCmWfj
 RFZA==
X-Gm-Message-State: AOAM533+phboZpRgM2zTrCA712621I5Ida+QXENwLni8LFuGAotC4eZ8
 Ucj/YbBINEAuN0KK0xaEQ00FOq+kTPPe9p08VBCLPn/E53w=
X-Google-Smtp-Source: ABdhPJwJgbug4vB3Mz8iX1C1HP7hxPYd6oeQaJGbH9Sma64MuRZHvy5cGULeQgrEehREVf/ziZTdLqU+431whVik0sg=
X-Received: by 2002:a50:d4d0:: with SMTP id e16mr22780246edj.355.1632040414372; 
 Sun, 19 Sep 2021 01:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210918203023.24093-1-yegorslists@googlemail.com>
 <20210919073319.GG1053080@scaer>
 <20210919082230.4gc2l336p25re3v7@falbala.internal.home.lespocky.de>
In-Reply-To: <20210919082230.4gc2l336p25re3v7@falbala.internal.home.lespocky.de>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Sun, 19 Sep 2021 10:33:23 +0200
Message-ID: <CAAP7ucJR_Pj3CoY5QSKJPqK6vS4dRjzAaj+zjgvGiuyyNeG-JQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Yegor Yefremov <yegorslists@googlemail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Aleksander Morgado <aleksander@aleksander.es>, 
 buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH] package/modem-manager: bump to version
 1.18.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hey all,

> > On 2021-09-18 22:30 +0200, yegorslists--- via buildroot spake thusly:
> > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > >
> > > This release introduces meson build system support.
> >
> > No, the release itself does not introduce meson buildsystem support:
> >
> > > As meson files are only available in git, switch the location to
> > > https://gitlab.freedesktop.org.
> >
> > as you say, the support for meson is only in git, and not part of the
> > released tarball. As such, I don't think it should be considered usable,
> > so we should not use ir.
> >
> > When upstream does an actual release that contains the meson stuff, then
> > we can consider switching over. Until then, I think we should stick to
> > using the buildsystem in the released tarball, autotools.
>

The plan is, probably, to fully avoid doing release tarballs when
fully switched to meson and autotools removed. So, even if meson-only,
don't assume there will be a tarball.

> Actually upstream wrote in the announcement meson support is not
> complete (yet):
> https://lists.freedesktop.org/archives/modemmanager-devel/2021-September/008826.html
>

There are some missing things, yes. E.g. the ability to build and
select specific plugins instead of all is missing, and some unit tests
are failing; but don't think they apply to the buildroot build. For a
standard system build with just a few options, as in buildroot, 1.18.2
should be perfectly usable. Arch Linux fully switched to the meson
build as well.

So, really, up to you. Switching to meson in buildroot shouldn't be an issue.

-- 
Aleksander
https://aleksander.es
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
