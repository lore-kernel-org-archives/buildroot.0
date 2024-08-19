Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42114C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 08:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDCC2606ED;
	Mon, 19 Aug 2024 08:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_ZdCsQkatK9; Mon, 19 Aug 2024 08:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4DF6607BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4DF6607BC;
	Mon, 19 Aug 2024 08:31:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84DE01BF3EF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73652607BC
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKGOjAU-pMus for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 08:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A468606ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A468606ED
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A468606ED
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 08:31:15 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-49290ce47c4so2289792137.0
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 01:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724056274; x=1724661074;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XN+DJrTLFf/pbwftoRTKfM10twKY0Kf1rP6Li0yxrLU=;
 b=hNfmzYUNhQlM+lWTLv7B/AacwoGZUireJnpCOH4DIoVuoO/fAcnuViYfdtsW0lR9i0
 GDFToWKbzovpgOsA6qEKOQKio+Muxr/ZcaqtmryQ1i05+OvxCseKlRt49AcN+nmiWno8
 p3L0nUkAl0T4EnkuXTaX006EepxWttk0ymklcDZ0lywg4HHDNBpJFVXC5jYS+RA//ryo
 qxuDC/MuEIJqSRwIG0QVF+O4WKYcLW/K45jZ91ZIza026X4SodnzVIuh9m8aV+9PBDOH
 jOtfxDzDxNgF8kReCpg7WPunTqnP3Dgcs2Ow+aN6sMiBmodSanUKpiBD6WgcSYziT7Iq
 /ruw==
X-Gm-Message-State: AOJu0YxNJiI134NTMqJAJ5JuszN5NNSJs5lLvhFjY3LVVGyhPE5Kp+GL
 SDjVRpddDWiajajYpg7YKNuoUZmSE21H+65OfX/oPxZpO6RKxXOXuF08+JUIMrY6HMaHGN4Rc3h
 08ezPtu3BzRIw322oXmvQeuxRH1k=
X-Google-Smtp-Source: AGHT+IHncI91wsCtJdAqDpQL9U69gOv5taEqhYFm+FrjRZsaCfHv2+Dvnnhc4gBJYnIYQ+0B092xW1HNBcJ8uBhoRUo=
X-Received: by 2002:a05:6102:160c:b0:493:b055:bf3b with SMTP id
 ada2fe7eead31-4977b7abfcdmr5163152137.7.1724056273892; Mon, 19 Aug 2024
 01:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240819040213.3563422-1-james.hilliard1@gmail.com>
 <20240819102733.13fccbc0@windsurf>
In-Reply-To: <20240819102733.13fccbc0@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 19 Aug 2024 02:31:02 -0600
Message-ID: <CADvTj4pX3pQQavPnVyzR+R92DsjjJ0+SBoD8wXuhBk4drJmFrA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724056274; x=1724661074; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XN+DJrTLFf/pbwftoRTKfM10twKY0Kf1rP6Li0yxrLU=;
 b=dKqW8xM3dlVqG6TD8EcKQRsS13QbKRrw3I3fjhDMsFrFpymJRfkpcj8sbpvAPV2Nzx
 dTLD9+z5HnZ+dF+kTK/fNMP6vZd7wEyPmZTsNDPCm9MLoqpXTEeZBOkTOAivuZMbXZsu
 78DTmGUuNBNf6lyqyrKz/vBD64VGYMeGSeDBpc+c1hjIs7n5nMkG+sTO03I8X46XHIhr
 DPlKOCv3+0g3HGsReZdmzqB6mWt2Yc67spMq22gdBxMvpTI5T0tlUyQ2EQvfImg9y9mE
 HR4U+Wd3UOAh4pTNOVRYOOU/HgQFKVDTOqAO4Vrp0wBm6MG6fz/8Nn1xRXcqjPEAqBOI
 6tBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dKqW8xM3
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: fix cli with
 BR2_SHARED_LIBS
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4450082415878770314=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4450082415878770314==
Content-Type: multipart/alternative; boundary="000000000000c73b2c0620052132"

--000000000000c73b2c0620052132
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 2:27=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Sun, 18 Aug 2024 22:02:13 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Flashrom requires --default-library=3Dboth for the cli when building
> > with BR2_SHARED_LIBS.
> >
> > As such set --default-library=3Dboth instead of disabling it.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Thanks for the patch!
>
> Is this fixing a build issue? If so, which one, which defconfig? Or
> perhaps an autobuilder failure reference?
>

It fixes an issue where the flashlib cli was not being built at all,
only the library was for BR2_SHARED_LIBS systems.


>
> When was this problem introduced?
>

When bumping flashrom to version 1.4.0-rc2:
https://github.com/buildroot/buildroot/commit/8637884057ddc3c1aeb9f0dd285fc=
6fcf378c26b


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000c73b2c0620052132
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Aug 19, 2024 at 2:27=E2=80=AFAM T=
homas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.=
petazzoni@bootlin.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Sun, 18 Aug 2024 22:02:13 -0600<br>
James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_=
blank">james.hilliard1@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Flashrom requires --default-library=3Dboth for the cli when building<b=
r>
&gt; with BR2_SHARED_LIBS.<br>
&gt; <br>
&gt; As such set --default-library=3Dboth instead of disabling it.<br>
&gt; <br>
&gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gm=
ail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
<br>
Thanks for the patch!<br>
<br>
Is this fixing a build issue? If so, which one, which defconfig? Or<br>
perhaps an autobuilder failure reference?<br></blockquote><div><br></div><d=
iv>It fixes an issue where the flashlib cli was not being built at all,</di=
v><div>only the library was for BR2_SHARED_LIBS systems.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
When was this problem introduced?<br></blockquote><div><br></div><div>When =
bumping flashrom to version 1.4.0-rc2:</div><div><a href=3D"https://github.=
com/buildroot/buildroot/commit/8637884057ddc3c1aeb9f0dd285fc6fcf378c26b">ht=
tps://github.com/buildroot/buildroot/commit/8637884057ddc3c1aeb9f0dd285fc6f=
cf378c26b</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000c73b2c0620052132--

--===============4450082415878770314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4450082415878770314==--
