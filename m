Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F085C3ABC3
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 19:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C962E40734;
	Sun, 11 May 2025 19:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRocdjMMKk7k; Sun, 11 May 2025 19:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFFAA4087B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFFAA4087B;
	Sun, 11 May 2025 19:39:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB113154
 for <buildroot@buildroot.org>; Sun, 11 May 2025 19:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBDC081C58
 for <buildroot@buildroot.org>; Sun, 11 May 2025 19:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-1HOez04C6l for <buildroot@buildroot.org>;
 Sun, 11 May 2025 19:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 714AD819F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 714AD819F3
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 714AD819F3
 for <buildroot@buildroot.org>; Sun, 11 May 2025 19:39:17 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-54fc9e3564cso3043122e87.2
 for <buildroot@buildroot.org>; Sun, 11 May 2025 12:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746992355; x=1747597155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eKHjgF7ekvLaCSAVOoM+4lNAiuIAlMaIWoLSLqsjyzE=;
 b=c2twzG5tC+ot4Xaywox9qxKDQnv2kppWBA6c5qc/Q9hhYgrtk/xNf/88UerN5spMhR
 8SABx18/ASivxPMZULehBBLqDaSfLWb4tq7XPvHlNp1qQl/z2nbLfEtS1FEdTloif4Z4
 MTD2hHUyPBzmac4yoypAgEuqY07mom379WWlV/aysWbzQuhfPfTF69nWBcjh/X8mRzsX
 ZpZ69OiOX4UQZtmuLss1mVfwSooNYtdLIyOIoCkIweyEkVrCCrQihx0rL2s2E2nXqKql
 hlMusmyRVhnK2KhkMODOoMgDnCLEAzdIEgTo4AQT6jGhBMGxomO48aV6G2gVt+79QY7s
 BAcA==
X-Gm-Message-State: AOJu0Yx4V2QIDf1CKZYoCMoLDHFB32cQTfTJHwUJxtuTBznM4R4eX1qs
 RIvPCfM745zRjbQ4FdarcSkDh4X283ykrDo6AbA0cbir4SyGbQyOuWzeMSCxOYray25duze9nqe
 pzD16zh9hEPt+Gf/xcDYn9tkVJiw=
X-Gm-Gg: ASbGncuB7WVowwchqv37JR9gQ4PfrYU/c5oIB50ShZWx9zIfowN0Z0jRC/Aa8s3i4H8
 oYchpLAC+n6vzlwqE8DJTmsmlcBTBorhyb1FxPYEUeBSK/mZImMbSmUSwqyYBH+oxneTId9mN6T
 XwOq18lnRdkGLwzt8N/KZk3FsLgslOKLyzE8hri24mKbu532bpiJgIuEMZwqFH7OUMHqQ=
X-Google-Smtp-Source: AGHT+IGjR9EE9lhF4A5paEJiURgrta6KH/qDpvIn6LhYNyjAIFhYbFtcZms9Nx7HMoO9IOpGqv5CGEuc1wRKCvZu/7c=
X-Received: by 2002:a2e:be9c:0:b0:30b:b7c3:ea71 with SMTP id
 38308e7fff4ca-326c45da855mr34383941fa.15.1746992354402; Sun, 11 May 2025
 12:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250510203122.1916485-1-lazzer@gmail.com>
 <20250510203122.1916485-6-lazzer@gmail.com>
