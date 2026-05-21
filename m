Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0B0CD5BAF
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 20:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5E7784C61;
	Thu, 21 May 2026 20:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_KNugaY1dYy; Thu, 21 May 2026 20:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ED6884C5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779396715;
	bh=Y9/lPGSPuXQzVwd2NF4amAlEYoGAt0vhrnWI0cZLtbY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NGnyRbZK9rO8ZmFQpzBAIHPtWLHgYjm+3QRWhj8vGK+IjUmR5/rGH3cVkZ0Hp1KW4
	 wnoInBPOJW6KSRF7Ztn1yMFRoxwMAW4sJ9NEJjxnOQoUG6Kp4ucHv9AOoGqaMELXVc
	 vBy7M8EUpQUHHwYDTB5Cac08GYBFa29V6qD+qMFtWBJEs6D3yv1Qx5MB1D4GkXWCkp
	 uf7X7mww23eFz0TeVckRDyQWHu+CFouG/B44AQtXYIQ5Cie4OR7idfpWbSQtpb/o3W
	 NUDLgchyxHcZM84v8amE2LD4Lzo2QokxG4tKvSteZUkhtPt0PZIGuYp7q8AwEWPkq3
	 UN9V5gU/NSwBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ED6884C5B;
	Thu, 21 May 2026 20:51:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D617F265
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C469D4240E
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFJkrVz3HfZO for <buildroot@buildroot.org>;
 Thu, 21 May 2026 20:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29C2C42408
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29C2C42408
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29C2C42408
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:51:53 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-6969c864c89so3700816eaf.2
 for <buildroot@buildroot.org>; Thu, 21 May 2026 13:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779396712; cv=none;
 d=google.com; s=arc-20240605;
 b=JOoYr12zN3ZKbwtyVFpUpnCCHRyszEH0YVUNVvAA136BRV0Fl7z3vjNbrlRhKd1HSs
 YmLKh6/RRokW3I7VIhlBSGoEosS7tIzPhy/yCjY5MRFGDEaW4IoVaqsaSdIak+Lb/B/R
 qvBpN1QZ3x1wBYyAN3b5DRPNsOFe1hv6aBesevqC3pfbU/driONIZSpl2S805o5Kp/yY
 5bg19aeTZ+0MX3F84Wi59frz4CtOtgUsgeF4BbFQdNcyLbaf4ytq7bf/+wD4dPl8FM9z
 YGQPrJuXev4NPyH/A5RAS+azVEsSkQ6U4dK96nlwSlw0fU7ZNIShQte4GkQ7tfKBtzly
 KyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4T9/H9U8Bv8zP7m3dr2FM4eEzijZBllwKltzOEYBBWc=;
 fh=I4P7DB3IEMGfKF4XS7p6fy0ZkU+/rl9KxnXFSk/s7Ks=;
 b=V6DTfW+3zWyAnJ6SuGvEPuXJw4NxM2zY9Ns2fBfGPqgR6LypTga+3KTuK8pZp+SzpJ
 G6WwVBfQB4FBbOd4YZ89KSiFTxgA3c+xVjVwI5Dv7ZZHf3Ki8vAZBVE0swssUTAInCqd
 1gEGMDkKcbpXmyGObKLxFMSBXiG+JX9RG49HVE316efks38IOvNYcPBpL27EfvCD5I7l
 rU4iZXTexSQKvJRPkI5YV10WQi2O/TAXhankiwJ/FBjfFlYiVDBVjCzBeDbWqRVFFjzO
 TTEsbNnjO9MChCvoYFWSnk0LjeQdUGLK33i5gruuL3OTjzgrZ+PcuqFCqHskoo3L11VB
 tIQg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779396712; x=1780001512;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4T9/H9U8Bv8zP7m3dr2FM4eEzijZBllwKltzOEYBBWc=;
 b=YH+UMPRJHtqanbHuN5SfzT6GNrPYdLRpzShR0RrSI/edH8WvbEpZzC3xUC8SmP6nHh
 X+CLJm1A8EmH7Vzsi01WAxqiYJUTJ4Hn5zyr6rWlquBm9lQOocptnKS7xXdf69x7iX8L
 c+ofXi9QRaVeNM5yaPSSS1uh6Jk0PtpI6xp8zjZnR1ILhG++waSBtMXfpKccU0ZQ+/Xs
 K4r05amSF6upWIgSwUwpEnw+HddRgfJrp/m9CTgH/4br5P9cX/ZCwXZazMY06GDrjAHT
 LBtJsDMwhkaSflMrMQ+Jwx/FKc9JIIVF9m40oVZjPVY0W2j4LMpu+cCChrioqdY4lSJL
 08VA==
