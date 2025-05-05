Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABE4C369C2
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 06:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 341D1812FB;
	Mon,  5 May 2025 06:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vk_0LnCdTCqB; Mon,  5 May 2025 06:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 290D8812E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 290D8812E3;
	Mon,  5 May 2025 06:30:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7826E16B
 for <buildroot@buildroot.org>; Mon,  5 May 2025 06:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48566400D2
 for <buildroot@buildroot.org>; Mon,  5 May 2025 06:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xA9Dk4cg1eWX for <buildroot@buildroot.org>;
 Mon,  5 May 2025 06:30:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4068F4023E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4068F4023E
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4068F4023E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 06:30:02 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-31062172698so44317131fa.0
 for <buildroot@buildroot.org>; Sun, 04 May 2025 23:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746426600; x=1747031400;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qFb8aYxbCC9zoPmTbHnbW+t3hAZWDRPtrYJyqtWjYQU=;
 b=qjZUAZ805E6CGye5srgTm+EUFIeXpj4x3xqNXErePphek93btFEWOzvMQUiL04X4/v
 2yQHembMWi3r4WbTL/VDN3O5UzeDB4+1XLzEzDxPSQlHLzihAhp7+jBUullJM/Ih9zq9
 byoEBPnt3jU/nzo9HflTWm2gbUuz8P9bh1s5cEGcWR+NORG+kU4xAXrXd3SEbjPR8XJT
 +qxfqFkV81O/F3OSt+m0oHcLFLxYyFZAVrUM77xCWIqll3KrNP9esDQ18t8GJ5mO3CC4
 UZ+gnGNPIUzPvNX/g54X2x10+u5NDvUCzjWB/a5ld5G0UU7W2TT1LGneGw3nmka3igbW
 NmKw==
X-Gm-Message-State: AOJu0YwiRsSIrQGjSKtFFnuNyp73cmafw7uEQKFjDrBg6cD3KRA3k9Zm
 Q1h1P+wO3eVhQtpxn4Yn8KfXrM334rwt4OGN//F56jv0dHeD17ImxDKGSOBh4GoGrGAFrLv7sFA
 EKLdDo9aJXKX5GF9OiO0yDlOuSe4=
X-Gm-Gg: ASbGnctouDa2MVAR6VQVAt8GUMA3IZVJOJWSkpS7OYqQK5g4z+2MisnWn1HEI/+4SmM
 nAjuIRYTKbVYAZeimlt3dSr9Msa2xvsPlpDydkNp7+Qd7Px9k1beIQsqIxlFCsbucbUskdNqVRa
 7tFdmwjG6JIG3n9K35t43KWKGrWyQyWjkNUNT83//ktaCp5h/mlgXkSrNUPR30xmB0OwI=
X-Google-Smtp-Source: AGHT+IFA1Xju4VAxgSQvKvKavQxRy+2+CDK39BE8htADYn1KgWvO3LF7NHfFhYRVr90JmpuzPt1I+Ej/7p8W5YRRNxA=
X-Received: by 2002:a05:651c:892:b0:309:2ed:72df with SMTP id
 38308e7fff4ca-3234905c935mr14253101fa.24.1746426599493; Sun, 04 May 2025
 23:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250502132924.3775738-1-lazzer@gmail.com>
 <20250502132924.3775738-3-lazzer@gmail.com>
