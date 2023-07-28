Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB61AC0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 13:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 192E44212A;
	Fri, 28 Jul 2023 13:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 192E44212A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kAD-20GHMIVa; Fri, 28 Jul 2023 13:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D291A4212B;
	Fri, 28 Jul 2023 13:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D291A4212B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95BAE1BF2C4
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 13:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E7B561485
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 13:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E7B561485
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnzRXBab7Dwl for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 13:36:17 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88FDB61484
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 13:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88FDB61484
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51e619bcbf9so2759175a12.3
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 06:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690551374; x=1691156174;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qmeMbSch3094g3bfVGDM6402pRig7ojlXL6BYBgM6Dw=;
 b=TdRoDKbovxVsiIn/INlMqaNG1ofPMoDHDc+R5uyvq/vlr/+XkxQ4RkeQp3iT6XzZls
 Lm9Db5a7qru9o/iFs/NdJgj+Dc1vTh2pb+0Y6J6yMipIOOjRCKftTVnm5d9YXOij5L++
 ka1os3wFn5ZWFW1yA5IlRJPzHZgbUfhLVc7ZMEHMXKWw3GHRPpPL2JRxELUQptvdVr7X
 NwprdGk+0hkAYiixW7QiDC7kAvkcNtxCDKW7usgz7mDKBwKLxwvz3XH5igL/tY0SAThU
 XAZp5E7SVRkLPV+7fV6Qrzpr/75eK0ApngoCc6Wx4xhVzf6s2yoEtratLvkrwo7ojCPc
 EhxA==
X-Gm-Message-State: ABy/qLaVwXs4z3No79ItAZ+qsRglWj+LuirZUCn4mW8B/h0JWS7+pTxV
 NuS72GJctvUNRiEGVGIUv6JE65cOKYrnAtVEDkkeP22mWEk=
X-Google-Smtp-Source: APBJJlEUxobNz57a2FzLz+E+ZSbMibSeDWghb2fBiSeCpR5kZh1sbOBl+/VbIjn6DNM2ekFDzf8uqg==
X-Received: by 2002:a05:6402:3d6:b0:522:4231:e228 with SMTP id
 t22-20020a05640203d600b005224231e228mr1968702edw.35.1690551374080; 
 Fri, 28 Jul 2023 06:36:14 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 s11-20020aa7c54b000000b0051df54c6a27sm1821086edr.56.2023.07.28.06.36.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:36:13 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so292858166b.2
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 06:36:12 -0700 (PDT)
X-Received: by 2002:a17:906:4d:b0:994:4be4:a106 with SMTP id
 13-20020a170906004d00b009944be4a106mr2188055ejg.10.1690551372364; Fri, 28 Jul
 2023 06:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230721213121.178783-1-romain.naour@gmail.com>
 <20230722232630.1c759813@windsurf>
 <CA+h8R2qhnFzK8WQOVQNi=etMhKyg=hFhyBcRHPu7NYg5S=kjWA@mail.gmail.com>
 <dbadbf67-797f-ad6f-d519-35567417a291@smile.fr>
 <CA+h8R2oZ=oEr8hrJbHqw1K6AnBb__w1u6PGPmDUSONVb0Q0f6g@mail.gmail.com>
 <CA+h8R2p0VrrNpSA=sMqs5C8bpe41L9sOfo_5z6E8X9z6T_m9-w@mail.gmail.com>
 <CA+h8R2qm2i94fcggkXvScyv9unAWa6S6pF8TwYWTQLPt=r9eDw@mail.gmail.com>
 <080e239b-113e-09e8-aef1-0fb39cc70bd1@smile.fr>
In-Reply-To: <080e239b-113e-09e8-aef1-0fb39cc70bd1@smile.fr>
Date: Fri, 28 Jul 2023 06:36:02 -0700
X-Gmail-Original-Message-ID: <CA+h8R2o-p-F+tzUc3wjsN3t=fpyPsaiR+fSQHYyqQAeK2Nj38A@mail.gmail.com>
Message-ID: <CA+h8R2o-p-F+tzUc3wjsN3t=fpyPsaiR+fSQHYyqQAeK2Nj38A@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690551374; x=1691156174;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qmeMbSch3094g3bfVGDM6402pRig7ojlXL6BYBgM6Dw=;
 b=qw4dRe7rLFhHhb6mLzhcMmqbT9QIP1czt9Kq+Kpb13sKATgHBWAyZwErqSaDYkB2ve
 rWABV5ACSTSNstMUGM5DsvQOFe3/6vKf6tUPv4/R0GQDdpudSIZaeGW9Qb1AmUCOe/9e
 jeokDlpcT0tcl8/DQm3zR8cGe7oDd9JBkhnhvLa334UsT758sQXRUHEF6ip9GKw4ZiVz
 R3KZNgCXM0JAk/xXaCl6bdggObgYY2/rujvbVdTJgPGZgOFq+FAz5YHhXYKc0H41bAEw
 FBkeMBwKs6a52KvaV2m66rV9gfwsCTkY5/FFbemlhP176UCKzJ8Ibsa/JnSW6HyouUdM
 WdnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=qw4dRe7r
