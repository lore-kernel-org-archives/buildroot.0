Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F94C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A10DC83B32;
	Mon, 19 May 2025 11:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9d8-5PQfSlkg; Mon, 19 May 2025 11:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7147D80F50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7147D80F50;
	Mon, 19 May 2025 11:40:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 511F1193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 11:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4269880F50
 for <buildroot@buildroot.org>; Mon, 19 May 2025 11:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiFaoCa6g0Li for <buildroot@buildroot.org>;
 Mon, 19 May 2025 11:40:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03BF18366E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03BF18366E
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03BF18366E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 11:40:25 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-327ff195303so35161241fa.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 04:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747654824; x=1748259624;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hx//78RPWdOZxM6pV/eqwKA0oBgoYdHRcm9eHPZIFms=;
 b=LXckbboCh5HUSSI7uKC1x7mptpDSEhqeVG4JbQ5D+/q/hMUEc54VY4QV6mfzIgfh8u
 VQYhMqI0rTVjyCAtpG2w0NWB7sJHuubogvDJbxBajaOTgthkQhWQyzHriF9wlrUE/skR
 Li++uPqr50/aqg3nP9Hx944rdSc6KL1+SVLENUNVHkevr3VuuBSldIaXiu+svMQQ0uLi
 lhfXw7n7LWT3cbwU1W7A0rN5otlY+/h4Jezf4MXZDGVsq7Ch+xVa1MEKiHHLhwJ7zS+n
 8O06FTML+OrrJl41pcxV+vuNDafBRuJhS1NhwTG0Ryd+L53FpEIWtaC5I3NEeoIsZzhn
 wa7Q==
X-Gm-Message-State: AOJu0YznTUPq/mYinBjMcYEsn2UGgrYocwbDvjyuzxe7HzwMXLyinytp
 YitB4Ikw96KmRaCPQCWHt7OEF2AOWc7S6jgpy/A0nwmmbwcMTpmx6pDvcG+/K+gXHj2PtoU0MX+
 mxTlxa1ltIp+Ur7L7JQUraoUw7obHqBiktA==
X-Gm-Gg: ASbGncuIdfCHXodtScPQdWB4mGTGNGvk/Sfi0u8pQOj+JuizG4bM3/k7vGll2ne0CzQ
 FoRxa4PF4E0DNQDYIrXRgucPkGUvd4vhk+m2cTwneHTkOd0mFdpJhqEt0bzLXt6tJ/SEQpzwdDS
 MeHPE30q6yLqRA6yrAF7IP+Xkm7VA4nMJDbPkt9eZnerNhXx8eLvkRNSAVDRufQQCbbe8=
X-Google-Smtp-Source: AGHT+IG9n15yRRFmXHtgtqzZGDu8YRWk38zofOGu8uPZl17VLSVSj5i6MkolzVKG0ZxIDBfT7Zp4Tm8L6EB0aSYcWso=
X-Received: by 2002:a05:651c:552:b0:30a:2a8a:e4b5 with SMTP id
 38308e7fff4ca-328077917e1mr38509681fa.27.1747654822597; Mon, 19 May 2025
 04:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250516-mtd-2-3-0-revert-v1-1-7f19b06acf09@collins.com>
In-Reply-To: <20250516-mtd-2-3-0-revert-v1-1-7f19b06acf09@collins.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 19 May 2025 13:40:10 +0200
X-Gm-Features: AX0GCFsE10fVa9ChHd3mao4X7qEHQg_VNdw27CeRbK1MQQGfIF_CLwXI9oTeCPk
Message-ID: <CAEyMn7bOpnNpME1NSX39QV9FECQaKZ_ACruEjybdQ+0JnxpjOg@mail.gmail.com>
To: Brandon Maier <brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747654824; x=1748259624; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hx//78RPWdOZxM6pV/eqwKA0oBgoYdHRcm9eHPZIFms=;
 b=BOTsuTV21fJFL73PaTHP1mb92wRci5VAALL8JvklIRtWqD9BrgFmDAI7NuByTdbkZc
 xGP/LNGWpzTqRBQVOcjzm/9Za7vN3Xo/agFZdhYDYdSVe7jiXi9/VzwBqMEYU7LIbz2n
 CqU6Bd4SihbupGHb/Kj2LDJtxycgUk+MiYAVf5+lct7JBNto62rS8VM0fLb/5lppOpHU
 8UHsjagF/3WHSZ4sUIyj684e1bu7nL9IX41J/Ilyhz7m+QQGxCWjN1JGQM5xNMI9hWcY
 RFUja3hcn7yEJSEBmkIORVsuF1dPhfXShk23ydkhxGDz9lNwb34COnhMKmecWvD2kqT/
 9z/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BOTsuTV2
