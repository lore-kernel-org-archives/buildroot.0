Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2729FC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 19:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7581560FDA;
	Wed, 24 Aug 2022 19:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7581560FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id njmn0OdqIFni; Wed, 24 Aug 2022 19:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D7360BFA;
	Wed, 24 Aug 2022 19:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D7360BFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5804F1BF307
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3119341626
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3119341626
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3gP3aTOjH6R for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 19:08:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF78541620
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF78541620
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 19:08:49 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id w197so20502955oie.5
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 12:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=aumm1GjtqGFMUxFSKaB7wJa+FZJW0xV1gRcQEpIu1wo=;
 b=RY5xMz5zSQ7lmx/616axJPzjCzMC44P7U0AEosGEyCVj+X0Clm+tIdYZ/vT7QstCph
 wJ1RqfWZYmf4P00UNZtNXDx8yaZDLvMn77/6jo8xXTsoCBmM265M/3sd7b0NWd5muO+L
 7LI20+jGXii7yr1H8IfFnQAOyExw4XslTg9Px07pHjxDT2Htnip9wpj+4z5hZ3JNkF3m
 +f9Fc9t8WGLeeyirXEQ91iYdYLVvrZkvqMDA/bnhnQ2fqR5gq9CvBPzx9lxaEG1Gt+Sz
 mQw0SY14su4XyB8Hn6zA04r2PhzrEtkTaXCvpDsnDlfqW878NHHI3VISewX/CsXg1w7k
 A7dw==
X-Gm-Message-State: ACgBeo38fzn9Ykqy+t+8UK/Oa14GofBVSLE+WMbh7T0BFmeTNVuespp9
 AGCsbNNmJgJLFpZNp9iWSIDmsdl2/AvdcYPLVDsjzw==
X-Google-Smtp-Source: AA6agR70zC6JRu2InuYm9zKsJoWXbE6NZLZuntj3kfa7unrb6+8MziuYp/lrKHqA1A0vvFmxqUwGTr+CuwO+q3fttsI=
X-Received: by 2002:aca:eb8a:0:b0:342:fe2e:7509 with SMTP id
 j132-20020acaeb8a000000b00342fe2e7509mr274028oih.118.1661368128725; Wed, 24
 Aug 2022 12:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
 <20220824024904.2529728-7-chris.dimich@boundarydevices.com>
 <59c122bb-dff1-79d1-fb06-c5ca253b86f7@mind.be>
In-Reply-To: <59c122bb-dff1-79d1-fb06-c5ca253b86f7@mind.be>
From: Chris Dimich <chris.dimich@boundarydevices.com>
Date: Wed, 24 Aug 2022 12:08:37 -0700
Message-ID: <CALsU4Cc1co=RtMC2DPmcuXCBODktO_york4-MLD1ZB95Q=0t7g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=aumm1GjtqGFMUxFSKaB7wJa+FZJW0xV1gRcQEpIu1wo=;
 b=TYd5uGhbQq6Gt63XOd1b3vQQaRFZ3HmjRlqtd5NkVIz3pu20W7KCmlD6uXcqMDkc6k
 llMqbcmp5VLFDSRGEm1kmKRDVhmb215MO8bzpOU42qlms88YYYA91ZIDqtXxWoOI54cC
 z1Im4nvMafL1xMqAOGol5JIydR+2IAngq4DEk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=TYd5uGhb
Subject: Re: [Buildroot] [PATCH 7/7]
 package/freescale-imx/imx-vpu-hantro-daemon: add package
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: multipart/mixed; boundary="===============6163963394163739775=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6163963394163739775==
Content-Type: multipart/alternative; boundary="000000000000277b5205e7016935"

--000000000000277b5205e7016935
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnout,

It is not required, as it's not a library. So is it okay?

Thanks,

Chris Dimich
Boundary Devices, LLC
www.boundarydevices.com
7 Orchard Road, Suite 102*=EF=BD=9C*Lake Forest, CA 92630



