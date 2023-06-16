Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654D2EB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 16:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5907400C6;
	Fri, 16 Jun 2023 16:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5907400C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wauCbdlw3uvb; Fri, 16 Jun 2023 16:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A18244034B;
	Fri, 16 Jun 2023 16:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A18244034B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9053E1BF2EA
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 16:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77020614A1
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 16:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77020614A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTT1gC-2ytNC for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 16:40:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E016D60FD5
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E016D60FD5
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 16:40:46 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-666e916b880so254919b3a.2
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 09:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686933646; x=1689525646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MtK/d6U+9MQqRw5uie88vXSYmAJMTXMqTt0NXpLJn8M=;
 b=gQ07jhox4MJDm+gxZt8QVMguioYzi5wydIwObKsKxyKfpzYaI+vqlbMhQ7cPVKeKsf
 HOsOs2Tan/GO0hb5bQsyJ91idU34SG+0bObtHnsPGK0FpI3UJ4ljvC8GN02VJz2gQuBm
 jfbRKxJkHu4snIMzp+l1FzvLii5fo8e4xDS1vA32tz390MKsdnVYWrb/CM9QLi/Y3S1a
 SO00J7i0vvWsbxPviwL5kiB3YtchMPvKYycAa/NmRijJSpUUycaOY6+HeCFr2Ydmx6rf
 iKsR+wcaeSyTUjCxw47lQU2GQsuOryRYoL2UVcEMYRIMuoQ0TCr+AEV2TYd9ywWXVu2T
 8CBA==
X-Gm-Message-State: AC+VfDy4U6P5Y/cblM3YALcKcB120wxHXvjXBdYr5QJ0Kq2Zz/VJeq8v
 QOKqh0MpOwJboC6zeDETrYDhEutdtKx7ZfOKrt1PL3phLDsI63mR2XA=
X-Google-Smtp-Source: ACHHUZ7rfE0pn2/wOWrZhoR0Hpo5dzlSCw2VjHwzRfX1gO4qh1y4890+mRE/xtRKUOgMBSPP7kd2xbhfcZZTu/iu8VM=
X-Received: by 2002:a17:90b:1083:b0:25e:86a7:1dd with SMTP id
 gj3-20020a17090b108300b0025e86a701ddmr2068045pjb.21.1686933646283; Fri, 16
 Jun 2023 09:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-8-dannenberg@ti.com>
 <CAAE6iEWfhb46NsbC+4E9p24Dzcz_edGLxegJtQu4mFMp_yfBdQ@mail.gmail.com>
 <20230616120230.a4z5dfr4kzsz7i6u@dasso>
In-Reply-To: <20230616120230.a4z5dfr4kzsz7i6u@dasso>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 16 Jun 2023 18:40:35 +0200
Message-ID: <CAAE6iEW6xS1gqy2sbu_QeUU6W7KWvimkwn-j9nUeFjjSX8L+9Q@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1686933646; x=1689525646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MtK/d6U+9MQqRw5uie88vXSYmAJMTXMqTt0NXpLJn8M=;
 b=o1fbrGfgssmCP6WF+zyKS/EQoLWVbmQJifCVtcPdF5TLezCATKFskqmCgqRkSjf8xF
 SJrcet0/rlJ0xGslywsC+skVX8RkZRVS8VsHMbYyVPtBbRjZP6acPSV+9DHb33ZSVk+4
 UozxKHFYGHXDnGO4o8y1y3hQClrp5g4hWuYBuOPc99Gzr5uKBH4eYwi+Kyw3xsUrA+QE
 oZr8YYWbv+d8OMvWX6L0w42IMoKr7V4Moh7OX0bhPolUDqfNbJR8yMsbPYh9908H1+px
 ZaoRWRcU9C2ECrMkM0/SdvVDi2AXtTso4f2otqMl4CxGkN60KN+Nyzz+A3SScdGA9GtW
 /8CQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=o1fbrGfg
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
Content-Type: multipart/mixed; boundary="===============5269326266681361246=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5269326266681361246==
Content-Type: multipart/alternative; boundary="000000000000bf2b1505fe41d895"

--000000000000bf2b1505fe41d895
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 16 juin 2023 =C3=A0 14:05, Andreas Dannenberg <dannenberg@ti.com> a
=C3=A9crit :

