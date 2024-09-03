Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4020BCD342E
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 08:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB1A440355;
	Tue,  3 Sep 2024 08:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmTeiKVrXW5b; Tue,  3 Sep 2024 08:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1770B401B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1770B401B7;
	Tue,  3 Sep 2024 08:00:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77A4A1BF414
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7237D401C4
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AN1nRpXhM4H for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 08:00:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06A9240170
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06A9240170
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06A9240170
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 08:00:12 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-4fce352bd28so1401285e0c.2
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 01:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725350411; x=1725955211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cPaFi/ojQgSsg2EkvkSOiucqQR5sOe83mXUA7Awi43Y=;
 b=R2Qdv9qogyLjTxF3Oq5kaadks4XBZvxhTIgXEV7tsycYrpIuelHNmgJ+Bs/GNBm015
 wOWNFsVAbND6onZrIDo14P5fJDevuVyz/On8m+UBIjQQG1S9bNEz1bovueP6VAPVlRj4
 ChIpJyxBdPTr2QRSiVn9jfMoQXOmQzpspCxAM6tI5VT0XXc2bsXZYlOy2Iy/q8Ih92DZ
 Gz6gEYDx2yBN5a/v8BOyYQGjzX3sey5F2HQbb54HXIt2z37Tez0yPn0DwbILFmLfrlc2
 8DO3JacYiedFaGZ/S8FzYne+rLKSgNgAjJbM6A7jfC2/0W8mEF3Go0xoFYEvXunvA3SY
 CeRQ==
X-Gm-Message-State: AOJu0YztwbfWmFWgFVl8DNcUN3Id9Dro4ZDtvA9hA0sSu5wH1735EHzm
 VDAABt45IOq+v0R7LZJNKCqHHRr9rDM3wB0de8/Q4qzxNbyoOzhG+w1HNZSzBIJ0Gn1/8VvMgdl
 ByXIjpWRfqeg1d1EWjY+nmBndcNKLDXj78MBFYuYeW2GnUEal
X-Google-Smtp-Source: AGHT+IFuNh70B3ul4JG7OnbJKMDoRFQCbEjygEYjFDJlvlkrFiDYZYQUvAvqnVlQFHMogavsF7pH4RJwyuaXpu1VebI=
X-Received: by 2002:a05:6122:3b06:b0:4f6:ae34:9659 with SMTP id
 71dfb90a1353d-5009ac36f2amr10833809e0c.5.1725350411265; Tue, 03 Sep 2024
 01:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240903073929.3717568-1-lars@underjord.io>
 <871q21i38z.fsf@tarshish>
In-Reply-To: <871q21i38z.fsf@tarshish>
From: Lars Wikman <lars@underjord.io>
Date: Tue, 3 Sep 2024 10:00:00 +0200
Message-ID: <CADqW+qn3TnF3LyUaYs3jfMSDT3wMC57q+r3gV0+UoOsxSVKYOA@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1725350411; x=1725955211; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cPaFi/ojQgSsg2EkvkSOiucqQR5sOe83mXUA7Awi43Y=;
 b=ku0/6+m60qb7CO4wfhcCyoaLmaN4tpR8DF11Blc4i1IbOtSfkfQRwyDkldteWFXjUw
 6eXrwoeeZBDPEIX1A+ZSZboqBnB9lFlLoAk2Vyw6bBxyYfTBXGnQKlL2pNWQQGyzDlG0
 8WJVt1JmpnKopxzOAH6+h7cHRZgOxx95ecWVOEleQJeXYrtuCymDJ5UmZDd8lT/mLFAh
 fD7C3bIl7XiTe0bv9pPAyrhpolbD7RPfjFmUQnLjI2Om32ReB80rYx5B8SXOZvMNPGUX
 HjrkgDfKdVNocQnT6j4qpxQknbqOVJ0pULnwD8vtrfmpO5Cwd0Nt7XHT1ZJvQ+kQzVkL
 2Hwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=ku0/6+m6
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
Content-Type: multipart/mixed; boundary="===============7904183619688146102=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7904183619688146102==
Content-Type: multipart/alternative; boundary="00000000000060820f06213272a9"

