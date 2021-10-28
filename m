Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB4AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 15:55:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33D9660FC1
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 15:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33D9660FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E759140620;
	Thu, 28 Oct 2021 15:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0xt6lhoGqjL; Thu, 28 Oct 2021 15:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43EDE4058F;
	Thu, 28 Oct 2021 15:55:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 240A31BF83E
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 15:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2061281B17
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 15:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2uj2Vk-utm7a for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 15:54:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EA9C816F5
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 15:54:57 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id m11so4114774oif.13
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3SL3LSs5t+c0gs/p+UDUrU0e6+Y21k0kurzu/jbL93Y=;
 b=ca2WWYo2GWxEQG6Tg19aTCNBOYuTKig/PfVPuQHZm3Eg07cQ3jeclLLQb6UoPcX4Fb
 XZtMb8YYASOvsxAaq2Act50IdQey1RCAEAHahxiMMWLk3QxUS3EFFW7bWHlWuYRE0Eyx
 jLEZ4n4Gb1BP6CqkkWZwxm+1lv3xEv3vMAoplYV4g496F3B061Yv+sSfPLF2lUL8yW7v
 elAcL4Jt5Fe3g3rb02qhY1G1UEhvxFV7Y49F5Hg3IecT+ckQEqmb3/kQCCDGxsJdR5uM
 7ojQa40t+s3LN/sumdwBfWRheUIBfsRXxaYND5otVBBeGIwvtxh2/Vyh6/YvYeVa2poc
 evBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3SL3LSs5t+c0gs/p+UDUrU0e6+Y21k0kurzu/jbL93Y=;
 b=7lMoAZzf4guVWZyVC+rU3F3OAseW5G99r+00qV0MD64gU0pw1sfnFL57jiFcHgyvx1
 //5xCkVOmamiQcjLEQdQBxMKFEyAgpEWv62roHH4AhNHWgQDNer+NmbUKv/WDOFSzifm
 3jDp7YKL9PA3brD4Tlb4xcUiuyMKQQs+N+cRrhpHgVbsDyBYbJsMNOOE56IaLQ+CiueN
 Em5B5QA6T+JXFnYECotemopKvHuHchPXM6fdBRMzqgHdUYh5pDgeVYG0pwmUXyJ9Za3R
 i7SiyoBR7RRLTZbuVwsaj4Tsu8q+6zRAiVfrxgozbPsHuLeUqAoobESFMGqHYj8iBmj2
 1UNw==
X-Gm-Message-State: AOAM530RP64mBCyJjlanAQ7FeYGx7788YgOW4MzQw0MS5IO9BPpRkYoY
 ytlP8XBBtaaOdMsZq/t904DUi0yh116wIkr/mw4=
X-Google-Smtp-Source: ABdhPJzbcd1SXLV3hniRwOTsYd8ltnlyO5tOdo83DFUAPHf6VKBPHdO5Aj+pDsp2jVyZ4Se802eoKgLYKRoCElKDJWA=
X-Received: by 2002:a05:6808:1641:: with SMTP id
 az1mr8869220oib.67.1635436496443; 
 Thu, 28 Oct 2021 08:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211024234715.2138507-1-james.hilliard1@gmail.com>
 <dae8536a-421b-046d-9103-b6ee28d73231@mind.be>
 <CADvTj4rVtzZMEOZLhJVQyq2fu4BEjhM6nPCrtw1dVcfHccu8zg@mail.gmail.com>
 <a800215e-2f7a-522c-2167-c1b045e0ff88@mind.be>
In-Reply-To: <a800215e-2f7a-522c-2167-c1b045e0ff88@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 28 Oct 2021 09:54:45 -0600
Message-ID: <CADvTj4orbiyQS8TeopR_qt+4ZxWriQY50Crnh0KoA=Z9ymU4nw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-markupsafe: bump to
 version 2.0.1
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Lionel Flandrin <lionel@svkt.org>,
 Matt Weber <matthew.weber@collins.com>, Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Oct 27, 2021 at 1:31 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 26/10/2021 23:28, James Hilliard wrote:
> > On Tue, Oct 26, 2021 at 1:26 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>    Hi James,
> >>
> >> On 25/10/2021 01:47, James Hilliard wrote:
> >>> Drop python2 support.
> >>>
> >>> Remove python3-markupsafe host build as python2 host builds for
> >>> markupsafe are not supported, python3 host builds are moved to
> >>> python-markupsafe.
> >>>
> >>> Remove python3-jinja2 host build as python2 host builds for
> >>> jinja2 are not supported, python3 host builds are moved to
> >>> python-jinja2.
> >>>
> >>> Propagate reverse python3 dependency.
> >>
> >>    That turns out to be difficult...
> >>
> >>    There is one dependency you missed: host-python-mako depends on
> >> host-python-markupsafe. Since the latter is python3-only, that means that
> >> host-python-mako also becomes python3-only.
> >
> > Ok, I'll propagate to that as well and consolidate it like with jinja2.
> >
> >>
> >>    And host-python-mako has a bunch of reverse dependencies:
> >>
> >> - gnuradio: we need to add a depends on !BR2_PACKAGE_PYTHON;
> >> - jailhouse: the helper scripts are currently marked as python2-only, so they
> >> just become unavailable. But maybe they already do support python3.
> >
> > Yeah, seems they support both python2 and python3 now.
> >
> >> - piglit: already python3-only;
> >> - sdbusplus: already python3-only;
> >> - uhd: we need to add a depends on !BR2_PACKAGE_PYTHON.
> >
> > Hmm, seems the python API for that already depends on BR2_PACKAGE_PYTHON3.
> >
> > Guess the host dependency just needs to be appropriately set.
> >
> >>
> >>    Alternatively, we could patch python-mako to avoid the dependency on
> >> host-python-markupsafe.
> >>
> >>
> >>    And then there's a similar problem for python-jinja2. Fortunately in that
> >> case, it's just systemd that is affected, but it means that systemd is not
> >> supported with python2. And that is a really tricky dependency to add, because
> >> you really don't want that selecting BR2_PACKAGE_PYTHON suddenly causes the init
> >> system to change. So we'd have to revert that dependency and instead make
> >> python2 depend on !BR2_PACKAGE_SYSTEMD. Fortunately there's no longer anything
> >> that select BR2_PACKAGE_PYTHON, so nothing to propagate...
> >
> > Isn't it just a build dependency for systemd?
>
>   Yes it's a build dependency. Same for the others I mentioned, BTW. However,
> when BR2_PACKAGE_PYTHON is selected, all host-python-modules are built for
> python2, not for python3. That's why the python3-foo packages are introduced.

Doesn't this override that behavior?:
HOST_PYTHON_JINJA2_NEEDS_HOST_PYTHON = python3

>
>
>   Regards,
>   Arnout
>
>
> > Unconditionally using
> > the host python3
> > only version should be fine I think.
> >
> >>
> >>
> >>    Final alternatives: get rid of python2 with more expedience. Getting rid of it
> >> completely would be nice of course. An in-between solution would be to no longer
> >> support host-python modules, i.e. even if you build python2, all
> >> host-python-modules are still built for python3 instead. It's also a big one,
> >> probably some stuff will break, but the autobuilders will find out.
> >>
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>
> >> [snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
