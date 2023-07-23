Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771FCC001E0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 03:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF55260B2B;
	Sun, 23 Jul 2023 03:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF55260B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMz8dql8c0s4; Sun, 23 Jul 2023 03:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA32B60B6A;
	Sun, 23 Jul 2023 03:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA32B60B6A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6F661BF34B
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 03:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA6D2403E9
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 03:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA6D2403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSLVaQB1UGND for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 03:22:32 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E8B140103
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 03:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E8B140103
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51e526e0fe4so4960199a12.3
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 20:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690082549; x=1690687349;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/dyGmQFCyr5b8t3APVr2H0NKQ4KrwnMZrI+X712TC8s=;
 b=X7Mz5A6YaAyk5pMmFds44reg0fz35SYMKVvsq+4OX6DL97nBU1DNwx3e41knLip5q7
 giq1MpOC6lj36nBxyXlPSeMKS/m+Z1jqYPlov1yJvpzyoP5/CUwLv09ohlcD0qZFGin/
 SVchj7DbCkxQT5cot3bfqkwwH49s2r0F81GCI8SPgXOxH1LLZcxzmRAsklthTvfkk+pq
 tOt49k+2dkMZkWyEvHQilOE3P9Pe4pANQaWY0M+RFatQo+MXDWrJcxaupq1N0VE1NeiM
 nEUiv2V2wTlTTuGSmc5S6XBK4PD/s+k86zRRGtkynn25Dgz8XFgsLtPc8EFXC0SaW7/a
 RWYQ==
X-Gm-Message-State: ABy/qLbjRdb+YafQLq4D6Yfv6KXcR8Pv8o51z5fEtFv4klHqZbfcPfHJ
 C9t+8171p11+yYtlzkvti4TP3wuIsfGrB11/P07dMQ==
X-Google-Smtp-Source: APBJJlFvclWlMY26jm03Wn/mP9Ef1670kYveusaWC+WjhO6E50KWlvdYEv8+NVWUJEKln9Dd4U4ltA==
X-Received: by 2002:a05:6402:2039:b0:522:1e24:afb6 with SMTP id
 ay25-20020a056402203900b005221e24afb6mr2088948edb.0.1690082548201; 
 Sat, 22 Jul 2023 20:22:28 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 l25-20020aa7c3d9000000b0051873c201a0sm4120431edr.26.2023.07.22.20.22.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Jul 2023 20:22:27 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5221e487e08so1116268a12.0
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 20:22:27 -0700 (PDT)
X-Received: by 2002:a05:6402:893:b0:522:2813:2557 with SMTP id
 e19-20020a056402089300b0052228132557mr546899edy.15.1690082546645; Sat, 22 Jul
 2023 20:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230711220849.1702358-1-christian@aperture.us>
 <20230711220849.1702358-4-christian@aperture.us>
 <20230722231336.760d74ea@windsurf>
 <CA+h8R2rgtSsq9V=TmSa2JB53=EEvhPzFwpEEw0edk+v-RyOFCA@mail.gmail.com>
 <20230723002803.12e6545a@windsurf>
In-Reply-To: <20230723002803.12e6545a@windsurf>
Date: Sat, 22 Jul 2023 20:22:18 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oEYmst=mCd-QQFg-r37W46DbNjwTH+pvuM56EsZp0CGw@mail.gmail.com>
Message-ID: <CA+h8R2oEYmst=mCd-QQFg-r37W46DbNjwTH+pvuM56EsZp0CGw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690082549; x=1690687349;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/dyGmQFCyr5b8t3APVr2H0NKQ4KrwnMZrI+X712TC8s=;
 b=z2jMHv74j9Pl0ko3iSZdq8daKisi4KnAJwBP+2V4XLD9nJDcOJjspYxSmis36sX6CE
 ezytTYmIrC75sZH2zXfDm3RJ09rWs1RvPVxPTHnBbcxH3L7LO5LluUg/28KT6zVkLwrK
 aLHwqfRTHUVCaTwAnX2oT2qCRkRjiCmj05+EJWQzDvaN/4yH2yCTUZACT8TiBlxLAiwc
 dB6UZO0iOJQb2329Wh77Zr7ZDUL1No3j5TCeH/WgpvkuV6o4R+bdk9NkZQwqtZuqntMU
 +AvVYG2MV2wrWPzPGf/0PyWtxPEe5kFaz2qidJZbm6a32t/9c+7XVuw8ZiZX9joptjgK
 7Uzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=z2jMHv74
Subject: Re: [Buildroot] [PATCH v7 4/4] package/go: use host compiler when
 go-bootstrap unsupported
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1608701163706589427=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1608701163706589427==
Content-Type: multipart/alternative; boundary="000000000000d5812806011f0167"

--000000000000d5812806011f0167
Content-Type: text/plain; charset="UTF-8"

Thomas,



