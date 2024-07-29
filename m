Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DA6C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 04:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F4DA607C1;
	Mon, 29 Jul 2024 04:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOvOO8khzxFV; Mon, 29 Jul 2024 04:58:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F3B8607C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F3B8607C7;
	Mon, 29 Jul 2024 04:58:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E55691BF30C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 04:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDE074016D
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 04:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osqzOpHwWAhx for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 04:58:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4ED1F400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ED1F400C5
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4ED1F400C5
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 04:58:05 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5b19f9a9d91so145780a12.2
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 21:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722229083; x=1722833883;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YE0pk6g5kg9Jm0YRniiK5bguvHhiy9uFpYpY5I9nfio=;
 b=bjkexZNweyZoZAUASap87IJYAWiqGKxFJ2ANM38DmVHk3m3QjXYjWkS2N0hm1QicWp
 s7q+2l0Fwmof+ReNNMlqxpIKVuVgx7B0ykmjvMaWXeGAaItHVO/4IgSpg+6ElbksO5zW
 jFZ56p5la7GPDiZRBgOB+nfjSwrlyApXlmyoqEFkJTcPndv4HnTY7PSlb7CiKT6i3kD8
 jniwZCZnzUw+ZuW5kQSKajACeXraBKEFtC849Uokex3ZVnwfmn9/B6rksF1ktgnOHg6h
 h/q4VDI4mUpIOcc8VC6BM8svsjRPFWE8Jb5M0+Xzu5Q+IK/TmTglYUPsGFVqPN/DJi0g
 fdYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWCI+hQ+uGkA66WPeG+b1qGuR+9iBLZnFyDx5C698tMt1y65OpdrxJ2GOtOv+EMUJ5o5GhnTkDvdo=@buildroot.org
X-Gm-Message-State: AOJu0YyuerCyGXQuwKPCBRgi4hlAtbt5ilcpdKLrgpkXWrIQkEqpoGaV
 iWJOaEFkZyAN2UskCs856MnCa06in27jka0ldv+sycQ65duIX1hjrEuCPp+6DK4JEfYAC1lr+EV
 IzHnWgwqIgUHD58TxbWaeipI7lps=
X-Google-Smtp-Source: AGHT+IHEJx1dZ/k3QtfXVdGLJjup7UnwVo3Ii+tzVBg56TsT+SibfmsOrBm/9HrzeTs7HwEvOmp9YEXAEM5MSY7oku4=
X-Received: by 2002:a17:907:9802:b0:a7a:9e11:e875 with SMTP id
 a640c23a62f3a-a7ac5b1ce00mr567920766b.6.1722229083202; Sun, 28 Jul 2024
 21:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
 <20240728180047.38c594f2@windsurf>
 <CA+RUeSqWVBsZYMV1S_2eDnLbEJY6E7o4aqDQjd9j=puoSs0cfQ@mail.gmail.com>
 <20240728221140.01aa7ed1@windsurf> <Zqcf31ivOCwqs+01@waldemar-brodkorb.de>
In-Reply-To: <Zqcf31ivOCwqs+01@waldemar-brodkorb.de>
From: Dmitriy Chestnykh <dm.chestnykh@gmail.com>
Date: Mon, 29 Jul 2024 08:00:23 +0300
Message-ID: <CA+RUeSrOu0Jx0DBwFeyfRiXs5ghZFHNJdWs5tyKQBghmgLXnoA@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722229083; x=1722833883; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YE0pk6g5kg9Jm0YRniiK5bguvHhiy9uFpYpY5I9nfio=;
 b=Gfhp0R9SvJT8RxYoAjly25H36ZuGMPwUlCkhT69a4k/8z4tPm2mGvjI9oRtJiaYkD/
 Rd9lZ5rI1GqXVQV5L9cIvnvbEtX3Y8/rHtvh/uut7COJzTPIXvf6RHUogTP+T8gRjXWt
 p0z0E1XIwv+0lZrVYA6zbIz1fuADDLy26Fhco8vBwtFtP+J5svWZ/Z13r2TkrA76YGbZ
 HjvNGdX2mxVZ/49ovfnOOgWWRlMyQj+q69Jc4YEMqsaFhBsG5HunC6/b6tNzbUF4FCvn
 0tUqFOHjtYj+YG17CQ+krwAXKxWS0US1DcHdkz52T1FcEQHWrOJJbtZrRLbO89bow80Q
 d9iw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Gfhp0R9S
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix ARC build with 4.x
 kernel headers
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5451073176448429067=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5451073176448429067==
Content-Type: multipart/alternative; boundary="000000000000b9eaea061e5bb4ce"

