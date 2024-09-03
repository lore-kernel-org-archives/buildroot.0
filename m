Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60C4CD13CF
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 09:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6847580E75;
	Tue,  3 Sep 2024 09:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmJ8cSG5sUoP; Tue,  3 Sep 2024 09:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2221380E84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2221380E84;
	Tue,  3 Sep 2024 09:03:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5371BF34B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 09:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C8BD40025
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 09:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0fcjCcR7wuR for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 09:03:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1049040226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1049040226
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1049040226
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 09:03:35 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4fd142a798eso1420240e0c.3
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 02:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725354214; x=1725959014;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J+gy2HtnBlnaFqI97wO+DzT2+cAfDRv3z2gDl6uj/cg=;
 b=c8ciJ1f5YIYURklcWwNO1hosTzurK6x3ZnTM5zlEO1vLvKv66qVPUExYKEQb2izHUe
 ZS+NsN4mkiDahTkXkJ+RcksB5nhDY1qPw5kW3pDbxDk2BWqnVpoenQIUVh6ZouUZ5OJs
 lZDQDsfChCJxS0G2B2IUAPW5w/4JjD5z2EPau6KgPkgSBrd0VLNMUUP/UiWUnRPiu+EV
 NadbNgcf3Qiqq4coijJoANTJZ3OMhASJ6rwkvmbuOo7wF06YbkV40oxYbVkMaAKMJUg3
 3WH8RR/sX1mYqXHfiU0EJSxPNbQsajBdQvmb0CwEyYGTGs35RQeoM7KiPE/MBHyT7YYx
 Xn6w==
X-Gm-Message-State: AOJu0Yz3Q6fqxx9g+JwljapTCVqoVVeyg9dlfOXwi03T37DWaDcSrAWH
 B44ErVaG0xjV0jUs5U/xOFT0yImnl0V8s6n+jcqJEvoN3v5KE64QuLctJbSrmoIpEScVSC3zUWA
 4mxLThs85gMO1eQSymgrpiKsphKkvhPSw4dICaw==
X-Google-Smtp-Source: AGHT+IHm7/1JXfwy1H0Xn9W7D8qdI7Nz5Cqm96MXVqcP8UjKXinzrFGl+voyycndrJ8efndD0qoOgSSqFfTLMzM0Jac=
X-Received: by 2002:a05:6122:1da8:b0:4ec:f8f0:7175 with SMTP id
 71dfb90a1353d-500de23ed80mr1393406e0c.11.1725354213858; Tue, 03 Sep 2024
 02:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240903073929.3717568-1-lars@underjord.io>
 <871q21i38z.fsf@tarshish>
 <CADqW+qn3TnF3LyUaYs3jfMSDT3wMC57q+r3gV0+UoOsxSVKYOA@mail.gmail.com>
 <87wmjtgnny.fsf@tarshish>
 <CADqW+qm-jkPWT29uFgMqEpur4Y5WpJZhrGUzjL5s==Nu6sySEw@mail.gmail.com>
 <87seuhgm7t.fsf@tarshish>
In-Reply-To: <87seuhgm7t.fsf@tarshish>
From: Lars Wikman <lars@underjord.io>
Date: Tue, 3 Sep 2024 11:03:23 +0200
Message-ID: <CADqW+qkb0PFTM482nwZrsrtVA_oDXTs3KzkprVxZ1zO0xqfCuQ@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1725354214; x=1725959014; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J+gy2HtnBlnaFqI97wO+DzT2+cAfDRv3z2gDl6uj/cg=;
 b=DxcVdzGt/X78/WW77yM+wEFLbXyKyAtXflPoKDxzU7DTm2jg0NMrdq9tk96xE4Vvaj
 4NtfNw5rignlg7gtsoB7uyuExt2yeQiNs4bjNdjTxPPcfswVbqB+9SGa+Cz8ndWwlRuF
 MCLSUcZ1Uyehdjhepwr4UPMjSGSiIMa70M4/Dvm0djOAszgRBag5Ar8NfaFxi+nyYYhM
 4e7R+RxlgNfHIGW3O2NJ7ki3rzm0U/nGEUP7agpaHwMqxkXKMoogDGjqaaWtO7/MwuZY
 2iAT6cd8lvuerI0tZQYUoGDZqv4EHZMeENDO0KQG8eGPto3q8rzmwWRrecoYQnntoXCS
 94xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=DxcVdzGt
Subject: Re: [Buildroot] [PATCH v2] package/wpa_supplicant: add Smart card
 option
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8080609658379979164=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8080609658379979164==
Content-Type: multipart/alternative; boundary="0000000000000779120621335540"

