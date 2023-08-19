Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D26FEE49A3
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 20:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C75CB410A1;
	Sat, 19 Aug 2023 20:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C75CB410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Ywh7tLxsZuW; Sat, 19 Aug 2023 20:27:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDAE41B08;
	Sat, 19 Aug 2023 20:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCDAE41B08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62ED31BF3A0
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 20:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3797B41B08
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 20:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3797B41B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wz3Tj_iTo3u3 for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 20:27:26 +0000 (UTC)
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4298410A1
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 20:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4298410A1
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-44d3e4ad403so141083137.0
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 13:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692476845; x=1693081645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EjGbK1OfghHb6vhghjRKpOiEsPvIEPHNp9VQbmYp/Wc=;
 b=fl0q3EYtJiA33gvl3IwPlhxQ+P4l8WRnC8ZTD7/hW7FNPbKsWeOzhbCIymvTo+tAbA
 3vWI12MOjfQgFaZfGBSOomfmAk3Xty9txZDPUGXz6CH5HqdLl6o9UlH2yhngeumTSaM+
 vGyOPlbTf99ayaK90B4vlz6qa5YwDUHY6rgsuaX9YqQKfPWkTRxbh/6ZXgtLk3xakX/x
 91u25law5VCoOmtPQieLCYL/yK1HX1erDWuy2W8lDvHxl1F8dPiEha8VbvQ9Y1hM8X44
 zKWcu2FkJ86VxlYcGRuMrWcrkrziJzRqPLhnCSdP2wh5B1xTtfZUW00kj+Zly77T/bp7
 6iAw==
X-Gm-Message-State: AOJu0YzdvMDR2jSzSB9Q3SoFAFBKXqDKGLpDJEsWoV7WSi09FtfNv6OT
 dU3gZtKDrw43WqgAw6D/aooSJxw9ktECYdXIBxw=
X-Google-Smtp-Source: AGHT+IFke4lOF1+bnwwau1VxRgPG4Y+KCW4ysl0lqS9z2DKr6axxH+QSV1jp62ekrdz4YLc5N0M9g0W1mYyo/0STYnA=
X-Received: by 2002:a05:6102:52a:b0:44a:ae24:ee50 with SMTP id
 m10-20020a056102052a00b0044aae24ee50mr2713816vsa.10.1692476845307; Sat, 19
 Aug 2023 13:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230818234638.499248-1-romain.naour@gmail.com>
 <20230819135451.GA1778688@scaer>
In-Reply-To: <20230819135451.GA1778688@scaer>
From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 19 Aug 2023 22:27:13 +0200
Message-ID: <CANLo3JiegY5csrt=7QNyboA3sJq=DPZaTn4A=QJM0pJgHJazcw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692476845; x=1693081645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EjGbK1OfghHb6vhghjRKpOiEsPvIEPHNp9VQbmYp/Wc=;
 b=iYr6O2/kPb/qeZN/paoUe3cBUrgnk9kfULMylgDM8uFpbPJH1ytDefg3lSRLjCpZ30
 H5GvQ+X7XovV2hgVOXKFkyCQHVxSS8Ltz4uSUqqTNvBaBN6etV56QI/WKWIVRzXh8S5h
 6ZBMWx5y0nMDTE46hfuVXWkWfMETOdRfzK9rbSa+GFLngX2ntP/vuPkfOGPlWofU0XMl
 WBXla2mKcbh2dp6kn7G+Hyp8AS4+PUwC3Y4/cx038kDNfpwAKf/flhDknXeQ6Fvc+7Xw
 lW1mz4i6Sc9RoenQ+GG65TC+4/HyDevb5SiGAAEoo/E34+B1ooqW10Evq6yzRzNLLmyE
 bqGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iYr6O2/k
Subject: Re: [Buildroot] [PATCH] package/qemu: force the host compiler to
 look at HOST_DIR first
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
Cc: Nicolas CARRIER <carrier.nicolas0@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8084114374973985967=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8084114374973985967==
Content-Type: multipart/alternative; boundary="00000000000027baec06034c79ae"

--00000000000027baec06034c79ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le sam. 19 ao=C3=BBt 2023, 15:54, Yann E. MORIN <yann.morin.1998@free.fr> a
=C3=A9crit :

