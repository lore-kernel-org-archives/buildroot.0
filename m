Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CBDEB64D9
	for <buildroot@archiver.kernel.org>; Sat, 17 Jun 2023 09:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C3C560AA4;
	Sat, 17 Jun 2023 09:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C3C560AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59i0GvQeI22a; Sat, 17 Jun 2023 09:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1745860B69;
	Sat, 17 Jun 2023 09:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1745860B69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18F581BF299
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 09:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1BB860B69
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 09:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1BB860B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ck5w23KPzAJt for <buildroot@lists.busybox.net>;
 Sat, 17 Jun 2023 09:37:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D200A60AA4
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D200A60AA4
 for <buildroot@buildroot.org>; Sat, 17 Jun 2023 09:37:40 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-19f31d6b661so1844525fac.0
 for <buildroot@buildroot.org>; Sat, 17 Jun 2023 02:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686994660; x=1689586660;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wwufp1ozsUJaAtWl0TgeipxMHdkbiftHKSRo+IxISSE=;
 b=fbjQpHUxV3iXzHFciUAWevYVD5MWS31n28ziMBvEV3h7r2v/7k4JzLEPqQW9b67o+j
 LVFBLYwyGaDmZPHNv/M3mMLX/QjVXCPuMabF4L706pxGsWX6dg0GX/Xjl//NUbfeYf0v
 FpxIB82nro9VOsrz937zVmICFKnEYBbX+q52+aUTIEFzLWwKUrBk6ul5LRoWLYDYQuPo
 ZY1L6c5DRfFVEpKG7rT1eiBw2OlXLi6/p7Qj3gHujIuQlLvSr2HqhI+gaJUlf2vIkXRW
 M7P3hGt6tN4SMhjjKb3FrEdGrXOvV9uG+dzi4JZtrnut1EWmOSO2RhWcPrGvRyM8U3T0
 vCpg==
X-Gm-Message-State: AC+VfDzdRhRSNVsNP3E35CVb9VQCWizbXgpp86t2bJWllUpAaBd9FU/C
 889Fiukrb15ruEDZgYFS9GX6et0W5+EfY76YvBRVoSUr8zvUU3uE2rI=
X-Google-Smtp-Source: ACHHUZ7rCkSlbJIPXbszqgSf6/+xRnF69YjOodp80IfmqHuUUnUpCAyI26HcUobBKLzCIdCcDGXjRSt4e03D1JiL4Pg=
X-Received: by 2002:a05:6808:1801:b0:39e:c27d:c626 with SMTP id
 bh1-20020a056808180100b0039ec27dc626mr983514oib.14.1686994659772; Sat, 17 Jun
 2023 02:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-8-dannenberg@ti.com>
 <CAAE6iEWfhb46NsbC+4E9p24Dzcz_edGLxegJtQu4mFMp_yfBdQ@mail.gmail.com>
 <20230616120230.a4z5dfr4kzsz7i6u@dasso>
 <CAAE6iEW6xS1gqy2sbu_QeUU6W7KWvimkwn-j9nUeFjjSX8L+9Q@mail.gmail.com>
 <20230616221311.xlthgoct6lpko5kq@dasso>
In-Reply-To: <20230616221311.xlthgoct6lpko5kq@dasso>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 17 Jun 2023 11:37:28 +0200
Message-ID: <CAAE6iEWpz44wfhZEd7n_tJo=QrCvy_s-DOkMgZiQXJ+nOehU8A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1686994660; x=1689586660;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wwufp1ozsUJaAtWl0TgeipxMHdkbiftHKSRo+IxISSE=;
 b=lr5VrF0rJ+ZzG1txhPUGfj3JbpAoR3Kkz/u2vmtAtPWUlYyjmEvhL3fUweAFsRc10a
 oPnmr7usrh2QrIv83jV7muZMtW3UkAYeuVxI8lyvnhP0H92ExL140Prc4+ldKaTpn58P
 vdS53bFUxD0LpdQt5CasyihEliC4Xe+Cpkhnwqh5UkmSYibX0TYlfnNQCuH274kksuJs
 eFBbB6MnVPGx24z9HqdXOnQZg8nKVIwOqf+lgozAD0/+BszDUv7+4nne7wr/VCcbsPdP
 +T78x9Ch6Yt6RR7BLBBj1ry7WGA9HsM7DYs2mvN5fY+hDcIhEZEADv7h/acQwryN46G/
 y/2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=lr5VrF0r