--000000000000b9eaea061e5bb4ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also checked qemu_sh4_r2d_defconfig just now, everything works, qemu (my
host qemu is 9.0.2) boots the system

=D0=BF=D0=BD, 29 =D0=B8=D1=8E=D0=BB. 2024=E2=80=AF=D0=B3. =D0=B2 07:51, Wal=
demar Brodkorb <wbx@openadk.org>:

> Hi,
> Thomas Petazzoni wrote,
>
> > Hello,
> >
> > On Sun, 28 Jul 2024 19:21:20 +0300
> > Dmitriy Chestnykh <dm.chestnykh@gmail.com> wrote:
> >
> > > Hello Thomas
> > > The SuperH4 issue has already been fixed by patch number 0002 (
> > >
> https://gitlab.com/buildroot.org/buildroot/-/commit/f463a4953534df13397ce=
113bfbbc03d4b8e4df7
> > > )
> >
> > Indeed, thanks!
> >
> > I still have an issue with SuperH 4 though.. it doesn't boot in Qemu:
> >
> >
> https://gitlab.com/buildroot.org/toolchains-builder/-/pipelines/139114678=
2
>
> That is strange. I cloned buildroot-toolchains,
> make qemu_sh4_r2d_defconfig && make
>
> For me it works with the included Qemu 9.0.0.
> Strange thing is my zImage is smaller then the artefact which can be
> downloaded and did not work.
>
> $ ls -l Downloads/zImage
>   -rw-r--r-- 1 6037536 Jul 29 06:06 Downloads/zImage
> $ ls -l buildroot-toolchains/output/images/zImage
>   -rw-r--r-- 1 4530208 Jul 29 05:57
> buildroot-toolchains/output/images/zImage
>
> Are the toolchain checks are running some tests inside the image?
>
> best regards
>  Waldemar
>

--000000000000b9eaea061e5bb4ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Also checked qemu_sh4_r2d_defconfig just now, everything w=
orks, qemu (my host qemu is 9.0.2) boots the system<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D0=BD, 29 =D0=
=B8=D1=8E=D0=BB. 2024=E2=80=AF=D0=B3. =D0=B2 07:51, Waldemar Brodkorb &lt;<=
a href=3D"mailto:wbx@openadk.org">wbx@openadk.org</a>&gt;:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi,<br>
Thomas Petazzoni wrote,<br>
<br>
&gt; Hello,<br>
&gt; <br>
&gt; On Sun, 28 Jul 2024 19:21:20 +0300<br>
&gt; Dmitriy Chestnykh &lt;<a href=3D"mailto:dm.chestnykh@gmail.com" target=
=3D"_blank">dm.chestnykh@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hello Thomas<br>
&gt; &gt; The SuperH4 issue has already been fixed by patch number 0002 (<b=
r>
&gt; &gt; <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/f4=
63a4953534df13397ce113bfbbc03d4b8e4df7" rel=3D"noreferrer" target=3D"_blank=
">https://gitlab.com/buildroot.org/buildroot/-/commit/f463a4953534df13397ce=
113bfbbc03d4b8e4df7</a><br>
&gt; &gt; )<br>
&gt; <br>
&gt; Indeed, thanks!<br>
&gt; <br>
&gt; I still have an issue with SuperH 4 though.. it doesn&#39;t boot in Qe=
mu:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/buildroot.org/toolchains-bui=
lder/-/pipelines/1391146782" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.com/buildroot.org/toolchains-builder/-/pipelines/1391146782</a><br>
<br>
That is strange. I cloned buildroot-toolchains, <br>
make qemu_sh4_r2d_defconfig &amp;&amp; make<br>
<br>
For me it works with the included Qemu 9.0.0.<br>
Strange thing is my zImage is smaller then the artefact which can be<br>
downloaded and did not work.<br>
<br>
$ ls -l Downloads/zImage <br>
=C2=A0 -rw-r--r-- 1 6037536 Jul 29 06:06 Downloads/zImage<br>
$ ls -l buildroot-toolchains/output/images/zImage <br>
=C2=A0 -rw-r--r-- 1 4530208 Jul 29 05:57 buildroot-toolchains/output/images=
/zImage<br>
<br>
Are the toolchain checks are running some tests inside the image?<br>
<br>
best regards<br>
=C2=A0Waldemar<br>
</blockquote></div>

--000000000000b9eaea061e5bb4ce--

--===============5451073176448429067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5451073176448429067==--
