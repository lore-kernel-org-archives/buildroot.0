Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667E8C44529
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 07:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2378C607FB;
	Tue, 21 Jul 2026 07:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yci7rLikbAi; Tue, 21 Jul 2026 07:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA8C5607EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784617587;
	bh=sE5rJIc0ANZ/XkhDr9aYHMZWHBQLqUC8z81kt1tdvRA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dmHkCHVOjAlo0RNhlTRB/YtG3FJrv8lZblvU5jZLwAawBzwoPUWdVzOoChegD9F1i
	 BH+EpK4nx/YZRTvxQPw+GIQgEFrNaNMUHFyPYKudHih/VxdYxJrlL75pinSALTyHKs
	 A97UZvkmMreuLu2CbumqYDMjWyQDqVyXQ/CY09p25e2QZh7Y6tdnDW9br/w2ZzN8xC
	 PlMCiei4RI2L7zBOLOKGfQBejnwnDl7+B8P+Q1pF1BVIAxwzYRHtSweo0u8vtq3g4+
	 aITCbkdRZ1o/a+VLpgfYuWP2RySlO/qdTJ3n6w2lNGmA39Of3Z/jtGWsL+OR3J91gB
	 G6s2hHE4yvuPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA8C5607EC;
	Tue, 21 Jul 2026 07:06:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D34E1093
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 07:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E944640634
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 07:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWFW7_Tq12u8 for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 07:06:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E95F40598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E95F40598
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E95F40598
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 07:06:23 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6a1888969ddso6445561eaf.3
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 00:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784617582; cv=none;
 d=google.com; s=arc-20260327;
 b=azStiRFLFvYe3uuhxZz0n9XEjEb7oq30C6kSGXi+pSOf78vvyZjGTdzx1LI1WYl76Z
 6L0DVX5OZ2/X4h7UnDb6rTeBy5gzr7TtR93tYyllk+NGZiWdSPeVHOTiHo16pj0PGhPa
 K51uqr5qJbCJ4eOkK5UqUXgF+py95Y8enA5h6bTX1hYHOvrSsdtKNxEBCwiY31QkXSG5
 PWjpPQqK1sG9/qO8ohCFZfp/b1+z+4doB8JdKHU8dh8ck2KBbWbaMiTPecoN4jHvQlMP
 RFQgHNVDYQQjuSan0oUZ/ho8nlHstyOoyGjOPbmPVr9N9dev+PA2k+Om3p0GzQfAOdb9
 Mp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=xtupscQ2R3TPV746KpZF3r2hNhR4qjx+knrcI3OvvHg=;
 fh=siEEGlK4OxgQsxxDJxK74FwhxxtTUd9xjx4ss01wdDI=;
 b=CToqX6+xeOJqxV29Lpzy0G8ETqGnZOg3s//V3Eq6+RII/5/Dwa1mLUAcEdpuacGUJ5
 jicT+917M/7baGeMOeJydoH+/W+WOJY5HM6ZQhgeJYL9AknsI7fPkQroFHmPLibNgR+x
 hTqVDH1Dbhjf+lue2z3InXzZcPoBRGq1YxUrW1uGDgTAj0OWsFeGbAMvF1adZXf8vwl9
 PxpD6IwHhq6bGWm6x56qy09f7I3FVsTwQpMsrKc+ysF281jJ/EuVfrJUxzLfO3PyLfgt
 vClpkVPiVqALXSbY5b9kvnweJ1FBHSOJDDQY44KPasmzWEXP3sC1Q0F5Vxw51fk9y//U
 b7PQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784617582; x=1785222382;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xtupscQ2R3TPV746KpZF3r2hNhR4qjx+knrcI3OvvHg=;
 b=i93PTZYyy48TYdH5XmCwGGHsF8hLj6C2W4mA89WcZyoFagqOeTEcW7ue+gDPvc2LO9
 Fac7mpJWUbOmbaatMIPuKAMbaB51b2bxR7S8pf+XqNjdJRVrxVC2Rnyw+YOkOrotVRaT
 UuE1QjpcAqEvtswOAv5zQC4m8ngp629d2z5HsjOS72ZR2IRVdAij8s3zU3N/vsMbjB8i
 R9wvOr0RyATHOpqdmt0fc/k6UIp4Vh37hshmFfStwnh4f/r7qG0bThqBymfw5W66QPqd
 k8h9XtkJbOnm30ZOGbwxIg5062CpuQZOStcolE3AJtNK1f3j/pr0WbmfIuuSCDoUVDMf
 gR3g==
