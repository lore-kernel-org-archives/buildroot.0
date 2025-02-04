Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F4EC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 13:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2110360FE6;
	Tue,  4 Feb 2025 13:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MqgF0ozyGNZ; Tue,  4 Feb 2025 13:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC20060FE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC20060FE7;
	Tue,  4 Feb 2025 13:34:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D815912F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC76082A5D
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAg_0PnyOiPq for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 13:34:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E18A82A2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E18A82A2D
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E18A82A2D
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:34:53 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa67773ffd4so76532166b.2
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 05:34:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738676092; x=1739280892;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zXIZK8dY+WE+02MqdJc96JbdW/4zakMjIG5s4MFf/ho=;
 b=LYFktUQZZIteNWm+05gJll/SguC9MTCUEAXzbOtVBfE0UNGe7Jq6OJvSrw6uVbu0oO
 6bsE0yzvNVCecP+KXbt8+kl0Nc4Uva9uL9DEgvtKjbADu/eY3BBSgul6pW6PsmERFCUp
 BcWCMobvwXBRS3gr3WnZuD/+wRrw5RXXZu15+ISDcMjwLM4HQRdcOIwr9u7FAzYGB8FE
 HmAFGn/myHGzrFPyGeTJEAtc0QIxgJFaJMjHDntJ3cghOpiQjVomHiVZT3mp5vpkpD//
 Gfntsn8xUq1jxu18rXfCZ+0fUlwBDXtS4h3cw5cf59pQSCw42zftwWmy36BSGh/Oex34
 Lc2Q==
X-Gm-Message-State: AOJu0YypCbUpTFvNPB9QfcUD5iV8PA7vYpb9n3pdsPAk2eX1AIukhbGf
 GY5zxQE5KiVjkFFttI+vqUScA0t13VOvbgBlWya63iL4VoViP6X4knf9qoXe1Xc0vIO6UWEOFIG
 ZYWuHU8mDTtH2DSxjKJK4XjSIumtde6Y8ooXC/+ImvioANXHU
X-Gm-Gg: ASbGncu1hZ37k8n8kHR35zByHIgjdl1Lp4ElOjz/Zyj3TmX4ej/Z//vD3QOBYHJycS7
 MhqSCbmq++GclT0PPfUeqkJYqzdAUBPJt25I2QHRpxRZYAw/XrYVV4qArAYMnD2zra9+v26rYcH
 /3IKwU7kGK7hDVGxn1FvCZnIyEm43H3BE=
X-Google-Smtp-Source: AGHT+IEkI3bMl2hC7vnbEariLKRcKyAGeghme36WVfHlHogyBpdqMhBmS7455AV2cI6wEofgAVqK2ZnVgChZFAhL4FE=
X-Received: by 2002:a17:907:7faa:b0:aa6:9407:34e4 with SMTP id
 a640c23a62f3a-ab747bf4cf8mr124866866b.12.1738676090874; Tue, 04 Feb 2025
 05:34:50 -0800 (PST)
MIME-Version: 1.0
References: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
 <287b51b1-5c1a-4048-99e5-42a53cd949cc@mind.be>
 <513ab9a4-3fc9-47cd-9387-5d8b66895127@mind.be>
In-Reply-To: <513ab9a4-3fc9-47cd-9387-5d8b66895127@mind.be>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 4 Feb 2025 14:34:40 +0100
X-Gm-Features: AWEUYZkPv-efVGvKcNIjb2xhqRTIdEo4nDuG_PFP3EYDxQhCdR0dbWbs5kwV9aE
Message-ID: <CAHDQB6PT63vOuzXCr83=rhJM_Pz0=oP2CKjGUuw0272zvofcVA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1738676092; x=1739280892;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zXIZK8dY+WE+02MqdJc96JbdW/4zakMjIG5s4MFf/ho=;
 b=RQIWQ5iBHZfOytectGhNZ8esYjjpxaAsDGmKuTgns5DnFxgVVDZsCmBVBfVa2ONNtc
 Z06xsuiDEI9b6dRRh9I8ePfH5TIArH4pLUM/FwSB52loX8OyCOjkhvVolGnZVjaLc3DB
 GLC7GrlAqusnY1p+Cn1iORZ7a7yqS1wgFy39g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RQIWQ5iB
