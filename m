Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88B6C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 12:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E33C840108;
	Thu, 27 Jun 2024 12:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5farWyOPFnX; Thu, 27 Jun 2024 12:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 702A94025C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 702A94025C;
	Thu, 27 Jun 2024 12:49:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3F1D1BF3D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 12:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD79E40C27
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 12:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ir0lXrcRpGXP for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 12:49:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D227340BE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D227340BE3
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D227340BE3
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 12:49:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4217c7eb6b4so63835755e9.2
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 05:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719492552; x=1720097352;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uevz3FLz0UXErbNC+9doZ4poTT/Oumqs95L7Prc04k4=;
 b=Mcieh4MZHEhfx0xGe2jFPYP8GGBe6Sj4mq+v2OrLMpHuVfOVVO7guTw8v3wl49QTyo
 bRRTI1rmEM/DPxDbRQzMgZvMDDewLVAdd4T5hsr9LmmALNB0OUJfEopBLGiEjOiLG/+Y
 0riyDi7++XIegEMIXSErR5W+F63q77ljEA2zaq2sOn9GVhZA4awq4YK7uIyIly5VaEMO
 6RjzAT5Lj+gmz4aU+11FGzuKh8hbJRgH8UFabOApbNKZZJxRncdXQuJop90q9dZnm15f
 phXs9sd1OVwLogUf1Pg5KyU77smrxZ51AeIhefn3jKWu930zkhSR5zrT4EHyx03e4nhT
 634g==
X-Gm-Message-State: AOJu0Ywg8U9Iz1Eim6Sig2LtTTgNjL5jWJTnz2bUETNmaIu1rjz91K13
 K10qfyRCCI65rn5lrsyGsCtyIQTiddF6lOt8AZpEKZA6P46h96tDDVrN1mMwlwodTAWFl+upxJu
 XcG4e+dwqVbtZgVrQgcCdZO3htOE=
X-Google-Smtp-Source: AGHT+IGGnAyHmXkIJGx2Jn5DL3G7BJ41aO9qZ4BFVGfhwOTrN28RyAz23aCGj7K5Hkpv4hHEBfNi6mmXcUuc6w8Tffw=
X-Received: by 2002:a5d:5f8e:0:b0:366:ebd1:3bbf with SMTP id
 ffacd0b85a97d-366ebd13c07mr11111472f8f.2.1719492551470; Thu, 27 Jun 2024
 05:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240626171922.718270-1-fiona.klute@gmx.de>
In-Reply-To: <20240626171922.718270-1-fiona.klute@gmx.de>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 27 Jun 2024 14:48:34 +0200
Message-ID: <CA+TH9VntDn0Z3-ey0xb5fqvaEYmhyaowwjGnsswq37J-86-rGQ@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719492552; x=1720097352; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uevz3FLz0UXErbNC+9doZ4poTT/Oumqs95L7Prc04k4=;
 b=nBUwqwJfvCFViy/yky7TXtQNhEJMrMsz1b2h1S1nMm2WU4NSgNpyNMBPv/BqqQPf5k
 v4YuhczUL/Fjd3bg1A+cHL6OYWr5piMmliAje05sIqdxcgCvNPXcrai9/grqFjdc7ZrR
 wUnxh2UOn6vsR46WUrjBsxBsJGsNNWmwhK0CSMVdunc+jKZ/kf78XE2h1vJ1gtO5ff0x
 NfwSMf/TU5m4VqnNnqVzbM5+TTxniDf0p6GH4FSejP8m8JprSoem/0sGCYMBEjACcVec
 2ms4nbA13YMutvHLysbROtjQLNEnUvj+toIrK+cBhL27fc8YSYr10MN87QdRlfoMHBw/
 +VdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nBUwqwJf
Subject: Re: [Buildroot] [PATCH 0/3] Update fail2ban to 1.1.0,
 add dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0211766447336051020=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0211766447336051020==
Content-Type: multipart/alternative; boundary="000000000000b97583061bde8e99"

--000000000000b97583061bde8e99
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 26 giu 2024 alle ore 19:19 Fiona Klute <fiona.klute@gmx.de>
ha scritto:

> This patch series (unfortunately still not merged) by Angelo
> Compagnucci fixed the fail2ban 1.0.2 build:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=403756
>
> However it broke again with Python 3.12 due to incompatibilities in
> upstream code. The 1.1.0 release fixes those, unfortunately it still
> requires ported asyncore and asynchat modules. This series builds on
> Angelo's (must be merged after) and updates fail2ban to 1.1.0 after
> adding the required compatibility packages.
>

Thanks for the job! Very good indeed!


