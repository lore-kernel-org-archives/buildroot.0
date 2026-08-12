Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A783C5AD5A
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 19:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB2F480FF2;
	Wed, 12 Aug 2026 19:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kQfNAyih0eJ; Wed, 12 Aug 2026 19:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADFE980FF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786562918;
	bh=OA0aVOq4otMN2cDIULqkEAI+3AJLv/FQyPZy1v0KW2M=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JC4TUnpDlG8jHnWFa7vZXYPRVx6bYqOsUjnflS7nS7082nyBksck874X878X6KgT/
	 14CPS4HC1cUQVqmSS+9bA3U7aJjDnMGv4dKDzZ/U9dVuYBbywSdZiEx5utM+Hk11U6
	 MPrOffIAlj8plIJbCT4+1/An7SadYUBZE1NjRjoB4xtVDkkvM/YCxsfWmEWP/DF/T0
	 Sk+vyw0fLVBdzSgL8dsHSGL/Wb1+7Y6FjKDaxqmUxSemGqgEOW3Qr81IBiBuyvnKyc
	 1uBRsxbgj/K0YW+zmotKUGySh3UAlBDd32RXXBhv42a5WjUIrmUXW+e40i56ITK7u9
	 sR1b45NwQ2VcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADFE980FF3;
	Wed, 12 Aug 2026 19:28:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25D6C3A4
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1783780FF5
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAtCwZ-jYbio for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 19:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B044780FF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B044780FF2
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B044780FF2
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:28:35 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c207cb16cf5so206629866b.1
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 12:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786562914; cv=none;
 d=google.com; s=arc-20260327;
 b=Wu48HL0vo8U3962XOTyRCfUuwVMxC9qV4cLzNq0Kuff8EEeVAXWpUw/iCWmXU7FnHD
 r4vIIEeoEkS/Mn0Jnh8NJyfGbpxQfp9xghTaPU/Dtdq6cAAydgO4ltDmihOxlJ+4iAeS
 tInxR2t4kGirL2eslS4RLXSyC/gu0s35C9+U7CSf60SnDivDQtsQpJL43I1Bc2cKFLij
 GB3mNQk6T3+6GtcFYIN4csH8HAF+p1/A0ZkLb9DLnwjVZu8IQaxaSSpI/th4DkwklF+X
 uO8shClXybktZFB3RuC5oOZOlWyWl47Zb7zQ7Kc+LhITecHOV2ZX+00VZWiUdvUyVho0
 9e3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=m31jCKRAXBwoTDVATMf5KkF/KvUMh5iJRFK3AevQb3U=;
 fh=jwQohPCt304gBDJN1m4TsMdnxrmqlSi0uHyTudsw9Hc=;
 b=Wq9JFgfosk5+UCNOF0OQrTL5m30XCfrKC5kXpM0S/dbLwFBYx7AbY0Kw247Kh/M9dq
 Hgm0xfDsqIZXc+o8wrYdXAqr7QRvf83iK8rXOFoAksAPWJJGpF2ERsHqrOJqiReUgM7h
 SNhvcRQJzJRcQYIm8Wh4jEBcbODHYcoHHPuWkE0j+iQg5TxihfEW4fwY2mahLzIa+TDm
 OTkmZAnnuRKbS6AUgZWHGcmWh/eHsHu8hj/SJICmmQBLaGORoOIfDs1PDEjJOdFaM9ZF
 sJr/h4Qkb3eB2yc9KboGs3AtIMUxoFH/71BFY5DjJj5kv4c/AA+aNgvB0jchgRNTVs96
 si6A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786562914; x=1787167714;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=m31jCKRAXBwoTDVATMf5KkF/KvUMh5iJRFK3AevQb3U=;
 b=GzsjXmJhprkpTXe4kZk1Lry/SVAL8DESNDRQmVkC5H196ierOjuMV+LisHHnPXGMmq
 5VztOxRjHVPwddb8rxM34mwOVYPMZSWWfBrCYmWPJfIN6rPhVpv54eZJjQzlqseM5+sZ
 y+vFDAMeFlz/yOTkEmaJyF/W93sr/Wn+UmZdyxGoSaKr/gVY5Toy9uwQeydGKdwsPjd2
 Cg3cCFdV8JKP7bV/e1zUHW+NhOkXWPhzP33gr2Lz1M7TtKLv9n5yhUe7qLOjFFYkgKEN
 GBijQypWR9XlRf5BGjGZzKB5F0XtTKrdyoTTPJ4FeNsUgeP/OCgNu3EPkPaS9vZgI2tx
 +I5g==