> Romain, All,
>
> +Bernd for the meson bump
>
> On 2023-08-19 01:46 +0200, Romain Naour spake thusly:
> > Since meson 1.2.0, compiler's search path are retrieved and used
> > to link a library. If the same library is installed on the host
> > and build by Buildroot (HOST_DIR/lib), meson now link against
> > the one found in the compiler's search path instead of linking
> > agains the one provided by Buildroot.
> >
> > See:
> https://github.com/mesonbuild/meson/issues/11914#issuecomment-1678090566
> >
> > Help the compiler by setting -Bprefix that specifies a path where to
> find the
> > executables, libraries, include files, and data files of the compiler
> itself.
> > For each subprogram to be run, the compiler driver first tries the -B
> prefix,
> > if any. If that name is not found, or if -B is not specified, the drive=
r
> > tries two standard prefixes, /usr/lib/gcc/ and /usr/local/lib/gcc/.
>
> So, I understand that this makes qemu actually build, but I am afraid
> this is just hidign the problem.
>
> Indeed, it is possible that we have other host packages that depend on
> some of the host libs we build and that may exist on the system, and
> those packages are also going to break.
>
> For example, host-efl is a host-meson-package, and depends on
> host-libglib2, so presumably we would hav e the issue there too.
>
> We can't fix the breakage by adding -B to all the host packages one by
> one. If -B is idneed the correct fix (I doubt it), then we will have to
> add it to the common HOST_CFLAGS, HOST_CXXFLAGS and so on...
>

I'm not convinced either by this patch (see the comment bellow the ---
sign). Indeed host-qemu may not the only package having such issue...

>
> However, what bothers me slighhtly, is why the qemu link step uses two
> different ways to link with the libglib2 libraries, e.g.:
>
>     -l/path/to/host/lib/libgio-2.0.so
>     -L/path/to/host/lib -lgmodule-2.0
>
> So, why is libgio handled with an absolute path, while libgmodule is
> not? Note that libgio does have a DT_NEEDED on libgmodule.
>
> However, let's have a look at the pkg-config files, let's start with
> gio-2.0.pc:
>
>     Requires: glib-2.0, gobject-2.0
>     Requires.private: gmodule-no-export-2.0, zlib, mount >=3D 2.23
>     Libs: -L${libdir} -lgio-2.0
>     Libs.private: -ldl -lresolv
>
> OK, then gmodule-no-export-2.0.pc:
>
>     Requires: glib-2.0
>     Libs: -L${libdir} -lgmodule-2.0 -pthread
>     Libs.private: -ldl
>
> So, the two are similar. I am not sure to understand how we end up in
> this situation, though... :-/
>

I'm not sure to understand your comment about pc files, this may be another
problem?

This issue could be reproduced with another library.

Do you know any buildsystem using compiler's default paths like this ?


> In the meantime, since the bump to meson 1.2.0 is causing the issue with
> out an easy fix in sight, I'll revert the meson bump.
>

I believe this is the safe solution for the upcoming release.

Best regards,
Romain


