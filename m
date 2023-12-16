Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B78C46CA2
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 10:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0905782168;
	Sat, 16 Dec 2023 10:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0905782168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRnCnhshdFdo; Sat, 16 Dec 2023 10:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B46F82171;
	Sat, 16 Dec 2023 10:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B46F82171
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 194B61BF28A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 10:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1043607C7
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 10:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1043607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8wbgKiyGjfn4 for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 10:59:09 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3EB560783
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 10:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3EB560783
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-35e70495835so7098825ab.3
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 02:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702724348; x=1703329148;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nq/v1/yJTxs9ZS65mhlmEmyZIlKac73r+DipCeW/tO0=;
 b=WQmI20wp/otX62pSoOgkq3mTUmHPvkf7US2UjqAo3CBCyU5bW3zaqF1Y0ySlX1xx/T
 DhDt2fa8F7+3XNDIDIS4atWNUyhvYyIlLAVD3WU4/BblQL/euSb6v/CAMPBiAoAZuVaP
 m861gc8i1PJSBz6l4Eg3EURduCkTVTVfz/fnEgXL//2zpsonOhIxt7cwUtKmvmGurUY5
 HEpzZ3r6NGrJoddl1ztXjWsWQTKBjM/RqOFsmMGT3togEd5UY0nZAmkQVFIuVbB0QRgN
 I2mMikE0fqfkg2LY08mVLbZF3UMOJw8xP6GUaN6aXgl3XpkgrYaTNpus72tfXh/2z1Jw
 khbQ==
X-Gm-Message-State: AOJu0YwDfEzsQwsx8fDH4oo9y1jEEwGw9Nwt8kfaKd1Wm6kVSjfm6hsO
 QEjIO9XdfT/N0GdyruJcFSQFoayP5odeL8cidQomonCjtEktvYT7skI=
X-Google-Smtp-Source: AGHT+IFkJNjI/NzaW+vS/YoYvLbKsQjY0NREhnEwUiXu+Xi41e9slnUI7qDgqAzKWu5dfOTSUfIJw+LMMTa3jcBVKh4=
X-Received: by 2002:a05:6e02:20c4:b0:35d:6bbc:edf8 with SMTP id
 4-20020a056e0220c400b0035d6bbcedf8mr19065831ilq.31.1702724348382; Sat, 16 Dec
 2023 02:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
 <20231213164311.4180059-4-dario.binacchi@amarulasolutions.com>
 <CAAE6iEUqGKqt=qvBQQ+NAqXsJ2dk=5W3PK+=1A5hzFJqrA2uGQ@mail.gmail.com>
 <CABGWkvr07wTs1vmcWvoOec858vx9C4VzFdXJ0TqTDr56rx0Wrw@mail.gmail.com>
In-Reply-To: <CABGWkvr07wTs1vmcWvoOec858vx9C4VzFdXJ0TqTDr56rx0Wrw@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 16 Dec 2023 11:58:57 +0100
Message-ID: <CAAE6iEW-MWx3aK+mBeoKnAFN9gm3U2_3Ymu9hjgE+JtJsHqCBg@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1702724348; x=1703329148; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nq/v1/yJTxs9ZS65mhlmEmyZIlKac73r+DipCeW/tO0=;
 b=MCIt6WTZId8/iJ5SamB525BVuf7LcpzYryCiygAf+MY4WL5DT4c6X6C8nGvQvyTpjq
 4gg4Sr2Ep7F0he5plHSlAly6ZCcUtijoEqASPB2FRK0IrqYenXdFydqUY7Ex2EcENhMt
 3gpCmAGWcZxt+M0VIIV/hX87pq0pYO4kzraCpYdy3sWZPRZwtL5U2+VL6iHfG8teDSgP
 477Y40Xz1wfkWlMTV4Wu1Tq0IWOsbdWJ8MtqFgG0OtplYUC2gyFElVmoiaJE6xp+3HPv
 gLAmsa7HFd7j3s4i1PdCTtbhPv8LIKXb10NAmRsRBnqIGbqW2OLMCMs6TL19nHjY1frE
 s7jg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=MCIt6WTZ
Subject: Re: [Buildroot] [PATCH v2 03/11] package/python-jsonschema: add
 host variant
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: multipart/mixed; boundary="===============4364425228719681922=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4364425228719681922==
Content-Type: multipart/alternative; boundary="000000000000eff249060c9e672e"

--000000000000eff249060c9e672e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 15 d=C3=A9c. 2023 =C3=A0 22:26, Dario Binacchi <
dario.binacchi@amarulasolutions.com> a =C3=A9crit :

