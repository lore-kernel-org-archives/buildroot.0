Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83476EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 05:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5DA60A89;
	Sun, 25 Jun 2023 05:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5DA60A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4APsX-aVY5Ew; Sun, 25 Jun 2023 05:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5511560E43;
	Sun, 25 Jun 2023 05:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5511560E43
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21E8C1BF409
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 05:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBC294062B
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 05:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBC294062B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kR5X9rY_i-vo for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 05:38:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57BC94021E
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57BC94021E
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 05:38:14 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6726d5d92afso186864b3a.1
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 22:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687671494; x=1690263494;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5OoqgQe40Q757S/8PqD12VDW1Xw7MfjfiaPTd4hLuls=;
 b=buAPRq5DJfn3tP91lT8rctdjZuG9dPcqJcZT6JHueBAHnOBEEavrCOgJ1cJxR5o5HS
 MoGmftRUqP+bC5dBC36DcAq0h4vUFMh3k6la/+rheGfaRxfaCXTz++RPnCZp1HyNc9nY
 zvBiGo3r/zNd/RgcQsrefhXIYXH/e94zER1Nch9OH2yuszN81DV5GspAkULvE9k4vr8l
 DceH0jzrb5nL3+Duvn8MpIASX9+HenJXGsW7sVQE+jvbvM4fZoHpiFumR2UeW1jIOErX
 o6Aqettbl4UqyYtjzUPDR9rX/uDiwK1XRQoZAwtOj3EdrYyD1dtqOuHOF1DvDAXXa7Q9
 RvBA==
X-Gm-Message-State: AC+VfDwyHplha3NZoJKjXR8FQrfwpltC4KODHkw58JtIZiYqJVWoW56i
 A9fB/E+9XnZNsZSiux44lwXFjRHP1coRg0mwub00A3CIsz4SJ6Yl+C0=
X-Google-Smtp-Source: ACHHUZ5/J6jxo/3SML5mHBx16h9XfNknC/LYEKDPw1Kn44Klqp/ezyLUqwcl5Q8VHNiMHEE6uYRmSQbrB9YlulvMnF0=
X-Received: by 2002:a17:903:22c8:b0:1b1:1168:656b with SMTP id
 y8-20020a17090322c800b001b11168656bmr4930334plg.26.1687671493506; Sat, 24 Jun
 2023 22:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-11-dannenberg@ti.com>
 <CAAE6iEVbgKo4FS7ofh_GbOi=tUDafp0sHkcthHskqaduiPb8zQ@mail.gmail.com>
 <20230623145945.kvxhcdbf2kycdyk5@dasso>
In-Reply-To: <20230623145945.kvxhcdbf2kycdyk5@dasso>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 25 Jun 2023 07:37:41 +0200
Message-ID: <CAAE6iEX1eomAE5_qr55=JKgRZWM-iZ+dmO+Ti_vQ94VuxZBe6Q@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1687671494; x=1690263494;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5OoqgQe40Q757S/8PqD12VDW1Xw7MfjfiaPTd4hLuls=;
 b=ZWzFZwLtHXnLWrW2wv76+KPASSFcJwyq3Zqk86rCZPE5JlqsjIq1KbSz3sbyf2e6bU
 PXq1XLZViFq5VF4o9W9BTN/YT+7ujqr265dE61DyRhdeX8J1/JZiY3dZHswIL0xWnIEP
 yJKnybqsVSdMepUvgUaFK3AYg6PYRpwA2+5ygGzj44ZP4neGF8Rm8n7X39mrBYfo3rCS
 XoZpwd5gelxkJt7M5Y/K/OSgY/lgGn+svAhNE3CApiLFr1LmLNmVHqpUE2lMK+mJU7C5
 WvlnuAx4idAOIi6O+7PNITVfyskvr+8JFBvmvxR1b1FQK8ALGvG0CnDZujFb776sBsHs
 N/Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=ZWzFZwLt
Subject: Re: [Buildroot] [PATCH v9 10/11] package/ti-rogue-um: new package
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
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: multipart/mixed; boundary="===============1475736708994817284=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1475736708994817284==
Content-Type: multipart/alternative; boundary="000000000000de4ac405feeda3aa"

