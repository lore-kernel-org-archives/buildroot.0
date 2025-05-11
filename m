Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF85C3ABC5
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 19:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5CC04062E;
	Sun, 11 May 2025 19:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bYQPPiE1Hzo; Sun, 11 May 2025 19:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDED740632
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDED740632;
	Sun, 11 May 2025 19:42:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA7BB154
 for <buildroot@buildroot.org>; Sun, 11 May 2025 19:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C605081331
 for <buildroot@buildroot.org>; Sun, 11 May 2025 19:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tu15t4-HPdu9 for <buildroot@buildroot.org>;
 Sun, 11 May 2025 19:42:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8AC1680F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC1680F91
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AC1680F91
 for <buildroot@buildroot.org>; Sun, 11 May 2025 19:42:36 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-3105ef2a071so43092831fa.1
 for <buildroot@buildroot.org>; Sun, 11 May 2025 12:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746992554; x=1747597354;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cLiUiA6+pGyE8WHGV+R/wqFLX3ef0iONiVsVKPma7rI=;
 b=WTKTVi0Xuxcb2Mk400oUjOTKpSU13asmZ4Ffw63YuXIrqdWykWX4gqQ0Y3l3BLbfZm
 mxqP77TOmQ3tef5xLkcBoxIcqilyU2Z28yWa1dEzmh225dYHnxKgVhda7NL8jrhLaOit
 1XcNgfi3DBKi9q+aZD1LD3Q4G/E/EX4iV6Z2W66A8Ck/I30dxDjAqIGGf4t59B57rCrW
 SQZ+m3m4Eutou+CROJAL/aT0eXM178OlXpnT+Us+qgAeG0joWneVButRrwyeMdxXgPMX
 vNMFekKrEZS3tAnJBObJMyo5mRHZXgB/KyECo0VrjPuOgzYvHRDXME4UcfvG2CMvmFtA
 l1vQ==
X-Gm-Message-State: AOJu0Yx4NbNfkAayCkBYzTd1GNnV7aIEZUq/oFf4JEPC6G1luXaRw2px
 5feKlxlNgq+0t2YRzNxicIxabEmjthg6BaxLRwrr4Y6ESerpJdrvbn68QjEKO4J9K5vINXqGgKA
 aDp98fdLFo9GTkPPc2H8+oB5aIcY=
X-Gm-Gg: ASbGncsCytl/OSwHRIOTRZDX7JcjfbsyEUNjyYJRbT/GxMg/i/blOx0JOamo9VCoBe9
 pmcxl84LbGaQ9DwrphMSGqXEBVpNx503u0FTME5gQXa10NtMzNjjpRekn/GLXceX255JQd2oQmA
 nvCcFSjnPU7SVxoZPbSlGh5q4h3ls6AzmTYGRJjz0yhrrvYI8hXGoHljcRranRUCLTIDY=
X-Google-Smtp-Source: AGHT+IEXws7jrbt0Hy0QyyjjnKhAOWX+R90+4fPWAypOWdas+80+f7fPgODVYx+xzNuzfGfSXJFeFbg3Xy+rt/R8EOc=
X-Received: by 2002:a05:651c:154b:b0:310:856b:6875 with SMTP id
 38308e7fff4ca-326c45c42d1mr36366761fa.14.1746992553632; Sun, 11 May 2025
 12:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250510203122.1916485-1-lazzer@gmail.com>
 <20250510203122.1916485-5-lazzer@gmail.com>
In-Reply-To: <20250510203122.1916485-5-lazzer@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 11 May 2025 21:42:21 +0200
X-Gm-Features: AX0GCFsmF7B0k7ZL-b6HL649nzHSVOrhRSLSuIbq4SL6xtlx4Sz9Uki0gGdKKiA
Message-ID: <CAEyMn7bJZESZLmfGB8ZuUmFNPRyOTN28YbEvzbksob4qXMNmEQ@mail.gmail.com>
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org,
 =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746992554; x=1747597354; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cLiUiA6+pGyE8WHGV+R/wqFLX3ef0iONiVsVKPma7rI=;
 b=U2Wnt5oCx3OTLuHj0D0tdQN4t3D6FgQG8bCG7CldP8TqzTxvX9iB6VEAneY1DjzyCY
 qgS3MlmqogNH8lFT7yE4mUuRZD1R3N7ZXxhFVL8EkocjByrxZvciP8Gf73nCvOhLCiaT
 t3GM0xx7/5CQuKC7JTRLUK4vfJ0l5bQpRPcq9DjrrT8MEkz789m9bdCL30RFcy+kuBWs
 bEiqqd4tkuSaAK9qAupg6VwniPytlZhUUIYT8YcN28LMIj3Pl+omx1038oEfF7Wz7WS1
 PlbtCUVGUvfoqB43kRzI0lDILTXTaHGmZ/54XZ5Hx1bIw6eFdjdnCtaAvFFbMBvCUsdD
 JisA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U2Wnt5oC
