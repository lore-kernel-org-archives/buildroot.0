Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A83BCCF9F8
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 20:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4B03805F0;
	Sun,  9 Nov 2025 20:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRwgQZXSOZY3; Sun,  9 Nov 2025 20:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F25CA805D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F25CA805D3;
	Sun,  9 Nov 2025 20:24:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83C6425D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 20:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FEE9406D8
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 20:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xl02C78r7iph for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 20:24:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57FB1406BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57FB1406BA
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57FB1406BA
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 20:24:33 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-880503ab181so24120066d6.2
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 12:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762719872; x=1763324672;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sSagmJOQrRcA5genO6UrNIvSSrmJZIeSfmqn8lIG+Vw=;
 b=qBwL4A2g4xT3x9zi6wOzYHI7uGkT1hUzlpJwY/EzP6BrVjr9GzCq6KyU+czRd3JDX1
 vlzdn7nPI1kXFRwl5Du+BXSXPgjBCuLKiYWvecSZLyn2ayfqI7CftsjrBX1QXLyAp/b6
 d68RiGjJ3SpZLd7anz8edZfm/vjCdYzbvTpkIj8ZM9GCN/5GkqghHcXb5MkCtMyxaIYA
 T6usyJLH6Hrh9ynqg+T0tBpYxa0PHs4KdiUxVdcvH+m8KCOCw4KINtt+THKLZXAzdL7F
 j9/gn/aYk9pAWXOyzGSrmhPcsb8FEs/QiN90e3SdJcOPn3RxNZnRyVSBP/chaSmGmDPD
 6ExQ==
X-Gm-Message-State: AOJu0Yxi5t7zjAZNcy7zDYj9bgFQ8OaEcwLf8xrPwji8m6sp8iMhqBWf
 XBJL2QlBK7sLi9VKhi83jrgB/Hx5xB630twWj36cc5aI+s55vwze+CmSb1hLATezYOrYqN8pFki
 zEvbJUmrCNovqimKhtyRs2Caqz5Sg0STBLw==
X-Gm-Gg: ASbGncvxPgLXYBCXeZQN2UmKwkJ7OeoCkdX/9yRDw3rFdNnbJv7UFyLVthxJ1xDCsrA
 4JVvx4L7cPhdMafi+WHgQfhFNN3XpTg9OR0QdxbVqG+Jzm902VDWO7+FVAO+J/eyjxsNqN+EQX6
 1CHCwCOrfb4+l3ku6jC5CcQmZr53Qts4g7R5+DwsGY60SJNXxc22ShR93EkpSpW220PRMGYA6L/
 vzEli+B36n/Nfg8g0G7sfckHrHIlQUVFNaW/wyhyqucfaUZotvdaSaFqEMM+hE0oNHS/g==
X-Google-Smtp-Source: AGHT+IH2zcee5bWKNvjcqwdq+oXNm0TM4J3mHlLY/4Is0UV47X0pMWasUGS1INP0SFWrbIVUCN7TdQ4WWcCiVE3wkHI=
X-Received: by 2002:a05:6214:c48:b0:882:4be6:9ab9 with SMTP id
 6a1803df08f44-8824be6aadcmr30497496d6.54.1762719871918; Sun, 09 Nov 2025
 12:24:31 -0800 (PST)
MIME-Version: 1.0
References: <1c677011-9c6e-483c-ab4f-93480d7fdd69@embetrix.com>
In-Reply-To: <1c677011-9c6e-483c-ab4f-93480d7fdd69@embetrix.com>
From: Lance Fredrickson <lancethepants@gmail.com>
Date: Sun, 9 Nov 2025 13:24:21 -0700
X-Gm-Features: AWmQ_bmEahbqyJiXLbIokc6vw5mjajEpA0Q_1iduJSLJpZAqQNY0tFqToZOpi80
Message-ID: <CABwKrPDNVLCLJHg7Nvxne+03RtZXXpO_H-iKquAe7hchiMf3pg@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embetrix.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762719872; x=1763324672; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sSagmJOQrRcA5genO6UrNIvSSrmJZIeSfmqn8lIG+Vw=;
 b=QwozWRtlncPBiEUTtRaVwVzJmvHw5Lp2PLrWrBwuNzmLWiPTm3jvQoreyvsD1M7eu8
 6YPORnIEWaZgAD6OKovIcMpUf1j1+V+8yLrDIQgN2C40dgo8tX2JWPPEAyIQsvjYr7+u
 8Zb0jggn4En+LmUEehluFNXavc4d3YuvNacXN2u5i4DrJWpYETDiF6DeYxL73oNn3uNT
 tnQ5FJDXc4nC+OJsfque770jzasqYJ5r8kG8I/WKksGWlaY1AT3hYMXN1mG/BE2ezGwe
 zxaQN7uUT0kGD9GL7GQEzL4jbisiDtaMSEoFfq1Ev9eWGG+7c7Eb/yk7THzjeqCTfvNZ
 9wEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QwozWRtl
