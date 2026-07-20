Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2583C4451B
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 09:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70A2A80B84;
	Mon, 20 Jul 2026 09:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCmNfnKuHWQ7; Mon, 20 Jul 2026 09:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D0B880BAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784538045;
	bh=jrAcy9RK1LoTzv6PYKwwJVifCXWsRj1WP0VRp724ygc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ft8IXTbzRCg8PfQvYUhCrcsvbyeNEhE8SYWDYnAnNDujzu9ZVcbtecuGPQaKBZSuS
	 nbPocx5w1/CRHJLbpqOEeXpKHXRShQ8dRltW/q4ef6yAnc6gs+9AYtvBZ1TSRE6EMx
	 8Rgszl8NWmCna5LdtWkY2Kpr4r36zARZzOGqmY4CMdFxd5QYENNu9LI79QX4XO31O9
	 RbP1iWV/uhZjuX2laO1jC+wcQ/iUGLfZ94PcJDAKnF3HVNJxpw/SuLQbtiwC9RANuC
	 6Iocz/ADdXz3HGWxdqtuzxVvKT0LtbZAD2vgZtx+cHPNQwuoMsy2XYxLk2xzfXpVFx
	 m/eaHSBywJA9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D0B880BAD;
	Mon, 20 Jul 2026 09:00:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 019D3206
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 09:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E78DD400AB
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 09:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cU6X6fV0JNMP for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 09:00:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8286A40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8286A40025
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8286A40025
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 09:00:42 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-44caeb973b3so6010569fac.1
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 02:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784538041; cv=none;
 d=google.com; s=arc-20260327;
 b=kVsJX9jvvO7Nfke40AXpWKgnPiFda2cj4Z038Q+ROWl5Y099OHzL7K1YVv6lu7Fes5
 8+ltknhiSeAJ3H8pYnnc1kIQRe17d7UaIwgoOrnLOMUolUtBt9XNVchjkgx916ijUkj2
 GSS9Qer6mZ21lXFdKexX3/jluGObTp50fjJ9YAZgKBakDbLZx5mtLHixwAMa25NwYP3Z
 2CV0woicY8UgvKD2CxXtSMyvJbrF3aOsvnYE6qAzdoFI/d1mDoUVaeBqLb8BgMEusJxU
 qq7w9EINk8NTsgdGQDKk6B5EX4J5mzN1PoYf3V6mlORK3af05sEcbRxzOo0ZBpIWs5zj
 6WLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0xkJKZFyinCUa0S8tJ2jvdHVugsubFgTb4kNY+krFbk=;
 fh=siEEGlK4OxgQsxxDJxK74FwhxxtTUd9xjx4ss01wdDI=;
 b=fJqNPVEPOVhPj7mRXZczoeCp29bq4GXRcMn71k/1rKdO74k+Otwub1Rwm3Ihhc3SyA
 qLLFO9spLOAyUOiphi3/7zRWyHQLHHLCcvq8G5N60e34tXI3ic5iMBojDhlie8WCNDqK
 EQIkqR6nTk5ZrtUitTiBMV8fJ1gUypoHFeQKEjmn6muXwL50fznq4SzS3TqTum1IvXU2
 hkZXwMUxPbhMfcMKW9Nw9mtP4K2Whqj9m2P7pSkrtsJuB3T3IIJNy13yuoxq2BAz/ZA6
 oz00bqNZLf01sKGSDqBm5OxCbTZ/b/J2DRbELVlurfzpQMZD64F2LuYXUcv3ZOMZF3gy
 wU0Q==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784538041; x=1785142841;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=0xkJKZFyinCUa0S8tJ2jvdHVugsubFgTb4kNY+krFbk=;
 b=FawMKBauCS0UJ6gCKI7f8ZyA1p5/AvyLUMRWNOT0Gmxzl7HqA8cR4u2vnf0EWMHGfu
 XxbFgENKeapfiuhoL7o4eARXwi751CQ02HREe+YqJBHwjYK8vdKu09lnd/SMKQlU3/di
 tFcxvezddwExAg0H/LP64duyDOZ7rtaYt4te6CVcQE9ReDgeRcOt2iAljviNSrFNe0PE
 ORDVHGvlfufV3LGzo70fgzcOlmv5ZICpVjhcxr2dVWNUpintmooS0cgkL7TIuBWURz6e
 iWENIQY1+ZRiSr2vglKqwXyashdjBXKwTc1Esq9hF0nadr7UFRJ8FTxdldQc02LWNPZ0
 R10w==
