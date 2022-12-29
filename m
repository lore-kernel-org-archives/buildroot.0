Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B91C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 18:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9AF480DCB;
	Thu, 29 Dec 2022 18:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9AF480DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTycJor54cTz; Thu, 29 Dec 2022 18:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3A2080B9D;
	Thu, 29 Dec 2022 18:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3A2080B9D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B03221BF390
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 18:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89E02400BA
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 18:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89E02400BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1NxqSTEeutu for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 18:19:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45B21400A4
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45B21400A4
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 18:19:39 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id jl4so13376483plb.8
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 10:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9mmVmFuSfPUuY/E8MFAOgCPBO7tiEJAuL5Cck1uam/w=;
 b=kknhuCatJr8CtRTUF722MBftwtDRqA/n7S04Gwx4DfeRU95qTohWWt4Z59GwEu5BMv
 fONZIt9BfQoNQeYkw09n66HUSDC5eN8OnCJgWkJeTTRagrf+6hYYJNPHVGL2Q1eD6rmU
 6a1oaeHG66+zkYUIjIOYsb4YizVGy/xcjljiAxF1C9SWhkyEVFmZPv82eAb+8BIq+Vu3
 NkfqpclFeCQWu6WKNw3dTh8kim1XH2GEg+mMa+htjg9fMStcnPOV8uxp2R46YcePdYhy
 08pH2+AJTSiG6A6z4JTcPqXaZ5NwU+HpDsYCCsg1uWcw9Qh1VXvw7q0NKI9WjAySLcjn
 gETw==
X-Gm-Message-State: AFqh2krzftw//iKleH5+8nnbvZgYdAoSGBqgzGvJdae8Bu8paQoGzWSL
 Ns21dCFtDg5NxgOCX/WsCBmZyaEZR8No4AypyT0Swzo4u6k=
X-Google-Smtp-Source: AMrXdXtk/nsaJ9yXEK213eud6+JpaBGTqLP2yw+0S3H4vtajDejYgLVNOd+6PeR2kojUaBjR6y7tSI4GtbX7egNNi1A=
X-Received: by 2002:a17:90b:46d4:b0:21a:1d94:5691 with SMTP id
 jx20-20020a17090b46d400b0021a1d945691mr2839331pjb.227.1672337978560; Thu, 29
 Dec 2022 10:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20221228230326.3799157-1-JoelsonCarl@gmail.com>
 <189a295b-c984-9580-ced2-b8c0b34d3210@sonologic.nl>
In-Reply-To: <189a295b-c984-9580-ced2-b8c0b34d3210@sonologic.nl>
From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Thu, 29 Dec 2022 11:19:27 -0700
Message-ID: <CA+1k=2bP59qt6dVnqhu1NCsakdHcTJ6mdU82swM76N_ifO=tnA@mail.gmail.com>
To: Koen Martens <gmc@sonologic.nl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9mmVmFuSfPUuY/E8MFAOgCPBO7tiEJAuL5Cck1uam/w=;
 b=HioRW+WpRfnMiBUtabGknBdZMWSpxlwCOLl8u/CtT8+RoEqvC7p4mcEMPQhPWMUH7G
 kL+raANdS7/v+fTVcxAM+IvY4RpM7HiJfkKQUzUpcLGx6huwI0+vNANAVJ6u+JAHQX22
 vkpJiYlSzqjgKv0/rKeHbzGuCmuGhxA8KXUgdIrit5cDQQV9bSIA3GD9GP8w2x04sBFe
 pzaSEt0to4PmQ/sljhArh2b8DMVve01W5fZJ53QG5Xbhhgw6BXTzHJH8A/2tWDiziz10
 pPKQVKc1YEULZEk1WgHIt2VjY/jWAt21THI3GJaCzADIqR/mPzo1p1ZWCklQ6nSkjS94
 k9HQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HioRW+Wp
Subject: Re: [Buildroot] [PATCH 1/1] package/capnproto: bump version to
 0.10.3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Dec 29, 2022 at 6:36 AM Koen Martens <gmc@sonologic.nl> wrote:
>
> Hey Joel,
>
> Cool. Did you manage to get it to compile on all platforms? I tried a
> while ago to bump the version, but sadly ran into compilation failures
> on a handful of platforms, which is why I never submitted a patch. I
> didn't have the time to figure out why it failed, what would be needed
> to make it pass or how to patch the configuration requirements to not
> show up on the affected platforms.

I used "./utils/test-pkg -a" and of the 44 toolchains that it goes
through, they were all OK or SKIPPED.  I don't test much beyond that.
If that isn't mostly inclusive of all the variations, then we'll soon
know through the autobuilder reports.

> I guess we'll find out soon enough, when I start getting mails from the
> automated build system that it's failing (or not). Just in case, I
> currently and in the near future do not have the time to diagnose any
> failures that might result from bumping the version. Hope that if they
> do fail, you can have a look.
>
> It's probably best if I remove myself as a maintainer for this package,
> perhaps you'd like to take over?

I am actually already in DEVELOPERS for capnproto, as I revived and
pushed through your original patch to add it that had stalled at the
time.

So I'll still remain on DEVELOPERS for capnproto if you remove
yourself. Though I'll admit, my responsiveness to the packages I'm
listed for is fairly slow (cmocka has had a build error on one
toolchain for I don't know how long now...). And I honestly haven't
used capnproto since adding it. We thought we were gonna use it on our
system back when I added the package to buildroot, but then ended up
using a different library.

So yeah... that doesn't answer the question super well, but if you
drop yourself, there will still be at least me (very slowly)
eventually responding to issues for capnproto. =)

-Joel

>
> Apologies,
>
> Koen
>
> On 29-12-2022 00:03, Joel Carlson wrote:
> > The 0.10 line offers minor improvements and bug fixes.
> >
> > The previous security bump from 0.9.1 to 0.9.2 fixed CVE-2022-46149,
> > which was also present in 0.10.2, but is fixed within 0.10.3.
> >
> > Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> > ---
> >   package/capnproto/capnproto.hash | 2 +-
> >   package/capnproto/capnproto.mk   | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
> > index c3233e7c8b..0faf69d069 100644
> > --- a/package/capnproto/capnproto.hash
> > +++ b/package/capnproto/capnproto.hash
> > @@ -1,3 +1,3 @@
> >   # Locally calculated
> > -sha256  4fe1ca8ab90859f33f08d2c4fcd7099e2983b0b946beecebd2fe051e3a64c67e  capnproto-0.9.2.tar.gz
> > +sha256  e07446f56043c983e009038e69d18ff86a2924909f0b518ccf47eccf5ac03919  capnproto-0.10.3.tar.gz
> >   sha256  9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
> > diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
> > index 23f128455a..84acf5fc65 100644
> > --- a/package/capnproto/capnproto.mk
> > +++ b/package/capnproto/capnproto.mk
> > @@ -4,7 +4,7 @@
> >   #
> >   ################################################################################
> >
> > -CAPNPROTO_VERSION = 0.9.2
> > +CAPNPROTO_VERSION = 0.10.3
> >   CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
> >   CAPNPROTO_LICENSE = MIT
> >   CAPNPROTO_LICENSE_FILES = LICENSE
>
> --
> Software architecture & engineering: https://www.sonologic.se/
> Sci-fi: https://www.koenmartens.nl/
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