Subject: Re: [Buildroot] [PATCH 0/6] mender cleanup and intermittent update
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0247484829263825395=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0247484829263825395==
Content-Type: multipart/alternative; boundary="000000000000c6cb09062d5112de"

--000000000000c6cb09062d5112de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would suggest applying the 3.5.3 bump to make the transition to 4.x or
5.x easier. But it's up to you.




On Tue, Feb 4, 2025 at 2:17=E2=80=AFPM Arnout Vandecappelle <arnout@mind.be=
> wrote:

>
> On 04/02/2025 14:02, Arnout Vandecappelle wrote:
> >
> >
> > On 14/10/2024 12:21, Adam Duskett wrote:
> >> Instead of updating mender directly to 4.x, which is far too large
> >> of a change, update it to 3.5.3 which is the last of the GO version.
> >>
> >> This not only provides security and bug fixes, but it makes the
> >> transition to 4.x when someone picks that up much easier. This is base=
d
> >> off of previous work found here:
> >>
> >>
> https://patchwork.ozlabs.org/project/buildroot/patch/20231219172446.49840=
9-6-adam.duskett@amarulasolutions.com/
> >>
> >>
> >> With the addition of more tests, cleaning up documentation, and adding
> some
> >> information in the migrating.adoc file.
> >>
> >> Adam Duskett (6):
> >>    board/mender/x86_64/post-image-efi.sh: re-arrange write rootfs-imag=
e
> >>      args
> >>    package/mender: remove /var/lib/mender symlinking
> >>    support/testing/tests/package/test_mender.py: Add RO fs test
> >>    support/testing/tests/package/test_mender.py: Add a systemd test
> >>    package/mender/readme.txt: update readme
> >
> >  Patches 1-5 applied to master, thanks. There was a flake8 error in one
> of the
> > patches, but otherwise it looked great!
> >
> >  Thanks for continuing to work on mender integration in Buildroot! And
> as
> > usual, sorry that it takes so long before things get applied.
> >
> >>    package/mender: bump version to 3.5.3
> >
> >  I haven't applied this one because you have sent the bump to 4.0.0.
>
>
>   Oops, I got confused between mender and mender-artifact. I'll apply thi=
s
> one
> as well.
>
>
>   Regards,
>   Arnout
>
>
> >
> >  Regards,
> >  Arnout
> >
> >>
> >>   board/mender/x86_64/post-build.sh             | 12 +---
> >>   board/mender/x86_64/post-image-efi.sh         | 25 +++++++-
> >>   docs/manual/migrating.adoc                    | 15 +++++
> >>   package/mender/S42mender                      | 16 -----
> >>   package/mender/artifact_info                  |  1 -
> >>   package/mender/mender-client.service          | 11 ----
> >>   package/mender/mender.conf                    |  1 +
> >>   package/mender/mender.hash                    | 10 +--
> >>   package/mender/mender.mk                      | 10 ++-
> >>   package/mender/readme.txt                     | 60 ++++++-----------
> >>   support/testing/tests/package/test_mender.py  | 64 +++++++++++++++--=
--
> >>   .../tests/package/test_mender/post-build.sh   | 25 ++++++++
> >>   12 files changed, 148 insertions(+), 102 deletions(-)
> >>   delete mode 100644 package/mender/artifact_info
> >>   create mode 100755
> support/testing/tests/package/test_mender/post-build.sh
> >>
> >
>

--000000000000c6cb09062d5112de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I would suggest applying the 3.5.3 bump to make the t=
ransition to 4.x or 5.x easier. But it&#39;s up to you.</div><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><span><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;ma=
rgin-top:0pt;margin-bottom:0pt"><br></p></span></div></div></div><br></div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Feb 4, 2025 at 2:17=E2=80=AFPM Arnout Vandecappelle=
 &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 04/02/2025 14:02, Arnout Vandecappelle wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 14/10/2024 12:21, Adam Duskett wrote:<br>
