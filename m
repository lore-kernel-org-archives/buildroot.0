Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD0EC46467
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 17:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D45E40B65;
	Tue, 10 Jan 2023 17:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D45E40B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJCZkb_p0__p; Tue, 10 Jan 2023 17:08:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CD0940B67;
	Tue, 10 Jan 2023 17:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CD0940B67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F02A81BF28B
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 17:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA7C6408C6
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 17:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA7C6408C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GsJdlPJXsa39 for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 17:08:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 874F9408AD
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 874F9408AD
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 17:08:40 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id o63so12927902vsc.10
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 09:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b4seonzubh+4xfO8S733FTsataEbfNvpOxiShnxDA7A=;
 b=mpflQKZ02cJSLGCge7E1NRE8FBn6g6mDtwS5Loimhtg0j2aAM7Hc7R8QYrN88VQvyk
 v+OGnYblw9DfAWgn+Pp6FJG3fh4yrq5zwuL6upgrxe8596VtVd3OwOTjRxTu7LXyASMf
 jmyWADU601EFxpRJ9eEPS8ERyEDuo9aGppqGyJUYEmT9TU4pl1X2XaxozPJB37+Kr3RG
 ohGNZJUjpEJ8EWYLeZfbOMbr09MJEsNf/Y2eIcFuaaegJZTg+gK+ehwp8eXabt4UJpVd
 Yk3GTvLB2XTkSQyCMQ6BibFfoLoWWhzCl0iEi2zAoStEBPB6r2cj0lQK3GBbFD/uYIa4
 Sbtw==
X-Gm-Message-State: AFqh2krNqlTxeFJgxo4ODwggznvDW33TeyAP2Xp4evyRnkCyLlS9JYo1
 r5RXwk+nEU2MUwDPQI67tYmuCcUoRM4TZ2ocGrg6JaXuXfWYY3zB
X-Google-Smtp-Source: AMrXdXuJ0UIxmF8l27CgVyd0iAbLHsO4ncsiGP/Fyb2UEJxI0Uy4gJYMrXgUFcCrZ3uI8WDmUgHWCGX3SWz2M3biSaY=
X-Received: by 2002:a67:cd01:0:b0:3ce:9106:e4c6 with SMTP id
 u1-20020a67cd01000000b003ce9106e4c6mr4394975vsl.45.1673370518249; Tue, 10 Jan
 2023 09:08:38 -0800 (PST)
MIME-Version: 1.0
References: <VI1P190MB049320A6AD3502E69083DB819FFE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <CAB0FRsuJj7OksprVHrCOfO0TmXkaY=0-S3xwMOza+3JBpXTcKA@mail.gmail.com>
 <VI1P190MB04937E83D67F730C0A1D380F9FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P190MB04937E83D67F730C0A1D380F9FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 10 Jan 2023 18:08:25 +0100
Message-ID: <CAB0FRsvkbyKorHcT24FECQESbECbNrJUP81DPp55CcQTu3PjTA@mail.gmail.com>
To: Lang Daniel <d.lang@abatec.at>
Subject: Re: [Buildroot] [PATCH 4/4] package/atk: remove package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "james.knight@collins.com" <james.knight@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0632846371299831345=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0632846371299831345==
Content-Type: multipart/alternative; boundary="00000000000051811e05f1ebeff5"

--00000000000051811e05f1ebeff5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 10 janv. 2023 =C3=A0 10:13, Lang Daniel <d.lang@abatec.at> a =C3=A9=
crit :

> Hello Fran=C3=A7ois,
>
> > Le lun. 9 janv. 2023 =C3=A0 13:59, Lang Daniel via buildroot <
> > buildroot@buildroot.org> a =C3=A9crit :
> >
> > > atk has been merged into at-spi2-core with version 2.45.1.
> > >
> > >
> https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NE=
WS
> > > https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78
> > >
> > >
> > so, the patch package/libgtk3/0003-disable-atk-bridge.patch becomes
> useless.
>
> It didn't want to alter the behavior of libgtk3, but you are right, the
> argument for having
> that patch is gone.
>
> I can send a second version and also remove the patch, if you want.
>

yes, please.


