Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C87FC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 19:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15EF861369;
	Fri, 16 May 2025 19:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PiXbGU9dtMUS; Fri, 16 May 2025 19:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07EC36135F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07EC36135F;
	Fri, 16 May 2025 19:06:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 484051AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37D5B83D9C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HaYNpl1shPnL for <buildroot@buildroot.org>;
 Fri, 16 May 2025 19:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E54483D98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E54483D98
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E54483D98
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:06:00 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-326cf24aa35so25354721fa.2
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747422358; x=1748027158;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6wKPUvzPZK8f3+aBfMDh1U9k/m4/OnAlyBpa+6Y8IKw=;
 b=txhgkhhDDXC/qSxpIEc+IT7G6IUdnI7MHR09QbUkwEkVclGaUH5Or+TKP+k75mzkO7
 Si6RkY8eqHq7VtyEf6aNmG6Vvq/3s0VPC8zw6tasQiJCKa9J+GrKFX+vGb5k+x1CZD9Y
 vwPhRy/3JaRHaexTAT6GGzyLpLwlKYsqagDoiliVC69sBH0ah2xMLzW8A+hkgBcuAJLT
 ulNrWnOS9Ps8Jg62ib2ABwkP0Zothvw3lHOeCNYHqudCCouvm6y+REuxWZoYRcxRRa+w
 hmgEJ633nAverVZg66OEQ0GYU9QY0B2OVuPrXeRi/Gg/Qpqz9GZjp5CzmT/RHN61vjRn
 R2mQ==
X-Gm-Message-State: AOJu0YxnUVADgVuluu61dDTI76R6nEkfC6lC2UuwDWp1Q/rrePKCAVE0
 +U+wfaq1rXs2z6iBeK3xWG9lNYryfqb8GwVXfVzHhli4gLff4QxZE4DbWOue2JNEtSO+MoYM6Nq
 SPzkvgRCBJA+eNh0z05EwQd1k2hSjMX9YZw2S
X-Gm-Gg: ASbGncsIAAczOMQ8RqYMap+UlMRM/DAIeLGQJ5tJv/GmDDSag70DJmoRozfL70LCOHH
 UmdZiujCbaXaZM+hfZ1/66Cfw+SXfOB4YTkSTcG+LbE2N4qiditNyKP858lFPsjf0PpWuIyfCiB
 Ofkuc/5hllrN+Ma+GhvarJXlevisUqwVU5vp9dDPosJA42qvhiGBJYvGikQ/AZ85FS4ww=
X-Google-Smtp-Source: AGHT+IH+TyL2GOMus7hDSQ/1O0zlPtWs8tFDd5HEAe5hwIQF30eVb8V+uUq525Sa8iGjDc32uzYI+UtHgAtkfVkh/Dw=
X-Received: by 2002:a05:651c:3046:b0:30b:9813:b00c with SMTP id
 38308e7fff4ca-32809783ab2mr11626421fa.27.1747422357532; Fri, 16 May 2025
 12:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250516115331.4E4478694B@busybox.osuosl.org>
In-Reply-To: <20250516115331.4E4478694B@busybox.osuosl.org>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 16 May 2025 21:05:45 +0200
X-Gm-Features: AX0GCFsUW75WZjsMfcYugMhQ9FZmUAcDv6_a64lbHs_5QUx4dNe60RdEN8EDTkc
Message-ID: <CAEyMn7YmLVyM46xBtW+soS82ffcqdH9WaeqOQdexX8B8-QgvFg@mail.gmail.com>
To: Brandon Maier <brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747422358; x=1748027158; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6wKPUvzPZK8f3+aBfMDh1U9k/m4/OnAlyBpa+6Y8IKw=;
 b=AO4qZKqUFAVXGchCYQoFeFGc3QmVMNqOlgaCGwerVgRU7ZnCqDspP2hh7Fr9v6y8yp
 OCx8sa2xwX8W5ZIMPIhnKimjqZtuWUbSRvh0zCdAW6gUF8Mj+noBEj0rCRW2KrMZG0xE
 oZChC0rV6V5eit3ErqqPrLPUCqw9W2koGfNUPRd3pY1CMicSUC0UhmSD4uECht57yWVk
 3h5K6ePO6aShkHt/MDDA6VVl7YBpA7ao46LMDszlNtIz8/zIuX0fdGu4cfyAmkmFbjqD
 D0S/1ue9aZERyYCO4ez+HoevXgiBp4K+Q94KdXx1HnRr3JTpfm9S9sspkHgUfDkbD3bO
 Z5ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AO4qZKqU
