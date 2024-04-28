Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC80C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 19:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A4F81F64;
	Sun, 28 Apr 2024 19:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sS2ttpY3VLNK; Sun, 28 Apr 2024 19:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B5F81F66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29B5F81F66;
	Sun, 28 Apr 2024 19:18:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1252C1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC59A60035
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XabhnaXGHfHN for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 19:18:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0748360596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0748360596
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0748360596
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 19:18:31 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so4645985e87.1
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 12:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714331909; x=1714936709;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eUodhkEVBZjtmM98SVLT/5IES+xo6gJuGe5JyEgJ8Eg=;
 b=cxpajRHPGJKDQijaQzpPs3C7oW7nHhpvGwshSm7OQ6Omj+FvGrYomm9Ld4/NH+EzU0
 h3YsDNfXnWbA8h6RvpevWu4k1r8YuIIJ1Ps87xIZyKIgAieDkm0eewYuOp03/On3YDsE
 zMt76qtZobjyoSF3yQkEWHoNlU2pRt5/l4SN+TjuiXcciIkH7wTeYCzMhhRALo8rdRFj
 ORZYLyWRyVsVG3zTDUgRNROMDkqTuGCD6KnG1NUIinKksZaNIcq+w8lCmrzDOK/iu/yU
 GfuijQkOcbqaSdHBtJAfAALA/B9ZmZm3eWqWdilldxJ8wLNTF5JJHhnpyKNECbCalg9Q
 tebw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCJbdR6pmO67NFQy3u95LDnwYmgl8Vjn0buL46QBxXTkS1nFBf6fFcWk3JLduijL4u5G050igDP5tge9O1uDCXfvJ0/XNXzQ==
X-Gm-Message-State: AOJu0YyKZpbipvPNv3juaJ6suAbA4lo8VPOCs62jt+km4T67lYAc8PH0
 Gx+tPA9ok83Trjl00FUd2vAWfWssBomxpiJrnvKTTS7xmTHhRduLvMU8tF7i/Kt+7fM9ILPVDlv
 bXT0=
X-Google-Smtp-Source: AGHT+IGWYiNIVQFiMlwdn7T+wqk+R7hwghloVaeq5KMBOTyhjOFj9hnS1xpz16X7lQ97guRGeM8V7w==
X-Received: by 2002:a19:2d15:0:b0:51b:43d4:2f18 with SMTP id
 k21-20020a192d15000000b0051b43d42f18mr3481553lfj.46.1714331909060; 
 Sun, 28 Apr 2024 12:18:29 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 g21-20020a0565123b9500b0051b90a23899sm2062583lfv.136.2024.04.28.12.18.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 12:18:27 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-518f8a69f82so4263056e87.2
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 12:18:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXiyCTycgq09Ch6mczIKK3yTRCOoRr8ihJNft2Fnp21rbwswjCC7OyvpQR28MjJdd1nvYK+7CWK3Iyp7m2L31JW7MXN+XJEXg==
X-Received: by 2002:ac2:5961:0:b0:51a:f3b9:f774 with SMTP id
 h1-20020ac25961000000b0051af3b9f774mr3667189lfp.21.1714331906626; Sun, 28 Apr
 2024 12:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240412132659.1168317-1-thomas.perale@mind.be>
 <20240412132659.1168317-4-thomas.perale@mind.be> <ZhmS9kRYj2AuqBln@landeda>
 <CA+h8R2rLxuogZYE9vuuwOh3-Rif1o=P6go9dAdYE4sjLp=gD=Q@mail.gmail.com>
 <438387dc-303a-4ca0-9da4-df9fdb195027@mind.be>
In-Reply-To: <438387dc-303a-4ca0-9da4-df9fdb195027@mind.be>
Date: Sun, 28 Apr 2024 12:18:16 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pn8SW-H4hbBLJ6Ak=MziSvy34zDV=QK9foU3SH92-eRQ@mail.gmail.com>
Message-ID: <CA+h8R2pn8SW-H4hbBLJ6Ak=MziSvy34zDV=QK9foU3SH92-eRQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1714331909; x=1714936709; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eUodhkEVBZjtmM98SVLT/5IES+xo6gJuGe5JyEgJ8Eg=;
 b=sRorQI1PBPnZdb/c3kQ55sIJJmitvF7MjZaIQzzm9Tyc+6W0mbvxC6g8WJGqSL+Qmx
 EElQxMRnjbv7dABIhecTbM5qWsR6l2axBx0AsXI/djALqbR8R18bPEt/KfnBCivZXjPe
 zZdoX2gIc/hEjPhlqkUAK6rZPG6t5sQ+THM9aZXyOoA3cRAgxH96KolFmyRiaRqDqdSE
 RR/EQjdA8lTqv3KqFDVtOHcQdH25PtbfyOWMdQtH9nPfO0hqd25uGYiA73xdd5A8SrTj
 pDt5dOr3DgPrQQLULcfKZG4X6uJiA+8H/8l0ZDiSmFt4XTKCaFIlH6jYo/RBHyVVWDFn
 g/3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=sRorQI1P
Subject: Re: [Buildroot] [PATCH 3/6] package/go: make host package a virtual
 package
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
Cc: Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: multipart/mixed; boundary="===============6445065972282093559=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6445065972282093559==
Content-Type: multipart/alternative; boundary="00000000000052692906172d00c4"

