Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED1E6E815
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 06:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5B760860;
	Wed,  4 Feb 2026 06:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjDIahu3SqXg; Wed,  4 Feb 2026 06:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C95760A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770185507;
	bh=E8ZjsD7ltH1Y+nCgE0J+H1QoPhJT6pTNwBx400VoLuM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rLw64mYX7C6NtBuyVV019xAbPmG7sMFsP04x2DMvlYoMnGN6vUjt+Uk8lcVjl0kbZ
	 rFff92aeXewz7SEq1lRqDwMQamA9V6GZ0hMyxjH75E1akP+em3WCyuPIYhHo+hE3T0
	 XPrmKt9D1ZoyaICa3JZxuuFxkjs11c0hVwN7NCBjErjsKyAAjB58yUp7K15jWsRXLE
	 7z05C2UeAZuxK2LM23ihrFYEynFcR+Q8NQAvUlT9rFAQe0ipxbIT1FwMMcHTQDOWw2
	 YZZHbWwlwKQMy0DqnYrYHyrqUJkpWo9OIZ0hjfGTf9ZOmv5c3D4OTKBbxfPc6gSN/b
	 zfyShmoaKzEAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C95760A4C;
	Wed,  4 Feb 2026 06:11:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FBE9F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 06:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D5A260A4C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 06:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id leutaIxgMDRg for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 06:11:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.219.53;
 helo=mail-qv1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B3E8E60860
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3E8E60860
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3E8E60860
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 06:11:44 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-88a367a1dbbso99599046d6.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 22:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770185503; x=1770790303;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ou+vjHP2EI/+2p4qUqhBr1U674dzOo+oGZf/J0Y1jyU=;
 b=twx2Krrr2QvLXtvpM+Hir5sAu4189u5HkR/f4QJcvcNfpiznReE9mnH5ffcITphsfW
 p5cAfW4rqbk1RXCHNQ5Ck3dA9ziI9Vi6x4LiPDO6LQgGn1JduMfrtTYa/0Q/tUagRjM7
 E5ykc5AEpVNG6V/w/1kr5TiyNp2fuYv7zp7KZY8XSu3vM/x8N1koY94eUpGzDnsHJM3G
 5re2FWAAHtU6fMOI/vkjTxk+r+NDD+5xQTYQlVnqHY6hroyUMw1hmH9do96xmHQcIWnl
 zodh1DiVV7STjwnFiyGcjmB3FGqZoFzzB02ndqE4/oeKUYMpselMjDZByiRLdMDdqCIU
 1C8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4ZkMaesckHzs2vpAWDJ0HSH3eYrhqUU0Ix/4mGau+2ceIyd6laJ6V+6SBMMOZoQcDqX1d2P2oWUY=@buildroot.org
X-Gm-Message-State: AOJu0YxrIJs5NfEyqwP5s8pZMkxwZTSZVM4y7toxvGuTGYlld0FBbSYX
 VROYC20K25iNhlFklh8GtjLlYVs8ihAwFkKQZwe737se/TwZLpDnf67s3plLLg==
X-Gm-Gg: AZuq6aJphVeiRRFvpto6UwYL20zk62LICmMECNOM2Otm60P+FKtLuD/dbgBB5ouhtfa
 PBCunocupAhNa8BLGad4qIw2kvu7PTm8yA3kiAmrmMncPmatkkhxYGYRWgU/X0/fjeFTOTETZ2S
 xpF1TfbKGcd5y3dNFU/BCn7FjCwPnvD0je7y7x++p/m9VHVrQo/BZxeqevgWsI0ZLmq0YkJO4PE
 aHy5nG62Q30kUlvGuYnwH3UJOM6FGlKhNHoGnB2ltXnt2bPIGuEQkLIsHUlUoFaTBVPPxOzf0sC
 zZ91Tohi8sXXxbpiWle9mLUon3CU3vHmP6Cl13hka/EwI5gfxWElXVBzbkf2Pq/VuoThaPAXciO
 KVeNCAENQYCI5ALa82lK8XrZs6c3A0+gPaDpQkU1cbMfWzAetG0sjRIKcWO8M25j7hOY7p6ORdI
 kJeC1y9MQWz4mmdEpBdqoaa0wdNkvoGtQOC22E7bnyh9iF/z37Welz8uXIet33rnxvNDVvrAoeH
 W9PGAiz6lM=
