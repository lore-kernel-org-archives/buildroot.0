Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6359CC3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19065400C1;
	Wed, 17 Jul 2024 21:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdrwG9xgtIgp; Wed, 17 Jul 2024 21:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0F29400EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0F29400EA;
	Wed, 17 Jul 2024 21:07:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF2E51BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB52960B14
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvqmDuwPpBKD for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:07:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.52;
 helo=mail-lf1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC56D60AD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC56D60AD0
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC56D60AD0
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:07:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52ed741fe46so175551e87.0
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 14:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721250474; x=1721855274;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CbnQ8mrqZ6s1mygNhWut7+IvdTj7E2m3AtMr3ZLcvzc=;
 b=A0jnTU1xaeIlO7wV/U5VTHCRAMejJpohHE3cMwmD/zww1B7sk6W9hOTDYXLsXgN2uM
 9E91e2dEdLs/jXomHSeR3dStqAztaHoeeclwD2pYZAdu5I1HSOEAIxSkBOSsnaDmFfxV
 EcxPdZc4GukNvtphzfvVACX38zdhAs4bQEZZrYMOxKoKPZxNEGuhiklIHNdKAnf4Kd38
 Vq4a39NeeyOf2FOv3R6E9LBQzE/PwFbLLzdawPOmMg1neYaL2RO/DIBnvHIIQj3BdavZ
 EqYOADyqhMzJIvvfz/qSOZPOBMK3VvDjzvnQya3P9d8EZrRCbcughEa5dLhbkKxS5FuN
 jy+w==
X-Gm-Message-State: AOJu0YzTUETA+hOl7Y8v78WHtwSx5sLkex7UFl7OKrLDuEPcvSAY7lwU
 CEEkbUTi6l8Bb8GC2E3keDGJ/asvEPz6Z1kqNuIb1A4zaJsBsDFTowYvzNqMvao=
X-Google-Smtp-Source: AGHT+IFt5VrEuuo+0F5Q0XrPaZlpan543HD2qmEA9IkyPzqtrMkL7EvxS0I7AEiQeVDflCodW9yBDg==
X-Received: by 2002:a05:6512:3e0f:b0:52e:be50:9c55 with SMTP id
 2adb3069b0e04-52ee54270damr2136791e87.52.1721250473173; 
 Wed, 17 Jul 2024 14:07:53 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed2538d24sm1592798e87.243.2024.07.17.14.07.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 14:07:52 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52ea1a69624so119502e87.1
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 14:07:52 -0700 (PDT)
X-Received: by 2002:a05:6512:10d5:b0:52c:e402:4dc1 with SMTP id
 2adb3069b0e04-52ee543da79mr2079521e87.55.1721250472247; Wed, 17 Jul 2024
 14:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <CACXRmJhGiYC3tN9+0hPhMsvO-DzvqTMPOB1HufaBzYszoT5eTg@mail.gmail.com>
 <20240207193123.3400214-1-thomas@devoogdt.com>
 <1c6eafa2-3d8c-4716-bafb-df6a47aa8751@mind.be>
 <20240717200926.1a7db2a1@windsurf>
In-Reply-To: <20240717200926.1a7db2a1@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 17 Jul 2024 23:07:40 +0200
X-Gmail-Original-Message-ID: <CACXRmJiC2rs129hy2j-S0uQQE0wctrRQYkbc_RnxhHN_oBJFYQ@mail.gmail.com>
Message-ID: <CACXRmJiC2rs129hy2j-S0uQQE0wctrRQYkbc_RnxhHN_oBJFYQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v9 1/2] package/cairo: move to the meson
 build system
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
 Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>,
 Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============9020958664736080112=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9020958664736080112==
Content-Type: multipart/alternative; boundary="000000000000f7d30b061d77dabc"

--000000000000f7d30b061d77dabc
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,


The error::

../output-1/build/cairo-1.18.0/meson.build:1:0: ERROR: Unable to detect GNU
compiler type

...

Obviously, I tested the compilation at submitting time. So that comes to a
surprise. I know that different toolchains are used. To get compilation
working, the c_std=gnu11 flag was set. I saw that the same thing was done
upstream in the meantime. (
https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/555) So perhaps
it's related, and should use that, since that patch falls back to c11.


Kr,