X-Gm-Message-State: AOJu0YxeX65c2L0Q4xjXNbtUw2nQOMokdbGNezOzQMYrNBIhQVtDB7Ql
 HQCNF+B/wA6JKwqGktkLlKTW8brl1GXyBTU+PI0ckDxZTRIvXSV9mWrtozsaK14a+XUI+4sIlbM
 95I6NpjdVxG7jRz9XA/ddokhfWQHf/1Q=
X-Gm-Gg: AR+sD13gouiLsoZoivm1p/VlYMdezDr2NUgdCs7ZWJNa+QLf+LzdEbEduqnTeoGJOw0
 P0eCy9kDXAzk+IoN5SjU1dmy8ggPZFrjIFOzhlyrlShntYItl0+c23Q660vW3QKJPPKCzBzt9aY
 Y7BzAefD8kJdjuLsJSrEGOZdMoDk6mnVEIbxUS5qUkF1I2Rq6YclXBFL1gO47AdHuNNu0GMbFzi
 lson4Ux6w8GS9TlZg5uFotg++EyA7OVR+9bFMzrhlZTZTgmmsWDgzKuAxUelU+C7ISV2KQYFDv1
 XRCn/aCRzcDcK8+LawGCZ0HRdnlLFmPY0xtUivw5VePr
X-Received: by 2002:a17:907:8e86:b0:c12:74b8:9d3 with SMTP id
 a640c23a62f3a-c2108e1caa4mr23527466b.3.1786562913375; Wed, 12 Aug 2026
 12:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260809201403.3855903-1-alseycmiller@gmail.com>
 <6db03f79-b74a-4c8e-88f7-72d324ab4cde@gmail.com>
In-Reply-To: <6db03f79-b74a-4c8e-88f7-72d324ab4cde@gmail.com>
From: Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Wed, 12 Aug 2026 15:28:21 -0400
X-Gm-Features: AUfX_mwA9cKlOzUbdWJo8hpXi5VqjsrONpScCiyt3GTl-MFKTniObrGH8zZQTT8
Message-ID: <CA+3KNmC6+34xOVKt5Z=YgKNvtuY-CTEQgtg1GGQTzZYxU6=+LA@mail.gmail.com>
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais=2DPou?= <rgallaispou@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, 
 =?UTF-8?B?QW5kcsOpIFp3aW5n?= <nerv@dawncrow.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786562914; x=1787167714; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m31jCKRAXBwoTDVATMf5KkF/KvUMh5iJRFK3AevQb3U=;
 b=Q59LJqWwUnZuEt8seBokRyUXBvdhzRVr74PxoftoXqaul71Oxmpq4VJ9Ya9MDROz7X
 oDW7TQ1wh+kilZMcyHbqK8AfrvzN4W1U33pEPyC8tyrxxEcClsXOvXHsGzzc94TZYygP
 zudCIlGoj60EAfl/+I59qTE3KRrrDuS41xavkgH5e2htN+ljohcIjLBnfEiogQp9Yvt+
 caYKLyttxS+RpExd/TfxHOaOYhAMSjkT0iB7DJptgRSW2E+eDs5cxNt8rCAHblr4bfgh
 WgALKC5t/vqrTW10vNpEmdazGmrxsbQEoMsfmjqJ+gNT/61uyTRGWP5/GXD5D1WKB2tA
 DcTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Q59LJqWw
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libxkbcommon: build
 libxkbregistry when libxml2 is available
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
Content-Type: multipart/mixed; boundary="===============2285761922175242555=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2285761922175242555==
Content-Type: multipart/alternative; boundary="000000000000d21b550658de97d4"

--000000000000d21b550658de97d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Thomas Petazzoni <thomas.petazzoni@bootlin.com> Is there anything else I
can provide to get this merged?

On Mon, Aug 10, 2026 at 5:52=E2=80=AFAM Rapha=C3=ABl Gallais-Pou <rgallaisp=
ou@gmail.com>
wrote:

> Hi,
>
> For information, I've provided a similar fix here:
>
> https://lore.kernel.org/buildroot/20260527-master-v1-1-0d975f3b3f0d@gmail=
.com/
> earlier this summer.
>
> Romain stated that xkbregistry had been disabled on purpose[1] and to
> which my question has remained unanswered in this time of holidays.
>
> Best regards,
> Rapha=C3=ABl
>
> [1]
>
> https://lore.kernel.org/buildroot/cbfb9495-35d2-447e-a9e1-22c834d07dc5@sm=
ile.fr/
>
>
> Le 09/08/2026 =C3=A0 22:14, Alsey Coleman Miller a =C3=A9crit :
> > libxkbregistry is the keyboard layout catalogue half of the library. It
> > parses the XML layout registry and so needs libxml2, which is presumabl=
y
> > why it was disabled unconditionally rather than wired to a dependency.
> >
> > wine needs it. Its configure.ac requires XKBREGISTRY_LIBS alongside
> > wayland-client, wayland-scanner, xkbcommon and linux/input.h before it
> > will build the Wayland driver, and wine.mk passes --with-wayland for an=
y
> > build with BR2_PACKAGE_WAYLAND - which turns that notice into a hard
> > error:
> >
> >    checking for wayland-client.h... yes
> >    checking for wl_display_connect in -lwayland-client... yes
> >    checking for wayland-scanner... .../host/bin/wayland-scanner
> >    checking for xkb_context_new in -lxkbcommon... yes
> >    checking for wayland-egl.h... yes
> >    checking for wl_egl_window_create in -lwayland-egl... yes
> >    configure: error: Wayland development files not found, the Wayland
> >      driver won't be supported.
> >    This is an error since --with-wayland was requested.
> >
> > Every other term of that test passes; only XKBREGISTRY_LIBS is empty, s=
o
> > wine and wayland together could not be built on any architecture.
> >
> > Gated on BR2_PACKAGE_LIBXML2 rather than turned on outright, because
> > meson.build takes dependency('libxml-2.0') unconditionally once
> > enable-xkbregistry is set, so a target without libxml2 would fail to
> > configure.
> >
> > Regarding since when this is broken, three pieces had to come together:
> >
> >   - libxkbcommon has passed -Denable-xkbregistry=3Dfalse since commit
> >     1791bc30a5 ("package/libxkbcommon: bump version to 1.0.1", Sep 2020=
),
> >     i.e. Buildroot 2020.11. libxkbregistry has therefore never been bui=
lt
> >     in Buildroot.
> >
> >   - wine's configure gained the XKBREGISTRY_LIBS term in its Wayland
> >     test in wine 9.0, with upstream commit d64ea8e4a6c9
> >     ("winewayland.drv: Enumerate Xkb layouts and create matching HKL.",
> >     Nov 2023).
> >
> >   - wine.mk started passing --with-wayland in commit 7cb49e7712
> >     ("package/wine: bump to version 9.19", Oct 2024), which is what tur=
ns
> >     the missing XKBREGISTRY_LIBS from a notice into a hard error.
> >
> > The breakage therefore dates from Buildroot 2024.11, and every branch
> > since is affected, including the LTS one: 2025.02.x carries wine 10.0,
> > whose configure has the XKBREGISTRY_LIBS check, together with
> > libxkbcommon 1.9.2 built with -Denable-xkbregistry=3Dfalse, and its
> wine.mk
> > passes --with-wayland. 2025.05.x and 2025.08.x are in the same state.
> > A backport to 2025.02.x is thus needed.
> >
> > Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
> > ---
> >
> > Notes:
> >      Changes since v1:
> >       - Extend the commit log to document since when the problem exists=
,
> and
> >         whether the 2025.02.x LTS branch is affected (suggested by Thom=
as
> >         Petazzoni). No change to the code.
> >
> >   package/libxkbcommon/libxkbcommon.mk | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/libxkbcommon/libxkbcommon.mk
> b/package/libxkbcommon/libxkbcommon.mk
> > index 21a2b937ef..406affe401 100644
> > --- a/package/libxkbcommon/libxkbcommon.mk
> > +++ b/package/libxkbcommon/libxkbcommon.mk
> > @@ -12,8 +12,14 @@ LIBXKBCOMMON_CPE_ID_VENDOR =3D xkbcommon
> >   LIBXKBCOMMON_INSTALL_STAGING =3D YES
> >   LIBXKBCOMMON_DEPENDENCIES =3D host-bison host-flex
> >   LIBXKBCOMMON_CONF_OPTS =3D \
> > -     -Denable-docs=3Dfalse \
> > -     -Denable-xkbregistry=3Dfalse
> > +     -Denable-docs=3Dfalse
> > +
> > +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> > +LIBXKBCOMMON_CONF_OPTS +=3D -Denable-xkbregistry=3Dtrue
> > +LIBXKBCOMMON_DEPENDENCIES +=3D libxml2
> > +else
> > +LIBXKBCOMMON_CONF_OPTS +=3D -Denable-xkbregistry=3Dfalse
> > +endif
> >
> >   ifeq ($(BR2_PACKAGE_XORG7),y)
> >   LIBXKBCOMMON_CONF_OPTS +=3D -Denable-x11=3Dtrue
>
>