Subject: Re: [Buildroot] [PATCH v2 4/5] package/netopeer2: bump to version
 2.4.1
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
Content-Type: multipart/mixed; boundary="===============1376678525284969115=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1376678525284969115==
Content-Type: multipart/alternative; boundary="00000000000095a7680634e16627"

--00000000000095a7680634e16627
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Am Sa., 10. Mai 2025 um 22:31 Uhr schrieb Mattias Walstr=C3=B6m <lazzer@gma=
il.com
>:

> Changelog:
>  internal support of ietf-system-capabilities and
> ietf-notification-capabilities (@jeremie6wind)
>  minor bugfixes and improvements
>
> Depends on:
>  - libyang v3.12.2 https://github.com/CESNET/libyang/releases/tag/v3.12.2
>  - libnetconf2 v3.7.1
> https://github.com/CESNET/libnetconf2/releases/tag/v3.7.1
>  - sysrepo v3.6.11 https://github.com/sysrepo/sysrepo/releases/tag/v3.6.1=
1
>
> Signed-off-by: Mattias Walstr=C3=B6m <lazzer@gmail.com>
> ---
>  package/netopeer2/Config.in      | 1 -
>  package/netopeer2/netopeer2.hash | 2 +-
>  package/netopeer2/netopeer2.mk   | 2 +-
>  3 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in
> index db31a786a1..c14818064f 100644
> --- a/package/netopeer2/Config.in
> +++ b/package/netopeer2/Config.in
> @@ -16,7 +16,6 @@ config BR2_PACKAGE_NETOPEER2
>         select BR2_PACKAGE_LIBSSH
>         select BR2_PACKAGE_LIBSSH_SERVER # For libnetconf2 to have SSH
>         select BR2_PACKAGE_LIBYANG
> -       select BR2_PACKAGE_OPENSSL # For libnetconf2 to have TLS
>         select BR2_PACKAGE_SYSREPO
>         help
>           Netopeer2 is a set of tools implementing network configuration
> diff --git a/package/netopeer2/netopeer2.hash
> b/package/netopeer2/netopeer2.hash
> index 6a278fbbaf..3a70b15539 100644
> --- a/package/netopeer2/netopeer2.hash
> +++ b/package/netopeer2/netopeer2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  2b1daac037f18c303e0c0dc3318ba30196459472e4c59f2f8547ee74d4cdf31d
> netopeer2-2.1.49.tar.gz
> +sha256  86d77efcb65f0bb2c3bc0f2128a320113ce7125f39882fe7d8334c168ed9567d
> netopeer2-2.4.1.tar.gz
>  sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b
> LICENSE
> diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/
> netopeer2.mk
> index 4853e5d176..71f2c50640 100644
> --- a/package/netopeer2/netopeer2.mk
> +++ b/package/netopeer2/netopeer2.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -NETOPEER2_VERSION =3D 2.1.49
> +NETOPEER2_VERSION =3D 2.4.1
>  NETOPEER2_SITE =3D $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
>  NETOPEER2_DL_SUBDIR =3D netopeer2
>  NETOPEER2_LICENSE =3D BSD-3-Clause
> --
> 2.43.0
>


We need to bring the required dependies for libnetconf2 to netopeer2 and
select the packages accordingly. See here the modifications.

diff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in
index db31a786a1..5e55b7ce52 100644
--- a/package/netopeer2/Config.in
+++ b/package/netopeer2/Config.in
@@ -13,10 +13,13 @@ config BR2_PACKAGE_NETOPEER2
        depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # sysrepo
        select BR2_PACKAGE_LIBNETCONF2
+       select BR2_PACKAGE_LIBNETCONF2_SSH_TLS
+       select BR2_PACKAGE_LIBCURL
        select BR2_PACKAGE_LIBSSH
        select BR2_PACKAGE_LIBSSH_SERVER # For libnetconf2 to have SSH
+       select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC # for
libnetconf2
        select BR2_PACKAGE_LIBYANG
