Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE9ECA0EED
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 15:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41CC841428;
	Sat, 23 Aug 2025 15:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEFl9Evv_i6K; Sat, 23 Aug 2025 15:49:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9F3E41319
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9F3E41319;
	Sat, 23 Aug 2025 15:49:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4321071E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 299D041312
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZ33OfkEqPUD for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 15:49:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B3EC412D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B3EC412D4
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B3EC412D4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:49:20 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3eaff77982eso5027135ab.1
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 08:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755964160; x=1756568960;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wAPx8XsohykEkVT1J11Tzu4pCx+d4+FFm7t7x6Vfljo=;
 b=Uk2c4krSp3EfAhlKy1ns4XL6RIWZ8874zP6LZmABLOIbDp+dCQoWTmcMZbQouRj0Qe
 aob+yksxO+kjswCXyBNy5C6p8tWPKrbVCdtxvtxH6EZmquz4nDy/o+MpFFWjnwVMp5JM
 bM1g7sL/ReeItX5rqJr94Sy5cZnfHYY6WbCcrN4zwoJ5R4RNSLXClYEuXl5wpZHkUHWS
 7hw23kZr2DmdHsSFbPA4JkP4Ed0nBFBoDiY8jJKn7G9H3nDk8LRNz1lCHZi6mQ4HXteV
 EFKl380xP2Z+veQZa59OEi7sWVugEcTMnbBVYD/G9akDVXw9ttBLeFRDE51TedCZBkZG
 JvTg==
X-Gm-Message-State: AOJu0Yw34csyoz78lwDT9JRPiKbRmpXzi0eMDu9oV3oRhxiyOKNZF4PQ
 Smn1LboLcL6Jfd8cDne9RXr2KKQl2yW3N3JRgKP1j6HrSqJxQuz9mGbZJkvMofVq6uE3Lu1JB2l
 ROO9PrxdRkHwjPFKBaZiZO8o1Qm1Jtj4=
X-Gm-Gg: ASbGncsXF/nDZuJVCtLVxMsFcB2Hc7ITSpPb1XM+O1nZLvRr6gzJ4YbuyZ7lVnfPL0Z
 9otWk7hCyFnCuNw44yummQgbU0hsGS+iGasHGENY8nkG+A9cPT2gX+CqQTHZYU3Ke4NnJ18G/3X
 wLomBzwNiFOLPNH3yP0MZrsYwDykFagY9cNGbZXEALo/aevfyCUgqNNjTnkBsPoyMdUKtExbSgg
 toJ9CHz
X-Google-Smtp-Source: AGHT+IFQmuA74F/rV2bgcPyg2irXlkytAr40yS0fR1JHiSMls3j+hly7sveK91utzyWCS0XNylX6lI3gNxEJfZAJ/jk=
X-Received: by 2002:a05:6e02:144f:b0:3e3:ef79:5a8c with SMTP id
 e9e14a558f8ab-3e921a5c9b6mr99328485ab.14.1755964159635; Sat, 23 Aug 2025
 08:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
 <20250820163921.1968030-2-angelo.compagnucci@gmail.com>
 <20250822230831.078510ea@windsurf>
In-Reply-To: <20250822230831.078510ea@windsurf>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 23 Aug 2025 17:48:43 +0200
X-Gm-Features: Ac12FXzKel8I4Tof-YPyFxDXwmlqYnxi8hnii7gd72oF8_2JLK-Btfu1yJ0ywTM
Message-ID: <CA+TH9Vn_cix+qNWoHi9E49Cf8KTWkfu0A_kNwT_qh8j4-065gw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755964160; x=1756568960; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wAPx8XsohykEkVT1J11Tzu4pCx+d4+FFm7t7x6Vfljo=;
 b=l5bq1dOJSA899us9KwIdxLZ5n3sEpQHqIst4MllxpJ8bIJPxqWG1ks5aVNC3MwTxyX
 phQ718Ccr0u9ru/h27edVJLGSxPW+dBrNDYBcV7ctf/fpV3HJcxUEXA86rT6eyByc6pF
 vYFAAQ5Odb6Wiju1TUvqseNOx506VoEOlsuigZ13YhvVhd515+bHDUKHnVBLCcveXS6r
 ElAMKy6U7+00Se2ovIZfZWyU+NaGQP/k5Nka8OoOueLOybFOi8UZ4qP7P7ffFvUM9kRZ
 BJb5WrWh4mw0e5GP9iMkdHORta3MY8iYcVf+tar7AYINy3AYYpIV0UGoMxCBix/SS2xG
 cn2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l5bq1dOJ
Subject: Re: [Buildroot] [PATCH 1/4 v2] package/qpdf: bump to version 12.2.0
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
Content-Type: multipart/mixed; boundary="===============7363875891035619192=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7363875891035619192==
Content-Type: multipart/alternative; boundary="000000000000f93a13063d0a4302"

