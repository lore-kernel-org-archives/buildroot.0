Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1D9C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 21:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E23D24027A;
	Wed, 29 Jan 2025 21:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Xto7xglKmPs; Wed, 29 Jan 2025 21:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54132405ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54132405ED;
	Wed, 29 Jan 2025 21:00:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60A38712
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 21:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E6FF405ED
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 21:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYCrB_WEso1C for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 21:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E5624027A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E5624027A
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E5624027A
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 21:00:03 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3eb7f3b1342so61915b6e.1
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 13:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738184402; x=1738789202;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LgtGrtbFkkZdXaTAU9bN0RFwXKPTXFpk4SGv+jbVH44=;
 b=YPcxYFs+8yQKdqqZcDT4ywejDY1gnHV9tldhzN6g3zgoqIbOTUTVidaGpqMsTpQRKF
 nlD7S5oKh6UGMYII+0m9FUItsXeHZTm+oUKvhY8b/DAai1LSPxwQ1ULz+FXfBGWpPt1E
 5seAFgA/051L00Ah3dgT54VXKcaClukY0OrH5hGQuGWxPY7/m0OZODjSJdHS4zRUk1mS
 UN3zlDVJr8UWkT4kcv9jIdH7ryrKS7CR85YMTGBfg1wbkHXuu9GvaCvxQ/EVGy5veIiE
 FSLQkfk0uYXnQF17QLstpyKRIrfT6NS8yixLjdxvOMx5FyVB+O1WbUSxDFkL5gNlAZ3w
 1v2Q==
X-Gm-Message-State: AOJu0Yyvkuygrlb8nftzEowTrxGdJhn09SAfKd5wnmkBLR0pUshU40R+
 Sihrsp09eAadABPXNasiBtUKL8C5K5sIfhIAKX3Sq7q1wm50Q+tK2eAj7b7nGN2cgc4rLyFviih
 9
X-Gm-Gg: ASbGncsN2/YKjbLAxJ731i0T4Yj4H4ldYym/5V06Z5LEs79feiQJVNZx3oWWQFhax6h
 7xD+b0bpLib2yNCKTa4ZvxUYDMkn7RB+t9lzfgVutq5ol5fKHETFa2bt3uKmhwO4HKeQAuoA452
 +wbn0/baJOhQ+D0FyQw4D4U2IjvkeQNGIthQvB4EAk3XH9Vzr//tBxJycSxY5GFE7AmIGpxZ+5J
 y8+wdMtLbF1Qhqoka3pZdr7bJD4yrWh4kyamYm+GPHw10p2LdnIBBRzqdCamgYsj72GBfLtZ4T2
 Wx/tzxFUndblFz0uhXsnjyWwD3bWBlX74v/96FGSkxzMfAtZGmsNkWU=
X-Google-Smtp-Source: AGHT+IHAc+75XCVVEvoP7TNS8dFZp6AlNKWxj+DrVH0dM6wOXRVdVARcY7uq9zJHUssJz66tMKQSag==
X-Received: by 2002:a05:6808:16ac:b0:3eb:39f5:de8b with SMTP id
 5614622812f47-3f323b1d88fmr2358083b6e.32.1738184402238; 
 Wed, 29 Jan 2025 13:00:02 -0800 (PST)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com.
 [209.85.161.44]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-726617b9d9bsm2563a34.5.2025.01.29.13.00.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 13:00:02 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-5fc0b7a4e5dso76579eaf.1
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 13:00:01 -0800 (PST)
X-Received: by 2002:a05:6870:56a4:b0:29e:671b:6019 with SMTP id
 586e51a60fabf-2b32f284055mr2821223fac.31.1738184401574; Wed, 29 Jan 2025
 13:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20250129194007.60839-1-christian@aperture.us>