> Fiona Klute (3):
>   package/python-pyasyncore: new package
>   package/python-pyasynchat: new package
>   package/fail2ban: bump version to 1.1.0
>
>  package/Config.in                                |  2 ++
>  package/fail2ban/Config.in                       |  1 +
>  package/fail2ban/fail2ban.hash                   |  2 +-
>  package/fail2ban/fail2ban.mk                     | 15 ++++++++-------
>  package/python-pyasynchat/Config.in              | 11 +++++++++++
>  package/python-pyasynchat/python-pyasynchat.hash |  5 +++++
>  package/python-pyasynchat/python-pyasynchat.mk   | 15 +++++++++++++++
>  package/python-pyasyncore/Config.in              | 10 ++++++++++
>  package/python-pyasyncore/python-pyasyncore.hash |  5 +++++
>  package/python-pyasyncore/python-pyasyncore.mk   | 14 ++++++++++++++
>  10 files changed, 72 insertions(+), 8 deletions(-)
>  create mode 100644 package/python-pyasynchat/Config.in
>  create mode 100644 package/python-pyasynchat/python-pyasynchat.hash
>  create mode 100644 package/python-pyasynchat/python-pyasynchat.mk
>  create mode 100644 package/python-pyasyncore/Config.in
>  create mode 100644 package/python-pyasyncore/python-pyasyncore.hash
>  create mode 100644 package/python-pyasyncore/python-pyasyncore.mk
>
> --
> 2.45.2
>
>

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

--000000000000b97583061bde8e99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno mer 26 giu 2024 alle ore 19=
:19 Fiona Klute &lt;<a href=3D"mailto:fiona.klute@gmx.de">fiona.klute@gmx.d=
e</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">This patch series (unfortunately still not merged) by Angelo<br>
Compagnucci fixed the fail2ban 1.0.2 build:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D40=
3756" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/pro=
ject/buildroot/list/?series=3D403756</a><br>
<br>
However it broke again with Python 3.12 due to incompatibilities in<br>
upstream code. The 1.1.0 release fixes those, unfortunately it still<br>
requires ported asyncore and asynchat modules. This series builds on<br>
Angelo&#39;s (must be merged after) and updates fail2ban to 1.1.0 after<br>
adding the required compatibility packages.<br></blockquote><div><br></div>=
<div>Thanks for the job! Very good indeed!</div><div>=C2=A0<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
Fiona Klute (3):<br>
=C2=A0 package/python-pyasyncore: new package<br>
=C2=A0 package/python-pyasynchat: new package<br>
=C2=A0 package/fail2ban: bump version to 1.1.0<br>
<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br=
>
=C2=A0package/fail2ban/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0package/fail2ban/fail2ban.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0package/fail2ban/<a href=3D"http://fail2ban.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">fail2ban.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 ++++++++-------<br>
=C2=A0package/python-pyasynchat/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 11 +++++++++++<br>
=C2=A0package/python-pyasynchat/python-pyasynchat.hash |=C2=A0 5 +++++<br>
=C2=A0package/python-pyasynchat/<a href=3D"http://python-pyasynchat.mk" rel=
=3D"noreferrer" target=3D"_blank">python-pyasynchat.mk</a>=C2=A0 =C2=A0| 15=
 +++++++++++++++<br>
=C2=A0package/python-pyasyncore/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 10 ++++++++++<br>
=C2=A0package/python-pyasyncore/python-pyasyncore.hash |=C2=A0 5 +++++<br>
=C2=A0package/python-pyasyncore/<a href=3D"http://python-pyasyncore.mk" rel=
=3D"noreferrer" target=3D"_blank">python-pyasyncore.mk</a>=C2=A0 =C2=A0| 14=
 ++++++++++++++<br>
=C2=A010 files changed, 72 insertions(+), 8 deletions(-)<br>
=C2=A0create mode 100644 package/python-pyasynchat/Config.in<br>
=C2=A0create mode 100644 package/python-pyasynchat/python-pyasynchat.hash<b=
r>
=C2=A0create mode 100644 package/python-pyasynchat/<a href=3D"http://python=
-pyasynchat.mk" rel=3D"noreferrer" target=3D"_blank">python-pyasynchat.mk</=
a><br>
=C2=A0create mode 100644 package/python-pyasyncore/Config.in<br>
=C2=A0create mode 100644 package/python-pyasyncore/python-pyasyncore.hash<b=
r>
=C2=A0create mode 100644 package/python-pyasyncore/<a href=3D"http://python=
-pyasyncore.mk" rel=3D"noreferrer" target=3D"_blank">python-pyasyncore.mk</=
a><br>
<br>
--<br>
2.45.2<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Profile: <a h=
ref=3D"http://it.linkedin.com/in/compagnucciangelo" target=3D"_blank">http:=
//it.linkedin.com/in/compagnucciangelo</a></div></div>

--000000000000b97583061bde8e99--

--===============0211766447336051020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0211766447336051020==--
