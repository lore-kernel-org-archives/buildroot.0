Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E91ECE56D
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 20:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2493760678;
	Sat,  7 Sep 2024 20:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQxOJXxs2x32; Sat,  7 Sep 2024 20:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D54E96065F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D54E96065F;
	Sat,  7 Sep 2024 20:41:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 133B61BF3DA
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E1406065F
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82wPZKWhJkBu for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 20:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::932; helo=mail-ua1-x932.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 81BD260659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81BD260659
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81BD260659
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 20:41:17 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-846d741dfdbso801785241.0
 for <buildroot@buildroot.org>; Sat, 07 Sep 2024 13:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725741676; x=1726346476;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xyC3yKt7EW+xd4eY16zmD26mx0hMSBMQgFn0mxhGvSw=;
 b=CW71ymuUduEjSjkY2e09+ydJ9GSLO4RV2sty9X+QB8xQPWvoSOOXPoU6m+sXxuNOfo
 D94VFEN06r3gqgUicZfUCoDR09bEr3BlN+/xE6v3IW331LrRfiwnrX9Xm2IR0XfjtqZI
 jL3VFvhtRuLnjo87EmG5aNJ8MNhU6KeEvh5g48hEch4m9A02yGijAWSShR/RJzDqz/Jl
 X6ktEWPfSuJCxWIBELKO/TPmvrPW/CjnpVKl2TJWGpJ0YIppkBDioVAMDIVOQQ2y2gXM
 SmO+uuWbDb9Cc/7nEgVw1OOeQscYR8fWneNki4+j0VXjesiwF0LypAP+TisBSohisPQ6
 9H+A==
X-Gm-Message-State: AOJu0Yzne+TzmW7r63YmzQ9+0YIHqDa8D1VGlml9/Z9Frmt2DqVOLUbe
 3bux3gie86ky68nSzhLHKfCDX0rPgoi1aPoVzwsqi0eMxi0iuzlPik1zYqwOPcLlbXJinq+ohdu
 zqWcFdxgCKE5SMC0R5ZrrH131GRM=
X-Google-Smtp-Source: AGHT+IGtPajaL5IeuCgmoqT/fHH53QY6i3VSj0rmnnrsMs3VX52UWrrjDgV2/Oz5rP7RC60J1dd8B472JtL0PmzlRfg=
X-Received: by 2002:a05:6102:d93:b0:493:c8b9:67d3 with SMTP id
 ada2fe7eead31-49bde267e6cmr7157384137.20.1725741675728; Sat, 07 Sep 2024
 13:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240906184756.1166732-1-james.hilliard1@gmail.com>
 <20240906184756.1166732-2-james.hilliard1@gmail.com>
 <ZtysrvrjZ6EEwuyc@landeda>
In-Reply-To: <ZtysrvrjZ6EEwuyc@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 7 Sep 2024 14:41:04 -0600
Message-ID: <CADvTj4rnN9F6obtE7uaptYY6jdhOJJB8sOcstutOP1FTB6tb1Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725741676; x=1726346476; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xyC3yKt7EW+xd4eY16zmD26mx0hMSBMQgFn0mxhGvSw=;
 b=B4XLY+lNGPypPxOlMENX2CU6ZnhBUFamSEKIDzI8QIVMTorO3+4mHF4Xa31y4X15pi
 cHhL5FkgVpdTmRFSKFgrJu6gNvFDsW5ZvzxOlFqx9GYxLIzPbuqe08dGmo8nLvepq3T+
 Vu3eW2Z2iKwmu8HTr7EhjEPQK2H/Esg9cyBw1ioHjE3kbBSpTe7Mw2Sa3Sg3xLpI9Sda
 GSqLbFojzQt9BH5Jow+Zyr5x/vKjskL9/X3k3dX6UT3JcgMX8xN0K+GK8gW7rbEB5P0R
 ZurWgPjJh6nC1J/RmR3zEMqCgFCIftaPwXoPdvrIvHXZa29Vvr+Qh0SJUbg5bR9F3fUw
 MKSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B4XLY+lN
Subject: Re: [Buildroot] [PATCH 2/2] package/python-pydantic: bump to
 version 2.9.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1382329764892572262=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1382329764892572262==
Content-Type: multipart/alternative; boundary="0000000000008e56b206218d8b02"

--0000000000008e56b206218d8b02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 7, 2024 at 1:42=E2=80=AFPM Yann E. MORIN <yann.morin.1998@free.=
fr>
wrote:

> James, All,
>
> On 2024-09-06 12:47 -0600, James Hilliard spake thusly:
> > Add new python-tzdata runtime dependency.
>
> This is weird that it is needed, because the dependency is written as
> an optional dependency, specific to win32;
>
>    57 [project.optional-dependencies]
>    58 email =3D ['email-validator>=3D2.0.0']
>    59 timezone =3D [
>    60     # See:
> https://docs.python.org/3/library/zoneinfo.html#data-sources
>    61     'tzdata; python_version >=3D "3.9" and sys_platform =3D=3D "win=
32"',
>    62 ]
>
> So, how come it is needed on Linux?
>

