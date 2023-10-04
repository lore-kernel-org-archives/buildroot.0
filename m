Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A92E7B5E5
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 10:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 191278132A;
	Wed,  4 Oct 2023 10:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 191278132A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FAp7l9az_PtG; Wed,  4 Oct 2023 10:04:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B83780E95;
	Wed,  4 Oct 2023 10:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B83780E95
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1E4E1BF860
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 10:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B1CE80E7A
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 10:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B1CE80E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SrkJvbVId9OJ for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 10:04:51 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECC5C80E76
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 10:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECC5C80E76
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-533edb5ac54so3194555a12.0
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 03:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696413889; x=1697018689;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GLriaWMtb7tPe5PrAis1tkVEjeJy74W0RwiTpKAOO+k=;
 b=V4MK4Fhnt0S8UYFa6lMtafQQ/5JpTOZ+L69uFrS4vKQE6h7EYpvzXd2GUGrOBlyF3E
 qZxhuINNsHgff8doLHpzre6ZOjPB5NU54MNq2qmaP5968/6AJP7+UN8AzB5bGcuGineh
 DuD54dnmMOIQNLG/hKrNLvLvHyfmuox7JrlHtRzsYgPG2a0QWb6ERTHV7sHW+RYbePX7
 KnWgAzd+AwoBpQuLvxqrTmzqiBwzl6PEl8v+DaeNi4wZ9WWbfzO+VSFIe+CQ3Bc4B01Q
 eSiWJ1t27WbunGZ94vMuLvDEuQQ6TLHHV9UML2gqS12MRhXB9RojpDM2rRF7ODgukb4c
 8Ilg==
X-Gm-Message-State: AOJu0YzcETcEhJKdAlVfHkjq2Hv16fpq0L/OJ5Nc84/HogQ6AtNjficZ
 aDIZMO1TjNTuhf/Zyl3g3cxJDmR4W6oH//a+cqM=
X-Google-Smtp-Source: AGHT+IF7VgTsmAz2yHLBDaOnrHwRnpH2a5cqf6p7yIBtUJztKg9FAUGAB+QzNKdiEofTESozva3Fug==
X-Received: by 2002:a17:906:74dd:b0:9ae:5a9f:6aa0 with SMTP id
 z29-20020a17090674dd00b009ae5a9f6aa0mr1678771ejl.33.1696413888876; 
 Wed, 04 Oct 2023 03:04:48 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 z25-20020a1709067e5900b0099bccb03eadsm2489779ejr.205.2023.10.04.03.04.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 03:04:47 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-9ad8bf9bfabso361601966b.3
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 03:04:47 -0700 (PDT)
X-Received: by 2002:a17:906:104e:b0:99c:47a:8bcd with SMTP id
 j14-20020a170906104e00b0099c047a8bcdmr1539937ejj.67.1696413886721; Wed, 04
 Oct 2023 03:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230727232235.449788-1-christian@aperture.us>
 <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
 <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
 <08DC739C-F115-4DB2-9F9A-0CD6E9BFEA42@agner.ch>
 <CA+h8R2rbhvCt60Fhwi1qGv0PocZsS0rA3fVQoukDP2KhPrkjdQ@mail.gmail.com>
 <23f2b3bd59cb6d860ea52b566eacfdb8@agner.ch>
 <CA+h8R2o9eAVZBrzU1E8wbh_eoQfhWv+0JsH11_N4hrkPKqKCXg@mail.gmail.com>
 <eb94fb2be140a706ce4797df9cb56d63@agner.ch> <87r0mgay0o.fsf@48ers.dk>
 <CA+h8R2p24q9AZRvkwacX3oOzuS2T7ZAENm7yNKj70Rfe0xuF0Q@mail.gmail.com>
 <c614a21b7b4b92432b86c44985840266@agner.ch>