On Wed, Aug 24, 2022 at 12:51 AM Arnout Vandecappelle <arnout@mind.be>
wrote:

>
>
> On 24/08/2022 04:48, Chris Dimich wrote:
> > i.MX Hantro V4L2 Daemon. Provides the vsidaemon, which is needed for
> > V4L2 nodes to work.
> >
> > Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> > ---
> >   package/freescale-imx/Config.in               |  1 +
> >   .../imx-vpu-hantro-daemon/Config.in           | 20 ++++++++++
> >   .../imx-vpu-hantro-daemon.hash                |  4 ++
> >   .../imx-vpu-hantro-daemon.mk                  | 37 ++++++++++++++++++=
+
> >   4 files changed, 62 insertions(+)
> >   create mode 100644
> package/freescale-imx/imx-vpu-hantro-daemon/Config.in
> >   create mode 100644
> package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
> >   create mode 100644 package/freescale-imx/imx-vpu-hantro-daemon/
> imx-vpu-hantro-daemon.mk
> >
> > diff --git a/package/freescale-imx/Config.in
> b/package/freescale-imx/Config.in
> > index 4a4237fb42..13d611b696 100644
> > --- a/package/freescale-imx/Config.in
> > +++ b/package/freescale-imx/Config.in
> > @@ -115,6 +115,7 @@ source "package/freescale-imx/imx-vpuwrap/Config.in=
"
> >   source "package/freescale-imx/firmware-imx/Config.in"
> >   source "package/freescale-imx/imx-sc-firmware/Config.in"
> >   source "package/freescale-imx/imx-seco/Config.in"
> > +source "package/freescale-imx/imx-vpu-hantro-daemon/Config.in"
> >   source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
> >   if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 ||
> BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
> >   source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
> > diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
> b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
> > new file mode 100644
> > index 0000000000..2ab9f97081
> > --- /dev/null
> > +++ b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
> > @@ -0,0 +1,20 @@
> > +comment "imx-vpu-hantro-daemon needs an i.MX-specific Linux kernel to
> be built"
> > +     depends on !BR2_LINUX_KERNEL
> > +
> > +comment "imx-vpu-hantro needs an i.MX platform with Hantro VPU"
>                            -daemon
>
> > +     depends on BR2_LINUX_KERNEL
> > +     depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
> > +
> > +config BR2_PACKAGE_IMX_VPU_HANTRO_DAEMON
> > +     bool "imx-vpu-hantro"
> > +     depends on BR2_LINUX_KERNEL
> > +     depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
> > +     select BR2_PACKAGE_IMX_VPU_HANTRO
> > +     select BR2_PACKAGE_IMX_VPU_HANTRO_VC if
> BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
> > +     help
> > +       i.MX Hantro V4L2 Daemon specific for the NXP i.MX SoC
> > +       integrating a Hantro Video Processing Unit (VPU) such as the
> > +       i.MX8MQ/i.MX8MM/i.MX8MP.
> > +
> > +       This library is provided by NXP as-is and doesn't have an
> > +       upstream.
> > diff --git
> a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
> b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
> > new file mode 100644
> > index 0000000000..811f8b21a3
> > --- /dev/null
> > +++
> b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
> > @@ -0,0 +1,4 @@
> > +# Locally computed:
> > +sha256
> 77e25ad1e1860f0a3983f07d6beb9a04ff32763bacf26db9aefd16559e6eea9b
> imx-vpu-hantro-daemon-1.1.2.tar.gz
> > +sha256
> 35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
> > +sha256
> 35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  EULA
> > diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/
> imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/
> imx-vpu-hantro-daemon.mk
> > new file mode 100644
> > index 0000000000..8e039a9d94
> > --- /dev/null
> > +++ b/package/freescale-imx/imx-vpu-hantro-daemon/
> imx-vpu-hantro-daemon.mk
> > @@ -0,0 +1,37 @@
> >
> +########################################################################=
########
> > +#
> > +# imx-vpu-hantro-daemon
> > +#
> >
> +########################################################################=
########
> > +
> > +IMX_VPU_HANTRO_DAEMON_VERSION =3D 1.1.2
> > +IMX_VPU_HANTRO_DAEMON_SITE =3D $(FREESCALE_IMX_SITE)
> > +IMX_VPU_HANTRO_DAEMON_SOURCE =3D
> imx-vpu-hantro-daemon-$(IMX_VPU_HANTRO_DAEMON_VERSION).tar.gz
> > +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES =3D linux
> > +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES +=3D imx-vpu-hantro
> > +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP),y)
> > +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES +=3D imx-vpu-hantro-vc
> > +endif
> > +IMX_VPU_HANTRO_DAEMON_INSTALL_STAGING =3D YES
>
>   You don't have any commands to install to staging, so is this really
> correct?
>
>   Regards,
>   Arnout
>
> > +
> > +IMX_VPU_HANTRO_DAEMON_MAKE_ENV =3D \
> > +     CROSS_COMPILE=3D"$(TARGET_CROSS)" \
> > +     SDKTARGETSYSROOT=3D$(STAGING_DIR) \
> > +     LINUX_KERNEL_ROOT=3D$(LINUX_DIR) \
> > +     CTRLSW_HDRPATH=3D"$(STAGING_DIR)/usr/include" \
> > +     PLATFORM=3D$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
> > +
> > +IMX_VPU_HANTRO_DAEMON_LICENSE =3D NXP Semiconductor Software License
> Agreement
> > +IMX_VPU_HANTRO_DAEMON_LICENSE_FILES =3D EULA COPYING
> > +IMX_VPU_HANTRO_DAEMON_REDISTRIBUTE =3D NO
> > +
> > +define IMX_VPU_HANTRO_DAEMON_BUILD_CMDS
> > +     $(MAKE1) -C $(@D) $(IMX_VPU_HANTRO_DAEMON_MAKE_ENV)
> > +endef
> > +
> > +define IMX_VPU_HANTRO_DAEMON_INSTALL_TARGET_CMDS
> > +     $(IMX_VPU_HANTRO_DAEMON_MAKE_ENV) $(MAKE1) -C $(@D) \
> > +             DEST_DIR=3D$(TARGET_DIR) libdir=3D/usr/lib install
> > +endef
> > +
> > +$(eval $(generic-package))
>