X-Gm-Message-State: AOJu0YyjlXCxbytuRBGnQKzSzHCQ2X76pM0Grv+hS61QJCVSrEhxnIP/
 YAo9kEhakGc1jfyaCS6Eha5uERdA6Xzoo/KPSPWhMdDEjoNrWT1eensLXrgJ0H7k/8p6GiVjxO+
 5dNvWKV9I9C0hUz6wcQGs9kHGRGKEguqc57/BAKcL82r/Lp7UyoTUByQ=
X-Gm-Gg: AfdE7ckPthL9mgccRGqeHmCqPzd19+PaggYovAjBGLVH6inzrGmy8gekML3wkb+OU6h
 rD10P7+HcANJloUR/pcBYBB5pAIzUIoQc5TgDi0VYDfakl0t8iRiM6zSttjZWooz+C/TwsrLaLf
 WupCz8R0uzR4be8NNzfH5ADCkf+KdciW3YilC2Uo8aQ9FavpYn9nrMnJ6w5qkDo9tpAvAXx7F7/
 TY2S8NoTNLj9D0OrW8Q9HyyDPOcqZGYi+oeA/PSNc5doSS9Y7mcXTMZfwMuFYhAh4Qq9rzbmGy2
 kW6CEqkGs6eDmfyYv9Rqekf2FkHoAcvi7gj4ea7ZuUOt3nl9imYobA24r9nlSn/ezkQQ5LwODyf
 zBQ==
X-Received: by 2002:a05:6870:290:b0:448:558c:d850 with SMTP id
 586e51a60fabf-456904bee0cmr5777733fac.43.1784538041065; Mon, 20 Jul 2026
 02:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260717093249.2183039-1-andrea.ricchi@amarulasolutions.com>
 <10790734da8d04317e5e8a78fe12030c@free.fr>
In-Reply-To: <10790734da8d04317e5e8a78fe12030c@free.fr>
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Mon, 20 Jul 2026 11:00:29 +0200
X-Gm-Features: AUfX_my8AxbulWFtS2uD4uDJ9OXcW0P12gYhEe7P0SHNRnAXt2H_y2cGH2BaFi8
Message-ID: <CABNF3=YJ4+mUh1tpnYcjk=J+uTRt8+2+izPNdRUL0WP4WbioWQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784538041; x=1785142841;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0xkJKZFyinCUa0S8tJ2jvdHVugsubFgTb4kNY+krFbk=;
 b=hYZnsILAOvFiDAciU4eP3vgPg9qJewR5fFIbwg9amxUUGACozTu62sF0yvYvZ+DgPG
 xXbvo4tXWjLJN/HOYatfkjanjXDpW0XBis9F0utgg2j+n5X/YVqk/qK5i0ioIpESlZcV
 qAdhZQoQa+trHaH0cItOEzn0lviYGKhMI8w9s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hYZnsILA
Subject: Re: [Buildroot] [PATCH v2] package/libcppconnman: add new package
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
Content-Type: multipart/mixed; boundary="===============1980826562888432947=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1980826562888432947==
Content-Type: multipart/alternative; boundary="00000000000006b23306570724c5"

--00000000000006b23306570724c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks a lot for the review.

I am currently fixing the issues reported, including the build failures and
the missing readline dependency for the examples. I will send the v3 patch
as soon as it is ready.

Thanks,

Andrea Ricchi
Embedded Software Engineer
M. +39 333 775 4973
andrea.ricchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com



On Sun, Jul 19, 2026 at 3:16=E2=80=AFPM Julien Olivain <ju.o@free.fr> wrote=
:

> Hi Andrea,
>
> Thanks for the patch.
>
> The package  introduces build failures for some toolchains. See:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2688533526
>
> You can reproduce locally with the command:
> utils/test-pkg -a -p libcppconnman
>
> I have another comment, see below.
>
> On 17/07/2026 11:32, Andrea Ricchi wrote:
> > libcppconnman is a C++ library that provides an easy-to-use API
> > to communicate with ConnMan over D-Bus using GDBus.
> >
> > https://github.com/amarula/libcppconnman
> >
> > Also add myself to DEVELOPERS for this package.
> >
> > Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
> > ---
> > Changes v1 -> v2:
> >   - add missing libcppconnman entry in package/Config.in
> >   - merge the DEVELOPERS addition into this patch
> >
> >  DEVELOPERS                               |  1 +
> >  package/Config.in                        |  1 +
> >  package/libcppconnman/Config.in          | 26 ++++++++++++++++++++++++
> >  package/libcppconnman/libcppconnman.hash |  3 +++
> >  package/libcppconnman/libcppconnman.mk   | 24 ++++++++++++++++++++++
> >  5 files changed, 55 insertions(+)
> >  create mode 100644 package/libcppconnman/Config.in
> >  create mode 100644 package/libcppconnman/libcppconnman.hash
> >  create mode 100644 package/libcppconnman/libcppconnman.mk
> >
> [...]
> > diff --git a/package/libcppconnman/Config.in
> > b/package/libcppconnman/Config.in
> > new file mode 100644
> > index 0000000000..19dc0bbd2d
> > --- /dev/null
> > +++ b/package/libcppconnman/Config.in
> > @@ -0,0 +1,26 @@
> > +config BR2_PACKAGE_LIBCPPCONNMAN
> > +     bool "libcppconnman"
> > +     depends on BR2_INSTALL_LIBSTDCPP
> > +     depends on BR2_USE_WCHAR # libglib2
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> > +     depends on BR2_USE_MMU # libglib2
> > +     select BR2_PACKAGE_LIBGLIB2
> > +     help
> > +       libcppconnman provide easy to use C++ API to communicate
> > +       with ConnMan via the DBus using GDBus.
> > +
> > +       https://amarula.github.io/libcppconnman/
> > +
> > +comment "libcppconnman needs a toolchain w/ C++, wchar, threads"
> > +     depends on BR2_USE_MMU
> > +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> > +             !BR2_TOOLCHAIN_HAS_THREADS
> > +
> > +if BR2_PACKAGE_LIBCPPCONNMAN
> > +
> > +config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
> > +     bool "libcppconnman example"
>
> When configuring with examples, package build configuration fails with
> a missing readline library. You can reproduce with:
>
> cat >.config <<EOF
> BR2_aarch64=3Dy
> BR2_TOOLCHAIN_EXTERNAL=3Dy
> BR2_PACKAGE_LIBCPPCONNMAN=3Dy
> BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE=3Dy
> EOF
> make olddefconfig
> make libcppconnman
>
> Could you add this missing dependency (both in Config.in and in the .mk
> file)
> please?
>
> > +     help
> > +       Compile CLI example.
> > +
> > +endif
>
> Could you send an updated patch fixing those issues, please?
>
> Best regards,
>
> Julien.
>

--00000000000006b23306570724c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Julien,<br><br>Thanks a lot for the review.<br><br>I am=
 currently fixing the issues reported, including the build failures and the=
 missing readline dependency for the examples. I will send the v3 patch as =
soon as it is ready.<br><br>Thanks,<br><div><div dir=3D"ltr" class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p style=3D=
"color:rgb(0,0,0);font-family:&quot;Times New Roman&quot;;font-size:medium;=
margin-bottom:10px!important"><span style=3D"font-weight:700"><span style=
=3D"font-size:14px">Andrea Ricchi</span></span><br><span style=3D"font-size=
:12px">Embedded Software Engineer<br>M. +39 333 775 4973<br><a href=3D"mail=
to:andrea.ricchi@amarulasolutions.com" target=3D"_blank">andrea.ricchi@amar=
ulasolutions.com</a></span><br><span style=3D"font-size:12px;color:rgb(241,=
194,50)">=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95</span=
><br><span style=3D"font-size:12px"><span style=3D"font-weight:700">Amarula=
 Solutions SRL</span><br>=C2=A0Via Felice Cavallotti 25D, 41012 Carpi, MO, =
