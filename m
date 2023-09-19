Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA78CE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE8B14001F;
	Tue, 19 Sep 2023 19:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE8B14001F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7eC620j8CQwZ; Tue, 19 Sep 2023 19:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DE6B4059D;
	Tue, 19 Sep 2023 19:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DE6B4059D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19C471BF409
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 19:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 000F380F53
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 19:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 000F380F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2-EWFFG1A4H for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 19:54:39 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 806FB80F22
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 19:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 806FB80F22
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-530e180ffcbso3687243a12.1
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 12:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695153277; x=1695758077;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K+Kn6+lPLzNmpp4KRnaSvw8gs99RTbUiLYDq9/AbLgc=;
 b=S68IL7OU9T41FS0A2SJkiSh6fF+/bPN3eqcTCiRO0InYRQy3x4L14+KjJY5jh2QIV6
 Q4B0UBvQ+vbf6DQvh+AxFdknBivo5ek1SA/sPSeC/oewMYXOMOqxF6P6/8eWVdMTwaQZ
 7fLr7T5h6UBt2OEbwHejRKbT3l3Rg8v7KWQQLCgig05RobeEl5mRtHfcC2jdv+hJClNP
 wblDOl2JIfF/EU8+MRz1LlNJah99MBiZCaURKYkhgQzPYB46vv27XJCffDuHWyYdIF61
 Fk2yUa/O3GVbAkX8MVjf5riAFSvHQ7Gtbc2qzKrAND/PkAPaqQPUI7BedCt+QKMAux68
 lpFQ==
X-Gm-Message-State: AOJu0YxfnLAXgrNQ9cpFDyW0T9t/Lj47GrHIj/f8A1EZvzqnXa8q89za
 dsB0XGCLa4JTILddZKaH5vvinbTMbgW38+HJufT0dt7ZJkM=
X-Google-Smtp-Source: AGHT+IHxAHjXiOKAp+DgyYNis+qG54ZkGjwkvez1QhVl76nTcVhf5K6ouuvq7zoNMgeN/Cx0Y+cN46ja0qWlaS2kC3Y=
X-Received: by 2002:aa7:c38d:0:b0:530:8d55:9c6f with SMTP id
 k13-20020aa7c38d000000b005308d559c6fmr388730edq.2.1695153277256; Tue, 19 Sep
 2023 12:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230919125542.9100-1-kazemi.ms@gmail.com>
 <20230919151932.4fb03b01@windsurf>
In-Reply-To: <20230919151932.4fb03b01@windsurf>
From: Saeed Kazemi <kazemi.ms@gmail.com>
Date: Tue, 19 Sep 2023 21:54:26 +0200
Message-ID: <CAM8b=FvZxU=t3PpmyuSKCQv1DZ3FzA_3xgfZ1j_TgbcxgGb1fQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695153277; x=1695758077; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K+Kn6+lPLzNmpp4KRnaSvw8gs99RTbUiLYDq9/AbLgc=;
 b=EAVNV7vA6aMxOt72hNb/Rz6APYLbnhIdOKbxvFss0g0Q+ysoca0EcV30q0T2PXGJkU
 uXoD49QzPYw9BD6inX1L3QJ0vgLD0duYkTP6X4BAgKcaUTMruIDo/AAl3XxuYcYglSwQ
 0Sp+6EHixrjDxWjws84pFDOFD+/gBGshGwrqbaSDr2YnuQWzB13lDg9D5fFou7eTMGI5
 6LFtPtWNI5VZzusIZWr+2zbM0uWhXxa55GX6I+jshv8+KAZ1ftc9qkBCExSbo8bFaunn
 vxnmyQa8edtik107WMmwiQh+OLp+TL+y4DaF+msKxiPkxb5xpW0NqgH15Wp7x+ImuZQi
 9HDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EAVNV7vA
Subject: Re: [Buildroot] [PATCH 1/1] package/mxt-app: new package
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
Content-Type: multipart/mixed; boundary="===============8312552406335159815=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8312552406335159815==
Content-Type: multipart/alternative; boundary="000000000000ee49e40605bba038"

--000000000000ee49e40605bba038
Content-Type: text/plain; charset="UTF-8"

Hello,
Thanks for your feedback.

I applied your suggestions and also added an option for enabling debug
(disable by default)

Thanks,
Saeed