Subject: Re: [Buildroot] [PATCH] package/util-linux: bump version to 2.39.1
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4828873094691614899=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4828873094691614899==
Content-Type: multipart/alternative; boundary="0000000000000643be06018c2a55"

--0000000000000643be06018c2a55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Romain,

On Fri, Jul 28, 2023, 1:37 AM Romain Naour <romain.naour@smile.fr> wrote:

> Hello Christian,
>
> Le 28/07/2023 =C3=A0 06:24, Christian Stewart a =C3=A9crit :
> > Romain,
> >
> > On Thu, Jul 27, 2023 at 2:33=E2=80=AFPM Christian Stewart <christian@ap=
erture.us>
> wrote:
> >> On Thu, Jul 27, 2023 at 2:20=E2=80=AFPM Christian Stewart <
> christian@aperture.us> wrote:
> >>> On Thu, Jul 27, 2023 at 1:47=E2=80=AFPM Romain Naour <romain.naour@sm=
ile.fr>
> wrote:
> >>>> It seems the go bootstrap doesn't work even after Go 1.20.x merge,
> >>>> see [1]
> >
> >>> Will check into why this CI job failed right away.
> >
> >>>
> >>>>>>> host-go 1.20.6 Building
> >>>> ...
> >>>> Building Go toolchain1 using
> [...]test-output/TestMender/host/lib/go-1.19.10.
> >>>> error obtaining VCS status: exit status 128
> >>>>         Use -buildvcs=3Dfalse to disable VCS stamping.
> >>>>
> >>>> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186525
> >
> > It took me a long time to find a reproduction for this issue,
>
> Maybe just run utils/docker-run with support/testing/run-tests to
> reproduce the
> issue with the same environment as the gitlab-ci job ?
>

It doesn't reproduce reliably that way. With a fresh buildroot checkout,
the bug did not occur. Only happens if there's something wrong in .git.

However I did reproduce it by removing the git dir mount, which is how
undiscovered finally that the bug is specifically when go-bootstrap lib has
a broken .git in a parent directory.

Best,
Christian

--0000000000000643be06018c2a55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Romain,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Jul 28, 2023, 1:37 AM Romain Naour &=
lt;<a href=3D"mailto:romain.naour@smile.fr">romain.naour@smile.fr</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Hello Christian,<br>
<br>
Le 28/07/2023 =C3=A0 06:24, Christian Stewart a =C3=A9crit=C2=A0:<br>
&gt; Romain,<br>
&gt; <br>
&gt; On Thu, Jul 27, 2023 at 2:33=E2=80=AFPM Christian Stewart &lt;<a href=
=3D"mailto:christian@aperture.us" target=3D"_blank" rel=3D"noreferrer">chri=
stian@aperture.us</a>&gt; wrote:<br>
&gt;&gt; On Thu, Jul 27, 2023 at 2:20=E2=80=AFPM Christian Stewart &lt;<a h=
ref=3D"mailto:christian@aperture.us" target=3D"_blank" rel=3D"noreferrer">c=
hristian@aperture.us</a>&gt; wrote:<br>
&gt;&gt;&gt; On Thu, Jul 27, 2023 at 1:47=E2=80=AFPM Romain Naour &lt;<a hr=
ef=3D"mailto:romain.naour@smile.fr" target=3D"_blank" rel=3D"noreferrer">ro=
main.naour@smile.fr</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; It seems the go bootstrap doesn&#39;t work even after Go 1=
.20.x merge,<br>
&gt;&gt;&gt;&gt; see [1]<br>
&gt; <br>
&gt;&gt;&gt; Will check into why this CI job failed right away.<br>
&gt; <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; host-go 1.20.6 Building<br>
&gt;&gt;&gt;&gt; ...<br>
&gt;&gt;&gt;&gt; Building Go toolchain1 using [...]test-output/TestMender/h=
ost/lib/go-1.19.10.<br>
&gt;&gt;&gt;&gt; error obtaining VCS status: exit status 128<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Use -buildvcs=3Dfalse to =
disable VCS stamping.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; [1] <a href=3D"https://gitlab.com/buildroot.org/buildroot/=
-/jobs/4725186525" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
gitlab.com/buildroot.org/buildroot/-/jobs/4725186525</a><br>
&gt; <br>
&gt; It took me a long time to find a reproduction for this issue,<br>
<br>
Maybe just run utils/docker-run with support/testing/run-tests to reproduce=
 the<br>
issue with the same environment as the gitlab-ci job ?<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">It doesn&#39;t reprod=
uce reliably that way. With a fresh buildroot checkout, the bug did not occ=
ur. Only happens if there&#39;s something wrong in .git.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">However I did reproduce it by removing the=
 git dir mount, which is how undiscovered finally that the bug is specifica=
lly when go-bootstrap lib has a broken .git in a parent directory.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Best,</div><div dir=3D"auto">Chr=
istian</div></div>

--0000000000000643be06018c2a55--

--===============4828873094691614899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4828873094691614899==--