In-Reply-To: <20250502132924.3775738-3-lazzer@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 5 May 2025 08:29:46 +0200
X-Gm-Features: ATxdqUEoKNgCfrUI4FRI2YcFQ-2mMDpyW-pHkV-EUohs_VcJV_lLH0gWD3jr2Hg
Message-ID: <CAEyMn7aVXP7h7=iQRLQ5S+oVdEzTYpVur0ATxwcCOhkXvneB4g@mail.gmail.com>
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org,
 =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746426600; x=1747031400; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qFb8aYxbCC9zoPmTbHnbW+t3hAZWDRPtrYJyqtWjYQU=;
 b=SzHEZ2YcCxWCPTFr2iExFCxX4aE2MEtOY8YeU3ancmk4jMZCPzoQn7CQrFoeYGxCMk
 4fX9bS4T49+D2NTv3yK22vaGSEs2AiFIHdAzxHTzNIgYzLHB04fOM5Ia/49+TDTUfGiK
 MyGbtOggBHN7CUUs41AUagar1nEdg06nySLXpwc/T1cB+KHTubeulv+kUgAHp+FiYw2v
 s3xTfJa1y82cbneDa6Dm0MbQJvHAOt2VXI82biNNJPKEkJW844j3DRLxmmyVpQE6qST/
 OBNVUIexOLYlQpw0uKUM5brvWfEA9wsdCWs9h4Sq8laD+ulmS+diG5rDdn4+Coapx7yJ
 sE1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SzHEZ2Yc
Subject: Re: [Buildroot] [PATCH 2/4] package/libyang: bump to version 3.12.2
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
Content-Type: multipart/mixed; boundary="===============1153393993730051893=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1153393993730051893==
Content-Type: multipart/alternative; boundary="00000000000016d57a06345da102"

--00000000000016d57a06345da102
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mattias,

Thank you for this version bump. There is one small thing to be fixed. You
can test a package by using utils/test-pkg -p <PKG>. Here I used
"utils/test-pkg -p libyang" and the log files can be found under the
~/br-test-pkg/ folder.

Am Fr., 2. Mai 2025 um 15:29 Uhr schrieb Mattias Walstr=C3=B6m <lazzer@gmai=
l.com
>:

> Changelog:
>  optional xxhash faster hasing function
>  support for metadata in diff
>  lots of optimizations and fixes
>
> Signed-off-by: Mattias Walstr=C3=B6m <lazzer@gmail.com>
> ---
>  package/libyang/libyang.hash | 2 +-
>  package/libyang/libyang.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
> index e03278adfd..9221e93544 100644
> --- a/package/libyang/libyang.hash
> +++ b/package/libyang/libyang.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e44b
> libyang-2.1.148.tar.gz
> +sha256  a2ae94ce43d8b4b084f67c05902f97cbc0ec882d38ef5ddf1d601659f64d5c66
> libyang-3.12.2.tar.gz
>  sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb
> LICENSE
>

The LICENSE file hash has changed due to copyright date changes:

git diff v2.1.148..v3.12.2 LICENSE
diff --git a/LICENSE b/LICENSE
index 72e0e09a9..2d3becfd3 100644
--- a/LICENSE
+++ b/LICENSE
@@ -1,4 +1,4 @@
-Copyright (c) 2015-2021, CESNET
+Copyright (c) 2015-2024, CESNET
 All rights reserved.


>>> libyang 3.12.2 Collecting legal info
ERROR: while checking hashes from package/libyang/libyang.hash
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected:
0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb
ERROR: got     :
f4fbaa09c8b2faa6a873a38181ff860e2ff90808320f71deb369f03ddfb920da
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make: *** [package/libyang/libyang.mk:27: libyang-legal-info] Error 1




> diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
> index fca0cd63f8..94f9ba3b8a 100644
> --- a/package/libyang/libyang.mk
> +++ b/package/libyang/libyang.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -LIBYANG_VERSION =3D 2.1.148
> +LIBYANG_VERSION =3D 3.12.2
>  LIBYANG_SITE =3D $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
>  LIBYANG_LICENSE =3D BSD-3-Clause
>  LIBYANG_LICENSE_FILES =3D LICENSE
> --
> 2.43.0
>
>
Thanks,
Heiko

--00000000000016d57a06345da102
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Mattias,<div><br></div><div>Thank you =
for this version bump. There is one small thing to be fixed. You can test a=
 package by using utils/test-pkg -p &lt;PKG&gt;. Here I used &quot;utils/te=
