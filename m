Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81288EB64D7
	for <buildroot@archiver.kernel.org>; Fri, 23 Jun 2023 07:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDCDC40150;
	Fri, 23 Jun 2023 07:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDCDC40150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8erqYiUUW5O; Fri, 23 Jun 2023 07:31:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81C1640180;
	Fri, 23 Jun 2023 07:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81C1640180
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 863741BF4DD
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 07:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60337607A1
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 07:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60337607A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hppmoRKtCJDn for <buildroot@lists.busybox.net>;
 Fri, 23 Jun 2023 07:31:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFED8607D0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFED8607D0
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 07:31:04 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b512309d18so1499255ad.3
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 00:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687505464; x=1690097464;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qu1C+9e0d0Tv2+cnUyE3Wsaky8SV3ttq78zU9xhut50=;
 b=dxNUymiKLBr6oHMcDmBzoMTPUDyZP4CiKlUF++MkTVCM1Co2L1mQoVQx6Y/AM2BgmW
 P4o1hznzigJxha3PKmbFj08rq5ieit6IE1Vns+j8khuqGoKedimTucN1JnA7QtIReAIz
 qo3wKHfRKqKpOTEQ41qJ7ncul2rk0JznHTFTAnsUiizVkBa78mOKeYgZa31bDsTrVMia
 jpM2sitmLaEbXhkt+AUDhPaaCvDCF7l9NOsrhMz7/JHostxVxwhswsfGfYqGbYabqTzy
 hiA8wiYro8CpevYth0aI0JJcKC5hVMV8vA8P/xJmQ13fAUwSrPCuFjhvYqwFc694cAYf
 KA0A==
X-Gm-Message-State: AC+VfDxyJk/bo3o324T+O1oaT1+ZA/bv3Ht7ogxp+CusTbEoTAYubImL
 1wGCNx7UCgw7gQ12p7S/rmxF4u37+UBx5/ma1A+CoATDqoFXtdm74e8=
X-Google-Smtp-Source: ACHHUZ49tA8jgh03ElAdwnomgfeLPvguZG3W0cO5HlLwyfh8rhhs1rahQm5bR2KMGSa3N0RjPO2xmN6VEW5LnsYfE5A=
X-Received: by 2002:a17:902:d4ce:b0:1b6:9df6:26a8 with SMTP id
 o14-20020a170902d4ce00b001b69df626a8mr6339413plg.1.1687505464118; Fri, 23 Jun
 2023 00:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-11-dannenberg@ti.com>
In-Reply-To: <20230622160212.2063472-11-dannenberg@ti.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 23 Jun 2023 09:30:39 +0200
Message-ID: <CAAE6iEVbgKo4FS7ofh_GbOi=tUDafp0sHkcthHskqaduiPb8zQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1687505464; x=1690097464;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qu1C+9e0d0Tv2+cnUyE3Wsaky8SV3ttq78zU9xhut50=;
 b=mAmuwZH8F78Rz8rFNsp0UTtKSYj+hw0Bro4eLgO99inMrXPoYmQoLfENnEwB8OJEVc
 F6lEGgsuel9edV6jiMhRHlh00vcF7YN6sWBzZ4bpj8wlcxp5nXePvBorZVyAuOQwVfEk
 6uLTctGI8TS6faU0V52cmPEAx5vCF6fj8BGwm93MxvgY+sFyE+9rp8kPCn9TB0C1Hsc0
 RDBTbYdbvzPG7Ye686OTiZo/uZ5Qbq6K2H0XHsM6ULOdbLb/Gxt+cYHk4J2gUlGPCWdO
 fjEGe14Ltk06Q3NCsMiWRTSKRYzd+Enk6FBCVCOkkJ9dM0hIukyjHIY7aII4CRA6hERK
 O8Vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=mAmuwZH8
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
Content-Type: multipart/mixed; boundary="===============6444822721412988722=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6444822721412988722==
Content-Type: multipart/alternative; boundary="000000000000bee52e05fec6fb73"

