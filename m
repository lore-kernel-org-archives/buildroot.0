Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70595C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 11:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F08CA4056A;
	Mon, 17 Oct 2022 11:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F08CA4056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3JOap_fEVgrn; Mon, 17 Oct 2022 11:30:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECC2E4014B;
	Mon, 17 Oct 2022 11:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECC2E4014B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 414761BF3B5
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 11:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27D2E40882
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 11:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D2E40882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNeNuKpPxyQE for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 11:30:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C18F4171C
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C18F4171C
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 11:30:05 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id g28so10784907pfk.8
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 04:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Kjb6D/Nuwt0qgkDIds4ztqBi8LfrwoiOdsG8uP9y1s=;
 b=u9pWLS6ZMluev95DsaPxFTgS7r1aC6zs8J5NWWWLvy6OZbNNYxIcDVl3NheDtWjukF
 c7DAmRzxeFf2evXWzwvKZgUYX6HEWpFvE+MGsq/4t01jbkevluYeuKj40V32sJ57Zlff
 kW5MHmlMfFnrSEJfY1P+PYY6YUNriQDw10rYeLQeb4EOqKiIeKf0yyFUqruGaVeKhQMc
 yVmCcPrnQonYYOCHD2tNldhEaTyxfhSwF21kRzVSGPIA/OiTtQoIhNdae4ix2d8SZGkW
 1/RD0Vdqz3N0Ro5C8qYaYlUZoaPcp9IHuw964GPPaxJwwcjmPZIzV5HWqHtsp/v4gMXC
 Pjzw==
X-Gm-Message-State: ACrzQf3tZ//u9a9iGrK8IansXQ1qFKZh0zn9fM22EzAkTKVWBLxVXDG6
 dhRfmI1590pz/mgqgvaD5y2v25bsri84dk9CYM8=
X-Google-Smtp-Source: AMsMyM55hJ9PXRH/hXzO+vwqPZ2klpmIg7kIlx7KlKvDTwT6XFENI104ntOjdQl03B0X6+vR1S41zJ27V5R7Tvp7990=
X-Received: by 2002:a05:6a00:1389:b0:566:1549:c5bc with SMTP id
 t9-20020a056a00138900b005661549c5bcmr12198459pfg.8.1666006204731; Mon, 17 Oct
 2022 04:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
 <CAPi7W828RqJOB3wUx3y68PFHE+M+pt5Ohck+-E-YzPim-C54eQ@mail.gmail.com>
 <CADvTj4p15dWwuUN0rz4D5_tQi+UzuTdoFq76ewYh00xaULhp8A@mail.gmail.com>
 <20221016075056.GI2503@scaer>
 <CADvTj4rBi3uu2bXJy=Tp76NV6Yjk7--EtDOm0kmxi47XOVsQ=Q@mail.gmail.com>
 <20221016160505.GK2503@scaer>
 <CADvTj4q+ztJca7+MEcOK5-gd94155C0X1s0_5-SvCxp=XXOptg@mail.gmail.com>
 <20221017091644.1104527b@windsurf>
In-Reply-To: <20221017091644.1104527b@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 17 Oct 2022 07:29:52 -0400
Message-ID: <CADvTj4qT7BZY4QhkC0A=LFQ5x2fgWBAdECaAGFxu5VUE=ukgxw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5Kjb6D/Nuwt0qgkDIds4ztqBi8LfrwoiOdsG8uP9y1s=;
 b=n4r1mXWKrBS5D3JZIenJvbOfIn2Ym9JcZyJq0Il7i+J6hUDFRxKOJfHe2hrGnnP9jb
 hxgHafewqmlR0gYTdN5sV7v+cIjRs8qnDDUxRF5d28/hVMFQYpR2Fzmqkyx1Fco80QiX
 k7eYeFyOSzqNZIiarSShYzbn0zftgjRISCFzmvkUtjEbTHGFx8nfpD4n9ujiPArlxuJL
 vTwL2+TuoXM56suwTWu1u2RFWAlYZdVhVvocuOcLiJ3F7Yh6nmcTB6E2eVRqH6uBcxCs
 0WxqsFDKZlcVInLYfmy8xz04koZia1t6S/oH0O/JcRDsH9SOfj0JcvmSwCAj74y/1c9W
 bR3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n4r1mXWK
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 17, 2022 at 3:16 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Sun, 16 Oct 2022 12:45:06 -0400
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > > Again, that is very interesting, but please, please, conordinate with
> > > the rest of us when you do such changes, because that is very weird, as
> > > Fabrice noted, to suddenly get build failures out of the blue when
> > > nothing seemed to have otherwise changed.
> >
> > I've been experimenting a bit in general with autobuilder settings to try
> > and fix some issues with poor coverage.
> >
> > One other reason for testing with shuffle=random is to make higher kconfig
> > probability values more useful(as otherwise build failures will be concentrated
> > in packages early in the dependency ordering) :
> > https://patchwork.ozlabs.org/project/buildroot/patch/20220514214612.3221647-1-james.hilliard1@gmail.com/
>
> Thanks a lot for all this work, which I find really useful. However,
> like Yann said I believe we need to coordinate better. I think we would
> prefer to see build results submitted on autobuild.buildroot.org to
> only be generated by the official/upstream autobuild-run script.
> Otherwise, it's super confusing as we get results that corresponding to
> variations of build configurations/build logic that we are not even
> aware they exist.

The shuffle=random changes don't require modifying autobuild-run, I'm
just tweaking the path to make in my autobuild service environment and
then passing an additional config flag to autobuild-run like this:
--make-opts="--shuffle=random"

>
> Another concern is that the autobuilder results are already extremely
> bad these days, and therefore the priority is more on addressing/fixing
> the existing issues rather than adding more. It's a lot
> easier/practical to fix new problems when they are not mixed together
> with zillions of old problems.

Well builds were mostly failing in the same place due to deterministic
build ordering, I was trying to make it so that we would see failures
in different places as that's more useful compared with always seeing
the same errors.

To me seeing the same errors most of the time indicates there's some
major coverage issues with the autobuilders which need fixing.

>
> Again, thanks a lot for your work on this!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
