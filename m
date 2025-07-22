Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594D7C83F27
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 19:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1225F804E0;
	Tue, 22 Jul 2025 19:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdCjkQRz6WWM; Tue, 22 Jul 2025 19:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D76D8804E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D76D8804E4;
	Tue, 22 Jul 2025 19:49:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 990F6E0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 19:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A3B940ED6
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 19:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYW1Y2aDS7Ey for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 19:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76CF640F01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76CF640F01
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76CF640F01
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 19:49:07 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e82314f9a51so4360318276.0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 12:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753213746; x=1753818546;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qYgKpV2K/ulHQ6O18/9jwZiIRBAUvQb5y6PNakwyzDQ=;
 b=GhLqSgIX9ZOF2+Ly+T1tXOuDfUrQc7md0tm/CdRDs6unlIq5jG2YmZ4qiH029le/I6
 IIbnHl5ot47sl96gsa2MAhBButW/LKJ0IBA2eVSR9aMnuTib6wZWgVUX38Px77gWfCJl
 CcEX/TSN7enlWOlw9kFZzTxEJ10RfzLb/ARx7Mf/eHY25VpIv5koHALAdIkFTWZjfPPi
 193tGppisEIUXFtxvMLCr+7SWfqZ6J1838Ngc52wrsuahvCPACnqptO7bPSi9u/Cjei/
 rio7SqxovELNArqAy8pYl4nJEM8Reo0ryVLMfKbK3j9S8ajExp2pq5iRrtrlI4sic0MZ
 WcKw==
X-Gm-Message-State: AOJu0Yyrn9slEmNNRE7J8HC0sOiWBXm+g8QZN/wfqDLPkCQa4AllruNb
 CVZJCkNJbs1IFkbLCyfy3U9QEmCkdkLO+ZNECbwhtLYNS7/9M48QKwowLGLNCD7CLvHbBEauvYA
 EywLVPlq51BNsGp/YouLHXIstAYvwRP8=
X-Gm-Gg: ASbGncsGgXITh8dT829gJ22ShM9exLE3W0h1IbkpzNA+g2oM3quTUk0H57MkqTRgN5t
 XI96NTsVh316Vl5xhMQWZV3CQW/IK7beu2rBzbWl6licEsa54jwqtieP5Hc4fB7VzTh1mbtto9D
 RAVgyIbjd6H9ezszETRDOw9489+UUNr6v3FmgFIWMWn+sW2kU5BMkilFDIAkA7mHp/f8+lZrk1y
 zF0mGEwMv3HKkB1vKJTjND2kkch9izAYESm0tvB
X-Google-Smtp-Source: AGHT+IEp4A2YinZNWp1deJEQRFO2FNX0iTS/rGek51XwBJDihId4Dc7lQG71nYwnYchrfEFYpgOb3O4a/HBfO0GOrqY=
X-Received: by 2002:a05:690c:398:b0:719:751e:c6d1 with SMTP id
 00721157ae682-719b4145e55mr7940197b3.2.1753213746055; Tue, 22 Jul 2025
 12:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250719143417.144660-1-Stefan.Nickl@gmail.com>
In-Reply-To: <20250719143417.144660-1-Stefan.Nickl@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Tue, 22 Jul 2025 21:48:54 +0200
X-Gm-Features: Ac12FXxO5egkp-xGwJj5FL14O5s0yd7iWww2PyIBylo5rdrNZI3imQnGeEtQ5DI
Message-ID: <CA+R_derRM8KYwv1bvaj7ZayMM=wF6AeSfAvoiidag=Luxhjdiw@mail.gmail.com>
To: stefan.nickl@gmail.com
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753213746; x=1753818546; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qYgKpV2K/ulHQ6O18/9jwZiIRBAUvQb5y6PNakwyzDQ=;
 b=L14Z9XjoR1QCTDnnWKNqoexWinXrQbGBiI/vfyY2fbBla4FhA69KnJ3CnQunoG4Uwo
 2hmhAUrytY1YgXyPi9y6wuq6Lqw6fbMjAqpXHTz0UxcZyweDpI3W6lKKOwMJJ1+wyYep
 kH7kYiywGG0uQU56KYNkDGuZqqG8ONEs1wVpZFsRhu3g6Z89fe+rCoZU4VPD3SIAeyh0
 VDyaVM4zrifPA0htaL1D+1NOJXQUcloB8BNfvdAyyyxyfVfaxNhSmYo/gZvB1tXKdWu7
 i4gZ1l50AdfrUnSR3d1PJseyBmkr1zMkw9O4VwnnvR9DwLU71rcFaJY/uWOOrHRhI5PI
 htDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=L14Z9Xjo
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6positioning: New package
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
Content-Type: multipart/mixed; boundary="===============0772306928379789937=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0772306928379789937==
Content-Type: multipart/alternative; boundary="0000000000008c8d78063a89e27a"