st-pkg -p libyang&quot; and the log files can be found under the ~/br-test-=
pkg/ folder.</div></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">Am Fr., 2. Mai 2025 um 15:29=C2=A0U=
hr schrieb Mattias Walstr=C3=B6m &lt;<a href=3D"mailto:lazzer@gmail.com">la=
zzer@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Changelog:<br>
=C2=A0optional xxhash faster hasing function<br>
=C2=A0support for metadata in diff<br>
=C2=A0lots of optimizations and fixes<br>
<br>
Signed-off-by: Mattias Walstr=C3=B6m &lt;<a href=3D"mailto:lazzer@gmail.com=
" target=3D"_blank">lazzer@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/libyang/libyang.hash | 2 +-<br>
=C2=A0package/libyang/<a href=3D"http://libyang.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libyang.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash<br=
>
index e03278adfd..9221e93544 100644<br>
--- a/package/libyang/libyang.hash<br>
+++ b/package/libyang/libyang.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally calculated<br>
-sha256=C2=A0 77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e=
44b=C2=A0 libyang-2.1.148.tar.gz<br>
+sha256=C2=A0 a2ae94ce43d8b4b084f67c05902f97cbc0ec882d38ef5ddf1d601659f64d5=
c66=C2=A0 libyang-3.12.2.tar.gz<br>
=C2=A0sha256=C2=A0 0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab=
34cba5bb=C2=A0 LICENSE<br></blockquote><div><br></div><div>The LICENSE file=
 hash has changed due to copyright date changes:</div><div><br></div><div>g=
it diff v2.1.148..v3.12.2 LICENSE<br>diff --git a/LICENSE b/LICENSE<br>inde=
x 72e0e09a9..2d3becfd3 100644<br>--- a/LICENSE<br>+++ b/LICENSE<br>@@ -1,4 =
+1,4 @@<br>-Copyright (c) 2015-2021, CESNET<br>+Copyright (c) 2015-2024, CE=
SNET<br>=C2=A0All rights reserved.<br><br></div><div><br></div><div>&gt;&gt=
;&gt; libyang 3.12.2 Collecting legal info<br>ERROR: while checking hashes =
from package/libyang/libyang.hash<br>ERROR: LICENSE has wrong sha256 hash:<=
br>ERROR: expected: 0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578bea=
b34cba5bb<br>ERROR: got =C2=A0 =C2=A0 : f4fbaa09c8b2faa6a873a38181ff860e2ff=
90808320f71deb369f03ddfb920da<br>ERROR: Incomplete download, or man-in-the-=
middle (MITM) attack<br>make: *** [package/libyang/<a href=3D"http://libyan=
g.mk:27">libyang.mk:27</a>: libyang-legal-info] Error 1</div><div><br></div=
><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
diff --git a/package/libyang/<a href=3D"http://libyang.mk" rel=3D"noreferre=
r" target=3D"_blank">libyang.mk</a> b/package/libyang/<a href=3D"http://lib=
yang.mk" rel=3D"noreferrer" target=3D"_blank">libyang.mk</a><br>
index fca0cd63f8..94f9ba3b8a 100644<br>
--- a/package/libyang/<a href=3D"http://libyang.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libyang.mk</a><br>
+++ b/package/libyang/<a href=3D"http://libyang.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libyang.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-LIBYANG_VERSION =3D 2.1.148<br>
+LIBYANG_VERSION =3D 3.12.2<br>
=C2=A0LIBYANG_SITE =3D $(call github,CESNET,libyang,v$(LIBYANG_VERSION))<br=
>
=C2=A0LIBYANG_LICENSE =3D BSD-3-Clause<br>
=C2=A0LIBYANG_LICENSE_FILES =3D LICENSE<br>
-- <br>
2.43.0<br>
<br></blockquote><div><br></div><div>Thanks,</div><div>Heiko=C2=A0</div></d=
iv></div>

--00000000000016d57a06345da102--

--===============1153393993730051893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1153393993730051893==--