X-Gm-Message-State: AOJu0YzeaV19IDfX4/YNPsFEzECp+jXdC2m5q7tZcCYVX7D7uMpPNsLO
 vGDlwELP7dbay9NxprJ+aIcuZ7GC8y0EcrEcDk8QfWRLadWGUz1shvWlzylYm2yTmDuYkGEfsSU
 x1hgWWThR6zVKqLlL4jgf4ETq8sO4IWotBOXBTtjsFssdPtYm4P2dEBWlrw==
X-Gm-Gg: AfdE7ckQPqzPpIq/eeuMrzXOKWmMZmULR3TpY4ujKGMWSOUtpsSyF7mVlMRqemmdNaf
 FcCFA8W/33BVjPpAoUT3IMJf1X1eBQb6pvOA5RX6tNqhgGXEO10zS30lydzIHlI8FNgdseFid1a
 cRQM53a/JFCmN3Y3xwHcnRPBdDZxaUM4Tos1zZdDa8v+o74agetMMRX3tfi8fgHptYCcaRqQbtb
 K6EqAwFO+Iba+rJf7iR8EOKRk//DaECzQ8i4VP6V8u2s7wE6NgVeKo4+Si4bfYTyb26QqMTVKVs
 goRWfVDhV2dZJgN6SvlmvcdqOOByg+rtqms68U3Jgn6+yCEw12W9xQfJlQkEobWyUIew+8EFY0/
 OeqkEeHu4YKr9
X-Received: by 2002:a05:6820:1386:b0:6a1:7fa0:114e with SMTP id
 006d021491bc7-6a53689359amr8913083eaf.64.1784617582165; Tue, 21 Jul 2026
 00:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260720122202.3073325-1-andrea.ricchi@amarulasolutions.com>
 <677b873ff2144474ec7024f39b6496ff@free.fr>
In-Reply-To: <677b873ff2144474ec7024f39b6496ff@free.fr>
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Tue, 21 Jul 2026 09:06:10 +0200
X-Gm-Features: AUfX_mwIvz2J9uc8o5QN--BeUfahl6VvW9g4_kJp6ShR8nE3RTHeLKfjVnXIxDk
Message-ID: <CABNF3=Z2VPCDu6Od07=qNV7V=_xFSp-Jc1m294MP+AnKsNZpwg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784617582; x=1785222382;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xtupscQ2R3TPV746KpZF3r2hNhR4qjx+knrcI3OvvHg=;
 b=foLE8Tdifj/P2BhApWQtVLI0xZ0CLCE9pdrv+lZuzS0HxLUdMd0DpaV6ufh+qTfkJY
 j4pmpdZE/BpzGt3HVBuXBa7xsS8Xbvxa0tUpC1eVZ97xMGi6+N2qtjTOuDrHLKGoHHk5
 rZtytP1EhZoRYRebIuxMUh+JjHFWI+cMu1Eec=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=foLE8Tdi
Subject: Re: [Buildroot] [PATCH v3] package/libcppconnman: add new package
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
Content-Type: multipart/mixed; boundary="===============4385214775617525638=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4385214775617525638==
Content-Type: multipart/alternative; boundary="0000000000000b8f42065719a991"

--0000000000000b8f42065719a991
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks again for the review, and sorry about the pipeline issue.

I tried running ./utils/test-pkg -a -p libcppconnman locally and got
bootlin-sparc-uclibc
[24/32]: OK. In my .config, I have the following set:

BR2_PACKAGE_LIBCPPCONNMAN=3Dy
BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE=3Dy

Do you have any idea why it works on my machine but fails in the GitLab
pipeline? Could it be due to some specific build environment configuration?

