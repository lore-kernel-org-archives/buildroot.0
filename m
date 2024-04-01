Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8760ECD128D
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 15:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E6640629;
	Mon,  1 Apr 2024 15:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUx-ci7sIazy; Mon,  1 Apr 2024 15:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D486640621
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D486640621;
	Mon,  1 Apr 2024 15:11:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B37F41BF3C5
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 15:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACCEB81E00
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 15:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVR6ZIr_0sE1 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 15:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0141081DFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0141081DFF
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0141081DFF
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 15:11:36 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1e0d8403257so30948805ad.1
 for <buildroot@busybox.net>; Mon, 01 Apr 2024 08:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711984296; x=1712589096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dKKpFymtl3nA6Z3hIerK8Jz74zq/fN5JRZsjDITIVVQ=;
 b=X0ecHcDbbO7WbuUhxH/YBYlD9/DwrM+Cpw+fRWTTZsmxXRD8YdLKNOxOeOIYMIPCZN
 wCcPq8OpjpmjuoQ/NcZWsSNoaBJZWi+Gg4uC4b8s2PEtAOiMNOzXtN9RMDtOVhpOAoE5
 wzTYmqHuSvOjjtyOG7I546Xb0Lvo0a5EwjCb9wEQLRb+VafIuYHR7+KzQXVpVtXjCLXq
 m3xRfRsF1piL3e+/cOH8T0jb8gEtqsZ7fAEnqT30QIi1tkGA+SUZ4jw6aiBrV1tAEoMJ
 jyubFJmgVRONopjsDZ8srkVPi/CwxRM2WUl9p0B8R6m4TmQzdw+vju+xQtOZCz+zeMuU
 0qqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL8HJcSM5aHDO81Fdd9DuH0zIHPFWWGW2/IHIEVSaB9tIcu4qLMSaYMC4ZBlaIc/c87yotApGNTnT3ToAQeQ7VT866noA=
X-Gm-Message-State: AOJu0Yxlw9y0UijYZQb00YxgeK/LwU50A2j7z6CGD6yH2j/Kh7dhoSMO
 bW0s5yzsqnnQlY3SwJ09KrT6DVqrcUFXZSbtPOaT10ZGpWOskyBluDzV+JveVJmguG/Fqc3uL74
 Bxp3X1vnsncMzRovMyRBo/R6SMVTEZomueqOc
X-Google-Smtp-Source: AGHT+IFGKbhccJt07PToebJfuGncGojXaLh08qN1nPslCeAoR0x/1btRkdKethhQYzjE513ZveIOnvTDXu6NTclla0s=
X-Received: by 2002:a17:902:d40d:b0:1e0:8e7:310e with SMTP id
 b13-20020a170902d40d00b001e008e7310emr7768057ple.16.1711984295739; Mon, 01
 Apr 2024 08:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240328174052.8677-1-francois.perrad@gadz.org>
 <ZgrB_CpdJbJOmv3T@landeda>
In-Reply-To: <ZgrB_CpdJbJOmv3T@landeda>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 1 Apr 2024 17:11:24 +0200
Message-ID: <CAAE6iEVy2gvT4wH3Ow3OKzDDpFcR8+CuPtHo-Zz-7S2um_z67A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1711984296; x=1712589096; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dKKpFymtl3nA6Z3hIerK8Jz74zq/fN5JRZsjDITIVVQ=;
 b=G5oQufFLTHIWUmdDZj06tBG5ftf+lTSHXyGfBxFqwAzbJvRWdLtpF1IDb2/46X3mwX
 2OVX7kfwc7tx8rtbaR/euk6a5btueqkSvHPUOcNgnNGiJo5CSeA9QAd3TAOyc7NAvA4A
 9RO8ENRTKhlkIulwmveJi2rNCReIOieiQF0BF64NzwNnzSHYcoVsHDrXJpTcnnuxcHPq
 XpJkMQAw/Ujgo2GbgAMnLbqZK2GQi5sKqUNa2AmsntBU8SZI4C5/dT70SBDq5AK1zD0A
 k2vRkvcyHW+nJ3jwH8GCFovGIKrR4oPFWls51hWFVo5D4v1SSAYt1D3hmXZjtNBZ0i2r
 408A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=G5oQufFL
Subject: Re: [Buildroot] [PATCH] package/libressl: bump to version 3.8.4
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
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>
Content-Type: multipart/mixed; boundary="===============6574208711542094927=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6574208711542094927==
Content-Type: multipart/alternative; boundary="000000000000d01c5d06150a6750"

--000000000000d01c5d06150a6750
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 1 avr. 2024 =C3=A0 16:17, Yann E. MORIN <yann.morin.1998@free.fr> a
=C3=A9crit :

> Fran=C3=A7ois, All,
>
> On 2024-03-28 18:40 +0100, Francois Perrad spake thusly:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Again, yiour From and SoB do not match: fperrad@gmail.com vs.
> francois.perrad@gadz.org.
>

Yann,

them had never match since I contribute.
Is it a new rule ?

Fran=C3=A7ois


