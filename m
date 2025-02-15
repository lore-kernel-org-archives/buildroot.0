Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7C4C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 19:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9EE241270;
	Sat, 15 Feb 2025 19:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1TT0GmO-k5T; Sat, 15 Feb 2025 19:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9108540B6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9108540B6E;
	Sat, 15 Feb 2025 19:48:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE997DF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 19:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBDE7607C0
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 19:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B939gn5eS28s for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 19:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 966BD606D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 966BD606D0
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 966BD606D0
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 19:48:05 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2b8718226e9so1529595fac.3
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 11:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739648884; x=1740253684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8hm0DvMhYzIF/NcE8QZzZnMGNLgZuxDAe90CzCG3WfI=;
 b=C4uKFHLskFG6lSdSyYZv9Coy797Q6wHahX037+rGMcUjHiIdkYCkic/mLfLV19a+oK
 MJ798CRDllxoyHDudj4EnWLdJdkymTpJOjUjdDMwapSDF7s1VmbsfOO7tY0yJUh13S6P
 lxvcKrLQyrPjFIYBUeJhyMFVN80Z/QRhhE4xKq4l7qHjXqhHVgGiObm4iTu6eN6rUYgq
 gNu9vUT02I0COAbnfM7iXKzxy7cWuw+ozIzSKMCfa922WivSH1+Vt769UKJHqw5YWt34
 fIJSMYxoTB21krQU/X22DLfb3JktKbYnOltlkR4mbvN0w5XFYWgSNvfxK9ZfAK1ElGF/
 ab5w==
X-Gm-Message-State: AOJu0YyLoW0FM1d0k5ORqa7Ku33y0+YeGVCH81/9CQeKBhE4/fbg1rRP
 NSuCnrRLnNAd1rAOfpWWMqXCvnTdd2DpqYwhdhNOisZDP/n7/ltWzshBxvsX1Ou48LclVtBxF+D
 D
X-Gm-Gg: ASbGncs9X8xKxy1B/+HzriEe1XLkpjsZs/Hjdycu8QXWHCjRZbysMAPJs4G924kIzYr
 evkTYv6Xy/Wb0EhkYAoUh1S88QJq64lan1TDLw5mZjK9tjUIv68XqLftOq/J5pmlJwZBT3Qbbtp
 qdjJAcy+S8Cefy5o/r9kcPnnuY+8k49Y8zgPSyLdeeiycorj1yLc+uvQq3lEbBSzAj8jhbB1kof
 r4hog0sCTFI0BWdTvGqQt5CcUUAnUJsKKcXp+BV9uI/cTofhIMTc6X2kr+/5nyS3Zkbg3lT46wL
 KkH6o7L8mU7dJjOFJyQs0s7NIcq52MV/XZhKKSf5yNoMWTl00Eq16VBAFoA=
X-Google-Smtp-Source: AGHT+IFOPe4tLNbsrQ+E2wkt15nAkzALkl8MkwAEyy3/0LpC721FMAE4YqLEpp4QA54h6E2kozqWkw==
X-Received: by 2002:a05:6870:ac2b:b0:2a3:d9b3:3d01 with SMTP id
 586e51a60fabf-2bc99d41c05mr2343785fac.29.1739648883884; 
 Sat, 15 Feb 2025 11:48:03 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com.
 [209.85.167.177]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b95a6bf7b3sm2745992fac.32.2025.02.15.11.48.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2025 11:48:03 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3f3f149c334so134577b6e.1
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 11:48:02 -0800 (PST)
X-Received: by 2002:a05:6808:1396:b0:3f3:dd2f:6a9b with SMTP id
 5614622812f47-3f3eb137a10mr1796086b6e.30.1739648882703; Sat, 15 Feb 2025
 11:48:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1739615626.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1739615626.git.yann.morin.1998@free.fr>