Subject: Re: [Buildroot] [PATCH v8 07/10] board/ti/am62x_sk|am64x_sk: switch
 to HS-FS device variants
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
Content-Type: multipart/mixed; boundary="===============8114131546342085262=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8114131546342085262==
Content-Type: multipart/alternative; boundary="0000000000006f227f05fe500d93"

--0000000000006f227f05fe500d93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 17 juin 2023 =C3=A0 00:13, Andreas Dannenberg <dannenberg@ti.com> a
=C3=A9crit :

> Hi Fran=C3=A7ois,
>
> On Fri, Jun 16, 2023 at 06:40:35PM +0200, Fran=C3=A7ois Perrad wrote:
> > Le ven. 16 juin 2023 =C3=A0 14:05, Andreas Dannenberg <dannenberg@ti.co=
m> a
> > =C3=A9crit :
> >
> > > Hi Fran=C3=A7ois,
> > >
> > > On Fri, Jun 16, 2023 at 01:15:04PM +0200, Fran=C3=A7ois Perrad wrote:
> > > > Le ven. 16 juin 2023 =C3=A0 02:38, Andreas Dannenberg via buildroot=
 <
> > > > buildroot@buildroot.org> a =C3=A9crit :
> > > >
> > > > > Current starter kits for AM62x (called SK-AM62B, see [1]) and AM6=
4x
> > > > > (called SK-AM64B, see [2]) both contain High Security - Field
> Securable
> > > > > (HS-FS) device variants, and those are really the recommended
> > > production
> > > > > device variants and boards TI will provide moving forward. Hence,
> > > switch
> > > > > the defconfigs for those boards over to accommodate those
> now-shipping
> > > > > device variants and boards.
> > > > >
> > > > > [1] https://www.ti.com/tool/SK-AM62B
> > > > > [2] https://www.ti.com/tool/SK-AM64B
> > > > >
> > > > > Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> > > > > ---
> > > > >  board/ti/am62x_sk/readme.txt | 16 ++++++++++++++++
> > > > >  board/ti/am64x_sk/readme.txt | 16 ++++++++++++++++
> > > > >  configs/am62x_sk_defconfig   |  2 +-
> > > > >  configs/am64x_sk_defconfig   |  4 ++--
> > > > >  4 files changed, 35 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/board/ti/am62x_sk/readme.txt
> > > b/board/ti/am62x_sk/readme.txt
> > > > > index ccbb24896b..9c7c8818af 100644
> > > > > --- a/board/ti/am62x_sk/readme.txt
> > > > > +++ b/board/ti/am62x_sk/readme.txt
> > > > > @@ -12,6 +12,22 @@ $ make am62x_sk_defconfig
> > > > >  Optional: modify the configuration:
> > > > >  $ make menuconfig
> > > > >
> > > > > +Required setup step for High Security HS-FS and HS-SE SoC
> variants:
> > > > > +
> > > > > +To allow the image signing process for various firmware artifact=
s
> to
> > > > > +work the build process for HS-FS and HS-SE device variants is
> using
> > > > > +an external 'core-secdev-k3' package which can be obtained from
> > > > > +https://git.ti.com/cgit/security-development-tools/core-secdev-k=
3
> .
> > > > > +To prepare building for those device variants create a local cop=
y
> of
> > > > > +the 'core-secdev-k3' and export its location through the
> > > > > +TI_SECURE_DEV_PKG environmental variable. Use the package as-is
> for
> > > > > +HS-FS device variants such as populated on the SK-AM64B board, o=
r
> > > > > +customize this package with your private signing keys when using=
 a