--000000000000de4ac405feeda3aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 23 juin 2023 =C3=A0 16:59, Andreas Dannenberg <dannenberg@ti.com> a
=C3=A9crit :

> Hi Fran=C3=A7ois,
>
> On Fri, Jun 23, 2023 at 09:30:39AM +0200, Fran=C3=A7ois Perrad wrote:
> > Le jeu. 22 juin 2023 =C3=A0 18:07, Andreas Dannenberg via buildroot <
> > buildroot@buildroot.org> a =C3=A9crit :
> >
> > > This package adds the userspace libraries for the Rogue graphics
> > > accelerator of the following Texas Instruments SoCs: AM62, J721E,
> > > J721S2, and J784S4.
> > >
> > > Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> > > ---
> > >  package/Config.in                             |   1 +
> > >  .../0001-all-drop-the-init-script.patch       | 832 ++++++++++++++++=
++
> > >  package/ti-rogue-um/Config.in                 |  52 ++
> > >  package/ti-rogue-um/ti-rogue-um.hash          |   3 +
> > >  package/ti-rogue-um/ti-rogue-um.mk            |  38 +
> > >  5 files changed, 926 insertions(+)
> > >  create mode 100644
> package/ti-rogue-um/0001-all-drop-the-init-script.patch
> > >  create mode 100644 package/ti-rogue-um/Config.in
> > >  create mode 100644 package/ti-rogue-um/ti-rogue-um.hash
> > >  create mode 100644 package/ti-rogue-um/ti-rogue-um.mk
> > >
> > > diff --git a/package/Config.in b/package/Config.in
> > > index 96ef0d72de..0bff1135aa 100644
> > > --- a/package/Config.in
> > > +++ b/package/Config.in
> > > @@ -614,6 +614,7 @@ endmenu
> > >         source "package/targetcli-fb/Config.in"
> > >         source "package/ti-gfx/Config.in"
> > >         source "package/ti-rogue-km/Config.in"
> > > +       source "package/ti-rogue-um/Config.in"
> > >         source "package/ti-sgx-demos/Config.in"
> > >         source "package/ti-sgx-km/Config.in"
> > >         source "package/ti-sgx-um/Config.in"
> > > diff --git a/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> > > b/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> > > new file mode 100644
> > > index 0000000000..4f3dd1cbb1
> > > --- /dev/null
> > > +++ b/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> > > @@ -0,0 +1,832 @@
> > > +From 99e0da8a1c08818c59680f726e11a84b26daf29f Mon Sep 17 00:00:00 20=
01
> > > +From: Randolph Sapp <rs@ti.com>
> > > +Date: Thu, 25 May 2023 18:59:26 -0500
> > > +Subject: [PATCH] all: drop the init script
> > > +
> > > +Nobody should be using this anymore. It's sysVinit and it's just a
> fancy
> > > +wrapper around modprobe anyway. We'll be dropping it from our build
> > > +tools soon.
> > > +
> > > +Signed-off-by: Randolph Sapp <rs@ti.com>
> > > +---
> > > + .../wayland/release/etc/init.d/rc.pvr         | 196
> ------------------
> > > + .../wayland/release/etc/init.d/rc.pvr         | 196
> ------------------
> > > + .../wayland/release/etc/init.d/rc.pvr         | 196
> ------------------
> > > + .../wayland/release/etc/init.d/rc.pvr         | 196
> ------------------
> > > + 4 files changed, 784 deletions(-)
> > > + delete mode 100755
> targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> > > + delete mode 100755
> targetfs/j721e_linux/wayland/release/etc/init.d/rc.pvr
> > > + delete mode 100755
> > > targetfs/j721s2_linux/wayland/release/etc/init.d/rc.pvr
> > > + delete mode 100755
> > > targetfs/j784s4_linux/wayland/release/etc/init.d/rc.pvr
> > > +
> > > +diff --git a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> > > b/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> > > +deleted file mode 100755
> > > +index 428cd86..0000000
> > > +--- a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> > > ++++ /dev/null
> > > +2.34.1
> > > +
> > > diff --git a/package/ti-rogue-um/Config.in
> b/package/ti-rogue-um/Config.in
> > > new file mode 100644
> > > index 0000000000..15257858c2
> > > --- /dev/null
> > > +++ b/package/ti-rogue-um/Config.in
> > > @@ -0,0 +1,52 @@
> > > +comment "ti-rogue-um needs udev and a glibc toolchain w/ threads"
> > > +       depends on BR2_aarch64
> > > +       depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC=
 \