Thanks!

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



On Mon, Jul 20, 2026 at 9:22=E2=80=AFPM Julien Olivain <ju.o@free.fr> wrote=
:

> Hi Andrea,
>
> Thanks for the updated patch!
>
> On 20/07/2026 14:22, Andrea Ricchi wrote:
> > libcppconnman is a C++ library that provides an easy-to-use API
> > to communicate with ConnMan over D-Bus using GDBus.
> >
> > https://github.com/amarula/libcppconnman
> >
> > Also add myself to DEVELOPERS for this package.
> >
> > Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
> > ---
> > Changes v2 -> v3:
> >   - Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_10 dependency (C++20 /
> > <ranges>),
> >     fixing build failures on GCC < 10 toolchains reported by the
> > autobuilders
> >   - Config.in, libcppconnman.mk: select and depend on readline for the
> > example,
> >     fixing the missing readline library configure error when examples
> > are enabled
> >
> > Changes v1 -> v2:
> >   - add missing libcppconnman entry in package/Config.in
> >   - merge the DEVELOPERS addition into this patch
> >
> >  DEVELOPERS                               |  1 +
> >  package/Config.in                        |  1 +
> >  package/libcppconnman/Config.in          | 28 ++++++++++++++++++++++++
> >  package/libcppconnman/libcppconnman.hash |  3 +++
> >  package/libcppconnman/libcppconnman.mk   | 25 +++++++++++++++++++++
> >  5 files changed, 58 insertions(+)
> >  create mode 100644 package/libcppconnman/Config.in
> >  create mode 100644 package/libcppconnman/libcppconnman.hash
> >  create mode 100644 package/libcppconnman/libcppconnman.mk
> >
> [...]
> > diff --git a/package/libcppconnman/Config.in
> > b/package/libcppconnman/Config.in
> > new file mode 100644
> > index 0000000000..d99d711e25
> > --- /dev/null
> > +++ b/package/libcppconnman/Config.in
> > @@ -0,0 +1,28 @@
> > +config BR2_PACKAGE_LIBCPPCONNMAN
> > +     bool "libcppconnman"
> > +     depends on BR2_INSTALL_LIBSTDCPP
> > +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
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
> > +comment "libcppconnman needs a toolchain w/ C++20, wchar, threads"
> > +     depends on BR2_USE_MMU
> > +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> > +             !BR2_TOOLCHAIN_HAS_THREADS ||
> !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> > +
> > +if BR2_PACKAGE_LIBCPPCONNMAN
> > +
> > +config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
> > +     bool "libcppconnman example"
>
> It seems there is still 2 build failures with the examples. See:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2691451879
>
> It is likely due to a missing dependency on BR2_TOOLCHAIN_HAS_SYNC_1.
>
> Could you have a look please?
>
> > +     select BR2_PACKAGE_READLINE
> > +     help
> > +       Compile CLI example.
> > +
> > +endif
>
> Best regards,
>
> Julien.
>

--0000000000000b8f42065719a991
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi Julien,</p><p>Thanks again for the review, and sorry=
 about the pipeline issue.</p><p>I tried running <code>./utils/test-pkg -a =
-p libcppconnman</code> locally and got <code>bootlin-sparc-uclibc [24/32]:=
 OK</code>. In my <code>.config</code>, I have the following set:</p><pre><=