--000000000000277b5205e7016935
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Arnout,<div><br></div><div>It is not required, as =
it&#39;s not a library. So is it okay?</div><div><br clear=3D"all"><div><di=
v dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
<div dir=3D"ltr"><div><div dir=3D"ltr">Thanks,<div><br></div><div>Chris Dim=
ich</div><div>Boundary Devices, LLC</div><div><a href=3D"http://www.boundar=
ydevices.com" target=3D"_blank">www.boundarydevices.com</a>=C2=A0</div><div=
><span style=3D"font-size:10pt;font-family:Arial,sans-serif;color:rgb(22,41=
,82)">7 Orchard Road, Suite 102</span><b style=3D"font-size:12.8px"><span s=
tyle=3D"font-size:10pt;font-family:&quot;MS Gothic&quot;;color:rgb(22,41,82=
);background-image:initial;background-position:initial;background-repeat:in=
itial">=EF=BD=9C</span></b><font color=3D"#939598" face=3D"Arial, sans-seri=
f" style=3D"font-size:12.8px"><span style=3D"font-size:10pt">Lake Forest, C=
A 92630<br></span></font><img src=3D"https://boundarydevices.com/wp-content=
/uploads/2014/05/BoundaryDevices_Logo-01.png" width=3D"96" height=3D"24"><b=
r></div></div></div></div></div></div><br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 12:=
51 AM Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@min=
d.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
<br>
On 24/08/2022 04:48, Chris Dimich wrote:<br>
&gt; i.MX Hantro V4L2 Daemon. Provides the vsidaemon, which is needed for<b=
r>
&gt; V4L2 nodes to work.<br>
&gt; <br>
&gt; Signed-off-by: Chris Dimich &lt;<a href=3D"mailto:chris.dimich@boundar=
ydevices.com" target=3D"_blank">chris.dimich@boundarydevices.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/freescale-imx/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0.../imx-vpu-hantro-daemon/Config.in=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 20 ++++++++++<br>
&gt;=C2=A0 =C2=A0.../imx-vpu-hantro-daemon.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://imx-vpu-hantro-daemon.mk" rel=3D"nor=
eferrer" target=3D"_blank">imx-vpu-hantro-daemon.mk</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 37 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A04 files changed, 62 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/freescale-imx/imx-vpu-hantro-da=
emon/Config.in<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/freescale-imx/imx-vpu-hantro-da=
emon/imx-vpu-hantro-daemon.hash<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/freescale-imx/imx-vpu-hantro-da=
emon/<a href=3D"http://imx-vpu-hantro-daemon.mk" rel=3D"noreferrer" target=
=3D"_blank">imx-vpu-hantro-daemon.mk</a><br>
&gt; <br>
&gt; diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/C=
onfig.in<br>
&gt; index 4a4237fb42..13d611b696 100644<br>
&gt; --- a/package/freescale-imx/Config.in<br>
&gt; +++ b/package/freescale-imx/Config.in<br>
&gt; @@ -115,6 +115,7 @@ source &quot;package/freescale-imx/imx-vpuwrap/Con=
fig.in&quot;<br>
&gt;=C2=A0 =C2=A0source &quot;package/freescale-imx/firmware-imx/Config.in&=
quot;<br>
&gt;=C2=A0 =C2=A0source &quot;package/freescale-imx/imx-sc-firmware/Config.=
in&quot;<br>
&gt;=C2=A0 =C2=A0source &quot;package/freescale-imx/imx-seco/Config.in&quot=
;<br>
&gt; +source &quot;package/freescale-imx/imx-vpu-hantro-daemon/Config.in&qu=
ot;<br>
&gt;=C2=A0 =C2=A0source &quot;package/freescale-imx/imx-vpu-hantro-vc/Confi=
g.in&quot;<br>
&gt;=C2=A0 =C2=A0if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAG=
E_FREESCALE_IMX_PLATFORM_IMX53)<br>
&gt;=C2=A0 =C2=A0source &quot;package/freescale-imx/gpu-amd-bin-mx51/Config=
.in&quot;<br>
&gt; diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/Config.in b/p=
ackage/freescale-imx/imx-vpu-hantro-daemon/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2ab9f97081<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in<br>
&gt; @@ -0,0 +1,20 @@<br>
&gt; +comment &quot;imx-vpu-hantro-daemon needs an i.MX-specific Linux kern=
el to be built&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_LINUX_KERNEL<br>
&gt; +<br>
&gt; +comment &quot;imx-vpu-hantro needs an i.MX platform with Hantro VPU&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-daemon<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_LINUX_KERNEL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HAN=
TRO<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_IMX_VPU_HANTRO_DAEMON<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;imx-vpu-hantro&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_LINUX_KERNEL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANT=
RO<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_IMX_VPU_HANTRO<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_IMX_VPU_HANTRO_VC if BR2_PACKA=
GE_FREESCALE_IMX_PLATFORM_IMX8MP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i.MX Hantro V4L2 Daemon specific for the N=
XP i.MX SoC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0integrating a Hantro Video Processing Unit=
 (VPU) such as the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i.MX8MQ/i.MX8MM/i.MX8MP.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This library is provided by NXP as-is and =