X-Received: by 2002:a05:622a:1308:b0:4f1:83e3:c058 with SMTP id
 d75a77b69052e-5061c13fcb3mr21105991cf.30.1770185503000; 
 Tue, 03 Feb 2026 22:11:43 -0800 (PST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5061c1632e5sm10684541cf.12.2026.02.03.22.11.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 22:11:42 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-5033a2c4b81so76154901cf.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 22:11:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWpekz52pIE5lUYY0A5YN58jktKEFVUSrCROu9HCjSLTxYcaIcKRN6LklmEYUVEacjpeOtHynWCo0g=@buildroot.org
X-Received: by 2002:a05:622a:14cb:b0:4ed:dec2:301a with SMTP id
 d75a77b69052e-5061c0d51camr26047591cf.16.1770185502367; Tue, 03 Feb 2026
 22:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20251226101445.2b29f439@windsurf>
 <20260103084002.2045193-1-thomas@devoogdt.com>
 <20260103084002.2045193-2-thomas@devoogdt.com>
 <dc38e220-92ea-4cd7-a178-2792ebc289a6@smile.fr>
In-Reply-To: <dc38e220-92ea-4cd7-a178-2792ebc289a6@smile.fr>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 4 Feb 2026 07:11:30 +0100
X-Gmail-Original-Message-ID: <CACXRmJiaRH-8v_ngEN=c4Ld+cbeQr43Y22Tz2g9YJTY-uEDroQ@mail.gmail.com>
X-Gm-Features: AZwV_QgLgd9eELV4av_wGzWP64Fh3rzERfZVqK95kVwYOaur6303096_XwK5YKU
Message-ID: <CACXRmJiaRH-8v_ngEN=c4Ld+cbeQr43Y22Tz2g9YJTY-uEDroQ@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org,
 bernd@kuhls.net, romain.naour@gmail.com, thomas.devoogdt@barco.com, 
 thomas.petazzoni@bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v2 2/2] package/mesa3d: fix compilation with
 host-llvm enabled
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
Content-Type: multipart/mixed; boundary="===============7035899885852100815=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7035899885852100815==
Content-Type: multipart/alternative; boundary="0000000000000e260c0649f96e0f"

--0000000000000e260c0649f96e0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Romain,

Resending it, as my other mail address is not trusted by the mailing list.


I noticed this problem when compiling the 2025.02 branch, which is still on
LLVM 15.0.7. My PC ships with LLVM 18.1.3. So, BR was trying to use a newer
config version (18.1.3) as it was shipping. See error log. In the meantime,
master has evolved, and ships with LLVM 21.1.8, with that combination, no
problem persists as the available versions are always newer than my own PC.

So in short, you won't see any problem if your host LLVM is older than the
version which is trying to be built.

But what I don't understand is why the right LLVM is found on your host PC.
A quick look at
https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=
=3Dheads
doesn't
teach me anything. And for meson, I don't see recent commits that might
have changed something
https://github.com/mesonbuild/meson/commits/master/mesonbuild/dependencies/=
data/CMakeListsLLVM.txt
.


Kr,

Thomas Devoogdt

Op di 3 feb 2026 om 18:50 schreef Romain Naour <romain.naour@smile.fr>:

> Hello Thomas, All,
>
> Le 03/01/2026 =C3=A0 09:40, Thomas Devoogdt a =C3=A9crit :
> > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> >
> > Meson's custom LLVM parser uses llvm-config with a default search path =
of
> > /usr/bin, causing it to detect the host system's llvm-config (version
> 18.1.3)
> > instead of the buildroot-compiled one. This forces all LLVM-related
> packages to
> > match version 18.1.3, but since the host system lacks llvmspirvlib, the
> build
> > fails. This patch forces Meson to use the buildroot-compiled llvm-confi=
g.
> >
> > Note that LLVM_CONFIG is a CMake option, not a Meson one. This is becau=
se
> > Meson has custom dependency resolution logic for LLVM (see
> > https://mesonbuild.com/Dependencies.html#llvm). The EXTRA_BINARIES
> mechanism
> > cannot be used here, as it only applies to cross-compilation scenarios,
> which
> > does not apply to host-mesa3d builds.
> >
> > Fixes:
> >
> >   llvm-config found: YES (/usr/bin/llvm-config-18) 18.1.3
>
> llvm-config is installed on my host
>
> $ which llvm-config
> /usr/bin/llvm-config
>
> $ llvm-config --version
> 19.1.7
>
> But building host-mesa3d is able to find the one built by Buildroot and
> installed in HOST_DIR:
>
> llvm-config found: YES ([...]/host/bin/llvm-config) 21.1.8
>
> >   Run-time dependency LLVM (modules: bitwriter, core, coverage, engine,
> executionengine, instcombine, irreader, libdriver, linker, lto,
> mcdisassembler, mcjit, native, option, scalaropts, target, transformutils=
,
> all-targets, coroutines, frontenddriver, frontendhlsl, lto, windowsdriver=
)
> found: YES 18.1.3
> >   Dependency LLVMSPIRVLib found: NO. Found 15.0.0.0 but need: '>=3D 18.=
1'
> ; matched: '>=3D 15.0.0.0', '< 18.2'
> >   Run-time dependency llvmspirvlib found: NO (tried cmake)
> >
> >   output/build/host-mesa3d-25.0.6/meson.build:1882:21: ERROR: Dependenc=
y
> lookup for LLVMSPIRVLib with method 'pkgconfig' failed: Invalid version,
> need 'LLVMSPIRVLib' ['>=3D 18.1'] found '15.0.0.0'.
>
> is this issue specific to this mesa3d version (25.0.6) ?
>
> We are using mesa3d 25.3.4 already.
>
> >
> >   A full log can be found at
> /home/thomas/buildroot/output/build/host-mesa3d-25.0.6/buildroot-build/me=
son-logs/meson-log.txt
> >   make[1]: *** [package/pkg-generic.mk:263:
> /home/thomas/buildroot/output/build/host-mesa3d-25.0.6/.stamp_configured]
> Error 1
> >   make: *** [Makefile:83: _all] Error 2
> >
> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > ---
> > v2: Moved patch to the generic host-mesa3d section.
> >     Also updated the git message wrt LLVM_CONFIG option.
> > ---
> >  package/mesa3d/mesa3d.mk | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> > index 09b098628ab..da380b3b389 100644
> > --- a/package/mesa3d/mesa3d.mk
> > +++ b/package/mesa3d/mesa3d.mk
> > @@ -292,6 +292,9 @@ ifeq
> ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION),y)
> >  HOST_MESA3D_TOOLS +=3D imagination
> >  endif
> >
> > +HOST_MESA3D_CONF_ENV =3D \
> > +     LLVM_CONFIG=3D"$(HOST_DIR)/bin/llvm-config"
>
> Otherwise looks ok for me.
>
> Best regards,
> Romain
>
>
> > +
> >  HOST_MESA3D_CONF_OPTS =3D \
> >       -Dglvnd=3Ddisabled \
> >       -Dgallium-drivers=3D$(subst
> $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
>
>
>
>

--0000000000000e260c0649f96e0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"border:0px;font-variant-num=
eric:inherit;font-variant-east-asian:inherit;font-variant-alternates:inheri=
t;font-stretch:inherit;font-size:12pt;line-height:inherit;font-family:Aptos=
,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-s=
ize-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;margi=
n:0px;padding:0px;vertical-align:baseline;color:black">Hi Romain,</div><div=
 style=3D"border:0px;font-variant-numeric:inherit;font-variant-east-asian:i=
nherit;font-variant-alternates:inherit;font-stretch:inherit;font-size:12pt;=
line-height:inherit;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size-adjust:inherit;font-kerning:inheri=
t;font-feature-settings:inherit;margin:0px;padding:0px;vertical-align:basel=
ine;color:black"><br></div><div style=3D"border:0px;font-variant-numeric:in=
herit;font-variant-east-asian:inherit;font-variant-alternates:inherit;font-=
stretch:inherit;font-size:12pt;line-height:inherit;font-family:Aptos,Aptos_=
EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size-adj=
ust:inherit;font-kerning:inherit;font-feature-settings:inherit;margin:0px;p=
adding:0px;vertical-align:baseline;color:black">Resending it, as my other m=
ail address is not trusted by the mailing list.</div><div style=3D"border:0=
px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-varian=
t-alternates:inherit;font-stretch:inherit;font-size:12pt;line-height:inheri=
t;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetic=
a,sans-serif;font-size-adjust:inherit;font-kerning:inherit;font-feature-set=
tings:inherit;margin:0px;padding:0px;vertical-align:baseline;color:black"><=
br></div><div style=3D"border:0px;font-variant-numeric:inherit;font-variant=
-east-asian:inherit;font-variant-alternates:inherit;font-stretch:inherit;fo=
nt-size:12pt;line-height:inherit;font-family:Aptos,Aptos_EmbeddedFont,Aptos=
_MSFontService,Calibri,Helvetica,sans-serif;font-size-adjust:inherit;font-k=
erning:inherit;font-feature-settings:inherit;margin:0px;padding:0px;vertica=
l-align:baseline;color:black"><br></div><div style=3D"border:0px;font-varia=
nt-numeric:inherit;font-variant-east-asian:inherit;font-variant-alternates:=
inherit;font-stretch:inherit;font-size:12pt;line-height:inherit;font-family=
:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;=
font-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit=
;margin:0px;padding:0px;vertical-align:baseline;color:black">I noticed this=
 problem when compiling the 2025.02 branch, which is still on LLVM 15.0.7. =
My PC ships with LLVM 18.1.3. So, BR was trying to use a newer config versi=
on (18.1.3) as it was shipping. See error log. In the meantime, master has =
evolved, and ships with LLVM 21.1.8, with that combination, no problem pers=
ists as the available versions are always newer than my own PC.</div><div s=
tyle=3D"border:0px;font-variant-numeric:inherit;font-variant-east-asian:inh=
erit;font-variant-alternates:inherit;font-stretch:inherit;font-size:12pt;li=
ne-height:inherit;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size-adjust:inherit;font-kerning:inherit;=
font-feature-settings:inherit;margin:0px;padding:0px;vertical-align:baselin=
e;color:black"><br></div><div style=3D"border:0px;font-variant-numeric:inhe=
rit;font-variant-east-asian:inherit;font-variant-alternates:inherit;font-st=
retch:inherit;font-size:12pt;line-height:inherit;font-family:Aptos,Aptos_Em=
beddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size-adjus=
t:inherit;font-kerning:inherit;font-feature-settings:inherit;margin:0px;pad=
ding:0px;vertical-align:baseline;color:black">So in short, you won&#39;t se=
e any problem if your host LLVM is older than the version which is trying t=
o be built.=C2=A0</div><div style=3D"border:0px;font-variant-numeric:inheri=
t;font-variant-east-asian:inherit;font-variant-alternates:inherit;font-stre=
tch:inherit;font-size:12pt;line-height:inherit;font-family:Aptos,Aptos_Embe=
ddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size-adjust:=
inherit;font-kerning:inherit;font-feature-settings:inherit;margin:0px;paddi=
ng:0px;vertical-align:baseline;color:black"><br></div><div style=3D"border:=
0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-varia=
nt-alternates:inherit;font-stretch:inherit;font-size:12pt;line-height:inher=
it;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helveti=
ca,sans-serif;font-size-adjust:inherit;font-kerning:inherit;font-feature-se=
ttings:inherit;margin:0px;padding:0px;vertical-align:baseline;color:black">=
But what I don&#39;t understand is why the right LLVM is found on your host=
 PC. A quick look at=C2=A0<a id=3D"gmail-OWAa32cdc72-06b4-790f-79e6-43d7a4e=
f9134" rel=3D"noopener noreferrer" target=3D"_blank" href=3D"https://gitlab=
.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=3Dheads" title=
=3D"https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_ty=
pe=3Dheads" style=3D"border:0px;font:inherit;margin:0px;padding:0px;vertica=
l-align:baseline">https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meso=
n.build?ref_type=3Dheads</a>=C2=A0doesn&#39;t teach me anything. And for me=
son, I don&#39;t see recent commits that might have changed something=C2=A0=
<a rel=3D"noopener noreferrer" target=3D"_blank" href=3D"https://github.com=
/mesonbuild/meson/commits/master/mesonbuild/dependencies/data/CMakeListsLLV=
M.txt" title=3D"https://github.com/mesonbuild/meson/commits/master/mesonbui=
ld/dependencies/data/CMakeListsLLVM.txt" style=3D"border:0px;font:inherit;m=
argin:0px;padding:0px;vertical-align:baseline">https://github.com/mesonbuil=
d/meson/commits/master/mesonbuild/dependencies/data/CMakeListsLLVM.txt</a>.=
=C2=A0</div><div style=3D"border:0px;font-variant-numeric:inherit;font-vari=
ant-east-asian:inherit;font-variant-alternates:inherit;font-stretch:inherit=
;font-size:12pt;line-height:inherit;font-family:Aptos,Aptos_EmbeddedFont,Ap=
tos_MSFontService,Calibri,Helvetica,sans-serif;font-size-adjust:inherit;fon=
t-kerning:inherit;font-feature-settings:inherit;margin:0px;padding:0px;vert=
ical-align:baseline;color:black"><br></div><div style=3D"border:0px;font-va=
riant-numeric:inherit;font-variant-east-asian:inherit;font-variant-alternat=
es:inherit;font-stretch:inherit;font-size:12pt;line-height:inherit;font-fam=
ily:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-ser=
if;font-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inhe=
rit;margin:0px;padding:0px;vertical-align:baseline;color:black"><br></div><=
div style=3D"border:0px;font-variant-numeric:inherit;font-variant-east-asia=
n:inherit;font-variant-alternates:inherit;font-stretch:inherit;font-size:12=
pt;line-height:inherit;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontSer=
vice,Calibri,Helvetica,sans-serif;font-size-adjust:inherit;font-kerning:inh=
erit;font-feature-settings:inherit;margin:0px;padding:0px;vertical-align:ba=
seline;color:black">Kr,</div><div style=3D"border:0px;font-variant-numeric:=
inherit;font-variant-east-asian:inherit;font-variant-alternates:inherit;fon=
t-stretch:inherit;font-size:12pt;line-height:inherit;font-family:Aptos,Apto=
s_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size-a=
djust:inherit;font-kerning:inherit;font-feature-settings:inherit;margin:0px=
;padding:0px;vertical-align:baseline;color:black"><br></div><div style=3D"b=
order:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font=
-variant-alternates:inherit;font-stretch:inherit;font-size:12pt;line-height=
:inherit;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,H=
elvetica,sans-serif;font-size-adjust:inherit;font-kerning:inherit;font-feat=
ure-settings:inherit;margin:0px;padding:0px;vertical-align:baseline;color:b=
lack">Thomas Devoogdt</div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">Op di 3 feb 2026 om 18:50 =
schreef Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr">romain.na=
our@smile.fr</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hello Thomas, All,<br>
<br>
Le 03/01/2026 =C3=A0 09:40, Thomas Devoogdt a =C3=A9crit=C2=A0:<br>
&gt; From: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@barco.com"=
 target=3D"_blank">thomas.devoogdt@barco.com</a>&gt;<br>
&gt; <br>
&gt; Meson&#39;s custom LLVM parser uses llvm-config with a default search =
path of<br>
&gt; /usr/bin, causing it to detect the host system&#39;s llvm-config (vers=
ion 18.1.3)<br>
&gt; instead of the buildroot-compiled one. This forces all LLVM-related pa=
ckages to<br>
&gt; match version 18.1.3, but since the host system lacks llvmspirvlib, th=
e build<br>
&gt; fails. This patch forces Meson to use the buildroot-compiled llvm-conf=
ig.<br>
&gt; <br>
&gt; Note that LLVM_CONFIG is a CMake option, not a Meson one. This is beca=
use<br>
&gt; Meson has custom dependency resolution logic for LLVM (see<br>
&gt; <a href=3D"https://mesonbuild.com/Dependencies.html#llvm" rel=3D"noref=
errer" target=3D"_blank">https://mesonbuild.com/Dependencies.html#llvm</a>)=
. The EXTRA_BINARIES mechanism<br>
&gt; cannot be used here, as it only applies to cross-compilation scenarios=
, which<br>
&gt; does not apply to host-mesa3d builds.<br>
&gt; <br>
&gt; Fixes:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0llvm-config found: YES (/usr/bin/llvm-config-18) 18.1.3<br=
>
<br>
llvm-config is installed on my host<br>
<br>
$ which llvm-config<br>
/usr/bin/llvm-config<br>
<br>
$ llvm-config --version<br>
19.1.7<br>
<br>
But building host-mesa3d is able to find the one built by Buildroot and<br>
installed in HOST_DIR:<br>
<br>
llvm-config found: YES ([...]/host/bin/llvm-config) 21.1.8<br>
<br>
&gt;=C2=A0 =C2=A0Run-time dependency LLVM (modules: bitwriter, core, covera=
ge, engine, executionengine, instcombine, irreader, libdriver, linker, lto,=
 mcdisassembler, mcjit, native, option, scalaropts, target, transformutils,=
 all-targets, coroutines, frontenddriver, frontendhlsl, lto, windowsdriver)=
 found: YES 18.1.3<br>
&gt;=C2=A0 =C2=A0Dependency LLVMSPIRVLib found: NO. Found 15.0.0.0 but need=
: &#39;&gt;=3D 18.1&#39; ; matched: &#39;&gt;=3D 15.0.0.0&#39;, &#39;&lt; 1=
8.2&#39;<br>
&gt;=C2=A0 =C2=A0Run-time dependency llvmspirvlib found: NO (tried cmake)<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0output/build/host-mesa3d-25.0.6/meson.build:1882:21: ERROR=
: Dependency lookup for LLVMSPIRVLib with method &#39;pkgconfig&#39; failed=
: Invalid version, need &#39;LLVMSPIRVLib&#39; [&#39;&gt;=3D 18.1&#39;] fou=
nd &#39;15.0.0.0&#39;.<br>
<br>
is this issue specific to this mesa3d version (25.0.6) ?<br>
<br>
We are using mesa3d 25.3.4 already.<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0A full log can be found at /home/thomas/buildroot/output/b=
uild/host-mesa3d-25.0.6/buildroot-build/meson-logs/meson-log.txt<br>
&gt;=C2=A0 =C2=A0make[1]: *** [package/<a href=3D"http://pkg-generic.mk:263=
" rel=3D"noreferrer" target=3D"_blank">pkg-generic.mk:263</a>: /home/thomas=
/buildroot/output/build/host-mesa3d-25.0.6/.stamp_configured] Error 1<br>
&gt;=C2=A0 =C2=A0make: *** [Makefile:83: _all] Error 2<br>
&gt; <br>
&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@b=
arco.com" target=3D"_blank">thomas.devoogdt@barco.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Moved patch to the generic host-mesa3d section.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Also updated the git message wrt LLVM_CONFIG option=
.<br>
&gt; ---<br>
&gt;=C2=A0 package/mesa3d/<a href=3D"http://mesa3d.mk" rel=3D"noreferrer" t=
arget=3D"_blank">mesa3d.mk</a> | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/mesa3d/<a href=3D"http://mesa3d.mk" rel=3D"norefe=
rrer" target=3D"_blank">mesa3d.mk</a> b/package/mesa3d/<a href=3D"http://me=
sa3d.mk" rel=3D"noreferrer" target=3D"_blank">mesa3d.mk</a><br>
&gt; index 09b098628ab..da380b3b389 100644<br>
&gt; --- a/package/mesa3d/<a href=3D"http://mesa3d.mk" rel=3D"noreferrer" t=
arget=3D"_blank">mesa3d.mk</a><br>
&gt; +++ b/package/mesa3d/<a href=3D"http://mesa3d.mk" rel=3D"noreferrer" t=
arget=3D"_blank">mesa3d.mk</a><br>
&gt; @@ -292,6 +292,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATI=
ON),y)<br>
&gt;=C2=A0 HOST_MESA3D_TOOLS +=3D imagination<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +HOST_MESA3D_CONF_ENV =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LLVM_CONFIG=3D&quot;$(HOST_DIR)/bin/llvm-config&q=
uot;<br>
<br>
Otherwise looks ok for me.<br>
<br>
Best regards,<br>
Romain<br>
<br>
<br>
&gt; +<br>
&gt;=C2=A0 HOST_MESA3D_CONF_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dglvnd=3Ddisabled \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgallium-drivers=3D$(subst $(space),$(comma=
),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000000e260c0649f96e0f--

--===============7035899885852100815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7035899885852100815==--