> > Fran=C3=A7ois
>
> Regards
> Daniel
>
> > > Signed-off-by: Daniel Lang <d.lang@abatec.at>
> > > ---
> > >  Config.in.legacy             |  7 +++++++
> > >  package/Config.in            |  1 -
> > >  package/atk/Config.in        | 14 --------------
> > >  package/atk/atk.hash         |  5 -----
> > >  package/atk/atk.mk           | 25 -------------------------
> > >  package/atkmm/Config.in      |  8 ++++----
> > >  package/atkmm/atkmm.mk       |  2 +-
> > >  package/libglade/Config.in   |  2 +-
> > >  package/libglade/libglade.mk |  2 +-
> > >  package/libgtk2/Config.in    |  2 +-
> > >  package/libgtk2/libgtk2.mk   |  2 +-
> > >  package/libgtk3/Config.in    |  2 +-
> > >  package/libgtk3/libgtk3.mk   |  2 +-
> > >  13 files changed, 18 insertions(+), 56 deletions(-)
> > >  delete mode 100644 package/atk/Config.in
> > >  delete mode 100644 package/atk/atk.hash
> > >  delete mode 100644 package/atk/atk.mk
> > >
> > > diff --git a/Config.in.legacy b/Config.in.legacy
> > > index 184bab6097..ac5943519e 100644
> > > --- a/Config.in.legacy
> > > +++ b/Config.in.legacy
> > > @@ -146,6 +146,13 @@ endif
> > >
> > >  comment "Legacy options removed in 2023.02"
> > >
> > > +config BR2_PACKAGE_ATK
> > > +       bool "atk removed"
> > > +       select BR2_LEGACY
> > > +       select BR2_PACKAGE_AT_SPI2_CORE
> > > +       help
> > > +         atk is now part of at-spi2-core.
> > > +
> > >  config BR2_PACKAGE_AT_SPI2_ATK
> > >         bool "at-spi2-atk removed"
> > >         select BR2_LEGACY
> > > diff --git a/package/Config.in b/package/Config.in
> > > index 5c8dcd849f..95db7c627b 100644
> > > --- a/package/Config.in
> > > +++ b/package/Config.in
> > > @@ -1531,7 +1531,6 @@ endmenu
> > >  menu "Graphics"
> > >         source "package/assimp/Config.in"
> > >         source "package/at-spi2-core/Config.in"
> > > -       source "package/atk/Config.in"
> > >         source "package/atkmm/Config.in"
> > >         source "package/bayer2rgb-neon/Config.in"
> > >         source "package/bullet/Config.in"
> > > diff --git a/package/atk/Config.in b/package/atk/Config.in
> > > deleted file mode 100644
> > > index d9371b879b..0000000000
> > > --- a/package/atk/Config.in
> > > +++ /dev/null
> > > @@ -1,14 +0,0 @@
> > > -config BR2_PACKAGE_ATK
> > > -       bool "atk"
> > > -       depends on BR2_USE_WCHAR # glib2
> > > -       depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> > > -       depends on BR2_USE_MMU # glib2
> > > -       select BR2_PACKAGE_LIBGLIB2
> > > -       help
> > > -         The ATK accessibility toolkit, needed to build GTK+-2.x.
> > > -
> > > -         https://gitlab.gnome.org/GNOME/atk
> > > -
> > > -comment "atk needs a toolchain w/ wchar, threads"
> > > -       depends on BR2_USE_MMU
> > > -       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> > > diff --git a/package/atk/atk.hash b/package/atk/atk.hash
> > > deleted file mode 100644
> > > index d8cd69ff1f..0000000000
> > > --- a/package/atk/atk.hash
> > > +++ /dev/null
> > > @@ -1,5 +0,0 @@
> > > -# From
> > > http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum
> > > -sha256
> > > <
> http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum-sha2=
56
> >
> > > ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36
> > > atk-2.38.0.tar.xz
> > > -
> > > -# Hash for license file
> > > -sha256
> d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5
> > > COPYING
> > > diff --git a/package/atk/atk.mk b/package/atk/atk.mk
> > > deleted file mode 100644
> > > index 2820fb486d..0000000000
> > > --- a/package/atk/atk.mk
> > > +++ /dev/null
> > > @@ -1,25 +0,0 @@
> > >
> > >
> -########################################################################=
########
> > > -#
> > > -# atk
> > > -#
> > >
> > >
> -########################################################################=
########
> > > -
> > > -ATK_VERSION_MAJOR =3D 2.38
> > > -ATK_VERSION =3D $(ATK_VERSION_MAJOR).0
> > > -ATK_SOURCE =3D atk-$(ATK_VERSION).tar.xz
> > > -ATK_SITE =3D
> > > http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
> > > -ATK_LICENSE
> > > <
> http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)-ATK_LICEN=
SE
> >
> > > =3D LGPL-2.0+
> > > -ATK_LICENSE_FILES =3D COPYING
> > > -ATK_INSTALL_STAGING =3D YES
> > > -ATK_DEPENDENCIES =3D libglib2 $(TARGET_NLS_DEPENDENCIES)
> > > -
> > > -ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> > > -ATK_CONF_OPTS +=3D -Dintrospection=3Dtrue
> > > -ATK_DEPENDENCIES +=3D gobject-introspection
> > > -else
> > > -ATK_CONF_OPTS +=3D -Dintrospection=3Dfalse
> > > -endif
> > > -
> > > -ATK_LDFLAGS =3D $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> > > -
> > > -$(eval $(meson-package))
> > > diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
> > > index aa58f8d593..f6f2ca8fc2 100644
> > > --- a/package/atkmm/Config.in
> > > +++ b/package/atkmm/Config.in
> > > @@ -2,10 +2,10 @@ config BR2_PACKAGE_ATKMM
> > >         bool "atkmm"
> > >         depends on BR2_INSTALL_LIBSTDCPP # glibmm
> > >         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
> > > -       depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
> > > -       depends on BR2_USE_MMU # atk/glibmm -> libglib2
> > > -       depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
> > > -       select BR2_PACKAGE_ATK
> > > +       depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm ->
> > > libglib2
> > > +       depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
> > > +       depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
> > > +       select BR2_PACKAGE_AT_SPI2_CORE
> > >         select BR2_PACKAGE_GLIBMM
> > >         select BR2_PACKAGE_LIBSIGC
> > >
> > > diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
> > > index 3bcb941c9f..76371aadbc 100644
> > > --- a/package/atkmm/atkmm.mk
> > > +++ b/package/atkmm/atkmm.mk
> > > @@ -11,6 +11,6 @@ ATKMM_SITE =3D
> > > http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_VERSION_MAJOR)
> > >  ATKMM_LICENSE =3D LGPL-2.1+ (library), GPL-2.0+ (tools)
> > >  ATKMM_LICENSE_FILES =3D COPYING COPYING.tools
> > >  ATKMM_INSTALL_STAGING =3D YES
> > > -ATKMM_DEPENDENCIES =3D atk glibmm libsigc host-pkgconf
> > > +ATKMM_DEPENDENCIES =3D at-spi2-core glibmm libsigc host-pkgconf
> > >
> > >  $(eval $(meson-package))
> > > diff --git a/package/libglade/Config.in b/package/libglade/Config.in
> > > index e269a07548..4cf2ae4086 100644
> > > --- a/package/libglade/Config.in
> > > +++ b/package/libglade/Config.in
> > > @@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBGLADE
> > >         depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> > >         depends on BR2_USE_MMU # glib2
> > >         select BR2_PACKAGE_LIBGLIB2
> > > -       select BR2_PACKAGE_ATK
> > > +       select BR2_PACKAGE_AT_SPI2_CORE
> > >         select BR2_PACKAGE_LIBXML2
> > >         help
> > >           Libglade allows you to load glade interface files in a
> program
> > > diff --git a/package/libglade/libglade.mk b/package/libglade/
> libglade.mk
> > > index 32fa595f5a..24865fb8ff 100644
> > > --- a/package/libglade/libglade.mk
> > > +++ b/package/libglade/libglade.mk
> > > @@ -9,7 +9,7 @@ LIBGLADE_VERSION =3D $(LIBGLADE_VERSION_MAJOR).4
> > >  LIBGLADE_SOURCE =3D libglade-$(LIBGLADE_VERSION).tar.bz2
> > >  LIBGLADE_SITE =3D
> > >
> http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
> > >  LIBGLADE_INSTALL_STAGING =3D YES
> > > -LIBGLADE_DEPENDENCIES =3D host-pkgconf libglib2 libgtk2 atk libxml2
> > > +LIBGLADE_DEPENDENCIES =3D host-pkgconf libglib2 libgtk2 at-spi2-core
> libxml2
> > >  LIBGLADE_LICENSE =3D LGPL-2.0+
> > >  LIBGLADE_LICENSE_FILES =3D COPYING
> > >
> > > diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
> > > index c75c37fb63..f2888b2f51 100644
> > > --- a/package/libgtk2/Config.in
> > > +++ b/package/libgtk2/Config.in
> > > @@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBGTK2
> > >         depends on BR2_INSTALL_LIBSTDCPP # pango
> > >         depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
> > >         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> > > -       select BR2_PACKAGE_ATK
> > > +       select BR2_PACKAGE_AT_SPI2_CORE
> > >         select BR2_PACKAGE_CAIRO
> > >         select BR2_PACKAGE_CAIRO_PS
> > >         select BR2_PACKAGE_CAIRO_PDF
> > > diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
> > > index d30e1d9d43..ad4dd74e4d 100644
> > > --- a/package/libgtk2/libgtk2.mk
> > > +++ b/package/libgtk2/libgtk2.mk
> > > @@ -23,7 +23,7 @@ LIBGTK2_CONF_ENV =3D \
> > >
> > >  LIBGTK2_CONF_OPTS =3D --disable-glibtest --enable-explicit-deps=3Dno
> > >
> > > -LIBGTK2_DEPENDENCIES =3D host-pkgconf host-libgtk2 libglib2 cairo pa=
ngo
> atk
> > > \
> > > +LIBGTK2_DEPENDENCIES =3D host-pkgconf host-libgtk2 libglib2 cairo pa=
ngo
> > > at-spi2-core \
> > >         gdk-pixbuf $(TARGET_NLS_DEPENDENCIES)
> > >
> > >  LIBGTK2_MAKE_OPTS =3D LIBS=3D$(TARGET_NLS_LIBS)
> > > diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
> > > index bc8cacd9f5..cb44607b7c 100644
> > > --- a/package/libgtk3/Config.in
> > > +++ b/package/libgtk3/Config.in
> > > @@ -23,7 +23,7 @@ config BR2_PACKAGE_LIBGTK3
> > >         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> > >         depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> > >                 BR2_PACKAGE_HAS_LIBGL
> > > -       select BR2_PACKAGE_ATK
> > > +       select BR2_PACKAGE_AT_SPI2_CORE
> > >         select BR2_PACKAGE_CAIRO
> > >         select BR2_PACKAGE_CAIRO_PS
> > >         select BR2_PACKAGE_CAIRO_PDF
> > > diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> > > index f277fce2ed..15190efd96 100644
> > > --- a/package/libgtk3/libgtk3.mk
> > > +++ b/package/libgtk3/libgtk3.mk
> > > @@ -30,7 +30,7 @@ LIBGTK3_MAKE_OPTS =3D \
> > >
> > > WAYLAND_PROTOCOLS_DATADIR=3D$(STAGING_DIR)/usr/share/wayland-protocol=
s \
> > >         LIBS=3D$(TARGET_NLS_LIBS)
> > >
> > > -LIBGTK3_DEPENDENCIES =3D host-pkgconf host-libgtk3 atk libglib2 cair=
o
> pango
> > > \
> > > +LIBGTK3_DEPENDENCIES =3D host-pkgconf host-libgtk3 at-spi2-core libg=
lib2
> > > cairo pango \
> > >         gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
> > >
> > >  ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
> > > --
> > > 2.25.1
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > >

--00000000000051811e05f1ebeff5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 10 janv. 2023 =C3=A0=C2=
=A010:13, Lang Daniel &lt;<a href=3D"mailto:d.lang@abatec.at">d.lang@abatec=
.at</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hello Fran=C3=A7ois,<br>
<br>
&gt; Le lun. 9 janv. 2023 =C3=A0 13:59, Lang Daniel via buildroot &lt;<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a>&gt; a =C3=A9crit :<br>
&gt; <br>
&gt; &gt; atk has been merged into at-spi2-core with version 2.45.1.<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_=
SPI2_CORE_2_45_1/NEWS" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NEWS</a><br>
&gt; &gt; <a href=3D"https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_re=
quests/78" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GN=
OME/at-spi2-core/-/merge_requests/78</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; so, the patch package/libgtk3/0003-disable-atk-bridge.patch becomes us=
eless.<br>
<br>
It didn&#39;t want to alter the behavior of libgtk3, but you are right, the=
 argument for having<br>
that patch is gone.<br>
<br>
I can send a second version and also remove the patch, if you want.<br></bl=
ockquote><div><br></div><div>yes, please.</div><div> <br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; Fran=C3=A7ois<br>
<br>
Regards<br>
Daniel<br>
<br>
&gt; &gt; Signed-off-by: Daniel Lang &lt;<a href=3D"mailto:d.lang@abatec.at=
" target=3D"_blank">d.lang@abatec.at</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 Config.in.legacy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 7 +++++++<br>
&gt; &gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 1 -<br>
&gt; &gt;=C2=A0 package/atk/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 -----=
---------<br>
&gt; &gt;=C2=A0 package/atk/atk.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 5 -----<br>
&gt; &gt;=C2=A0 package/atk/<a href=3D"http://atk.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">atk.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 ---=
----------------------<br>
&gt; &gt;=C2=A0 package/atkmm/Config.in=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++-=
---<br>
&gt; &gt;=C2=A0 package/atkmm/<a href=3D"http://atkmm.mk" rel=3D"noreferrer=
" target=3D"_blank">atkmm.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 package/libglade/Config.in=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 package/libglade/<a href=3D"http://libglade.mk" rel=3D"nore=
ferrer" target=3D"_blank">libglade.mk</a> |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 package/libgtk2/Config.in=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 package/libgtk2/<a href=3D"http://libgtk2.mk" rel=3D"norefe=
rrer" target=3D"_blank">libgtk2.mk</a>=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 package/libgtk3/Config.in=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D"norefe=
rrer" target=3D"_blank">libgtk3.mk</a>=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 13 files changed, 18 insertions(+), 56 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 package/atk/Config.in<br>
&gt; &gt;=C2=A0 delete mode 100644 package/atk/atk.hash<br>
&gt; &gt;=C2=A0 delete mode 100644 package/atk/<a href=3D"http://atk.mk" re=
l=3D"noreferrer" target=3D"_blank">atk.mk</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/Config.in.legacy b/Config.in.legacy<br>
&gt; &gt; index 184bab6097..ac5943519e 100644<br>
&gt; &gt; --- a/Config.in.legacy<br>
&gt; &gt; +++ b/Config.in.legacy<br>
&gt; &gt; @@ -146,6 +146,13 @@ endif<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 comment &quot;Legacy options removed in 2023.02&quot;<br>
&gt; &gt;<br>
&gt; &gt; +config BR2_PACKAGE_ATK<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;atk removed&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_LEGACY<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_AT_SPI2_CORE<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atk is now part of at-spi2-cor=
e.<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 config BR2_PACKAGE_AT_SPI2_ATK<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;at-spi2-atk removed&q=
uot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_LEGACY<br>
&gt; &gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt; &gt; index 5c8dcd849f..95db7c627b 100644<br>
&gt; &gt; --- a/package/Config.in<br>
&gt; &gt; +++ b/package/Config.in<br>
&gt; &gt; @@ -1531,7 +1531,6 @@ endmenu<br>
&gt; &gt;=C2=A0 menu &quot;Graphics&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/assimp/Conf=
ig.in&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/at-spi2-cor=
e/Config.in&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/atk/Config.in&qu=
ot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/atkmm/Confi=
g.in&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/bayer2rgb-n=
eon/Config.in&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/bullet/Conf=
ig.in&quot;<br>
&gt; &gt; diff --git a/package/atk/Config.in b/package/atk/Config.in<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index d9371b879b..0000000000<br>
&gt; &gt; --- a/package/atk/Config.in<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,14 +0,0 @@<br>
&gt; &gt; -config BR2_PACKAGE_ATK<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;atk&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # glib2<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS =
# glib2<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # glib2<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBGLIB2<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The ATK accessibility toolkit,=
 needed to build GTK+-2.x.<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.gnom=
