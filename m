Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62CFC636D3
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 21:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4426D82287;
	Thu,  9 Feb 2023 21:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4426D82287
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3B2AhOYzgSpN; Thu,  9 Feb 2023 21:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3797F8227D;
	Thu,  9 Feb 2023 21:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3797F8227D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F38E21BF3D5
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 21:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5F5D60E65
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 21:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5F5D60E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfPcbdUKhFd6 for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 21:42:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10C8B60E36
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10C8B60E36
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 21:42:33 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-16aa71c1600so4330394fac.11
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 13:42:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Svrtp8fLK0nuBXgMXLqYHQiyDvvMRJPJ9fU/duoVPn0=;
 b=V1rHgOI+OCQdlf1DRV9yyBHFJ/IJQaizwgps/FO2iyyG7A5+fviGi4XuXs9C80FDnA
 e29WTeIjzkREnrNHFBFJ/0sZjGzISMWiXrkhrVKB7Hq20XBQg2wGsXzO0jEmNnyxxl1B
 H955IVOq6MCR2P7Fk5uFHeSxQnyy8y4wCICFhWGHr0sqpH/Qs6J46hku7WxqBfKiP9by
 tWw3zNRFnS4KVyvAROkS4KydDH1QZwoa1s9HKUAWA2NCVMGHoCSY9VFAaBE3lzdaLsZJ
 Pp+Yc67uVJV98F9JGDNfhmW1fTBzRAxzdC1W1kkgdXdOYS2mKvvX6tfVjWSm51ybjmAZ
 iH6A==
X-Gm-Message-State: AO0yUKV/MMfQJkaUiOu3s8lnYoe2V3i4C4ESzdnjPtf66h5HA6NJOK5r
 YBQGcujuLFTtJLIZlF1+2OJyFrKmbL66o3kyuGGdd3vaLak=
X-Google-Smtp-Source: AK7set+wwQqdg7BIfK7uoKf39cCgGTf6VE0LzS3nXsP1py3m51BBNMzASykIa/jiL8P0VAX/A9lWZRK9fmbWwawvYfo=
X-Received: by 2002:a05:6870:c22a:b0:169:fd7c:d154 with SMTP id
 z42-20020a056870c22a00b00169fd7cd154mr841285oae.93.1675978953062; Thu, 09 Feb
 2023 13:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20220607231211.533086-1-james.hilliard1@gmail.com>
 <20230208161527.31a28b3b@windsurf>
 <CADvTj4rZZ-yewR2utW7r7++y7HziG5CE2=_beWgskS1XXL4PQg@mail.gmail.com>
 <eca0040f-d111-2b84-f086-a1f9f26b53da@mind.be>
 <CADvTj4qOOh89a1NOHD8mkNSBAdGPz3aOgvv_LOKgi8L1-LjE4A@mail.gmail.com>
 <de1bf098-5cc1-90a1-8ac5-b4d5015ab6f0@mind.be>
In-Reply-To: <de1bf098-5cc1-90a1-8ac5-b4d5015ab6f0@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 9 Feb 2023 14:42:21 -0700
Message-ID: <CADvTj4p8vB20X_eUzTu1SVfzpb03XUoO+FMX7RqcHe3F2+z7cQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Svrtp8fLK0nuBXgMXLqYHQiyDvvMRJPJ9fU/duoVPn0=;
 b=jMRo5WiYtbg+JY7SI8iYmD1cBFaHfds2iM4viCp7/If10fIocLKP2j9cGuMNS6iPI5
 4yxp0BZ2/00fzoBYL9aSAN79Qjy8fJT2PxwSWgxuHwe2PzL24O10awtTahC75F+TIFNN
 HxHStMEOAfq4gqYepGHMxd0JKFtj/12fDA5aBrYN5CH2XeBiBtu7NVjNp26kQtbCKMCO
 YwKTaL9PKU/0ruvQlCpOdjR3Q2mDBBR1mWvd1/M2KAhYMZCShb11RuPYQBdkBGd/qpb2
 Zt6PnlqiLV0ImvCAKAF9o3yvEwMfpHPfyOzlGEMz1xSLdtAeK+2OObpFFcjv1PiC5QG5
 pVWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jMRo5WiY
Subject: Re: [Buildroot] [PATCH buildroot-test 1/1] scripts/autobuild-run:
 add support for --branch option
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Feb 9, 2023 at 1:44 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 09/02/2023 21:32, James Hilliard wrote:
> > On Thu, Feb 9, 2023 at 1:19 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 08/02/2023 17:46, James Hilliard wrote:
> >>> On Wed, Feb 8, 2023 at 8:15 AM Thomas Petazzoni
> >>> <thomas.petazzoni@bootlin.com> wrote:
> >>>>
> >>>> On Tue,  7 Jun 2022 17:12:11 -0600
> >>>> James Hilliard <james.hilliard1@gmail.com> wrote:
> >>>>
> >>>>> In some cases it only makes sense to run tests against a specific
> >>>>> branch, such as when testing new genrandconfig flags.
> >>>>>
> >>>>> Add a config option to override the branch selection.
> >>>>>
> >>>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>>>> ---
> >>>>>    scripts/autobuild-run | 11 ++++++++++-
> >>>>>    1 file changed, 10 insertions(+), 1 deletion(-)
> >>>>
> >>>> We looked at this with Arnout, and we don't really see what this would
> >>>> be needed, and actually it could be annoying to have people test
> >>>> "random" branches. If you need extensions to genrandconfig, then the
> >>>> autobuild-run script should be backward compatible with older versions
> >>>> of genrandconfig to be able to support older branches for a certain
> >>>> while.
> >>>
> >>> There are a number of other reasons this is useful, for example some
> >>> build hosts(for example my asahi-linux build host) have compatibility
> >>> issues in older branches so it doesn't make sense to run autobuilders
> >>
> >>    If there are compatibility issues, the fixes should be backported to the
> >> stable branches...
> >
> > Some of the changes would be rather difficult to backport, for example
> > the 2022.02.x branch doesn't have support for --no-toolchains-csv which
> > is effectively required for supporting non-x86_64 autobuilders as we
> > obviously can't use prebuilt toolchains that only run on x86_64 hosts on
> > an aarch64 host.
> >
> > There are many fixes related to various  --no-toolchains-csv build failures
> > that would also need to be backported as well if even feasible.
>
>   Even so, I'm much more inclined to rewrite the autobuild-run logic to
> dynamically test which options genrandconfig can take and adapt accordingly.

The genrandconfig issue is only one of a number of issues that I've
seen come up,
there's been a rather long tail of lingering aarch64 compatibility
issues that sometimes
require major package updates. For example some systemd fixes for aarch64 build
hosts aren't really feasible to backport due to requiring major refactoring.

What we probably eventually want is the ability to identify issues as build host
environment specific by rerunning failed builds on different hosts
automatically,
but that would probably require some infrastructure changes.

> That way you don't have to manually maintain those branches and update them on
> each autobuilder instance.

I'm pretty much just using this to restrict my autobuilders to master
branch when there
are known compatibility issues with older branches for a particular
host configuration.

>
>   Regards,
>   Arnout
>
> >
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>> on anything other than say master.
> >>>
> >>> To prevent testing of unwanted branches I could modify this to restrict
> >>> the branch override to only allow selecting the branches listed in:
> >>> http://autobuild.buildroot.org/branches
> >>>
> >>>>
> >>>> Thanks!
> >>>>
> >>>> Thomas
> >>>> --
> >>>> Thomas Petazzoni, CTO, Bootlin
> >>>> Embedded Linux and Kernel engineering
> >>>> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
