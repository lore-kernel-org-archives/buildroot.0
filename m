Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2128BC83F17
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 06:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBAFB61194;
	Mon, 14 Jul 2025 06:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4joBHc0gWoC; Mon, 14 Jul 2025 06:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF0AA61196
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF0AA61196;
	Mon, 14 Jul 2025 06:14:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA632DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 06:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBED361194
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 06:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gE6k_5Lbqut9 for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 06:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD8FE6090C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD8FE6090C
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD8FE6090C
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 06:14:35 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-32ce1b2188dso34956131fa.3
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 23:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752473673; x=1753078473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PdmIL4xdkFmAjogi4u2o9tWoXi2UU17dFu32s74bg3Y=;
 b=Hg1aLF8EL05wpTnAeFcwCkzvs4jOMOBOoZ3Wm3zBGXhQWb8k0HtBv8xajS1xAlCtlj
 WzysPVU5rA9mRR5KwA+zQX+FT67ZeH3oeXI5xCgp2REMlsKEmCqiKxK2kodnMZdCtS3l
 E6gsl3DvVOT+Oo4AG5cEEJR0x2OE9n/9vv0ExAglkBRgbqwiiN5jY16Lyj55LcNHUDHp
 4Y6Rt3w4OtdXRrOMUG+meee/JiBW0R+LrKOIifm8XWWVBLAizxE7tqqyk4uaU6wZA6Iq
 9GvOt//IMg9xc1LYNJ773Up10+82D86z3NPETEaoZwMxTKKogH5TZz5eLD8jBjfPjR1E
 x2wQ==
X-Gm-Message-State: AOJu0YwcJ6omfFjUPasI0MA/2HlBBGT/TKCtdrkByG9QhSvpTap0XJI5
 6KF2cBEnducRdp2/JBuXMbj7mvEiISEy+A1N01OXF5SyB9MG/rsLChFuSu9D2jMYd12lfrmyIDn
 zYq6MfNsQHgk0vqYYy9wwd97g9eOGAcI=
X-Gm-Gg: ASbGnctddLgs8zxhcgGG1gFKpiUX5PXyP6uYS+IXNE7bgQ0BOI/DwwYd9NX2SfPWzkJ
 zzzXlPRxUR1iKEQ7cpVO3uA1BsF12iJZhQo4LxHQzMV3J5rIlCi1k2LMBGa+gGiJVTMIByu7SYx
 ErJwmbQyCMQZCfmHOpmxByXnL46luyPHRHRSKmRvY1yypI6xUqchdrglO7TXCcYulizwPj/Bo1i
 sfr6Dyz
X-Google-Smtp-Source: AGHT+IEKurQvTmSyWmqtwMX1wqwh1u7l8oyAe0LCoF7tBFB4gLp3KqELSQAOYsG8HEp0MrTaWDV9kMtEs4SF1uG+gxc=
X-Received: by 2002:a05:651c:11d3:b0:319:d856:c2f3 with SMTP id
 38308e7fff4ca-33053320f7emr26853951fa.10.1752473672787; Sun, 13 Jul 2025
 23:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250711120625.316250-1-heiko.thiery@gmail.com>
 <a2186a22be0f15499a563c1aa6d6d57f@free.fr>
In-Reply-To: <a2186a22be0f15499a563c1aa6d6d57f@free.fr>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 14 Jul 2025 08:14:20 +0200
X-Gm-Features: Ac12FXznhM9l-4LOHfj-X78HjpYyoTh8g27pnLsLRe1_z-EbKKQ-DUbGCP_vZWo
Message-ID: <CAEyMn7ag0TebP9FHJD6uin4Y03=Cb4Ldj6dFC_Shb0SZ8y-daw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Romain Naour <romain.naour@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Michael Walle <michael@walle.cc>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752473673; x=1753078473; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PdmIL4xdkFmAjogi4u2o9tWoXi2UU17dFu32s74bg3Y=;
 b=Y9aPlRPBR45/J4MqB2gfOtzEbB2/ZH06PELi0IxU4Omw779RqphojfHynBm79n+RqD
 NDhmUBXCZbKzao8EONIpC1h4Y2McK7OJW4FkX3BBvEh+a8KvaHI2xqOaRG+ne2Tn8rth
 akAwJLPhUi/qaIg3OtkKnDDkafTZALXWPf/tnjzkDyH2up2Ld7Z6nZe8GPwj6ou24zf6
 s6srlHwvVmnEczy8VxKg+1SrNAvC4DLW90rD8SNbBjo5g2KW6eEAim/skN2fHz06BC+L
 HYIIYbx6zbyW2kcXHiAnwk9UVWHEFtmKRlJ3bLYbWryNe220/kL1LedqSxLeXsZMcVg1
 MNRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y9aPlRPB
Subject: Re: [Buildroot] [PATCH] package/mesa3d: add support for imagination
 vulkan driver
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
Content-Type: multipart/mixed; boundary="===============7666729839675098059=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7666729839675098059==
Content-Type: multipart/alternative; boundary="000000000000beabfe0639dd925c"

