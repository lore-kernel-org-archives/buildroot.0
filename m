Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15BFC00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 05:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D860C80BE0;
	Fri, 12 Aug 2022 05:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D860C80BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RU5J4zrAdyhV; Fri, 12 Aug 2022 05:08:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4E748338B;
	Fri, 12 Aug 2022 05:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4E748338B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3AA11BF86D
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 05:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 981EF4012D
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 05:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 981EF4012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id riEsHg5vs8IA for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 05:08:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A6FA400DD
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A6FA400DD
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 05:08:25 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d10so732220plr.6
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 22:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=zGL8gXPtEmrkT3EqpPYBs/a3RB5sgnR1kDMnq9XPTqk=;
 b=v092rWhbkSzPKIZ2FKUqV4QqcebnNDqAdKe29yP2Vuvx1m5By9++568qQMgJa+1arT
 P2FLp4b6MMjjjkRHclzmec3DMV3CRx0e9lJ+B66MHpDKKQklBbi7SDFUNXPjP+1cLqZf
 vFjc+1qEHqfcU2POSY6a/Byo9PdJiXN2GioP8kotmhg0i97idl44RvTcUgvIQ7NwdziB
 r9fh6EMJ7CnP2HMZ4PieT5HdEc8T+1Ekd8wb4j376bepKXR3LpjCWaOtK76wEbQxJT1X
 R6Dnej2T3E7E1TyyTNwoMx8KOWORPV0whZfhS3hnWzqZ8MfRzEE/JVLOHdLenX3zmYOs
 70FQ==
X-Gm-Message-State: ACgBeo2+aE229on38j8FQ8aff+mXOQndCV1WKqIqoLdVLOy8Xrwy5aoY
 ar8Gbt3hl0u3i672LBDUPcfa7/X5LvnMzDtQGHU=
X-Google-Smtp-Source: AA6agR74o8A9EhLZnkHcHNa4Sq4HUHurIjsVAUOElOtqG35/cn7klFA45QkfnbPp7IFWr/b4P7yEuCpUvUk/hnmJVDk=
X-Received: by 2002:a17:90b:2684:b0:1f4:f2a7:f2b3 with SMTP id
 pl4-20020a17090b268400b001f4f2a7f2b3mr12353193pjb.70.1660280904680; Thu, 11
 Aug 2022 22:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220727071557.3434892-1-james.hilliard1@gmail.com>
 <20220807155456.0be10777@windsurf>
 <CADvTj4ovUOQJ23nT-ZXgBEur10y9-QWRUuUXzu7EbikQLnYEaA@mail.gmail.com>
In-Reply-To: <CADvTj4ovUOQJ23nT-ZXgBEur10y9-QWRUuUXzu7EbikQLnYEaA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 11 Aug 2022 23:08:12 -0600
Message-ID: <CADvTj4qtOBncCMduFMOAOPb3atT=K6NZW0fRZ9aD1hXSNGCzCQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=zGL8gXPtEmrkT3EqpPYBs/a3RB5sgnR1kDMnq9XPTqk=;
 b=JUoPLAmiw73zpY8879B3HdAxn6o1r6t3F4YmWWwbK4yb2ajrwPnJIe5UL0HWhkGS9Y
 YtbPn8FO4e8DI4Rj4NP5VvzpvvBQOKY3+xDyEgbBHgX9Xuig9oZd42C7W95e5H+PhVZg
 ouLWvVcZhmJHbVOjt3KmzoNpD25FKV5pKBW3X0OZuocxWpNSk3rAtSvTjf+GOTcmS0fT
 sEwHb4bSd8651h9L9z1as8DjkcLeDKIcRrfuSQOmxAQ5yVUJKDXOJtrY0yw2ffNqHDP1
 25QSsXbokUVYI7z0xeX249IFIQ3FeWB9CYClgvAhkQLVpSwJe98c5gxQPeMUHev4redT
 bQaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JUoPLAmi
Subject: Re: [Buildroot] [PATCH v5 1/2] support/misc/toolchainfile.cmake.in:
 don't set PKG_CONFIG_SYSROOT_DIR
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Aug 8, 2022 at 1:15 AM James Hilliard <james.hilliard1@gmail.com> wrote:
>
> On Sun, Aug 7, 2022 at 7:54 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello James,
> >
> > On Wed, 27 Jul 2022 01:15:56 -0600
> > James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > > This doesn't appear to be required and seems to break for packages
> > > using meson's pkgconfig.relocatable format.
> >
> > Thanks for your contribution. However, if you want us to merge this can
> > of contribution needs much, much, much better commit logs and
> > explanations.
> >
> > An explanation that starts with "this doesn't appear to be required"
> > and continues with "seems to break" is the opposite of a convincing
> > explanation.
> >
> > Here is the sort of commit log that we need:
> >
> > """
> > Defining PKG_CONFIG_SYSROOT_DIR in the CMake toolchain file is not
> > needed because it is already passed...
> >
> > In addition, passing this in the CMake toolchain file causes breakage
> > of the following defconfig, once meson's pkgconfig.relocatable is
> > enabled, with the following failure:
> >
> > [...]
> >
> > This failure occurs because ...
> > """
> >
> > Note: I agree that passing PKG_CONFIG_SYSROOT_DIR in the CMake
> > toolchain file is probably not needed because our pkg-config wrapper
> > already passes the right value. However, I fail to see how that can
> > make a difference. How something in the CMake toolchain file can affect
> > the build of Meson based packages?
>
> I think it's an issue with how it interacts with meson's pkg-config prefix in
> relocatable mode AFAIU, seems cmake wasn't setting the prefix correctly,
> which generally only seemed to cause issues with PKG_CONFIG_SYSROOT_DIR
> from what I could tell.
>
> I recall someone mentioned PKG_CONFIG_SYSROOT_DIR was needed for
> external toolchains or something along those lines so I came up with
> an alternative
> approach to avoid removing PKG_CONFIG_SYSROOT_DIR.

Oh, it was apparently needed by external builds using the SDK, see:
https://lore.kernel.org/buildroot/23a6eba2-06fd-8579-9815-214b3656daf7@mind.be/

>
> >
> > We very much appreciate all the improvements you are submitting, many
> > of them are very relevant and very useful. However, to have them
> > merged, we need detailed and convincing argumentation, no vague commit
> > logs that seem to indicate the change is actually papering over a
> > problem rather than addressing it for real.
>
> This was superseded by:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220728014402.142320-1-james.hilliard1@gmail.com/

I avoided removing PKG_CONFIG_SYSROOT_DIR due to the SDK issue.

> https://patchwork.ozlabs.org/project/buildroot/patch/20220728014402.142320-2-james.hilliard1@gmail.com/
>
> I separated the pkg-config and relocatable format change out from the ninja
> to meson build/install migration.
>
> >
> > Thanks!
> >
> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering and training
> > https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