e.org/GNOME/atk" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.=
org/GNOME/atk</a><br>
&gt; &gt; -<br>
&gt; &gt; -comment &quot;atk needs a toolchain w/ wchar, threads&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_USE_WCHAR || !BR2_TOO=
LCHAIN_HAS_THREADS<br>
&gt; &gt; diff --git a/package/atk/atk.hash b/package/atk/atk.hash<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index d8cd69ff1f..0000000000<br>
&gt; &gt; --- a/package/atk/atk.hash<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,5 +0,0 @@<br>
&gt; &gt; -# From<br>
&gt; &gt; <a href=3D"http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.=
38.0.sha256sum" rel=3D"noreferrer" target=3D"_blank">http://ftp.gnome.org/p=
ub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum</a><br>
&gt; &gt; -sha256<br>
&gt; &gt; &lt;<a href=3D"http://ftp.gnome.org/pub/gnome/sources/atk/2.38/at=
k-2.38.0.sha256sum-sha256" rel=3D"noreferrer" target=3D"_blank">http://ftp.=
gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum-sha256</a>&gt;<br=
>
&gt; &gt; ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36<=
br>
&gt; &gt; atk-2.38.0.tar.xz<br>
&gt; &gt; -<br>
&gt; &gt; -# Hash for license file<br>
&gt; &gt; -sha256=C2=A0 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5dd=
b6c8e529b58e5<br>
&gt; &gt; COPYING<br>
&gt; &gt; diff --git a/package/atk/<a href=3D"http://atk.mk" rel=3D"norefer=
rer" target=3D"_blank">atk.mk</a> b/package/atk/<a href=3D"http://atk.mk" r=
el=3D"noreferrer" target=3D"_blank">atk.mk</a><br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 2820fb486d..0000000000<br>
&gt; &gt; --- a/package/atk/<a href=3D"http://atk.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">atk.mk</a><br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,25 +0,0 @@<br>
&gt; &gt;<br>
&gt; &gt; -################################################################=
################<br>
&gt; &gt; -#<br>
&gt; &gt; -# atk<br>
&gt; &gt; -#<br>
&gt; &gt;<br>
&gt; &gt; -################################################################=
################<br>
&gt; &gt; -<br>
&gt; &gt; -ATK_VERSION_MAJOR =3D 2.38<br>
&gt; &gt; -ATK_VERSION =3D $(ATK_VERSION_MAJOR).0<br>
&gt; &gt; -ATK_SOURCE =3D atk-$(ATK_VERSION).tar.xz<br>
&gt; &gt; -ATK_SITE =3D<br>
&gt; &gt; <a href=3D"http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSI=
ON_MAJOR)" rel=3D"noreferrer" target=3D"_blank">http://ftp.gnome.org/pub/gn=
ome/sources/atk/$(ATK_VERSION_MAJOR)</a><br>
&gt; &gt; -ATK_LICENSE<br>
&gt; &gt; &lt;<a href=3D"http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_V=
ERSION_MAJOR)-ATK_LICENSE" rel=3D"noreferrer" target=3D"_blank">http://ftp.=
gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)-ATK_LICENSE</a>&gt;<br=
>
&gt; &gt; =3D LGPL-2.0+<br>
&gt; &gt; -ATK_LICENSE_FILES =3D COPYING<br>
&gt; &gt; -ATK_INSTALL_STAGING =3D YES<br>
&gt; &gt; -ATK_DEPENDENCIES =3D libglib2 $(TARGET_NLS_DEPENDENCIES)<br>
&gt; &gt; -<br>
&gt; &gt; -ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)<br>
&gt; &gt; -ATK_CONF_OPTS +=3D -Dintrospection=3Dtrue<br>
&gt; &gt; -ATK_DEPENDENCIES +=3D gobject-introspection<br>
&gt; &gt; -else<br>
&gt; &gt; -ATK_CONF_OPTS +=3D -Dintrospection=3Dfalse<br>
&gt; &gt; -endif<br>
&gt; &gt; -<br>
&gt; &gt; -ATK_LDFLAGS =3D $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)<br>
&gt; &gt; -<br>
&gt; &gt; -$(eval $(meson-package))<br>
&gt; &gt; diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in<br=
>
&gt; &gt; index aa58f8d593..f6f2ca8fc2 100644<br>
&gt; &gt; --- a/package/atkmm/Config.in<br>
&gt; &gt; +++ b/package/atkmm/Config.in<br>
&gt; &gt; @@ -2,10 +2,10 @@ config BR2_PACKAGE_ATKMM<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;atkmm&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP=
 # glibmm<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_=