--000000000000beabfe0639dd925c
Content-Type: text/plain; charset="UTF-8"

Hi Julien,



Am Sa., 12. Juli 2025 um 14:43 Uhr schrieb Julien Olivain <ju.o@free.fr>:

> Hi Heiko,
>
> Thanks for the patch.
>
> On 11/07/2025 14:06, Heiko Thiery wrote:
> > This adds the experimental vulkan support for the PowerVR rogue
> > architecture.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >  package/mesa3d/Config.in | 8 ++++++++
> >  package/mesa3d/mesa3d.mk | 1 +
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> > index b5c1d92d68..7ec8fd2f76 100644
> > --- a/package/mesa3d/Config.in
> > +++ b/package/mesa3d/Config.in
> > @@ -359,6 +359,14 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
> >       help
> >         Vulkan broadcom driver.
> >
> > +config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
> > +     bool "Vulkan imagination driver (experimental)"
> > +     depends on BR2_arm || BR2_aarch64
> > +     depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libxshmfence
>
> BR2_PACKAGE_XLIB_LIBXSHMFENCE is selected by BR2_PACKAGE_MESA3D_DRIVER
> only if BR2_PACKAGE_XORG7 is also selected. See:
>
> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/package/mesa3d/Config.in#L72
>
> In that case, why this dependency is not:
>
>      depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 #
> libxshmfence
>
> like most of the other drivers?
>

I just copied the config entry from the  "Vulkan broadcom driver" above my
entry. And in this the dependency is just for "BR2_TOOLCHAIN_HAS_SYNC_4".


> Could you update this dependency or add an explanation please?
>

For sure I will update that.


>
> > +     select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
> > +     help
> > +       Vulkan imagination driver.
> > +
> >  config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
> >       bool "Vulkan Intel driver"
> >       depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 #
> > libxshmfence
>
> Best regards,
>
> Julien.
>

BR,
Heiko

--000000000000beabfe0639dd925c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Julien,<div><br></div><div><br></div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">Am Sa., 12. Juli 2025 um 14:43=C2=A0Uhr schrieb Julien=
 Olivain &lt;<a href=3D"mailto:ju.o@free.fr">ju.o@free.fr</a>&gt;:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Heiko,<br>
<br>
Thanks for the patch.<br>
<br>
On 11/07/2025 14:06, Heiko Thiery wrote:<br>
&gt; This adds the experimental vulkan support for the PowerVR rogue<br>
&gt; architecture.<br>
&gt; <br>
&gt; Signed-off-by: Heiko Thiery &lt;<a href=3D"mailto:heiko.thiery@gmail.c=
om" target=3D"_blank">heiko.thiery@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/mesa3d/Config.in | 8 ++++++++<br>
&gt;=C2=A0 package/mesa3d/<a href=3D"http://mesa3d.mk" rel=3D"noreferrer" t=
arget=3D"_blank">mesa3d.mk</a> | 1 +<br>
&gt;=C2=A0 2 files changed, 9 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in<br>
&gt; index b5c1d92d68..7ec8fd2f76 100644<br>
&gt; --- a/package/mesa3d/Config.in<br>
&gt; +++ b/package/mesa3d/Config.in<br>
&gt; @@ -359,6 +359,14 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vulkan broadcom driver.<br>
&gt; <br>
&gt; +config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;Vulkan imagination driver (experimenta=
l)&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_arm || BR2_aarch64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libxshmfenc=
e<br>
<br>
BR2_PACKAGE_XLIB_LIBXSHMFENCE is selected by BR2_PACKAGE_MESA3D_DRIVER<br>
only if BR2_PACKAGE_XORG7 is also selected. See:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/packag=
e/mesa3d/Config.in#L72" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.com/buildroot.org/buildroot/-/blob/2025.05/package/mesa3d/Config.in#L72</a=
><br>
<br>
In that case, why this dependency is not:<br>
<br>
=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XOR=
G7 # <br>
libxshmfence<br>
<br>
like most of the other drivers?<br></blockquote><div><br></div><div>I just =
copied the config entry from the=C2=A0 &quot;Vulkan broadcom driver&quot; a=
bove my entry. And in this the dependency is just for &quot;BR2_TOOLCHAIN_H=
AS_SYNC_4&quot;.</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Could you update this dependency or add an explanation please?<br></blockqu=
ote><div><br></div><div>For sure I will update that.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_MESA3D_VULKAN_DRIVER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Vulkan imagination driver.<br>
&gt; +<br>
&gt;=C2=A0 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Vulkan Intel driver&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_=
PACKAGE_XORG7 # <br>
&gt; libxshmfence<br>
<br>
Best regards,<br>
<br>
Julien.<br></blockquote><div><br></div><div>BR,</div><div>Heiko=C2=A0</div>=
</div></div>

--000000000000beabfe0639dd925c--

--===============7666729839675098059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7666729839675098059==--