doesn&#39;t have an<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0upstream.<br>
&gt; diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantr=
o-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-=
daemon.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..811f8b21a3<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemo=
n.hash<br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +# Locally computed:<br>
&gt; +sha256=C2=A0 77e25ad1e1860f0a3983f07d6beb9a04ff32763bacf26db9aefd1655=
9e6eea9b=C2=A0 imx-vpu-hantro-daemon-1.1.2.tar.gz<br>
&gt; +sha256=C2=A0 35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea514=
29ca9a31=C2=A0 COPYING<br>
&gt; +sha256=C2=A0 35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea514=
29ca9a31=C2=A0 EULA<br>
&gt; diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/<a href=3D"ht=
tp://imx-vpu-hantro-daemon.mk" rel=3D"noreferrer" target=3D"_blank">imx-vpu=
-hantro-daemon.mk</a> b/package/freescale-imx/imx-vpu-hantro-daemon/<a href=
=3D"http://imx-vpu-hantro-daemon.mk" rel=3D"noreferrer" target=3D"_blank">i=
mx-vpu-hantro-daemon.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8e039a9d94<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/freescale-imx/imx-vpu-hantro-daemon/<a href=3D"http://im=
x-vpu-hantro-daemon.mk" rel=3D"noreferrer" target=3D"_blank">imx-vpu-hantro=
-daemon.mk</a><br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# imx-vpu-hantro-daemon<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +IMX_VPU_HANTRO_DAEMON_VERSION =3D 1.1.2<br>
&gt; +IMX_VPU_HANTRO_DAEMON_SITE =3D $(FREESCALE_IMX_SITE)<br>
&gt; +IMX_VPU_HANTRO_DAEMON_SOURCE =3D imx-vpu-hantro-daemon-$(IMX_VPU_HANT=
RO_DAEMON_VERSION).tar.gz<br>
&gt; +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES =3D linux<br>
&gt; +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES +=3D imx-vpu-hantro<br>
&gt; +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP),y)<br>
&gt; +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES +=3D imx-vpu-hantro-vc<br>
&gt; +endif<br>
&gt; +IMX_VPU_HANTRO_DAEMON_INSTALL_STAGING =3D YES<br>
<br>
=C2=A0 You don&#39;t have any commands to install to staging, so is this re=
ally correct?<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; +<br>
&gt; +IMX_VPU_HANTRO_DAEMON_MAKE_ENV =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CROSS_COMPILE=3D&quot;$(TARGET_CROSS)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SDKTARGETSYSROOT=3D$(STAGING_DIR) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LINUX_KERNEL_ROOT=3D$(LINUX_DIR) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CTRLSW_HDRPATH=3D&quot;$(STAGING_DIR)/usr/include=
&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PLATFORM=3D$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)<=
br>
&gt; +<br>
&gt; +IMX_VPU_HANTRO_DAEMON_LICENSE =3D NXP Semiconductor Software License =
Agreement<br>
&gt; +IMX_VPU_HANTRO_DAEMON_LICENSE_FILES =3D EULA COPYING<br>
&gt; +IMX_VPU_HANTRO_DAEMON_REDISTRIBUTE =3D NO<br>
&gt; +<br>
&gt; +define IMX_VPU_HANTRO_DAEMON_BUILD_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(MAKE1) -C $(@D) $(IMX_VPU_HANTRO_DAEMON_MAKE_EN=
V)<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define IMX_VPU_HANTRO_DAEMON_INSTALL_TARGET_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(IMX_VPU_HANTRO_DAEMON_MAKE_ENV) $(MAKE1) -C $(@=
D) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEST_DIR=3D$(TARGET_D=
IR) libdir=3D/usr/lib install<br>
&gt; +endef<br>
&gt; +<br>
&gt; +$(eval $(generic-package))<br>
</blockquote></div>

--000000000000277b5205e7016935--

--===============6163963394163739775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6163963394163739775==--