In-Reply-To: <c614a21b7b4b92432b86c44985840266@agner.ch>
Date: Wed, 4 Oct 2023 03:04:35 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oDvy4+8=BWcWCbVPe4+50dKsrS28EnuXEUh734Kn3m6w@mail.gmail.com>
Message-ID: <CA+h8R2oDvy4+8=BWcWCbVPe4+50dKsrS28EnuXEUh734Kn3m6w@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1696413889; x=1697018689; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GLriaWMtb7tPe5PrAis1tkVEjeJy74W0RwiTpKAOO+k=;
 b=iOTSPrW1GOjulS3uvOio5Ta1hXAOLGeR69sYg2N+1MVXfOspgXhw6LYYEqhzvsek2F
 z+21DKPms8paNEedVM+Tz30MjPX0zLrysYw7dkyEEaQTLN1xtRxG41o+rLtAxj9UZ+ft
 5ZDADr/Mo2KqV+7T53eVD4drxPm7iB1tjxHbSF5/lkbNo9uSgdsg8lJDL8y/gf9sWybk
 k+FPdq7blGCedVpTkPCJln9feumm0MAw729CLWqMt6/BbNUrljH3mOhKWGJeiV++dhBo
 4O2zp+58/viUALXFIdyhITith38Wj5RRML5iXMgrwMgzmRBWhgcNLfL5BB8PkrBFWvZU
 gzrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=iOTSPrW1
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6354147618495198685=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6354147618495198685==
Content-Type: multipart/alternative; boundary="0000000000001c8d8d0606e1235b"

--0000000000001c8d8d0606e1235b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Stefan,

On Wed, Oct 4, 2023, 2:59 AM Stefan Agner <stefan@agner.ch> wrote:

> On 2023-10-02 20:28, Christian Stewart wrote:
> > Hi Peter,
> >
> >
> https://github.com/containerd/containerd/issues/9139#issuecomment-1736477=
534
> >
> > On Sat, Sep 30, 2023 at 1:03=E2=80=AFAM Peter Korsgaard <peter@korsgaar=
d.com>
> wrote:
> >> If cri is only needed for when containerd is used with kubernetes, the=
n
> >> perhaps we should disable it by default so other people don't need to
> >> debug the same issue.
> >
> > I think we can safely disable cri on the default config.
>
> At that point we can also pass the no_cri build tag.
>
> I'll create a PR to do just that.
>

Maybe make it a adjustable config option, since I definitely want to use
kubernetes + cri w/ containerd in buildroot.

Best,
Christian

--0000000000001c8d8d0606e1235b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Stefan,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Oct 4, 2023, 2:59 AM Stefan Agner &lt=
;<a href=3D"mailto:stefan@agner.ch">stefan@agner.ch</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On 2023-10-02 20:28, Christian Stewart wrot=
e:<br>
&gt; Hi Peter,<br>
&gt; <br>
&gt; <a href=3D"https://github.com/containerd/containerd/issues/9139#issuec=
omment-1736477534" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
github.com/containerd/containerd/issues/9139#issuecomment-1736477534</a><br=
>
&gt; <br>
&gt; On Sat, Sep 30, 2023 at 1:03=E2=80=AFAM Peter Korsgaard &lt;<a href=3D=
"mailto:peter@korsgaard.com" target=3D"_blank" rel=3D"noreferrer">peter@kor=
sgaard.com</a>&gt; wrote:<br>
&gt;&gt; If cri is only needed for when containerd is used with kubernetes,=
 then<br>
&gt;&gt; perhaps we should disable it by default so other people don&#39;t =
need to<br>
&gt;&gt; debug the same issue.<br>
&gt; <br>
&gt; I think we can safely disable cri on the default config.<br>
<br>
At that point we can also pass the no_cri build tag.<br>
<br>
I&#39;ll create a PR to do just that.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Maybe make it a adjustable config opt=
ion, since I definitely want to use kubernetes + cri w/ containerd in build=
root.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best,</div><div di=
r=3D"auto">Christian</div></div>

--0000000000001c8d8d0606e1235b--

--===============6354147618495198685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6354147618495198685==--
