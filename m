Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBC1C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 13:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE94441C79;
	Wed, 19 Oct 2022 13:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE94441C79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4hwWjT_Zdwc; Wed, 19 Oct 2022 13:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4038A41B70;
	Wed, 19 Oct 2022 13:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4038A41B70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2503F1BF375
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 13:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00504611A8
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 13:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00504611A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 45CVlk8rHV0q for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 13:27:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94DB8610F8
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94DB8610F8
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 13:27:51 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id n83so19181962oif.11
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 06:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=De9CHlilqmNcDzyMrx+buioIh0exhlrrKih0pXII3Bc=;
 b=BHWyxyNR+CbKv+NExNF+bd4bwY2zFOiGYxXoTuig/Jp2dzlCGldLpPao23usHoRD3U
 3FwqH2bt5ddXJEcPCHWrcp8z3hOILkyFP077P0oh9yKUYr75aSxMr1iCytQeg+Bnj76O
 3ilADr1P9P+b0qqAP8QufUU/x1Ar9yPnWDItQjSzN0jjBco4yv05OPdI2FeOt9bc3uzr
 tP+ezsVlrvPCfnFQy+TtH2NAyVMn8qzk5gA1gkC0+S3WmdoSPeSnrxTQX3GyMAqecY6g
 mVcRwaP+z7BHtUNWRrN0XGiVW+qKbQogbQHIwEIbTo6j6XLXm6O03GVHrTQKfsWIkuha
 6XDQ==
X-Gm-Message-State: ACrzQf2bPrwgU1xIc75ZfYIblDPDE7PZxeuuz7HUmXzg6aoS4+01JAx9
 1hkGA/cdRevOqvRaYTrQ1RU6GK8ar/WXhaNothvS0mQvVGM=
X-Google-Smtp-Source: AMsMyM7mpXElrdb7d95SyrKmyp1N+9mPX2cilrELwsc6tW1PA07pnQmbpDgrIxhCvyJmJUjzzYJtg10u7+fAC+wZGvs=
X-Received: by 2002:a05:6808:120c:b0:351:6d17:1845 with SMTP id
 a12-20020a056808120c00b003516d171845mr4469046oil.254.1666186070590; Wed, 19
 Oct 2022 06:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221019090309.1410432-1-angelo@amarulasolutions.com>
 <83402c3a-a873-7b1d-5f21-519c8d97ec35@othermo.de>
In-Reply-To: <83402c3a-a873-7b1d-5f21-519c8d97ec35@othermo.de>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 19 Oct 2022 15:27:13 +0200
Message-ID: <CA+_SqVbEP8ChFgttcuDL47hNHOvzR2wR0p+GHyFxuRFRxYwPgA@mail.gmail.com>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=De9CHlilqmNcDzyMrx+buioIh0exhlrrKih0pXII3Bc=;
 b=GLzSBezPjNGW2RnabHWa/kNeBHQF66AX87SK+sie+v3zeYmedvVOwn8nwPifpV8wGm
 WCV5UrCSMGrGc6SvX9TrcO6ek2JzDgmtdWBCGuZk6TBqAjcblSd8j1gFn5+/ljjDQLNI
 nJ1BIZ6GN9AApM1OiYOnB31sXn7fM2CGtbPlI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GLzSBezP
Subject: Re: [Buildroot] [PATCH v2] package/python-minimalmodbus: new package
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
Content-Type: multipart/mixed; boundary="===============7424767675665063320=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7424767675665063320==
Content-Type: multipart/alternative; boundary="000000000000de1a3e05eb632c07"

--000000000000de1a3e05eb632c07
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 2:56 PM Marcus Hoffmann <marcus.hoffmann@othermo.de>
wrote:

> Thanks,
>
> I've been meaning to submit this as well but didn't get around to it yet.
>
> On 19.10.22 11:03, Angelo Compagnucci wrote:
> > Easy-to-use Modbus RTU and Modbus ASCII implementation for Python.
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> One somewhat general question below, but otherwise this looks all good.
>
> Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
>
> > ---
> > V2:
> > * Adding me to DEVELOPERS
> >
> >   DEVELOPERS                                         |  1 +
> >   package/Config.in                                  |  1 +
> >   package/python-minimalmodbus/Config.in             |  7 +++++++
> >   .../python-minimalmodbus/python-minimalmodbus.hash |  4 ++++
> >   .../python-minimalmodbus/python-minimalmodbus.mk   | 14 ++++++++++++++
> >   5 files changed, 27 insertions(+)
> >   create mode 100644 package/python-minimalmodbus/Config.in
> >   create mode 100644
> package/python-minimalmodbus/python-minimalmodbus.hash
> >   create mode 100644 package/python-minimalmodbus/
> python-minimalmodbus.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index c0e6f8bbef..9eb5400999 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -173,6 +173,7 @@ F:        package/mono-gtksharp3/
> >   F:  package/monolite/
> >   F:  package/openjpeg/
> >   F:  package/python-can/
> > +F:   package/python-minimalmodbus/
> >   F:  package/python-pillow/
> >   F:  package/python-pydal/
> >   F:  package/python-spidev/
> > diff --git a/package/Config.in b/package/Config.in
> > index e3a34d6e97..08574931f8 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1112,6 +1112,7 @@ menu "External python modules"
> >       source "package/python-mbstrdecoder/Config.in"
> >       source "package/python-memory-profiler/Config.in"
> >       source "package/python-mimeparse/Config.in"
> > +     source "package/python-minimalmodbus/Config.in"
> >       source "package/python-mistune/Config.in"
> >       source "package/python-modbus-tk/Config.in"
> >       source "package/python-more-itertools/Config.in"
> > diff --git a/package/python-minimalmodbus/Config.in
> b/package/python-minimalmodbus/Config.in
> > new file mode 100644
> > index 0000000000..fd0f33e0d4
> > --- /dev/null
> > +++ b/package/python-minimalmodbus/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_PYTHON_MINIMALMODBUS
> > +     bool "python-minimalmodbus"
> > +     select BR2_PACKAGE_PYTHON_SERIAL # runtime
> > +     help
> > +       Easy-to-use Modbus RTU and Modbus ASCII implementation.
> > +
> > +       https://minimalmodbus.readthedocs.io/
> > diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash
> b/package/python-minimalmodbus/python-minimalmodbus.hash
> > new file mode 100644
> > index 0000000000..56af3d426b
> > --- /dev/null
> > +++ b/package/python-minimalmodbus/python-minimalmodbus.hash
> > @@ -0,0 +1,4 @@
> > +# sha256 locally computed
> > +sha256
> aa7e3989074d4efba0013c3c50263aec01afae368bd5bd234008b50aea1b7ab4
> minimalmodbus-2.0.1.tar.gz
> > +# Hash for license file
> > +sha256
> abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
> > diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk
> b/package/python-minimalmodbus/python-minimalmodbus.mk
> > new file mode 100644
> > index 0000000000..e4e93b4c31
> > --- /dev/null
> > +++ b/package/python-minimalmodbus/python-minimalmodbus.mk
> > @@ -0,0 +1,14 @@
> >
> +################################################################################
> > +#
> > +# python-minimalmodbus
> > +#
> >
> +################################################################################
> > +
> > +PYTHON_MINIMALMODBUS_VERSION = 2.0.1
> > +PYTHON_MINIMALMODBUS_SOURCE =
> minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
> > +PYTHON_MINIMALMODBUS_SITE = $(call
> github,pyhys,minimalmodbus,$(PYTHON_MINIMALMODBUS_VERSION))
>
> I used ./utils/scanpypi and thus have https://files.pythonhosted.org as
> a site. Does buildroot have any preference for which upstream version of
> python packages to prefer if both work?
>

I don't know, honestly. I was using it from git, and it appeared natural to
me to submit that way. Anyway, it is probably better to have it from pypi.
Let me spin around another revision.


> > +PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
> > +PYTHON_MINIMALMODBUS_LICENSE = Apache License 2.0
> > +PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
> > + > +$(eval $(python-package))
>
> Best,
> Marcus
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--000000000000de1a3e05eb632c07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 19, 2022 at 2:56 PM Marcu=
s Hoffmann &lt;<a href=3D"mailto:marcus.hoffmann@othermo.de">marcus.hoffman=
n@othermo.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Thanks,<br>
<br>
I&#39;ve been meaning to submit this as well but didn&#39;t get around to i=
t yet.<br>
<br>
On 19.10.22 11:03, Angelo Compagnucci wrote:<br>
&gt; Easy-to-use Modbus RTU and Modbus ASCII implementation for Python.<br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarula=
solutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
<br>
One somewhat general question below, but otherwise this looks all good.<br>
<br>
Reviewed-by: Marcus Hoffmann &lt;<a href=3D"mailto:marcus.hoffmann@othermo.=
de" target=3D"_blank">marcus.hoffmann@othermo.de</a>&gt;<br>
<br>
&gt; ---<br>
&gt; V2:<br>
&gt; * Adding me to DEVELOPERS<br>
&gt; <br>
&gt;=C2=A0 =C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0package/python-minimalmodbus/Config.in=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
&gt;=C2=A0 =C2=A0.../python-minimalmodbus/python-minimalmodbus.hash |=C2=A0=
 4 ++++<br>