In-Reply-To: <20250510203122.1916485-6-lazzer@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 11 May 2025 21:39:02 +0200
X-Gm-Features: AX0GCFsItQ_RP7zwRjpxOVkqkSHqJq0jyIUFI6uAiahhah2AKnkIXeJy5lel2lk
Message-ID: <CAEyMn7bNkykffO8gDY6mFSqjtYoEjTXs30mFgtGSMezo141jqA@mail.gmail.com>
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org,
 =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746992355; x=1747597155; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eKHjgF7ekvLaCSAVOoM+4lNAiuIAlMaIWoLSLqsjyzE=;
 b=Fu37UJYPj0ktSoJI2GcVHQjAVU1x8Qgwfm9lxLcMe1k2CeznDkDQmrNK/YEW7DL8mk
 /tp0a4wKIhkHtqjh+GEdCWTtHRaBsa7kAiwwKTMf5D4QOM+2AWqZlpM9jew+3GcNZrhL
 B/cOOenKIO1+noPUvlhaefS/+K7mnG/GusIcTFP1V4vWppd0M4qi0RK3YRtYMTfoRJeL
 cYfP4IcODTUv76S2s6oZTgJzYHowWD0UsIEuuVWUSFd/rbqKlhqKN2hNN028UbQgI1B5
 vCSK2DF+1wYg49+6VBPpAlCOyV+QOwBOOsKfCDa0FrdL3clNg4BtYGZjVZSm5UFsHjZu
 rlGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Fu37UJYP
Subject: Re: [Buildroot] [PATCH v2 5/5] package/libnetconf2: Update
 dependencies
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
Content-Type: multipart/mixed; boundary="===============5671397986121393092=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5671397986121393092==
Content-Type: multipart/alternative; boundary="000000000000b5a62b0634e15a5c"

--000000000000b5a62b0634e15a5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Am Sa., 10. Mai 2025 um 22:31 Uhr schrieb Mattias Walstr=C3=B6m <lazzer@gma=
il.com
>:

> Since libnetconf2 is possible to build without
> OpenSSL as long as ENABLE_SSH_TLS is not set,
> adding option BR2_PACKAGE_LIBNETCONF2_SSH_TLS to
> opt-in this feature.
>
> Signed-off-by: Mattias Walstr=C3=B6m <lazzer@gmail.com>
> ---
>  package/libnetconf2/Config.in      |  7 +++++++
>  package/libnetconf2/libnetconf2.mk | 13 +++++++++----
>  2 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.i=
n
> index 1763243120..1ba21496b6 100644
> --- a/package/libnetconf2/Config.in
> +++ b/package/libnetconf2/Config.in
> @@ -12,6 +12,13 @@ config BR2_PACKAGE_LIBNETCONF2
>
>           https://github.com/CESNET/libnetconf2
>
> +if BR2_PACKAGE_LIBNETCONF2
> +config BR2_PACKAGE_LIBNETCONF2_SSH_TLS
> +       bool "SSH/TLS support"
> +       select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
> +       select BR2_PACKAGE_LIBCURL
> +       select BR2_PACKAGE_LIBSSH
> +endif
>  comment "libnetconf2 needs a toolchain w/ threads, dynamic library"
>         depends on BR2_USE_MMU
>         depends on BR2_TOOLCHAIN_HAS_SYNC_4
> diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/
> libnetconf2.mk
> index 0d74bd736d..a8c28b3ece 100644
> --- a/package/libnetconf2/libnetconf2.mk
> +++ b/package/libnetconf2/libnetconf2.mk
> @@ -23,11 +23,16 @@ else
>  LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH=3DOFF
>  endif
>
> -ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
> -LIBNETCONF2_CONF_OPTS +=3D -DENABLE_TLS=3DON
> +ifeq ($(BR2_PACKAGE_LIBNETCONF2_SSH_TLS),y)
> +LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH_TLS=3DON
> +LIBNETCONF2_DEPENDENCIES +=3D libcurl
> +ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +LIBNETCONF2_DEPENDENCIES +=3D mbedtls
> +else
>  LIBNETCONF2_DEPENDENCIES +=3D openssl
> +endif
>  else
> -LIBNETCONF2_CONF_OPTS +=3D -DENABLE_TLS=3DOFF
> +LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH_TLS=3DOFF
>  endif
>
>  ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> @@ -38,7 +43,7 @@ HOST_LIBNETCONF2_CONF_OPTS =3D \
>         -DENABLE_TESTS=3DOFF \
>         -DENABLE_VALGRIND_TESTS=3DOFF \
>         -DENABLE_SSH=3DOFF \
> -       -DENABLE_TLS=3DOFF
> +       -DENABLE_SSH_TLS=3DOFF
>
>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> --
> 2.43.0
>