In-Reply-To: <20250129194007.60839-1-christian@aperture.us>
Date: Wed, 29 Jan 2025 12:59:52 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qwLemkO+L4cKkSv8kTDkzVxNp7E2RxPb5=tkF4PcVf6w@mail.gmail.com>
X-Gm-Features: AWEUYZlYzw4dMw45MPoFXwIv_EUzz72nGDuHKPjXXmR7OqN73bQapoGcFml-IrI
Message-ID: <CA+h8R2qwLemkO+L4cKkSv8kTDkzVxNp7E2RxPb5=tkF4PcVf6w@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738184402; x=1738789202; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LgtGrtbFkkZdXaTAU9bN0RFwXKPTXFpk4SGv+jbVH44=;
 b=z2DMbX5Cpc13ZiQ7xQyGYZc3WGIDH6yPAoY2jfCy8kdap0ERGphN4g6jKIO314HuDx
 E2VYPsBVKNjN/cX5uwNNr9m0v9wrwN7NewkbBmjIXW8+X7IKMNRXARoPi+8qlGRzoV91
 U8RW7kf8OJGxfytlY+MjFyXJYSYZngkbHQlH4X3mwy2bsGaQ+uzPo1jBiEuX7OZeaz2s
 GIOvS8/sGwlwdF6V9QLXwd71tTAFfeowAokvDtw1jnpd6sP8Zg7cFPNQzleAbaTEzNMZ
 o6aNXGrYGq6zRYQl3+WoY2ILCBd9IZOenGkdAL/C5hRR/6Zk4F5L9rZOYptmjzutvHFF
 d/iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=z2DMbX5C
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.23.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============0348424620572136875=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0348424620572136875==
Content-Type: multipart/alternative; boundary="000000000000cf6ea5062cde97c3"

--000000000000cf6ea5062cde97c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Forgot to mention this is a security fix in the commit message.

Best regards,
Christian Stewart

On Wed, Jan 29, 2025, 11:40=E2=80=AFAM Christian Stewart <christian@apertur=
e.us>
wrote:

> go1.23.5 (released 2025-01-16) includes security fixes to the crypto/x509
> and
> net/http packages, as well as bug fixes to the compiler, the runtime, and
> the
> net package.
>
> https://go.dev/doc/devel/release#go1.23.5
>
> https://github.com/golang/go/issues?q=3Dmilestone%3AGo1.23.5+label%3ACher=
ryPickApproved
>
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/go/go-bin/go-bin.hash | 14 +++++++-------
>  package/go/go-src/go-src.hash |  2 +-
>  package/go/go.mk              |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.has=
h
> index 37e1db20a9..39e6491376 100644
> --- a/package/go/go-bin/go-bin.hash
> +++ b/package/go/go-bin/go-bin.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531
> go1.23.4.src.tar.gz
> -sha256  4a4a0e7587ef8c8a326439b957027f2791795e2d29d4ae3885b4091a48f843bc
> go1.23.4.linux-386.tar.gz
> -sha256  6924efde5de86fe277676e929dc9917d466efa02fb934197bc2eba35d5680971
> go1.23.4.linux-amd64.tar.gz
> -sha256  16e5017863a7f6071363782b1b8042eb12c6ca4f4cd71528b2123f0a1275b13e
> go1.23.4.linux-arm64.tar.gz
> -sha256  1f1dda0dc7ce0b2295f57258ec5ef0803fd31b9ed0aa20e2e9222334e5755de1
> go1.23.4.linux-armv6l.tar.gz
> -sha256  65a303ef51e48ff77e004a6a5b4db6ce59495cd59c6af51b54bf4f786c01a1b9
> go1.23.4.linux-ppc64le.tar.gz
> -sha256  74aab82bf4eca7c26c830a5b0e2a31d193a4d5ba47045526b92473cc7188d7d7
> go1.23.4.linux-s390x.tar.gz
> +sha256  a6f3f4bbd3e6bdd626f79b668f212fbb5649daf75084fb79b678a0ae4d97423b
> go1.23.5.src.tar.gz
> +sha256  6ecf6a41d0925358905fa2641db0e1c9037aa5b5bcd26ca6734caf50d9196417
> go1.23.5.linux-386.tar.gz
> +sha256  cbcad4a6482107c7c7926df1608106c189417163428200ce357695cc7e01d091
> go1.23.5.linux-amd64.tar.gz
> +sha256  47c84d332123883653b70da2db7dd57d2a865921ba4724efcdf56b5da7021db0
> go1.23.5.linux-arm64.tar.gz
> +sha256  04e0b5cf5c216f0aa1bf8204d49312ad0845800ab0702dfe4357c0b1241027a3
> go1.23.5.linux-armv6l.tar.gz
> +sha256  db268bf5710b5b1b82ab38722ba6e4427d9e4942aed78c7d09195a9dff329613
> go1.23.5.linux-ppc64le.tar.gz
> +sha256  14924b917d35311eb130e263f34931043d4f9dc65f20684301bf8f60a72edcdf
> go1.23.5.linux-s390x.tar.gz
>  sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067
> LICENSE
> diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.has=
h
> index 0b11d8d392..4c8ae3ca5e 100644
> --- a/package/go/go-src/go-src.hash
> +++ b/package/go/go-src/go-src.hash
> @@ -1,3 +1,3 @@
>  # From https://go.dev/dl
> -sha256  ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531
> go1.23.4.src.tar.gz
> +sha256  a6f3f4bbd3e6bdd626f79b668f212fbb5649daf75084fb79b678a0ae4d97423b
> go1.23.5.src.tar.gz
>  sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067
> LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 91d9f8d1c1..3d1b42ee0e 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -GO_VERSION =3D 1.23.4
> +GO_VERSION =3D 1.23.5
>
>  HOST_GO_GOPATH =3D $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE =3D $(HOST_DIR)/share/host-go-cache
> --
> 2.39.5
>
>