Subject: Re: [Buildroot] [git commit] package/mtd: update to 2.3.0
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7771281443006102720=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7771281443006102720==
Content-Type: multipart/alternative; boundary="000000000000e4b51a06354578a3"

--000000000000e4b51a06354578a3
Content-Type: text/plain; charset="UTF-8"

Hi Brandon,

Am Fr., 16. Mai 2025 um 13:53 Uhr schrieb Peter Korsgaard <
peter@korsgaard.com>:

> commit:
> https://git.buildroot.net/buildroot/commit/?id=0c230eef9075a37248488ecf0a877012115f7b58
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Changelog:
> https://git.infradead.org/?p=mtd-utils.git;a=blob;f=CHANGELOG.md
>
> The TestMtd build fails with the following error
>
>   checking pkg-config is at least version 0.9.0... ./configure: line
>   5375: .../output/TestMtd/host/bin/pkg-config: No such file or
>   directory
>
> So we promote host-pkgconf to be a required dependency for the build.
>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/mtd/mtd.hash | 4 ++--
>  package/mtd/mtd.mk   | 9 +++++----
>  2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
> index 0eb90a5118..84b9e83bff 100644
> --- a/package/mtd/mtd.hash
> +++ b/package/mtd/mtd.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
> -sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803
> mtd-utils-2.2.1.tar.bz2
> +# https://infraroot.at/pub/mtd/mtd-utils-2.3.0.tar.bz2.asc
> +sha256  2db102908b232406ccb20719c0f43b61196aef4534493419fbf98a273c598c10
> mtd-utils-2.3.0.tar.bz2
>  sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa
> COPYING
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 77050e7e40..4ff43a1dce 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -MTD_VERSION = 2.2.1
> +MTD_VERSION = 2.3.0
>  MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
>  MTD_SITE = https://infraroot.at/pub/mtd
>  MTD_LICENSE = GPL-2.0
> @@ -12,6 +12,7 @@ MTD_LICENSE_FILES = COPYING
>  MTD_CPE_ID_VENDOR = mtd-utils_project
>  MTD_CPE_ID_PRODUCT = mtd-utils
>  MTD_INSTALL_STAGING = YES
> +MTD_DEPENDENCIES = host-pkgconf
>
>  MTD_LDFLAGS = $(TARGET_LDFLAGS)
>
> @@ -28,7 +29,7 @@ MTD_CONF_OPTS += --without-lzo
>  endif
>
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
> -MTD_DEPENDENCIES += host-pkgconf zlib
> +MTD_DEPENDENCIES += zlib
>  MTD_CONF_OPTS += --with-zlib
>  else
>  MTD_CONF_OPTS += --without-zlib
> @@ -43,7 +44,7 @@ MTD_CONF_OPTS += --without-jffs
>  endif
>
>  ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
> -MTD_DEPENDENCIES += util-linux host-pkgconf
> +MTD_DEPENDENCIES += util-linux
>  MTD_CONF_OPTS += --with-ubifs
>  # crypto needs linux/hash_info.h
>  ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)
> @@ -83,7 +84,7 @@ else
>  MTD_CONF_OPTS += --without-xattr
>  endif
>
> -HOST_MTD_DEPENDENCIES = host-acl host-zlib host-lzo host-util-linux
> host-zstd
> +HOST_MTD_DEPENDENCIES = host-pkgconf host-acl host-zlib host-lzo
> host-util-linux host-zstd
>  HOST_MTD_CONF_OPTS = \
>         --with-jffs \
>         --with-ubifs \
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot



I just updated master and built the mtd package.

>>> mtd 2.3.0 Building
GIT_DIR=.
PATH="/home/hthiery/sources/mainline/buildroot/output/host/bin:/home/hthiery/sources/mainline/buildroot/output/host/sbin:/home/hthiery/.local/bin:/home/hthiery/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
 /usr/bin/make -j5  -C
/home/hthiery/sources/mainline/buildroot/output/build/mtd-2.3.0/
make[1]: Entering directory
'/home/hthiery/sources/mainline/buildroot/output/build/mtd-2.3.0'
  CC       lib/execinfo.o
make[1]: *** No rule to make target
'tests/ubifs_tools-tests/images/good.gz', needed by 'all-am'.  Stop.
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory
'/home/hthiery/sources/mainline/buildroot/output/build/mtd-2.3.0'
make: *** [package/pkg-generic.mk:273:
/home/hthiery/sources/mainline/buildroot/output/build/mtd-2.3.0/.stamp_built]
Error 2