the libnetconf2 cmake option ENABLE_SSH does no longer exist. Therefore
this part can be removed and the dependency to libssl needs to be added
when BR2_PACKAGE_LIBNETCONF2_SSH_TLS is enabled. Hope this is clear. See
the modified patch below.


diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
index 1763243120..970b2e2888 100644
--- a/package/libnetconf2/Config.in
+++ b/package/libnetconf2/Config.in
@@ -12,6 +12,14 @@ config BR2_PACKAGE_LIBNETCONF2

          https://github.com/CESNET/libnetconf2

+if BR2_PACKAGE_LIBNETCONF2
+config BR2_PACKAGE_LIBNETCONF2_SSH_TLS
+       bool "SSH/TLS support"
+       select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
+       select BR2_PACKAGE_LIBCURL
+       select BR2_PACKAGE_LIBSSH
+       select BR2_PACKAGE_LIBSSH_SERVER
+endif
 comment "libnetconf2 needs a toolchain w/ threads, dynamic library"
        depends on BR2_USE_MMU
        depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/
libnetconf2.mk
index 0d74bd736d..ed0d81bbec 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -16,18 +16,16 @@ LIBNETCONF2_CONF_OPTS =3D \
        -DENABLE_TESTS=3DOFF \
        -DENABLE_VALGRIND_TESTS=3DOFF

-ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
-LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH=3DON
-LIBNETCONF2_DEPENDENCIES +=3D libssh
+ifeq ($(BR2_PACKAGE_LIBNETCONF2_SSH_TLS),y)
+LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH_TLS=3DON
+LIBNETCONF2_DEPENDENCIES +=3D libcurl libssh
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBNETCONF2_DEPENDENCIES +=3D mbedtls
 else
-LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH=3DOFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
-LIBNETCONF2_CONF_OPTS +=3D -DENABLE_TLS=3DON
 LIBNETCONF2_DEPENDENCIES +=3D openssl
+endif
 else
-LIBNETCONF2_CONF_OPTS +=3D -DENABLE_TLS=3DOFF
+LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH_TLS=3DOFF
 endif

 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
@@ -38,7 +36,7 @@ HOST_LIBNETCONF2_CONF_OPTS =3D \
        -DENABLE_TESTS=3DOFF \
        -DENABLE_VALGRIND_TESTS=3DOFF \
        -DENABLE_SSH=3DOFF \
-       -DENABLE_TLS=3DOFF
+       -DENABLE_SSH_TLS=3DOFF

 $(eval $(cmake-package))
 $(eval $(host-cmake-package))

BR
Heiko

