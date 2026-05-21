Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59161CD5BAB
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 20:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A26A423B6;
	Thu, 21 May 2026 20:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y515_KN1ft9m; Thu, 21 May 2026 20:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12EBF423BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779395441;
	bh=ELWSocS9u9K14fzbsUIujE90t4eQFHpeEbla1y+P1JQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fOfVsqRZxxFv9X7i/00fmk1zWiVStk+gDb/qRrXD9/v2/q77u5arpjh5MX/p4exHS
	 LswPG4qRE1GrH2Y69/aSwi4YhBPGPHY/QOLBuO3M6Dxis5vxQONU3otYoBicd/J32b
	 R/A8Ek4ustY6zZgK2aQ3oydLHvhpZA0zJSp5aM1BYErwKcZgR13ZvjtejoaiFhxl6g
	 glf0fiLnsa5kbtLBt7Es/DegmJPGNTLrD6vyEtllBrn3RNi8TjiTykCUZRDu7ANfAz
	 zYz77EHwo9iO+R8ugtOAyLncBPsNWR8A5YhoiBIJyKmUWdPKZwfjeYR0eZXkCL64zK
	 HovFiwPcRexrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12EBF423BA;
	Thu, 21 May 2026 20:30:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81B97265
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6761184C03
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccvIwqRQMRAR for <buildroot@buildroot.org>;
 Thu, 21 May 2026 20:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FAF584BF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FAF584BF4
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FAF584BF4
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:30:38 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7dbcb467f2bso6183237a34.3
 for <buildroot@buildroot.org>; Thu, 21 May 2026 13:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779395437; cv=none;
 d=google.com; s=arc-20240605;
 b=BUnfXLaTxJ6+W/WKxNy5jbWUPFW/7sse1B49T5SOhvPiYHKj9IpS2yebJhrtwXGao5
 pKAGddlhxKbqXPUEM2bTSqJuH7AeN13FchPK4L5UAGTBWXDKS6PfBSmI8yhapS39CVbP
 IAHLZk5+DtX8LvInPUPeN2Lij4i8m5v++MIiCBeN3NAi06ZBCFxKpa74KglEc6csqZ9L
 zt3mE1R6dXuDkrHIXD02jP/HrnOWBiBOKwcb8sQLTSADuIK7PeZccuuMDZBoMBVb4ST+
 wRL+mXnbyQhummmP10XzXk7wJJWtLkODKjRr6Hcwhl8giJ1lk1UzXNltIB78Ouu/gDTG
 WX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Gavmr9W5/4aKLHNQUPbLBc81Pu2p/HXDVsHlG3Ym4/A=;
 fh=I4P7DB3IEMGfKF4XS7p6fy0ZkU+/rl9KxnXFSk/s7Ks=;
 b=TeAAOzPRud1NTUmMJXoIeBa6s5QjdlbTV+i+aIwI2sD/rhIdYB6KdNE/WhrCcrqMzx
 yIIlZlO0fGRag3AVY/houOsJpc/Nj+Lsx3rKR8sFanHoihZELn01Nl2pX0oaufqEBzaQ
 CDMIPLN+ppouJpnUMNHkV0Q0rUuRxmc7tElkUr8Woe9NiTtPid+9CqIiJJvEpjg+CRv/
 eIzXqHc+8aBxp3YKCtoqLp6tzpJveapnYvbHuO/UTyoD/RMF6YSzDUoKPdmdXYnMtmcx
 rqCrVwgp4qymTLjaykA7WWRb5tXAXe7kFUTz/QxvcdFyRwR4rbCOBCMr2ckPrUN570Xd
 FJAw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779395437; x=1780000237;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gavmr9W5/4aKLHNQUPbLBc81Pu2p/HXDVsHlG3Ym4/A=;
 b=Xk9ky+qXF04BUKbGwsupMOspRhNtmmTKUtriEAQqJQcRiJgqC4xAdy1xIoeKuCY07/
 49IFHCMcbFwKHPZxjETqdQkhn0tmx0euj4Mqcevr3WFjx/lE9PXZqohI+1UOq3SY6M+g
 +gwzmmKGo5FEtnM6ZABOQfEXnOnF3VQhoPkUyF95+qz7xcUHNNe1ewYJ7e9WTl+gXNsA
 WuBgC4nVx2Zr6eGl765vQ//tgC4PYXLvIopO/3i0MbIME4kuM1qiMvyOEsuBUvQsiSZA
 dSwjXX6kA7WvZ84oVA0rCeV77uXgLCoTOvzXwm1neH5J6psdOzzuR96OJz5TJtPy6wuw
 +QvQ==