The failure occurs when enabling the MTD_TESTS option

BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_TESTS=y


BR
Heiko

--000000000000e4b51a06354578a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Brandon,</div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Fr., =
16. Mai 2025 um 13:53=C2=A0Uhr schrieb Peter Korsgaard &lt;<a href=3D"mailt=
o:peter@korsgaard.com">peter@korsgaard.com</a>&gt;:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">commit: <a href=3D"https://git.buildroo=
t.net/buildroot/commit/?id=3D0c230eef9075a37248488ecf0a877012115f7b58" rel=
=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/buildroot/commi=
t/?id=3D0c230eef9075a37248488ecf0a877012115f7b58</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" rel=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/=
buildroot/commit/?id=3Drefs/heads/master</a><br>
<br>
Changelog: <a href=3D"https://git.infradead.org/?p=3Dmtd-utils.git;a=3Dblob=
;f=3DCHANGELOG.md" rel=3D"noreferrer" target=3D"_blank">https://git.infrade=
ad.org/?p=3Dmtd-utils.git;a=3Dblob;f=3DCHANGELOG.md</a><br>
<br>
The TestMtd build fails with the following error<br>
<br>
=C2=A0 checking pkg-config is at least version 0.9.0... ./configure: line<b=
r>
=C2=A0 5375: .../output/TestMtd/host/bin/pkg-config: No such file or<br>
=C2=A0 directory<br>
<br>
So we promote host-pkgconf to be a required dependency for the build.<br>
<br>
Signed-off-by: Brandon Maier &lt;<a href=3D"mailto:brandon.maier@collins.co=
m" target=3D"_blank">brandon.maier@collins.com</a>&gt;<br>
Signed-off-by: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" t=
arget=3D"_blank">peter@korsgaard.com</a>&gt;<br>
---<br>
=C2=A0package/mtd/mtd.hash | 4 ++--<br>
=C2=A0package/mtd/<a href=3D"http://mtd.mk" rel=3D"noreferrer" target=3D"_b=
lank">mtd.mk</a>=C2=A0 =C2=A0| 9 +++++----<br>
=C2=A02 files changed, 7 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash<br>
index 0eb90a5118..84b9e83bff 100644<br>
--- a/package/mtd/mtd.hash<br>
+++ b/package/mtd/mtd.hash<br>
@@ -1,4 +1,4 @@<br>
=C2=A0# Locally calculated after checking pgp signature<br>
-# <a href=3D"https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc" rel=
=3D"noreferrer" target=3D"_blank">https://infraroot.at/pub/mtd/mtd-utils-2.=
2.1.tar.bz2.asc</a><br>
-sha256=C2=A0 f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c=
803=C2=A0 mtd-utils-2.2.1.tar.bz2<br>
+# <a href=3D"https://infraroot.at/pub/mtd/mtd-utils-2.3.0.tar.bz2.asc" rel=
=3D"noreferrer" target=3D"_blank">https://infraroot.at/pub/mtd/mtd-utils-2.=
3.0.tar.bz2.asc</a><br>
+sha256=C2=A0 2db102908b232406ccb20719c0f43b61196aef4534493419fbf98a273c598=
c10=C2=A0 mtd-utils-2.3.0.tar.bz2<br>
=C2=A0sha256=C2=A0 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a2528=
9852dcaa=C2=A0 COPYING<br>
diff --git a/package/mtd/<a href=3D"http://mtd.mk" rel=3D"noreferrer" targe=
t=3D"_blank">mtd.mk</a> b/package/mtd/<a href=3D"http://mtd.mk" rel=3D"nore=
ferrer" target=3D"_blank">mtd.mk</a><br>
index 77050e7e40..4ff43a1dce 100644<br>
--- a/package/mtd/<a href=3D"http://mtd.mk" rel=3D"noreferrer" target=3D"_b=
lank">mtd.mk</a><br>
+++ b/package/mtd/<a href=3D"http://mtd.mk" rel=3D"noreferrer" target=3D"_b=
lank">mtd.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-MTD_VERSION =3D 2.2.1<br>
+MTD_VERSION =3D 2.3.0<br>
=C2=A0MTD_SOURCE =3D mtd-utils-$(MTD_VERSION).tar.bz2<br>
=C2=A0MTD_SITE =3D <a href=3D"https://infraroot.at/pub/mtd" rel=3D"noreferr=
er" target=3D"_blank">https://infraroot.at/pub/mtd</a><br>
=C2=A0MTD_LICENSE =3D GPL-2.0<br>
@@ -12,6 +12,7 @@ MTD_LICENSE_FILES =3D COPYING<br>
=C2=A0MTD_CPE_ID_VENDOR =3D mtd-utils_project<br>
=C2=A0MTD_CPE_ID_PRODUCT =3D mtd-utils<br>
=C2=A0MTD_INSTALL_STAGING =3D YES<br>
+MTD_DEPENDENCIES =3D host-pkgconf<br>
<br>
=C2=A0MTD_LDFLAGS =3D $(TARGET_LDFLAGS)<br>
<br>
@@ -28,7 +29,7 @@ MTD_CONF_OPTS +=3D --without-lzo<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_ZLIB),y)<br>
-MTD_DEPENDENCIES +=3D host-pkgconf zlib<br>
+MTD_DEPENDENCIES +=3D zlib<br>
=C2=A0MTD_CONF_OPTS +=3D --with-zlib<br>
=C2=A0else<br>
=C2=A0MTD_CONF_OPTS +=3D --without-zlib<br>
@@ -43,7 +44,7 @@ MTD_CONF_OPTS +=3D --without-jffs<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)<br>
-MTD_DEPENDENCIES +=3D util-linux host-pkgconf<br>
+MTD_DEPENDENCIES +=3D util-linux<br>
=C2=A0MTD_CONF_OPTS +=3D --with-ubifs<br>
=C2=A0# crypto needs linux/hash_info.h<br>
=C2=A0ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy=
)<br>
@@ -83,7 +84,7 @@ else<br>
=C2=A0MTD_CONF_OPTS +=3D --without-xattr<br>
=C2=A0endif<br>
<br>
-HOST_MTD_DEPENDENCIES =3D host-acl host-zlib host-lzo host-util-linux host=
-zstd<br>
+HOST_MTD_DEPENDENCIES =3D host-pkgconf host-acl host-zlib host-lzo host-ut=
il-linux host-zstd<br>
=C2=A0HOST_MTD_CONF_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-jffs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-ubifs \<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a></blockquote><div><br></div><div><br></div><div>I just updated =
master and built the mtd package.</div><div><br></div>&gt;&gt;&gt; mtd 2.3.=
0 Building<br>GIT_DIR=3D. PATH=3D&quot;/home/hthiery/sources/mainline/build=
root/output/host/bin:/home/hthiery/sources/mainline/buildroot/output/host/s=
bin:/home/hthiery/.local/bin:/home/hthiery/bin:/usr/local/bin:/usr/bin:/bin=
:/usr/local/games:/usr/games&quot; =C2=A0/usr/bin/make -j5 =C2=A0-C /home/h=
thiery/sources/mainline/buildroot/output/build/mtd-2.3.0/<br>make[1]: Enter=
ing directory &#39;/home/hthiery/sources/mainline/buildroot/output/build/mt=
d-2.3.0&#39;<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0 lib/execinfo.o<br>make[1]: *=
** No rule to make target &#39;tests/ubifs_tools-tests/images/good.gz&#39;,=
 needed by &#39;all-am&#39;.=C2=A0 Stop.<br>make[1]: *** Waiting for unfini=
shed jobs....<br>make[1]: Leaving directory &#39;/home/hthiery/sources/main=
line/buildroot/output/build/mtd-2.3.0&#39;<br>make: *** [package/<a href=3D=
"http://pkg-generic.mk:273">pkg-generic.mk:273</a>: /home/hthiery/sources/m=
ainline/buildroot/output/build/mtd-2.3.0/.stamp_built] Error 2</div><div cl=
ass=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gmail_quo=
te gmail_quote_container">The failure occurs when enabling the MTD_TESTS op=
tion</div><div class=3D"gmail_quote gmail_quote_container"><br></div><div c=
lass=3D"gmail_quote gmail_quote_container">BR2_PACKAGE_MTD=3Dy</div><div cl=
ass=3D"gmail_quote gmail_quote_container">BR2_PACKAGE_MTD_TESTS=3Dy</div><d=
iv class=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gmai=
l_quote gmail_quote_container"><br></div><div class=3D"gmail_quote gmail_qu=
ote_container">BR</div><div class=3D"gmail_quote gmail_quote_container">Hei=
ko</div></div>

--000000000000e4b51a06354578a3--

--===============7771281443006102720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7771281443006102720==--