-       select BR2_PACKAGE_OPENSSL # For libnetconf2 to have TLS
+       select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
        select BR2_PACKAGE_SYSREPO
        help
          Netopeer2 is a set of tools implementing network configuration
diff --git a/package/netopeer2/netopeer2.hash
b/package/netopeer2/netopeer2.hash
index 6a278fbbaf..3a70b15539 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2b1daac037f18c303e0c0dc3318ba30196459472e4c59f2f8547ee74d4cdf31d
 netopeer2-2.1.49.tar.gz
+sha256  86d77efcb65f0bb2c3bc0f2128a320113ce7125f39882fe7d8334c168ed9567d
 netopeer2-2.4.1.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b
 LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.m=
k
index 4853e5d176..71f2c50640 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ##########################################################################=
######

-NETOPEER2_VERSION =3D 2.1.49
+NETOPEER2_VERSION =3D 2.4.1
 NETOPEER2_SITE =3D $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR =3D netopeer2
 NETOPEER2_LICENSE =3D BSD-3-Clause


By the way. I think you should reorder your patches in the series. Add the
netopeer2 changes at the end because it is based on the changes in
libnetconf2.


BR
Heiko

--00000000000095a7680634e16627
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Sa., 10. Mai =
2025 um 22:31=C2=A0Uhr schrieb Mattias Walstr=C3=B6m &lt;<a href=3D"mailto:=
lazzer@gmail.com">lazzer@gmail.com</a>&gt;:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Changelog:<br>
=C2=A0internal support of ietf-system-capabilities and ietf-notification-ca=
pabilities (@jeremie6wind)<br>
=C2=A0minor bugfixes and improvements<br>
<br>
Depends on:<br>
=C2=A0- libyang v3.12.2 <a href=3D"https://github.com/CESNET/libyang/releas=
es/tag/v3.12.2" rel=3D"noreferrer" target=3D"_blank">https://github.com/CES=
NET/libyang/releases/tag/v3.12.2</a><br>
=C2=A0- libnetconf2 v3.7.1 <a href=3D"https://github.com/CESNET/libnetconf2=
/releases/tag/v3.7.1" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/CESNET/libnetconf2/releases/tag/v3.7.1</a><br>
=C2=A0- sysrepo v3.6.11 <a href=3D"https://github.com/sysrepo/sysrepo/relea=
ses/tag/v3.6.11" rel=3D"noreferrer" target=3D"_blank">https://github.com/sy=
srepo/sysrepo/releases/tag/v3.6.11</a><br>
<br>
Signed-off-by: Mattias Walstr=C3=B6m &lt;<a href=3D"mailto:lazzer@gmail.com=
" target=3D"_blank">lazzer@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/netopeer2/Config.in=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0package/netopeer2/netopeer2.hash | 2 +-<br>
=C2=A0package/netopeer2/<a href=3D"http://netopeer2.mk" rel=3D"noreferrer" =
target=3D"_blank">netopeer2.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A03 files changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in<br>
index db31a786a1..c14818064f 100644<br>
--- a/package/netopeer2/Config.in<br>
+++ b/package/netopeer2/Config.in<br>
@@ -16,7 +16,6 @@ config BR2_PACKAGE_NETOPEER2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBSSH<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBSSH_SERVER # For libnetco=
nf2 to have SSH<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBYANG<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_OPENSSL # For libnetconf2 to=
 have TLS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_SYSREPO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Netopeer2 is a set of tools implementing=
 network configuration<br>
diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2=
.hash<br>
index 6a278fbbaf..3a70b15539 100644<br>
--- a/package/netopeer2/netopeer2.hash<br>
+++ b/package/netopeer2/netopeer2.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally calculated<br>
-sha256=C2=A0 2b1daac037f18c303e0c0dc3318ba30196459472e4c59f2f8547ee74d4cdf=
31d=C2=A0 netopeer2-2.1.49.tar.gz<br>
+sha256=C2=A0 86d77efcb65f0bb2c3bc0f2128a320113ce7125f39882fe7d8334c168ed95=
67d=C2=A0 netopeer2-2.4.1.tar.gz<br>
=C2=A0sha256=C2=A0 b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f66=
89cba95b=C2=A0 LICENSE<br>
diff --git a/package/netopeer2/<a href=3D"http://netopeer2.mk" rel=3D"noref=
errer" target=3D"_blank">netopeer2.mk</a> b/package/netopeer2/<a href=3D"ht=
tp://netopeer2.mk" rel=3D"noreferrer" target=3D"_blank">netopeer2.mk</a><br=
>
index 4853e5d176..71f2c50640 100644<br>
--- a/package/netopeer2/<a href=3D"http://netopeer2.mk" rel=3D"noreferrer" =
target=3D"_blank">netopeer2.mk</a><br>
+++ b/package/netopeer2/<a href=3D"http://netopeer2.mk" rel=3D"noreferrer" =
target=3D"_blank">netopeer2.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-NETOPEER2_VERSION =3D 2.1.49<br>
+NETOPEER2_VERSION =3D 2.4.1<br>
=C2=A0NETOPEER2_SITE =3D $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSIO=
N))<br>
=C2=A0NETOPEER2_DL_SUBDIR =3D netopeer2<br>
=C2=A0NETOPEER2_LICENSE =3D BSD-3-Clause<br>
-- <br>
2.43.0<br></blockquote><div><br></div><div><br></div><div>We need to bring =
the required dependies=C2=A0for libnetconf2 to netopeer2 and select the pac=
kages accordingly. See here the modifications.=C2=A0</div><div><br></div>di=
ff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in<br>ind=
ex db31a786a1..5e55b7ce52 100644<br>--- a/package/netopeer2/Config.in<br>++=
+ b/package/netopeer2/Config.in<br>@@ -13,10 +13,13 @@ config BR2_PACKAGE_N=
ETOPEER2<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_THREAD=
S_NPTL<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_GCC_AT_LEAST=
_4_8 # sysrepo<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBNETCONF=
2<br>+ =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBNETCONF2_SSH_TLS<br>+ =C2=
=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBCURL<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 select BR2_PACKAGE_LIBSSH<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAG=
E_LIBSSH_SERVER # For libnetconf2 to have SSH<br>+ =C2=A0 =C2=A0 =C2=A0 sel=
ect BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC # for libnetconf2<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBYANG<br>- =C2=A0 =C2=A0 =
=C2=A0 select BR2_PACKAGE_OPENSSL # For libnetconf2 to have TLS<br>+ =C2=A0=
 =C2=A0 =C2=A0 select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_SYSREPO<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 help<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Netopeer2 is a set of too=
ls implementing network configuration<br>diff --git a/package/netopeer2/net=
opeer2.hash b/package/netopeer2/netopeer2.hash<br>index 6a278fbbaf..3a70b15=
539 100644<br>--- a/package/netopeer2/netopeer2.hash<br>+++ b/package/netop=
eer2/netopeer2.hash<br>@@ -1,3 +1,3 @@<br>=C2=A0# Locally calculated<br>-sh=
a256 =C2=A02b1daac037f18c303e0c0dc3318ba30196459472e4c59f2f8547ee74d4cdf31d=
 =C2=A0netopeer2-2.1.49.tar.gz<br>+sha256 =C2=A086d77efcb65f0bb2c3bc0f2128a=
320113ce7125f39882fe7d8334c168ed9567d =C2=A0netopeer2-2.4.1.tar.gz<br>=C2=
=A0sha256 =C2=A0b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689c=
ba95b =C2=A0LICENSE<br>diff --git a/package/netopeer2/<a href=3D"http://net=
opeer2.mk">netopeer2.mk</a> b/package/netopeer2/<a href=3D"http://netopeer2=
.mk">netopeer2.mk</a><br>index 4853e5d176..71f2c50640 100644<br>--- a/packa=
ge/netopeer2/<a href=3D"http://netopeer2.mk">netopeer2.mk</a><br>+++ b/pack=
age/netopeer2/<a href=3D"http://netopeer2.mk">netopeer2.mk</a><br>@@ -4,7 +=
4,7 @@<br>=C2=A0#<br>=C2=A0################################################=
################################<br>=C2=A0<br>-NETOPEER2_VERSION =3D 2.1.49=
<br>+NETOPEER2_VERSION =3D 2.4.1<br>=C2=A0NETOPEER2_SITE =3D $(call github,=
CESNET,Netopeer2,v$(NETOPEER2_VERSION))<br>=C2=A0NETOPEER2_DL_SUBDIR =3D ne=
topeer2<br><div>=C2=A0NETOPEER2_LICENSE =3D BSD-3-Clause=C2=A0</div><div><b=
r></div><div><br></div><div>By the way.=C2=A0I think you should reorder you=
r patches in the series. Add the netopeer2 changes at the end because it is=
 based on the changes in libnetconf2.</div><div><br></div><div><br></div><d=
iv>BR</div><div>Heiko</div></div></div>

--00000000000095a7680634e16627--

--===============1376678525284969115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1376678525284969115==--