> Hello Fran=C3=A7ois,
>
> On Fri, Dec 15, 2023 at 8:41=E2=80=AFPM Fran=C3=A7ois Perrad
> <francois.perrad@gadz.org> wrote:
> >
> >
> >
> > Le mer. 13 d=C3=A9c. 2023 =C3=A0 17:44, Dario Binacchi <
> dario.binacchi@amarulasolutions.com> a =C3=A9crit :
> >>
> >> Recent version of U-Boot use binman to provide a mechanism for buildin=
g
> >> images, from simple SPL + U-Boot combinations, to more complex
> >> arrangements with many parts. This package is required by binman.
> >>
> >> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> ---
> >>  package/Config.in.host                         | 1 +
> >>  package/python-jsonschema/Config.in.host       | 6 ++++++
> >
> >
> > Adding an Config.in.host for this kind of package is not useful, see
> documentation section 18.2.2. Config.in.host file
> >
>
> Do I need to drop the Config.in.host file for all the packages needed by
> binman?
> Or only for this one?
>
>
For all host python packages required by binman.

Fran=C3=A7ois


> Thanks and regards,
> Dario
>
> > Fran=C3=A7ois
> >
> >>  package/python-jsonschema/python-jsonschema.mk | 6 ++++++
> >>  3 files changed, 13 insertions(+)
> >>  create mode 100644 package/python-jsonschema/Config.in.host
> >>
> >> diff --git a/package/Config.in.host b/package/Config.in.host
> >> index c80842c33a2f..5d2121de02a4 100644
> >> --- a/package/Config.in.host
> >> +++ b/package/Config.in.host
> >> @@ -85,6 +85,7 @@ menu "Host utilities"
> >>         source "package/python-cython/Config.in.host"
> >>         source "package/python-greenlet/Config.in.host"
> >>         source "package/python-iniparse/Config.in.host"
> >> +       source "package/python-jsonschema/Config.in.host"
> >>         source "package/python-kflash/Config.in.host"
> >>         source "package/python-lxml/Config.in.host"
> >>         source "package/python-pyyaml/Config.in.host"
> >> diff --git a/package/python-jsonschema/Config.in.host
> b/package/python-jsonschema/Config.in.host
> >> new file mode 100644
> >> index 000000000000..fd275a41b200
> >> --- /dev/null
> >> +++ b/package/python-jsonschema/Config.in.host
> >> @@ -0,0 +1,6 @@
> >> +config BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA
> >> +       bool "host python-jsonschema"
> >> +       help
> >> +         The host implementation of JSON Schema validation for Python=
.
> >> +
> >> +         https://github.com/python-jsonschema/jsonschema
> >> diff --git a/package/python-jsonschema/python-jsonschema.mk
> b/package/python-jsonschema/python-jsonschema.mk
> >> index dee87e8f9d9b..6f2206f3a03c 100644
> >> --- a/package/python-jsonschema/python-jsonschema.mk
> >> +++ b/package/python-jsonschema/python-jsonschema.mk
> >> @@ -15,4 +15,10 @@ PYTHON_JSONSCHEMA_DEPENDENCIES =3D \
> >>         host-python-hatch-fancy-pypi-readme \
> >>         host-python-hatch-vcs
> >>
> >> +HOST_PYTHON_JSONSCHEMA_DEPENDENCIES =3D \
> >> +       host-python-hatchling \
> >> +       host-python-hatch-fancy-pypi-readme \
> >> +       host-python-hatch-vcs
> >> +
> >>  $(eval $(python-package))
> >> +$(eval $(host-python-package))
> >> --
> >> 2.43.0
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@buildroot.org
> >> https://lists.buildroot.org/mailman/listinfo/buildroot
>
>
>
> --
>
> Dario Binacchi
>
> Senior Embedded Linux Developer
>
> dario.binacchi@amarulasolutions.com
>
> __________________________________
>
>
> Amarula Solutions SRL
>
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 042 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com
>