--000000000000cf6ea5062cde97c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi all,<div dir=3D"auto"><br></div><div dir=3D"auto">Forg=
ot to mention this is a security fix in the commit message.=C2=A0</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"au=
to">Christian Stewart=C2=A0</div></div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 29, 2025=
, 11:40=E2=80=AFAM Christian Stewart &lt;<a href=3D"mailto:christian@apertu=
re.us">christian@aperture.us</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">go1.23.5 (released 2025-01-16) includes security fixes to the cryp=
to/x509 and<br>
net/http packages, as well as bug fixes to the compiler, the runtime, and t=
he<br>
net package.<br>
<br>
<a href=3D"https://go.dev/doc/devel/release#go1.23.5" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://go.dev/doc/devel/release#go1.23.5</a><br=
>
<a href=3D"https://github.com/golang/go/issues?q=3Dmilestone%3AGo1.23.5+lab=
el%3ACherryPickApproved" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://github.com/golang/go/issues?q=3Dmilestone%3AGo1.23.5+label%3ACherryPi=
ckApproved</a><br>
<br>
Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@aperture.u=
s" target=3D"_blank" rel=3D"noreferrer">christian@aperture.us</a>&gt;<br>
---<br>
=C2=A0package/go/go-bin/go-bin.hash | 14 +++++++-------<br>
=C2=A0package/go/go-src/go-src.hash |=C2=A0 2 +-<br>
=C2=A0package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
=C2=A03 files changed, 9 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash<=
br>
index 37e1db20a9..39e6491376 100644<br>
--- a/package/go/go-bin/go-bin.hash<br>
+++ b/package/go/go-bin/go-bin.hash<br>
@@ -1,9 +1,9 @@<br>
=C2=A0# sha256 checksum from <a href=3D"https://go.dev/dl/" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://go.dev/dl/</a><br>
-sha256=C2=A0 ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263=
531=C2=A0 go1.23.4.src.tar.gz<br>
-sha256=C2=A0 4a4a0e7587ef8c8a326439b957027f2791795e2d29d4ae3885b4091a48f84=
3bc=C2=A0 go1.23.4.linux-386.tar.gz<br>
-sha256=C2=A0 6924efde5de86fe277676e929dc9917d466efa02fb934197bc2eba35d5680=
971=C2=A0 go1.23.4.linux-amd64.tar.gz<br>
-sha256=C2=A0 16e5017863a7f6071363782b1b8042eb12c6ca4f4cd71528b2123f0a1275b=
13e=C2=A0 go1.23.4.linux-arm64.tar.gz<br>
-sha256=C2=A0 1f1dda0dc7ce0b2295f57258ec5ef0803fd31b9ed0aa20e2e9222334e5755=
de1=C2=A0 go1.23.4.linux-armv6l.tar.gz<br>
-sha256=C2=A0 65a303ef51e48ff77e004a6a5b4db6ce59495cd59c6af51b54bf4f786c01a=
1b9=C2=A0 go1.23.4.linux-ppc64le.tar.gz<br>
-sha256=C2=A0 74aab82bf4eca7c26c830a5b0e2a31d193a4d5ba47045526b92473cc7188d=
7d7=C2=A0 go1.23.4.linux-s390x.tar.gz<br>
+sha256=C2=A0 a6f3f4bbd3e6bdd626f79b668f212fbb5649daf75084fb79b678a0ae4d974=
23b=C2=A0 go1.23.5.src.tar.gz<br>
+sha256=C2=A0 6ecf6a41d0925358905fa2641db0e1c9037aa5b5bcd26ca6734caf50d9196=
417=C2=A0 go1.23.5.linux-386.tar.gz<br>
+sha256=C2=A0 cbcad4a6482107c7c7926df1608106c189417163428200ce357695cc7e01d=
091=C2=A0 go1.23.5.linux-amd64.tar.gz<br>
+sha256=C2=A0 47c84d332123883653b70da2db7dd57d2a865921ba4724efcdf56b5da7021=
db0=C2=A0 go1.23.5.linux-arm64.tar.gz<br>
+sha256=C2=A0 04e0b5cf5c216f0aa1bf8204d49312ad0845800ab0702dfe4357c0b124102=
7a3=C2=A0 go1.23.5.linux-armv6l.tar.gz<br>
+sha256=C2=A0 db268bf5710b5b1b82ab38722ba6e4427d9e4942aed78c7d09195a9dff329=
613=C2=A0 go1.23.5.linux-ppc64le.tar.gz<br>
+sha256=C2=A0 14924b917d35311eb130e263f34931043d4f9dc65f20684301bf8f60a72ed=
cdf=C2=A0 go1.23.5.linux-s390x.tar.gz<br>
=C2=A0sha256=C2=A0 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b20=
30cbc067=C2=A0 LICENSE<br>
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash<=
br>
index 0b11d8d392..4c8ae3ca5e 100644<br>
--- a/package/go/go-src/go-src.hash<br>
+++ b/package/go/go-src/go-src.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# From <a href=3D"https://go.dev/dl" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://go.dev/dl</a><br>
-sha256=C2=A0 ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263=
531=C2=A0 go1.23.4.src.tar.gz<br>
+sha256=C2=A0 a6f3f4bbd3e6bdd626f79b668f212fbb5649daf75084fb79b678a0ae4d974=
23b=C2=A0 go1.23.5.src.tar.gz<br>
=C2=A0sha256=C2=A0 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b20=
30cbc067=C2=A0 LICENSE<br>
diff --git a/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferr=
er" target=3D"_blank">go.mk</a> b/package/go/<a href=3D"http://go.mk" rel=
=3D"noreferrer noreferrer" target=3D"_blank">go.mk</a><br>
index 91d9f8d1c1..3d1b42ee0e 100644<br>
--- a/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a><br>
+++ b/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-GO_VERSION =3D 1.23.4<br>
+GO_VERSION =3D 1.23.5<br>
<br>
=C2=A0HOST_GO_GOPATH =3D $(HOST_DIR)/share/go-path<br>
=C2=A0HOST_GO_HOST_CACHE =3D $(HOST_DIR)/share/host-go-cache<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div>

--000000000000cf6ea5062cde97c3--

--===============0348424620572136875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0348424620572136875==--
