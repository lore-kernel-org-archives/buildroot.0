Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00A7C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36506419BC;
	Tue, 26 Jul 2022 17:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36506419BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuXSWzOGa53R; Tue, 26 Jul 2022 17:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CECA441944;
	Tue, 26 Jul 2022 17:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CECA441944
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77AA11BF9B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FC458405F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FC458405F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DeOXGppMgQQk for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:27:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E0258404A
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E0258404A
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:27:02 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 v40-20020a056830092800b0061d0ac9ebb2so2992010ott.10
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 10:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9UA2xubRvMs28qmORcB1eWkTF6ofHelTNhcEv4CCoQ=;
 b=hMp0T96ajXvDlfu9iRYVvpQvC31qgL4Zf2DXPJ+EsaT0YyX3AWn/NxhWW4uUD4sBEW
 rOjI8D5icUttvcN1Y0kIQsTXEqbpTYJrWcicvrB9JypntNaOUDjdv3u20dDT5s3Lw5un
 uVB+ei/GuC+KVYakmw6fKpl73Kzdhz+FfySuGLl7uz0M9QKq89PW86OM5lLe4f3XG7Wk
 ZMMRtykrjGwIbWgLcsbT+4nltZWHX4QDcZUBUEt+yiQ3qk4LIGHrnePOOhVXYBnIjR7H
 ++NR7xnkPFLjJ2ed93LLLaIhZZ24+L8Yr7u5BNNpjwoM86mjnTgrT46/JM6gHAG8VXGc
 0mww==
X-Gm-Message-State: AJIora+ffgioh1p0YtOByk5XEDthXWrMAi9T+qgeCKQCuR/aEGxys6CE
 JbpxEfPPjwmeX1Ew8Yk0crHSauWWcfIz1l5pG2I=
X-Google-Smtp-Source: AGRyM1s86rp00pTvZCb8vKiUIXU1E46Z7pFB5uVtdq82Fe/KywxC48VXtyTBGZCGnsP/8aMaSnhzSjzvE1eluldoxF4=
X-Received: by 2002:a9d:6d17:0:b0:61c:b016:bd32 with SMTP id
 o23-20020a9d6d17000000b0061cb016bd32mr7272442otp.74.1658856421460; Tue, 26
 Jul 2022 10:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220726044425.72570-1-james.hilliard1@gmail.com>
 <20220726044425.72570-2-james.hilliard1@gmail.com>
 <20220726082503.48ce118f@windsurf>
 <CADvTj4ob3JZmsB=jdW3kM4mTQ30jsDXWTOEG5FUG1b=vwfRB8g@mail.gmail.com>
 <20220726090755.2ec1a4a8@windsurf>
In-Reply-To: <20220726090755.2ec1a4a8@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 26 Jul 2022 11:26:50 -0600
Message-ID: <CADvTj4oay+SKPqUojKnuoG-XKk7D+GaiAgcT4Pj-mCic8SKXhw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=A9UA2xubRvMs28qmORcB1eWkTF6ofHelTNhcEv4CCoQ=;
 b=DoptueAgYm8LHXIN5wOEhfuN6OqWy1Xiss/bouR+oEJ/4GA4T6rlVm7m7Fb0L4e0XI
 5HJcFJ7Bybpgi2Tb5FghStn2Vu7aDd1//NMQtntKiP8pOOxDo6l+WLNTBKUHQbhZ9/0y
 gn3dKzHTz6zbPM8gjJuO77tdpR2Wo/A48NkWKP1WSsQVmUOSKJyiUjTM8CoPvBqK/6T2
 zvg/JOKwNAvglIeywgKI0VceyS0lvy9RKsorY7EXGQaRjqUAXgeUqmh0sm+fnI2xVMrG
 vWg6O8UaXXv/79fBiFCZ7fG9VEKJdtCLG6zrNqvA/wVwtOOA36NFTW7GwdRTESCqKnhg
 4T+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DoptueAg
Subject: Re: [Buildroot] [PATCH v4 2/2] package/pkg-meson: use meson to
 build/install packages
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
 buildroot <buildroot@buildroot.org>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jul 26, 2022 at 1:07 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 26 Jul 2022 00:38:11 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > > I *think* this is wrong, at least in the classical autotools sense of
> > > prefix vs. DESTDIR.
> >
> > This isn't really different from how we handle target/staging prefix+install.
>
> It is completely different. Do you know the difference between prefix
> and DESTDIR?
>
> prefix is the path where the software will be located when executed.

We install to the package's per-package directory $(HOST_DIR) but
we don't actually execute it from there AFAIU.

Since the execution location changes for each per-package build I thought
we wanted the prefix to be independent of the absolute installation path.

>
> DESTDIR is here to divert the installation.
>
> For host packages, we use prefix=$(HOST_DIR) and no DESTDIR because the
> software will be located in $(HOST_DIR) when executed.

But the $(HOST_DIR) it's installed to is not the same $(HOST_DIR) it's executed
from when BR2_PER_PACKAGE_DIRECTORIES is enabled, at least when
it's executed from a reverse dependency.

>
> For target packages, we use prefix=/usr and DESTDIR=$(TARGET_DIR) /
> $(STAGING_DIR) because the software will be located in /usr when
> executed on the target, but temporarily during the installation we need
> the files to go in $(TARGET_DIR) or $(STAGING_DIR).
>
> See also https://www.gnu.org/prep/standards/html_node/DESTDIR.html.
>
> > > And you should drop --destdir $$(HOST_DIR) here.
> >
> > I recall this didn't work due to pkg-config file generation being prefix based
> > which was resulting in pkg-config files being incompatible with per-package
> > directories.
>
> And this needs to be investigated since as explained above --prefix /
> and --destdir $(HOST_DIR) is most likely incorrect for host packages.
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
