Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB3CC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 19:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB8B560E9B;
	Fri,  7 Mar 2025 19:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aD72PeBfU8ib; Fri,  7 Mar 2025 19:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A096B6100B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A096B6100B;
	Fri,  7 Mar 2025 19:39:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67F991C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 537C184737
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87G8-MoJo6qp for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 19:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40387841CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40387841CB
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40387841CB
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:39:12 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-72a22b27cb3so1253505a34.2
 for <buildroot@buildroot.org>; Fri, 07 Mar 2025 11:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741376351; x=1741981151;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qNPBMrmmHqgRFHSISmKz7xPfbKsHMmX6VfDz0rFk8lg=;
 b=cADKQBKCFWKpYkQKLpzHohZw/hF4U3dWwNGouy+38TrzJGHD/5VRcD5HUygum365lH
 XT9T7Sjx6/fxuJBzn6oDk6vOIOKq9g+s07GkmQe5y+CEJ+dPT4sGImqMgXGz/aiSc5V4
 BWbvSTGgC6SkNEOdyTTKMI8RpGuXIXOMP2k+NGK8JmbCdW+xEwJvcfb+piLj6QYu2XS5
 ZueapwkY++w0f0Z9ClwhmyDNiQFRIlmzyjWn0cWgU7hS2TfFHOhzIGzWCQ3de0L5VxFI
 xMia35hkZjPYF0eh2+EVWwKaxyPoD7QUv6fkvdMjf89q5wpPaunqr4igsoJAsE/J929r
 Xy6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiXmR6/fbxUB7aF4a7gN4N3J+g2wRbKljlcr/VHKS2n1PdvnpxqdThkQg6lArJZs0f/NLKJd3rI8U=@buildroot.org
X-Gm-Message-State: AOJu0YxLLr99mySuEF3pve1T7csVdFj0Hkd0giXJriN+BtoKgAzsDAW+
 myOD3uSkc3i0WVpAF7Ro+oYP7Ad8C6X6uuD1qxAb3aDfDDNWiCtld4dLv/PyPJMM2n2RA3ClqmZ
 k
X-Gm-Gg: ASbGncsnj/tTeAkttUGuln6HmiRbmg30meBfPKzJ70UhRzCI3mRSqi19RjCVhUOi9mM
 tgL4qXlGLnErlKBaur7QRwZhsFfqk4LJnsCKLav+U8X465QDVTWrAECgHVjKN9YZUUz19Lk5OkZ
 sHD3y5VKllUAcs1IzmHFdeVXkcw4BT1OvvGs+MimQmUAY/68F2aAE/mpV/L4Vdd/+0JMhwo5v0v
 PoIir0leIOYcl3JF3yaE+MqMNQoyrPzM/XQsfUqTdWJKklEZeLWgln8jMRXvd3E1ZWOUJDZhGHW
 uORyZ7NsrOTT/r/hC85pZ8g2oD3qrqhyJDcwqtrlq06SbP4mis7IovlvPbIPk/IRtaoKeT0hllv
 b4L1uj0Nv
X-Google-Smtp-Source: AGHT+IEDyngNkU3mggUm0ZSCuzTZXgE2X3FqX2iAmtfau3bkz4YSVr4A/oraPYVfDu3QtLh7iALgLA==
X-Received: by 2002:a05:6830:a90:b0:726:fca9:bab with SMTP id
 46e09a7af769-72a37b37e71mr2784448a34.2.1741376350992; 
 Fri, 07 Mar 2025 11:39:10 -0800 (PST)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com.
 [209.85.160.47]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2c24883035bsm799572fac.5.2025.03.07.11.39.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 11:39:10 -0800 (PST)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-2c1ecda2910so1156589fac.3
 for <buildroot@buildroot.org>; Fri, 07 Mar 2025 11:39:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXTxjr/s+1WMOx9g4zjSAuweugXTdC1NKRxF3HvcOI1j+5kOqgX0DMiKFDA/5PFbZJrHiexPgEDe6g=@buildroot.org
X-Received: by 2002:a05:6870:ef03:b0:29e:62e5:9b55 with SMTP id
 586e51a60fabf-2c2610da07amr2488758fac.20.1741376350063; Fri, 07 Mar 2025
 11:39:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <dee1cb43f9e636b7ccdc7d4602ae0ab438952c3a.1740841539.git.yann.morin.1998@free.fr>
 <549206ba-180d-4ee1-9a5b-a9d99ab2d3d1@gmail.com>