--000000000000bee52e05fec6fb73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 22 juin 2023 =C3=A0 18:07, Andreas Dannenberg via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> This package adds the userspace libraries for the Rogue graphics
> accelerator of the following Texas Instruments SoCs: AM62, J721E,
> J721S2, and J784S4.
>
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  package/Config.in                             |   1 +
>  .../0001-all-drop-the-init-script.patch       | 832 ++++++++++++++++++
>  package/ti-rogue-um/Config.in                 |  52 ++
>  package/ti-rogue-um/ti-rogue-um.hash          |   3 +
>  package/ti-rogue-um/ti-rogue-um.mk            |  38 +
>  5 files changed, 926 insertions(+)
>  create mode 100644 package/ti-rogue-um/0001-all-drop-the-init-script.pat=
ch
>  create mode 100644 package/ti-rogue-um/Config.in
>  create mode 100644 package/ti-rogue-um/ti-rogue-um.hash
>  create mode 100644 package/ti-rogue-um/ti-rogue-um.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 96ef0d72de..0bff1135aa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -614,6 +614,7 @@ endmenu
>         source "package/targetcli-fb/Config.in"
>         source "package/ti-gfx/Config.in"
>         source "package/ti-rogue-km/Config.in"
> +       source "package/ti-rogue-um/Config.in"
>         source "package/ti-sgx-demos/Config.in"
>         source "package/ti-sgx-km/Config.in"
>         source "package/ti-sgx-um/Config.in"
> diff --git a/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> b/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> new file mode 100644
> index 0000000000..4f3dd1cbb1
> --- /dev/null
> +++ b/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> @@ -0,0 +1,832 @@
> +From 99e0da8a1c08818c59680f726e11a84b26daf29f Mon Sep 17 00:00:00 2001
> +From: Randolph Sapp <rs@ti.com>
> +Date: Thu, 25 May 2023 18:59:26 -0500
> +Subject: [PATCH] all: drop the init script
> +
> +Nobody should be using this anymore. It's sysVinit and it's just a fancy
> +wrapper around modprobe anyway. We'll be dropping it from our build
> +tools soon.
> +
> +Signed-off-by: Randolph Sapp <rs@ti.com>
> +---
> + .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
> + .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
> + .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
> + .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
> + 4 files changed, 784 deletions(-)
> + delete mode 100755 targetfs/am62_linux/wayland/release/etc/init.d/rc.pv=
r
> + delete mode 100755 targetfs/j721e_linux/wayland/release/etc/init.d/rc.p=
vr
> + delete mode 100755
> targetfs/j721s2_linux/wayland/release/etc/init.d/rc.pvr
> + delete mode 100755
> targetfs/j784s4_linux/wayland/release/etc/init.d/rc.pvr
> +
> +diff --git a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> b/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> +deleted file mode 100755
> +index 428cd86..0000000
> +--- a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> ++++ /dev/null
> +2.34.1
> +
> diff --git a/package/ti-rogue-um/Config.in b/package/ti-rogue-um/Config.i=
n
> new file mode 100644
> index 0000000000..15257858c2
> --- /dev/null
> +++ b/package/ti-rogue-um/Config.in
> @@ -0,0 +1,52 @@
> +comment "ti-rogue-um needs udev and a glibc toolchain w/ threads"
> +       depends on BR2_aarch64
> +       depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC \
> +               || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +config BR2_PACKAGE_TI_ROGUE_UM
> +       bool "ti-rogue-um"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
> +       depends on BR2_PACKAGE_HAS_UDEV
> +       # pre-built binaries
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       depends on BR2_aarch64
> +       select BR2_PACKAGE_LIBDRM
> +       select BR2_PACKAGE_HAS_LIBEGL
> +       select BR2_PACKAGE_HAS_LIBGBM
> +       select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> +       select BR2_PACKAGE_HAS_LIBGLES
> +       select BR2_PACKAGE_HAS_POWERVR
> +       select BR2_PACKAGE_LIBFFI
> +       select BR2_PACKAGE_WAYLAND
> +       select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +       select BR2_PACKAGE_TI_ROGUE_KM if BR2_LINUX_KERNEL
> +       help
> +         Graphics libraries for TI SoCs with Rogue GPU.
> +         This package supports AM62, J721E, J721S2, and J784S4
> +         SoCs only.
> +
> +         https://git.ti.com/cgit/graphics/ti-img-rogue-umlibs
> +
> +if BR2_PACKAGE_TI_ROGUE_UM
> +
> +config BR2_PACKAGE_PROVIDES_LIBEGL
> +       default "ti-rogue-um"
> +
> +config BR2_PACKAGE_PROVIDES_LIBGBM
> +       default "ti-rogue-um"
> +
> +config BR2_PACKAGE_PROVIDES_LIBGLES
> +       default "ti-rogue-um"
> +
> +config BR2_PACKAGE_PROVIDES_POWERVR
> +       default "ti-rogue-um"
> +
> +config BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT
> +       string "UM driver target product"
> +       default "am62_linux"
> +       help
> +         Select target product to be used for UM libraries. This needs t=
o
> +         match one of the SoC-specific folders within the root/targetfs
> +         folder of the ti-img-rogue-umlibs Git repository.
> +
> +endif
> diff --git a/package/ti-rogue-um/ti-rogue-um.hash
> b/package/ti-rogue-um/ti-rogue-um.hash
> new file mode 100644
> index 0000000000..a41bf33145
> --- /dev/null
> +++ b/package/ti-rogue-um/ti-rogue-um.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  2e1bd1a5ab0ad2db1b9164d028a94f8f9d20743131f337a817fd1c8f9ddd4cbe
> ti-rogue-um-5977e82b96028f783d39c7219f016c1faf8dc5f5-br1.tar.gz
> +sha256  37507b462edf97b59717d2d144daaac85fbca6080c3602b5128e446e97f9ad47
> LICENSE
> diff --git a/package/ti-rogue-um/ti-rogue-um.mk b/package/ti-rogue-um/
> ti-rogue-um.mk
> new file mode 100644
> index 0000000000..fa29638fa7
> --- /dev/null
> +++ b/package/ti-rogue-um/ti-rogue-um.mk
> @@ -0,0 +1,38 @@
>
> +########################################################################=
########
> +#
> +# ti-rogue-um
> +#
>
> +########################################################################=
########
> +
> +# This corresponds to SDK 08.06.00
> +TI_ROGUE_UM_VERSION =3D 5977e82b96028f783d39c7219f016c1faf8dc5f5
> +TI_ROGUE_UM_SITE =3D
> https://git.ti.com/git/graphics/ti-img-rogue-umlibs.git
> +TI_ROGUE_UM_SITE_METHOD =3D git
> +TI_ROGUE_UM_LICENSE =3D TI TSPA License
> +TI_ROGUE_UM_LICENSE_FILES =3D LICENSE
> +TI_ROGUE_UM_INSTALL_STAGING =3D YES
> +TI_ROGUE_UM_PROVIDES =3D libegl libgbm libgles powervr
> +
> +# ti-rogue-um is a egl/gles provider only if libdrm is installed
> +TI_ROGUE_UM_DEPENDENCIES =3D libdrm wayland
>