--0000000000008c8d78063a89e27a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Good to see more people working on adding Qt 6 packages to buildroot!

Bernd Kuhls added this package a while back, which I later ported to Qt
6.9.1 here:

https://patchwork.ozlabs.org/project/buildroot/patch/20250610122924.431830-=
3-roykollensvendsen@gmail.com/

If you see any areas of improvements please feel free to build on top of
Bernds patch.

Regards,
Roy

l=C3=B8r. 19. juli 2025 kl. 16:34 skrev <stefan.nickl@gmail.com>:

> From: Stefan Nickl <Stefan.Nickl@gmail.com>
>
> Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
> ---
>  package/qt6/Config.in                         |  1 +
>  package/qt6/qt6positioning/Config.in          |  9 ++++++
>  .../qt6/qt6positioning/qt6positioning.hash    | 11 +++++++
>  package/qt6/qt6positioning/qt6positioning.mk  | 31 +++++++++++++++++++
>  4 files changed, 52 insertions(+)
>  create mode 100644 package/qt6/qt6positioning/Config.in
>  create mode 100644 package/qt6/qt6positioning/qt6positioning.hash
>  create mode 100644 package/qt6/qt6positioning/qt6positioning.mk
>
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index 10594691cf..d0105db28d 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -52,6 +52,7 @@ source "package/qt6/qt6languageserver/Config.in"
>  source "package/qt6/qt6mqtt/Config.in"
>  source "package/qt6/qt6multimedia/Config.in"
>  source "package/qt6/qt6opcua/Config.in"
> +source "package/qt6/qt6positioning/Config.in"
>  source "package/qt6/qt6quick3d/Config.in"
>  source "package/qt6/qt6quicktimeline/Config.in"
>  source "package/qt6/qt6scxml/Config.in"
> diff --git a/package/qt6/qt6positioning/Config.in
> b/package/qt6/qt6positioning/Config.in
> new file mode 100644
> index 0000000000..d3caa044e5
> --- /dev/null
> +++ b/package/qt6/qt6positioning/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_QT6POSITIONING
> +       bool "qt6positioning"
> +       help
> +         Qt is a cross-platform application and UI framework for
> +         developers using C++.
> +
> +         This package corresponds to the qt6positioning module.
> +
> +         https://doc.qt.io/qt-6/qtpositioning-index.html
> diff --git a/package/qt6/qt6positioning/qt6positioning.hash
> b/package/qt6/qt6positioning/qt6positioning.hash
> new file mode 100644
> index 0000000000..1a8f1282cc
> --- /dev/null
> +++ b/package/qt6/qt6positioning/qt6positioning.hash
> @@ -0,0 +1,11 @@
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtpositi=
oning-everywhere-src-6.8.1.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtposit=
ioning-everywhere-src-6.8.1.tar.xz.sha256+sha256>
> e310e7232591d4beb1785bfff8ff3e77430bdf5e9a17f56694b732f5267df78d
> qtpositioning-everywhere-src-6.8.1.tar.xz
> +
> +# Hashes for license files:
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSES/LGPL-3.0-only.txt
> +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700
> LICENSES/LicenseRef-Qt-Commercial.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6positioning/qt6positioning.mk
> b/package/qt6/qt6positioning/qt6positioning.mk
> new file mode 100644
> index 0000000000..82483e0ef0
> --- /dev/null
> +++ b/package/qt6/qt6positioning/qt6positioning.mk
> @@ -0,0 +1,31 @@
>
> +########################################################################=
########
> +#
> +# qt6positioning
> +#
>
> +########################################################################=
########
> +
> +QT6POSITIONING_VERSION =3D $(QT6_VERSION)
> +QT6POSITIONING_SITE =3D $(QT6_SITE)
> +QT6POSITIONING_SOURCE =3D
> qtpositioning-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6POSITIONING_VERSION).tar.=
xz
> +QT6POSITIONING_INSTALL_STAGING =3D YES
> +QT6POSITIONING_SUPPORTS_IN_SOURCE_BUILD =3D NO
> +
> +QT6POSITIONING_CMAKE_BACKEND =3D ninja
> +
> +QT6POSITIONING_LICENSE =3D \
> +       GPL-2.0+ or LGPL-3.0, \
> +       GPL-3.0, GFDL-1.3 no invariants (docs)
> +
> +QT6POSITIONING_LICENSE_FILES =3D \
> +       LICENSES/GPL-2.0-only.txt \
> +       LICENSES/GPL-3.0-only.txt \
> +       LICENSES/LGPL-3.0-only.txt \
> +       LICENSES/GFDL-1.3-no-invariants-only.txt
> +
> +QT6POSITIONING_CONF_OPTS =3D \
> +       -DQT_HOST_PATH=3D$(HOST_DIR) \
> +       -DBUILD_WITH_PCH=3DOFF \
> +       -DQT_BUILD_EXAMPLES=3DOFF \
> +       -DQT_BUILD_TESTS=3DOFF
> +
> +$(eval $(cmake-package))
> --
> 2.50.1
>
>