Thomas

Op wo 17 jul. 2024 20:09 schreef Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Mon, 15 Jul 2024 00:07:11 +0200
> Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:
>
> > > - Added two patches to fix cross compiling, upstream: [3]
> > >
> > > [1]:
> https://gitlab.freedesktop.org/cairo/cairo/-/commit/596a82f2d185b101bd74645492821fe2f9e0daa0
> > > [2]:
> https://gitlab.freedesktop.org/cairo/cairo/-/blame/1.17.4/meson.build#L277
> > > [3]: https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/534
> > >
> > > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> >
> >   Both applied to master, thanks.
>
> This switch to Meson, or the bump to 1.18.0 is causing a huge amount of
> build failures in our autobuilders:
>
>   http://autobuild.buildroot.net/?reason=cairo-1.18.0
>
> Would it be possible to have a look?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>
>

--000000000000f7d30b061d77dabc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><p dir=3D"ltr">Hi Thomas,=C2=A0</p><p d=
ir=3D"ltr"><br></p><p dir=3D"ltr">The error::</p><p dir=3D"ltr">../output-1=
/build/cairo-1.18.0/meson.build:1:0: ERROR: Unable to detect GNU compiler t=
ype</p><p dir=3D"ltr">...=C2=A0</p>
<p dir=3D"ltr">Obviously, I tested the compilation at submitting time. So t=
hat comes to a surprise. I know that different toolchains are used. To get =
compilation working, the c_std=3Dgnu11 flag was set. I saw that the same th=
ing was done upstream in the meantime. (<a href=3D"https://gitlab.freedeskt=
op.org/cairo/cairo/-/merge_requests/555" target=3D"_blank" rel=3D"noreferre=
r">https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/555</a>) So =
perhaps it&#39;s related, and should use that, since that patch falls back =
to c11.</p><p dir=3D"ltr"><br></p><p dir=3D"ltr">Kr,=C2=A0</p><p dir=3D"ltr=
">Thomas=C2=A0</p></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Op wo 17 jul. 2024 20:09 schreef Thomas Petazzoni &lt;<a =
href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank" rel=3D"noref=
errer">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Hello,<br>
<br>
On Mon, 15 Jul 2024 00:07:11 +0200<br>
Arnout Vandecappelle via buildroot &lt;<a href=3D"mailto:buildroot@buildroo=
t.org" rel=3D"noreferrer noreferrer" target=3D"_blank">buildroot@buildroot.=
org</a>&gt; wrote:<br>
<br>
&gt; &gt; - Added two patches to fix cross compiling, upstream: [3]<br>
&gt; &gt; <br>
&gt; &gt; [1]: <a href=3D"https://gitlab.freedesktop.org/cairo/cairo/-/comm=
it/596a82f2d185b101bd74645492821fe2f9e0daa0" rel=3D"noreferrer noreferrer n=
oreferrer" target=3D"_blank">https://gitlab.freedesktop.org/cairo/cairo/-/c=
ommit/596a82f2d185b101bd74645492821fe2f9e0daa0</a><br>
&gt; &gt; [2]: <a href=3D"https://gitlab.freedesktop.org/cairo/cairo/-/blam=
e/1.17.4/meson.build#L277" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">https://gitlab.freedesktop.org/cairo/cairo/-/blame/1.17.4/meson=
.build#L277</a><br>
&gt; &gt; [3]: <a href=3D"https://gitlab.freedesktop.org/cairo/cairo/-/merg=
e_requests/534" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">=
https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/534</a><br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoo=
gdt.com" rel=3D"noreferrer noreferrer" target=3D"_blank">thomas@devoogdt.co=
m</a>&gt;=C2=A0 <br>
&gt; <br>
&gt;=C2=A0 =C2=A0Both applied to master, thanks.<br>
<br>
This switch to Meson, or the bump to 1.18.0 is causing a huge amount of<br>
build failures in our autobuilders:<br>
<br>
=C2=A0 <a href=3D"http://autobuild.buildroot.net/?reason=3Dcairo-1.18.0" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http://autobuild.b=
uildroot.net/?reason=3Dcairo-1.18.0</a><br>
<br>
Would it be possible to have a look?<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000f7d30b061d77dabc--

--===============9020958664736080112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9020958664736080112==--