X-Gm-Message-State: AOJu0YxRVfszSNiUXn7ZcXJQUehwm4Yo/MSe7KOWlv1zhtfC9+1joQcu
 qDoZgfVRKf5i3l0A/Q9Ok3Jq2OfwRlv5zmJa3s8GYy4Rc54XKDwpCA5hnVkGNI5qF6YdUDUDwZ0
 NEcCiM+zyahiKxyciHmC//QJk0H2Rnjo=
X-Gm-Gg: Acq92OG3/+GTCJlccxQ7t1qfd3U1aqWOElJjtNZbe9/02y61z2epDgLu3B6Y29+ULlK
 hK05aP7uO0JJyOrKPHImf+BQIS7iekJmUPIpsgEtWQ9Hq5cOzNwQ422HtNsi8cDAivi6iV3Bnpy
 XZLCFDN+THBv2uL0QLkAw2cSp90e7fPwqQB72elVicdWtorUY2yLOjEQbc0Kt+aPwDDB7nZn8WK
 LfyCcH/fLWtk3ffsmw/XaRI+D3tzcKr0YyaV9KKt9lyh2NhpSOr3EHTRMU70JWiuhGXjogkyNY+
 T7CfAgmBa/EPF7xlV0YG/g+7q2E1MtRoOymHI6sKJLa6z4FBNAwqa+KKvQm/4Q==
X-Received: by 2002:a05:6820:4d03:b0:67d:f88f:d853 with SMTP id
 006d021491bc7-69d7eaf1e60mr429262eaf.6.1779395437097; Thu, 21 May 2026
 13:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
 <20260515-virglrenderer-v7-3-1f1814b65ccd@gmail.com>
 <7b9ff6ce-5eae-475a-b7f9-b864a7ca614f@rnout.be>
In-Reply-To: <7b9ff6ce-5eae-475a-b7f9-b864a7ca614f@rnout.be>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 21 May 2026 15:30:26 -0500
X-Gm-Features: AVHnY4JRwmcNDRGC26VYWJQ8c1GgcsLezTQgb1nNlEkjTYT_nLPcn9VAOBxjpvI
Message-ID: <CAMWSM7jTJk7g2qfD-9r3jqVK8PhRNoD-bWv2=jHkYv8v8TqcHw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot <buildroot@buildroot.org>,
 Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779395437; x=1780000237; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gavmr9W5/4aKLHNQUPbLBc81Pu2p/HXDVsHlG3Ym4/A=;
 b=c3KmOuCM3stM6TuIGM9NValC5GkjIc2MA2TNzA0xSEqOj/FhyKc7uxk8cVA+eoR1tF
 dhaj40p162f3cUYGehTo2vvkhA3u8dJvnhE4TkZvHKT8VEV3rp6ZnW3jM+JpfZhMioS6
 0imP9t1O2L0icaTXOFW+GF7H0bBU0yjTio+Awv0KXcHuwxSwJuBxXcNU/8UKDgUnOlZ0
 kiWzEeKeMB6h4GHjqhujV5yDOurw7hYcRxWNrhfrULcwnDc46G+brOlYx4ntFY8Ir8Wz
 OQ5jW5yu8yfXwQjUImosVZmOgW+Hk7qJQIzWUu/u6Yul55V2b1FaiMKGQhvsRgUg8uLC
 ueQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=c3KmOuCM