--000000000000b5a62b0634e15a5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Sa., 10. Mai =
2025 um 22:31=C2=A0Uhr schrieb Mattias Walstr=C3=B6m &lt;<a href=3D"mailto:=
lazzer@gmail.com">lazzer@gmail.com</a>&gt;:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Since libnetconf2 is possible to build without<=
br>
OpenSSL as long as ENABLE_SSH_TLS is not set,<br>
adding option BR2_PACKAGE_LIBNETCONF2_SSH_TLS to<br>
opt-in this feature.<br>
<br>
Signed-off-by: Mattias Walstr=C3=B6m &lt;<a href=3D"mailto:lazzer@gmail.com=
" target=3D"_blank">lazzer@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/libnetconf2/Config.in=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++++<b=
r>
=C2=A0package/libnetconf2/<a href=3D"http://libnetconf2.mk" rel=3D"noreferr=
er" target=3D"_blank">libnetconf2.mk</a> | 13 +++++++++----<br>
=C2=A02 files changed, 16 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in<=
br>
index 1763243120..1ba21496b6 100644<br>
--- a/package/libnetconf2/Config.in<br>
+++ b/package/libnetconf2/Config.in<br>
@@ -12,6 +12,13 @@ config BR2_PACKAGE_LIBNETCONF2<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/CESNET/lib=
netconf2" rel=3D"noreferrer" target=3D"_blank">https://github.com/CESNET/li=
bnetconf2</a><br>
<br>
+if BR2_PACKAGE_LIBNETCONF2<br>
+config BR2_PACKAGE_LIBNETCONF2_SSH_TLS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;SSH/TLS support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBED=
TLS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBCURL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBSSH<br>
+endif<br>
=C2=A0comment &quot;libnetconf2 needs a toolchain w/ threads, dynamic libra=
ry&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_MMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_SYNC_4<br>
diff --git a/package/libnetconf2/<a href=3D"http://libnetconf2.mk" rel=3D"n=
oreferrer" target=3D"_blank">libnetconf2.mk</a> b/package/libnetconf2/<a hr=
ef=3D"http://libnetconf2.mk" rel=3D"noreferrer" target=3D"_blank">libnetcon=
f2.mk</a><br>
index 0d74bd736d..a8c28b3ece 100644<br>
--- a/package/libnetconf2/<a href=3D"http://libnetconf2.mk" rel=3D"noreferr=
er" target=3D"_blank">libnetconf2.mk</a><br>
+++ b/package/libnetconf2/<a href=3D"http://libnetconf2.mk" rel=3D"noreferr=
er" target=3D"_blank">libnetconf2.mk</a><br>
@@ -23,11 +23,16 @@ else<br>
=C2=A0LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH=3DOFF<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)<br>
-LIBNETCONF2_CONF_OPTS +=3D -DENABLE_TLS=3DON<br>
+ifeq ($(BR2_PACKAGE_LIBNETCONF2_SSH_TLS),y)<br>
+LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH_TLS=3DON<br>
+LIBNETCONF2_DEPENDENCIES +=3D libcurl<br>
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)<br>
+LIBNETCONF2_DEPENDENCIES +=3D mbedtls<br>
+else<br>
=C2=A0LIBNETCONF2_DEPENDENCIES +=3D openssl<br>
+endif<br>
=C2=A0else<br>
-LIBNETCONF2_CONF_OPTS +=3D -DENABLE_TLS=3DOFF<br>
+LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH_TLS=3DOFF<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)<br>
@@ -38,7 +43,7 @@ HOST_LIBNETCONF2_CONF_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DENABLE_TESTS=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DENABLE_VALGRIND_TESTS=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DENABLE_SSH=3DOFF \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-DENABLE_TLS=3DOFF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DENABLE_SSH_TLS=3DOFF<br>
<br>
=C2=A0$(eval $(cmake-package))<br>
=C2=A0$(eval $(host-cmake-package))<br>
-- <br>
2.43.0<br></blockquote><div><br></div><div><br></div><div>the libnetconf2 c=
make option ENABLE_SSH does no longer exist. Therefore this part can be rem=
oved and the dependency to libssl needs to be added when BR2_PACKAGE_LIBNET=
CONF2_SSH_TLS is enabled. Hope this is clear. See the modified patch below.=
</div><div><br></div><div><br></div><div>diff --git a/package/libnetconf2/C=
onfig.in b/package/libnetconf2/Config.in<br>index 1763243120..970b2e2888 10=
0644<br>--- a/package/libnetconf2/Config.in<br>+++ b/package/libnetconf2/Co=
nfig.in<br>@@ -12,6 +12,14 @@ config BR2_PACKAGE_LIBNETCONF2<br>=C2=A0<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/CESNET/lib=
netconf2">https://github.com/CESNET/libnetconf2</a><br>=C2=A0<br>+if BR2_PA=
CKAGE_LIBNETCONF2<br>+config BR2_PACKAGE_LIBNETCONF2_SSH_TLS<br>+ =C2=A0 =
=C2=A0 =C2=A0 bool &quot;SSH/TLS support&quot;<br>+ =C2=A0 =C2=A0 =C2=A0 se=
lect BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS<br>+ =C2=A0 =C2=A0 =C2=A0 =
select BR2_PACKAGE_LIBCURL<br>+ =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIB=
SSH<br>+ =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBSSH_SERVER<br>+endif<br=
>=C2=A0comment &quot;libnetconf2 needs a toolchain w/ threads, dynamic libr=
ary&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_MMU<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_SYNC_4<br>diff --git a/pa=
ckage/libnetconf2/<a href=3D"http://libnetconf2.mk">libnetconf2.mk</a> b/pa=
ckage/libnetconf2/<a href=3D"http://libnetconf2.mk">libnetconf2.mk</a><br>i=
ndex 0d74bd736d..ed0d81bbec 100644<br>--- a/package/libnetconf2/<a href=3D"=
http://libnetconf2.mk">libnetconf2.mk</a><br>+++ b/package/libnetconf2/<a h=
ref=3D"http://libnetconf2.mk">libnetconf2.mk</a><br>@@ -16,18 +16,16 @@ LIB=
NETCONF2_CONF_OPTS =3D \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DENABLE_TESTS=3DOF=
F \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DENABLE_VALGRIND_TESTS=3DOFF<br>=C2=A0<=
br>-ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)<br>-LIBNETCONF2_CONF_OPTS +=3D -=
DENABLE_SSH=3DON<br>-LIBNETCONF2_DEPENDENCIES +=3D libssh<br>+ifeq ($(BR2_P=
ACKAGE_LIBNETCONF2_SSH_TLS),y)<br>+LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH_=
TLS=3DON<br>+LIBNETCONF2_DEPENDENCIES +=3D libcurl libssh<br>+ifeq ($(BR2_P=
ACKAGE_MBEDTLS),y)<br>+LIBNETCONF2_DEPENDENCIES +=3D mbedtls<br>=C2=A0else<=
br>-LIBNETCONF2_CONF_OPTS +=3D -DENABLE_SSH=3DOFF<br>-endif<br>-<br>-ifeq (=
$(BR2_PACKAGE_LIBOPENSSL), y)<br>-LIBNETCONF2_CONF_OPTS +=3D -DENABLE_TLS=
=3DON<br>=C2=A0LIBNETCONF2_DEPENDENCIES +=3D openssl<br>+endif<br>=C2=A0els=
e<br>-LIBNETCONF2_CONF_OPTS +=3D -DENABLE_TLS=3DOFF<br>+LIBNETCONF2_CONF_OP=
TS +=3D -DENABLE_SSH_TLS=3DOFF<br>=C2=A0endif<br>=C2=A0<br>=C2=A0ifeq ($(BR=
2_PACKAGE_LIBXCRYPT),y)<br>@@ -38,7 +36,7 @@ HOST_LIBNETCONF2_CONF_OPTS =3D=
 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DENABLE_TESTS=3DOFF \<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -DENABLE_VALGRIND_TESTS=3DOFF \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -DENABLE_SSH=3DOFF \<br>- =C2=A0 =C2=A0 =C2=A0 -DENABLE_TLS=3DOFF<br>+ =
=C2=A0 =C2=A0 =C2=A0 -DENABLE_SSH_TLS=3DOFF<br>=C2=A0<br>=C2=A0$(eval $(cma=
ke-package))<br>=C2=A0$(eval $(host-cmake-package))</div><div><br></div><di=
v>BR</div><div>Heiko</div></div></div>

--000000000000b5a62b0634e15a5c--

--===============5671397986121393092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5671397986121393092==--