On Sat, Jul 22, 2023, 3:28 PM Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Christian,
>
> On Sat, 22 Jul 2023 15:01:05 -0700
> Christian Stewart <christian@aperture.us> wrote:
>
> > The main difference is the Go compiler takes only a minute or so of build
> > time. Bootstrapping it is fast and produces reproducible results across
> any
> > of the architectures Buildroot supports, including those for which there
> > currently are not any binary Go releases.
> >
> > Therefore I submit that it is always worth the extra build time to
> > bootstrap the Go compiler from source as part of the build as opposed to
> > using a precompiled binary. Also it is less maintenance overhead
> (updating
> > hashes for all the platforms) and as the one maintaining this process I
> > appreciate that.
> >
> > Today we download an external toolchain but still depend on a gcc package
> > to be installed on the host as well. Depending on the host Go to be
> > installed or otherwise provided for the bootstrap process is a decent
> > approach for architectures that we can't bootstrap with the C compiler
> > alone.
> >
> > I can see a way we could add an option to do the binary downloads but
> would
> > prefer to keep the logic to depend on the host compiler as a fallback to
> > use for bootstrapping as well.
> >
> > This is fine for legal-info as the bootstrap process builds the compiler
> > with itself several times to ensure that only the version built from
> source
> > is used.
>
> Thanks for your feedback. What I meant by "legal-info" probably was
> misunderstood. I very commonly run "make <foo>-legal-info" after
> merging a version bump of a package. For 99% of our packages, this is a
> trivial operation: it downloads the new tarball, extracts it, and
> checks the hashes. For golang-package, it is a non-trivial operation as
> it requires building go-bootstrap-stage1, go-bootstrap-stage2 and go,
> before the package can be downloaded and vendored using "go".
>

Okay, I understand your use case.

What if we do the following:

 1. Merge this patch which enables using the host Go compiler on
architectures that aren't supported by host go bootstrap.
 2. Author and merge another series which adds the binary version of
host-go, still falling back on #1 when neither the bootstrap nor the binary
download (external toolchain) is supported.

I am willing to work on #2 as well.

Best,
Christian

--000000000000d5812806011f0167
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thomas,<div dir=3D"auto"><br></div><br><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 22, 202=
3, 3:28 PM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.=
com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hello Christian,<br>
<br>
On Sat, 22 Jul 2023 15:01:05 -0700<br>
Christian Stewart &lt;<a href=3D"mailto:christian@aperture.us" target=3D"_b=
lank" rel=3D"noreferrer">christian@aperture.us</a>&gt; wrote:<br>
<br>
&gt; The main difference is the Go compiler takes only a minute or so of bu=
ild<br>
&gt; time. Bootstrapping it is fast and produces reproducible results acros=
s any<br>
&gt; of the architectures Buildroot supports, including those for which the=
re<br>
&gt; currently are not any binary Go releases.<br>
&gt; <br>
&gt; Therefore I submit that it is always worth the extra build time to<br>
&gt; bootstrap the Go compiler from source as part of the build as opposed =
to<br>
&gt; using a precompiled binary. Also it is less maintenance overhead (upda=
ting<br>
&gt; hashes for all the platforms) and as the one maintaining this process =
I<br>
&gt; appreciate that.<br>
&gt; <br>
&gt; Today we download an external toolchain but still depend on a gcc pack=
age<br>
&gt; to be installed on the host as well. Depending on the host Go to be<br=
>
&gt; installed or otherwise provided for the bootstrap process is a decent<=
br>
&gt; approach for architectures that we can&#39;t bootstrap with the C comp=
iler<br>
&gt; alone.<br>
&gt; <br>
&gt; I can see a way we could add an option to do the binary downloads but =
would<br>
&gt; prefer to keep the logic to depend on the host compiler as a fallback =
to<br>
&gt; use for bootstrapping as well.<br>
&gt; <br>
&gt; This is fine for legal-info as the bootstrap process builds the compil=
er<br>
&gt; with itself several times to ensure that only the version built from s=
ource<br>
&gt; is used.<br>
<br>
Thanks for your feedback. What I meant by &quot;legal-info&quot; probably w=
as<br>
misunderstood. I very commonly run &quot;make &lt;foo&gt;-legal-info&quot; =
after<br>
merging a version bump of a package. For 99% of our packages, this is a<br>
trivial operation: it downloads the new tarball, extracts it, and<br>
checks the hashes. For golang-package, it is a non-trivial operation as<br>
it requires building go-bootstrap-stage1, go-bootstrap-stage2 and go,<br>
before the package can be downloaded and vendored using &quot;go&quot;.<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Okay=
, I understand your use case.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">What if we do the following:</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">=C2=A01. Merge this patch which enables using the host Go compil=
er on architectures that aren&#39;t supported by host go bootstrap.</div><d=
iv dir=3D"auto">=C2=A02. Author and merge another series which adds the bin=
ary version of host-go, still falling back on #1 when neither the bootstrap=
 nor the binary download (external toolchain) is supported.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I am willing to work on #2 as well.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Best,</div><div dir=3D"au=
to">Christian</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div>=
</div>

--000000000000d5812806011f0167--

--===============1608701163706589427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1608701163706589427==--
