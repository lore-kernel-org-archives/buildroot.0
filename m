Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CB0CD4844
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 16:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1374561100;
	Fri, 22 Sep 2023 16:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1374561100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bxHQ5zNYmR4b; Fri, 22 Sep 2023 16:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29372610F3;
	Fri, 22 Sep 2023 16:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29372610F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D28FA1BF369
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 16:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC0B9610F3
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 16:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC0B9610F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZTVtKLZZ7QA for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 16:22:12 +0000 (UTC)
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78C7E60E0A
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 16:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78C7E60E0A
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1d637f9c587so2105333fac.1
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 09:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695399731; x=1696004531;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vRZS2aZSTiVRkP5IuuRG7Ny2z73JKOAeJNe56zjspbU=;
 b=CH6rOAejdYs4Wui3eGh3Qj0fj0yBkVNv5WLWEJy22YIUto37FzlTtPPkjr1g3Snq3Z
 yK8UvsF+oaIchX7J3k8TOE0/FpArzrUEauzY+xRI3YoNasB4QF1D6xrrKFmKrSHU9oOj
 plf9FRsv+D8LC+TZxeLi4IgDOmr2gbiNgjVW5jpEOlNMFJzugN9pUho3SM5UGxIhmKJT
 hcp0lvM9cTyKS2eZtZKqJJ7uZYDaV7qAjQk0HJQrhCFR6GAefElKoThHuWPVIanh3qhA
 F9GWNRTK4EAYz94I8xCn2Hcmoa4t8skAbZeLJcsTtU+KZxXUHx5Lgr2ns+TOK8TjubsH
 g1iA==
X-Gm-Message-State: AOJu0YxFQGGRXsyDiQ3dplhZCc5eyct5H+xek0hhl7QeRh2Th59UXUP2
 fdnT8xWZXwpXeF1oJIC4TUMPtIA4WOSft3smBSkg/xdn
X-Google-Smtp-Source: AGHT+IGdKqK4qRzFPQIEk064tnb0uWpvnlfft7GGCYx0c/0HHgVRhexgJZL1yczPYGZP+CpMarWIEmIfy6nDAQI4zoE=
X-Received: by 2002:a05:6870:3914:b0:1d6:ce75:d472 with SMTP id
 b20-20020a056870391400b001d6ce75d472mr2012853oap.6.1695399731328; Fri, 22 Sep
 2023 09:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs6=UDJZ_6NHNFnKwagW01pcXAKSO8k-G1EUwsBjD2bpw@mail.gmail.com>
 <20230922160448.GR512384@scaer>
In-Reply-To: <20230922160448.GR512384@scaer>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 22 Sep 2023 18:22:00 +0200
Message-ID: <CADYjeSv4H7rqSaq5D7a9zHyZxSMp1vJv5sNs6Lj7RJLgmXEd3w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695399731; x=1696004531; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vRZS2aZSTiVRkP5IuuRG7Ny2z73JKOAeJNe56zjspbU=;
 b=eolh2Jl2xlQOxUIIW7ATzfpsMdnHEC+vQkG6R0JIUWnylBYDN4oIyr6+jzdAB+yF8M
 WgaV593YrJnq7A+poOVel8u6rZkivZO2Nd+w7XtOmWqS32S9p2bHKUDJQs/eco6AWnRE
 Yrv4VfMQpLovoxjMuUZ55aHL6m28iFVaijLdcpSLp3ElielboUImG8qykDrBWjemdecX
 9raZWUYhhJ0ARvsc104wg/uuB5uffMuX7XjM5nXzJhcnzwAQOhZOFFBEC/5dBButFjxS
 IITWvFEMe6Wt4UbPT+mhBut8YQHYeBo/wKu/XZ/s+piBVOu3ny5TkUIHIi8pfvJjLZ68
 9ueQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eolh2Jl2
Subject: Re: [Buildroot] How to pass EXTRA_OECMAKE_BUILD in Buildroot
 package definition?
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
Content-Type: multipart/mixed; boundary="===============1983452238650314297=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1983452238650314297==
Content-Type: multipart/alternative; boundary="000000000000bcff970605f502f3"

--000000000000bcff970605f502f3
Content-Type: text/plain; charset="UTF-8"

Hello Yann,

Thanks for the update.

Yes, I checked in "Infrastructure for Cmake based packages" but couldn't
find anything relevant.

There seems to be no direct way to do this in Buildroot. Please correct me
if I'm wrong.

Thanks in advance


On Fri, Sep 22, 2023, 18:04 Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Sourabh, All,
>
> On 2023-09-22 17:33 +0200, Sourabh Hegde spake thusly:
> > Hi,
> > I am trying to add a Buildroot package where I need to
> specify EXTRA_OECMAKE_BUILD. But I couldn't find any relevant
> > variable in Buildroot for this.
>
> This variable is specific to the OpenEmbedded world.
>
> Look at the Buildroot manual to find the corresponding variable:
>
>     https://buildroot.org/downloads/manual/manual.html
>
> Hint: "Infrastructure for CMake-based packages"
>
> Regards,
> Yann E. MORIN.
>
> > Example will be from
> > [1]
> https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41
> > Can anyone please let me know how to achieve this?
> > Thanks in advance.
> >
> > Links:
> > 1.
> https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41
>
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>

--000000000000bcff970605f502f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Yann,<div dir=3D"auto"><br></div><div dir=3D"a=
uto">Thanks for the update.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Yes, I checked in &quot;Infrastructure for Cmake based packages&quot; b=
ut couldn&#39;t find anything relevant.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">There seems to be no direct way to do this in Buildroot. Pl=
ease correct me if I&#39;m wrong.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks in advance</div><br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Sep 22, 2023, 18:04 Yann E. MORIN &l=
t;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Sourabh, All,<br>
<br>
On 2023-09-22 17:33 +0200, Sourabh Hegde spake thusly:<br>
&gt; Hi,<br>
&gt; I am trying to add a Buildroot package where I need to specify=C2=A0EX=
TRA_OECMAKE_BUILD. But I couldn&#39;t=C2=A0find any relevant<br>
&gt; variable in Buildroot for this.<br>
<br>
This variable is specific to the OpenEmbedded world.<br>
<br>
Look at the Buildroot manual to find the corresponding variable:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://buildroot.org/downloads/manual/manual.html=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://buildroot.org/dow=
nloads/manual/manual.html</a><br>
<br>
Hint: &quot;Infrastructure for CMake-based packages&quot;<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Example will be from=C2=A0<br>
&gt; [1]<a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a=
557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorf=
low-lite_2.10.0.bb#L41" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6=
948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41=
</a><br>
&gt; Can anyone please let me know how to achieve this?<br>
&gt; Thanks in advance.<br>
&gt; <br>
&gt; Links:<br>
&gt; 1. <a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a=
557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorf=
low-lite_2.10.0.bb#L41" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6=
948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41=
</a><br>
<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"no=
referrer">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=
=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div></div></div>

--000000000000bcff970605f502f3--

--===============1983452238650314297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1983452238650314297==--
