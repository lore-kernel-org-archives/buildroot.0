Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E27C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 14:05:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B50261250
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 14:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B50261250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E017760718;
	Sun, 17 Oct 2021 14:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t64i71JleOnq; Sun, 17 Oct 2021 14:05:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C73C606E3;
	Sun, 17 Oct 2021 14:05:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90DA41BF5AC
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 14:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F707606E3
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 14:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkTNBJ1itxRj for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 14:05:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EB236067B
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 14:05:48 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id 204so3833455ljf.9
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f3H9Jb8LsST053ER8P3MtGDzSMdUSjc/D7QYiABg4x4=;
 b=cB91FeRtZ4WiM9r0Oh9UVxbUOELaSHG9rf3Et4oF5ig4FBZN+O7RACHRgpJa9tUpLa
 8dA2jS8pOjHc8moBfSGw2Wm4t3aEIcQ7+qIK0pLbxenDeFDxKGN+I0HjgRQsQWZGr9fy
 Dtr21Gx19bYRrxk1G1yDyD11aF4GtdXDkWFkT01lmykz3byaiJvAKi3sNBa/rF2YlUVT
 Xfw0i5UtdBBpv01ZcBUVjVnWtIkIUqRMbUNLhjrbN5Exvkz0f6MPbi3W2rONJK4efjQu
 LrCBALSS/hjZsF6UVpQmkfNEKLC0Hi0tr5gWD37Boai7KiVLA/P8O6FBBJKghjecFv5z
 Z1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f3H9Jb8LsST053ER8P3MtGDzSMdUSjc/D7QYiABg4x4=;
 b=DwC4G7ARG93vxBzW0UF2nNSn87cNvDKA3A4vdRPEDK4wlZiwnBGcOwSKJhHQd2o71Z
 u5L5Jp2hPL0TG5YBFq2pGg4mNUj2JXtgTAxdHwCkoxdtexgMSQ+HbVTcfMRAb2XodVaH
 P1Oexx+bNwN/AbfpSyn1AfFNVF8ui6cfzXneemeBgSL6w5hA7HO28lzijW8cRvpLOBnW
 gGS12Uky2SfdOYD+8tsyo0/RWYBJH+usm9h/pQYgYQLgaD88ZuV2s9s+h8L/+uXg7AIA
 JMDsbjd+UiziX5buDREaYigwUHfRPedo8HtxpKuhyIF9Alakvt4iU0ksjW30NXnJADk8
 ZdeA==
X-Gm-Message-State: AOAM533eFn1e3Nd7vwQEB/HGy0ikGEvjSupgvkAWpxixGA0L3ZWSZHNN
 +kSKJf0JRUqYvvDWD3y9Hgix9+cv2nrKr3oXMVw=
X-Google-Smtp-Source: ABdhPJw5sZa3Ig663xcco2HwbP764pYeVqoTw/p+oDl2SqZxbg+/yDJUZ5oWmY333+S9p16dGx0CzOW7JOgKcMKcxtE=
X-Received: by 2002:a2e:91d3:: with SMTP id u19mr26250478ljg.453.1634479546206; 
 Sun, 17 Oct 2021 07:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211011210241.396390-1-glex.spb@gmail.com>
 <20211011212125.402086-1-glex.spb@gmail.com>
 <20211011212125.402086-3-glex.spb@gmail.com>
 <20211017113717.3f642315@windsurf>
In-Reply-To: <20211017113717.3f642315@windsurf>
From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Sun, 17 Oct 2021 09:05:34 -0500
Message-ID: <CADjhFRBrddV3BCrC7FOEaBjzzvpWDshvO3SCA8Cq1uXby4at1Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v4 2/2] package: add smpq
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8051237093916552185=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8051237093916552185==
Content-Type: multipart/alternative; boundary="000000000000be8b8005ce8cec37"

--000000000000be8b8005ce8cec37
Content-Type: text/plain; charset="UTF-8"

The use case for me is to build DevilutionX (Diablo 1 source port) in a
gaming-oriented buildroot-based distro (batocera.linux).

DevilutionX produces an MPQ archive during the build process using smpq, so
smpq needs to be a host package.

I'm not near a computer for the next few days so I'd appreciate if you
could adjust the commit message and DEVELOPERS when merging.

Thanks, Gleb


On Sun, 17 Oct 2021, 04:37 Thomas Petazzoni, <thomas.petazzoni@bootlin.com>
wrote:

