Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA8EC64EC4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 15:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3EBF4105D;
	Wed, 22 Feb 2023 15:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3EBF4105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjTRI_r32yom; Wed, 22 Feb 2023 15:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B924D40B8E;
	Wed, 22 Feb 2023 15:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B924D40B8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7A9C1BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C11846116C
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C11846116C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zt5rZftogIO0 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 15:55:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 842FD6116E
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 842FD6116E
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 15:55:41 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id g12so4733651pfi.0
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 07:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7gcw3cMEuCvW3RHgMiKVdYBdQOH9G/MLoIzqC4CM2ew=;
 b=c5mQ05ocYSjtbyLP/yRBxVN30LRieBodcbEgc9RB5CMiWRBrBnwSk8bBe0McLz7Ehs
 QvFMNuOAGHWlIQ1wRmCaaEPOLRe/ACkQQgfNI/UVMUpO1HilGBuGQXc9gKavbjIAWe9G
 aEp5I9kANi4EcT0pHs9N1mHNBneBIWK76bMMLvUh9w+FlZhu8onR7f3pteg3t1wpJETD
 68vVhyOFv+FU3XGCoX+xUtI5q2C93cA1C6CfbvQ2Mn34U4/JpCwxGq4pkETXymki8fwf
 GFxPfrJ/zQQ0fUKNXNs/AgT7NccAMGmDIyx9d7qFiVGBjSijJp82j4VtMFmMYvwDM0JC
 kPRA==
X-Gm-Message-State: AO0yUKX33BSHU7w4Tz1pF83eQRTlkg+QnYZx/TS6zq0QGtvmxIpwEaxd
 i+nMXYGciy/f6LFSAmP8TU7cCtbqsOA/OHfXXmDgjfK08ug=
X-Google-Smtp-Source: AK7set+iU0b1laYGGVINLvuiEaDrPQwZ151pb/wIsoAIx3/b08FU0vOlynwqhgvfjdSKnrH25IUf9kr3163ddiNt/pc=
X-Received: by 2002:a62:c312:0:b0:598:b25d:fdb2 with SMTP id
 v18-20020a62c312000000b00598b25dfdb2mr1430383pfg.0.1677081340737; Wed, 22 Feb
 2023 07:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20230208230721.3269610-1-giulio.benetti@benettiengineering.com>
 <20230208230721.3269610-3-giulio.benetti@benettiengineering.com>
 <b0c85d89-b51d-0c73-c6ea-7a09834d0827@benettiengineering.com>
In-Reply-To: <b0c85d89-b51d-0c73-c6ea-7a09834d0827@benettiengineering.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Feb 2023 16:55:29 +0100
Message-ID: <CAPi7W809PQ3rwCF0pWSzL7V8RZef_Z2i+BVhecj+G+GY5zc7dQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7gcw3cMEuCvW3RHgMiKVdYBdQOH9G/MLoIzqC4CM2ew=;
 b=fqjHSRZM+nORWQpB6Rfl+kzDwB9PcY5K/JCnSgvCbzJEbdaqRGSdP6k7y46X7rnBt/
 P4pbNm1/RajuBAN18ssd/INLeJ8227s74UkIK4M8hbDl3ywSZaaFF1pu8JtZqQ8xCb2a
 JIxdTeDtVSKSdi+Pbbe4KjGSbkNSositY5fNi+M5oFgW3IXpTG81Qs+9pRjU0uZ0heZk
 CflxzkKxr7QbevKQqy5kO7aSNv1GYr3ceE94mIIiBWLcQqd5f4OS1+E5NbVcLUcvIMdx
 mneS1VaNG3i8ErvMjEmka6bPXvZWkpZCU5B6YAAeLyG9DLSxCpvtJhbCHceWs6r1F1JU
 s3OQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fqjHSRZM
Subject: Re: [Buildroot] [PATCH 2/2] package/harfbuzz: bump to version 6.0.0
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
Content-Type: multipart/mixed; boundary="===============2640933102211398335=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2640933102211398335==
Content-Type: multipart/alternative; boundary="00000000000093010805f54beda7"

--00000000000093010805f54beda7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mer. 22 f=C3=A9vr. 2023 =C3=A0 16:37, Giulio Benetti <
giulio.benetti@benettiengineering.com> a =C3=A9crit :

> This patch is superseded by this one:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20230222145059.19390=
94-1-giulio.benetti@benettiengineering.com/


This bump should be tagged as a security bump as it includes a fix for
CVE-2023-25193 (or you could backport fix on master).