--000000000000eff249060c9e672e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 15 d=C3=A9c. 2023 =C3=A0=
=C2=A022:26, Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulasol=
utions.com">dario.binacchi@amarulasolutions.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Fran=C3=
=A7ois,<br>
<br>
On Fri, Dec 15, 2023 at 8:41=E2=80=AFPM Fran=C3=A7ois Perrad<br>
&lt;<a href=3D"mailto:francois.perrad@gadz.org" target=3D"_blank">francois.=
perrad@gadz.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Le mer. 13 d=C3=A9c. 2023 =C3=A0 17:44, Dario Binacchi &lt;<a href=3D"=
mailto:dario.binacchi@amarulasolutions.com" target=3D"_blank">dario.binacch=
i@amarulasolutions.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; Recent version of U-Boot use binman to provide a mechanism for bui=
lding<br>
&gt;&gt; images, from simple SPL + U-Boot combinations, to more complex<br>
&gt;&gt; arrangements with many parts. This package is required by binman.<=
br>
&gt;&gt;<br>
&gt;&gt; Co-developed-by: Michael Trimarchi &lt;<a href=3D"mailto:michael@a=
marulasolutions.com" target=3D"_blank">michael@amarulasolutions.com</a>&gt;=
<br>
&gt;&gt; Signed-off-by: Michael Trimarchi &lt;<a href=3D"mailto:michael@ama=
rulasolutions.com" target=3D"_blank">michael@amarulasolutions.com</a>&gt;<b=
r>
&gt;&gt; Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi=
@amarulasolutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.co=
m</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 package/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;&gt;=C2=A0 package/python-jsonschema/Config.in.host=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 6 ++++++<br>
&gt;<br>
&gt;<br>
&gt; Adding an Config.in.host for this kind of package is not useful, see d=
ocumentation section 18.2.2. Config.in.host file<br>
&gt;<br>
<br>
Do I need to drop the Config.in.host file for all the packages needed by bi=
nman?<br>
Or only for this one?<br>
<br></blockquote><div><br></div><div>For all host python packages required =
by binman.</div><div><br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks and regards,<br>
Dario<br>
<br>
&gt; Fran=C3=A7ois<br>
&gt;<br>
&gt;&gt;=C2=A0 package/python-jsonschema/<a href=3D"http://python-jsonschem=
a.mk" rel=3D"noreferrer" target=3D"_blank">python-jsonschema.mk</a> | 6 +++=
+++<br>
&gt;&gt;=C2=A0 3 files changed, 13 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 package/python-jsonschema/Config.in.host<=
br>
&gt;&gt;<br>
&gt;&gt; diff --git a/package/Config.in.host b/package/Config.in.host<br>
&gt;&gt; index c80842c33a2f..5d2121de02a4 100644<br>
&gt;&gt; --- a/package/Config.in.host<br>
&gt;&gt; +++ b/package/Config.in.host<br>
&gt;&gt; @@ -85,6 +85,7 @@ menu &quot;Host utilities&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-cytho=
n/Config.in.host&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-green=
let/Config.in.host&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-inipa=
rse/Config.in.host&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-jsonschema=
/Config.in.host&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-kflas=
h/Config.in.host&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-lxml/=
Config.in.host&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-pyyam=
l/Config.in.host&quot;<br>
&gt;&gt; diff --git a/package/python-jsonschema/Config.in.host b/package/py=
thon-jsonschema/Config.in.host<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000000..fd275a41b200<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/package/python-jsonschema/Config.in.host<br>
&gt;&gt; @@ -0,0 +1,6 @@<br>
&gt;&gt; +config BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;host python-jsonschema&quot=
;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The host implementation of JSON=
 Schema validation for Python.<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/p=
ython-jsonschema/jsonschema" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/python-jsonschema/jsonschema</a><br>
&gt;&gt; diff --git a/package/python-jsonschema/<a href=3D"http://python-js=
onschema.mk" rel=3D"noreferrer" target=3D"_blank">python-jsonschema.mk</a> =
b/package/python-jsonschema/<a href=3D"http://python-jsonschema.mk" rel=3D"=
noreferrer" target=3D"_blank">python-jsonschema.mk</a><br>
&gt;&gt; index dee87e8f9d9b..6f2206f3a03c 100644<br>
&gt;&gt; --- a/package/python-jsonschema/<a href=3D"http://python-jsonschem=
a.mk" rel=3D"noreferrer" target=3D"_blank">python-jsonschema.mk</a><br>
&gt;&gt; +++ b/package/python-jsonschema/<a href=3D"http://python-jsonschem=
a.mk" rel=3D"noreferrer" target=3D"_blank">python-jsonschema.mk</a><br>
&gt;&gt; @@ -15,4 +15,10 @@ PYTHON_JSONSCHEMA_DEPENDENCIES =3D \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-python-hatch-fancy-pypi-read=
me \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-python-hatch-vcs<br>
&gt;&gt;<br>
&gt;&gt; +HOST_PYTHON_JSONSCHEMA_DEPENDENCIES =3D \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0host-python-hatchling \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0host-python-hatch-fancy-pypi-readme \<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0host-python-hatch-vcs<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 $(eval $(python-package))<br>
&gt;&gt; +$(eval $(host-python-package))<br>
&gt;&gt; --<br>
&gt;&gt; 2.43.0<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; buildroot mailing list<br>
&gt;&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">build=
root@buildroot.org</a><br>
&gt;&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/l=
istinfo/buildroot</a><br>
<br>
<br>
<br>
-- <br>
<br>
Dario Binacchi<br>
<br>
Senior Embedded Linux Developer<br>
<br>
<a href=3D"mailto:dario.binacchi@amarulasolutions.com" target=3D"_blank">da=
rio.binacchi@amarulasolutions.com</a><br>
<br>
__________________________________<br>
<br>
<br>
Amarula Solutions SRL<br>
<br>
Via Le Canevare 30, 31100 Treviso, Veneto, IT<br>
<br>
T. +39 042 243 5310<br>
<a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@amarula=
solutions.com</a><br>
<br>
<a href=3D"http://www.amarulasolutions.com" rel=3D"noreferrer" target=3D"_b=
lank">www.amarulasolutions.com</a><br>
</blockquote></div></div>

--000000000000eff249060c9e672e--

--===============4364425228719681922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4364425228719681922==--