Date: Sat, 15 Feb 2025 11:47:52 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rQMP8-Zaz579C-q8=fzKqforCqbPUSGZNR986+VpOa-A@mail.gmail.com>
X-Gm-Features: AWEUYZk_e1tHl35T_h6zmvL8MetBjns04LjztAZgrjNJ3PENdTZ2TA9rnRpqRxk
Message-ID: <CA+h8R2rQMP8-Zaz579C-q8=fzKqforCqbPUSGZNR986+VpOa-A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Buildroot Mailing List <buildroot@buildroot.org>,
 Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1739648884; x=1740253684; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8hm0DvMhYzIF/NcE8QZzZnMGNLgZuxDAe90CzCG3WfI=;
 b=BkCSqnLrJ9W1FOfyvrWbpMt3Snm7sfGYjIrUz9i9KAm667MwNP+txAbNaWAOzRJRwf
 ndDQR2tLl1UvgK/yn4WA6prcF/RGboxweM9tZNIUN2SLbaA+/2GMrNKyTL/A6K2BYcd0
 sCdab1aysABwx/I36SOcOpCTVlEKFm65sa427ClUoVxA5BLBnfz2bJq8Q62X/YYST3W2
 FMfrukrEoQ9+Tvj+m5DenDxTzLDcix6hSmVnRDrfdz0eFF2BWcq6hSLIuUJ2NLJOcoGF
 fhELWL54+oVrOY2zePuKjbNEQlMqBoWgEyMSEd/E88IF5Ggnzq7ufjLhM+nmK7RKhVKt
 Dxxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=BkCSqnLr
Subject: Re: [Buildroot] [PATCH 0/4] package/catatonit: update,
 and use as init or docker init (branch yem/docker-init)
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
Content-Type: multipart/mixed; boundary="===============2568278711328570745=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2568278711328570745==
Content-Type: multipart/alternative; boundary="000000000000b00d28062e3391b2"

--000000000000b00d28062e3391b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

On Sat, Feb 15, 2025, 2:33=E2=80=AFAM Yann E. MORIN <yann.morin.1998@free.f=
r> wrote:

> ----------------------------------------------------------------
> Yann E. MORIN (4):
>       package/docker-engine: carry the tini init symlink
>       package/docker-engine: add option to support catatonit as init
>       package/catatonit: update to version 0.2.1
>       system: add catatonit as init system
>
>  Config.in.legacy                                   |  9 ++++
>  .../catatonit/0001-fix-build-with-kernel-5.9.patch | 49
> ----------------------
>  package/catatonit/catatonit.hash                   |  2 +-
>  package/catatonit/catatonit.mk                     |  2 +-
>  package/docker-engine/Config.in                    | 32 +++++++++++---
>  package/docker-engine/docker-engine.mk             | 10 +++++
>  package/tini/tini.mk                               |  2 -
>  system/Config.in                                   | 10 +++++
>  8 files changed, 58 insertions(+), 58 deletions(-)
>  delete mode 100644 package/catatonit/0001-fix-build-with-kernel-5.9.patc=
h
>


Patch series lgtm. Thanks!

Reviewed-by: Christian Stewart <christian@aperture.us>

--000000000000b00d28062e3391b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Yann,<br><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 15, 2025, 2:=
33=E2=80=AFAM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">=
yann.morin.1998@free.fr</a>&gt; wrote:</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
----------------------------------------------------------------<br>
Yann E. MORIN (4):<br>
=C2=A0 =C2=A0 =C2=A0 package/docker-engine: carry the tini init symlink<br>
=C2=A0 =C2=A0 =C2=A0 package/docker-engine: add option to support catatonit=
 as init<br>
=C2=A0 =C2=A0 =C2=A0 package/catatonit: update to version 0.2.1<br>
=C2=A0 =C2=A0 =C2=A0 system: add catatonit as init system<br>
<br>
=C2=A0Config.in.legacy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 9 ++++<br>
=C2=A0.../catatonit/0001-fix-build-with-kernel-5.9.patch | 49 -------------=
---------<br>
=C2=A0package/catatonit/catatonit.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0package/catatonit/<a href=3D"http://catatonit.mk" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">catatonit.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0package/docker-engine/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32 +++++++++++---<br>
=C2=A0package/docker-engine/<a href=3D"http://docker-engine.mk" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">docker-engine.mk</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++<br>
=C2=A0package/tini/<a href=3D"http://tini.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">tini.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2=
 -<br>
=C2=A0system/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
10 +++++<br>
=C2=A08 files changed, 58 insertions(+), 58 deletions(-)<br>
=C2=A0delete mode 100644 package/catatonit/0001-fix-build-with-kernel-5.9.p=
atch<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Patch series lgtm. Thanks!</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Reviewed-by: Christian Stewart &lt;<a hr=
ef=3D"mailto:christian@aperture.us">christian@aperture.us</a>&gt;</div></di=
v>

--000000000000b00d28062e3391b2--

--===============2568278711328570745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2568278711328570745==--
