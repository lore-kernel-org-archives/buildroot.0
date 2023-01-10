Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E131C54EBE
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 06:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D1A40917;
	Tue, 10 Jan 2023 06:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D1A40917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcLaGhWyMqPf; Tue, 10 Jan 2023 06:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FCDE4091E;
	Tue, 10 Jan 2023 06:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FCDE4091E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 051301BF263
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 06:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1F7081467
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 06:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F7081467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3F_vdWvODZM for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 06:21:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FB5781427
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FB5781427
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 06:21:15 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id w72so5130632vkw.7
 for <buildroot@buildroot.org>; Mon, 09 Jan 2023 22:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R7bluHuSvnSRleIldq+xEWRHZlAYLIUSV/C3STvcTY4=;
 b=jxnm14AQDoT1dVXPIK47hcHDzyTdkCIhrd3bWjuRJZPjtrUm0Va2/0HlcGJThraBIB
 mSbT3USc6G5aYWBH/313p6hBMlC4PaIi9Y5o31oyIaMxHSB7r1mCm9EzkAK2iDYLhKv7
 Xc3ktVg9EMrZbcyRGO4cYQtB0I6TG2ExrAj3jZ1eoFK9ldu5mW5AP2sBg91KbG+2om70
 FcjNMLZetVmEq1esAc2K5yN3e8DdpN0CRiIFhJTQoVr8HGCj8X5GBgGj2ls1PKOLyIgB
 I2In7zUNR3/9QOL7BC9l9Bw4ZxF7J5eE5f+kh0gV0D7iOY/kI8Qx724xOoRW80w+EnUR
 tVgQ==
X-Gm-Message-State: AFqh2krKOVMtdsqeKL1Qbpw1v+Fj7Z34dIsXTpB/XVVCtpA4FI/yPm/Y
 EgYWEsIBg7B7DqJAdcLw2ioFbjWdoq5uIjnQlxti/g==
X-Google-Smtp-Source: AMrXdXurEj7Yk1jF5Tvw5WvWndehjncbmeR/6wSJtXUCXkaaZmFC0GCPm1pnmVS29ksf8JQYhd5wCqnhNesTK0qi/Zk=
X-Received: by 2002:a1f:28c2:0:b0:3d5:c548:6e82 with SMTP id
 o185-20020a1f28c2000000b003d5c5486e82mr4545347vko.8.1673331674513; Mon, 09
 Jan 2023 22:21:14 -0800 (PST)
MIME-Version: 1.0
References: <VI1P190MB049320A6AD3502E69083DB819FFE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P190MB049320A6AD3502E69083DB819FFE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 10 Jan 2023 07:21:02 +0100
Message-ID: <CAB0FRsuJj7OksprVHrCOfO0TmXkaY=0-S3xwMOza+3JBpXTcKA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7735143657660101972=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7735143657660101972==
Content-Type: multipart/alternative; boundary="0000000000000d199605f1e2e474"

--0000000000000d199605f1e2e474
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 9 janv. 2023 =C3=A0 13:59, Lang Daniel via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> atk has been merged into at-spi2-core with version 2.45.1.
>
> https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NE=
WS
> https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78
>
>
so, the patch package/libgtk3/0003-disable-atk-bridge.patch becomes useless=
.

Fran=C3=A7ois


> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  Config.in.legacy             |  7 +++++++
>  package/Config.in            |  1 -
>  package/atk/Config.in        | 14 --------------
>  package/atk/atk.hash         |  5 -----
>  package/atk/atk.mk           | 25 -------------------------
>  package/atkmm/Config.in      |  8 ++++----
>  package/atkmm/atkmm.mk       |  2 +-
>  package/libglade/Config.in   |  2 +-
>  package/libglade/libglade.mk |  2 +-
>  package/libgtk2/Config.in    |  2 +-
>  package/libgtk2/libgtk2.mk   |  2 +-
>  package/libgtk3/Config.in    |  2 +-
>  package/libgtk3/libgtk3.mk   |  2 +-
>  13 files changed, 18 insertions(+), 56 deletions(-)
>  delete mode 100644 package/atk/Config.in
>  delete mode 100644 package/atk/atk.hash
>  delete mode 100644 package/atk/atk.mk
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 184bab6097..ac5943519e 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>
>  comment "Legacy options removed in 2023.02"
>
> +config BR2_PACKAGE_ATK
> +       bool "atk removed"
> +       select BR2_LEGACY
> +       select BR2_PACKAGE_AT_SPI2_CORE
> +       help
> +         atk is now part of at-spi2-core.
> +
>  config BR2_PACKAGE_AT_SPI2_ATK
>         bool "at-spi2-atk removed"
>         select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index 5c8dcd849f..95db7c627b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1531,7 +1531,6 @@ endmenu
>  menu "Graphics"
>         source "package/assimp/Config.in"
>         source "package/at-spi2-core/Config.in"
> -       source "package/atk/Config.in"
>         source "package/atkmm/Config.in"
>         source "package/bayer2rgb-neon/Config.in"
>         source "package/bullet/Config.in"
> diff --git a/package/atk/Config.in b/package/atk/Config.in
> deleted file mode 100644
> index d9371b879b..0000000000
> --- a/package/atk/Config.in
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -config BR2_PACKAGE_ATK
> -       bool "atk"
> -       depends on BR2_USE_WCHAR # glib2
> -       depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> -       depends on BR2_USE_MMU # glib2
> -       select BR2_PACKAGE_LIBGLIB2
> -       help
> -         The ATK accessibility toolkit, needed to build GTK+-2.x.
> -
> -         https://gitlab.gnome.org/GNOME/atk
> -
> -comment "atk needs a toolchain w/ wchar, threads"
> -       depends on BR2_USE_MMU
> -       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/atk/atk.hash b/package/atk/atk.hash
> deleted file mode 100644
> index d8cd69ff1f..0000000000
> --- a/package/atk/atk.hash
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# From
> http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum
> -sha256
> <http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum-sha=
256>
> ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36
> atk-2.38.0.tar.xz
> -
> -# Hash for license file
> -sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5
> COPYING
> diff --git a/package/atk/atk.mk b/package/atk/atk.mk
> deleted file mode 100644
> index 2820fb486d..0000000000
> --- a/package/atk/atk.mk
> +++ /dev/null
> @@ -1,25 +0,0 @@
>
> -########################################################################=
########
> -#
> -# atk
> -#
>
> -########################################################################=
########
> -
> -ATK_VERSION_MAJOR =3D 2.38
> -ATK_VERSION =3D $(ATK_VERSION_MAJOR).0
> -ATK_SOURCE =3D atk-$(ATK_VERSION).tar.xz
> -ATK_SITE =3D
> http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
> -ATK_LICENSE
> <http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)-ATK_LICE=
NSE>
> =3D LGPL-2.0+
> -ATK_LICENSE_FILES =3D COPYING
> -ATK_INSTALL_STAGING =3D YES
> -ATK_DEPENDENCIES =3D libglib2 $(TARGET_NLS_DEPENDENCIES)
> -
> -ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> -ATK_CONF_OPTS +=3D -Dintrospection=3Dtrue
> -ATK_DEPENDENCIES +=3D gobject-introspection
> -else
> -ATK_CONF_OPTS +=3D -Dintrospection=3Dfalse
> -endif
> -
> -ATK_LDFLAGS =3D $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> -
> -$(eval $(meson-package))
> diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
> index aa58f8d593..f6f2ca8fc2 100644
> --- a/package/atkmm/Config.in
> +++ b/package/atkmm/Config.in
> @@ -2,10 +2,10 @@ config BR2_PACKAGE_ATKMM
>         bool "atkmm"
>         depends on BR2_INSTALL_LIBSTDCPP # glibmm
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
> -       depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
> -       depends on BR2_USE_MMU # atk/glibmm -> libglib2
> -       depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
> -       select BR2_PACKAGE_ATK
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm ->
> libglib2
> +       depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
> +       depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
> +       select BR2_PACKAGE_AT_SPI2_CORE
>         select BR2_PACKAGE_GLIBMM
>         select BR2_PACKAGE_LIBSIGC
>
> diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
> index 3bcb941c9f..76371aadbc 100644
> --- a/package/atkmm/atkmm.mk
> +++ b/package/atkmm/atkmm.mk
> @@ -11,6 +11,6 @@ ATKMM_SITE =3D
> http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_VERSION_MAJOR)
>  ATKMM_LICENSE =3D LGPL-2.1+ (library), GPL-2.0+ (tools)
>  ATKMM_LICENSE_FILES =3D COPYING COPYING.tools
>  ATKMM_INSTALL_STAGING =3D YES
> -ATKMM_DEPENDENCIES =3D atk glibmm libsigc host-pkgconf
> +ATKMM_DEPENDENCIES =3D at-spi2-core glibmm libsigc host-pkgconf
>
>  $(eval $(meson-package))
> diff --git a/package/libglade/Config.in b/package/libglade/Config.in
> index e269a07548..4cf2ae4086 100644
> --- a/package/libglade/Config.in
> +++ b/package/libglade/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBGLADE
>         depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>         depends on BR2_USE_MMU # glib2
>         select BR2_PACKAGE_LIBGLIB2
> -       select BR2_PACKAGE_ATK
> +       select BR2_PACKAGE_AT_SPI2_CORE
>         select BR2_PACKAGE_LIBXML2
>         help
>           Libglade allows you to load glade interface files in a program
> diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
> index 32fa595f5a..24865fb8ff 100644
> --- a/package/libglade/libglade.mk
> +++ b/package/libglade/libglade.mk
> @@ -9,7 +9,7 @@ LIBGLADE_VERSION =3D $(LIBGLADE_VERSION_MAJOR).4
>  LIBGLADE_SOURCE =3D libglade-$(LIBGLADE_VERSION).tar.bz2
>  LIBGLADE_SITE =3D
> http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
>  LIBGLADE_INSTALL_STAGING =3D YES
> -LIBGLADE_DEPENDENCIES =3D host-pkgconf libglib2 libgtk2 atk libxml2
> +LIBGLADE_DEPENDENCIES =3D host-pkgconf libglib2 libgtk2 at-spi2-core lib=
xml2
>  LIBGLADE_LICENSE =3D LGPL-2.0+
>  LIBGLADE_LICENSE_FILES =3D COPYING
>
> diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
> index c75c37fb63..f2888b2f51 100644
> --- a/package/libgtk2/Config.in
> +++ b/package/libgtk2/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBGTK2
>         depends on BR2_INSTALL_LIBSTDCPP # pango
>         depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> -       select BR2_PACKAGE_ATK
> +       select BR2_PACKAGE_AT_SPI2_CORE
>         select BR2_PACKAGE_CAIRO
>         select BR2_PACKAGE_CAIRO_PS
>         select BR2_PACKAGE_CAIRO_PDF
> diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
> index d30e1d9d43..ad4dd74e4d 100644
> --- a/package/libgtk2/libgtk2.mk
> +++ b/package/libgtk2/libgtk2.mk
> @@ -23,7 +23,7 @@ LIBGTK2_CONF_ENV =3D \
>
>  LIBGTK2_CONF_OPTS =3D --disable-glibtest --enable-explicit-deps=3Dno
>
> -LIBGTK2_DEPENDENCIES =3D host-pkgconf host-libgtk2 libglib2 cairo pango =
atk
> \
> +LIBGTK2_DEPENDENCIES =3D host-pkgconf host-libgtk2 libglib2 cairo pango
> at-spi2-core \
>         gdk-pixbuf $(TARGET_NLS_DEPENDENCIES)
>
>  LIBGTK2_MAKE_OPTS =3D LIBS=3D$(TARGET_NLS_LIBS)
> diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
> index bc8cacd9f5..cb44607b7c 100644
> --- a/package/libgtk3/Config.in
> +++ b/package/libgtk3/Config.in
> @@ -23,7 +23,7 @@ config BR2_PACKAGE_LIBGTK3
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
>         depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
>                 BR2_PACKAGE_HAS_LIBGL
> -       select BR2_PACKAGE_ATK
> +       select BR2_PACKAGE_AT_SPI2_CORE
>         select BR2_PACKAGE_CAIRO
>         select BR2_PACKAGE_CAIRO_PS
>         select BR2_PACKAGE_CAIRO_PDF
> diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> index f277fce2ed..15190efd96 100644
> --- a/package/libgtk3/libgtk3.mk
> +++ b/package/libgtk3/libgtk3.mk
> @@ -30,7 +30,7 @@ LIBGTK3_MAKE_OPTS =3D \
>
> WAYLAND_PROTOCOLS_DATADIR=3D$(STAGING_DIR)/usr/share/wayland-protocols \
>         LIBS=3D$(TARGET_NLS_LIBS)
>
> -LIBGTK3_DEPENDENCIES =3D host-pkgconf host-libgtk3 atk libglib2 cairo pa=
ngo
> \
> +LIBGTK3_DEPENDENCIES =3D host-pkgconf host-libgtk3 at-spi2-core libglib2
> cairo pango \
>         gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
>
>  ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
> --
> 2.25.1
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000000d199605f1e2e474
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 9 janv. 2023 =C3=A0=C2=
=A013:59, Lang Daniel via buildroot &lt;<a href=3D"mailto:buildroot@buildro=
ot.org">buildroot@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">atk has been merged into at-spi=
2-core with version 2.45.1.<br>
<br>
<a href=3D"https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_=
2_45_1/NEWS" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/=
GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NEWS</a><br>
<a href=3D"https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/at-spi=
2-core/-/merge_requests/78</a><br>
<br></blockquote><div><br></div><div><div>so, the patch package/libgtk3/000=
3-disable-atk-bridge.patch becomes useless.<br></div><div dir=3D"ltr"><br><=
/div><div>Fran=C3=A7ois<br></div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Signed-off-by: Daniel Lang &lt;<a href=3D"mailto:d.lang@abatec.at" target=
=3D"_blank">d.lang@abatec.at</a>&gt;<br>
---<br>
=C2=A0Config.in.legacy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 7 +++++++<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 =
-<br>
=C2=A0package/atk/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 --------------<=
br>
=C2=A0package/atk/atk.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 -----=
<br>
=C2=A0package/atk/<a href=3D"http://atk.mk" rel=3D"noreferrer" target=3D"_b=
lank">atk.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 -------------=
------------<br>
=C2=A0package/atkmm/Config.in=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0package/atkmm/<a href=3D"http://atkmm.mk" rel=3D"noreferrer" target=
=3D"_blank">atkmm.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0package/libglade/Config.in=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0package/libglade/<a href=3D"http://libglade.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">libglade.mk</a> |=C2=A0 2 +-<br>
=C2=A0package/libgtk2/Config.in=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0package/libgtk2/<a href=3D"http://libgtk2.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libgtk2.mk</a>=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0package/libgtk3/Config.in=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libgtk3.mk</a>=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A013 files changed, 18 insertions(+), 56 deletions(-)<br>
=C2=A0delete mode 100644 package/atk/Config.in<br>
=C2=A0delete mode 100644 package/atk/atk.hash<br>
=C2=A0delete mode 100644 package/atk/<a href=3D"http://atk.mk" rel=3D"noref=
errer" target=3D"_blank">atk.mk</a><br>
<br>
diff --git a/Config.in.legacy b/Config.in.legacy<br>
index 184bab6097..ac5943519e 100644<br>
--- a/Config.in.legacy<br>
+++ b/Config.in.legacy<br>
@@ -146,6 +146,13 @@ endif<br>
<br>
=C2=A0comment &quot;Legacy options removed in 2023.02&quot;<br>
<br>
+config BR2_PACKAGE_ATK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;atk removed&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_LEGACY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_AT_SPI2_CORE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atk is now part of at-spi2-core.<br>
+<br>
=C2=A0config BR2_PACKAGE_AT_SPI2_ATK<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;at-spi2-atk removed&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_LEGACY<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 5c8dcd849f..95db7c627b 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -1531,7 +1531,6 @@ endmenu<br>
=C2=A0menu &quot;Graphics&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/assimp/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/at-spi2-core/Config.in&quo=
t;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/atk/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/atkmm/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/bayer2rgb-neon/Config.in&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/bullet/Config.in&quot;<br>
diff --git a/package/atk/Config.in b/package/atk/Config.in<br>
deleted file mode 100644<br>
index d9371b879b..0000000000<br>
--- a/package/atk/Config.in<br>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-config BR2_PACKAGE_ATK<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;atk&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # glib2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # glib2<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # glib2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBGLIB2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The ATK accessibility toolkit, needed to=
 build GTK+-2.x.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.gnome.org/GNOM=