--00000000000060820f06213272a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baruch

The existing line was =3D as it was the first reference to
WPA_SUPPLICANT_CONFIG_DISABLE.
So I kept it that way.

Happy to change it if I should still. I'm not particularly used to these
files or conventions.

- Lars

On Tue, Sep 3, 2024 at 9:51=E2=80=AFAM Baruch Siach <baruch@tkos.co.il> wro=
te:

> Hi Lars,
>
> On Tue, Sep 03 2024, Lars Wikman wrote:
> > diff --git a/package/wpa_supplicant/wpa_supplicant.mk
> b/package/wpa_supplicant/wpa_supplicant.mk
> > index 984959f679..a7b7800c99 100644
> > --- a/package/wpa_supplicant/wpa_supplicant.mk
> > +++ b/package/wpa_supplicant/wpa_supplicant.mk
> > @@ -24,8 +24,11 @@ WPA_SUPPLICANT_CONFIG_ENABLE =3D \
> >       CONFIG_INTERNAL_LIBTOMMATH \
> >       CONFIG_MATCH_IFACE
> >
> > -WPA_SUPPLICANT_CONFIG_DISABLE =3D \
> > -     CONFIG_SMARTCARD
> > +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)
> > +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_SMARTCARD
> > +else
> > +WPA_SUPPLICANT_CONFIG_DISABLE =3D CONFIG_SMARTCARD
>
> Should be +=3D here. Otherwise WPA_SUPPLICANT_CONFIG_DISABLE is
> overwritten.
>
> baruch
>
> > +endif
> >
> >  # libnl-3 needs -lm (for rint) and -lpthread if linking statically
> >  # And library order matters hence stick -lnl-3 first since it's append=
ed
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =3D}------------------------------------------------ooO--U--Ooo----------=
--{=3D
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>

--00000000000060820f06213272a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Baruch<div><br></div><div>The existing line was =3D as =
it was the first reference to WPA_SUPPLICANT_CONFIG_DISABLE.</div><div>So I=
 kept it that way.</div><div><br></div><div>Happy to change it if I should =
still. I&#39;m not particularly used to these files or conventions.</div><d=
iv><br></div><div>- Lars</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Sep 3, 2024 at 9:51=E2=80=AFAM Baruch=
 Siach &lt;<a href=3D"mailto:baruch@tkos.co.il">baruch@tkos.co.il</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Lars,<b=
r>
<br>
On Tue, Sep 03 2024, Lars Wikman wrote:<br>
&gt; diff --git a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.m=
k" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> b/package/wpa=
_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=3D"noreferrer" target=
=3D"_blank">wpa_supplicant.mk</a><br>
&gt; index 984959f679..a7b7800c99 100644<br>
&gt; --- a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=
=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a><br>
&gt; +++ b/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=
=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a><br>
&gt; @@ -24,8 +24,11 @@ WPA_SUPPLICANT_CONFIG_ENABLE =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_INTERNAL_LIBTOMMATH \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_MATCH_IFACE<br>
&gt;=C2=A0 <br>
&gt; -WPA_SUPPLICANT_CONFIG_DISABLE =3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0CONFIG_SMARTCARD<br>
&gt; +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)<br>
&gt; +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_SMARTCARD<br>
&gt; +else<br>
&gt; +WPA_SUPPLICANT_CONFIG_DISABLE =3D CONFIG_SMARTCARD<br>
<br>
Should be +=3D here. Otherwise WPA_SUPPLICANT_CONFIG_DISABLE is<br>
overwritten.<br>
<br>
baruch<br>
<br>
&gt; +endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # libnl-3 needs -lm (for rint) and -lpthread if linking statical=
ly<br>
&gt;=C2=A0 # And library order matters hence stick -lnl-3 first since it&#3=
9;s appended<br>
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

--00000000000060820f06213272a9--

--===============7904183619688146102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7904183619688146102==--