> > > +               || !BR2_TOOLCHAIN_HAS_THREADS
> > > +
> > > +config BR2_PACKAGE_TI_ROGUE_UM
> > > +       bool "ti-rogue-um"
> > > +       depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
> > > +       depends on BR2_PACKAGE_HAS_UDEV
> > > +       # pre-built binaries
> > > +       depends on BR2_TOOLCHAIN_USES_GLIBC
> > > +       depends on BR2_aarch64
> > > +       select BR2_PACKAGE_LIBDRM
> > > +       select BR2_PACKAGE_HAS_LIBEGL
> > > +       select BR2_PACKAGE_HAS_LIBGBM
> > > +       select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> > > +       select BR2_PACKAGE_HAS_LIBGLES
> > > +       select BR2_PACKAGE_HAS_POWERVR
> > > +       select BR2_PACKAGE_LIBFFI
>

BR2_PACKAGE_LIBFFI is useless (already selected by the package wayland).

Fran=C3=A7ois.



> > > +       select BR2_PACKAGE_WAYLAND
> > > +       select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> > > +       select BR2_PACKAGE_TI_ROGUE_KM if BR2_LINUX_KERNEL
> > > +       help
> > > +         Graphics libraries for TI SoCs with Rogue GPU.
> > > +         This package supports AM62, J721E, J721S2, and J784S4
> > > +         SoCs only.
> > > +
> > > +         https://git.ti.com/cgit/graphics/ti-img-rogue-umlibs
> > > +
> > > +if BR2_PACKAGE_TI_ROGUE_UM
> > > +
> > > +config BR2_PACKAGE_PROVIDES_LIBEGL
> > > +       default "ti-rogue-um"
> > > +
> > > +config BR2_PACKAGE_PROVIDES_LIBGBM
> > > +       default "ti-rogue-um"
> > > +
> > > +config BR2_PACKAGE_PROVIDES_LIBGLES
> > > +       default "ti-rogue-um"
> > > +
> > > +config BR2_PACKAGE_PROVIDES_POWERVR
> > > +       default "ti-rogue-um"
> > > +
> > > +config BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT
> > > +       string "UM driver target product"
> > > +       default "am62_linux"
> > > +       help
> > > +         Select target product to be used for UM libraries. This
> needs to
> > > +         match one of the SoC-specific folders within the
> root/targetfs
> > > +         folder of the ti-img-rogue-umlibs Git repository.
> > > +
> > > +endif
> > > diff --git a/package/ti-rogue-um/ti-rogue-um.hash
> > > b/package/ti-rogue-um/ti-rogue-um.hash
> > > new file mode 100644
> > > index 0000000000..a41bf33145
> > > --- /dev/null
> > > +++ b/package/ti-rogue-um/ti-rogue-um.hash
> > > @@ -0,0 +1,3 @@
> > > +# Locally calculated
> > > +sha256
> 2e1bd1a5ab0ad2db1b9164d028a94f8f9d20743131f337a817fd1c8f9ddd4cbe
> > > ti-rogue-um-5977e82b96028f783d39c7219f016c1faf8dc5f5-br1.tar.gz
> > > +sha256
> 37507b462edf97b59717d2d144daaac85fbca6080c3602b5128e446e97f9ad47
> > > LICENSE
> > > diff --git a/package/ti-rogue-um/ti-rogue-um.mk b/package/ti-rogue-um=
/
> > > ti-rogue-um.mk
> > > new file mode 100644
> > > index 0000000000..fa29638fa7
> > > --- /dev/null
> > > +++ b/package/ti-rogue-um/ti-rogue-um.mk
> > > @@ -0,0 +1,38 @@
> > >
> > >
> +########################################################################=
########
> > > +#
> > > +# ti-rogue-um
> > > +#
> > >
> > >
> +########################################################################=
########
> > > +
> > > +# This corresponds to SDK 08.06.00
> > > +TI_ROGUE_UM_VERSION =3D 5977e82b96028f783d39c7219f016c1faf8dc5f5
> > > +TI_ROGUE_UM_SITE =3D
> > > https://git.ti.com/git/graphics/ti-img-rogue-umlibs.git
> > > +TI_ROGUE_UM_SITE_METHOD =3D git
> > > +TI_ROGUE_UM_LICENSE =3D TI TSPA License
> > > +TI_ROGUE_UM_LICENSE_FILES =3D LICENSE
> > > +TI_ROGUE_UM_INSTALL_STAGING =3D YES
> > > +TI_ROGUE_UM_PROVIDES =3D libegl libgbm libgles powervr
> > > +
> > > +# ti-rogue-um is a egl/gles provider only if libdrm is installed
> > > +TI_ROGUE_UM_DEPENDENCIES =3D libdrm wayland
> > >
> >
> > useless built dependencies (nothing is built, blobs are copied), runtim=
e
> > dependencies in Config.in are enough.
>
> Understood, will fix it. Btw this was a carry-over from
> package/ti-sgx-um/ti-sgx-um.mk which I used to model this new package
> after, so opportunity for improvement there as well...
>
> > +
> > > +PVR_BUILD =3D "release"
> > > +PVR_WS =3D "wayland"
> > > +
> > >
> >
> > TI_ROGUE_UM_MAKE_OPTS =3D \
> >       TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \
> >       BUILD=3Drelease \
> >       WINDOW_SYSTEM=3Dwayland
> >
> > define TI_ROGUE_UM_INSTALL_STAGING_CMDS
> >      $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> >           $(TI_ROGUE_UM_MAKE_OPTS) \
> >           DESTDIR=3D$(STAGING_DIR) \
> >           install
> > endef
> > by this way, all variables are prefixed by TI_ROGUE_UM_.
>
> Good idea, will factor-out the make options. Thanks for taking the time
> to review & improve this patch.
>
> --
> Andreas Dannenberg
> Texas Instruments Inc
>
>
>
> >
> > Fran=C3=A7ois
> >
> >
> > > +define TI_ROGUE_UM_INSTALL_STAGING_CMDS
> > > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> > > +               DESTDIR=3D$(STAGING_DIR) \
> > > +
>  TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \
> > > +               BUILD=3D$(PVR_BUILD) WINDOW_SYSTEM=3D$(PVR_WS) \
> > > +               install
> > > +endef
> > > +
> > > +define TI_ROGUE_UM_INSTALL_TARGET_CMDS
> > > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> > > +               DESTDIR=3D$(TARGET_DIR) \
> > > +
>  TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \
> > > +               BUILD=3D$(PVR_BUILD) WINDOW_SYSTEM=3D$(PVR_WS) \
> > > +               install
> > > +endef
> > > +
> > > +$(eval $(generic-package))
> > > --
> > > 2.34.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > >
>