Subject: Re: [Buildroot] [PATCH] package/mtd: revert update to 2.3.0
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
Content-Type: multipart/mixed; boundary="===============8766865505782451593=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8766865505782451593==
Content-Type: multipart/alternative; boundary="000000000000e4194e06357b987c"

--000000000000e4194e06357b987c
Content-Type: text/plain; charset="UTF-8"

Hi Brandon,

Am Sa., 17. Mai 2025 um 00:30 Uhr schrieb Brandon Maier <
brandon.maier@collins.com>:

> The mtd package fails to compile when BR2_PACKAGE_MTD_TESTS=y is enabled
> with the following error.
>
> > make[1]: *** No rule to make target
> > 'tests/ubifs_tools-tests/images/good.gz', needed by 'all-am'.  Stop.
>
> This issue was reported upstream and a patch submitted. However we can't
> apply the patch to fix the problem. The issue is that a file is missing
> from the released tarball, so only a new MTD release can fix it.
>

Thank you!


> This reverts commit 0c230eef9075a37248488ecf0a877012115f7b58.
>
> Upstream:
> https://lore.kernel.org/linux-mtd/20250220112554.2150046-1-m.olbrich@pengutronix.de/
> Reported-by
> <https://lore.kernel.org/linux-mtd/20250220112554.2150046-1-m.olbrich@pengutronix.de/Reported-by>:
> Heiko Thiery <heiko.thiery@gmail.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  package/mtd/mtd.hash | 4 ++--
>  package/mtd/mtd.mk   | 9 ++++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
> index
> 84b9e83bff25814421e40bb9545cfa1af83007eb..0eb90a5118be19ca20c84b1c6d04c22b62330054
> 100644
> --- a/package/mtd/mtd.hash
> +++ b/package/mtd/mtd.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://infraroot.at/pub/mtd/mtd-utils-2.3.0.tar.bz2.asc
> -sha256  2db102908b232406ccb20719c0f43b61196aef4534493419fbf98a273c598c10
> mtd-utils-2.3.0.tar.bz2
> +# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
> +sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803
> mtd-utils-2.2.1.tar.bz2
>  sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa
> COPYING
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index
> 4ff43a1dce6662d1c5365ce4da1f1a622d80ab7b..77050e7e40b6244c632c8298f6de52de8e2e485b
> 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -MTD_VERSION = 2.3.0
> +MTD_VERSION = 2.2.1
>  MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
>  MTD_SITE = https://infraroot.at/pub/mtd
>  MTD_LICENSE = GPL-2.0
> @@ -12,7 +12,6 @@ MTD_LICENSE_FILES = COPYING
>  MTD_CPE_ID_VENDOR = mtd-utils_project
>  MTD_CPE_ID_PRODUCT = mtd-utils
>  MTD_INSTALL_STAGING = YES
> -MTD_DEPENDENCIES = host-pkgconf
>
>  MTD_LDFLAGS = $(TARGET_LDFLAGS)
>
> @@ -29,7 +28,7 @@ MTD_CONF_OPTS += --without-lzo
>  endif
>
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
> -MTD_DEPENDENCIES += zlib
> +MTD_DEPENDENCIES += host-pkgconf zlib
>  MTD_CONF_OPTS += --with-zlib
>  else
>  MTD_CONF_OPTS += --without-zlib
> @@ -44,7 +43,7 @@ MTD_CONF_OPTS += --without-jffs
>  endif
>
>  ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
> -MTD_DEPENDENCIES += util-linux
> +MTD_DEPENDENCIES += util-linux host-pkgconf
>  MTD_CONF_OPTS += --with-ubifs
>  # crypto needs linux/hash_info.h
>  ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)
> @@ -84,7 +83,7 @@ else
>  MTD_CONF_OPTS += --without-xattr
>  endif
>
> -HOST_MTD_DEPENDENCIES = host-pkgconf host-acl host-zlib host-lzo
> host-util-linux host-zstd
> +HOST_MTD_DEPENDENCIES = host-acl host-zlib host-lzo host-util-linux
> host-zstd
>  HOST_MTD_CONF_OPTS = \
>         --with-jffs \
>         --with-ubifs \
>
> ---
> base-commit: 6cd8f95346aaf7dd7c26e83d263969e5406420bd
> change-id: 20250516-mtd-2-3-0-revert-28b5ef1055fc
>
> Best regards,
> --
> Brandon Maier <brandon.maier@collins.com>
>
>