In-Reply-To: <549206ba-180d-4ee1-9a5b-a9d99ab2d3d1@gmail.com>
Date: Fri, 7 Mar 2025 11:38:58 -0800
X-Gmail-Original-Message-ID: <CA+h8R2o4L0tMA1SWdp5PMxt3VjWzBj1hhQakK2805RKZ8JUMwQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqLTbeUKusB12eImO2SgMY4yFcYeR-ESOOZZYh7-CQn7p6wJUseQCwYsQI
Message-ID: <CA+h8R2o4L0tMA1SWdp5PMxt3VjWzBj1hhQakK2805RKZ8JUMwQ@mail.gmail.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 Buildroot Mailing List <buildroot@buildroot.org>, Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1741376351; x=1741981151; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qNPBMrmmHqgRFHSISmKz7xPfbKsHMmX6VfDz0rFk8lg=;
 b=Y96Spo0n2Pcv6b4c58uMKOz5lv4ME3hRfP5RUa8pW16JgIf3XvxOmrR8KDl1Puhdu0
 /eU5P7+is1z6WRoe3FBKpbf0YOVQdV6evDEy/XMQRqWY4b8y078XXhp7RZWe6tv+ZrPK
 JnS8+uc26LXCdu6EjYPQ9c0CAmcphGrLdH5+dCov91ZYaVZqol1gil4BDrACJwedDbJb
 scl9h6JxniPuN8Mq1ja04sU/IknhP0Au6MWzyi5/FGpeCpDtYyPgPMjmHsOB2gU4Baip
 29CjituNmhBt1JaHKPIlNf2I7p+BTog7zISXPe9k/VtlA0iFTeS724deCOEinntIiTdf
 1xLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=Y96Spo0n
Subject: Re: [Buildroot] [PATCH 9/9 v3] package/podman: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: multipart/mixed; boundary="===============7509006032982548881=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7509006032982548881==
Content-Type: multipart/alternative; boundary="000000000000c41f3d062fc5c669"

--000000000000c41f3d062fc5c669
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 7, 2025, 5:40=E2=80=AFAM Raphael Pavlidis <raphael.pavlidis@gma=
il.com>
wrote:

> Hello Yann, All,
>
> On 3/1/25 16:05, Yann E. MORIN wrote:
>
> I am sure that you do not need iptables if you are using nftables.
>
> [snip]
> > +             $(PODMAN_PKGDIR)/containers.conf \
> > +             $(TARGET_DIR)/etc/containers/containers.conf
> > +     $(Q)$(INSTALL) -D -m 0644 \
> > +             $(PODMAN_PKGDIR)/policy.json \
> > +             $(TARGET_DIR)/etc/containers/policy.json
> > +     $(Q)$(INSTALL) -D -m 0644 \
> > +             $(PODMAN_PKGDIR)/registries.conf \
> > +             $(TARGET_DIR)/etc/containers/registries.conf
>
> Just for curiosity, why not installing those files under
> /usr/share/containers?
>

I agree that as far as the defaults we install with the package, they
should go to /usr/share/containers

https://github.com/containers/common/blob/main/docs/containers.conf.5.md

Container engines read the /usr/share/containers/containers.conf,
/etc/containers/containers.conf, and
/etc/containers/containers.conf.d/*.conf for global configuration that
effects all users.

Otherwise looks good!

Best,
Christian

--000000000000c41f3d062fc5c669
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<br><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 7, 2025, 5:40=E2=
=80=AFAM Raphael Pavlidis &lt;<a href=3D"mailto:raphael.pavlidis@gmail.com"=
>raphael.pavlidis@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Hello Yann, All,<br>
<br>
On 3/1/25 16:05, Yann E. MORIN wrote:<br><br>
I am sure that you do not need iptables if you are using nftables.<br>
<br>
[snip]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PODMAN_PKGDIR)/cont=
ainers.conf \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/con=
tainers/containers.conf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(Q)$(INSTALL) -D -m 0644 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PODMAN_PKGDIR)/poli=
cy.json \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/con=
tainers/policy.json<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(Q)$(INSTALL) -D -m 0644 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PODMAN_PKGDIR)/regi=
stries.conf \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/con=
tainers/registries.conf<br>
<br>
Just for curiosity, why not installing those files under <br>
/usr/share/containers?<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">I agree that as far as the defaults we install with t=
he package, they should go to /usr/share/containers</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><a href=3D"https://github.com/containers/common=
/blob/main/docs/containers.conf.5.md">https://github.com/containers/common/=
blob/main/docs/containers.conf.5.md</a></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Container engines read the /usr/share/containers/containers=
.conf, /etc/containers/containers.conf, and /etc/containers/containers.conf=
.d/*.conf for global configuration that effects all users.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Otherwise looks good!</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Best,</div><div dir=3D"auto">Christian</di=
v></div>

--000000000000c41f3d062fc5c669--

--===============7509006032982548881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7509006032982548881==--