> Hello Gleb,
>
> On Mon, 11 Oct 2021 22:21:25 +0100
> Gleb Mazovetskiy <glex.spb@gmail.com> wrote:
>
> > smpq is a utility for manipulating Blizzard MPQ archives.
> >
> > smpq is a build-time dependency of several source ports /
> > reimplementations of Blizzard games, such as DevilutionX.
> >
> > Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
>
> Thanks for this contribution. Could you clarify practical speaking in
> which context this library is useful?
>
> > --- /dev/null
> > +++ b/package/smpq/smpq.mk
> > @@ -0,0 +1,19 @@
> >
> +################################################################################
> > +#
> > +# smpq
> > +#
> >
> +################################################################################
> > +
> > +SMPQ_VERSION = 1.6
> > +SMPQ_SOURCE = smpq_$(SMPQ_VERSION).orig.tar.gz
> > +SMPQ_SITE = https://launchpad.net/smpq/trunk/$(SMPQ_VERSION)/+download
> > +SMPQ_LICENSE = GPL-3.0+
> > +SMPQ_LICENSE_FILES = LICENSE
> > +SMPQ_DEPENDENCIES = stormlib
> > +HOST_SMPQ_DEPENDENCIES = host-stormlib
> > +SMPQ_CONF_OPTS += -DWITH_KDE=OFF
> > +HOST_SMPQ_CONF_OPTS += -DWITH_KDE=OFF
> > +SMPQ_INSTALL_STAGING = YES
> > +
> > +$(eval $(cmake-package))
> > +$(eval $(host-cmake-package))
>
> Why do you need a host variant of this package? It isn't used by
> anything else. Could you clarify this?
>
> Note: for both of your package submissions, the commit title should be
> "package/<foo>: new package". And also, in each patch adding the
> packages, you need to add yourself in the DEVELOPERS file for this
> package.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000be8b8005ce8cec37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The use case for me is to build DevilutionX (Diablo 1 sou=
rce port) in a gaming-oriented buildroot-based distro (batocera.linux).<div=
 dir=3D"auto"><br></div><div dir=3D"auto">DevilutionX produces an MPQ archi=
ve during the build process using smpq, so smpq needs to be a host package.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m not near a comp=
uter for the next few days so I&#39;d appreciate if you could adjust the co=
mmit message and DEVELOPERS when merging.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Thanks, Gleb</div><div dir=3D"auto"><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 17 =
Oct 2021, 04:37 Thomas Petazzoni, &lt;<a href=3D"mailto:thomas.petazzoni@bo=
otlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Hello Gleb,<br>
<br>
On Mon, 11 Oct 2021 22:21:25 +0100<br>
Gleb Mazovetskiy &lt;<a href=3D"mailto:glex.spb@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">glex.spb@gmail.com</a>&gt; wrote:<br>
<br>
&gt; smpq is a utility for manipulating Blizzard MPQ archives.<br>
&gt; <br>
&gt; smpq is a build-time dependency of several source ports /<br>
&gt; reimplementations of Blizzard games, such as DevilutionX.<br>
&gt; <br>
&gt; Signed-off-by: Gleb Mazovetskiy &lt;<a href=3D"mailto:glex.spb@gmail.c=
om" target=3D"_blank" rel=3D"noreferrer">glex.spb@gmail.com</a>&gt;<br>
<br>
Thanks for this contribution. Could you clarify practical speaking in<br>
which context this library is useful?<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/smpq/<a href=3D"http://smpq.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">smpq.mk</a><br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# smpq<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +SMPQ_VERSION =3D 1.6<br>
&gt; +SMPQ_SOURCE =3D smpq_$(SMPQ_VERSION).orig.tar.gz<br>
&gt; +SMPQ_SITE =3D <a href=3D"https://launchpad.net/smpq/trunk/$(SMPQ_VERS=
ION)/+download" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lau=
nchpad.net/smpq/trunk/$(SMPQ_VERSION)/+download</a><br>
&gt; +SMPQ_LICENSE =3D GPL-3.0+<br>
&gt; +SMPQ_LICENSE_FILES =3D LICENSE<br>
&gt; +SMPQ_DEPENDENCIES =3D stormlib<br>
&gt; +HOST_SMPQ_DEPENDENCIES =3D host-stormlib<br>
&gt; +SMPQ_CONF_OPTS +=3D -DWITH_KDE=3DOFF<br>
&gt; +HOST_SMPQ_CONF_OPTS +=3D -DWITH_KDE=3DOFF<br>
&gt; +SMPQ_INSTALL_STAGING =3D YES<br>
&gt; +<br>
&gt; +$(eval $(cmake-package))<br>
&gt; +$(eval $(host-cmake-package))<br>
<br>
Why do you need a host variant of this package? It isn&#39;t used by<br>
anything else. Could you clarify this?<br>
<br>
Note: for both of your package submissions, the commit title should be<br>
&quot;package/&lt;foo&gt;: new package&quot;. And also, in each patch addin=
g the<br>
packages, you need to add yourself in the DEVELOPERS file for this<br>
package.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--000000000000be8b8005ce8cec37--

--===============8051237093916552185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8051237093916552185==--