--000000000000e4194e06357b987c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Brandon,</div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Sa., =
17. Mai 2025 um 00:30=C2=A0Uhr schrieb Brandon Maier &lt;<a href=3D"mailto:=
brandon.maier@collins.com">brandon.maier@collins.com</a>&gt;:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">The mtd package fails to comp=
ile when BR2_PACKAGE_MTD_TESTS=3Dy is enabled<br>
with the following error.<br>
<br>
&gt; make[1]: *** No rule to make target<br>
&gt; &#39;tests/ubifs_tools-tests/images/good.gz&#39;, needed by &#39;all-a=
m&#39;.=C2=A0 Stop.<br>
<br>
This issue was reported upstream and a patch submitted. However we can&#39;=
t<br>
apply the patch to fix the problem. The issue is that a file is missing<br>
from the released tarball, so only a new MTD release can fix it.<br></block=
quote><div><br></div><div>Thank you!</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
This reverts commit 0c230eef9075a37248488ecf0a877012115f7b58.<br>
<br>
Upstream: <a href=3D"https://lore.kernel.org/linux-mtd/20250220112554.21500=
46-1-m.olbrich@pengutronix.de/Reported-by" rel=3D"noreferrer" target=3D"_bl=
ank">https://lore.kernel.org/linux-mtd/20250220112554.2150046-1-m.olbrich@p=
engutronix.de/<br>
Reported-by</a>: Heiko Thiery &lt;<a href=3D"mailto:heiko.thiery@gmail.com"=
 target=3D"_blank">heiko.thiery@gmail.com</a>&gt;<br>