>
> This applies to other patches, too:
>
>     package/graphene: new package
>     package/libgtk4: new package
>     package/lmdb: new package
>     package/lua-lightningmdb: new package
>     package/lua-lgdbm: new package
>     package/lua-lsdbus: new package
>     package/libtommath: bump to version 1.3.0
>
> Can you fix and respin, please?
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/libressl/libressl.hash | 2 +-
> >  package/libressl/libressl.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/libressl/libressl.hash
> b/package/libressl/libressl.hash
> > index 40b49dbb8..5d3b54ea9 100644
> > --- a/package/libressl/libressl.hash
> > +++ b/package/libressl/libressl.hash
> > @@ -1,4 +1,4 @@
> >  # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> > -sha256
> 6d4b8d5bbb25a1f8336639e56ec5088052d43a95256697a85c4ce91323c25954
> libressl-3.8.2.tar.gz
> > +sha256
> c0cef9cfe174ac366ce482f542fddb07721e7fa0caface34b49a8720fa37fe7d
> libressl-3.8.4.tar.gz
> >  # Locally computed
> >  sha256
> 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
> > diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.m=
k
> > index b72f3b38c..1d90aa853 100644
> > --- a/package/libressl/libressl.mk
> > +++ b/package/libressl/libressl.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -LIBRESSL_VERSION =3D 3.8.2
> > +LIBRESSL_VERSION =3D 3.8.4
> >  LIBRESSL_SITE =3D https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
> >  LIBRESSL_LICENSE =3D ISC (new additions), OpenSSL or SSLeay (original
> OpenSSL code)
> >  LIBRESSL_LICENSE_FILES =3D COPYING
> > --
> > 2.40.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000d01c5d06150a6750
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 1 avr. 2024 =C3=A0=C2=A0=
16:17, Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.mo=
rin.1998@free.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Fran=C3=A7ois, All,<br>
<br>
On 2024-03-28 18:40 +0100, Francois Perrad spake thusly:<br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
<br>
Again, yiour From and SoB do not match: <a href=3D"mailto:fperrad@gmail.com=
" target=3D"_blank">fperrad@gmail.com</a> vs.<br>
<a href=3D"mailto:francois.perrad@gadz.org" target=3D"_blank">francois.perr=
ad@gadz.org</a>.<br></blockquote></div><div class=3D"gmail_quote"><br></div=
><div class=3D"gmail_quote">Yann,<br></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">them had never match since I contribute.</d=
iv><div class=3D"gmail_quote">Is it a new rule ?</div><div class=3D"gmail_q=
uote"><br></div><div class=3D"gmail_quote">Fran=C3=A7ois<br></div><div clas=
s=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
This applies to other patches, too:<br>
<br>
=C2=A0 =C2=A0 package/graphene: new package<br>
=C2=A0 =C2=A0 package/libgtk4: new package<br>
=C2=A0 =C2=A0 package/lmdb: new package<br>
=C2=A0 =C2=A0 package/lua-lightningmdb: new package<br>
=C2=A0 =C2=A0 package/lua-lgdbm: new package<br>
=C2=A0 =C2=A0 package/lua-lsdbus: new package<br>
=C2=A0 =C2=A0 package/libtommath: bump to version 1.3.0<br>
<br>
Can you fix and respin, please?<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 package/libressl/libressl.hash | 2 +-<br>
&gt;=C2=A0 package/libressl/<a href=3D"http://libressl.mk" rel=3D"noreferre=
r" target=3D"_blank">libressl.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/libressl/libressl.hash b/package/libressl/libress=
l.hash<br>
&gt; index 40b49dbb8..5d3b54ea9 100644<br>
&gt; --- a/package/libressl/libressl.hash<br>
&gt; +++ b/package/libressl/libressl.hash<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt;=C2=A0 # From <a href=3D"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/S=
HA256" rel=3D"noreferrer" target=3D"_blank">https://ftp.openbsd.org/pub/Ope=
nBSD/LibreSSL/SHA256</a><br>
&gt; -sha256=C2=A0 6d4b8d5bbb25a1f8336639e56ec5088052d43a95256697a85c4ce913=
23c25954=C2=A0 libressl-3.8.2.tar.gz<br>
&gt; +sha256=C2=A0 c0cef9cfe174ac366ce482f542fddb07721e7fa0caface34b49a8720=
fa37fe7d=C2=A0 libressl-3.8.4.tar.gz<br>
&gt;=C2=A0 # Locally computed<br>
&gt;=C2=A0 sha256=C2=A0 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c520=
3e0ec6e5955b1=C2=A0 COPYING<br>
&gt; diff --git a/package/libressl/<a href=3D"http://libressl.mk" rel=3D"no=
referrer" target=3D"_blank">libressl.mk</a> b/package/libressl/<a href=3D"h=
ttp://libressl.mk" rel=3D"noreferrer" target=3D"_blank">libressl.mk</a><br>
&gt; index b72f3b38c..1d90aa853 100644<br>
&gt; --- a/package/libressl/<a href=3D"http://libressl.mk" rel=3D"noreferre=
r" target=3D"_blank">libressl.mk</a><br>
&gt; +++ b/package/libressl/<a href=3D"http://libressl.mk" rel=3D"noreferre=
r" target=3D"_blank">libressl.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -LIBRESSL_VERSION =3D 3.8.2<br>
&gt; +LIBRESSL_VERSION =3D 3.8.4<br>
&gt;=C2=A0 LIBRESSL_SITE =3D <a href=3D"https://ftp.openbsd.org/pub/OpenBSD=
/LibreSSL" rel=3D"noreferrer" target=3D"_blank">https://ftp.openbsd.org/pub=
/OpenBSD/LibreSSL</a><br>
&gt;=C2=A0 LIBRESSL_LICENSE =3D ISC (new additions), OpenSSL or SSLeay (ori=
ginal OpenSSL code)<br>
&gt;=C2=A0 LIBRESSL_LICENSE_FILES =3D COPYING<br>
&gt; -- <br>
&gt; 2.40.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
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
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000d01c5d06150a6750--

--===============6574208711542094927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6574208711542094927==--