>
>
> Best regards
> --
> CEO/CTO@Benetti Engineering sas
>
> On 09/02/23 00:07, Giulio Benetti wrote:
> > Since the major release changed all the packages that have direct
> > dependency to harfbuzz has been succesfully built:
> > - efl
> > - libass
> > - mupdf
> > - pango
> > - qt5base
> > - qt5webengine
> > - qt6base
> > - sdl2_ttf
> > - supertuxkart
> > - vlc
> > - webkitgtk
> > - wpewebkit
> >
> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > ---
> >   package/harfbuzz/harfbuzz.hash | 2 +-
> >   package/harfbuzz/harfbuzz.mk   | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/harfbuzz/harfbuzz.hash
> b/package/harfbuzz/harfbuzz.hash
> > index 9489f25c6a..faae7b91e3 100644
> > --- a/package/harfbuzz/harfbuzz.hash
> > +++ b/package/harfbuzz/harfbuzz.hash
> > @@ -1,3 +1,3 @@
> >   # Locally computed
> > -sha256
> 4a6ce097b75a8121facc4ba83b5b083bfec657f45b003cd5a3424f2ae6b4434d
> harfbuzz-5.3.1.tar.xz
> > +sha256
> 1d1010a1751d076d5291e433c138502a794d679a7498d1268ee21e2d4a140eb4
> harfbuzz-6.0.0.tar.xz
> >   sha256
> 4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
> > diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.m=
k
> > index b0112168e1..02fe4ecec3 100644
> > --- a/package/harfbuzz/harfbuzz.mk
> > +++ b/package/harfbuzz/harfbuzz.mk
> > @@ -4,7 +4,7 @@
> >   #
> >
>  ########################################################################=
########
> >
> > -HARFBUZZ_VERSION =3D 5.3.1
> > +HARFBUZZ_VERSION =3D 6.0.0
> >   HARFBUZZ_SITE =3D
> https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION=
)
> >   HARFBUZZ_SOURCE =3D harfbuzz-$(HARFBUZZ_VERSION).tar.xz
> >   HARFBUZZ_LICENSE =3D MIT, ISC (ucdn library)
>

Best Regards,

Fabrice

--00000000000093010805f54beda7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 22 f=C3=A9vr. 2023 =
=C3=A0=C2=A016:37, Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@bene=
ttiengineering.com">giulio.benetti@benettiengineering.com</a>&gt; a =C3=A9c=
rit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This =
patch is superseded by this one:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20230222145=
059.1939094-1-giulio.benetti@benettiengineering.com/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/patch/202302=
22145059.1939094-1-giulio.benetti@benettiengineering.com/</a></blockquote><=
div><br></div><div>This bump should be tagged as a security bump as it incl=
udes a fix for CVE-2023-25193 (or you could backport fix on master).<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Best regards<br>
-- <br>
CEO/CTO@Benetti Engineering sas<br>
<br>
On 09/02/23 00:07, Giulio Benetti wrote:<br>
&gt; Since the major release changed all the packages that have direct<br>
&gt; dependency to harfbuzz has been succesfully built:<br>
&gt; - efl<br>
&gt; - libass<br>
&gt; - mupdf<br>
&gt; - pango<br>
&gt; - qt5base<br>
&gt; - qt5webengine<br>
&gt; - qt6base<br>
&gt; - sdl2_ttf<br>
&gt; - supertuxkart<br>
&gt; - vlc<br>
&gt; - webkitgtk<br>
&gt; - wpewebkit<br>
&gt; <br>
&gt; Signed-off-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@ben=
ettiengineering.com" target=3D"_blank">giulio.benetti@benettiengineering.co=
m</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/harfbuzz/harfbuzz.hash | 2 +-<br>
&gt;=C2=A0 =C2=A0package/harfbuzz/<a href=3D"http://harfbuzz.mk" rel=3D"nor=
eferrer" target=3D"_blank">harfbuzz.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuz=
z.hash<br>
&gt; index 9489f25c6a..faae7b91e3 100644<br>
&gt; --- a/package/harfbuzz/harfbuzz.hash<br>
&gt; +++ b/package/harfbuzz/harfbuzz.hash<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 =C2=A0# Locally computed<br>
&gt; -sha256=C2=A0 4a6ce097b75a8121facc4ba83b5b083bfec657f45b003cd5a3424f2a=
e6b4434d=C2=A0 harfbuzz-5.3.1.tar.xz<br>
&gt; +sha256=C2=A0 1d1010a1751d076d5291e433c138502a794d679a7498d1268ee21e2d=
4a140eb4=C2=A0 harfbuzz-6.0.0.tar.xz<br>
&gt;=C2=A0 =C2=A0sha256=C2=A0 4345e1735f8bc6d812fed5180cabb5a5e88a4109d3326=
52f2a45c13cfa5ee692=C2=A0 COPYING<br>
&gt; diff --git a/package/harfbuzz/<a href=3D"http://harfbuzz.mk" rel=3D"no=
referrer" target=3D"_blank">harfbuzz.mk</a> b/package/harfbuzz/<a href=3D"h=
ttp://harfbuzz.mk" rel=3D"noreferrer" target=3D"_blank">harfbuzz.mk</a><br>
&gt; index b0112168e1..02fe4ecec3 100644<br>
&gt; --- a/package/harfbuzz/<a href=3D"http://harfbuzz.mk" rel=3D"noreferre=
r" target=3D"_blank">harfbuzz.mk</a><br>
&gt; +++ b/package/harfbuzz/<a href=3D"http://harfbuzz.mk" rel=3D"noreferre=
r" target=3D"_blank">harfbuzz.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0##########################################################=
######################<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -HARFBUZZ_VERSION =3D 5.3.1<br>
&gt; +HARFBUZZ_VERSION =3D 6.0.0<br>
&gt;=C2=A0 =C2=A0HARFBUZZ_SITE =3D <a href=3D"https://github.com/harfbuzz/h=
arfbuzz/releases/download/$(HARFBUZZ_VERSION)" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_=
VERSION)</a><br>
&gt;=C2=A0 =C2=A0HARFBUZZ_SOURCE =3D harfbuzz-$(HARFBUZZ_VERSION).tar.xz<br=
>
&gt;=C2=A0 =C2=A0HARFBUZZ_LICENSE =3D MIT, ISC (ucdn library)<br></blockquo=
te><div><br></div><div>Best Regards,</div><div><br></div><div>Fabrice <br><=
/div></div></div>

--00000000000093010805f54beda7--

--===============2640933102211398335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2640933102211398335==--
