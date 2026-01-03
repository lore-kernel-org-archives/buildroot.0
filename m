Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B818DFC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 838404040C;
	Sat,  3 Jan 2026 11:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWc41fYAu7NC; Sat,  3 Jan 2026 11:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 510B6406F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767439225;
	bh=JtPMnJnThl4ZSDHJ09DOhMnCucSZaFEKo+nIM/cd/q0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e9LCFNhujV/nB7M2RNICsl9mLQNuwzetnVLZ851raAzlsn2sN6xYeN6quP98z8Hrt
	 MVcrrl5ZYmcv7dfbOGO8a3xjrOdNQpj7TAVFO9hpKrfH6s0sbbSKY2xfNJi7d9n0wX
	 G/q3d1yr4rMeKNJinRHQHJE/zvjq5qXZX3P9s0CsSYJC9P+R8Yw8gjDi7DNH+EBabY
	 JdHDSQRgWCp5vyuvQGwah0n451vN8FIBUOA9mDCTjeUAzJRJWRYSO85S/OckeYi+GG
	 o4hkmgctuFYeXa7TKjD6PTTrAA4cRLQSLp/PbEkuDtkpmF5mhU/RPcOCNK2rYGUhpW
	 odY5/NfFcup8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 510B6406F3;
	Sat,  3 Jan 2026 11:20:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BAA3351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2948B403EB
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdOdgdEZBUlB for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:20:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.222.171;
 helo=mail-qk1-f171.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1550400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1550400D6
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1550400D6
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:20:22 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8b2f0f9e4cbso48904385a.0
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 03:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767439221; x=1768044021;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWK8Xjm0k6mZ73b7yTr26At7I+6aSHX/XnwkOTvrBRM=;
 b=A6NvVTrfD5PMXhaQdnjDnWmyeKcqeoUrMpJKbeYVlFMJvAH9WPDyQIWEuttY7PkvGZ
 jrX4x/PnlxCA57IxIiiTZsAY4+fC+/FBoYpUA9Uood3hErhZdcJiAUbyKGEjR330TUlv
 ykQ+aeurKqI+Hw0Fz/NyRCtPeAxdekwnQN1bVVYb0SeIUZG8wojNk0yCJYiGLWWBBDkc
 r3CzRSy7RLiXcuuMtVvrGd4lct+lwmmFJ2pK4SQwt+lLzcIFB9fYAMTEVfxVi+n88nPn
 v56FE2E482fW1i8BhZEjh5PEVxRLyectgpulUhslUdkfE+Nc4A/bCbS5U4S+gyW7kvhX
 sIyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTtk6trBdwzoGcZrMDHnimgov6VT/07y35RmrLOk3yxX5mRRNIFKB4hMKDlYZE0yhrpiL3OSMxnqg=@buildroot.org
X-Gm-Message-State: AOJu0YwTFvGwaxkYekuTqX+YSaRyJP5Il3kVWKF7oYjiU+kL4Jf7th2Z
 YPvAVQvgZskVTFxDuVzAtEhq431oKYtxT6HT5FY3OgiyC8UNiK81ZNclomqI5h0N
X-Gm-Gg: AY/fxX4A+671USpbPoxQuXAoMSIRQpnYg3KY2VK6mM6K9RfPWLgfJvMYrOLF9wJEy08
 lWdrSBjLbOtMt/wRCoDWEnXQ5uAcW+gIMJUgWyDmC1JmnS/gzDbwjbo8yuZMk8q+tfndcV9ahdw
 9qlyO/Z9lpO3iUlHykfMgBghghx3BcvtvTthwY+Upw0B7hNNjmWI7p96FZJRGq7cpvFTbCGa+8C
 DYJjMAtahKqEIpaUYWQKMAOg/n8c2S3dc2MBlOzLyqTu13P7rJiEjF46j+GgWxy3zK5NVONjzud
 wuCPx2L8pcSbbvfvJxS9onskRlEX03yZkRwZ9pcMvo6TXH29xutkoYGfpwmimBKKmM1bz/5l84z
 b9ZbQgXtsPuozi0tE0XGRv6DhpEnhaRsbPQ/zEeHh4UHeDPx93Fd6aha54jSgG0Tl52syZ31EVT
 ZcQQY1he15UhwgJOeDxFnmkL+NlQewvg7gEl8Fs8VtfMM9mCZFB8A9SAcTDiFJTh4cB0swMzVLb
 BGvazI=