--000000000000f93a13063d0a4302
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 22 ago 2025 alle ore 23:08 Thomas Petazzoni <
thomas.petazzoni@bootlin.com> ha scritto:

> Hello Angelo,
>
> Thanks for this patch, which looks great. I have a few questions below.
>
> On Wed, 20 Aug 2025 18:39:18 +0200
> Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:
>
> > diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
> > index d479515789..2a4e7f3386 100644
> > --- a/package/qpdf/qpdf.mk
> > +++ b/package/qpdf/qpdf.mk
> > @@ -4,36 +4,30 @@
> >  #
> >
> ################################################################################
> >
> > -QPDF_VERSION = 10.5.0
> > -QPDF_SITE =
> http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
> > +QPDF_VERSION = 12.2.0
> > +QPDF_SITE =
> https://github.com/qpdf/qpdf/releases/download/v$(QPDF_VERSION)
> >  QPDF_INSTALL_STAGING = YES
> >  QPDF_LICENSE = Apache-2.0 or Artistic-2.0
> >  QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
> >  QPDF_CPE_ID_VALID = YES
> >  QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
> > +QPDF_SUPPORTS_IN_SOURCE_BUILD = NO
> >
> > -QPDF_CONF_OPTS = --with-random=/dev/urandom
> > -
> > -ifeq ($(BR2_USE_WCHAR),)
> > -QPDF_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DQPDF_NO_WCHAR_T"
>
> Are you confident that qpdf no builds properly in configurations with
> BR2_USE_WCHAR disabled, without anything special?
>

Ok, by the documentation it seems this is still valid

"You can disable use of ``wchar_t`` in qpdf's code by defining the
``QPDF_NO_WCHAR_T`` preprocessor symbol in your build (e.g. by
including ``-DQPDF_NO_WCHAR_T`` in ``CFLAGS`` and ``CXXFLAGS``)."

> -endif
> > +QPDF_CONF_OPTS = -DSKIP_OS_SECURE_RANDOM=ON \
> > +     -DUSE_IMPLICIT_CRYPTO=OFF -DREQUIRE_CRYPTO_NATIVE=ON
>
> What are these 3 options doing? -DSKIP_OS_SECURE_RANDOM=ON seems scary,
>

This one maps the old --with-random=/dev/urandom option. I'm not sure if
this is still needed honestly, we could try to remove it and see if it
fails in testing.


> and the other ones would benefit from a bit of explanation so we
> understand how it interacts with the options below to select crypto
> support.
>

Those two options are used to suppress the use of the internally downloaded
and built providers and instead use system ones.

>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
> > -QPDF_CONF_OPTS += --enable-crypto-gnutls
> > +QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_GNUTLS=ON
> >  QPDF_DEPENDENCIES += gnutls
> >  else
> > -QPDF_CONF_OPTS += --disable-crypto-gnutls
> > +QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_GNUTLS=OFF
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> > -QPDF_CONF_OPTS += --enable-crypto-openssl
> > +QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_OPENSSL=ON
> >  QPDF_DEPENDENCIES += openssl
> >  else
> > -QPDF_CONF_OPTS += --disable-crypto-openssl
> > -endif
> > -
> > -ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> > -QPDF_CONF_ENV += LIBS=-latomic
>
> This is no longer needed? Did you test building with a SPARC toolchain
> for example, which is known to be picky as all __atomic built-ins are
> implemented in libatomic?
>

CMakeLists.txt has:
set(CMAKE_REQUIRED_LIBRARIES atomic)
therefore cmake should take care of this.


>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