--000000000000de4ac405feeda3aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 23 juin 2023 =C3=A0=C2=
=A016:59, Andreas Dannenberg &lt;<a href=3D"mailto:dannenberg@ti.com">danne=
nberg@ti.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi Fran=C3=A7ois,<br>
<br>
On Fri, Jun 23, 2023 at 09:30:39AM +0200, Fran=C3=A7ois Perrad wrote:<br>
&gt; Le jeu. 22 juin 2023 =C3=A0 18:07, Andreas Dannenberg via buildroot &l=
t;<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a>&gt; a =C3=A9crit :<br>
&gt; <br>
&gt; &gt; This package adds the userspace libraries for the Rogue graphics<=
br>
&gt; &gt; accelerator of the following Texas Instruments SoCs: AM62, J721E,=
<br>
&gt; &gt; J721S2, and J784S4.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Andreas Dannenberg &lt;<a href=3D"mailto:dannenber=
g@ti.com" target=3D"_blank">dannenberg@ti.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
&gt; &gt;=C2=A0 .../0001-all-drop-the-init-script.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 832 ++++++++++++++++++<br>
&gt; &gt;=C2=A0 package/ti-rogue-um/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 52 ++<br>
&gt; &gt;=C2=A0 package/ti-rogue-um/ti-rogue-um.hash=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt; &gt;=C2=A0 package/ti-rogue-um/<a href=3D"http://ti-rogue-um.mk" rel=
=3D"noreferrer" target=3D"_blank">ti-rogue-um.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 38 +<br>
&gt; &gt;=C2=A0 5 files changed, 926 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 package/ti-rogue-um/0001-all-drop-the-in=
it-script.patch<br>
&gt; &gt;=C2=A0 create mode 100644 package/ti-rogue-um/Config.in<br>
&gt; &gt;=C2=A0 create mode 100644 package/ti-rogue-um/ti-rogue-um.hash<br>
&gt; &gt;=C2=A0 create mode 100644 package/ti-rogue-um/<a href=3D"http://ti=
-rogue-um.mk" rel=3D"noreferrer" target=3D"_blank">ti-rogue-um.mk</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt; &gt; index 96ef0d72de..0bff1135aa 100644<br>
&gt; &gt; --- a/package/Config.in<br>
&gt; &gt; +++ b/package/Config.in<br>
&gt; &gt; @@ -614,6 +614,7 @@ endmenu<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/targetcli-f=
b/Config.in&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/ti-gfx/Conf=
ig.in&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/ti-rogue-km=
/Config.in&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/ti-rogue-um/Conf=
ig.in&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/ti-sgx-demo=
s/Config.in&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/ti-sgx-km/C=
onfig.in&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/ti-sgx-um/C=
onfig.in&quot;<br>
&gt; &gt; diff --git a/package/ti-rogue-um/0001-all-drop-the-init-script.pa=
tch<br>
&gt; &gt; b/package/ti-rogue-um/0001-all-drop-the-init-script.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..4f3dd1cbb1<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/package/ti-rogue-um/0001-all-drop-the-init-script.patch<br>
&gt; &gt; @@ -0,0 +1,832 @@<br>
&gt; &gt; +From 99e0da8a1c08818c59680f726e11a84b26daf29f Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_=
blank">rs@ti.com</a>&gt;<br>
&gt; &gt; +Date: Thu, 25 May 2023 18:59:26 -0500<br>
&gt; &gt; +Subject: [PATCH] all: drop the init script<br>
&gt; &gt; +<br>
&gt; &gt; +Nobody should be using this anymore. It&#39;s sysVinit and it&#3=
9;s just a fancy<br>
&gt; &gt; +wrapper around modprobe anyway. We&#39;ll be dropping it from ou=
r build<br>
&gt; &gt; +tools soon.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" ta=
rget=3D"_blank">rs@ti.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + .../wayland/release/etc/init.d/rc.pvr=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 196 ------------------<br>
&gt; &gt; + .../wayland/release/etc/init.d/rc.pvr=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 196 ------------------<br>
&gt; &gt; + .../wayland/release/etc/init.d/rc.pvr=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 196 ------------------<br>
&gt; &gt; + .../wayland/release/etc/init.d/rc.pvr=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 196 ------------------<br>
&gt; &gt; + 4 files changed, 784 deletions(-)<br>
&gt; &gt; + delete mode 100755 targetfs/am62_linux/wayland/release/etc/init=
.d/rc.pvr<br>
&gt; &gt; + delete mode 100755 targetfs/j721e_linux/wayland/release/etc/ini=
t.d/rc.pvr<br>
&gt; &gt; + delete mode 100755<br>
&gt; &gt; targetfs/j721s2_linux/wayland/release/etc/init.d/rc.pvr<br>
&gt; &gt; + delete mode 100755<br>
&gt; &gt; targetfs/j784s4_linux/wayland/release/etc/init.d/rc.pvr<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/targetfs/am62_linux/wayland/release/etc/init.d/rc.p=
vr<br>
&gt; &gt; b/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr<br>
&gt; &gt; +deleted file mode 100755<br>
&gt; &gt; +index 428cd86..0000000<br>
&gt; &gt; +--- a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr<br>
&gt; &gt; ++++ /dev/null<br>
&gt; &gt; +2.34.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/package/ti-rogue-um/Config.in b/package/ti-rogue-um/=
Config.in<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..15257858c2<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/package/ti-rogue-um/Config.in<br>
&gt; &gt; @@ -0,0 +1,52 @@<br>
&gt; &gt; +comment &quot;ti-rogue-um needs udev and a glibc toolchain w/ th=
reads&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_aarch64<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_HAS_UDEV || !=
BR2_TOOLCHAIN_USES_GLIBC \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| !BR2_T=
OOLCHAIN_HAS_THREADS<br>
&gt; &gt; +<br>
&gt; &gt; +config BR2_PACKAGE_TI_ROGUE_UM<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ti-rogue-um&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS =
# libdrm<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_UDEV<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# pre-built binaries<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_USES_GLIBC<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_aarch64<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBDRM<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HAS_LIBEGL<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HAS_LIBGBM<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBGBM_HAS_FEATURE=
_DMA_BUF<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HAS_LIBGLES<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HAS_POWERVR<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBFFI<br></blockq=
uote><div><br></div><div>BR2_PACKAGE_LIBFFI is useless (already selected by=
 the package wayland).<br></div><div><br></div><div>Fran=C3=A7ois.</div><di=