X-Google-Smtp-Source: AGHT+IEb/boKY0UbNVNbVU3GKlaLs5VdvrHh8OQg81Tv5Aquwjbr7nc0FTre8BJ13GHuzsYB0Bp81w==
X-Received: by 2002:a05:620a:4448:b0:878:215e:e3b3 with SMTP id
 af79cd13be357-8c3569bb7famr314993785a.8.1767439221375; 
 Sat, 03 Jan 2026 03:20:21 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c095b79b32sm3305495885a.0.2026.01.03.03.20.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jan 2026 03:20:21 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-888310b91c5so4941496d6.1
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 03:20:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWKvAwy9SOUktxoahEPoRQBTiw4Bz9Rb2BHBMuG5gI74JilxYsUkKFEG0XlRmJ93bxZF6WU/ZPREJw=@buildroot.org
X-Received: by 2002:a05:622a:5cf:b0:4ee:bac:e3aa with SMTP id
 d75a77b69052e-4ff473d05dfmr37117241cf.35.1767439220655; Sat, 03 Jan 2026
 03:20:20 -0800 (PST)
MIME-Version: 1.0
References: <CACXRmJitiNM=oBYeGc2C40vP=wRYaaYJjiGMN7siwTWJ=vWPwQ@mail.gmail.com>
 <20251019064503.2583945-1-thomas@devoogdt.com>
 <20251019064503.2583945-3-thomas@devoogdt.com>
 <20260101180011.5650067c@windsurf>
In-Reply-To: <20260101180011.5650067c@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 3 Jan 2026 12:20:09 +0100
X-Gmail-Original-Message-ID: <CACXRmJgjD9ObpzheUQ5wxCRf2fQq1GZiMEGZK2UxEJxz+hNffQ@mail.gmail.com>
X-Gm-Features: AQt7F2qc2oURR8BWT1iv6_XXFYgZj626TuI55tOtZ0zJ78yHDso2_OHBmlZO-Hg
Message-ID: <CACXRmJgjD9ObpzheUQ5wxCRf2fQq1GZiMEGZK2UxEJxz+hNffQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org,
 eric.le.bihan.dev@free.fr, 
 fontaine.fabrice@gmail.com, guillaume.chaye@zeetim.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v6] package/librsvg: bump version to 2.61.1
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
Content-Type: multipart/mixed; boundary="===============2135884565607987912=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2135884565607987912==
Content-Type: multipart/alternative; boundary="000000000000e8cc1506477a0202"

--000000000000e8cc1506477a0202
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