> > > > > +HS-SE device variant.
> > > > > +
> > > > > +$ git clone
> > > > >
> https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> > > > > +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3
> > > > >
> > > >
> > > > core-secdev-k3 could be a host package and an optional dependency o=
f
> > > uboot
> > > > or atf
> > >
> > > Good suggestion, I thought about same but wasn't quite sure how to se=
t
> > > this up, but I'll look into this based on your below starting point. =
It
> > > would cover HS-FS device variants ("High Security - Field Securable")=
,
> > > which is 90% of the use case, and 100% of the initial use case
> (somebody
> > > getting a board, evaluating), all when the custom keys were not yet
> > > programmed into the SOC (which is what turns the device into a HS-SE
> > > device, at which time custom signing keys will need to be provided as
> > > part of core-secdev-k3).
> > >
> > > Can a host package easily export/share and ENV variable
> > > (TI_SECURE_DEV_PKG)?
> > >
> > >
> > yes (we are in a Makefile fragment):
> > export
> >
> TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV_K3_VE=
RSION)
> >
> > when a package needed it, just add :
> > FOO_DEPENDENCIES +=3D host-ti-core-secdev-k3
> >
> > Fran=C3=A7ois
>
> Good point, using the make construct for 'export' should work, and in
> fact it does. Just tried it out. Was able to largely carry over what you
> came up with (thanks again!!). One change I had to made was to add a
> 'host-' prefix to the line exporting the ti-core-secdev-k3 package
> location. Below is my Makefile fragment. Will make this part of PATCH
> v9 series I intent to send out next week (want to give it a few more days
> to allow folks to add feedback).
>
>
>
in order to support the creation of a relocatable SDK, it will be better to
install the stuff somewhere in $(HOST_DIR), like that:

export TI_SECURE_DEV_PKG=3D$(HOST_DIR)/opt/core-secdev-k3

