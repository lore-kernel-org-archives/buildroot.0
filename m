Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C18C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB1A66058D
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB1A66058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAECF40146;
	Wed,  3 Nov 2021 19:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZtMYfMb2tSc; Wed,  3 Nov 2021 19:51:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13426401C0;
	Wed,  3 Nov 2021 19:51:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D722E1BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1CB581006
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgoJDPASvxK7 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 19:51:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DA9181003
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 19:51:21 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 w23-20020a4a9d17000000b002bb72fd39f3so1170684ooj.11
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 12:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2jJRj4CTKBBOqHel2BSiB3IhzgjyUOEJqOGYVUgC29g=;
 b=HWQWJ1hBmeYH2wBQ1jC2OxuotgPxcprHu3iRtLISvO2HspI5rU09vH++tYDEUAWfS4
 I8igPBVl3ukzp/iQvEaIM0IKFrm0yjkgqzKGHjn+0IGPkXDupKjoVwLo9DwqmkdcmaDk
 yse4d/Kk5BU1Tz0mcquuH31zccmD5G9Vybleumn6Pg5PiyhAzvzkUYDziUFp+3oXPgJk
 aWMHsr74tQX+AYl+TFunL4pnjf2Hl0jtJ7ZtEY/qReYwJ6P3qWLuNR5BSEbyjkz3jIxK
 1qONEehBFf4nPgyHAerKfDkLkoqhmxnJEsU9SGXGvXfyobXxJWWqRFLa74FT88ugtLMp
 8Ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2jJRj4CTKBBOqHel2BSiB3IhzgjyUOEJqOGYVUgC29g=;
 b=E86DZRvNb4OTPKnPTbJkbX6skzDrQjcAV+2/g8ul1fJAiFotR+jlDdOWLYB71Ir1Zt
 KQx28jglwrWYedge/8lLVaFTuohlyGcMHmcVbpzRav3csrZpaWXTfU5QyRtbnaBPNnAa
 7eBa9SKIXUNg6Ucmo42+mAIPk4dw2+xg46MjM95dbV9NQtn+izwtC16v2V5ygT357cTt
 6LhLoLcmKjiYQLl5+BYovG9DTcRBDrnKGNWp40qNj0Y4ZNLxu3U3XXIiK3AzeyRw+Oda
 25n2e6CLVkflX0LecFudxOszjISscVUlvIpuW8HfvfeZkI+a4LCZ2lQGRdf0AffxxhRg
 z9Zg==
X-Gm-Message-State: AOAM533tU8e/PTQH4tBijNm27FhAUwdg1J+VtN8c53afJDNMLufefi2d
 6Ti+WJfMxvlLIYIFzRZp5GOVVwYqnVvldJfhndQ=
X-Google-Smtp-Source: ABdhPJyxR93pXqJqvi4F3phBFcalB6bDOy3/yM0DLQi7M7lDi8vA2bi2JWLX/6o+7RblG8svqV1pFhEuvNNDCdmQqt8=
X-Received: by 2002:a4a:ea54:: with SMTP id j20mr415045ooe.22.1635969080293;
 Wed, 03 Nov 2021 12:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211029065957.3084528-1-james.hilliard1@gmail.com>
 <20211103204805.1facb4a9@gmx.net>
In-Reply-To: <20211103204805.1facb4a9@gmx.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 3 Nov 2021 13:51:09 -0600
Message-ID: <CADvTj4rCzGkrFuPj67Xu9s7A3FNeyBpBEBQKiULQaLF4GYnEKg@mail.gmail.com>
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Nov 3, 2021 at 1:48 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello James, Fabrice, *
>
> On Fri, 29 Oct 2021 00:59:57 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > This dependency wasn't added during the removal of
> > python3-cryptography.
>
> The conversion/dropping of python3-cryptography was done with commits [1] and [2],
> and the commit log of [1] states the dropping of the host-python3-six dependency
> was intentionally:
>
>         [...]
>         While at it, drop host-python3-pip and host-python3-six as these
>         dependencies are not needed. Indeed, pip was never a dependency of
>         cryptography and six is not a dependency with python3 and will be
>         dropped in version 3.4 and
>         https://github.com/pyca/cryptography/commit/e66db8079d3fbd0110e87ece1fd48f4bfd9e48b9
>         [...]
>
> But the package python-cryptography is still at version 3.3.2 (and clearly depends on six)
>
> @Fabrice: version bump pending?

I actually have a patch from a while back bumping the version...but it
also requires rust
support and that would probably cause a bit of breakage:
https://patchwork.ozlabs.org/project/buildroot/patch/20210318044253.3202355-2-james.hilliard1@gmail.com/

So it's probably going to be a while before we can update cryptography
if I had to guess.

>
> @James: with a bit of explanation added to the commit log you can add my
>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
>
> But although fine with an version bump of the package ;-)
>
> Regards,
> Peter
>
> [1] https://git.buildroot.net/buildroot/commit/?id=95a63a34ac9204c4fe069154783bd97ed48c3ae2
> [2] https://git.buildroot.net/buildroot/commit/?id=43147827a7b759248288fad1d97130c027c23e9a
>
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/971/9711ccebb9c3e2fa8f17d969d8b431d4301677e3/build-end.log
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/python-cryptography/python-cryptography.mk | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> > index e21b9db042..081dfc06a0 100644
> > --- a/package/python-cryptography/python-cryptography.mk
> > +++ b/package/python-cryptography/python-cryptography.mk
> > @@ -14,7 +14,10 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
> >  PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
> >  PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
> >  HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
> > -HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
> > +HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
> > +     host-python3-cffi \
> > +     host-python3-six \
> > +     host-openssl
> >
> >  $(eval $(python-package))
> >  $(eval $(host-python-package))
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