There was something wrong with sending this patch - it should have been
part of the cargo-c series. It also depends on the discussion about having
patches at the pre-vendoring stage (
https://lore.kernel.org/buildroot/20260101173630.10079d1b@windsurf/).

I remember that I already did a quite extensive search on which packages
are and are not required to be selected in both the target and the host
package. I will investigate this further once we have cargo-c support in
buildroot.

Kind regards,
Thomas Devoogdt

Op do 1 jan 2026 om 18:00 schreef Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Thomas,
>
> On Sun, 19 Oct 2025 08:45:03 +0200
> Thomas Devoogdt <thomas@devoogdt.com> wrote:
>
> > This is a major update, which replaces autotools with meson.
> > The package uses cargo in the background, so copy the relevant
> > environment from the cargo package to get things working.
> >
> > Note that the download URL has been changed because cargo
> > vendoring needs .tar.gz for it's post_process_unpack.
> >
> > Announcement (for what it's worth):
> >  - https://gitlab.gnome.org/GNOME/librsvg/-/releases/2.61.1
> >
> > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
>
> Thanks for the patch!
>
> > cat libgtk4.config
> > BR2_PACKAGE_MESA3D=y
> > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> > BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> > BR2_PACKAGE_LIBGTK4=y
>
> It's good to test large configs, but they risk bringing extra
> dependencies, making you not aware of dependencies you might be missing
> for librsvg.
>
> I realized only later that this patch needs cargo-c, which isn't in
> Buildroot yet. Could you make sure to always send patches with their
> dependencies?
>
>
> > -LIBRSVG_VERSION_MAJOR = 2.50
> > -LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).9
> > -LIBRSVG_SITE =
> https://download.gnome.org/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
> > -LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
> > +LIBRSVG_VERSION = 2.61.1
> > +LIBRSVG_SITE =
> https://gitlab.gnome.org/GNOME/librsvg/-/archive/$(LIBRSVG_VERSION)
> >  LIBRSVG_INSTALL_STAGING = YES
> > -LIBRSVG_CONF_ENV = \
> > -     LIBS=$(TARGET_NLS_LIBS) \
> > -     RUST_TARGET=$(RUSTC_TARGET_NAME)
> > -LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
> > -HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
> > -LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf host-rustc
> libglib2 libxml2 pango \
> > -     $(TARGET_NLS_DEPENDENCIES)
> > -HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libglib2
> host-libxml2 host-pango host-rustc
> >  LIBRSVG_LICENSE = LGPL-2.1+
> >  LIBRSVG_LICENSE_FILES = COPYING.LIB
> >  LIBRSVG_CPE_ID_VENDOR = gnome
> > -# We're patching gdk-pixbuf-loader/Makefile.am
> > -LIBRSVG_AUTORECONF = YES
> > +
> > +LIBRSVG_DOWNLOAD_POST_PROCESS = cargo
> > +LIBRSVG_DL_ENV = $(PKG_CARGO_ENV)
> > +
> > +LIBRSVG_CONF_ENV = $(PKG_CARGO_ENV)
> > +LIBRSVG_NINJA_ENV = $(PKG_CARGO_ENV)
> > +LIBRSVG_CONF_OPTS = \
> > +     -Dtriplet=$(RUSTC_TARGET_NAME) \
> > +     -Drsvg-convert=disabled \
> > +     -Dpixbuf-loader=disabled \
> > +     -Ddocs=disabled \
> > +     -Dtests=false
> > +LIBRSVG_DEPENDENCIES = \
> > +     host-cairo \
>
> Are you sure host-cairo is needed?
>
> > +     host-cargo-c \
> > +     host-libxml2 \
>
> And host-libxml2?
>
> > +     host-pango \
>
> And host-pango2 ?
>
> > +     host-rustc \
> > +     cairo \
> > +     gdk-pixbuf \
>
> According to the documentation of librsvg, gdk-pixbuf is an optional
> dependency.
>
> However, according to the documentation, freetype is mandatory. You get
> it automatically as it is a dependency of cairo, but I think it would
> be preferable to express this dependency here.
>
> > +     libglib2 \
> > +     libxml2 \
> > +     pango \
> > +     $(TARGET_NLS_DEPENDENCIES)
> > +
> > +HOST_LIBRSVG_CONF_ENV = $(HOST_PKG_CARGO_ENV)
> > +HOST_LIBRSVG_NINJA_ENV = $(HOST_PKG_CARGO_ENV)
> > +HOST_LIBRSVG_CONF_OPTS = \
> > +     -Dintrospection=disabled
> > +HOST_LIBRSVG_DEPENDENCIES = \
> > +     host-cairo \
> > +     host-cargo-c \
> > +     host-gdk-pixbuf \
>
> Maybe not needed?
>
> Could you investigate this, and resend as part of the cargo-c series?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>
>

--000000000000e8cc1506477a0202
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas,<br><br>There was something wrong with sending t=
his patch - it should have been part of the cargo-c series. It also depends=
 on the discussion about having patches at the pre-vendoring stage (<a href=
=3D"https://lore.kernel.org/buildroot/20260101173630.10079d1b@windsurf/">ht=
tps://lore.kernel.org/buildroot/20260101173630.10079d1b@windsurf/</a>).<br>=
<br>I remember that I already did a quite extensive search on which package=
s are and are not required to be selected in both the target and the host p=
ackage. I will investigate this further once we have cargo-c support in bui=
ldroot.<br><br>Kind regards,<br>Thomas Devoogdt</div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Op do =
1 jan 2026 om 18:00 schreef Thomas Petazzoni &lt;<a href=3D"mailto:thomas.p=
etazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hello Thomas,<br>
<br>
On Sun, 19 Oct 2025 08:45:03 +0200<br>
Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.com" target=3D"_blank=
">thomas@devoogdt.com</a>&gt; wrote:<br>
<br>
&gt; This is a major update, which replaces autotools with meson.<br>
&gt; The package uses cargo in the background, so copy the relevant<br>
&gt; environment from the cargo package to get things working.<br>
&gt; <br>
&gt; Note that the download URL has been changed because cargo<br>
&gt; vendoring needs .tar.gz for it&#39;s post_process_unpack.<br>
&gt; <br>
&gt; Announcement (for what it&#39;s worth):<br>
&gt;=C2=A0 - <a href=3D"https://gitlab.gnome.org/GNOME/librsvg/-/releases/2=
.61.1" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/=
librsvg/-/releases/2.61.1</a><br>
&gt; <br>
&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.c=
om" target=3D"_blank">thomas@devoogdt.com</a>&gt;<br>
<br>
Thanks for the patch!<br>
<br>
&gt; cat libgtk4.config<br>
&gt; BR2_PACKAGE_MESA3D=3Dy<br>
&gt; BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=3Dy<br>
&gt; BR2_PACKAGE_MESA3D_OPENGL_EGL=3Dy<br>
&gt; BR2_PACKAGE_LIBGTK4=3Dy<br>
<br>
It&#39;s good to test large configs, but they risk bringing extra<br>
dependencies, making you not aware of dependencies you might be missing<br>
for librsvg.<br>
<br>
I realized only later that this patch needs cargo-c, which isn&#39;t in<br>
Buildroot yet. Could you make sure to always send patches with their<br>
dependencies?<br>
<br>
<br>
&gt; -LIBRSVG_VERSION_MAJOR =3D 2.50<br>
&gt; -LIBRSVG_VERSION =3D $(LIBRSVG_VERSION_MAJOR).9<br>
&gt; -LIBRSVG_SITE =3D <a href=3D"https://download.gnome.org/sources/librsv=
g/$(LIBRSVG_VERSION_MAJOR)" rel=3D"noreferrer" target=3D"_blank">https://do=
wnload.gnome.org/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)</a><br>
&gt; -LIBRSVG_SOURCE =3D librsvg-$(LIBRSVG_VERSION).tar.xz<br>
&gt; +LIBRSVG_VERSION =3D 2.61.1<br>
&gt; +LIBRSVG_SITE =3D <a href=3D"https://gitlab.gnome.org/GNOME/librsvg/-/=
archive/$(LIBRSVG_VERSION)" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.gnome.org/GNOME/librsvg/-/archive/$(LIBRSVG_VERSION)</a><br>
&gt;=C2=A0 LIBRSVG_INSTALL_STAGING =3D YES<br>
&gt; -LIBRSVG_CONF_ENV =3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0LIBS=3D$(TARGET_NLS_LIBS) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RUST_TARGET=3D$(RUSTC_TARGET_NAME)<br>
&gt; -LIBRSVG_CONF_OPTS =3D --disable-pixbuf-loader --disable-tools<br>
&gt; -HOST_LIBRSVG_CONF_OPTS =3D --enable-introspection=3Dno<br>
&gt; -LIBRSVG_DEPENDENCIES =3D cairo host-gdk-pixbuf gdk-pixbuf host-rustc =
libglib2 libxml2 pango \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(TARGET_NLS_DEPENDENCIES)<br>
&gt; -HOST_LIBRSVG_DEPENDENCIES =3D host-cairo host-gdk-pixbuf host-libglib=
2 host-libxml2 host-pango host-rustc<br>
&gt;=C2=A0 LIBRSVG_LICENSE =3D LGPL-2.1+<br>
&gt;=C2=A0 LIBRSVG_LICENSE_FILES =3D COPYING.LIB<br>
&gt;=C2=A0 LIBRSVG_CPE_ID_VENDOR =3D gnome<br>
&gt; -# We&#39;re patching gdk-pixbuf-loader/Makefile.am<br>
&gt; -LIBRSVG_AUTORECONF =3D YES<br>
&gt; +<br>
&gt; +LIBRSVG_DOWNLOAD_POST_PROCESS =3D cargo<br>
&gt; +LIBRSVG_DL_ENV =3D $(PKG_CARGO_ENV)<br>
&gt; +<br>
&gt; +LIBRSVG_CONF_ENV =3D $(PKG_CARGO_ENV)<br>
&gt; +LIBRSVG_NINJA_ENV =3D $(PKG_CARGO_ENV)<br>
&gt; +LIBRSVG_CONF_OPTS =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-Dtriplet=3D$(RUSTC_TARGET_NAME) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-Drsvg-convert=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-Dpixbuf-loader=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-Ddocs=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-Dtests=3Dfalse<br>
&gt; +LIBRSVG_DEPENDENCIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-cairo \<br>
<br>
Are you sure host-cairo is needed?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-cargo-c \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-libxml2 \<br>
<br>
And host-libxml2?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-pango \<br>
<br>
And host-pango2 ?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-rustc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cairo \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gdk-pixbuf \<br>
<br>
According to the documentation of librsvg, gdk-pixbuf is an optional<br>
dependency.<br>
<br>
However, according to the documentation, freetype is mandatory. You get<br>
it automatically as it is a dependency of cairo, but I think it would<br>
be preferable to express this dependency here.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libglib2 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libxml2 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pango \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(TARGET_NLS_DEPENDENCIES)<br>
&gt; +<br>
&gt; +HOST_LIBRSVG_CONF_ENV =3D $(HOST_PKG_CARGO_ENV)<br>
&gt; +HOST_LIBRSVG_NINJA_ENV =3D $(HOST_PKG_CARGO_ENV)<br>
&gt; +HOST_LIBRSVG_CONF_OPTS =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-Dintrospection=3Ddisabled<br>
&gt; +HOST_LIBRSVG_DEPENDENCIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-cairo \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-cargo-c \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-gdk-pixbuf \<br>
<br>
Maybe not needed?<br>
<br>
Could you investigate this, and resend as part of the cargo-c series?<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000e8cc1506477a0202--

--===============2135884565607987912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2135884565607987912==--
