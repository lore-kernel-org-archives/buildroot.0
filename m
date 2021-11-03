Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2110CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:20:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD8DC610A8
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD8DC610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A85D98100C;
	Wed,  3 Nov 2021 20:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJl7lRz8Yupo; Wed,  3 Nov 2021 20:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA40C80F0E;
	Wed,  3 Nov 2021 20:20:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E57FA1BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E271280F0E
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JvLRKbsyzq-Q for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:20:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F045880F0C
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:20:43 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id bl27so2662001oib.0
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 13:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=buW/Q43Zgk3gBoMrUEl6T64zzyUX5mu1z2bXMFlwoI4=;
 b=XXaL8deyX+Sf/bfNyrPsOSlW6Fzmry1VnqG01vjvpT0jqeghXLyzVLazys+B2kQVDR
 gcSN7kX3BdmIjr5Y5uMIQyF9HcWjnnlIm1haOQe+UttYadCbbqqtFqRooYirRd+0sfvy
 isZZpdpAcXlj+K6YOxRzLhdAUw6QpIu0XYmwgK4quVJWO9D+010puUorIbPzPUJD0ZEc
 ju2nNg2nlJ1u2/V/8F4bzAj5/GHM4mHH2SA3Qdg88fpQmeW6J4CreFY73BFfw70pRH9Q
 iehrGLRHseKu/xTEtN3a2slIKWAjBEohTGT7HBI86x8OeEI05S/txM1dLk7iaS1R255A
 707Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=buW/Q43Zgk3gBoMrUEl6T64zzyUX5mu1z2bXMFlwoI4=;
 b=iEqpYNU+1kav9nROGpgvk6voGHpr/OFNfLlFnhQCvpDENEN9vdNBID9S3YiZAKQDrT
 yOsqvgLTLXGmmAIpkGxQ3YcVwW2smtzn2ZgVZgXwVhgQfzAbJK3xMLsdWMbckj8aVb25
 Pm7blq3SabaJtaaIWzTXmg3fdzuqqpasWx77ZMOPXT9pENQrfaWC8iZMyBOMlqC3s4ij
 TYXVsZ+MbPxppP6yPWv/GtOE5fiHi5BOoQhn9ysFTZ43gNXC53bp6+c6bfdaeB70PS1+
 rR0KYo2aibC2CvoUq9QzOnIW94Sb2cwoKFuBoWVFYgC9aWgyAUg3KYQCF/th2dJH3Svn
 GiWQ==
X-Gm-Message-State: AOAM5306zpEIWN9+ztCWV+a5JBlCiYdlf0sB8/Eh9A4SvTqcez4djIo+
 HZbJBjH0MNDWywuiIaATk+NXvmlwqUEYk54wQF4=
X-Google-Smtp-Source: ABdhPJwzQw1hZgrHvb8w65QBsQ7fiuA/+h3OkXATiii7eyuWXvMhom/TA2BBxoasdz0yvQ17TwoHxj2FzBFTUc54KT8=
X-Received: by 2002:a05:6808:3027:: with SMTP id
 ay39mr12696910oib.39.1635970842553; 
 Wed, 03 Nov 2021 13:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211029065957.3084528-1-james.hilliard1@gmail.com>
 <20211103204805.1facb4a9@gmx.net>
 <CADvTj4rCzGkrFuPj67Xu9s7A3FNeyBpBEBQKiULQaLF4GYnEKg@mail.gmail.com>
 <20211103211202.539dba74@gmx.net>
In-Reply-To: <20211103211202.539dba74@gmx.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 3 Nov 2021 14:20:31 -0600
Message-ID: <CADvTj4ofL6Pzrog2Ss1UrHKwCBRxQWHR6=L4JhDXbUTyp5AJ8w@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: add
 host-python3-six host dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Nov 3, 2021 at 2:12 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello James,
>
> On Wed, 3 Nov 2021 13:51:09 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > On Wed, Nov 3, 2021 at 1:48 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > >
> > > Hello James, Fabrice, *
> > >
> > > On Fri, 29 Oct 2021 00:59:57 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:
> > >
> > > > This dependency wasn't added during the removal of
> > > > python3-cryptography.
> > >
> > > The conversion/dropping of python3-cryptography was done with commits [1] and [2],
> > > and the commit log of [1] states the dropping of the host-python3-six dependency
> > > was intentionally:
> > >
> > >         [...]
> > >         While at it, drop host-python3-pip and host-python3-six as these
> > >         dependencies are not needed. Indeed, pip was never a dependency of
> > >         cryptography and six is not a dependency with python3 and will be
> > >         dropped in version 3.4 and
> > >         https://github.com/pyca/cryptography/commit/e66db8079d3fbd0110e87ece1fd48f4bfd9e48b9
> > >         [...]
> > >
> > > But the package python-cryptography is still at version 3.3.2 (and clearly depends on six)
> > >
> > > @Fabrice: version bump pending?
> >
> > I actually have a patch from a while back bumping the version...but it
> > also requires rust
> > support and that would probably cause a bit of breakage:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20210318044253.3202355-2-james.hilliard1@gmail.com/
> >
> > So it's probably going to be a while before we can update cryptography
> > if I had to guess.
>
> Clear vote for keeping the old version and re-adding the host-python3-six
> dependency ;-)
>
> Mind to re-spin your patch with some explanation?

Sure, I mostly just copied your explanation of the issue:
https://patchwork.ozlabs.org/project/buildroot/patch/20211103201932.296897-1-james.hilliard1@gmail.com/

>
> Regards,
> Peter
>
> >
> > >
> > > @James: with a bit of explanation added to the commit log you can add my
> > >
> > > Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> > >
> > > But although fine with an version bump of the package ;-)
> > >
> > > Regards,
> > > Peter
> > >
> > > [1] https://git.buildroot.net/buildroot/commit/?id=95a63a34ac9204c4fe069154783bd97ed48c3ae2
> > > [2] https://git.buildroot.net/buildroot/commit/?id=43147827a7b759248288fad1d97130c027c23e9a
> > >
> > > >
> > > > Fixes:
> > > >  - http://autobuild.buildroot.net/results/971/9711ccebb9c3e2fa8f17d969d8b431d4301677e3/build-end.log
> > > >
> > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > ---
> > > >  package/python-cryptography/python-cryptography.mk | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> > > > index e21b9db042..081dfc06a0 100644
> > > > --- a/package/python-cryptography/python-cryptography.mk
> > > > +++ b/package/python-cryptography/python-cryptography.mk
> > > > @@ -14,7 +14,10 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
> > > >  PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
> > > >  PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
> > > >  HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
> > > > -HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
> > > > +HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
> > > > +     host-python3-cffi \
> > > > +     host-python3-six \
> > > > +     host-openssl
> > > >
> > > >  $(eval $(python-package))
> > > >  $(eval $(host-python-package))
> > >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