useless built dependencies (nothing is built, blobs are copied), runtime
dependencies in Config.in are enough.

+
> +PVR_BUILD =3D "release"
> +PVR_WS =3D "wayland"
> +
>

TI_ROGUE_UM_MAKE_OPTS =3D \
      TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \
      BUILD=3Drelease \
      WINDOW_SYSTEM=3Dwayland

define TI_ROGUE_UM_INSTALL_STAGING_CMDS
     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
          $(TI_ROGUE_UM_MAKE_OPTS) \
          DESTDIR=3D$(STAGING_DIR) \
          install
endef
by this way, all variables are prefixed by TI_ROGUE_UM_.

Fran=C3=A7ois


> +define TI_ROGUE_UM_INSTALL_STAGING_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +               DESTDIR=3D$(STAGING_DIR) \
> +               TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT)=
 \
> +               BUILD=3D$(PVR_BUILD) WINDOW_SYSTEM=3D$(PVR_WS) \
> +               install
> +endef
> +
> +define TI_ROGUE_UM_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +               DESTDIR=3D$(TARGET_DIR) \
> +               TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT)=
 \
> +               BUILD=3D$(PVR_BUILD) WINDOW_SYSTEM=3D$(PVR_WS) \
> +               install
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000bee52e05fec6fb73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0jeu. 22 juin 2023 =C3=A0=C2=A018:07, Andreas Dannen=
berg via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.org">buildroot=
@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">This package adds the userspace libraries for th=
e Rogue graphics<br>
accelerator of the following Texas Instruments SoCs: AM62, J721E,<br>
J721S2, and J784S4.<br>
<br>
Signed-off-by: Andreas Dannenberg &lt;<a href=3D"mailto:dannenberg@ti.com" =
target=3D"_blank">dannenberg@ti.com</a>&gt;<br>
---<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../0001-all-drop-the-init-script.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 8=
32 ++++++++++++++++++<br>
=C2=A0package/ti-rogue-um/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 52 ++<br>
=C2=A0package/ti-rogue-um/ti-rogue-um.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0package/ti-rogue-um/<a href=3D"http://ti-rogue-um.mk" rel=3D"noreferr=
er" target=3D"_blank">ti-rogue-um.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 38 +<br>
=C2=A05 files changed, 926 insertions(+)<br>
=C2=A0create mode 100644 package/ti-rogue-um/0001-all-drop-the-init-script.=
patch<br>
=C2=A0create mode 100644 package/ti-rogue-um/Config.in<br>
=C2=A0create mode 100644 package/ti-rogue-um/ti-rogue-um.hash<br>
=C2=A0create mode 100644 package/ti-rogue-um/<a href=3D"http://ti-rogue-um.=
mk" rel=3D"noreferrer" target=3D"_blank">ti-rogue-um.mk</a><br>
<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 96ef0d72de..0bff1135aa 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -614,6 +614,7 @@ endmenu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/targetcli-fb/Config.in&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/ti-gfx/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/ti-rogue-km/Config.in&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/ti-rogue-um/Config.in&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/ti-sgx-demos/Config.in&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/ti-sgx-km/Config.in&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/ti-sgx-um/Config.in&quot;<=
br>
diff --git a/package/ti-rogue-um/0001-all-drop-the-init-script.patch b/pack=
age/ti-rogue-um/0001-all-drop-the-init-script.patch<br>
new file mode 100644<br>
index 0000000000..4f3dd1cbb1<br>
--- /dev/null<br>
+++ b/package/ti-rogue-um/0001-all-drop-the-init-script.patch<br>
@@ -0,0 +1,832 @@<br>
+From 99e0da8a1c08818c59680f726e11a84b26daf29f Mon Sep 17 00:00:00 2001<br>
+From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_blank">rs@=
ti.com</a>&gt;<br>
+Date: Thu, 25 May 2023 18:59:26 -0500<br>
+Subject: [PATCH] all: drop the init script<br>
+<br>
+Nobody should be using this anymore. It&#39;s sysVinit and it&#39;s just a=
 fancy<br>