v><br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_WAYLAND<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HAS_LIBEGL_WAYLAND=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_TI_ROGUE_KM if BR2=
_LINUX_KERNEL<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Graphics libraries for TI SoCs=
 with Rogue GPU.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This package supports AM62, J7=
21E, J721S2, and J784S4<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SoCs only.<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://git.ti.com/=
cgit/graphics/ti-img-rogue-umlibs" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.ti.com/cgit/graphics/ti-img-rogue-umlibs</a><br>
&gt; &gt; +<br>
&gt; &gt; +if BR2_PACKAGE_TI_ROGUE_UM<br>
&gt; &gt; +<br>
&gt; &gt; +config BR2_PACKAGE_PROVIDES_LIBEGL<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;ti-rogue-um&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +config BR2_PACKAGE_PROVIDES_LIBGBM<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;ti-rogue-um&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +config BR2_PACKAGE_PROVIDES_LIBGLES<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;ti-rogue-um&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +config BR2_PACKAGE_PROVIDES_POWERVR<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;ti-rogue-um&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +config BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;UM driver target product=
&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;am62_linux&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Select target product to be us=
ed for UM libraries. This needs to<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match one of the SoC-specific =
folders within the root/targetfs<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0folder of the ti-img-rogue-uml=
ibs Git repository.<br>
&gt; &gt; +<br>
&gt; &gt; +endif<br>
&gt; &gt; diff --git a/package/ti-rogue-um/ti-rogue-um.hash<br>
&gt; &gt; b/package/ti-rogue-um/ti-rogue-um.hash<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..a41bf33145<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/package/ti-rogue-um/ti-rogue-um.hash<br>
&gt; &gt; @@ -0,0 +1,3 @@<br>
&gt; &gt; +# Locally calculated<br>
&gt; &gt; +sha256=C2=A0 2e1bd1a5ab0ad2db1b9164d028a94f8f9d20743131f337a817f=
d1c8f9ddd4cbe<br>
&gt; &gt; ti-rogue-um-5977e82b96028f783d39c7219f016c1faf8dc5f5-br1.tar.gz<b=
r>
&gt; &gt; +sha256=C2=A0 37507b462edf97b59717d2d144daaac85fbca6080c3602b5128=
e446e97f9ad47<br>
&gt; &gt; LICENSE<br>
&gt; &gt; diff --git a/package/ti-rogue-um/<a href=3D"http://ti-rogue-um.mk=
" rel=3D"noreferrer" target=3D"_blank">ti-rogue-um.mk</a> b/package/ti-rogu=
e-um/<br>
&gt; &gt; <a href=3D"http://ti-rogue-um.mk" rel=3D"noreferrer" target=3D"_b=
lank">ti-rogue-um.mk</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..fa29638fa7<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/package/ti-rogue-um/<a href=3D"http://ti-rogue-um.mk" rel=
=3D"noreferrer" target=3D"_blank">ti-rogue-um.mk</a><br>
&gt; &gt; @@ -0,0 +1,38 @@<br>
&gt; &gt;<br>
&gt; &gt; +################################################################=
################<br>
&gt; &gt; +#<br>
&gt; &gt; +# ti-rogue-um<br>
&gt; &gt; +#<br>
&gt; &gt;<br>
&gt; &gt; +################################################################=
################<br>
&gt; &gt; +<br>
&gt; &gt; +# This corresponds to SDK 08.06.00<br>
&gt; &gt; +TI_ROGUE_UM_VERSION =3D 5977e82b96028f783d39c7219f016c1faf8dc5f5=
<br>
&gt; &gt; +TI_ROGUE_UM_SITE =3D<br>
&gt; &gt; <a href=3D"https://git.ti.com/git/graphics/ti-img-rogue-umlibs.gi=
t" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/git/graphics/ti-=
img-rogue-umlibs.git</a><br>
&gt; &gt; +TI_ROGUE_UM_SITE_METHOD =3D git<br>
&gt; &gt; +TI_ROGUE_UM_LICENSE =3D TI TSPA License<br>
&gt; &gt; +TI_ROGUE_UM_LICENSE_FILES =3D LICENSE<br>
&gt; &gt; +TI_ROGUE_UM_INSTALL_STAGING =3D YES<br>
&gt; &gt; +TI_ROGUE_UM_PROVIDES =3D libegl libgbm libgles powervr<br>
&gt; &gt; +<br>
&gt; &gt; +# ti-rogue-um is a egl/gles provider only if libdrm is installed=
<br>
&gt; &gt; +TI_ROGUE_UM_DEPENDENCIES =3D libdrm wayland<br>
&gt; &gt;<br>
&gt; <br>
&gt; useless built dependencies (nothing is built, blobs are copied), runti=
me<br>
&gt; dependencies in Config.in are enough.<br>
<br>
Understood, will fix it. Btw this was a carry-over from<br>
package/ti-sgx-um/<a href=3D"http://ti-sgx-um.mk" rel=3D"noreferrer" target=
=3D"_blank">ti-sgx-um.mk</a> which I used to model this new package<br>
after, so opportunity for improvement there as well...<br>
<br>
&gt; +<br>
&gt; &gt; +PVR_BUILD =3D &quot;release&quot;<br>
&gt; &gt; +PVR_WS =3D &quot;wayland&quot;<br>
&gt; &gt; +<br>
&gt; &gt;<br>
&gt; <br>
&gt; TI_ROGUE_UM_MAKE_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TA=
RGET_PRODUCT) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD=3Drelease \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0WINDOW_SYSTEM=3Dwayland<br>
&gt; <br>
&gt; define TI_ROGUE_UM_INSTALL_STAGING_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TI_ROGUE_UM_MAKE_OPTS) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DESTDIR=3D$(STAGING_DIR) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install<br>
&gt; endef<br>
&gt; by this way, all variables are prefixed by TI_ROGUE_UM_.<br>
<br>
Good idea, will factor-out the make options. Thanks for taking the time<br>
to review &amp; improve this patch.<br>
<br>
--<br>
Andreas Dannenberg<br>
Texas Instruments Inc<br>
<br>
<br>
<br>
&gt; <br>
&gt; Fran=C3=A7ois<br>
&gt; <br>
&gt; <br>
&gt; &gt; +define TI_ROGUE_UM_INSTALL_STAGING_CMDS<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DESTDIR=
=3D$(STAGING_DIR) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_PR=
ODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD=3D$=
(PVR_BUILD) WINDOW_SYSTEM=3D$(PVR_WS) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install<b=
r>
&gt; &gt; +endef<br>
&gt; &gt; +<br>
&gt; &gt; +define TI_ROGUE_UM_INSTALL_TARGET_CMDS<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DESTDIR=
=3D$(TARGET_DIR) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_PR=
ODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD=3D$=
(PVR_BUILD) WINDOW_SYSTEM=3D$(PVR_WS) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install<b=
r>
&gt; &gt; +endef<br>
&gt; &gt; +<br>
&gt; &gt; +$(eval $(generic-package))<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; buildroot mailing list<br>
&gt; &gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buil=
droot@buildroot.org</a><br>
&gt; &gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot=
" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/=
listinfo/buildroot</a><br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000de4ac405feeda3aa--

--===============1475736708994817284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1475736708994817284==--