Subject: Re: [Buildroot] [PATCH v7 3/8] package/libepoxy: remove gl/egl
 dependency
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
Content-Type: multipart/mixed; boundary="===============7659611538852569221=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7659611538852569221==
Content-Type: multipart/alternative; boundary="000000000000f17712065259c87b"

--000000000000f17712065259c87b
Content-Type: text/plain; charset="UTF-8"

Hello Arnout,

Sounds good, I'll repost after the release and include the Acked-by.

Best,
Joseph

On Thu, May 21, 2026, 14:03 Arnout Vandecappelle <arnout@rnout.be> wrote:

>
>
> On 16/05/2026 04:03, Joseph Kogut wrote:
> > Libepoxy is a library for handling OpenGL function pointer management.
> >
> > It has backends for egl/glx, which may at one point have been mandatory
> > to enable, but the library now builds with none of the above enabled
> > features, as seen below.
> >
> >    libepoxy 1.5.10
> >
> >      User defined options
> >        Cross files            :
> /home/joseph/br-test-pkg/arm-aarch64/build/libepoxy-1.5.10//buildroot-build/cross-compilation.conf
> >        b_pie                  : false
> >        b_staticpic            : true
> >        buildtype              : release
> >        build.cmake_prefix_path:
> /home/joseph/br-test-pkg/arm-aarch64/host/lib/cmake
> >        default_library        : shared
> >        docs                   : false
> >        egl                    : no
> >        glx                    : no
> >        libdir                 : lib
> >        build.pkg_config_path  :
> /home/joseph/br-test-pkg/arm-aarch64/host/lib/pkgconfig
> >        prefix                 : /usr
> >        strip                  : false
> >        tests                  : false
> >        x11                    : false
> >
> > Removing these dependencies allows for some applications that require it
> > as a build dependency, but otherwise can run headless or without GL, to
> > build and function, using other graphics APIs or display pipelines.
> >
> > Weston, for example, can still use Vulkan and DRM when linked to
> > libepoxy without GL/EGL/X11 support.
> >
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>
>   Looks good to me. However, now I applied the first two patches to
> master, so I
> can't really apply this one to next. Fortunately :-) I have some comments
> later
> in the series, so I'll just mark the rest as Changes Requested, and you
> can
> repost after the 2026.05 release and next is merged back in master.
>
>   When you do, you can add on this patch my
>
> Acked-by: Arnout Vanecappelle <arnout@rnout.be>
>
>   (BTW if you post it around June 8, you have the biggest chance that I'll
> actually pick it up and it won't be ignored for another six months.)
>
>   Regards,
>   Arnout
>
> > ---
> >   package/libepoxy/Config.in | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
> > index 9da190b895..4b23497d46 100644
> > --- a/package/libepoxy/Config.in
> > +++ b/package/libepoxy/Config.in
> > @@ -1,12 +1,12 @@
> >   config BR2_PACKAGE_LIBEPOXY
> >       bool "libepoxy"
> > -     depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
> >       select BR2_PACKAGE_XUTIL_UTIL_MACROS
> >       help
> >         Epoxy is a library for handling OpenGL function pointer
> >         management for you.
> >
> > -       https://github.com/anholt/libepoxy
> > +       It can be built without EGL or GLX support for packages
> > +       that use libepoxy as a mandatory dependency but do not need
> > +       OpenGL entry points at runtime.
> >
> > -comment "libepoxy needs an OpenGL and/or OpenGL EGL backend"
> > -     depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
> > +       https://github.com/anholt/libepoxy
> >
>
>

--000000000000f17712065259c87b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span class=3D"smart_draft_text">Hello Arnout,<br><br>Sou=
nds good, I&#39;ll repost after the release and include the Acked-by.<br><b=
r>Best,<br>Joseph</span></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 21, 2026, 14:03 A=
rnout Vandecappelle &lt;<a href=3D"mailto:arnout@rnout.be">arnout@rnout.be<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 16/05/2026 04:03, Joseph Kogut wrote:<br>
&gt; Libepoxy is a library for handling OpenGL function pointer management.=
<br>
&gt; <br>
&gt; It has backends for egl/glx, which may at one point have been mandator=
y<br>
&gt; to enable, but the library now builds with none of the above enabled<b=
r>
&gt; features, as seen below.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 libepoxy 1.5.10<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 User defined options<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cross files=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 : /home/joseph/br-test-pkg/arm-aarch64/build/libepoxy-1.5.10//bu=
ildroot-build/cross-compilation.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 b_pie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 : false<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 b_staticpic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 : true<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 buildtype=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 : release<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 build.cmake_prefix_path: /home/joseph/br-te=
st-pkg/arm-aarch64/host/lib/cmake<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 default_library=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
: shared<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 docs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: false<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 egl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 glx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0: lib<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 build.pkg_config_path=C2=A0 : /home/joseph/=
br-test-pkg/arm-aarch64/host/lib/pkgconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0: /usr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 strip=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 : false<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 : false<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 x11=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : false<br>
&gt; <br>
&gt; Removing these dependencies allows for some applications that require =
it<br>
&gt; as a build dependency, but otherwise can run headless or without GL, t=
o<br>
&gt; build and function, using other graphics APIs or display pipelines.<br=
>
&gt; <br>
&gt; Weston, for example, can still use Vulkan and DRM when linked to<br>
&gt; libepoxy without GL/EGL/X11 support.<br>
&gt; <br>
&gt; Signed-off-by: Joseph Kogut &lt;<a href=3D"mailto:joseph.kogut@gmail.c=
om" target=3D"_blank" rel=3D"noreferrer">joseph.kogut@gmail.com</a>&gt;<br>
<br>
=C2=A0 Looks good to me. However, now I applied the first two patches to ma=
ster, so I <br>
can&#39;t really apply this one to next. Fortunately :-) I have some commen=
ts later <br>
in the series, so I&#39;ll just mark the rest as Changes Requested, and you=
 can <br>
repost after the 2026.05 release and next is merged back in master.<br>
<br>
=C2=A0 When you do, you can add on this patch my<br>
<br>
Acked-by: Arnout Vanecappelle &lt;<a href=3D"mailto:arnout@rnout.be" target=
=3D"_blank" rel=3D"noreferrer">arnout@rnout.be</a>&gt;<br>
<br>
=C2=A0 (BTW if you post it around June 8, you have the biggest chance that =
I&#39;ll <br>
actually pick it up and it won&#39;t be ignored for another six months.)<br=
>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/libepoxy/Config.in | 8 ++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in<b=
r>
&gt; index 9da190b895..4b23497d46 100644<br>
&gt; --- a/package/libepoxy/Config.in<br>
&gt; +++ b/package/libepoxy/Config.in<br>
&gt; @@ -1,12 +1,12 @@<br>
&gt;=C2=A0 =C2=A0config BR2_PACKAGE_LIBEPOXY<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;libepoxy&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_=
HAS_LIBGL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XUTIL_UTIL_MACROS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Epoxy is a library for handling OpenG=
L function pointer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0management for you.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/anholt/libep=
oxy" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/anh=
olt/libepoxy</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0It can be built without EGL or GLX support=
 for packages<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0that use libepoxy as a mandatory dependenc=
y but do not need<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0OpenGL entry points at runtime.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -comment &quot;libepoxy needs an OpenGL and/or OpenGL EGL backend&quot=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_HAS_LIBEGL &amp;&amp; !BR=
2_PACKAGE_HAS_LIBGL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/anholt/libep=
oxy" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/anh=
olt/libepoxy</a><br>
&gt; <br>
<br>
</blockquote></div>

--000000000000f17712065259c87b--

--===============7659611538852569221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7659611538852569221==--