> Hi Fran=C3=A7ois,
>
> On Fri, Jun 16, 2023 at 01:15:04PM +0200, Fran=C3=A7ois Perrad wrote:
> > Le ven. 16 juin 2023 =C3=A0 02:38, Andreas Dannenberg via buildroot <
> > buildroot@buildroot.org> a =C3=A9crit :
> >
> > > Current starter kits for AM62x (called SK-AM62B, see [1]) and AM64x
> > > (called SK-AM64B, see [2]) both contain High Security - Field Securab=
le
> > > (HS-FS) device variants, and those are really the recommended
> production
> > > device variants and boards TI will provide moving forward. Hence,
> switch
> > > the defconfigs for those boards over to accommodate those now-shippin=
g
> > > device variants and boards.
> > >
> > > [1] https://www.ti.com/tool/SK-AM62B
> > > [2] https://www.ti.com/tool/SK-AM64B
> > >
> > > Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> > > ---
> > >  board/ti/am62x_sk/readme.txt | 16 ++++++++++++++++
> > >  board/ti/am64x_sk/readme.txt | 16 ++++++++++++++++
> > >  configs/am62x_sk_defconfig   |  2 +-
> > >  configs/am64x_sk_defconfig   |  4 ++--
> > >  4 files changed, 35 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/board/ti/am62x_sk/readme.txt
> b/board/ti/am62x_sk/readme.txt
> > > index ccbb24896b..9c7c8818af 100644
> > > --- a/board/ti/am62x_sk/readme.txt
> > > +++ b/board/ti/am62x_sk/readme.txt
> > > @@ -12,6 +12,22 @@ $ make am62x_sk_defconfig
> > >  Optional: modify the configuration:
> > >  $ make menuconfig
> > >
> > > +Required setup step for High Security HS-FS and HS-SE SoC variants:
> > > +
> > > +To allow the image signing process for various firmware artifacts to
> > > +work the build process for HS-FS and HS-SE device variants is using
> > > +an external 'core-secdev-k3' package which can be obtained from
> > > +https://git.ti.com/cgit/security-development-tools/core-secdev-k3.
> > > +To prepare building for those device variants create a local copy of
> > > +the 'core-secdev-k3' and export its location through the
> > > +TI_SECURE_DEV_PKG environmental variable. Use the package as-is for
> > > +HS-FS device variants such as populated on the SK-AM64B board, or
> > > +customize this package with your private signing keys when using a
> > > +HS-SE device variant.
> > > +
> > > +$ git clone
> > > https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> > > +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3
> > >
> >
> > core-secdev-k3 could be a host package and an optional dependency of
> uboot
> > or atf
>
> Good suggestion, I thought about same but wasn't quite sure how to set
> this up, but I'll look into this based on your below starting point. It
> would cover HS-FS device variants ("High Security - Field Securable"),
> which is 90% of the use case, and 100% of the initial use case (somebody
> getting a board, evaluating), all when the custom keys were not yet
> programmed into the SOC (which is what turns the device into a HS-SE
> device, at which time custom signing keys will need to be provided as
> part of core-secdev-k3).
>
> Can a host package easily export/share and ENV variable
> (TI_SECURE_DEV_PKG)?
>
>
yes (we are in a Makefile fragment):
export
TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV_K3_VERS=
ION)

when a package needed it, just add :
FOO_DEPENDENCIES +=3D host-ti-core-secdev-k3

Fran=C3=A7ois


