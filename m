Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567A4C83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 21:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E1DE6131C;
	Sat,  5 Jul 2025 21:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0z9G802YU0Q; Sat,  5 Jul 2025 21:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4564C6131F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4564C6131F;
	Sat,  5 Jul 2025 21:05:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E331015F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4F026131F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlQbKWhXDhHI for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 21:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=romain.naour@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CB356131C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CB356131C
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CB356131C
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:05:05 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b390d09e957so219310a12.1
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 14:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751749504; x=1752354304;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rAmkFLgvXfFlw8MZ6eivwDygU+9wnzYsRp/8lUilAzQ=;
 b=mxTcCNauma2EhY/ogxF3lxzRkYAo6ZArjGgxDcBzLHd4Df06YOOGXWcVGEgzb8oseG
 w8lbYGexW5/iS4XLQyprDanT/P6QVy12FcTbYOq8xLq3yOtcBqaEKiTAy0JBfHwUF1OP
 WWKoPnWCHAJan+2XrhnUtIYh2nx03FECC2mZQANNsa8MUVgQxauiZrcGhyW1VV7Hc45w
 SFEzLYoriX2Tb2S4/V3EpumrWxWnEt6PI+6BJ/j1E7HxO+cC7Dg5XtwoAEwAhoqgbAZG
 QkRx0VdpPy+Uak8uvc6vG5D7H06F1S3er9YMVgc7LaJ/SLv56g6wXMOVscMFanWrFcTp
 RifA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWClkjCJo4QUGG56ruXzTeZb74lGTRDb21ifF8aFXlo0WKAKP5OqwiHSS5NSWOe3NWUZrM5EwXio6M=@buildroot.org
X-Gm-Message-State: AOJu0YwWL6YVlaLq2o2gdD9MBk5ZhOI81azk6io73AIIkEJ/kp73cd3D
 SbCVaMuc0IqNpHjNrUbIFwPbC6IvEohqjBXBSBYQZsKajo/IgH5aiDu+035n+Uw/mW5iYhqrFPi
 JaIchEAxgOerSIjgQ5x6bLCKL36h7mbY=
X-Gm-Gg: ASbGncslQRU6W/IrkavV+0TIV8yxsWXFX/I1MeYLGADj9QgRsI5/zKi3vktXLE450Ui
 jjS9mRsgMO2z+KLe3x35yBPwz4PtW7TXaayDXvXRGJTrGH+dzujUzIXGI5OmiIv+Va+HQ2tW6WD
 0SyzcUSMuBwh119H7RnTGy1Bo8O/xoHPquWpp/6rBwhy6R
X-Google-Smtp-Source: AGHT+IGbKYJ8egrfnMSFEEBUsqJNFrQukD2Xrt+aCcMPCZAqSMvOEs3qjWYUL4uVfPhRuyUzYZh62fiNAY/EYxSmGRU=
X-Received: by 2002:a17:90a:dfcc:b0:315:cbe0:13b3 with SMTP id
 98e67ed59e1d1-31aadcf4962mr10754662a91.7.1751749504059; Sat, 05 Jul 2025
 14:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250703145955.1863056-1-elmehdi.younes@smile.fr>
 <CALAjcgXUyyLUmB56DUEL67m3N+=iGQbOifH3asxZEjZ3nCj81A@mail.gmail.com>
In-Reply-To: <CALAjcgXUyyLUmB56DUEL67m3N+=iGQbOifH3asxZEjZ3nCj81A@mail.gmail.com>
From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 5 Jul 2025 23:04:51 +0200
X-Gm-Features: Ac12FXzAF3bH89ZTgPwlRc4SIQnkEPZht4khguTA6P4yv5F5tg14Cki4-YBvqL0
Message-ID: <CANLo3Jg0GBwx_MPyb+Efmj3H+b6ea7kkQ3v=qQ-NBZTuZoZr-g@mail.gmail.com>
To: James Knight <jdknight@jdknight.me>
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 buildroot <buildroot@buildroot.org>, 
 Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 James Knight <git@jdknight.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751749504; x=1752354304; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rAmkFLgvXfFlw8MZ6eivwDygU+9wnzYsRp/8lUilAzQ=;
 b=izUZiVyF5H3KimXhZE3/5Zm4fGucRvb1cxr9nN6FimwA3yj/mlA93WJ3gLKm94iW1r
 YWt+9tW11Kqs8az6JhOw/Vywz3EDhJJdw5z9O1t40FJyu61yc7qTyOmyarSTuUhwrkY2
 JVq89J54Tsg5XfPlf/2Pc0xG5sG92H/4ZKpdmNhvlku/JWyyMJt2NkmzXbBDRUjWbLyz
 +pxD+LSPBnlFAtVn3WQmYzmZfX7CJ2QZvIwYApEkvpcPOMYVFyZa8GlG7GxT8z0xMi+Q
 QNl1/pJtn071Q9YWa80gZwL0ixjFDj3yZlpTp4gGynSA+KZTmPVYbXA0tozGNvw5AVQD
 PDxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=izUZiVyF
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: fix
 gcc-install-dir in clang
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
Content-Type: multipart/mixed; boundary="===============1068729189493104998=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1068729189493104998==
Content-Type: multipart/alternative; boundary="000000000000eccd25063934f682"

--000000000000eccd25063934f682
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le ven. 4 juil. 2025, 06:24, James Knight <jdknight@jdknight.me> a =C3=A9cr=
it :

> On Thu, Jul 3, 2025 at 11:00=E2=80=AFAM El Mehdi YOUNES <elmehdi.younes@s=
mile.fr>
> wrote:
> > We replace it a more reliable approach using:
> > $(TARGET_CC) -print-search-dirs
>
> Way better fix; thanks! Tested in my setup and functions as expected.
>

For some reason, your reply is missing on the mailing list.

Romain

>

--000000000000eccd25063934f682
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello,</div><div dir=3D"auto"><br><div class=3D"gmai=
l_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 4 juil.=
 2025, 06:24, James Knight &lt;<a href=3D"mailto:jdknight@jdknight.me" targ=
et=3D"_blank" rel=3D"noreferrer">jdknight@jdknight.me</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Jul 3, 2025 at 11:0=
0=E2=80=AFAM El Mehdi YOUNES &lt;<a href=3D"mailto:elmehdi.younes@smile.fr"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">elmehdi.younes@smile.fr</a=
>&gt; wrote:<br>
&gt; We replace it a more reliable approach using:<br>
&gt; $(TARGET_CC) -print-search-dirs<br>
<br>
Way better fix; thanks! Tested in my setup and functions as expected.<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">For so=
me reason, your reply is missing on the mailing list.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Romain=C2=A0</div><div dir=3D"auto"><div clas=
s=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000eccd25063934f682--

--===============1068729189493104998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1068729189493104998==--