&gt;&gt; Instead of updating mender directly to 4.x, which is far too large=
<br>
&gt;&gt; of a change, update it to 3.5.3 which is the last of the GO versio=
n.<br>
&gt;&gt;<br>
&gt;&gt; This not only provides security and bug fixes, but it makes the<br=
>
&gt;&gt; transition to 4.x when someone picks that up much easier. This is =
based<br>
&gt;&gt; off of previous work found here:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20=
231219172446.498409-6-adam.duskett@amarulasolutions.com/" rel=3D"noreferrer=
" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/patch/20=
231219172446.498409-6-adam.duskett@amarulasolutions.com/</a> <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; With the addition of more tests, cleaning up documentation, and ad=
ding some<br>
&gt;&gt; information in the migrating.adoc file.<br>
&gt;&gt;<br>
&gt;&gt; Adam Duskett (6):<br>
&gt;&gt; =C2=A0=C2=A0 board/mender/x86_64/post-image-efi.sh: re-arrange wri=
te rootfs-image<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 args<br>
&gt;&gt; =C2=A0=C2=A0 package/mender: remove /var/lib/mender symlinking<br>
&gt;&gt; =C2=A0=C2=A0 support/testing/tests/package/test_mender.py: Add RO =
fs test<br>
&gt;&gt; =C2=A0=C2=A0 support/testing/tests/package/test_mender.py: Add a s=
ystemd test<br>
&gt;&gt; =C2=A0=C2=A0 package/mender/readme.txt: update readme<br>
&gt;<br>
&gt; =C2=A0Patches 1-5 applied to master, thanks. There was a flake8 error =
in one of the <br>
&gt; patches, but otherwise it looked great!<br>
&gt;<br>
&gt; =C2=A0Thanks for continuing to work on mender integration in Buildroot=
! And as <br>
&gt; usual, sorry that it takes so long before things get applied.<br>
&gt;<br>
&gt;&gt; =C2=A0=C2=A0 package/mender: bump version to 3.5.3<br>
&gt;<br>
&gt; =C2=A0I haven&#39;t applied this one because you have sent the bump to=
 4.0.0.<br>
<br>
<br>
=C2=A0=C2=A0Oops, I got confused between mender and mender-artifact. I&#39;=
ll apply this one <br>
as well.<br>
<br>
<br>
=C2=A0=C2=A0Regards,<br>
=C2=A0=C2=A0Arnout<br>
<br>
<br>
&gt;<br>
&gt; =C2=A0Regards,<br>
&gt; =C2=A0Arnout<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 board/mender/x86_64/post-build.sh=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +---<br>
&gt;&gt; =C2=A0 board/mender/x86_64/post-image-efi.sh=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 25 +++++++-<br>
&gt;&gt; =C2=A0 docs/manual/migrating.adoc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 15 +++++<br>
&gt;&gt; =C2=A0 package/mender/S42mender=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 16 -----<br>
&gt;&gt; =C2=A0 package/mender/artifact_info=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 -<br>
&gt;&gt; =C2=A0 package/mender/mender-client.service=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ----<br>
&gt;&gt; =C2=A0 package/mender/mender.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +<br>
&gt;&gt; =C2=A0 package/mender/mender.hash=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 10 +--<br>
&gt;&gt; =C2=A0 package/mender/<a href=3D"http://mender.mk" rel=3D"noreferr=
er" target=3D"_blank">mender.mk</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 10 ++-<br>
&gt;&gt; =C2=A0 package/mender/readme.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 60 ++++++-----------<br>
&gt;&gt; =C2=A0 support/testing/tests/package/test_mender.py=C2=A0 | 64 +++=
++++++++++++----<br>
&gt;&gt; =C2=A0 .../tests/package/test_mender/post-build.sh=C2=A0=C2=A0 | 2=
5 ++++++++<br>
&gt;&gt; =C2=A0 12 files changed, 148 insertions(+), 102 deletions(-)<br>
&gt;&gt; =C2=A0 delete mode 100644 package/mender/artifact_info<br>
&gt;&gt; =C2=A0 create mode 100755 support/testing/tests/package/test_mende=
r/post-build.sh<br>
&gt;&gt;<br>
&gt;<br>
</blockquote></div>

--000000000000c6cb09062d5112de--

--===============0247484829263825395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0247484829263825395==--