X-Gm-Message-State: AOJu0YzG8x43UcmldpwfAnGK9pDcBsBzLAppU+F5mkKAMAa73m+90OTi
 7f08S9QU93TVOMQdthsWlGWddzUyEbdnOT9Q8Xe61/9LddrKJgcZXopRW773nYsMcDbyD2LPinc
 QpTvP82xBhlHko0AdNZjW5b+OfvBU4FyIuTtw
X-Gm-Gg: Acq92OFPnUJqW4tOmB1Rw1qLgrFKQFQy5qz0KlCGk6ujONFr+tk4bWhyt8EsnQsmNSF
 hN1bUC8CyQu8H5eGg18v5RII9hfFKHHORUOzppmi26nZVfjh98yE1z9C4jpgFr5nZ+NMdUs/qax
 dg2VmSaBJIQhZcoeef7wGRdJAjkOgpuEStHk9dzcgNPYlV1p9Owa8h+U1TE751XtO30FSgmbygH
 CjVH1gUNjPKC45Z7VR93DBLnQvNTcXKYmO7PuCh22Uv16JZJXh1Vaq5uoE3+Ddh465a/XmuURuk
 Gx+OmgjZ/VOI4vs1dME8/mXObSi0ImwOHIDeEzUuETN5YHx0hqI=
X-Received: by 2002:a05:6820:55c5:10b0:688:29ff:2dc0 with SMTP id
 006d021491bc7-69d7ec4b234mr306637eaf.39.1779396711944; Thu, 21 May 2026
 13:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
 <20260515-virglrenderer-v7-7-1f1814b65ccd@gmail.com>
 <3bca72e7-9bc3-42d8-a642-dfb70cd0a473@rnout.be>
In-Reply-To: <3bca72e7-9bc3-42d8-a642-dfb70cd0a473@rnout.be>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 21 May 2026 15:51:41 -0500
X-Gm-Features: AVHnY4J3LYM3Myla4pp9_Vy1gGaaOYAHvBM75lYW3U3B3LCyLi9tjUhbDFAyJ-4
Message-ID: <CAMWSM7giP4eAmNeDb9SNf9Z+nVxm3h9jn3q8pe1CzG8Pep5TFw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot <buildroot@buildroot.org>,
 Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779396712; x=1780001512; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4T9/H9U8Bv8zP7m3dr2FM4eEzijZBllwKltzOEYBBWc=;
 b=bH8lrYsDmS93XFdMW8BZk+AkOtmHGmmsrCkoazOpG9rrJNRuZBCRy/IsbDvcKYgnCg
 +cSiPRjFVyBHOXKRmio1YxZNKsDKwSLIQZb3CwW7yFFTj/VcMmLk1RKgM6lG2Zmq2+ih
 0ydcqA3gJfRUAR1P/Ckg1BRdk+bjLuY7h0Lw8c3iGB1O3n5HMhish1Uryr/v1cb2ehxZ
 xOYMCATNQxSxUFwHBts5G2VkfDBbBIy8KvXxcT0AiRTR7Sq5OscOKDVC8sF3CCv9hx4S
 svM7heimpnnuKjQawWvxnnFt8CZqJcMwvq7awa7MzdLvivWdgrfUR5RrX7Vv94My1iIS
 MXkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bH8lrYsD
Subject: Re: [Buildroot] [PATCH v7 7/8] package/qemu: add virglrenderer
 integration
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
Content-Type: multipart/mixed; boundary="===============7128341581439505210=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7128341581439505210==
Content-Type: multipart/alternative; boundary="000000000000ee16b806525a14aa"

--000000000000ee16b806525a14aa
Content-Type: text/plain; charset="UTF-8"

Hello Arnout,

On Thu, May 21, 2026, 15:24 Arnout Vandecappelle <arnout@rnout.be> wrote:

>
>
> On 16/05/2026 04:03, Joseph Kogut wrote:
> > Add optional virglrenderer integration, along with enabling OpenGL when
> > necessary.
> >
> >
> https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
> >
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > ---
> >   package/qemu/Config.in | 21 +++++++++++++++++++++
> >   package/qemu/qemu.mk   |  7 +++++++
> >   2 files changed, 28 insertions(+)
> >
> > diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> > index d4e4e37a3e..dbae7c4de4 100644
> > --- a/package/qemu/Config.in
> > +++ b/package/qemu/Config.in
> > @@ -126,6 +126,27 @@ config BR2_PACKAGE_QEMU_OPENGL
> >   comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
> >       depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
> >
> > +config BR2_PACKAGE_QEMU_VIRGLRENDERER
> > +     bool "Enable virglrenderer"
> > +     depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
> > +     select BR2_PACKAGE_QEMU_OPENGL
> > +     select BR2_PACKAGE_VIRGLRENDERER
> > +     help
> > +       Say 'y' to enable qemu support for virglrenderer.
> > +       virglrenderer backends such as virgl, venus, or DRM native
> > +       context are configured under the virglrenderer package.
> > +
> > +       Run qemu with `-device virtio-gpu-gl`
> > +
> > +
> https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
> > +
> > +comment "virglrenderer needs OpenGL accelerated display frontend
> support"
> > +     depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
> > +
> > +comment "virglrenderer needs virgl, venus, or a DRM backend for guest
> acceleration"
> > +     depends on BR2_PACKAGE_QEMU_VIRGLRENDERER
> > +     depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
>
>   Does it actually work if you have a DRM backend but no virgl or venus?
> I'm
> confused again...
>


Yes, it does actually work. I understand your confusion though. :)

TL;DR: VirGL forwards OpenGL to the host, Venus does the same but for
Vulkan. The host requirement is OpenGL or Vulkan support.

DRM backends are used in combination with the native UMD (radeonsi, i1915,
freedreno, etc.) running inside the guest, which generally provide both GL
and Vulkan, with better security and less overhead. However, you need
specific GPU hardware on the host, which is why the test uses VirGL.

Best,
Joseph

--000000000000ee16b806525a14aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Arnout,<br><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 21, 202=
6, 15:24 Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@rnout.be">arnout=
@rnout.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 16/05/2026 04:03, Joseph Kogut wrote:<br>
&gt; Add optional virglrenderer integration, along with enabling OpenGL whe=
n<br>
&gt; necessary.<br>
&gt; <br>
&gt; <a href=3D"https://qemu.readthedocs.io/en/v10.0.3/system/devices/virti=
o-gpu.html#virtio-gpu-virglrenderer" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gp=
u.html#virtio-gpu-virglrenderer</a><br>
&gt; <br>
&gt; Signed-off-by: Joseph Kogut &lt;<a href=3D"mailto:joseph.kogut@gmail.c=
om" target=3D"_blank" rel=3D"noreferrer">joseph.kogut@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/qemu/Config.in | 21 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer =
noreferrer" target=3D"_blank">qemu.mk</a>=C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 28 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/qemu/Config.in b/package/qemu/Config.in<br>
&gt; index d4e4e37a3e..dbae7c4de4 100644<br>
&gt; --- a/package/qemu/Config.in<br>
&gt; +++ b/package/qemu/Config.in<br>
&gt; @@ -126,6 +126,27 @@ config BR2_PACKAGE_QEMU_OPENGL<br>
&gt;=C2=A0 =C2=A0comment &quot;OpenGL support needs an OpenGL and/or OpenGL=
 EGL backend&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_P=
ACKAGE_HAS_LIBGL)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +config BR2_PACKAGE_QEMU_VIRGLRENDERER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;Enable virglrenderer&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_=
HAS_LIBGL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QEMU_OPENGL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VIRGLRENDERER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Say &#39;y&#39; to enable qemu support for=
 virglrenderer.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0virglrenderer backends such as virgl, venu=
s, or DRM native<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0context are configured under the virglrend=
erer package.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Run qemu with `-device virtio-gpu-gl`<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://qemu.readthedocs.io/en/=
v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://qemu.readthedocs.io/en/v10.0.=
3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer</a><br>
&gt; +<br>
&gt; +comment &quot;virglrenderer needs OpenGL accelerated display frontend=
 support&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAG=
E_HAS_LIBGL)<br>
&gt; +<br>
&gt; +comment &quot;virglrenderer needs virgl, venus, or a DRM backend for =
guest acceleration&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QEMU_VIRGLRENDERER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND=
<br>
<br>
=C2=A0 Does it actually work if you have a DRM backend but no virgl or venu=
s? I&#39;m <br>
confused again...<br></blockquote></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Yes, it does actually work. I =
understand your confusion though. :)</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">TL;DR: VirGL forwards OpenGL to the host, Venus does the same =
but for Vulkan. The host requirement is OpenGL or Vulkan support.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">DRM backends are used in combinat=
ion with the native UMD (radeonsi, i1915, freedreno, etc.) running inside t=
he guest, which generally provide both GL and Vulkan, with better security =
and less overhead. However, you need specific GPU hardware on the host, whi=
ch is why the test uses VirGL.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Best,</div><div dir=3D"auto">Joseph</div></div>

--000000000000ee16b806525a14aa--

--===============7128341581439505210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7128341581439505210==--