--000000000000d21b550658de97d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=
=3D"mailto:thomas.petazzoni@bootlin.com" tabindex=3D"-1">@Thomas Petazzoni<=
/a>=C2=A0Is there anything else I can provide to get this merged?<br></div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Aug 10, 2026 at 5:52=E2=80=AFAM Rapha=C3=ABl Gallai=
s-Pou &lt;<a href=3D"mailto:rgallaispou@gmail.com">rgallaispou@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,=
<br>
<br>
For information, I&#39;ve provided a similar fix here:<br>
<a href=3D"https://lore.kernel.org/buildroot/20260527-master-v1-1-0d975f3b3=
f0d@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.or=
g/buildroot/20260527-master-v1-1-0d975f3b3f0d@gmail.com/</a> <br>
earlier this summer.<br>
<br>
Romain stated that xkbregistry had been disabled on purpose[1] and to <br>
which my question has remained unanswered in this time of holidays.<br>
<br>
Best regards,<br>
Rapha=C3=ABl<br>
<br>
[1] <br>
<a href=3D"https://lore.kernel.org/buildroot/cbfb9495-35d2-447e-a9e1-22c834=
d07dc5@smile.fr/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.=
org/buildroot/cbfb9495-35d2-447e-a9e1-22c834d07dc5@smile.fr/</a> <br>
<br>
<br>
Le 09/08/2026 =C3=A0 22:14, Alsey Coleman Miller a =C3=A9crit=C2=A0:<br>
&gt; libxkbregistry is the keyboard layout catalogue half of the library. I=
t<br>
&gt; parses the XML layout registry and so needs libxml2, which is presumab=
ly<br>
&gt; why it was disabled unconditionally rather than wired to a dependency.=
<br>
&gt; <br>
&gt; wine needs it. Its <a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a> requires XKBREGISTRY_LIBS alongside<br>
&gt; wayland-client, wayland-scanner, xkbcommon and linux/input.h before it=
<br>
&gt; will build the Wayland driver, and <a href=3D"http://wine.mk" rel=3D"n=
oreferrer" target=3D"_blank">wine.mk</a> passes --with-wayland for any<br>
&gt; build with BR2_PACKAGE_WAYLAND - which turns that notice into a hard<b=
r>
&gt; error:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 checking for wayland-client.h... yes<br>
&gt;=C2=A0 =C2=A0 checking for wl_display_connect in -lwayland-client... ye=
s<br>
&gt;=C2=A0 =C2=A0 checking for wayland-scanner... .../host/bin/wayland-scan=
ner<br>
&gt;=C2=A0 =C2=A0 checking for xkb_context_new in -lxkbcommon... yes<br>
&gt;=C2=A0 =C2=A0 checking for wayland-egl.h... yes<br>
&gt;=C2=A0 =C2=A0 checking for wl_egl_window_create in -lwayland-egl... yes=
<br>
&gt;=C2=A0 =C2=A0 configure: error: Wayland development files not found, th=
e Wayland<br>
&gt;=C2=A0 =C2=A0 =C2=A0 driver won&#39;t be supported.<br>
&gt;=C2=A0 =C2=A0 This is an error since --with-wayland was requested.<br>
&gt; <br>
&gt; Every other term of that test passes; only XKBREGISTRY_LIBS is empty, =
so<br>
&gt; wine and wayland together could not be built on any architecture.<br>
&gt; <br>
&gt; Gated on BR2_PACKAGE_LIBXML2 rather than turned on outright, because<b=
r>
&gt; meson.build takes dependency(&#39;libxml-2.0&#39;) unconditionally onc=
e<br>
&gt; enable-xkbregistry is set, so a target without libxml2 would fail to<b=
r>
&gt; configure.<br>
&gt; <br>
&gt; Regarding since when this is broken, three pieces had to come together=
:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- libxkbcommon has passed -Denable-xkbregistry=3Dfalse sin=
ce commit<br>
&gt;=C2=A0 =C2=A0 =C2=A01791bc30a5 (&quot;package/libxkbcommon: bump versio=
n to 1.0.1&quot;, Sep 2020),<br>
&gt;=C2=A0 =C2=A0 =C2=A0i.e. Buildroot 2020.11. libxkbregistry has therefor=
e never been built<br>
&gt;=C2=A0 =C2=A0 =C2=A0in Buildroot.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- wine&#39;s configure gained the XKBREGISTRY_LIBS term in=
 its Wayland<br>
&gt;=C2=A0 =C2=A0 =C2=A0test in wine 9.0, with upstream commit d64ea8e4a6c9=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0(&quot;winewayland.drv: Enumerate Xkb layouts and c=
reate matching HKL.&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Nov 2023).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- <a href=3D"http://wine.mk" rel=3D"noreferrer" target=3D"=
_blank">wine.mk</a> started passing --with-wayland in commit 7cb49e7712<br>
&gt;=C2=A0 =C2=A0 =C2=A0(&quot;package/wine: bump to version 9.19&quot;, Oc=
t 2024), which is what turns<br>
&gt;=C2=A0 =C2=A0 =C2=A0the missing XKBREGISTRY_LIBS from a notice into a h=
ard error.<br>
&gt; <br>
&gt; The breakage therefore dates from Buildroot 2024.11, and every branch<=
br>
&gt; since is affected, including the LTS one: 2025.02.x carries wine 10.0,=
<br>
&gt; whose configure has the XKBREGISTRY_LIBS check, together with<br>
&gt; libxkbcommon 1.9.2 built with -Denable-xkbregistry=3Dfalse, and its <a=
 href=3D"http://wine.mk" rel=3D"noreferrer" target=3D"_blank">wine.mk</a><b=
r>
&gt; passes --with-wayland. 2025.05.x and 2025.08.x are in the same state.<=
br>
&gt; A backport to 2025.02.x is thus needed.<br>
&gt; <br>
&gt; Signed-off-by: Alsey Coleman Miller &lt;<a href=3D"mailto:alseycmiller=
@gmail.com" target=3D"_blank">alseycmiller@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Notes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Changes since v1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Extend the commit log to document since wh=
en the problem exists, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0whether the 2025.02.x LTS branch is a=
ffected (suggested by Thomas<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Petazzoni). No change to the code.<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0package/libxkbcommon/<a href=3D"http://libxkbcommon.mk" re=
l=3D"noreferrer" target=3D"_blank">libxkbcommon.mk</a> | 10 ++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/libxkbcommon/<a href=3D"http://libxkbcommon.mk" r=
el=3D"noreferrer" target=3D"_blank">libxkbcommon.mk</a> b/package/libxkbcom=
mon/<a href=3D"http://libxkbcommon.mk" rel=3D"noreferrer" target=3D"_blank"=
>libxkbcommon.mk</a><br>
&gt; index 21a2b937ef..406affe401 100644<br>
&gt; --- a/package/libxkbcommon/<a href=3D"http://libxkbcommon.mk" rel=3D"n=
oreferrer" target=3D"_blank">libxkbcommon.mk</a><br>
&gt; +++ b/package/libxkbcommon/<a href=3D"http://libxkbcommon.mk" rel=3D"n=
oreferrer" target=3D"_blank">libxkbcommon.mk</a><br>
&gt; @@ -12,8 +12,14 @@ LIBXKBCOMMON_CPE_ID_VENDOR =3D xkbcommon<br>
&gt;=C2=A0 =C2=A0LIBXKBCOMMON_INSTALL_STAGING =3D YES<br>
&gt;=C2=A0 =C2=A0LIBXKBCOMMON_DEPENDENCIES =3D host-bison host-flex<br>
&gt;=C2=A0 =C2=A0LIBXKBCOMMON_CONF_OPTS =3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0-Denable-docs=3Dfalse \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0-Denable-xkbregistry=3Dfalse<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-Denable-docs=3Dfalse<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_LIBXML2),y)<br>
&gt; +LIBXKBCOMMON_CONF_OPTS +=3D -Denable-xkbregistry=3Dtrue<br>
&gt; +LIBXKBCOMMON_DEPENDENCIES +=3D libxml2<br>
&gt; +else<br>
&gt; +LIBXKBCOMMON_CONF_OPTS +=3D -Denable-xkbregistry=3Dfalse<br>
&gt; +endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0ifeq ($(BR2_PACKAGE_XORG7),y)<br>
&gt;=C2=A0 =C2=A0LIBXKBCOMMON_CONF_OPTS +=3D -Denable-x11=3Dtrue<br>
<br>
</blockquote></div>

--000000000000d21b550658de97d4--

--===============2285761922175242555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2285761922175242555==--