code>BR2_PACKAGE_LIBCPPCONNMAN=3Dy
BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE=3Dy
</code></pre><p>Do you have any idea why it works on my machine but fails i=
n the GitLab pipeline? Could it be due to some specific build environment c=
onfiguration?</p><p>Thanks!</p><div><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p style=3D"color:r=
gb(0,0,0);font-family:&quot;Times New Roman&quot;;font-size:medium;margin-b=
ottom:10px!important"><span style=3D"font-weight:700"><span style=3D"font-s=
ize:14px">Andrea Ricchi</span></span><br><span style=3D"font-size:12px">Emb=
edded Software Engineer<br>M. +39 333 775 4973<br><a href=3D"mailto:andrea.=
ricchi@amarulasolutions.com" target=3D"_blank">andrea.ricchi@amarulasolutio=
ns.com</a></span><br><span style=3D"font-size:12px;color:rgb(241,194,50)">=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95</span><br><spa=
n style=3D"font-size:12px"><span style=3D"font-weight:700">Amarula Solution=
s SRL</span><br>=C2=A0Via Felice Cavallotti 25D, 41012 Carpi, MO, IT<br><a =
href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@amarulasol=
utions.com</a><br><a href=3D"http://www.amarulasolutions.com/" target=3D"_b=
lank">www.amarulasolutions.com</a></span><br></p><p></p></div></div></div><=
br></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Jul 20, 2026 at 9:22=E2=80=AFPM Julien Oli=
vain &lt;<a href=3D"mailto:ju.o@free.fr">ju.o@free.fr</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Andrea,<br>
<br>
Thanks for the updated patch!<br>
<br>
On 20/07/2026 14:22, Andrea Ricchi wrote:<br>
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
&gt; Changes v2 -&gt; v3:<br>
&gt;=C2=A0 =C2=A0- Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_10 dependency =
(C++20 / <br>
&gt; &lt;ranges&gt;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0fixing build failures on GCC &lt; 10 toolchains rep=
orted by the <br>
&gt; autobuilders<br>
&gt;=C2=A0 =C2=A0- Config.in, <a href=3D"http://libcppconnman.mk" rel=3D"no=
referrer" target=3D"_blank">libcppconnman.mk</a>: select and depend on read=
line for the <br>
&gt; example,<br>
&gt;=C2=A0 =C2=A0 =C2=A0fixing the missing readline library configure error=
 when examples <br>
&gt; are enabled<br>
&gt; <br>
&gt; Changes v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0- add missing libcppconnman entry in package/Config.in<br>
&gt;=C2=A0 =C2=A0- merge the DEVELOPERS addition into this patch<br>
&gt; <br>
&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 package/libcppconnman/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 28 ++++++++++++++++++++++++<br>
&gt;=C2=A0 package/libcppconnman/libcppconnman.hash |=C2=A0 3 +++<br>
&gt;=C2=A0 package/libcppconnman/<a href=3D"http://libcppconnman.mk" rel=3D=
"noreferrer" target=3D"_blank">libcppconnman.mk</a>=C2=A0 =C2=A0| 25 ++++++=
+++++++++++++++<br>
&gt;=C2=A0 5 files changed, 58 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/libcppconnman/Config.in<br>
&gt;=C2=A0 create mode 100644 package/libcppconnman/libcppconnman.hash<br>
&gt;=C2=A0 create mode 100644 package/libcppconnman/<a href=3D"http://libcp=
pconnman.mk" rel=3D"noreferrer" target=3D"_blank">libcppconnman.mk</a><br>
&gt; <br>
[...]<br>
&gt; diff --git a/package/libcppconnman/Config.in <br>
&gt; b/package/libcppconnman/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d99d711e25<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/libcppconnman/Config.in<br>
&gt; @@ -0,0 +1,28 @@<br>
&gt; +config BR2_PACKAGE_LIBCPPCONNMAN<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;libcppconnman&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20<=
br>
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
&gt; +comment &quot;libcppconnman needs a toolchain w/ C++20, wchar, thread=
s&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCH=
AR || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_HAS_TH=
READS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10<br>
&gt; +<br>
&gt; +if BR2_PACKAGE_LIBCPPCONNMAN<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;libcppconnman example&quot;<br>
<br>
It seems there is still 2 build failures with the examples. See:<br>
<a href=3D"https://gitlab.com/jolivain/buildroot/-/pipelines/2691451879" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/jolivain/buildroot/-/=
pipelines/2691451879</a><br>
<br>
It is likely due to a missing dependency on BR2_TOOLCHAIN_HAS_SYNC_1.<br>
<br>
Could you have a look please?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_READLINE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Compile CLI example.<br>
&gt; +<br>
&gt; +endif<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--0000000000000b8f42065719a991--

--===============4385214775617525638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4385214775617525638==--