Subject: Re: [Buildroot] override a core package from BR2_EXTERNAL
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
Content-Type: multipart/mixed; boundary="===============9134783113802919888=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9134783113802919888==
Content-Type: multipart/alternative; boundary="000000000000cde51906432f33ca"

--000000000000cde51906432f33ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I created a directory called package-overrides in my External package
directory, although you could call it whatever you want. So far I've only
overridden one package and even then it was just the install routine and
removing the install target hooks.  Using the the Makefile "override"
keyword you should be able to change whatever package definition you want.

https://github.com/tomato64/tomato64/blob/master/tomato64/package/package-o=
verrides/mariadb-override.mk

I'm not sure if there's an official or "supported" way to do this, but this
is just what I figured out for myself.

Lance


On Sun, Nov 9, 2025, 6:25=E2=80=AFAM Ayoub Zaki <ayoub.zaki@embetrix.com> w=
rote:

> Hi all,
>
> What=E2=80=99s the supported way to fully override a core package from
> BR2_EXTERNAL while keeping the same package name so that dependencies
> from other packages still work ?
>
>
> Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards
>
> --
> Ayoub Zaki
> Embedded Systems Consultant
>
> Vaihinger Stra=C3=9Fe 2/1
> D-71634 Ludwigsburg
>
> Mobile   : +4917662901545
> Email    : ayoub.zaki@embetrix.com
> Homepage : https://embetrix.com
> VAT No.  : DE313902634
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000cde51906432f33ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I created a directory called package-overrides in my=
 External package directory, although you could call it whatever you want. =
So far I&#39;ve only overridden one package and even then it was just the i=
nstall routine and removing the install target hooks.=C2=A0 Using the the M=
akefile &quot;override&quot; keyword you should be able to change whatever =
package definition you want.=C2=A0<div dir=3D"auto"><br></div><div dir=3D"a=
uto"><a href=3D"https://github.com/tomato64/tomato64/blob/master/tomato64/p=
ackage/package-overrides/mariadb-override.mk">https://github.com/tomato64/t=
omato64/blob/master/tomato64/package/package-overrides/mariadb-override.mk<=
/a></div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m not sure if =
there&#39;s an official or &quot;supported&quot; way to do this, but this i=
s just what I figured out for myself.=C2=A0</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Lance=C2=A0</div><br><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 9, 202=
5, 6:25=E2=80=AFAM Ayoub Zaki &lt;<a href=3D"mailto:ayoub.zaki@embetrix.com=
">ayoub.zaki@embetrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Hi all,<br>
<br>
What=E2=80=99s the supported way to fully override a core package from <br>
BR2_EXTERNAL while keeping the same package name so that dependencies <br>
from other packages still work ?<br>
<br>
<br>
Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards<br>
<br>
-- <br>
Ayoub Zaki<br>
Embedded Systems Consultant<br>
<br>
Vaihinger Stra=C3=9Fe 2/1<br>
D-71634 Ludwigsburg<br>
<br>
Mobile=C2=A0 =C2=A0: +4917662901545<br>
Email=C2=A0 =C2=A0 : <a href=3D"mailto:ayoub.zaki@embetrix.com" target=3D"_=
blank" rel=3D"noreferrer">ayoub.zaki@embetrix.com</a><br>
Homepage : <a href=3D"https://embetrix.com" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://embetrix.com</a><br>
VAT No.=C2=A0 : DE313902634<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"norefer=
rer">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman=
/listinfo/buildroot</a><br>
</blockquote></div></div></div>

--000000000000cde51906432f33ca--

--===============9134783113802919888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9134783113802919888==--