> This will be needed not only by ti-k3-image-gen but also by uboot and
> potentially other packages in the future.
>
> Regards, Andreas
>
> >
> >
> #########################################################################=
#######
> > #
> > # ti-core-secdev-k3
> > #
> >
> #########################################################################=
#######
> >
> > TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007
> > TI_CORE_SECDEV_K3_SITE =3D
> >
> https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snapsho=
t
> > TI_CORE_SECDEV_K3_SOURCE =3D
> > core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz
> >
> >
> TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV_K3_VE=
RSION)
> >
> > $(eval $(host-generic-package))
> >
> > Fran=C3=A7ois
> >
> >
> >
> > > +
> > >  Build:
> > >  $ make
> > >
> > > diff --git a/board/ti/am64x_sk/readme.txt
> b/board/ti/am64x_sk/readme.txt
> > > index fe83c675f5..51d0312726 100644
> > > --- a/board/ti/am64x_sk/readme.txt
> > > +++ b/board/ti/am64x_sk/readme.txt
> > > @@ -12,6 +12,22 @@ $ make am64x_sk_defconfig
> > >  Optional: modify the configuration:
> > >  $ make menuconfig
> > >
> > > +Required setup step for High Security HS-FS and HS-SE SoC variants:
> > > +
> > > +To allow the image signing process for various firmware artifacts to
> > > +work the build process for HS-FS and HS-SE device variants is using
> > > +an external 'core-secdev-k3' package which can be obtained from
> > > +https://git.ti.com/cgit/security-development-tools/core-secdev-k3.
> > > +To prepare building for those device variants create a local copy of
> > > +the 'core-secdev-k3' and export its location through the
> > > +TI_SECURE_DEV_PKG environmental variable. Use the package as-is for
> > > +HS-FS device variants such as populated on the SK-AM64B board, or
> > > +customize this package with your private signing keys when using a
> > > +HS-SE device variant.
> > > +
> > > +$ git clone
> > > https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> > > +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3
> > > +
> > >  Build:
> > >  $ make
> > >
> > > diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig
> > > index 2d05ddd96b..033101b735 100644
> > > --- a/configs/am62x_sk_defconfig
> > > +++ b/configs/am62x_sk_defconfig
> > > @@ -28,7 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=3Dy
> > >  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
> > >  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> > >  BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am62x"
> > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"gp"
> > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"hs-fs"
> > >  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
> > >  BR2_TARGET_TI_K3_R5_LOADER=3Dy
> > >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy
> > > diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
> > > index a26e38a043..096dd77f6a 100644
> > > --- a/configs/am64x_sk_defconfig
> > > +++ b/configs/am64x_sk_defconfig
> > > @@ -28,8 +28,8 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=3Dy
> > >  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
> > >  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> > >  BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=3Dy
> > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am64x"
> > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"gp"
> > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am64x_sr2"
> > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"hs-fs"
> > >  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
> > >  BR2_TARGET_TI_K3_R5_LOADER=3Dy
> > >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy
> > > --
> > > 2.34.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > >
>

--000000000000bf2b1505fe41d895
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 16 juin 2023 =C3=A0=C2=
=A014:05, Andreas Dannenberg &lt;<a href=3D"mailto:dannenberg@ti.com">danne=
nberg@ti.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi Fran=C3=A7ois,<br>
<br>
On Fri, Jun 16, 2023 at 01:15:04PM +0200, Fran=C3=A7ois Perrad wrote:<br>
&gt; Le ven. 16 juin 2023 =C3=A0 02:38, Andreas Dannenberg via buildroot &l=
t;<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a>&gt; a =C3=A9crit :<br>
&gt; <br>
&gt; &gt; Current starter kits for AM62x (called SK-AM62B, see [1]) and AM6=
4x<br>
&gt; &gt; (called SK-AM64B, see [2]) both contain High Security - Field Sec=
urable<br>
&gt; &gt; (HS-FS) device variants, and those are really the recommended pro=
duction<br>
&gt; &gt; device variants and boards TI will provide moving forward. Hence,=
 switch<br>