--000000000000f93a13063d0a4302
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno ven 2=
2 ago 2025 alle ore 23:08 Thomas Petazzoni &lt;<a href=3D"mailto:thomas.pet=
azzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; ha scritto:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Angelo,<br>
<br>
Thanks for this patch, which looks great. I have a few questions below.<br>
<br>
On Wed, 20 Aug 2025 18:39:18 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compagnucci@gmail.com" targ=
et=3D"_blank">angelo.compagnucci@gmail.com</a>&gt; wrote:<br>
<br>
&gt; diff --git a/package/qpdf/<a href=3D"http://qpdf.mk" rel=3D"noreferrer=
" target=3D"_blank">qpdf.mk</a> b/package/qpdf/<a href=3D"http://qpdf.mk" r=
el=3D"noreferrer" target=3D"_blank">qpdf.mk</a><br>
&gt; index d479515789..2a4e7f3386 100644<br>
&gt; --- a/package/qpdf/<a href=3D"http://qpdf.mk" rel=3D"noreferrer" targe=
t=3D"_blank">qpdf.mk</a><br>
&gt; +++ b/package/qpdf/<a href=3D"http://qpdf.mk" rel=3D"noreferrer" targe=
t=3D"_blank">qpdf.mk</a><br>
&gt; @@ -4,36 +4,30 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -QPDF_VERSION =3D 10.5.0<br>
&gt; -QPDF_SITE =3D <a href=3D"http://downloads.sourceforge.net/project/qpd=
f/qpdf/$(QPDF_VERSION)" rel=3D"noreferrer" target=3D"_blank">http://downloa=
ds.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)</a><br>
&gt; +QPDF_VERSION =3D 12.2.0<br>
&gt; +QPDF_SITE =3D <a href=3D"https://github.com/qpdf/qpdf/releases/downlo=
ad/v$(QPDF_VERSION)" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/qpdf/qpdf/releases/download/v$(QPDF_VERSION)</a><br>
&gt;=C2=A0 QPDF_INSTALL_STAGING =3D YES<br>
&gt;=C2=A0 QPDF_LICENSE =3D Apache-2.0 or Artistic-2.0<br>
&gt;=C2=A0 QPDF_LICENSE_FILES =3D LICENSE.txt Artistic-2.0<br>
&gt;=C2=A0 QPDF_CPE_ID_VALID =3D YES<br>
&gt;=C2=A0 QPDF_DEPENDENCIES =3D host-pkgconf zlib jpeg<br>
&gt; +QPDF_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
&gt;=C2=A0 <br>
&gt; -QPDF_CONF_OPTS =3D --with-random=3D/dev/urandom<br>
&gt; -<br>
&gt; -ifeq ($(BR2_USE_WCHAR),)<br>
&gt; -QPDF_CONF_ENV +=3D CXXFLAGS=3D&quot;$(TARGET_CXXFLAGS) -DQPDF_NO_WCHA=
R_T&quot;<br>
<br>
Are you confident that qpdf no builds properly in configurations with<br>
BR2_USE_WCHAR disabled, without anything special?<br></blockquote><div><br>=
</div><div>Ok, by the documentation it seems this is still valid</div><div>=
<br></div><div>&quot;You can disable use of ``wchar_t`` in qpdf&#39;s code =
by defining the<br>``QPDF_NO_WCHAR_T`` preprocessor symbol in your build (e=
.g. by<br>including ``-DQPDF_NO_WCHAR_T`` in ``CFLAGS`` and ``CXXFLAGS``).&=
quot;<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt; -endif<br>
&gt; +QPDF_CONF_OPTS =3D -DSKIP_OS_SECURE_RANDOM=3DON \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DUSE_IMPLICIT_CRYPTO=3DOFF -DREQUIRE_CRYPTO_NATI=
VE=3DON<br>
<br>
What are these 3 options doing? -DSKIP_OS_SECURE_RANDOM=3DON seems scary,<b=
r></blockquote><div><br></div><div>This one maps the old --with-random=3D/d=
ev/urandom option. I&#39;m not sure if this is still needed honestly, we co=
uld try to remove it and see if it fails in testing.<br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
and the other ones would benefit from a bit of explanation so we<br>
understand how it interacts with the options below to select crypto<br>
support.<br></blockquote><div><br></div><div>Those two options are used to =
suppress the use of the internally downloaded and built providers and inste=
ad use system ones.<br></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
&gt;=C2=A0 ifeq ($(BR2_PACKAGE_GNUTLS),y)<br>
&gt; -QPDF_CONF_OPTS +=3D --enable-crypto-gnutls<br>
&gt; +QPDF_CONF_OPTS +=3D -DREQUIRE_CRYPTO_GNUTLS=3DON<br>
&gt;=C2=A0 QPDF_DEPENDENCIES +=3D gnutls<br>
&gt;=C2=A0 else<br>
&gt; -QPDF_CONF_OPTS +=3D --disable-crypto-gnutls<br>
&gt; +QPDF_CONF_OPTS +=3D -DREQUIRE_CRYPTO_GNUTLS=3DOFF<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ifeq ($(BR2_PACKAGE_OPENSSL),y)<br>
&gt; -QPDF_CONF_OPTS +=3D --enable-crypto-openssl<br>
&gt; +QPDF_CONF_OPTS +=3D -DREQUIRE_CRYPTO_OPENSSL=3DON<br>
&gt;=C2=A0 QPDF_DEPENDENCIES +=3D openssl<br>
&gt;=C2=A0 else<br>
&gt; -QPDF_CONF_OPTS +=3D --disable-crypto-openssl<br>
&gt; -endif<br>
&gt; -<br>
&gt; -ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)<br>
&gt; -QPDF_CONF_ENV +=3D LIBS=3D-latomic<br>
<br>
This is no longer needed? Did you test building with a SPARC toolchain<br>
for example, which is known to be picky as all __atomic built-ins are<br>
implemented in libatomic?<br></blockquote><div><br></div><div>CMakeLists.tx=
t has:<br></div><div>set(CMAKE_REQUIRED_LIBRARIES atomic)</div><div>therefo=
re cmake should take care of this.<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Pr=
ofile: <a href=3D"http://it.linkedin.com/in/compagnucciangelo" target=3D"_b=
lank">http://it.linkedin.com/in/compagnucciangelo</a></div></div>

--000000000000f93a13063d0a4302--

--===============7363875891035619192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7363875891035619192==--