> Regards,
> Yann E. MORIN.
>
> > Fixes:
> >     host/lib/libgio-2.0.so: undefined reference to `g_module_open_full'
> >     collect2: error: ld returned 1 exit statu
> >
> > The problem only appear if we have two version of the glib2 library
> installed
> > on the system:
> >
> > [Buildroot]/host/lib/libgio-2.0.so.0.7600.1
> > /usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6600.8
> >
> > This is probably a meson bug introduced by [1] since the error message
> is wrong!
> >
> > $ strings output/host/lib/libgio-2.0.so | grep g_module_open_full
> > g_module_open_full
> >
> > The libgio-2.0.so provided by Buildroot contains the g_module_open_full
> symbol
> > while the libgio-2.0.so installed on the host is too old to have it:
> >
> > $ strings /usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6600.8 | grep
> g_module_open_full
> >
> > [1]
> https://github.com/mesonbuild/meson/commit/59cfbf68e00aa774a9868101f423bd=
662938c15d
> >
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > Cc: Nicolas CARRIER <carrier.nicolas0@gmail.com>
> > ---
> > This meson issue may be not specific to host-qemu...
> > ---
> >  package/qemu/qemu.mk | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> > index b341d0220d..8a8dddee58 100644
> > --- a/package/qemu/qemu.mk
> > +++ b/package/qemu/qemu.mk
> > @@ -401,7 +401,18 @@ HOST_QEMU_ARCH =3D sh4eb
> >  endif
> >  HOST_QEMU_SYS_ARCH ?=3D $(HOST_QEMU_ARCH)
> >
> > -HOST_QEMU_CFLAGS =3D $(HOST_CFLAGS)
> > +# Since meson 1.2.0, compiler's search path are retrieved and used
> > +# to link a library. If the same library is installed on the host
> > +# and build by Buildroot (HOST_DIR/lib), meson now link against
> > +# the one found in the compiler's search path instead of linking
> > +# agains the one provided by Buildroot.
> > +#
> https://github.com/mesonbuild/meson/issues/11914#issuecomment-1678090566
> > +# Help the compiler by setting -Bprefix that specifies where to find t=
he
> > +# executables, libraries, include files, and data files of the compile=
r
> itself.
> > +# For each subprogram to be run, the compiler driver first tries the -=
B
> prefix,
> > +# if any. If that name is not found, or if -B is not specified, the
> driver
> > +# tries two standard prefixes, /usr/lib/gcc/ and /usr/local/lib/gcc/.
> > +HOST_QEMU_CFLAGS =3D $(HOST_CFLAGS) -B$(HOST_DIR)/lib
> >
> >  ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
> >  HOST_QEMU_TARGETS +=3D $(HOST_QEMU_SYS_ARCH)-softmmu
> > --
> > 2.41.0
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

--00000000000027baec06034c79ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Le sam. 19 ao=C3=BBt 2023, 15:54, Yann E. MORIN =
&lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&=
gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Romain, All=
,<br>
<br>
+Bernd for the meson bump<br>
<br>
On 2023-08-19 01:46 +0200, Romain Naour spake thusly:<br>
&gt; Since meson 1.2.0, compiler&#39;s search path are retrieved and used<b=
r>
&gt; to link a library. If the same library is installed on the host<br>
&gt; and build by Buildroot (HOST_DIR/lib), meson now link against<br>
&gt; the one found in the compiler&#39;s search path instead of linking<br>
&gt; agains the one provided by Buildroot.<br>
&gt; <br>
&gt; See: <a href=3D"https://github.com/mesonbuild/meson/issues/11914#issue=
comment-1678090566" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/github.com/mesonbuild/meson/issues/11914#issuecomment-1678090566</a><br>
&gt; <br>
&gt; Help the compiler by setting -Bprefix that specifies a path where to f=
ind the<br>
&gt; executables, libraries, include files, and data files of the compiler =
itself.<br>
&gt; For each subprogram to be run, the compiler driver first tries the -B =
prefix,<br>
&gt; if any. If that name is not found, or if -B is not specified, the driv=
er<br>
&gt; tries two standard prefixes, /usr/lib/gcc/ and /usr/local/lib/gcc/.<br=
>
<br>
So, I understand that this makes qemu actually build, but I am afraid<br>
this is just hidign the problem.<br>
<br>
Indeed, it is possible that we have other host packages that depend on<br>
some of the host libs we build and that may exist on the system, and<br>
those packages are also going to break.<br>
<br>
For example, host-efl is a host-meson-package, and depends on<br>
host-libglib2, so presumably we would hav e the issue there too.<br>
<br>
We can&#39;t fix the breakage by adding -B to all the host packages one by<=
br>
one. If -B is idneed the correct fix (I doubt it), then we will have to<br>
add it to the common HOST_CFLAGS, HOST_CXXFLAGS and so on...<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m not con=
vinced either by this patch (see the comment bellow the --- sign). Indeed h=
ost-qemu may not the only package having such issue...</div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
However, what bothers me slighhtly, is why the qemu link step uses two<br>
different ways to link with the libglib2 libraries, e.g.:<br>
<br>
=C2=A0 =C2=A0 -l/path/to/host/lib/<a href=3D"http://libgio-2.0.so" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libgio-2.0.so</a><br>
=C2=A0 =C2=A0 -L/path/to/host/lib -lgmodule-2.0<br>
<br>
So, why is libgio handled with an absolute path, while libgmodule is<br>
not? Note that libgio does have a DT_NEEDED on libgmodule.<br>
<br>
However, let&#39;s have a look at the pkg-config files, let&#39;s start wit=
h<br>
gio-2.0.pc:<br>
<br>
=C2=A0 =C2=A0 Requires: glib-2.0, gobject-2.0<br>
=C2=A0 =C2=A0 Requires.private: gmodule-no-export-2.0, zlib, mount &gt;=3D =
2.23<br>
=C2=A0 =C2=A0 Libs: -L${libdir} -lgio-2.0<br>
=C2=A0 =C2=A0 Libs.private: -ldl -lresolv<br>
<br>
OK, then gmodule-no-export-2.0.pc:<br>
<br>
=C2=A0 =C2=A0 Requires: glib-2.0<br>
=C2=A0 =C2=A0 Libs: -L${libdir} -lgmodule-2.0 -pthread<br>
=C2=A0 =C2=A0 Libs.private: -ldl<br>
<br>
So, the two are similar. I am not sure to understand how we end up in<br>
this situation, though... :-/<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I&#39;m not sure to understand your comment ab=
out pc files, this may be another problem?</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">This issue could be reproduced with another library.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Do you know any buildsystem=
 using compiler&#39;s default paths like this ?</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<br>
In the meantime, since the bump to meson 1.2.0 is causing the issue with<br=
>
out an easy fix in sight, I&#39;ll revert the meson bump.<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I believe this is =
the safe solution for the upcoming release.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Romain</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Fixes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0host/lib/<a href=3D"http://libgio-2.0.so" rel=3D"no=
referrer noreferrer" target=3D"_blank">libgio-2.0.so</a>: undefined referen=
ce to `g_module_open_full&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0collect2: error: ld returned 1 exit statu<br>
&gt; <br>
&gt; The problem only appear if we have two version of the glib2 library in=
stalled<br>
&gt; on the system:<br>
&gt; <br>
&gt; [Buildroot]/host/lib/libgio-2.0.so.0.7600.1<br>
&gt; /usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6600.8<br>
&gt; <br>
&gt; This is probably a meson bug introduced by [1] since the error message=
 is wrong!<br>