It's not listed under optional in version 2.9.0:
https://github.com/pydantic/pydantic/blob/v2.9.0/pyproject.toml#L54-L55

But it does look like it was changed in main:
https://github.com/pydantic/pydantic/pull/10331


>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/python-pydantic/Config.in            | 1 +
> >  package/python-pydantic/python-pydantic.hash | 4 ++--
> >  package/python-pydantic/python-pydantic.mk   | 4 ++--
> >  3 files changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/python-pydantic/Config.in
> b/package/python-pydantic/Config.in
> > index e9cd2e6780..029f86450e 100644
> > --- a/package/python-pydantic/Config.in
> > +++ b/package/python-pydantic/Config.in
> > @@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYDANTIC
> >       select BR2_PACKAGE_PYTHON_ANNOTATED_TYPES # runtime
> >       select BR2_PACKAGE_PYTHON_PYDANTIC_CORE # runtime
> >       select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
> > +     select BR2_PACKAGE_PYTHON_TZDATA # runtime
> >       help
> >         Data validation and settings management using python 3.6
> >         type hinting.
> > diff --git a/package/python-pydantic/python-pydantic.hash
> b/package/python-pydantic/python-pydantic.hash
> > index 6127dcaf37..fd8d16dbb1 100644
> > --- a/package/python-pydantic/python-pydantic.hash
> > +++ b/package/python-pydantic/python-pydantic.hash
> > @@ -1,5 +1,5 @@
> >  # md5, sha256 from https://pypi.org/pypi/pydantic/json
> > -md5  940d760de174d3567d4f5be28fd215f5  pydantic-2.8.2.tar.gz
> > -sha256
> 6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816604f7c2a
> pydantic-2.8.2.tar.gz
> > +md5  f328e2d6c3d511a81e358aac6a8636b6  pydantic-2.9.0.tar.gz
> > +sha256
> c7a8a9fdf7d100afa49647eae340e2d23efa382466a8d177efcd1381e9be5598
> pydantic-2.9.0.tar.gz
> >  # Locally computed sha256 checksums
> >  sha256
> a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
> > diff --git a/package/python-pydantic/python-pydantic.mk
> b/package/python-pydantic/python-pydantic.mk
> > index c549970db9..828658af19 100644
> > --- a/package/python-pydantic/python-pydantic.mk
> > +++ b/package/python-pydantic/python-pydantic.mk
> > @@ -4,9 +4,9 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -PYTHON_PYDANTIC_VERSION =3D 2.8.2
> > +PYTHON_PYDANTIC_VERSION =3D 2.9.0
> >  PYTHON_PYDANTIC_SOURCE =3D pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
> > -PYTHON_PYDANTIC_SITE =3D
> https://files.pythonhosted.org/packages/8c/99/d0a5dca411e0a017762258013ba=
9905cd6e7baa9a3fd1fe8b6529472902e
> > +PYTHON_PYDANTIC_SITE =3D
> https://files.pythonhosted.org/packages/f6/8f/3b9f7a38caa3fa0bcb3cea7ee99=
58e89a9a6efc0e6f51fd6096f24cac140
> >  PYTHON_PYDANTIC_SETUP_TYPE =3D pep517
> >  PYTHON_PYDANTIC_LICENSE =3D MIT
> >  PYTHON_PYDANTIC_LICENSE_FILES =3D LICENSE
> > --
> > 2.34.1
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
>