On Tue, Sep 19, 2023 at 15:19 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Tue, 19 Sep 2023 14:55:42 +0200
> kazemi.ms@gmail.com wrote:
>
> > From: Saeed Kazemi <kazemi.ms@gmail.com>
> >
> > mxt-app is a utility for managing Atmel maXTouch touch controllers
> > and other devices that support Atmel Object Based Protocol.
> >
> > Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
>
> Thanks for this contribution! This looks pretty good, but I have a few
> comments below.
>
> > ---
> >  package/Config.in            |  1 +
> >  package/mxt-app/Config.in    |  8 ++++++++
> >  package/mxt-app/mxt-app.hash |  2 ++
> >  package/mxt-app/mxt-app.mk   | 20 ++++++++++++++++++++
> >  4 files changed, 31 insertions(+)
> >  create mode 100644 package/mxt-app/Config.in
> >  create mode 100644 package/mxt-app/mxt-app.hash
> >  create mode 100644 package/mxt-app/mxt-app.mk
>
> Could you add an entry in the DEVELOPERS file for this package?
>
> > diff --git a/package/mxt-app/Config.in b/package/mxt-app/Config.in
> > new file mode 100644
> > index 0000000000..7e8a5f4901
> > --- /dev/null
> > +++ b/package/mxt-app/Config.in
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_MXT_APP
> > +     bool "mxt-app"
> > +     select BR2_PACKAGE_LIBUSB
>
> You need to replicate the "depends on" from libusb:
>
>         depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
>
>
> > +     help
> > +       mxt-app is a utility for managing Atmel maXTouch touch
> controllers
> > +       and other devices that support Atmel Object Based Protocol.
> > +
> > +       https://github.com/atmel-maxtouch/mxt-app/
>
> And add a Config.in comment:
>
> comment "mxt-app needs a toolchain w/ threads, gcc >= 4.9"
>         depends on !BR2_TOOLCHAIN_HAS_THREADS || \
>                 !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>
>
> > diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.hash
> > new file mode 100644
> > index 0000000000..abf20c728a
> > --- /dev/null
> > +++ b/package/mxt-app/mxt-app.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256
> 3639720ae1ea033bd982d68c5cab84432ce046fe14a66d9b2de07f115b642722
> v1.36.tar.gz
>
> We need the hash of the license file to be present.
>
> > diff --git a/package/mxt-app/mxt-app.mk b/package/mxt-app/mxt-app.mk
> > new file mode 100644
> > index 0000000000..626cd352fc
> > --- /dev/null
> > +++ b/package/mxt-app/mxt-app.mk
> > @@ -0,0 +1,20 @@
> >
> +################################################################################
> > +#
> > +# mxt-app
> > +#
> >
> +################################################################################
> > +
> > +MXT_APP_VERSION = 1.36
> > +MXT_APP_SOURCE = v$(MXT_APP_VERSION).tar.gz
> > +MXT_APP_SITE =
> https://github.com/atmel-maxtouch/mxt-app/archive/refs/tags
>
> Could you use the github macro instead?
>
> MXT_APP_VERSION = 1.36
> MXT_APP_SITE = $(call github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))
>
> you will to adjust the hash file accordingly.
>
> > +MXT_APP_LICENSE = Atmel License
>
> The license is actually BSD-2-Clause
>
> > +MXT_APP_LICENSE_FILES = LICENSE
> > +MXT_APP_DEPENDENCIES = libusb
> > +MXT_APP_INSTALL_STAGING = YES
> > +MXT_APP_AUTORECONF = YES
> > +MXT_APP_CONF_OPTS = --enable-debug
>
> Why --enable-debug by default?
>
> > +MXT_APP_CXXFLAGS = $(TARGET_CXXFLAGS)
> > +MXT_APP_CONF_ENV = CXXFLAGS="$(MXT_APP_CXXFLAGS)"
>
> I'm not sure what's the purpose of those two lines. CXXFLAGS are
> already passed by the autotools-package infrastructure in the
> environment of the configure script, so this seems redundant.
>
> Could you rework the patch to take into account those suggestions, and
> send an updated version?
>
> Also, make sure to:
>
> (1) Run "make check-package" to validate the coding style
>
> (2) Use utils/test-pkg to validate that the package builds fine
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000ee49e40605bba038
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,=C2=A0</div><div dir=3D"auto">Thanks for your feedb=
ack.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I applied your sugg=
estions and also added an option for enabling debug (disable by default)</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"a=
uto">Saeed</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 19, 2023 at 15:19 Thomas Petazzoni &lt;<a href=
=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;=
border-left-color:rgb(204,204,204)">Hello,<br>
<br>
On Tue, 19 Sep 2023 14:55:42 +0200<br>
<a href=3D"mailto:kazemi.ms@gmail.com" target=3D"_blank">kazemi.ms@gmail.co=
m</a> wrote:<br>
<br>
&gt; From: Saeed Kazemi &lt;<a href=3D"mailto:kazemi.ms@gmail.com" target=
=3D"_blank">kazemi.ms@gmail.com</a>&gt;<br>
&gt; <br>
&gt; mxt-app is a utility for managing Atmel maXTouch touch controllers<br>
&gt; and other devices that support Atmel Object Based Protocol.<br>
&gt; <br>
&gt; Signed-off-by: Saeed Kazemi &lt;<a href=3D"mailto:kazemi.ms@gmail.com"=
 target=3D"_blank">kazemi.ms@gmail.com</a>&gt;<br>