&gt;=C2=A0 =C2=A0.../python-minimalmodbus/<a href=3D"http://python-minimalm=
odbus.mk" rel=3D"noreferrer" target=3D"_blank">python-minimalmodbus.mk</a>=
=C2=A0 =C2=A0| 14 ++++++++++++++<br>
&gt;=C2=A0 =C2=A05 files changed, 27 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/python-minimalmodbus/Config.in<=
br>
&gt;=C2=A0 =C2=A0create mode 100644 package/python-minimalmodbus/python-min=
imalmodbus.hash<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/python-minimalmodbus/<a href=3D=
"http://python-minimalmodbus.mk" rel=3D"noreferrer" target=3D"_blank">pytho=
n-minimalmodbus.mk</a><br>
&gt; <br>
&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; index c0e6f8bbef..9eb5400999 100644<br>
&gt; --- a/DEVELOPERS<br>
&gt; +++ b/DEVELOPERS<br>
&gt; @@ -173,6 +173,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/mono-gtkshar=
p3/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/monolite/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/openjpeg/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/python-can/<br>
&gt; +F:=C2=A0 =C2=A0package/python-minimalmodbus/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/python-pillow/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/python-pydal/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/python-spidev/<br>
&gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt; index e3a34d6e97..08574931f8 100644<br>
&gt; --- a/package/Config.in<br>
&gt; +++ b/package/Config.in<br>
&gt; @@ -1112,6 +1112,7 @@ menu &quot;External python modules&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-mbstrdecoder/Con=
fig.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-memory-profiler/=
Config.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-mimeparse/Config=
.in&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0source &quot;package/python-minimalmodbus/Config.=
in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-mistune/Config.i=
n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-modbus-tk/Config=
.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-more-itertools/C=
onfig.in&quot;<br>
&gt; diff --git a/package/python-minimalmodbus/Config.in b/package/python-m=
inimalmodbus/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..fd0f33e0d4<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/python-minimalmodbus/Config.in<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +config BR2_PACKAGE_PYTHON_MINIMALMODBUS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;python-minimalmodbus&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_SERIAL # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Easy-to-use Modbus RTU and Modbus ASCII im=
plementation.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://minimalmodbus.readthedo=
cs.io/" rel=3D"noreferrer" target=3D"_blank">https://minimalmodbus.readthed=
ocs.io/</a><br>
&gt; diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/=
package/python-minimalmodbus/python-minimalmodbus.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..56af3d426b<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/python-minimalmodbus/python-minimalmodbus.hash<br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +# sha256 locally computed<br>
&gt; +sha256=C2=A0 aa7e3989074d4efba0013c3c50263aec01afae368bd5bd234008b50a=
ea1b7ab4=C2=A0 minimalmodbus-2.0.1.tar.gz<br>
&gt; +# Hash for license file<br>
&gt; +sha256=C2=A0 abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff=
6d1f6f32=C2=A0 LICENSE<br>
&gt; diff --git a/package/python-minimalmodbus/<a href=3D"http://python-min=
imalmodbus.mk" rel=3D"noreferrer" target=3D"_blank">python-minimalmodbus.mk=
</a> b/package/python-minimalmodbus/<a href=3D"http://python-minimalmodbus.=
mk" rel=3D"noreferrer" target=3D"_blank">python-minimalmodbus.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e4e93b4c31<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/python-minimalmodbus/<a href=3D"http://python-minimalmod=
bus.mk" rel=3D"noreferrer" target=3D"_blank">python-minimalmodbus.mk</a><br=
>
&gt; @@ -0,0 +1,14 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# python-minimalmodbus<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +PYTHON_MINIMALMODBUS_VERSION =3D 2.0.1<br>
&gt; +PYTHON_MINIMALMODBUS_SOURCE =3D minimalmodbus-$(PYTHON_MINIMALMODBUS_=
VERSION).tar.gz<br>
&gt; +PYTHON_MINIMALMODBUS_SITE =3D $(call github,pyhys,minimalmodbus,$(PYT=
HON_MINIMALMODBUS_VERSION))<br>
<br>
I used ./utils/scanpypi and thus have <a href=3D"https://files.pythonhosted=
.org" rel=3D"noreferrer" target=3D"_blank">https://files.pythonhosted.org</=
a> as <br>
a site. Does buildroot have any preference for which upstream version of <b=
r>
python packages to prefer if both work?<br></blockquote><div><br></div><div=
>I don&#39;t know, honestly. I was using it from git, and it appeared natur=
al to me to submit that way. Anyway, it is probably better to have it from =
pypi. Let me spin around another revision.</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; +PYTHON_MINIMALMODBUS_SETUP_TYPE =3D setuptools<br>
&gt; +PYTHON_MINIMALMODBUS_LICENSE =3D Apache License 2.0<br>
&gt; +PYTHON_MINIMALMODBUS_LICENSE_FILES =3D LICENSE<br>
&gt; + &gt; +$(eval $(python-package))<br>
<br>
Best,<br>
Marcus<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--000000000000de1a3e05eb632c07--

--===============7424767675665063320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7424767675665063320==--