E/atk" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/=
atk</a><br>
-<br>
-comment &quot;atk needs a toolchain w/ wchar, threads&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS=
_THREADS<br>
diff --git a/package/atk/atk.hash b/package/atk/atk.hash<br>
deleted file mode 100644<br>
index d8cd69ff1f..0000000000<br>
--- a/package/atk/atk.hash<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-# From <a href=3D"http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38=
.0.sha256sum-sha256" rel=3D"noreferrer" target=3D"_blank">http://ftp.gnome.=
org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum<br>
-sha256</a>=C2=A0 ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f61=
91a0c36=C2=A0 atk-2.38.0.tar.xz<br>
-<br>
-# Hash for license file<br>
-sha256=C2=A0 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b5=
8e5=C2=A0 COPYING<br>
diff --git a/package/atk/<a href=3D"http://atk.mk" rel=3D"noreferrer" targe=
t=3D"_blank">atk.mk</a> b/package/atk/<a href=3D"http://atk.mk" rel=3D"nore=
ferrer" target=3D"_blank">atk.mk</a><br>
deleted file mode 100644<br>
index 2820fb486d..0000000000<br>
--- a/package/atk/<a href=3D"http://atk.mk" rel=3D"noreferrer" target=3D"_b=
lank">atk.mk</a><br>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-##########################################################################=
######<br>
-#<br>
-# atk<br>
-#<br>
-##########################################################################=
######<br>
-<br>
-ATK_VERSION_MAJOR =3D 2.38<br>
-ATK_VERSION =3D $(ATK_VERSION_MAJOR).0<br>
-ATK_SOURCE =3D atk-$(ATK_VERSION).tar.xz<br>
-ATK_SITE =3D <a href=3D"http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_V=
ERSION_MAJOR)-ATK_LICENSE" rel=3D"noreferrer" target=3D"_blank">http://ftp.=
gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)<br>
-ATK_LICENSE</a> =3D LGPL-2.0+<br>
-ATK_LICENSE_FILES =3D COPYING<br>
-ATK_INSTALL_STAGING =3D YES<br>
-ATK_DEPENDENCIES =3D libglib2 $(TARGET_NLS_DEPENDENCIES)<br>
-<br>
-ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)<br>
-ATK_CONF_OPTS +=3D -Dintrospection=3Dtrue<br>
-ATK_DEPENDENCIES +=3D gobject-introspection<br>
-else<br>
-ATK_CONF_OPTS +=3D -Dintrospection=3Dfalse<br>
-endif<br>
-<br>
-ATK_LDFLAGS =3D $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)<br>
-<br>
-$(eval $(meson-package))<br>
diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in<br>
index aa58f8d593..f6f2ca8fc2 100644<br>
--- a/package/atkmm/Config.in<br>
+++ b/package/atkmm/Config.in<br>
@@ -2,10 +2,10 @@ config BR2_PACKAGE_ATKMM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;atkmm&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_INSTALL_LIBSTDCPP # glibmm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsi=
gc<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glib=
mm -&gt; libglib2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # atk/glibmm -&gt; libgl=
ib2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # atk/glibmm -&gt; lib=
glib2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ATK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-=
core/glibmm -&gt; libglib2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # at-spi2-core/glibmm -&=
gt; libglib2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # at-spi2-core/glibmm =
-&gt; libglib2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_AT_SPI2_CORE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_GLIBMM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBSIGC<br>
<br>
diff --git a/package/atkmm/<a href=3D"http://atkmm.mk" rel=3D"noreferrer" t=
arget=3D"_blank">atkmm.mk</a> b/package/atkmm/<a href=3D"http://atkmm.mk" r=
el=3D"noreferrer" target=3D"_blank">atkmm.mk</a><br>
index 3bcb941c9f..76371aadbc 100644<br>
--- a/package/atkmm/<a href=3D"http://atkmm.mk" rel=3D"noreferrer" target=
=3D"_blank">atkmm.mk</a><br>
+++ b/package/atkmm/<a href=3D"http://atkmm.mk" rel=3D"noreferrer" target=
=3D"_blank">atkmm.mk</a><br>
@@ -11,6 +11,6 @@ ATKMM_SITE =3D <a href=3D"http://ftp.gnome.org/pub/gnome/=
sources/atkmm/$(ATKMM_VERSION_MAJOR)" rel=3D"noreferrer" target=3D"_blank">=
http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_VERSION_MAJOR)</a><br>
=C2=A0ATKMM_LICENSE =3D LGPL-2.1+ (library), GPL-2.0+ (tools)<br>
=C2=A0ATKMM_LICENSE_FILES =3D COPYING COPYING.tools<br>
=C2=A0ATKMM_INSTALL_STAGING =3D YES<br>
-ATKMM_DEPENDENCIES =3D atk glibmm libsigc host-pkgconf<br>
+ATKMM_DEPENDENCIES =3D at-spi2-core glibmm libsigc host-pkgconf<br>
<br>
=C2=A0$(eval $(meson-package))<br>
diff --git a/package/libglade/Config.in b/package/libglade/Config.in<br>
index e269a07548..4cf2ae4086 100644<br>
--- a/package/libglade/Config.in<br>
+++ b/package/libglade/Config.in<br>
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBGLADE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_THREADS # glib2<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_MMU # glib2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBGLIB2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ATK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_AT_SPI2_CORE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBXML2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Libglade allows you to load glade interf=
ace files in a program<br>
diff --git a/package/libglade/<a href=3D"http://libglade.mk" rel=3D"norefer=
rer" target=3D"_blank">libglade.mk</a> b/package/libglade/<a href=3D"http:/=
/libglade.mk" rel=3D"noreferrer" target=3D"_blank">libglade.mk</a><br>
index 32fa595f5a..24865fb8ff 100644<br>
--- a/package/libglade/<a href=3D"http://libglade.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">libglade.mk</a><br>
+++ b/package/libglade/<a href=3D"http://libglade.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">libglade.mk</a><br>
@@ -9,7 +9,7 @@ LIBGLADE_VERSION =3D $(LIBGLADE_VERSION_MAJOR).4<br>
=C2=A0LIBGLADE_SOURCE =3D libglade-$(LIBGLADE_VERSION).tar.bz2<br>
=C2=A0LIBGLADE_SITE =3D <a href=3D"http://ftp.gnome.org/pub/GNOME/sources/l=
ibglade/$(LIBGLADE_VERSION_MAJOR)" rel=3D"noreferrer" target=3D"_blank">htt=
p://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)</a><=
br>
=C2=A0LIBGLADE_INSTALL_STAGING =3D YES<br>
-LIBGLADE_DEPENDENCIES =3D host-pkgconf libglib2 libgtk2 atk libxml2<br>
+LIBGLADE_DEPENDENCIES =3D host-pkgconf libglib2 libgtk2 at-spi2-core libxm=
l2<br>
=C2=A0LIBGLADE_LICENSE =3D LGPL-2.0+<br>
=C2=A0LIBGLADE_LICENSE_FILES =3D COPYING<br>
<br>
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in<br>
index c75c37fb63..f2888b2f51 100644<br>
--- a/package/libgtk2/Config.in<br>
+++ b/package/libgtk2/Config.in<br>
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBGTK2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_INSTALL_LIBSTDCPP # pango<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -&g=
t; harfbuzz<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pan=
go -&gt; harfbuzz<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ATK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_AT_SPI2_CORE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_CAIRO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_CAIRO_PS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_CAIRO_PDF<br>
diff --git a/package/libgtk2/<a href=3D"http://libgtk2.mk" rel=3D"noreferre=
r" target=3D"_blank">libgtk2.mk</a> b/package/libgtk2/<a href=3D"http://lib=
gtk2.mk" rel=3D"noreferrer" target=3D"_blank">libgtk2.mk</a><br>
index d30e1d9d43..ad4dd74e4d 100644<br>
--- a/package/libgtk2/<a href=3D"http://libgtk2.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libgtk2.mk</a><br>
+++ b/package/libgtk2/<a href=3D"http://libgtk2.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libgtk2.mk</a><br>
@@ -23,7 +23,7 @@ LIBGTK2_CONF_ENV =3D \<br>
<br>
=C2=A0LIBGTK2_CONF_OPTS =3D --disable-glibtest --enable-explicit-deps=3Dno<=
br>
<br>
-LIBGTK2_DEPENDENCIES =3D host-pkgconf host-libgtk2 libglib2 cairo pango at=
k \<br>
+LIBGTK2_DEPENDENCIES =3D host-pkgconf host-libgtk2 libglib2 cairo pango at=
-spi2-core \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdk-pixbuf $(TARGET_NLS_DEPENDENCIES)<br>
<br>
=C2=A0LIBGTK2_MAKE_OPTS =3D LIBS=3D$(TARGET_NLS_LIBS)<br>
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in<br>
index bc8cacd9f5..cb44607b7c 100644<br>
--- a/package/libgtk3/Config.in<br>
+++ b/package/libgtk3/Config.in<br>
@@ -23,7 +23,7 @@ config BR2_PACKAGE_LIBGTK3<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pan=
go -&gt; harfbuzz<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_PACKAGE_HAS_LIB=
GL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ATK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_AT_SPI2_CORE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_CAIRO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_CAIRO_PS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_CAIRO_PDF<br>
diff --git a/package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D"noreferre=
r" target=3D"_blank">libgtk3.mk</a> b/package/libgtk3/<a href=3D"http://lib=
gtk3.mk" rel=3D"noreferrer" target=3D"_blank">libgtk3.mk</a><br>
index f277fce2ed..15190efd96 100644<br>
--- a/package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libgtk3.mk</a><br>
+++ b/package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libgtk3.mk</a><br>
@@ -30,7 +30,7 @@ LIBGTK3_MAKE_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_PROTOCOLS_DATADIR=3D$(STAGING_DIR)/usr/=
share/wayland-protocols \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D$(TARGET_NLS_LIBS)<br>
<br>
-LIBGTK3_DEPENDENCIES =3D host-pkgconf host-libgtk3 atk libglib2 cairo pang=
o \<br>
+LIBGTK3_DEPENDENCIES =3D host-pkgconf host-libgtk3 at-spi2-core libglib2 c=
airo pango \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)<=
br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)<br>
-- <br>
2.25.1<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--0000000000000d199605f1e2e474--

--===============7735143657660101972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7735143657660101972==--