--0000000000008c8d78063a89e27a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Stefan,<br><br></div><div>Good to see more people =
working on adding Qt 6 packages to buildroot!</div><div><br></div><div>Bern=
d Kuhls added this package a while back, which I later ported to Qt 6.9.1 h=
ere:</div><div><br></div><div><a href=3D"https://patchwork.ozlabs.org/proje=
ct/buildroot/patch/20250610122924.431830-3-roykollensvendsen@gmail.com/">ht=
tps://patchwork.ozlabs.org/project/buildroot/patch/20250610122924.431830-3-=
roykollensvendsen@gmail.com/</a><br></div><div><br></div><div>If you see an=
y areas of improvements please feel free to build on top of Bernds patch.</=
div><div><br></div><div>Regards,</div><div>Roy</div></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">l=
=C3=B8r. 19. juli 2025 kl. 16:34 skrev &lt;<a href=3D"mailto:stefan.nickl@g=
mail.com">stefan.nickl@gmail.com</a>&gt;:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Stefan Nickl &lt;<a href=3D"mailto:Stefan.N=
ickl@gmail.com" target=3D"_blank">Stefan.Nickl@gmail.com</a>&gt;<br>
<br>
Signed-off-by: Stefan Nickl &lt;<a href=3D"mailto:Stefan.Nickl@gmail.com" t=
arget=3D"_blank">Stefan.Nickl@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0package/qt6/qt6positioning/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 9 ++++++<br>
=C2=A0.../qt6/qt6positioning/qt6positioning.hash=C2=A0 =C2=A0 | 11 +++++++<=
br>
=C2=A0package/qt6/qt6positioning/<a href=3D"http://qt6positioning.mk" rel=
=3D"noreferrer" target=3D"_blank">qt6positioning.mk</a>=C2=A0 | 31 ++++++++=
+++++++++++<br>
=C2=A04 files changed, 52 insertions(+)<br>
=C2=A0create mode 100644 package/qt6/qt6positioning/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6positioning/qt6positioning.hash<br>
=C2=A0create mode 100644 package/qt6/qt6positioning/<a href=3D"http://qt6po=
sitioning.mk" rel=3D"noreferrer" target=3D"_blank">qt6positioning.mk</a><br=
>
<br>
diff --git a/package/qt6/Config.in b/package/qt6/Config.in<br>
index 10594691cf..d0105db28d 100644<br>
--- a/package/qt6/Config.in<br>
+++ b/package/qt6/Config.in<br>
@@ -52,6 +52,7 @@ source &quot;package/qt6/qt6languageserver/Config.in&quot=
;<br>
=C2=A0source &quot;package/qt6/qt6mqtt/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6multimedia/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6opcua/Config.in&quot;<br>
+source &quot;package/qt6/qt6positioning/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6quick3d/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6quicktimeline/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6scxml/Config.in&quot;<br>
diff --git a/package/qt6/qt6positioning/Config.in b/package/qt6/qt6position=
ing/Config.in<br>
new file mode 100644<br>
index 0000000000..d3caa044e5<br>
--- /dev/null<br>
+++ b/package/qt6/qt6positioning/Config.in<br>
@@ -0,0 +1,9 @@<br>
+config BR2_PACKAGE_QT6POSITIONING<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;qt6positioning&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Qt is a cross-platform application and U=
I framework for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0developers using C++.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This package corresponds to the qt6posit=
ioning module.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtposi=
tioning-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/=
qt-6/qtpositioning-index.html</a><br>
diff --git a/package/qt6/qt6positioning/qt6positioning.hash b/package/qt6/q=
t6positioning/qt6positioning.hash<br>
new file mode 100644<br>
index 0000000000..1a8f1282cc<br>
--- /dev/null<br>
+++ b/package/qt6/qt6positioning/qt6positioning.hash<br>
@@ -0,0 +1,11 @@<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.8/6.=
8.1/submodules/qtpositioning-everywhere-src-6.8.1.tar.xz.sha256+sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.8/6.8.1/submodules/qtpositioning-everywhere-src-6.8.1.tar.xz.sha256<br=
>
+sha256</a>=C2=A0 e310e7232591d4beb1785bfff8ff3e77430bdf5e9a17f56694b732f52=
67df78d=C2=A0 qtpositioning-everywhere-src-6.8.1.tar.xz<br>
+<br>
+# Hashes for license files:<br>
+sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1d=
cce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
+sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b20=
6a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
+sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880=
643=C2=A0 LICENSES/GPL-2.0-only.txt<br>
+sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b=
903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
+sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464=
768=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
+sha256=C2=A0 9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4=
700=C2=A0 LICENSES/LicenseRef-Qt-Commercial.txt<br>
+sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b053084=
6b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
diff --git a/package/qt6/qt6positioning/<a href=3D"http://qt6positioning.mk=
" rel=3D"noreferrer" target=3D"_blank">qt6positioning.mk</a> b/package/qt6/=
qt6positioning/<a href=3D"http://qt6positioning.mk" rel=3D"noreferrer" targ=
et=3D"_blank">qt6positioning.mk</a><br>
new file mode 100644<br>
index 0000000000..82483e0ef0<br>
--- /dev/null<br>
+++ b/package/qt6/qt6positioning/<a href=3D"http://qt6positioning.mk" rel=
=3D"noreferrer" target=3D"_blank">qt6positioning.mk</a><br>
@@ -0,0 +1,31 @@<br>
+##########################################################################=
######<br>
+#<br>
+# qt6positioning<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+QT6POSITIONING_VERSION =3D $(QT6_VERSION)<br>
+QT6POSITIONING_SITE =3D $(QT6_SITE)<br>
+QT6POSITIONING_SOURCE =3D qtpositioning-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6=
POSITIONING_VERSION).tar.xz<br>
+QT6POSITIONING_INSTALL_STAGING =3D YES<br>
+QT6POSITIONING_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
+<br>
+QT6POSITIONING_CMAKE_BACKEND =3D ninja<br>
+<br>
+QT6POSITIONING_LICENSE =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-2.0+ or LGPL-3.0, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0, GFDL-1.3 no invariants (docs)<br>
+<br>
+QT6POSITIONING_LICENSE_FILES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GPL-2.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/LGPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GFDL-1.3-no-invariants-only.txt<br>
+<br>
+QT6POSITIONING_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF<br>
+<br>
+$(eval $(cmake-package))<br>
-- <br>
2.50.1<br>
<br>
</blockquote></div>

--0000000000008c8d78063a89e27a--

--===============0772306928379789937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0772306928379789937==--