&gt; <br>
&gt; $ strings output/host/lib/<a href=3D"http://libgio-2.0.so" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">libgio-2.0.so</a> | grep g_module_open=
_full<br>
&gt; g_module_open_full<br>
&gt; <br>
&gt; The <a href=3D"http://libgio-2.0.so" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">libgio-2.0.so</a> provided by Buildroot contains the g_modul=
e_open_full symbol<br>
&gt; while the <a href=3D"http://libgio-2.0.so" rel=3D"noreferrer noreferre=
r" target=3D"_blank">libgio-2.0.so</a> installed on the host is too old to =
have it:<br>
&gt; <br>
&gt; $ strings /usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6600.8 | grep g_mo=
dule_open_full<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/mesonbuild/meson/commit/59cfbf68e00a=
a774a9868101f423bd662938c15d" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://github.com/mesonbuild/meson/commit/59cfbf68e00aa774a9868101f423b=
d662938c15d</a><br>
&gt; <br>
&gt; Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.c=
om" target=3D"_blank" rel=3D"noreferrer">romain.naour@gmail.com</a>&gt;<br>
&gt; Cc: Nicolas CARRIER &lt;<a href=3D"mailto:carrier.nicolas0@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">carrier.nicolas0@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; This meson issue may be not specific to host-qemu...<br>
&gt; ---<br>
&gt;=C2=A0 package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">qemu.mk</a> | 13 ++++++++++++-<br>
&gt;=C2=A0 1 file changed, 12 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">qemu.mk</a> b/package/qemu/<a href=3D"http:/=
/qemu.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">qemu.mk</a><br>
&gt; index b341d0220d..8a8dddee58 100644<br>
&gt; --- a/package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">qemu.mk</a><br>
&gt; +++ b/package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">qemu.mk</a><br>
&gt; @@ -401,7 +401,18 @@ HOST_QEMU_ARCH =3D sh4eb<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 HOST_QEMU_SYS_ARCH ?=3D $(HOST_QEMU_ARCH)<br>
&gt;=C2=A0 <br>
&gt; -HOST_QEMU_CFLAGS =3D $(HOST_CFLAGS)<br>
&gt; +# Since meson 1.2.0, compiler&#39;s search path are retrieved and use=
d<br>
&gt; +# to link a library. If the same library is installed on the host<br>
&gt; +# and build by Buildroot (HOST_DIR/lib), meson now link against<br>
&gt; +# the one found in the compiler&#39;s search path instead of linking<=
br>
&gt; +# agains the one provided by Buildroot.<br>
&gt; +# <a href=3D"https://github.com/mesonbuild/meson/issues/11914#issueco=
mment-1678090566" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
ithub.com/mesonbuild/meson/issues/11914#issuecomment-1678090566</a><br>
&gt; +# Help the compiler by setting -Bprefix that specifies where to find =
the<br>
&gt; +# executables, libraries, include files, and data files of the compil=
er itself.<br>
&gt; +# For each subprogram to be run, the compiler driver first tries the =
-B prefix,<br>
&gt; +# if any. If that name is not found, or if -B is not specified, the d=
river<br>
&gt; +# tries two standard prefixes, /usr/lib/gcc/ and /usr/local/lib/gcc/.=
<br>
&gt; +HOST_QEMU_CFLAGS =3D $(HOST_CFLAGS) -B$(HOST_DIR)/lib<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)<br>
&gt;=C2=A0 HOST_QEMU_TARGETS +=3D $(HOST_QEMU_SYS_ARCH)-softmmu<br>
&gt; -- <br>
&gt; 2.41.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"no=
referrer">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
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
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=
=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div></div></div>

--00000000000027baec06034c79ae--

--===============8084114374973985967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8084114374973985967==--