Signed-off-by: Brandon Maier &lt;<a href=3D"mailto:brandon.maier@collins.co=
m" target=3D"_blank">brandon.maier@collins.com</a>&gt;<br>
---<br>
=C2=A0package/mtd/mtd.hash | 4 ++--<br>
=C2=A0package/mtd/<a href=3D"http://mtd.mk" rel=3D"noreferrer" target=3D"_b=
lank">mtd.mk</a>=C2=A0 =C2=A0| 9 ++++-----<br>
=C2=A02 files changed, 6 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash<br>
index 84b9e83bff25814421e40bb9545cfa1af83007eb..0eb90a5118be19ca20c84b1c6d0=
4c22b62330054 100644<br>
--- a/package/mtd/mtd.hash<br>
+++ b/package/mtd/mtd.hash<br>
@@ -1,4 +1,4 @@<br>
=C2=A0# Locally calculated after checking pgp signature<br>
-# <a href=3D"https://infraroot.at/pub/mtd/mtd-utils-2.3.0.tar.bz2.asc" rel=
=3D"noreferrer" target=3D"_blank">https://infraroot.at/pub/mtd/mtd-utils-2.=
3.0.tar.bz2.asc</a><br>
-sha256=C2=A0 2db102908b232406ccb20719c0f43b61196aef4534493419fbf98a273c598=
c10=C2=A0 mtd-utils-2.3.0.tar.bz2<br>
+# <a href=3D"https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc" rel=
=3D"noreferrer" target=3D"_blank">https://infraroot.at/pub/mtd/mtd-utils-2.=
2.1.tar.bz2.asc</a><br>
+sha256=C2=A0 f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c=
803=C2=A0 mtd-utils-2.2.1.tar.bz2<br>
=C2=A0sha256=C2=A0 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a2528=
9852dcaa=C2=A0 COPYING<br>
diff --git a/package/mtd/<a href=3D"http://mtd.mk" rel=3D"noreferrer" targe=
t=3D"_blank">mtd.mk</a> b/package/mtd/<a href=3D"http://mtd.mk" rel=3D"nore=
ferrer" target=3D"_blank">mtd.mk</a><br>
index 4ff43a1dce6662d1c5365ce4da1f1a622d80ab7b..77050e7e40b6244c632c8298f6d=
e52de8e2e485b 100644<br>
--- a/package/mtd/<a href=3D"http://mtd.mk" rel=3D"noreferrer" target=3D"_b=
lank">mtd.mk</a><br>
+++ b/package/mtd/<a href=3D"http://mtd.mk" rel=3D"noreferrer" target=3D"_b=
lank">mtd.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-MTD_VERSION =3D 2.3.0<br>
+MTD_VERSION =3D 2.2.1<br>
=C2=A0MTD_SOURCE =3D mtd-utils-$(MTD_VERSION).tar.bz2<br>
=C2=A0MTD_SITE =3D <a href=3D"https://infraroot.at/pub/mtd" rel=3D"noreferr=
er" target=3D"_blank">https://infraroot.at/pub/mtd</a><br>
=C2=A0MTD_LICENSE =3D GPL-2.0<br>
@@ -12,7 +12,6 @@ MTD_LICENSE_FILES =3D COPYING<br>
=C2=A0MTD_CPE_ID_VENDOR =3D mtd-utils_project<br>
=C2=A0MTD_CPE_ID_PRODUCT =3D mtd-utils<br>
=C2=A0MTD_INSTALL_STAGING =3D YES<br>
-MTD_DEPENDENCIES =3D host-pkgconf<br>
<br>
=C2=A0MTD_LDFLAGS =3D $(TARGET_LDFLAGS)<br>
<br>
@@ -29,7 +28,7 @@ MTD_CONF_OPTS +=3D --without-lzo<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_ZLIB),y)<br>
-MTD_DEPENDENCIES +=3D zlib<br>
+MTD_DEPENDENCIES +=3D host-pkgconf zlib<br>
=C2=A0MTD_CONF_OPTS +=3D --with-zlib<br>
=C2=A0else<br>
=C2=A0MTD_CONF_OPTS +=3D --without-zlib<br>
@@ -44,7 +43,7 @@ MTD_CONF_OPTS +=3D --without-jffs<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)<br>
-MTD_DEPENDENCIES +=3D util-linux<br>
+MTD_DEPENDENCIES +=3D util-linux host-pkgconf<br>
=C2=A0MTD_CONF_OPTS +=3D --with-ubifs<br>
=C2=A0# crypto needs linux/hash_info.h<br>
=C2=A0ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy=
)<br>
@@ -84,7 +83,7 @@ else<br>
=C2=A0MTD_CONF_OPTS +=3D --without-xattr<br>
=C2=A0endif<br>
<br>
-HOST_MTD_DEPENDENCIES =3D host-pkgconf host-acl host-zlib host-lzo host-ut=
il-linux host-zstd<br>
+HOST_MTD_DEPENDENCIES =3D host-acl host-zlib host-lzo host-util-linux host=
-zstd<br>
=C2=A0HOST_MTD_CONF_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-jffs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-ubifs \<br>
<br>
---<br>
base-commit: 6cd8f95346aaf7dd7c26e83d263969e5406420bd<br>
change-id: 20250516-mtd-2-3-0-revert-28b5ef1055fc<br>
<br>
Best regards,<br>
-- <br>
Brandon Maier &lt;<a href=3D"mailto:brandon.maier@collins.com" target=3D"_b=
lank">brandon.maier@collins.com</a>&gt;<br>
<br>
</blockquote></div></div>

--000000000000e4194e06357b987c--

--===============8766865505782451593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8766865505782451593==--