--00000000000052692906172d00c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yann,

On Sun, Apr 28, 2024, 10:29=E2=80=AFAM Arnout Vandecappelle <arnout@mind.be=
> wrote:

>
>
> On 14/04/2024 08:28, Christian Stewart via buildroot wrote:
> > Hi all,
> >
> > On Fri, Apr 12, 2024 at 1:01=E2=80=AFPM Yann E. MORIN <yann.morin.1998@=
free.fr>
> wrote:
> >> Thanks for this series, it really looks good! :-)
> >
> > I agree that it looks good & having the go-bootstrap below the go/
> > package is nice.
> >
> > Haven't fully reviewed it yet but will try it.
> >
> >> I anyway have a few comments and questions, please see below.
> >>
> >
> >> Not related to this patch, but still relevant to the discussion: it
> >> would be even better if we could also have the possibility that the
> >> stage-3 has the option of being a prebuilt go.
> >
> > Using stage-3 as pre-built and host-go itself as compiled from source
> > using the pre-built toolchain as the bootstrap one is ideal.
> >
> > This is so that we can control which version of Go is used for the
> > build for reproducibility.
> >
> > Otherwise if the major version of Go installed on the host machine is
> > different, it might produce different results, particularly when using
> > cgo.
>
>   The "system" go, i.e. the one installed on the build machine, is never
> used.
> This patch series gives the choice to either *download* the go binary, or
> build
> it from source.
>
>   I don't think we want to have the option to use the system go in
> Buildroot. We
> do have that for things like cmake and gzip, but it's a bit painful to
> maintain.
> We also have it for python3, but only for a very small subset of packages
> (none
> of them Python packages). And since a prebuilt binary of go is anyway
> available
> for almost all platforms supported by Go, there is absolutely no reason
> not to
> just download it to be sure.
>

Using the host go compiler on the system to build host-go is absolutely
viable (I already use it all the time in my fork).

It's better than just downloading a pre-built go for multiple reasons:
namely, when doing a full from-source build, and I almost always prefer
building the compiler myself instead of trusting binaries downloaded over
the internet.

It's not hard to add, I already have a patch on the mailing list for it and
it's 5 lines of changes.

Thanks,
Christian

--00000000000052692906172d00c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Yann,<br><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, Apr 28, 2024, 10:29=E2=80=AFAM Arnout Van=
decappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 14/04/2024 08:28, Christian Stewart via buildroot wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; On Fri, Apr 12, 2024 at 1:01=E2=80=AFPM Yann E. MORIN &lt;<a href=3D"m=
ailto:yann.morin.1998@free.fr" target=3D"_blank" rel=3D"noreferrer">yann.mo=
rin.1998@free.fr</a>&gt; wrote:<br>
&gt;&gt; Thanks for this series, it really looks good! :-)<br>
&gt; <br>
&gt; I agree that it looks good &amp; having the go-bootstrap below the go/=
<br>
&gt; package is nice.<br>
&gt; <br>
&gt; Haven&#39;t fully reviewed it yet but will try it.<br>
&gt; <br>
&gt;&gt; I anyway have a few comments and questions, please see below.<br>
&gt;&gt;<br>
&gt; <br>
&gt;&gt; Not related to this patch, but still relevant to the discussion: i=
t<br>
&gt;&gt; would be even better if we could also have the possibility that th=
e<br>
&gt;&gt; stage-3 has the option of being a prebuilt go.<br>
&gt; <br>
&gt; Using stage-3 as pre-built and host-go itself as compiled from source<=
br>
&gt; using the pre-built toolchain as the bootstrap one is ideal.<br>
&gt; <br>
&gt; This is so that we can control which version of Go is used for the<br>
&gt; build for reproducibility.<br>
&gt; <br>
&gt; Otherwise if the major version of Go installed on the host machine is<=
br>
&gt; different, it might produce different results, particularly when using=
<br>
&gt; cgo.<br>
<br>
=C2=A0 The &quot;system&quot; go, i.e. the one installed on the build machi=
ne, is never used. <br>
This patch series gives the choice to either *download* the go binary, or b=
uild <br>
it from source.<br>
<br>
=C2=A0 I don&#39;t think we want to have the option to use the system go in=
 Buildroot. We <br>
do have that for things like cmake and gzip, but it&#39;s a bit painful to =
maintain. <br>
We also have it for python3, but only for a very small subset of packages (=
none <br>
of them Python packages). And since a prebuilt binary of go is anyway avail=
able <br>
for almost all platforms supported by Go, there is absolutely no reason not=
 to <br>
just download it to be sure.<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Using the host go compiler on the system to bui=
ld host-go is absolutely viable (I already use it all the time in my fork).=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s better t=
han just downloading a pre-built go for multiple reasons: namely, when doin=
g a full from-source build, and I almost always prefer building the compile=
r myself instead of trusting binaries downloaded over the internet.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s not hard to add, I alr=
eady have a patch on the mailing list for it and it&#39;s 5 lines of change=
s.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=
=3D"auto">Christian=C2=A0</div></div>

--00000000000052692906172d00c4--

--===============6445065972282093559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6445065972282093559==--