LEAST_7 # libsigc<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS =
# atk/glibmm -&gt; libglib2<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # atk/glibmm -=
&gt; libglib2<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # atk/glibmm=
 -&gt; libglib2<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ATK<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS =
# at-spi2-core/glibmm -&gt;<br>
&gt; &gt; libglib2<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # at-spi2-core=
/glibmm -&gt; libglib2<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # at-spi2-co=
re/glibmm -&gt; libglib2<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_AT_SPI2_CORE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GLIBMM<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBSIGC<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/package/atkmm/<a href=3D"http://atkmm.mk" rel=3D"nor=
eferrer" target=3D"_blank">atkmm.mk</a> b/package/atkmm/<a href=3D"http://a=
tkmm.mk" rel=3D"noreferrer" target=3D"_blank">atkmm.mk</a><br>
&gt; &gt; index 3bcb941c9f..76371aadbc 100644<br>
&gt; &gt; --- a/package/atkmm/<a href=3D"http://atkmm.mk" rel=3D"noreferrer=
" target=3D"_blank">atkmm.mk</a><br>
&gt; &gt; +++ b/package/atkmm/<a href=3D"http://atkmm.mk" rel=3D"noreferrer=
" target=3D"_blank">atkmm.mk</a><br>
&gt; &gt; @@ -11,6 +11,6 @@ ATKMM_SITE =3D<br>
&gt; &gt; <a href=3D"http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_V=
ERSION_MAJOR)" rel=3D"noreferrer" target=3D"_blank">http://ftp.gnome.org/pu=
b/gnome/sources/atkmm/$(ATKMM_VERSION_MAJOR)</a><br>
&gt; &gt;=C2=A0 ATKMM_LICENSE =3D LGPL-2.1+ (library), GPL-2.0+ (tools)<br>
&gt; &gt;=C2=A0 ATKMM_LICENSE_FILES =3D COPYING COPYING.tools<br>
&gt; &gt;=C2=A0 ATKMM_INSTALL_STAGING =3D YES<br>
&gt; &gt; -ATKMM_DEPENDENCIES =3D atk glibmm libsigc host-pkgconf<br>
&gt; &gt; +ATKMM_DEPENDENCIES =3D at-spi2-core glibmm libsigc host-pkgconf<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 $(eval $(meson-package))<br>
&gt; &gt; diff --git a/package/libglade/Config.in b/package/libglade/Config=
.in<br>
&gt; &gt; index e269a07548..4cf2ae4086 100644<br>
&gt; &gt; --- a/package/libglade/Config.in<br>
&gt; &gt; +++ b/package/libglade/Config.in<br>
&gt; &gt; @@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBGLADE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THR=
EADS # glib2<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # glib2<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBGLIB2<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ATK<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_AT_SPI2_CORE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBXML2<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Libglade allows you to lo=
ad glade interface files in a program<br>
&gt; &gt; diff --git a/package/libglade/<a href=3D"http://libglade.mk" rel=
=3D"noreferrer" target=3D"_blank">libglade.mk</a> b/package/libglade/<a hre=
f=3D"http://libglade.mk" rel=3D"noreferrer" target=3D"_blank">libglade.mk</=
a><br>
&gt; &gt; index 32fa595f5a..24865fb8ff 100644<br>
&gt; &gt; --- a/package/libglade/<a href=3D"http://libglade.mk" rel=3D"nore=
ferrer" target=3D"_blank">libglade.mk</a><br>
&gt; &gt; +++ b/package/libglade/<a href=3D"http://libglade.mk" rel=3D"nore=
ferrer" target=3D"_blank">libglade.mk</a><br>
&gt; &gt; @@ -9,7 +9,7 @@ LIBGLADE_VERSION =3D $(LIBGLADE_VERSION_MAJOR).4<=
br>
&gt; &gt;=C2=A0 LIBGLADE_SOURCE =3D libglade-$(LIBGLADE_VERSION).tar.bz2<br=
>
&gt; &gt;=C2=A0 LIBGLADE_SITE =3D<br>
&gt; &gt; <a href=3D"http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBG=
LADE_VERSION_MAJOR)" rel=3D"noreferrer" target=3D"_blank">http://ftp.gnome.=
org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)</a><br>
&gt; &gt;=C2=A0 LIBGLADE_INSTALL_STAGING =3D YES<br>
&gt; &gt; -LIBGLADE_DEPENDENCIES =3D host-pkgconf libglib2 libgtk2 atk libx=
ml2<br>
&gt; &gt; +LIBGLADE_DEPENDENCIES =3D host-pkgconf libglib2 libgtk2 at-spi2-=
core libxml2<br>
&gt; &gt;=C2=A0 LIBGLADE_LICENSE =3D LGPL-2.0+<br>
&gt; &gt;=C2=A0 LIBGLADE_LICENSE_FILES =3D COPYING<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.i=
n<br>
&gt; &gt; index c75c37fb63..f2888b2f51 100644<br>
&gt; &gt; --- a/package/libgtk2/Config.in<br>
&gt; &gt; +++ b/package/libgtk2/Config.in<br>
&gt; &gt; @@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBGTK2<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP=
 # pango<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_SYN=