&gt; &gt; the defconfigs for those boards over to accommodate those now-shi=
pping<br>
&gt; &gt; device variants and boards.<br>
&gt; &gt;<br>
&gt; &gt; [1] <a href=3D"https://www.ti.com/tool/SK-AM62B" rel=3D"noreferre=
r" target=3D"_blank">https://www.ti.com/tool/SK-AM62B</a><br>
&gt; &gt; [2] <a href=3D"https://www.ti.com/tool/SK-AM64B" rel=3D"noreferre=
r" target=3D"_blank">https://www.ti.com/tool/SK-AM64B</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Andreas Dannenberg &lt;<a href=3D"mailto:dannenber=
g@ti.com" target=3D"_blank">dannenberg@ti.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 board/ti/am62x_sk/readme.txt | 16 ++++++++++++++++<br>
&gt; &gt;=C2=A0 board/ti/am64x_sk/readme.txt | 16 ++++++++++++++++<br>
&gt; &gt;=C2=A0 configs/am62x_sk_defconfig=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 configs/am64x_sk_defconfig=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt;=C2=A0 4 files changed, 35 insertions(+), 3 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/board/ti/am62x_sk/readme.txt b/board/ti/am62x_sk/rea=
dme.txt<br>
&gt; &gt; index ccbb24896b..9c7c8818af 100644<br>
&gt; &gt; --- a/board/ti/am62x_sk/readme.txt<br>
&gt; &gt; +++ b/board/ti/am62x_sk/readme.txt<br>
&gt; &gt; @@ -12,6 +12,22 @@ $ make am62x_sk_defconfig<br>
&gt; &gt;=C2=A0 Optional: modify the configuration:<br>
&gt; &gt;=C2=A0 $ make menuconfig<br>
&gt; &gt;<br>
&gt; &gt; +Required setup step for High Security HS-FS and HS-SE SoC varian=
ts:<br>
&gt; &gt; +<br>
&gt; &gt; +To allow the image signing process for various firmware artifact=
s to<br>
&gt; &gt; +work the build process for HS-FS and HS-SE device variants is us=
ing<br>
&gt; &gt; +an external &#39;core-secdev-k3&#39; package which can be obtain=
ed from<br>
&gt; &gt; +<a href=3D"https://git.ti.com/cgit/security-development-tools/co=
re-secdev-k3" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/cgit/=
security-development-tools/core-secdev-k3</a>.<br>
&gt; &gt; +To prepare building for those device variants create a local cop=
y of<br>
&gt; &gt; +the &#39;core-secdev-k3&#39; and export its location through the=
<br>
&gt; &gt; +TI_SECURE_DEV_PKG environmental variable. Use the package as-is =
for<br>
&gt; &gt; +HS-FS device variants such as populated on the SK-AM64B board, o=
r<br>
&gt; &gt; +customize this package with your private signing keys when using=
 a<br>
&gt; &gt; +HS-SE device variant.<br>
&gt; &gt; +<br>
&gt; &gt; +$ git clone<br>
&gt; &gt; <a href=3D"https://git.ti.com/git/security-development-tools/core=
-secdev-k3.git" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/git=
/security-development-tools/core-secdev-k3.git</a><br>
&gt; &gt; +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3<br>
&gt; &gt;<br>
&gt; <br>
&gt; core-secdev-k3 could be a host package and an optional dependency of u=
boot<br>
&gt; or atf<br>
<br>
Good suggestion, I thought about same but wasn&#39;t quite sure how to set<=
br>
this up, but I&#39;ll look into this based on your below starting point. It=
<br>
would cover HS-FS device variants (&quot;High Security - Field Securable&qu=
ot;),<br>
which is 90% of the use case, and 100% of the initial use case (somebody<br=
>
getting a board, evaluating), all when the custom keys were not yet<br>
programmed into the SOC (which is what turns the device into a HS-SE<br>
device, at which time custom signing keys will need to be provided as<br>
part of core-secdev-k3).<br>
<br>
Can a host package easily export/share and ENV variable<br>
(TI_SECURE_DEV_PKG)?<br>
<br></blockquote><div><br></div><div>yes (we are in a Makefile fragment):</=
div><div> export TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CO=
RE_SECDEV_K3_VERSION)</div><div><br></div><div>when a package needed it, ju=
st add :</div><div>FOO_DEPENDENCIES +=3D host-ti-core-secdev-k3</div><div><=
br></div><div>Fran=C3=A7ois</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
This will be needed not only by ti-k3-image-gen but also by uboot and<br>
potentially other packages in the future.<br>
<br>
Regards, Andreas<br>
<br>
&gt; <br>
&gt; ######################################################################=
##########<br>
&gt; #<br>
&gt; # ti-core-secdev-k3<br>
&gt; #<br>
&gt; ######################################################################=
##########<br>
&gt; <br>
&gt; TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007<br>
&gt; TI_CORE_SECDEV_K3_SITE =3D<br>
&gt; <a href=3D"https://git.ti.com/cgit/security-development-tools/core-sec=
dev-k3/snapshot" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/cg=
it/security-development-tools/core-secdev-k3/snapshot</a><br>
&gt; TI_CORE_SECDEV_K3_SOURCE =3D<br>
&gt; core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz<br>
&gt; <br>
&gt; TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV_K3=
_VERSION)<br>
&gt; <br>
&gt; $(eval $(host-generic-package))<br>
&gt; <br>
&gt; Fran=C3=A7ois<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 Build:<br>
&gt; &gt;=C2=A0 $ make<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/board/ti/am64x_sk/readme.txt b/board/ti/am64x_sk/rea=
dme.txt<br>
&gt; &gt; index fe83c675f5..51d0312726 100644<br>
&gt; &gt; --- a/board/ti/am64x_sk/readme.txt<br>
&gt; &gt; +++ b/board/ti/am64x_sk/readme.txt<br>
&gt; &gt; @@ -12,6 +12,22 @@ $ make am64x_sk_defconfig<br>
&gt; &gt;=C2=A0 Optional: modify the configuration:<br>
&gt; &gt;=C2=A0 $ make menuconfig<br>
&gt; &gt;<br>
&gt; &gt; +Required setup step for High Security HS-FS and HS-SE SoC varian=
ts:<br>
&gt; &gt; +<br>
&gt; &gt; +To allow the image signing process for various firmware artifact=
s to<br>
&gt; &gt; +work the build process for HS-FS and HS-SE device variants is us=
ing<br>
&gt; &gt; +an external &#39;core-secdev-k3&#39; package which can be obtain=
ed from<br>
&gt; &gt; +<a href=3D"https://git.ti.com/cgit/security-development-tools/co=
re-secdev-k3" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/cgit/=
security-development-tools/core-secdev-k3</a>.<br>
&gt; &gt; +To prepare building for those device variants create a local cop=
y of<br>
&gt; &gt; +the &#39;core-secdev-k3&#39; and export its location through the=
<br>
&gt; &gt; +TI_SECURE_DEV_PKG environmental variable. Use the package as-is =
for<br>
&gt; &gt; +HS-FS device variants such as populated on the SK-AM64B board, o=
r<br>
&gt; &gt; +customize this package with your private signing keys when using=
 a<br>