+wrapper around modprobe anyway. We&#39;ll be dropping it from our build<br=
>
+tools soon.<br>
+<br>
+Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_b=
lank">rs@ti.com</a>&gt;<br>
+---<br>
+ .../wayland/release/etc/init.d/rc.pvr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
196 ------------------<br>
+ .../wayland/release/etc/init.d/rc.pvr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
196 ------------------<br>
+ .../wayland/release/etc/init.d/rc.pvr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
196 ------------------<br>
+ .../wayland/release/etc/init.d/rc.pvr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
196 ------------------<br>
+ 4 files changed, 784 deletions(-)<br>
+ delete mode 100755 targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr<=
br>
+ delete mode 100755 targetfs/j721e_linux/wayland/release/etc/init.d/rc.pvr=
<br>
+ delete mode 100755 targetfs/j721s2_linux/wayland/release/etc/init.d/rc.pv=
r<br>
+ delete mode 100755 targetfs/j784s4_linux/wayland/release/etc/init.d/rc.pv=
r<br>
+<br>
+diff --git a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr b/targe=
tfs/am62_linux/wayland/release/etc/init.d/rc.pvr<br>
+deleted file mode 100755<br>
+index 428cd86..0000000<br>
+--- a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr<br>
++++ /dev/null<br>+2.34.1<br>
+<br>
diff --git a/package/ti-rogue-um/Config.in b/package/ti-rogue-um/Config.in<=
br>
new file mode 100644<br>
index 0000000000..15257858c2<br>
--- /dev/null<br>
+++ b/package/ti-rogue-um/Config.in<br>
@@ -0,0 +1,52 @@<br>
+comment &quot;ti-rogue-um needs udev and a glibc toolchain w/ threads&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_aarch64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCH=
AIN_USES_GLIBC \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| !BR2_TOOLCHAIN_H=
AS_THREADS<br>
+<br>
+config BR2_PACKAGE_TI_ROGUE_UM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ti-rogue-um&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_UDEV<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# pre-built binaries<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_USES_GLIBC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_aarch64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBDRM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HAS_LIBEGL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HAS_LIBGBM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HAS_LIBGLES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HAS_POWERVR<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBFFI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_WAYLAND<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HAS_LIBEGL_WAYLAND<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_TI_ROGUE_KM if BR2_LINUX_KER=
NEL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Graphics libraries for TI SoCs with Rogu=
e GPU.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This package supports AM62, J721E, J721S=
2, and J784S4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SoCs only.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://git.ti.com/cgit/graph=
ics/ti-img-rogue-umlibs" rel=3D"noreferrer" target=3D"_blank">https://git.t=
i.com/cgit/graphics/ti-img-rogue-umlibs</a><br>
+<br>
+if BR2_PACKAGE_TI_ROGUE_UM<br>
+<br>
+config BR2_PACKAGE_PROVIDES_LIBEGL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;ti-rogue-um&quot;<br>
+<br>
+config BR2_PACKAGE_PROVIDES_LIBGBM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;ti-rogue-um&quot;<br>
+<br>
+config BR2_PACKAGE_PROVIDES_LIBGLES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;ti-rogue-um&quot;<br>
+<br>
+config BR2_PACKAGE_PROVIDES_POWERVR<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;ti-rogue-um&quot;<br>
+<br>
+config BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;UM driver target product&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;am62_linux&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Select target product to be used for UM =
libraries. This needs to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match one of the SoC-specific folders wi=
thin the root/targetfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0folder of the ti-img-rogue-umlibs Git re=
pository.<br>
+<br>
+endif<br>
diff --git a/package/ti-rogue-um/ti-rogue-um.hash b/package/ti-rogue-um/ti-=
rogue-um.hash<br>
new file mode 100644<br>
index 0000000000..a41bf33145<br>
--- /dev/null<br>
+++ b/package/ti-rogue-um/ti-rogue-um.hash<br>
@@ -0,0 +1,3 @@<br>
+# Locally calculated<br>
+sha256=C2=A0 2e1bd1a5ab0ad2db1b9164d028a94f8f9d20743131f337a817fd1c8f9ddd4=
cbe=C2=A0 ti-rogue-um-5977e82b96028f783d39c7219f016c1faf8dc5f5-br1.tar.gz<b=
r>
+sha256=C2=A0 37507b462edf97b59717d2d144daaac85fbca6080c3602b5128e446e97f9a=
d47=C2=A0 LICENSE<br>
diff --git a/package/ti-rogue-um/<a href=3D"http://ti-rogue-um.mk" rel=3D"n=
oreferrer" target=3D"_blank">ti-rogue-um.mk</a> b/package/ti-rogue-um/<a hr=
ef=3D"http://ti-rogue-um.mk" rel=3D"noreferrer" target=3D"_blank">ti-rogue-=
um.mk</a><br>
new file mode 100644<br>
index 0000000000..fa29638fa7<br>
--- /dev/null<br>
+++ b/package/ti-rogue-um/<a href=3D"http://ti-rogue-um.mk" rel=3D"noreferr=
er" target=3D"_blank">ti-rogue-um.mk</a><br>
@@ -0,0 +1,38 @@<br>
+##########################################################################=
######<br>
+#<br>
+# ti-rogue-um<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+# This corresponds to SDK 08.06.00<br>
+TI_ROGUE_UM_VERSION =3D 5977e82b96028f783d39c7219f016c1faf8dc5f5<br>
+TI_ROGUE_UM_SITE =3D <a href=3D"https://git.ti.com/git/graphics/ti-img-rog=
ue-umlibs.git" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/git/=
graphics/ti-img-rogue-umlibs.git</a><br>
+TI_ROGUE_UM_SITE_METHOD =3D git<br>
+TI_ROGUE_UM_LICENSE =3D TI TSPA License<br>
+TI_ROGUE_UM_LICENSE_FILES =3D LICENSE<br>
+TI_ROGUE_UM_INSTALL_STAGING =3D YES<br>
+TI_ROGUE_UM_PROVIDES =3D libegl libgbm libgles powervr<br>
+<br>
+# ti-rogue-um is a egl/gles provider only if libdrm is installed<br>
+TI_ROGUE_UM_DEPENDENCIES =3D libdrm wayland<br></blockquote><div><br></div=
><div>useless built dependencies (nothing is built, blobs are copied), runt=
ime dependencies in Config.in are enough.<br></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
+<br>
+PVR_BUILD =3D &quot;release&quot;<br>
+PVR_WS =3D &quot;wayland&quot;<br>
+<br></blockquote><div><br></div><div>TI_ROGUE_UM_MAKE_OPTS =3D \<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_P=
RODUCT) \<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILD=3Drelease \<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 WINDOW_SYSTEM=3Dwayland<br><br>define TI_ROGUE_UM_INS=
TALL_STAGING_CMDS<br>=C2=A0=C2=A0=C2=A0=C2=A0 $(TARGET_MAKE_ENV) $(MAKE) -C=
 $(@D) \<br>=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TI_ROGUE_UM_MAKE_OPTS=
) \<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DESTDIR=3D$(S=
TAGING_DIR) \<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ins=
tall<br>endef<br>by this way, all variables are prefixed by TI_ROGUE_UM_.<b=
r><br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+define TI_ROGUE_UM_INSTALL_STAGING_CMDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DESTDIR=3D$(STAGING=
_DIR) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_PRODUCT=3D$(=
BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD=3D$(PVR_BUILD=
) WINDOW_SYSTEM=3D$(PVR_WS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install<br>
+endef<br>
+<br>
+define TI_ROGUE_UM_INSTALL_TARGET_CMDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DESTDIR=3D$(TARGET_=
DIR) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_PRODUCT=3D$(=
BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD=3D$(PVR_BUILD=
) WINDOW_SYSTEM=3D$(PVR_WS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install<br>
+endef<br>
+<br>
+$(eval $(generic-package))<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div></div></div></div>

--000000000000bee52e05fec6fb73--

--===============6444822721412988722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6444822721412988722==--
