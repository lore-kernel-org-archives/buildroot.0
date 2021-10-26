Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D1DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 21:28:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE67C60EB4
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 21:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE67C60EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83EC640338;
	Tue, 26 Oct 2021 21:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dv9NKjACes5B; Tue, 26 Oct 2021 21:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0C684026C;
	Tue, 26 Oct 2021 21:28:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8AB21BF31C
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 21:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96CCC4026C
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 21:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E13zhCoMVScK for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 21:28:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F387340255
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 21:28:25 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id q129so622784oib.0
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 14:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wlgWR5AggCswPggMLpqmoVCwuGPBxecsxurC50o7Sno=;
 b=Z7/KrsC0c7047aB1PbZSJgfRRaZm/zcRZITiCotcojHYboRZrqlaBNtQ1hxCR+Zv3r
 I8/WAfcl4SRUjFf62d4EsPEF+0zAE8J3hPHk0xCC6An9+GspzaPMW5veiQcp0vGTZuR1
 NOUzi34r00/PZAtQIhixBS7jRGjfXsfX5rHY6BFRbIm0h5BbJQMeNz9PCGrxVX/uY4Ey
 ArMWljshnNCA1dD9p1MuWZ1uttTr4Mx54IaGHUgxONHcADEjZlBvaCbjPJx6aTivREe1
 QJT1RXJdUmyyeoXBX6wXTLxc8hysxxZDNjtGoJAn7kjAVyDWWS1/H0MWxG3xxvQmtRxH
 daHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wlgWR5AggCswPggMLpqmoVCwuGPBxecsxurC50o7Sno=;
 b=Dm2KDaFwOmf+vb582i/HfNGenNrmw6g+aj9Nn1JId4T04NqFdAqSOszzGyvhe+8ND2
 tkp7Ho/eJ0NY+bmw/LzMbAm45zLsPP2HIwgSj49hlb9QxRHaYOh7CRRrlfGj9jDeMEKB
 dYmRT4lW5Psq+vu+IoXeaIvM7Ll0VBUF0pOzVIdDvGx899H1NOukh1DhupmWFNKfU2jh
 I26eV0ux5vGZDplQABGR8alQ221kRfGIAfGIuku1S+tZp70a/48RHZ2aKeQJ73UjgZuM
 jJ/S5A0eJOcCJ5NGcGyFinB+MZijgxs8aqgsK44UZL84GrUUmo5AWG3K4238ATaRO1xN
 cBOA==
X-Gm-Message-State: AOAM5301r7bcvFalYKDYbUHAuHbRA/PP1bXquhEVvv797JTkkEdsFZ6G
 dXAnUQ/vmI9Dj0Xkn04tgmBtO0YtSeyY/JqXPG6/OGeOqf4=
X-Google-Smtp-Source: ABdhPJxzIIp52D0ieTE5QawklcpkaimygXY41teZunpBYbFoGtmWnRUJ1rXXIyC4OZzmPDmo4bE4D/VxRdfB6CzEO54=
X-Received: by 2002:a05:6808:1641:: with SMTP id
 az1mr910011oib.67.1635283705029; 
 Tue, 26 Oct 2021 14:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211024234715.2138507-1-james.hilliard1@gmail.com>
 <dae8536a-421b-046d-9103-b6ee28d73231@mind.be>
In-Reply-To: <dae8536a-421b-046d-9103-b6ee28d73231@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 26 Oct 2021 15:28:14 -0600
Message-ID: <CADvTj4rVtzZMEOZLhJVQyq2fu4BEjhM6nPCrtw1dVcfHccu8zg@mail.gmail.com>
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

On Tue, Oct 26, 2021 at 1:26 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>   Hi James,
>
> On 25/10/2021 01:47, James Hilliard wrote:
> > Drop python2 support.
> >
> > Remove python3-markupsafe host build as python2 host builds for
> > markupsafe are not supported, python3 host builds are moved to
> > python-markupsafe.
> >
> > Remove python3-jinja2 host build as python2 host builds for
> > jinja2 are not supported, python3 host builds are moved to
> > python-jinja2.
> >
> > Propagate reverse python3 dependency.
>
>   That turns out to be difficult...
>
>   There is one dependency you missed: host-python-mako depends on
> host-python-markupsafe. Since the latter is python3-only, that means that
> host-python-mako also becomes python3-only.

Ok, I'll propagate to that as well and consolidate it like with jinja2.

>
>   And host-python-mako has a bunch of reverse dependencies:
>
> - gnuradio: we need to add a depends on !BR2_PACKAGE_PYTHON;
> - jailhouse: the helper scripts are currently marked as python2-only, so they
> just become unavailable. But maybe they already do support python3.

Yeah, seems they support both python2 and python3 now.

> - piglit: already python3-only;
> - sdbusplus: already python3-only;
> - uhd: we need to add a depends on !BR2_PACKAGE_PYTHON.

Hmm, seems the python API for that already depends on BR2_PACKAGE_PYTHON3.

Guess the host dependency just needs to be appropriately set.

>
>   Alternatively, we could patch python-mako to avoid the dependency on
> host-python-markupsafe.
>
>
>   And then there's a similar problem for python-jinja2. Fortunately in that
> case, it's just systemd that is affected, but it means that systemd is not
> supported with python2. And that is a really tricky dependency to add, because
> you really don't want that selecting BR2_PACKAGE_PYTHON suddenly causes the init
> system to change. So we'd have to revert that dependency and instead make
> python2 depend on !BR2_PACKAGE_SYSTEMD. Fortunately there's no longer anything
> that select BR2_PACKAGE_PYTHON, so nothing to propagate...

Isn't it just a build dependency for systemd? Unconditionally using
the host python3
only version should be fine I think.

>
>
>   Final alternatives: get rid of python2 with more expedience. Getting rid of it
> completely would be nice of course. An in-between solution would be to no longer
> support host-python modules, i.e. even if you build python2, all
> host-python-modules are still built for python3 instead. It's also a big one,
> probably some stuff will break, but the autobuilders will find out.
>
>
>   Regards,
>   Arnout
>
>
> [snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
