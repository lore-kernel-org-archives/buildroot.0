Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB324C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8298481762;
	Sun,  5 Nov 2023 18:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8298481762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uap5nBV_VJMQ; Sun,  5 Nov 2023 18:20:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F615813DD;
	Sun,  5 Nov 2023 18:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F615813DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9B991BF4D6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92ACE4038C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92ACE4038C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOI4yyoTj3YX for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:20:16 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 294424035A
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 294424035A
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53e07db272cso6363479a12.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 10:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699208414; x=1699813214;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iBbkqr3IXwMHP4BWVYAQuaydhVGauKucChxyZXysFKE=;
 b=H2rDHvI3ZnsFjLJ3r6CNcvUNcfrqr6Fa/38P5MmPQLbUdRg4XsCoszvWEzIvZeusPa
 EX6C63LIOuW17ji+81+KaSm85zL+ePQ5qyr3rbJu1r2UzGgYwY6hvxFZkAAMzuUYVNVx
 UWZ1J8Iz8TiJ0JDMM1mfx11CRg/ezZIr03I4xg7roJtb/cQYTv0sQXkfcBbUewPxdlf1
 G51VsSYW2uIIcCd+Greel70o08dhrmJy4zkWwC94xTs1ZxQx9AAzXm1yFi3ZLqRqKeUL
 RfYtTtbvDut4NrFkYivQofkUuUWfSnOJ6vtynnqUQzrNcJm9v2Go+tfFbCzkHStTU0ws
 1AcQ==
X-Gm-Message-State: AOJu0Yye9SJk58i0UiGbU1GAbD7bZI9vWmyiJqb4tczubzlUv+6cRZ8G
 npepn1ZBRD1Gj7MA0tnkQIZ4TtwcYkITTpLayMg6KA==
X-Google-Smtp-Source: AGHT+IGEBrlXJObdxqbM4RR9solW89xweqI3HGs6LY4VQwZvKziJqlUtsABLhwfhVLuKtrNFieUni685u4IxCCtpH3I=
X-Received: by 2002:a17:906:db01:b0:9d5:9ff5:ce with SMTP id
 xj1-20020a170906db0100b009d59ff500cemr10784943ejb.34.1699208414043; Sun, 05
 Nov 2023 10:20:14 -0800 (PST)
MIME-Version: 1.0
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-18-adam.duskett@amarulasolutions.com>
 <c8d0027d-7754-43da-beb8-670bdb78403b@mind.be>
In-Reply-To: <c8d0027d-7754-43da-beb8-670bdb78403b@mind.be>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Sun, 5 Nov 2023 11:20:03 -0700
Message-ID: <CAHDQB6N8g7gjU=tgcsL6_CRyHZkfnOG4RRadxdGgWK+aBzzh8A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699208414; x=1699813214;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iBbkqr3IXwMHP4BWVYAQuaydhVGauKucChxyZXysFKE=;
 b=KafQI92xCdNrtaf7lKwS3GFp/4s7OxCeqCCOv8ZiTrcgtcl8YbvpU0/+e3/+JVot3H
 rWoCLgipdPjMBtb17kVzF6OKnzX562FBkfs9Zvrb4w4c1IxbOdgxTMIYI+fSu3I7JyeL
 yoviOS2Swj7ladvoHElfRCNzZ0AD64mYxZlZ4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=KafQI92x
Subject: Re: [Buildroot] [PATCH 17/30] package/python-systemd: bump version
 to 235
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org, Mauro Condarelli <mc5686@mclink.it>
Content-Type: multipart/mixed; boundary="===============3976713077930302384=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3976713077930302384==
Content-Type: multipart/alternative; boundary="000000000000eb36dc06096bc917"

--000000000000eb36dc06096bc917
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Arnout;

This is the latest version of python-systemd.
Here is a quick check I did: https://pypi.org/project/systemd-python/

Adam Duskett

Senior Embedded Systems Developer

M. +1208-515-8102

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Sat, Nov 4, 2023 at 11:59=E2=80=AFAM Arnout Vandecappelle <arnout@mind.b=
e> wrote:

>
>
> On 26/10/2023 11:26, Adam Duskett wrote:
> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> > ---
> >   package/python-systemd/python-systemd.hash | 4 ++--
> >   package/python-systemd/python-systemd.mk   | 6 +++---
> >   2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/python-systemd/python-systemd.hash
> b/package/python-systemd/python-systemd.hash
> > index 789b48590d..6cc6639218 100644
> > --- a/package/python-systemd/python-systemd.hash
> > +++ b/package/python-systemd/python-systemd.hash
> > @@ -1,5 +1,5 @@
> >   # md5 from https://pypi.python.org/pypi/systemd-python/
> > -md5  5071ea5bcb976186e92a3f5e75df221d  systemd-python-234.tar.gz
> > +md5  93f3ca09f35719ca6a4edd1d62d38dd4  systemd-python-235.tar.gz
> >   # Locally computed
> > -sha256
> fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7
> systemd-python-234.tar.gz
> > +sha256
> 4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b8008e695c0a
> systemd-python-235.tar.gz
> >   sha256
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551
> LICENSE.txt
> > diff --git a/package/python-systemd/python-systemd.mk
> b/package/python-systemd/python-systemd.mk
> > index 3ccfd57ce5..24ba84df76 100644
> > --- a/package/python-systemd/python-systemd.mk
> > +++ b/package/python-systemd/python-systemd.mk
> > @@ -4,10 +4,10 @@
> >   #
> >
>  ########################################################################=
########
> >
> > -PYTHON_SYSTEMD_VERSION =3D 234 # Should be kept in sync with
> $(SYSTEMD_VERSION)
> > +PYTHON_SYSTEMD_VERSION =3D 235 # Should be kept in sync with
> $(SYSTEMD_VERSION)
>
>   SYSTEMD_VERSION is 254.5, not 235... What gives?
>
>   (We should anyway probably put that comment in systemd.mk, not so much
> here...)
>
>   Regards,
>   Arnout
>
> >   PYTHON_SYSTEMD_SOURCE =3D systemd-python-$(PYTHON_SYSTEMD_VERSION).ta=
r.gz
> > -PYTHON_SYSTEMD_SITE =3D
> https://pypi.python.org/packages/e8/a8/00ba0f605837a8f69523e6c3a4fb14675a=
6430c163f836540129c50b3aef
> > -PYTHON_SYSTEMD_SETUP_TYPE =3D distutils
> > +PYTHON_SYSTEMD_SITE =3D
> https://files.pythonhosted.org/packages/10/9e/ab4458e00367223bda2dd7ccf08=
49a72235ee3e29b36dce732685d9b7ad9
> > +PYTHON_SYSTEMD_SETUP_TYPE =3D setuptools
> >   PYTHON_SYSTEMD_LICENSE =3D LGPL-2.1
> >   PYTHON_SYSTEMD_LICENSE_FILES =3D LICENSE.txt
> >   PYTHON_SYSTEMD_DEPENDENCIES =3D systemd # To be able to link against
> libsystemd
>