--0000000000000779120621335540
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Great. Appreciate the clarification :)

-L

On Tue, Sep 3, 2024 at 10:44=E2=80=AFAM Baruch Siach <baruch@tkos.co.il> wr=
ote:

> Hi Lars,
>
> On Tue, Sep 03 2024, Lars Wikman wrote:
> > This was the only initial assignment for DISABLE being made. And now
> > it is conditional on the new option. What would be the preferred way
> > to do it?
> >
> > Can DISABLE be left blank? Or left out until it is conditionally set?
> >
> > Happy to do it either way, it was not obvious to me how it should be
> > handled so I did this.
>
> Just remove the initial assignment as you did. No need to initialize to
> blank. This is the common convention in Buildroot.
>
> Thanks,
> baruch
>
> > On Tue, 3 Sep 2024 at 10:13, Baruch Siach <baruch@tkos.co.il> wrote:
> >  On Tue, Sep 03 2024, Lars Wikman wrote:
> >  > The existing line was =3D as it was the first reference to
> WPA_SUPPLICANT_CONFIG_DISABLE.
> >  > So I kept it that way.
> >
> >  The existing line is first assignment that initializes
> >  WPA_SUPPLICANT_CONFIG_DISABLE. All initial assignments use =3D in this
> >  file and others.
> >
> >  Following conditional assignments should only add to existing value, n=
ot
> >  overwrite it.
> >
> >  baruch
> >
> >  > Happy to change it if I should still. I'm not particularly used to
> >  > these files or conventions.
> >  >
> >  > - Lars
> >  >
> >  > On Tue, Sep 3, 2024 at 9:51=E2=80=AFAM Baruch Siach <baruch@tkos.co.=
il>
> wrote:
> >  >  On Tue, Sep 03 2024, Lars Wikman wrote:
> >  >  > diff --git a/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=
=B8=8F=E2=9A=A0=EF=B8=8F
> b/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=8F=E2=9A=A0=EF=
=B8=8F
> >  >  > index 984959f679..a7b7800c99 100644
> >  >  > --- a/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=8F=
=E2=9A=A0=EF=B8=8F
> >  >  > +++ b/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=8F=
=E2=9A=A0=EF=B8=8F
> >  >  > @@ -24,8 +24,11 @@ WPA_SUPPLICANT_CONFIG_ENABLE =3D \
> >  >  >       CONFIG_INTERNAL_LIBTOMMATH \
> >  >  >       CONFIG_MATCH_IFACE
> >  >  >
> >  >  > -WPA_SUPPLICANT_CONFIG_DISABLE =3D \
> >  >  > -     CONFIG_SMARTCARD
> >  >  > +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)
> >  >  > +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_SMARTCARD
> >  >  > +else
> >  >  > +WPA_SUPPLICANT_CONFIG_DISABLE =3D CONFIG_SMARTCARD
> >  >
> >  >  Should be +=3D here. Otherwise WPA_SUPPLICANT_CONFIG_DISABLE is
> >  >  overwritten.
> >  >
> >  >  baruch
> >  >
> >  >  > +endif
> >  >  >
> >  >  >  # libnl-3 needs -lm (for rint) and -lpthread if linking statical=
ly
> >  >  >  # And library order matters hence stick -lnl-3 first since it's
> appended
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =3D}------------------------------------------------ooO--U--Ooo----------=
--{=3D
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>

--0000000000000779120621335540
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>Great. Appreciate the clarification =
:)</div><div><br></div><div>-L</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 3, 2024 at 10:44=E2=80=AFAM=
 Baruch Siach &lt;<a href=3D"mailto:baruch@tkos.co.il">baruch@tkos.co.il</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi =
Lars,<br>
<br>
On Tue, Sep 03 2024, Lars Wikman wrote:<br>
&gt; This was the only initial assignment for DISABLE being made. And now<b=
r>
&gt; it is conditional on the new option. What would be the preferred way<b=
r>
&gt; to do it?<br>
&gt;<br>
&gt; Can DISABLE be left blank? Or left out until it is conditionally set?<=
br>
&gt;<br>
&gt; Happy to do it either way, it was not obvious to me how it should be<b=
r>
&gt; handled so I did this.<br>
<br>
Just remove the initial assignment as you did. No need to initialize to<br>
blank. This is the common convention in Buildroot.<br>
<br>
Thanks,<br>
baruch<br>
<br>
&gt; On Tue, 3 Sep 2024 at 10:13, Baruch Siach &lt;<a href=3D"mailto:baruch=
@tkos.co.il" target=3D"_blank">baruch@tkos.co.il</a>&gt; wrote:<br>
&gt;=C2=A0 On Tue, Sep 03 2024, Lars Wikman wrote:<br>
&gt;=C2=A0 &gt; The existing line was =3D as it was the first reference to =
WPA_SUPPLICANT_CONFIG_DISABLE.<br>
&gt;=C2=A0 &gt; So I kept it that way.<br>
&gt;<br>
&gt;=C2=A0 The existing line is first assignment that initializes<br>
&gt;=C2=A0 WPA_SUPPLICANT_CONFIG_DISABLE. All initial assignments use =3D i=
n this<br>
&gt;=C2=A0 file and others.<br>
&gt;<br>
&gt;=C2=A0 Following conditional assignments should only add to existing va=
lue, not<br>
&gt;=C2=A0 overwrite it.<br>
&gt;<br>
&gt;=C2=A0 baruch<br>
&gt;<br>
&gt;=C2=A0 &gt; Happy to change it if I should still. I&#39;m not particula=
rly used to<br>
&gt;=C2=A0 &gt; these files or conventions.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; - Lars<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; On Tue, Sep 3, 2024 at 9:51=E2=80=AFAM Baruch Siach &lt;<a =
href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruch@tkos.co.il</a>&g=
t; wrote:<br>
&gt;=C2=A0 &gt;=C2=A0 On Tue, Sep 03 2024, Lars Wikman wrote:<br>
&gt;=C2=A0 &gt;=C2=A0 &gt; diff --git a/package/wpa_supplicant/<a href=3D"h=
ttp://wpa_supplicant.mk" rel=3D"noreferrer" target=3D"_blank">wpa_supplican=
t.mk</a>=E2=9A=A0=EF=B8=8F=E2=9A=A0=EF=B8=8F b/package/wpa_supplicant/<a hr=
ef=3D"http://wpa_supplicant.mk" rel=3D"noreferrer" target=3D"_blank">wpa_su=
pplicant.mk</a>=E2=9A=A0=EF=B8=8F=E2=9A=A0=EF=B8=8F<br>
&gt;=C2=A0 &gt;=C2=A0 &gt; index 984959f679..a7b7800c99 100644<br>
&gt;=C2=A0 &gt;=C2=A0 &gt; --- a/package/wpa_supplicant/<a href=3D"http://w=
pa_supplicant.mk" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a=
>=E2=9A=A0=EF=B8=8F=E2=9A=A0=EF=B8=8F<br>
&gt;=C2=A0 &gt;=C2=A0 &gt; +++ b/package/wpa_supplicant/<a href=3D"http://w=
pa_supplicant.mk" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a=
>=E2=9A=A0=EF=B8=8F=E2=9A=A0=EF=B8=8F<br>
&gt;=C2=A0 &gt;=C2=A0 &gt; @@ -24,8 +24,11 @@ WPA_SUPPLICANT_CONFIG_ENABLE =
=3D \<br>
&gt;=C2=A0 &gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_INTERNAL_LIBTOM=
MATH \<br>
&gt;=C2=A0 &gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_MATCH_IFACE<br>
&gt;=C2=A0 &gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt;=C2=A0 &gt; -WPA_SUPPLICANT_CONFIG_DISABLE =3D \<br>
&gt;=C2=A0 &gt;=C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0CONFIG_SMARTCARD<br>
&gt;=C2=A0 &gt;=C2=A0 &gt; +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y=
)<br>
&gt;=C2=A0 &gt;=C2=A0 &gt; +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_SMARTC=
ARD<br>
&gt;=C2=A0 &gt;=C2=A0 &gt; +else<br>
&gt;=C2=A0 &gt;=C2=A0 &gt; +WPA_SUPPLICANT_CONFIG_DISABLE =3D CONFIG_SMARTC=
ARD<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt;=C2=A0 Should be +=3D here. Otherwise WPA_SUPPLICANT_CONFIG_=
DISABLE is<br>
&gt;=C2=A0 &gt;=C2=A0 overwritten.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt;=C2=A0 baruch<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt;=C2=A0 &gt; +endif<br>
&gt;=C2=A0 &gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt;=C2=A0 &gt;=C2=A0 # libnl-3 needs -lm (for rint) and -lpthre=
ad if linking statically<br>
&gt;=C2=A0 &gt;=C2=A0 &gt;=C2=A0 # And library order matters hence stick -l=
nl-3 first since it&#39;s appended<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruc=
h@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"http://www.tkos.co.il"=
 rel=3D"noreferrer" target=3D"_blank">http://www.tkos.co.il</a> -<br>
</blockquote></div>

--0000000000000779120621335540--

--===============8080609658379979164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8080609658379979164==--