<br>
Thanks for this contribution! This looks pretty good, but I have a few<br>
comments below.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt;=C2=A0 package/mxt-app/Config.in=C2=A0 =C2=A0 |=C2=A0 8 ++++++++<br>
&gt;=C2=A0 package/mxt-app/mxt-app.hash |=C2=A0 2 ++<br>
&gt;=C2=A0 package/mxt-app/<a href=3D"http://mxt-app.mk" rel=3D"noreferrer"=
 target=3D"_blank">mxt-app.mk</a>=C2=A0 =C2=A0| 20 ++++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 31 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/mxt-app/Config.in<br>
&gt;=C2=A0 create mode 100644 package/mxt-app/mxt-app.hash<br>
&gt;=C2=A0 create mode 100644 package/mxt-app/<a href=3D"http://mxt-app.mk"=
 rel=3D"noreferrer" target=3D"_blank">mxt-app.mk</a><br>
<br>
Could you add an entry in the DEVELOPERS file for this package?<br>
<br>
&gt; diff --git a/package/mxt-app/Config.in b/package/mxt-app/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7e8a5f4901<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/mxt-app/Config.in<br>
&gt; @@ -0,0 +1,8 @@<br>
&gt; +config BR2_PACKAGE_MXT_APP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;mxt-app&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBUSB<br>
<br>
You need to replicate the &quot;depends on&quot; from libusb:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_THREADS # libusb<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # lib=
usb<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mxt-app is a utility for managing Atmel ma=
XTouch touch controllers<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0and other devices that support Atmel Objec=
t Based Protocol.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/atmel-maxtou=
ch/mxt-app/" rel=3D"noreferrer" target=3D"_blank">https://github.com/atmel-=
maxtouch/mxt-app/</a><br>
<br>
And add a Config.in comment:<br>
<br>
comment &quot;mxt-app needs a toolchain w/ threads, gcc &gt;=3D 4.9&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_TOOLCHAIN_HAS_THREADS || \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !BR2_TOOLCHAIN_GCC_=
AT_LEAST_4_9<br>
<br>
<br>
&gt; diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.ha=
sh<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..abf20c728a<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/mxt-app/mxt-app.hash<br>
&gt; @@ -0,0 +1,2 @@<br>
&gt; +# Locally calculated<br>
&gt; +sha256=C2=A0 3639720ae1ea033bd982d68c5cab84432ce046fe14a66d9b2de07f11=
5b642722=C2=A0 v1.36.tar.gz<br>
<br>
We need the hash of the license file to be present.<br>
<br>
&gt; diff --git a/package/mxt-app/<a href=3D"http://mxt-app.mk" rel=3D"nore=
ferrer" target=3D"_blank">mxt-app.mk</a> b/package/mxt-app/<a href=3D"http:=
//mxt-app.mk" rel=3D"noreferrer" target=3D"_blank">mxt-app.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..626cd352fc<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/mxt-app/<a href=3D"http://mxt-app.mk" rel=3D"noreferrer"=
 target=3D"_blank">mxt-app.mk</a><br>
&gt; @@ -0,0 +1,20 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# mxt-app<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +MXT_APP_VERSION =3D 1.36<br>
&gt; +MXT_APP_SOURCE =3D v$(MXT_APP_VERSION).tar.gz<br>
&gt; +MXT_APP_SITE =3D <a href=3D"https://github.com/atmel-maxtouch/mxt-app=
/archive/refs/tags" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/atmel-maxtouch/mxt-app/archive/refs/tags</a><br>
<br>
Could you use the github macro instead?<br>
<br>
MXT_APP_VERSION =3D 1.36<br>
MXT_APP_SITE =3D $(call github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))<=
br>
<br>
you will to adjust the hash file accordingly.<br>
<br>
&gt; +MXT_APP_LICENSE =3D Atmel License<br>
<br>
The license is actually BSD-2-Clause<br>
<br>
&gt; +MXT_APP_LICENSE_FILES =3D LICENSE<br>
&gt; +MXT_APP_DEPENDENCIES =3D libusb<br>
&gt; +MXT_APP_INSTALL_STAGING =3D YES<br>
&gt; +MXT_APP_AUTORECONF =3D YES<br>
&gt; +MXT_APP_CONF_OPTS =3D --enable-debug<br>
<br>
Why --enable-debug by default?<br>
<br>
&gt; +MXT_APP_CXXFLAGS =3D $(TARGET_CXXFLAGS)<br>
&gt; +MXT_APP_CONF_ENV =3D CXXFLAGS=3D&quot;$(MXT_APP_CXXFLAGS)&quot;<br>
<br>
I&#39;m not sure what&#39;s the purpose of those two lines. CXXFLAGS are<br=
>
already passed by the autotools-package infrastructure in the<br>
environment of the configure script, so this seems redundant.<br>
<br>
Could you rework the patch to take into account those suggestions, and<br>
send an updated version?<br>
<br>
Also, make sure to:<br>
<br>
(1) Run &quot;make check-package&quot; to validate the coding style<br>
<br>
(2) Use utils/test-pkg to validate that the package builds fine<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000ee49e40605bba038--

--===============8312552406335159815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8312552406335159815==--
