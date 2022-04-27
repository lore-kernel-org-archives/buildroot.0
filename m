Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075D8C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5B5060EDE;
	Wed, 27 Apr 2022 07:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBKsCo15c0w7; Wed, 27 Apr 2022 07:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AB0961007;
	Wed, 27 Apr 2022 07:16:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0AF1BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66843415A9
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndbxEZfiuIeq for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:15:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13DB44092B
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:15:46 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id v65so1048574oig.10
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 00:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xwmEAi0AMGQiRt8AF5bQtkMk3aZ4qDDdJGTvelz1W38=;
 b=Xfnrivs8RD0VPj+V/QNOxCPYYGGyQvYHMO26ylQ9pUaeXyonY///xHRxRYh7ITU+8R
 2DPPMI/mg5V6/p4I3PoG7U5jYZ6iInMPs1Msb+RlTW5EyaJYCKQDrOOUFxwW/XfgrFQS
 CpUBgiUbHI/Th7KH61gL8FVuz3n5G8Qov5rMrA2hqRDe7oIzhA5Lh2lTVgm+VZuTh2Gv
 MmiYfG9GH0fCsM/cFR1b6JKEqUlufStGDfupmT9v1Ny9MLPbpXY3veTAOUApsi1m51vp
 Ge1zKjy0vMZTQXleNgWTUfGU/A18u3XpLlG/MSxqtaRQItCzRTMnHCOhsqWhWZU4klsZ
 NGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xwmEAi0AMGQiRt8AF5bQtkMk3aZ4qDDdJGTvelz1W38=;
 b=fmjv9IU3h6v63IZ2bupnbKjG2q2QxORc0bESJhekq1k1AcavXjyXEcs/hUcrEerfK0
 FF/pdwh4UTgHWrJPrSur8GtnghAKtQvbMywJlDxkSJdKQ5NxL1tUeKqftjltWorxKYxy
 boTdINwgpM2oeGEDeDsC+uEM+xmkakGurnjKbNo2VjnGM/YRCEPT3d6hZlIM+JZ6Z4Ti
 vdIIBmuwjnSWEd9fdTWRvy0zbeyqib+iUbsQfQE/jYnG9mZwCvW0YOR3x9WvmW+csg6W
 Qdi52KePO0+jzM7AuDkM50rLZbZKfB7J9HlBizbpH7at/qhkfyX6k/dYl4gONBXnrETU
 L0eQ==
X-Gm-Message-State: AOAM532MyUYsYDZ5AJlkSG8VPQMoIwG0qy93BNLp999kFxe3q4SbeArB
 RukYdHdlG7ijUunNX5XWtQv+NfWm34LyZvi4DgQXA+m9hQE=
X-Google-Smtp-Source: ABdhPJyrnkKTP5DQAXcnfZLPmJ4F36zutpB2A+zS/QGQzGnAe8KoE2/VcL/1QxVJpQV1Dteu3o+pN/acZRRTA1wkmwQ=
X-Received: by 2002:a05:6808:10c9:b0:322:b09e:a077 with SMTP id
 s9-20020a05680810c900b00322b09ea077mr12597947ois.99.1651043745889; Wed, 27
 Apr 2022 00:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
 <20220424213958.1747120-4-james.hilliard1@gmail.com>
 <f2289739-57a7-268c-ebc1-1ba41d8c2d41@mind.be>
 <CADvTj4qJwS=qwt=ce0JX0UHEeZ04BJoSsuV=2kvqxAiA+2OvYw@mail.gmail.com>
 <57660639-2f34-4068-793a-ce82fc881b47@mind.be>
In-Reply-To: <57660639-2f34-4068-793a-ce82fc881b47@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 27 Apr 2022 01:15:34 -0600
Message-ID: <CADvTj4qGOxNqc3jwrv=1OgE2VZJcypHKrUgmZK5gC9yV-YucmQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v7 4/5] package/python-tomli: bump to
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Apr 27, 2022 at 1:07 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 26/04/2022 03:35, James Hilliard wrote:
> > On Mon, Apr 25, 2022 at 4:37 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 24/04/2022 23:39, James Hilliard wrote:
> >>> This package now requires flit and must use the flit-bootstrap setup
> >>> type for the host build since it is a dependency of
> >>> host-python-pypa-build.
> >>>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>
> >>
> >>    Applied to master, thanks.
> >>
> >>    While testing this series, I noticed that the following gives an error (this
> >> was already the case in the original series; I haven't checked how it was before
> >> your series was applied - for tomli, it certainly wouldn't happen because it
> >> would still be using setuptools, but maybe for other flit packages, I don't know).
> >>
> >> make python-tomli
> >> make python-tomli-dirclean
> >> make python-tomli
> >> ...
> >> FileExistsError: File already exists:
> >> /home/arnout/src/buildroot/output/target/usr/lib/python3.10/site-packages/tomli/__init__.py
> >
> > I think it happens only when building across version bumps, probably a bug
> > with installer(https://github.com/pypa/installer) upstream.
>
>   No, it's exactly the sequence of commands that I wrote above that triggers it.

Oh, yeah, I see what's happening, I was testing with per-package directories
which prevents one from hitting that issue in most cases since it clears out
the conflicting/old artifacts with dirclean.

>
>   I haven't checked if this is the case for flit/pep517 packages in general, or
> just for flit-bootstrap.

Likely affects all flit/flit-bootstrap and pep517 packages if I had to
guess, seems
due to stale build artifacts lying around combined with installer not wanting to
overwrite artifacts in general, might need to upstream some way to enable
artifact overwrites, I'll look into that.

>
>   Regards,
>   Arnout
>
> >
> >>
> >>    Would be nice to get that fixed...
> >
> > Yeah, I'll see if I can track that issue down.
> >
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>> ---
> >>> Changes v6 -> v7:
> >>>     - only use flit-boostrap for host-python-tomli
> >>> ---
> >>>    package/python-tomli/python-tomli.hash | 4 ++--
> >>>    package/python-tomli/python-tomli.mk   | 7 ++++---
> >>>    2 files changed, 6 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
> >>> index 1a274c8a40..8368f9ee13 100644
> >>> --- a/package/python-tomli/python-tomli.hash
> >>> +++ b/package/python-tomli/python-tomli.hash
> >>> @@ -1,5 +1,5 @@
> >>>    # md5, sha256 from https://pypi.org/pypi/tomli/json
> >>> -md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
> >>> -sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
> >>> +md5  d4341621d423a7ca6822e23d6d52bb9a  tomli-2.0.1.tar.gz
> >>> +sha256  de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f  tomli-2.0.1.tar.gz
> >>>    # Locally computed sha256 checksums
> >>>    sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
> >>> diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
> >>> index b8c20ca736..b803d67466 100644
> >>> --- a/package/python-tomli/python-tomli.mk
> >>> +++ b/package/python-tomli/python-tomli.mk
> >>> @@ -4,12 +4,13 @@
> >>>    #
> >>>    ################################################################################
> >>>
> >>> -PYTHON_TOMLI_VERSION = 1.2.0
> >>> +PYTHON_TOMLI_VERSION = 2.0.1
> >>>    PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
> >>> -PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
> >>> -PYTHON_TOMLI_SETUP_TYPE = distutils
> >>> +PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3
> >>>    PYTHON_TOMLI_LICENSE = MIT
> >>>    PYTHON_TOMLI_LICENSE_FILES = LICENSE
> >>> +PYTHON_TOMLI_SETUP_TYPE = flit
> >>> +HOST_PYTHON_TOMLI_SETUP_TYPE = flit-bootstrap
> >>>
> >>>    $(eval $(python-package))
> >>>    $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