C_4 # pango -&gt; harfbuzz<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_=
LEAST_4_9 # pango -&gt; harfbuzz<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ATK<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_AT_SPI2_CORE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_CAIRO<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_CAIRO_PS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_CAIRO_PDF<br>
&gt; &gt; diff --git a/package/libgtk2/<a href=3D"http://libgtk2.mk" rel=3D=
"noreferrer" target=3D"_blank">libgtk2.mk</a> b/package/libgtk2/<a href=3D"=
http://libgtk2.mk" rel=3D"noreferrer" target=3D"_blank">libgtk2.mk</a><br>
&gt; &gt; index d30e1d9d43..ad4dd74e4d 100644<br>
&gt; &gt; --- a/package/libgtk2/<a href=3D"http://libgtk2.mk" rel=3D"norefe=
rrer" target=3D"_blank">libgtk2.mk</a><br>
&gt; &gt; +++ b/package/libgtk2/<a href=3D"http://libgtk2.mk" rel=3D"norefe=
rrer" target=3D"_blank">libgtk2.mk</a><br>
&gt; &gt; @@ -23,7 +23,7 @@ LIBGTK2_CONF_ENV =3D \<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 LIBGTK2_CONF_OPTS =3D --disable-glibtest --enable-explicit-=
deps=3Dno<br>
&gt; &gt;<br>
&gt; &gt; -LIBGTK2_DEPENDENCIES =3D host-pkgconf host-libgtk2 libglib2 cair=
o pango atk<br>
&gt; &gt; \<br>
&gt; &gt; +LIBGTK2_DEPENDENCIES =3D host-pkgconf host-libgtk2 libglib2 cair=
o pango<br>
&gt; &gt; at-spi2-core \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdk-pixbuf $(TARGET_NLS_DEPENDEN=
CIES)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 LIBGTK2_MAKE_OPTS =3D LIBS=3D$(TARGET_NLS_LIBS)<br>
&gt; &gt; diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.i=
n<br>
&gt; &gt; index bc8cacd9f5..cb44607b7c 100644<br>
&gt; &gt; --- a/package/libgtk3/Config.in<br>
&gt; &gt; +++ b/package/libgtk3/Config.in<br>
&gt; &gt; @@ -23,7 +23,7 @@ config BR2_PACKAGE_LIBGTK3<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_=
LEAST_4_9 # pango -&gt; harfbuzz<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_LIBEG=
L_WAYLAND || \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_=
PACKAGE_HAS_LIBGL<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ATK<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_AT_SPI2_CORE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_CAIRO<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_CAIRO_PS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_CAIRO_PDF<br>
&gt; &gt; diff --git a/package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D=
"noreferrer" target=3D"_blank">libgtk3.mk</a> b/package/libgtk3/<a href=3D"=
http://libgtk3.mk" rel=3D"noreferrer" target=3D"_blank">libgtk3.mk</a><br>
&gt; &gt; index f277fce2ed..15190efd96 100644<br>
&gt; &gt; --- a/package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D"norefe=
rrer" target=3D"_blank">libgtk3.mk</a><br>
&gt; &gt; +++ b/package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D"norefe=
rrer" target=3D"_blank">libgtk3.mk</a><br>
&gt; &gt; @@ -30,7 +30,7 @@ LIBGTK3_MAKE_OPTS =3D \<br>
&gt; &gt;<br>
&gt; &gt; WAYLAND_PROTOCOLS_DATADIR=3D$(STAGING_DIR)/usr/share/wayland-prot=
ocols \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIBS=3D$(TARGET_NLS_LIBS)<br>
&gt; &gt;<br>
&gt; &gt; -LIBGTK3_DEPENDENCIES =3D host-pkgconf host-libgtk3 atk libglib2 =
cairo pango<br>
&gt; &gt; \<br>
&gt; &gt; +LIBGTK3_DEPENDENCIES =3D host-pkgconf host-libgtk3 at-spi2-core =
libglib2<br>
&gt; &gt; cairo pango \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdk-pixbuf libepoxy $(TARGET_NLS=
_DEPENDENCIES)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; buildroot mailing list<br>
&gt; &gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buil=
droot@buildroot.org</a><br>
&gt; &gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot=
" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/=
listinfo/buildroot</a><br>
&gt; &gt;</blockquote></div></div>

--00000000000051811e05f1ebeff5--

--===============0632846371299831345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0632846371299831345==--