&gt; &gt; +HS-SE device variant.<br>
&gt; &gt; +<br>
&gt; &gt; +$ git clone<br>
&gt; &gt; <a href=3D"https://git.ti.com/git/security-development-tools/core=
-secdev-k3.git" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/git=
/security-development-tools/core-secdev-k3.git</a><br>
&gt; &gt; +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 Build:<br>
&gt; &gt;=C2=A0 $ make<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defcon=
fig<br>
&gt; &gt; index 2d05ddd96b..033101b735 100644<br>
&gt; &gt; --- a/configs/am62x_sk_defconfig<br>
&gt; &gt; +++ b/configs/am62x_sk_defconfig<br>
&gt; &gt; @@ -28,7 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=
=3Dy<br>
&gt; &gt;=C2=A0 BR2_TARGET_OPTEE_OS_PLATFORM=3D&quot;k3&quot;<br>
&gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN=3Dy<br>
&gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D&quot;am62x&quot;<br>
&gt; &gt; -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;gp&quot;<br>
&gt; &gt; +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;hs-fs&quot;<br>
&gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D&quot;evm&quot;<br>
&gt; &gt;=C2=A0 BR2_TARGET_TI_K3_R5_LOADER=3Dy<br>
&gt; &gt;=C2=A0 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy<br>
&gt; &gt; diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defcon=
fig<br>
&gt; &gt; index a26e38a043..096dd77f6a 100644<br>
&gt; &gt; --- a/configs/am64x_sk_defconfig<br>
&gt; &gt; +++ b/configs/am64x_sk_defconfig<br>
&gt; &gt; @@ -28,8 +28,8 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=
=3Dy<br>
&gt; &gt;=C2=A0 BR2_TARGET_OPTEE_OS_PLATFORM=3D&quot;k3&quot;<br>
&gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN=3Dy<br>
&gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=3Dy<br>
&gt; &gt; -BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D&quot;am64x&quot;<br>
&gt; &gt; -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;gp&quot;<br>
&gt; &gt; +BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D&quot;am64x_sr2&quot;<br>
&gt; &gt; +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;hs-fs&quot;<br>
&gt; &gt;=C2=A0 BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D&quot;evm&quot;<br>
&gt; &gt;=C2=A0 BR2_TARGET_TI_K3_R5_LOADER=3Dy<br>
&gt; &gt;=C2=A0 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy<br>
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

--000000000000bf2b1505fe41d895--

--===============5269326266681361246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5269326266681361246==--