define HOST_TI_CORE_SECDEV_K3_INSTALL_CMDS
     mkdir -p $(TI_SECURE_DEV_PKG)/keys
     cp -dpfr $(@D)/keys/* $(TI_SECURE_DEV_PKG)/keys
     mkdir -p $(TI_SECURE_DEV_PKG)/scripts
     cp -dpfr $(@D)/scripts/* $(TI_SECURE_DEV_PKG)/scripts
endef

Fran=C3=A7ois


> --- /dev/null
> +++ b/package/ti-core-secdev-k3/ti-core-secdev-k3.mk
> @@ -0,0 +1,21 @@
>
> +########################################################################=
########
> +#
> +## ti-core-secdev-k3
> +#
>
> +########################################################################=
#########
> +
> +TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007
> +TI_CORE_SECDEV_K3_SITE =3D
> https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snapsho=
t
> +TI_CORE_SECDEV_K3_LICENSE
> <https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snapsh=
ot+TI_CORE_SECDEV_K3_LICENSE>
> =3D TI TSPA License
> +TI_CORE_SECDEV_K3_LICENSE_FILES =3D manifest/k3-secdev-0.2-manifest.html
> +TI_CORE_SECDEV_K3_SOURCE =3D
> core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz
> +
> +# To allow the image signing process for various firmware artifacts to
> work the
> +# build process for TI K3 platform HS-FS and HS-SE device variants is
> using the
> +# 'core-secdev-k3' tool provided by TI. Its location must be made
> available to
> +# the build process by exporting it through the use of an environmental
> +# variable. From there on, other packages like ti-k3-r5-loader will pick
> up the
> +# signing tools and keys that are provided in this package.
> +export TI_SECURE_DEV_PKG =3D
> $(BUILD_DIR)/host-ti-core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION)
> +
> +$(eval $(host-generic-package))
>
>
> --
> Andreas Dannenberg
> Texas Instruments Inc
>
>
>
> >
> > > This will be needed not only by ti-k3-image-gen but also by uboot and
> > > potentially other packages in the future.
> > >
> > > Regards, Andreas
> > >
> > > >
> > > >
> > >
> #########################################################################=
#######
> > > > #
> > > > # ti-core-secdev-k3
> > > > #
> > > >
> > >
> #########################################################################=
#######
> > > >
> > > > TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007
> > > > TI_CORE_SECDEV_K3_SITE =3D
> > > >
> > >
> https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snapsho=
t
> > > > TI_CORE_SECDEV_K3_SOURCE =3D
> > > > core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz
> > > >
> > > >
> > >
> TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV_K3_VE=
RSION)
> > > >
> > > > $(eval $(host-generic-package))
> > > >
> > > > Fran=C3=A7ois
> > > >
> > > >
> > > >
> > > > > +
> > > > >  Build:
> > > > >  $ make
> > > > >
> > > > > diff --git a/board/ti/am64x_sk/readme.txt
> > > b/board/ti/am64x_sk/readme.txt
> > > > > index fe83c675f5..51d0312726 100644
> > > > > --- a/board/ti/am64x_sk/readme.txt
> > > > > +++ b/board/ti/am64x_sk/readme.txt
> > > > > @@ -12,6 +12,22 @@ $ make am64x_sk_defconfig
> > > > >  Optional: modify the configuration:
> > > > >  $ make menuconfig
> > > > >
> > > > > +Required setup step for High Security HS-FS and HS-SE SoC
> variants:
> > > > > +
> > > > > +To allow the image signing process for various firmware artifact=
s
> to
> > > > > +work the build process for HS-FS and HS-SE device variants is
> using
> > > > > +an external 'core-secdev-k3' package which can be obtained from
> > > > > +https://git.ti.com/cgit/security-development-tools/core-secdev-k=
3
> .
> > > > > +To prepare building for those device variants create a local cop=
y
> of
> > > > > +the 'core-secdev-k3' and export its location through the
> > > > > +TI_SECURE_DEV_PKG environmental variable. Use the package as-is
> for
> > > > > +HS-FS device variants such as populated on the SK-AM64B board, o=
r
> > > > > +customize this package with your private signing keys when using=
 a
> > > > > +HS-SE device variant.
> > > > > +
> > > > > +$ git clone
> > > > >
> https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> > > > > +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3
> > > > > +
> > > > >  Build:
> > > > >  $ make
> > > > >
> > > > > diff --git a/configs/am62x_sk_defconfig
> b/configs/am62x_sk_defconfig
> > > > > index 2d05ddd96b..033101b735 100644
> > > > > --- a/configs/am62x_sk_defconfig
> > > > > +++ b/configs/am62x_sk_defconfig
> > > > > @@ -28,7 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=
=3Dy
> > > > >  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
> > > > >  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> > > > >  BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am62x"
> > > > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"gp"
> > > > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"hs-fs"
> > > > >  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
> > > > >  BR2_TARGET_TI_K3_R5_LOADER=3Dy
> > > > >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy
> > > > > diff --git a/configs/am64x_sk_defconfig
> b/configs/am64x_sk_defconfig
> > > > > index a26e38a043..096dd77f6a 100644
> > > > > --- a/configs/am64x_sk_defconfig
> > > > > +++ b/configs/am64x_sk_defconfig
> > > > > @@ -28,8 +28,8 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=
=3Dy
> > > > >  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
> > > > >  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> > > > >  BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=3Dy
> > > > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am64x"
> > > > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"gp"
> > > > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am64x_sr2"
> > > > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"hs-fs"
> > > > >  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
> > > > >  BR2_TARGET_TI_K3_R5_LOADER=3Dy
> > > > >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy
> > > > > --
> > > > > 2.34.1
> > > > >
> > > > > _______________________________________________
> > > > > buildroot mailing list
> > > > > buildroot@buildroot.org
> > > > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > > > >
> > >
>

--0000000000006f227f05fe500d93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 17 juin 2023 =C3=A0=C2=
=A000:13, Andreas Dannenberg &lt;<a href=3D"mailto:dannenberg@ti.com">danne=
nberg@ti.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi Fran=C3=A7ois,<br>
<br>
On Fri, Jun 16, 2023 at 06:40:35PM +0200, Fran=C3=A7ois Perrad wrote:<br>
&gt; Le ven. 16 juin 2023 =C3=A0 14:05, Andreas Dannenberg &lt;<a href=3D"m=
ailto:dannenberg@ti.com" target=3D"_blank">dannenberg@ti.com</a>&gt; a<br>
&gt; =C3=A9crit :<br>
&gt; <br>
&gt; &gt; Hi Fran=C3=A7ois,<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Jun 16, 2023 at 01:15:04PM +0200, Fran=C3=A7ois Perrad wr=
ote:<br>
&gt; &gt; &gt; Le ven. 16 juin 2023 =C3=A0 02:38, Andreas Dannenberg via bu=
ildroot &lt;<br>
&gt; &gt; &gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank"=
>buildroot@buildroot.org</a>&gt; a =C3=A9crit :<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Current starter kits for AM62x (called SK-AM62B, see [1=
]) and AM64x<br>
&gt; &gt; &gt; &gt; (called SK-AM64B, see [2]) both contain High Security -=
 Field Securable<br>
&gt; &gt; &gt; &gt; (HS-FS) device variants, and those are really the recom=
mended<br>
&gt; &gt; production<br>
&gt; &gt; &gt; &gt; device variants and boards TI will provide moving forwa=
rd. Hence,<br>
&gt; &gt; switch<br>
&gt; &gt; &gt; &gt; the defconfigs for those boards over to accommodate tho=
se now-shipping<br>
&gt; &gt; &gt; &gt; device variants and boards.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; [1] <a href=3D"https://www.ti.com/tool/SK-AM62B" rel=3D=
"noreferrer" target=3D"_blank">https://www.ti.com/tool/SK-AM62B</a><br>
&gt; &gt; &gt; &gt; [2] <a href=3D"https://www.ti.com/tool/SK-AM64B" rel=3D=
"noreferrer" target=3D"_blank">https://www.ti.com/tool/SK-AM64B</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Andreas Dannenberg &lt;<a href=3D"mailto=
:dannenberg@ti.com" target=3D"_blank">dannenberg@ti.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 board/ti/am62x_sk/readme.txt | 16 +++++++++++++++=
+<br>
&gt; &gt; &gt; &gt;=C2=A0 board/ti/am64x_sk/readme.txt | 16 +++++++++++++++=
+<br>
&gt; &gt; &gt; &gt;=C2=A0 configs/am62x_sk_defconfig=C2=A0 =C2=A0|=C2=A0 2 =
+-<br>
&gt; &gt; &gt; &gt;=C2=A0 configs/am64x_sk_defconfig=C2=A0 =C2=A0|=C2=A0 4 =
++--<br>
&gt; &gt; &gt; &gt;=C2=A0 4 files changed, 35 insertions(+), 3 deletions(-)=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/board/ti/am62x_sk/readme.txt<br>
&gt; &gt; b/board/ti/am62x_sk/readme.txt<br>
&gt; &gt; &gt; &gt; index ccbb24896b..9c7c8818af 100644<br>
&gt; &gt; &gt; &gt; --- a/board/ti/am62x_sk/readme.txt<br>
&gt; &gt; &gt; &gt; +++ b/board/ti/am62x_sk/readme.txt<br>
&gt; &gt; &gt; &gt; @@ -12,6 +12,22 @@ $ make am62x_sk_defconfig<br>
&gt; &gt; &gt; &gt;=C2=A0 Optional: modify the configuration:<br>
&gt; &gt; &gt; &gt;=C2=A0 $ make menuconfig<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +Required setup step for High Security HS-FS and HS-SE =
SoC variants:<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +To allow the image signing process for various firmwar=
e artifacts to<br>
&gt; &gt; &gt; &gt; +work the build process for HS-FS and HS-SE device vari=
ants is using<br>
&gt; &gt; &gt; &gt; +an external &#39;core-secdev-k3&#39; package which can=
 be obtained from<br>
&gt; &gt; &gt; &gt; +<a href=3D"https://git.ti.com/cgit/security-developmen=
t-tools/core-secdev-k3" rel=3D"noreferrer" target=3D"_blank">https://git.ti=
.com/cgit/security-development-tools/core-secdev-k3</a>.<br>
&gt; &gt; &gt; &gt; +To prepare building for those device variants create a=
 local copy of<br>
&gt; &gt; &gt; &gt; +the &#39;core-secdev-k3&#39; and export its location t=
hrough the<br>
&gt; &gt; &gt; &gt; +TI_SECURE_DEV_PKG environmental variable. Use the pack=
age as-is for<br>
&gt; &gt; &gt; &gt; +HS-FS device variants such as populated on the SK-AM64=
B board, or<br>
&gt; &gt; &gt; &gt; +customize this package with your private signing keys =
when using a<br>
&gt; &gt; &gt; &gt; +HS-SE device variant.<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +$ git clone<br>
&gt; &gt; &gt; &gt; <a href=3D"https://git.ti.com/git/security-development-=
tools/core-secdev-k3.git" rel=3D"noreferrer" target=3D"_blank">https://git.=
ti.com/git/security-development-tools/core-secdev-k3.git</a><br>
&gt; &gt; &gt; &gt; +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; core-secdev-k3 could be a host package and an optional depen=
dency of<br>
&gt; &gt; uboot<br>
&gt; &gt; &gt; or atf<br>
&gt; &gt;<br>
&gt; &gt; Good suggestion, I thought about same but wasn&#39;t quite sure h=
ow to set<br>
&gt; &gt; this up, but I&#39;ll look into this based on your below starting=
 point. It<br>
&gt; &gt; would cover HS-FS device variants (&quot;High Security - Field Se=
curable&quot;),<br>
&gt; &gt; which is 90% of the use case, and 100% of the initial use case (s=
omebody<br>
&gt; &gt; getting a board, evaluating), all when the custom keys were not y=
et<br>
&gt; &gt; programmed into the SOC (which is what turns the device into a HS=
-SE<br>
&gt; &gt; device, at which time custom signing keys will need to be provide=
d as<br>
&gt; &gt; part of core-secdev-k3).<br>
&gt; &gt;<br>
&gt; &gt; Can a host package easily export/share and ENV variable<br>
&gt; &gt; (TI_SECURE_DEV_PKG)?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; yes (we are in a Makefile fragment):<br>
&gt; export<br>
&gt; TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV_K3=
_VERSION)<br>
&gt; <br>
&gt; when a package needed it, just add :<br>
&gt; FOO_DEPENDENCIES +=3D host-ti-core-secdev-k3<br>
&gt; <br>
&gt; Fran=C3=A7ois<br>
<br>
Good point, using the make construct for &#39;export&#39; should work, and =
in<br>
fact it does. Just tried it out. Was able to largely carry over what you<br=
>
came up with (thanks again!!). One change I had to made was to add a<br>
&#39;host-&#39; prefix to the line exporting the ti-core-secdev-k3 package<=
br>
location. Below is my Makefile fragment. Will make this part of PATCH<br>
v9 series I intent to send out next week (want to give it a few more days<b=
r>
to allow folks to add feedback).<br>
<br>
<br></blockquote><div><br></div><div>in order to support the creation of a =
relocatable SDK, it will be better to install the stuff somewhere in $(HOST=
_DIR), like that:</div><div><br></div><div>export TI_SECURE_DEV_PKG=3D$(HOS=
T_DIR)/opt/core-secdev-k3</div><div><br></div><div>define HOST_TI_CORE_SECD=
EV_K3_INSTALL_CMDS<br>=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p $(TI_SECURE_DEV_PKG=
)/keys<br>=C2=A0=C2=A0=C2=A0=C2=A0 cp -dpfr $(@D)/keys/* $(TI_SECURE_DEV_PK=
G)/keys<br>=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p $(TI_SECURE_DEV_PKG)/scripts<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0 cp -dpfr $(@D)/scripts/* $(TI_SECURE_DEV_PKG)/sc=
ripts<br>endef<br></div><div><br></div><div>Fran=C3=A7ois<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
--- /dev/null<br>
+++ b/package/ti-core-secdev-k3/<a href=3D"http://ti-core-secdev-k3.mk" rel=
=3D"noreferrer" target=3D"_blank">ti-core-secdev-k3.mk</a><br>
@@ -0,0 +1,21 @@<br>
+##########################################################################=
######<br>
+#<br>
+## ti-core-secdev-k3<br>
+#<br>
+##########################################################################=
#######<br>
+<br>
+TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007<br>
+TI_CORE_SECDEV_K3_SITE =3D <a href=3D"https://git.ti.com/cgit/security-dev=
elopment-tools/core-secdev-k3/snapshot+TI_CORE_SECDEV_K3_LICENSE" rel=3D"no=
referrer" target=3D"_blank">https://git.ti.com/cgit/security-development-to=
ols/core-secdev-k3/snapshot<br>
+TI_CORE_SECDEV_K3_LICENSE</a> =3D TI TSPA License<br>
+TI_CORE_SECDEV_K3_LICENSE_FILES =3D manifest/k3-secdev-0.2-manifest.html<b=
r>
+TI_CORE_SECDEV_K3_SOURCE =3D core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).t=
ar.gz<br>
+<br>
+# To allow the image signing process for various firmware artifacts to wor=
k the<br>
+# build process for TI K3 platform HS-FS and HS-SE device variants is usin=
g the<br>
+# &#39;core-secdev-k3&#39; tool provided by TI. Its location must be made =
available to<br>
+# the build process by exporting it through the use of an environmental<br=
>
+# variable. From there on, other packages like ti-k3-r5-loader will pick u=
p the<br>
+# signing tools and keys that are provided in this package.<br>
+export TI_SECURE_DEV_PKG =3D $(BUILD_DIR)/host-ti-core-secdev-k3-$(TI_CORE=
_SECDEV_K3_VERSION)<br>
+<br>
+$(eval $(host-generic-package))<br>
<br>
<br>
--<br>
Andreas Dannenberg<br>
Texas Instruments Inc<br>
<br>
<br>
<br>
&gt; <br>
&gt; &gt; This will be needed not only by ti-k3-image-gen but also by uboot=
 and<br>
&gt; &gt; potentially other packages in the future.<br>
&gt; &gt;<br>
&gt; &gt; Regards, Andreas<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; #################################################################=
###############<br>
&gt; &gt; &gt; #<br>
&gt; &gt; &gt; # ti-core-secdev-k3<br>
&gt; &gt; &gt; #<br>
&gt; &gt; &gt;<br>
&gt; &gt; #################################################################=
###############<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007<br>
&gt; &gt; &gt; TI_CORE_SECDEV_K3_SITE =3D<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://git.ti.com/cgit/security-development-tools/cor=
e-secdev-k3/snapshot" rel=3D"noreferrer" target=3D"_blank">https://git.ti.c=
om/cgit/security-development-tools/core-secdev-k3/snapshot</a><br>
&gt; &gt; &gt; TI_CORE_SECDEV_K3_SOURCE =3D<br>
&gt; &gt; &gt; core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECD=
EV_K3_VERSION)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; $(eval $(host-generic-package))<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Fran=C3=A7ois<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 Build:<br>
&gt; &gt; &gt; &gt;=C2=A0 $ make<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/board/ti/am64x_sk/readme.txt<br>
&gt; &gt; b/board/ti/am64x_sk/readme.txt<br>
&gt; &gt; &gt; &gt; index fe83c675f5..51d0312726 100644<br>
&gt; &gt; &gt; &gt; --- a/board/ti/am64x_sk/readme.txt<br>
&gt; &gt; &gt; &gt; +++ b/board/ti/am64x_sk/readme.txt<br>
&gt; &gt; &gt; &gt; @@ -12,6 +12,22 @@ $ make am64x_sk_defconfig<br>
&gt; &gt; &gt; &gt;=C2=A0 Optional: modify the configuration:<br>
&gt; &gt; &gt; &gt;=C2=A0 $ make menuconfig<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +Required setup step for High Security HS-FS and HS-SE =
SoC variants:<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +To allow the image signing process for various firmwar=
e artifacts to<br>
&gt; &gt; &gt; &gt; +work the build process for HS-FS and HS-SE device vari=
ants is using<br>
&gt; &gt; &gt; &gt; +an external &#39;core-secdev-k3&#39; package which can=
 be obtained from<br>
&gt; &gt; &gt; &gt; +<a href=3D"https://git.ti.com/cgit/security-developmen=
t-tools/core-secdev-k3" rel=3D"noreferrer" target=3D"_blank">https://git.ti=
.com/cgit/security-development-tools/core-secdev-k3</a>.<br>
&gt; &gt; &gt; &gt; +To prepare building for those device variants create a=
 local copy of<br>
&gt; &gt; &gt; &gt; +the &#39;core-secdev-k3&#39; and export its location t=
hrough the<br>
&gt; &gt; &gt; &gt; +TI_SECURE_DEV_PKG environmental variable. Use the pack=
age as-is for<br>
&gt; &gt; &gt; &gt; +HS-FS device variants such as populated on the SK-AM64=
B board, or<br>
&gt; &gt; &gt; &gt; +customize this package with your private signing keys =
when using a<br>
&gt; &gt; &gt; &gt; +HS-SE device variant.<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +$ git clone<br>
&gt; &gt; &gt; &gt; <a href=3D"https://git.ti.com/git/security-development-=
tools/core-secdev-k3.git" rel=3D"noreferrer" target=3D"_blank">https://git.=
ti.com/git/security-development-tools/core-secdev-k3.git</a><br>
&gt; &gt; &gt; &gt; +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 Build:<br>
&gt; &gt; &gt; &gt;=C2=A0 $ make<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/configs/am62x_sk_defconfig b/configs/am62x=
_sk_defconfig<br>
&gt; &gt; &gt; &gt; index 2d05ddd96b..033101b735 100644<br>
&gt; &gt; &gt; &gt; --- a/configs/am62x_sk_defconfig<br>
&gt; &gt; &gt; &gt; +++ b/configs/am62x_sk_defconfig<br>
&gt; &gt; &gt; &gt; @@ -28,7 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYP=
TOGRAPHY=3Dy<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_OPTEE_OS_PLATFORM=3D&quot;k3&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN=3Dy<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D&quot;am62x&quot=
;<br>
&gt; &gt; &gt; &gt; -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;gp&quot;<b=
r>
&gt; &gt; &gt; &gt; +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;hs-fs&quot=
;<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D&quot;evm&quo=
t;<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_TI_K3_R5_LOADER=3Dy<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy<br>
&gt; &gt; &gt; &gt; diff --git a/configs/am64x_sk_defconfig b/configs/am64x=
_sk_defconfig<br>
&gt; &gt; &gt; &gt; index a26e38a043..096dd77f6a 100644<br>
&gt; &gt; &gt; &gt; --- a/configs/am64x_sk_defconfig<br>
&gt; &gt; &gt; &gt; +++ b/configs/am64x_sk_defconfig<br>
&gt; &gt; &gt; &gt; @@ -28,8 +28,8 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYP=
TOGRAPHY=3Dy<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_OPTEE_OS_PLATFORM=3D&quot;k3&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN=3Dy<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=3Dy<br>
&gt; &gt; &gt; &gt; -BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D&quot;am64x&quot;<br>
&gt; &gt; &gt; &gt; -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;gp&quot;<b=
r>
&gt; &gt; &gt; &gt; +BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D&quot;am64x_sr2&quot;=
<br>
&gt; &gt; &gt; &gt; +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;hs-fs&quot=
;<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D&quot;evm&quo=
t;<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_TI_K3_R5_LOADER=3Dy<br>
&gt; &gt; &gt; &gt;=C2=A0 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; 2.34.1<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; &gt; buildroot mailing list<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_b=
lank">buildroot@buildroot.org</a><br>
&gt; &gt; &gt; &gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo=
/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.or=
g/mailman/listinfo/buildroot</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div></div>

--0000000000006f227f05fe500d93--

--===============8114131546342085262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8114131546342085262==--