IT<br><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@a=
marulasolutions.com</a><br><a href=3D"http://www.amarulasolutions.com/" tar=
get=3D"_blank">www.amarulasolutions.com</a></span><br></p><p></p></div></di=
v></div><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 19, 2026 at 3:16=E2=80=AFPM J=
ulien Olivain &lt;<a href=3D"mailto:ju.o@free.fr">ju.o@free.fr</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Andrea,<br=
>
<br>
Thanks for the patch.<br>
<br>
The package=C2=A0 introduces build failures for some toolchains. See:<br>
<a href=3D"https://gitlab.com/jolivain/buildroot/-/pipelines/2688533526" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/jolivain/buildroot/-/=
pipelines/2688533526</a><br>
<br>
You can reproduce locally with the command:<br>
utils/test-pkg -a -p libcppconnman<br>
<br>
I have another comment, see below.<br>
<br>
On 17/07/2026 11:32, Andrea Ricchi wrote:<br>
&gt; libcppconnman is a C++ library that provides an easy-to-use API<br>
&gt; to communicate with ConnMan over D-Bus using GDBus.<br>
&gt; <br>
&gt; <a href=3D"https://github.com/amarula/libcppconnman" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/amarula/libcppconnman</a><br>
&gt; <br>
&gt; Also add myself to DEVELOPERS for this package.<br>
&gt; <br>
&gt; Signed-off-by: Andrea Ricchi &lt;<a href=3D"mailto:andrea.ricchi@amaru=
lasolutions.com" target=3D"_blank">andrea.ricchi@amarulasolutions.com</a>&g=
t;<br>
&gt; ---<br>
&gt; Changes v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0- add missing libcppconnman entry in package/Config.in<br>
&gt;=C2=A0 =C2=A0- merge the DEVELOPERS addition into this patch<br>
&gt; <br>
&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 package/libcppconnman/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 26 ++++++++++++++++++++++++<br>
&gt;=C2=A0 package/libcppconnman/libcppconnman.hash |=C2=A0 3 +++<br>
&gt;=C2=A0 package/libcppconnman/<a href=3D"http://libcppconnman.mk" rel=3D=
"noreferrer" target=3D"_blank">libcppconnman.mk</a>=C2=A0 =C2=A0| 24 ++++++=
++++++++++++++++<br>
&gt;=C2=A0 5 files changed, 55 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/libcppconnman/Config.in<br>
&gt;=C2=A0 create mode 100644 package/libcppconnman/libcppconnman.hash<br>
&gt;=C2=A0 create mode 100644 package/libcppconnman/<a href=3D"http://libcp=
pconnman.mk" rel=3D"noreferrer" target=3D"_blank">libcppconnman.mk</a><br>
&gt; <br>
[...]<br>
&gt; diff --git a/package/libcppconnman/Config.in <br>
&gt; b/package/libcppconnman/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..19dc0bbd2d<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/libcppconnman/Config.in<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +config BR2_PACKAGE_LIBCPPCONNMAN<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;libcppconnman&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # libglib2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # libglib2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBGLIB2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0libcppconnman provide easy to use C++ API =
to communicate<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0with ConnMan via the DBus using GDBus.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://amarula.github.io/libcp=
pconnman/" rel=3D"noreferrer" target=3D"_blank">https://amarula.github.io/l=
ibcppconnman/</a><br>
&gt; +<br>
&gt; +comment &quot;libcppconnman needs a toolchain w/ C++, wchar, threads&=
quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCH=
AR || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_HAS_TH=
READS<br>
&gt; +<br>
&gt; +if BR2_PACKAGE_LIBCPPCONNMAN<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;libcppconnman example&quot;<br>
<br>
When configuring with examples, package build configuration fails with<br>
a missing readline library. You can reproduce with:<br>
<br>
cat &gt;.config &lt;&lt;EOF<br>
BR2_aarch64=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
BR2_PACKAGE_LIBCPPCONNMAN=3Dy<br>
BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE=3Dy<br>
EOF<br>
make olddefconfig<br>
make libcppconnman<br>
<br>
Could you add this missing dependency (both in Config.in and in the .mk <br=
>
file)<br>
please?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Compile CLI example.<br>
&gt; +<br>
&gt; +endif<br>
<br>
Could you send an updated patch fixing those issues, please?<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--00000000000006b23306570724c5--

--===============1980826562888432947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1980826562888432947==--