--0000000000008e56b206218d8b02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Sep 7, 2024 at 1:42=E2=80=AFPM Ya=
nn E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@=
free.fr</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">James, All,<br>
<br>
On 2024-09-06 12:47 -0600, James Hilliard spake thusly:<br>
&gt; Add new python-tzdata runtime dependency.<br>
<br>
This is weird that it is needed, because the dependency is written as<br>
an optional dependency, specific to win32;<br>
<br>
=C2=A0 =C2=A057 [project.optional-dependencies]<br>
=C2=A0 =C2=A058 email =3D [&#39;email-validator&gt;=3D2.0.0&#39;]<br>
=C2=A0 =C2=A059 timezone =3D [<br>
=C2=A0 =C2=A060=C2=A0 =C2=A0 =C2=A0# See: <a href=3D"https://docs.python.or=
g/3/library/zoneinfo.html#data-sources" rel=3D"noreferrer" target=3D"_blank=
">https://docs.python.org/3/library/zoneinfo.html#data-sources</a><br>
=C2=A0 =C2=A061=C2=A0 =C2=A0 =C2=A0&#39;tzdata; python_version &gt;=3D &quo=
t;3.9&quot; and sys_platform =3D=3D &quot;win32&quot;&#39;,<br>
=C2=A0 =C2=A062 ]<br>
<br>
So, how come it is needed on Linux?<br></blockquote><div><br></div><div>It&=
#39;s not listed under optional in version 2.9.0:</div><div><a href=3D"http=
s://github.com/pydantic/pydantic/blob/v2.9.0/pyproject.toml#L54-L55">https:=
//github.com/pydantic/pydantic/blob/v2.9.0/pyproject.toml#L54-L55</a></div>=
<div><br></div><div>But it does look like it was changed in main:</div><div=
><a href=3D"https://github.com/pydantic/pydantic/pull/10331">https://github=
.com/pydantic/pydantic/pull/10331</a></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gm=
ail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/python-pydantic/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 package/python-pydantic/python-pydantic.hash | 4 ++--<br>
&gt;=C2=A0 package/python-pydantic/<a href=3D"http://python-pydantic.mk" re=
l=3D"noreferrer" target=3D"_blank">python-pydantic.mk</a>=C2=A0 =C2=A0| 4 +=
+--<br>
&gt;=C2=A0 3 files changed, 5 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/python-pydantic/Config.in b/package/python-pydant=
ic/Config.in<br>
&gt; index e9cd2e6780..029f86450e 100644<br>
&gt; --- a/package/python-pydantic/Config.in<br>
&gt; +++ b/package/python-pydantic/Config.in<br>
&gt; @@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYDANTIC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_ANNOTATED_TYPES # =
runtime<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_PYDANTIC_CORE # ru=
ntime<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS =
# runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_TZDATA # runtime<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Data validation and settings manageme=
nt using python 3.6<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type hinting.<br>
&gt; diff --git a/package/python-pydantic/python-pydantic.hash b/package/py=
thon-pydantic/python-pydantic.hash<br>
&gt; index 6127dcaf37..fd8d16dbb1 100644<br>
&gt; --- a/package/python-pydantic/python-pydantic.hash<br>
&gt; +++ b/package/python-pydantic/python-pydantic.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 # md5, sha256 from <a href=3D"https://pypi.org/pypi/pydantic/jso=
n" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/pypi/pydantic/json=
</a><br>
&gt; -md5=C2=A0 940d760de174d3567d4f5be28fd215f5=C2=A0 pydantic-2.8.2.tar.g=
z<br>
&gt; -sha256=C2=A0 6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816=
604f7c2a=C2=A0 pydantic-2.8.2.tar.gz<br>
&gt; +md5=C2=A0 f328e2d6c3d511a81e358aac6a8636b6=C2=A0 pydantic-2.9.0.tar.g=
z<br>
&gt; +sha256=C2=A0 c7a8a9fdf7d100afa49647eae340e2d23efa382466a8d177efcd1381=
e9be5598=C2=A0 pydantic-2.9.0.tar.gz<br>
&gt;=C2=A0 # Locally computed sha256 checksums<br>
&gt;=C2=A0 sha256=C2=A0 a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b=
67b49e3529ef3=C2=A0 LICENSE<br>
&gt; diff --git a/package/python-pydantic/<a href=3D"http://python-pydantic=
.mk" rel=3D"noreferrer" target=3D"_blank">python-pydantic.mk</a> b/package/=
python-pydantic/<a href=3D"http://python-pydantic.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">python-pydantic.mk</a><br>
&gt; index c549970db9..828658af19 100644<br>
&gt; --- a/package/python-pydantic/<a href=3D"http://python-pydantic.mk" re=
l=3D"noreferrer" target=3D"_blank">python-pydantic.mk</a><br>
&gt; +++ b/package/python-pydantic/<a href=3D"http://python-pydantic.mk" re=
l=3D"noreferrer" target=3D"_blank">python-pydantic.mk</a><br>
&gt; @@ -4,9 +4,9 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -PYTHON_PYDANTIC_VERSION =3D 2.8.2<br>
&gt; +PYTHON_PYDANTIC_VERSION =3D 2.9.0<br>
&gt;=C2=A0 PYTHON_PYDANTIC_SOURCE =3D pydantic-$(PYTHON_PYDANTIC_VERSION).t=
ar.gz<br>
&gt; -PYTHON_PYDANTIC_SITE =3D <a href=3D"https://files.pythonhosted.org/pa=
ckages/8c/99/d0a5dca411e0a017762258013ba9905cd6e7baa9a3fd1fe8b6529472902e" =
rel=3D"noreferrer" target=3D"_blank">https://files.pythonhosted.org/package=
s/8c/99/d0a5dca411e0a017762258013ba9905cd6e7baa9a3fd1fe8b6529472902e</a><br=
>
&gt; +PYTHON_PYDANTIC_SITE =3D <a href=3D"https://files.pythonhosted.org/pa=
ckages/f6/8f/3b9f7a38caa3fa0bcb3cea7ee9958e89a9a6efc0e6f51fd6096f24cac140" =
rel=3D"noreferrer" target=3D"_blank">https://files.pythonhosted.org/package=
s/f6/8f/3b9f7a38caa3fa0bcb3cea7ee9958e89a9a6efc0e6f51fd6096f24cac140</a><br=
>
&gt;=C2=A0 PYTHON_PYDANTIC_SETUP_TYPE =3D pep517<br>
&gt;=C2=A0 PYTHON_PYDANTIC_LICENSE =3D MIT<br>
&gt;=C2=A0 PYTHON_PYDANTIC_LICENSE_FILES =3D LICENSE<br>
&gt; -- <br>
&gt; 2.34.1<br>
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
</blockquote></div></div>

--0000000000008e56b206218d8b02--

--===============1382329764892572262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1382329764892572262==--