--000000000000eb36dc06096bc917
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Arnout;<div><br></div><div>This is the latest version of p=
ython-systemd.</div><div>Here is a quick check I did:=C2=A0<a href=3D"https=
://pypi.org/project/systemd-python/">https://pypi.org/project/systemd-pytho=
n/</a></div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D=
"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(=
0,0,0);background-color:transparent;vertical-align:baseline;white-space:pre=
-wrap">Adam Duskett</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999=
999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;f=
ont-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-co=
lor:transparent;vertical-align:baseline;white-space:pre-wrap">Senior Embedd=
ed Systems Developer</span></p><p dir=3D"ltr" style=3D"line-height:1.799999=
9999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;=
font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-c=
olor:transparent;vertical-align:baseline;white-space:pre-wrap">M. +1208-515=
-8102</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:adam.dusk=
ett@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.c=
om</a></span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&q=
uot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transpare=
nt;vertical-align:baseline;white-space:pre-wrap">__________________________=
________</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:=
&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transpa=
rent;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;vertical-align:baseline;white-space:pre-wrap">Amarula S=
olutions BV</span></p><p dir=3D"ltr" style=3D"line-height:1.799999999999999=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fami=
ly:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tran=
sparent;vertical-align:baseline;white-space:pre-wrap">Joop Geesinkweg 125, =
1114 AB, Amsterdam, NL</span></p><p dir=3D"ltr" style=3D"line-height:1.7999=
999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10p=
t;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background=
-color:transparent;vertical-align:baseline;white-space:pre-wrap">T. +31 (0)=
85 111 9170</span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mo=
no&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-a=
lign:baseline;white-space:pre-wrap"><br></span><span style=3D"font-size:10p=
t;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background=
-color:transparent;vertical-align:baseline;white-space:pre-wrap"><a href=3D=
"mailto:info@amarulasolutions.com" target=3D"_blank">info@amarulasolutions.=
com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;ma=
rgin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.com/=
" target=3D"_blank"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu =
Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical=
-align:baseline;white-space:pre-wrap">www.amarulasolutions.com</span></a></=
p><div><br></div></span></div></div></div><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 4, 2023 at =
11:59=E2=80=AFAM Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be"=
>arnout@mind.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
<br>
On 26/10/2023 11:26, Adam Duskett wrote:<br>
&gt; Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarula=
solutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<=
br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/python-systemd/python-systemd.hash | 4 ++--<br>
&gt;=C2=A0 =C2=A0package/python-systemd/<a href=3D"http://python-systemd.mk=
" rel=3D"noreferrer" target=3D"_blank">python-systemd.mk</a>=C2=A0 =C2=A0| =
6 +++---<br>
&gt;=C2=A0 =C2=A02 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/python-systemd/python-systemd.hash b/package/pyth=
on-systemd/python-systemd.hash<br>
&gt; index 789b48590d..6cc6639218 100644<br>
&gt; --- a/package/python-systemd/python-systemd.hash<br>
&gt; +++ b/package/python-systemd/python-systemd.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 =C2=A0# md5 from <a href=3D"https://pypi.python.org/pypi/systemd=
-python/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi=
/systemd-python/</a><br>
&gt; -md5=C2=A0 5071ea5bcb976186e92a3f5e75df221d=C2=A0 systemd-python-234.t=
ar.gz<br>
&gt; +md5=C2=A0 93f3ca09f35719ca6a4edd1d62d38dd4=C2=A0 systemd-python-235.t=
ar.gz<br>
&gt;=C2=A0 =C2=A0# Locally computed<br>
&gt; -sha256=C2=A0 fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d338=
95db83e7=C2=A0 systemd-python-234.tar.gz<br>
&gt; +sha256=C2=A0 4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b800=
8e695c0a=C2=A0 systemd-python-235.tar.gz<br>
&gt;=C2=A0 =C2=A0sha256=C2=A0 dc626520dcd53a22f727af3ee42c770e56c97a64fe3ad=
b063799d8ab032fe551=C2=A0 LICENSE.txt<br>
&gt; diff --git a/package/python-systemd/<a href=3D"http://python-systemd.m=
k" rel=3D"noreferrer" target=3D"_blank">python-systemd.mk</a> b/package/pyt=
hon-systemd/<a href=3D"http://python-systemd.mk" rel=3D"noreferrer" target=
=3D"_blank">python-systemd.mk</a><br>
&gt; index 3ccfd57ce5..24ba84df76 100644<br>
&gt; --- a/package/python-systemd/<a href=3D"http://python-systemd.mk" rel=
=3D"noreferrer" target=3D"_blank">python-systemd.mk</a><br>
&gt; +++ b/package/python-systemd/<a href=3D"http://python-systemd.mk" rel=
=3D"noreferrer" target=3D"_blank">python-systemd.mk</a><br>
&gt; @@ -4,10 +4,10 @@<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0##########################################################=
######################<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -PYTHON_SYSTEMD_VERSION =3D 234 # Should be kept in sync with $(SYSTEM=
D_VERSION)<br>
&gt; +PYTHON_SYSTEMD_VERSION =3D 235 # Should be kept in sync with $(SYSTEM=
D_VERSION)<br>
<br>
=C2=A0 SYSTEMD_VERSION is 254.5, not 235... What gives?<br>
<br>
=C2=A0 (We should anyway probably put that comment in <a href=3D"http://sys=
temd.mk" rel=3D"noreferrer" target=3D"_blank">systemd.mk</a>, not so much h=
ere...)<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt;=C2=A0 =C2=A0PYTHON_SYSTEMD_SOURCE =3D systemd-python-$(PYTHON_SYSTEMD_=
VERSION).tar.gz<br>
&gt; -PYTHON_SYSTEMD_SITE =3D <a href=3D"https://pypi.python.org/packages/e=
8/a8/00ba0f605837a8f69523e6c3a4fb14675a6430c163f836540129c50b3aef" rel=3D"n=
oreferrer" target=3D"_blank">https://pypi.python.org/packages/e8/a8/00ba0f6=
05837a8f69523e6c3a4fb14675a6430c163f836540129c50b3aef</a><br>
&gt; -PYTHON_SYSTEMD_SETUP_TYPE =3D distutils<br>
&gt; +PYTHON_SYSTEMD_SITE =3D <a href=3D"https://files.pythonhosted.org/pac=
kages/10/9e/ab4458e00367223bda2dd7ccf0849a72235ee3e29b36dce732685d9b7ad9" r=
el=3D"noreferrer" target=3D"_blank">https://files.pythonhosted.org/packages=
/10/9e/ab4458e00367223bda2dd7ccf0849a72235ee3e29b36dce732685d9b7ad9</a><br>
&gt; +PYTHON_SYSTEMD_SETUP_TYPE =3D setuptools<br>
&gt;=C2=A0 =C2=A0PYTHON_SYSTEMD_LICENSE =3D LGPL-2.1<br>
&gt;=C2=A0 =C2=A0PYTHON_SYSTEMD_LICENSE_FILES =3D LICENSE.txt<br>
&gt;=C2=A0 =C2=A0PYTHON_SYSTEMD_DEPENDENCIES =3D systemd # To be able to li=
nk against libsystemd<br>
</blockquote></div>

--000000000000eb36dc06096bc917--

--===============3976713077930302384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3976713077930302384==--
