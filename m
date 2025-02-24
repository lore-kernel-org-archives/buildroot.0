Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D730C021B3
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 08:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7E0C80387;
	Mon, 24 Feb 2025 08:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CtamCQnbEed; Mon, 24 Feb 2025 08:39:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 493018116B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 493018116B;
	Mon, 24 Feb 2025 08:39:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 388DCB88
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 08:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C37B60788
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 08:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBxkBRsKP4RQ for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 08:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64D5B60784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D5B60784
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64D5B60784
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 08:39:24 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e573136107bso3334836276.3
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 00:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740386363; x=1740991163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ARWtcLJy/HEO5wHW8rCsjiPFJvN0Rx61njAQ+F4DX0=;
 b=HrAVx25pEDj1aGhcrUYCdswaesXiH0ND39owpvKeokMgm2v764PTuYLXzNkUotpo/9
 35rVOBlw6tw244mgV0d7GajhmqiLfXU5KeB3CZvrn/IqBh9+FYH7uC5etrbOsdYw1HT/
 hTw3eD0AY/wNy+Ki9gB7JRdG8DpCyXjikwa8dpYs1rnztESmL7zeHUVYvP79Mx4EsijF
 hpd9KN61shWjFYi9aSytCj+1SjAA8NWC3Lgnr02ReEw3VKCRGUtRzw2AmY6bjH/TJOl6
 LBFMDbbQpOXM8d6ZZ/p/de/DAsfkdo/z/sOG+CyGaC/d+1UeIXH4l8BDp/kBwoXdFETu
 m25w==
X-Gm-Message-State: AOJu0Ywe72e9LTs0bpwe3T3kH+hOZE59pisGjgZ13XNGvtIjUyQ4z+cL
 aRMbPujYSXsLh7qqx0jolltkxyRH9agRx+cF/P8tMCehQJ9HXYuJJi1Z3DpmlcDV+AMVXaLkv1U
 VabHpYvCogBkKkgdRCvpBHcjpUvt7T/Do
X-Gm-Gg: ASbGncsHZ7n9LtotylLyRoe20i+KO8kEQJ8W3DYGRZb8MD4Kpn4b2EIF7v7it6e4aRJ
 g6O5w7pvL46IntArORgW8SUwxA6pn4WDFacDIwiKixnwOXmmbxnoiBRyxvNVorpn8PHTmaB0L3M
 2pFlr2ypnm
X-Google-Smtp-Source: AGHT+IH2NZr2XeR4Yyi1ltTFnrcB8YxA3BbQhO7T6+4+6wmAcY9OSk6bP3xv9BW/0fXp0iCNl4k9ui/5CRLGQTnaslo=
X-Received: by 2002:a05:6902:f81:b0:e5d:e6b5:7e02 with SMTP id
 3f1490d57ef6-e5e2466fe73mr9855767276.39.1740386362945; Mon, 24 Feb 2025
 00:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20250223183723.1517477-1-bernd@kuhls.net>
 <20250223183723.1517477-2-bernd@kuhls.net>
In-Reply-To: <20250223183723.1517477-2-bernd@kuhls.net>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Mon, 24 Feb 2025 09:39:11 +0100
X-Gm-Features: AWEUYZkcaV-g_lzJdpSbRz2raOMzd-CK8kWm3tKlfTkV2Eopk8nnr4lLl6iZfOk
Message-ID: <CA+R_deoxSRebPc906N6Wx8fmvojd_um6sZsmeWm08UVsPqQw2w@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740386363; x=1740991163; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7ARWtcLJy/HEO5wHW8rCsjiPFJvN0Rx61njAQ+F4DX0=;
 b=SXAbB6qjHRY476YInXQ8elBVv+poZWhyG7QUUmWtyVsmRIK89ZkYoNUJVtGQ8A2f49
 U1GzeSsCq9PZlLwp+Jk+eKFvi5SHxqWlQpUtTOuR7FtYwnGfe0rxHqO+nCB7Iz4pbilP
 4B/9ILXtV4ZSIzNahvPM/Fl+/fhpsckLweM8ioysg9pH+to9UarA0KP7kLALTMilces9
 6jkA3mB7UKVw5TSxRbP49bHee6RyVb1JPljhYTOOlJcc/yMmyMjqhtYnqn9RPZsbtv9S
 NyjUqXPSKZWKF8ZXajfJD4wuYtQPPhw7hpgSKO4R1Up94GxDbo+mpEw1MyDwlQdxjW3g
 /6Jw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SXAbB6qj
Subject: Re: [Buildroot] [PATCH 2/3] package/qt6/qt6positioning: new package
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
Content-Type: multipart/mixed; boundary="===============0207195634626065766=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0207195634626065766==
Content-Type: multipart/alternative; boundary="000000000000ef7957062edf46cf"

--000000000000ef7957062edf46cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bernd,

I have some comments, mainly on what licensing files and licenses to list.
But this is unclear to me. So you should ask Thomas or someone else about
this.

s=C3=B8n. 23. feb. 2025 kl. 19:37 skrev Bernd Kuhls <bernd@kuhls.net>:

> Needed for GPS support in Stellarium.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/qt6/Config.in                         |  1 +
>  package/qt6/qt6positioning/Config.in          |  8 ++++
>  .../qt6/qt6positioning/qt6positioning.hash    | 16 +++++++
>  package/qt6/qt6positioning/qt6positioning.mk  | 47 +++++++++++++++++++
>  4 files changed, 72 insertions(+)
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
> index 0000000000..a083dcffb3
> --- /dev/null
> +++ b/package/qt6/qt6positioning/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_QT6POSITIONING
>
+       bool "qt6positioning"
>

Can you explain why you need to select the Gui component here? Looking at
the CMake files the Gui component looks optional:

+       select BR2_PACKAGE_QT6BASE_GUI
> +       help
> +         This package provides Qt6 Positioning:
> +
> +         https://doc.qt.io/qt-6/qtpositioning-index.html
> +         https://code.qt.io/cgit/qt/qtpositioning.git
> diff --git a/package/qt6/qt6positioning/qt6positioning.hash
> b/package/qt6/qt6positioning/qt6positioning.hash
> new file mode 100644
> index 0000000000..65c58c484c
> --- /dev/null
> +++ b/package/qt6/qt6positioning/qt6positioning.hash
> @@ -0,0 +1,16 @@
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtpositi=
oning-everywhere-src-6.8.1.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtposit=
ioning-everywhere-src-6.8.1.tar.xz.sha256+sha256>
> e310e7232591d4beb1785bfff8ff3e77430bdf5e9a17f56694b732f5267df78d
> qtpositioning-everywhere-src-6.8.1.tar.xz
> +
> +# Hashes for license files
>

You can probably remove and add some checksums here... Se my comments
further down on LICESENS_FILES.


> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30
> LICENSES/Apache-2.0.txt
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> +sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5
> LICENSES/BSL-1.0.txt
> +sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499
> LICENSES/CC0-1.0.txt
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
> +sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc
> LICENSES/MIT.txt
> +sha256  ed0df7c746c39b27f297cc1bf5e8cdfa5b53c7056572092a77db02278435a689
> LICENSES/OFL-1.1.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6positioning/qt6positioning.mk
> b/package/qt6/qt6positioning/qt6positioning.mk
> new file mode 100644
> index 0000000000..7fe0e74c5b
> --- /dev/null
> +++ b/package/qt6/qt6positioning/qt6positioning.mk
> @@ -0,0 +1,47 @@
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
> +QT6POSITIONING_CMAKE_BACKEND =3D ninja
> +
>
+QT6POSITIONING_LICENSE =3D \
>

I think the maintainers agreed on only lisiting the licenses for things
that end up on target, and only the top-level license which is listed here:
https://doc.qt.io/qt-6/qtpositioning-index.html#licenses.
So I think it is enough to write:

QT6POSITIONING_LICENSE =3D  GPL-2.0 or GPL-3.0 or LGPL-3.0


> +       GPL-2.0 or GPL-3.0 or LGPL-3.0, \
> +       BSL-1.0, \
> +       CC0-1.0, \
> +       GFDL-1.3 no invariants (docs), \
> +       GPL-3.0 WITH Qt-GPL-exception-1.0, \
> +       OFL-1.1 (TitilliumWeb), \
> +       BSD-3-Clause (examples + buildsystem)
>
+
>

Here I think you can drop the license-files for things that don't end up on
target:

QT6POSITIONING_LICENSE_FILES =3D \
       LICENSES/GPL-2.0-only.txt \
       LICENSES/GPL-3.0-only.txt \
       LICENSES/LGPL-3.0-only.txt

See also: src/3rdparty/*/{qt_attribution.json,LICENSE}. Maybe we should add
license files for these sub-level licenses too?

+QT6POSITIONING_LICENSE_FILES =3D \
> +       LICENSES/Apache-2.0.txt \
> +       LICENSES/BSD-3-Clause.txt \
> +       LICENSES/BSL-1.0.txt \
> +       LICENSES/CC0-1.0.txt \
> +       LICENSES/GFDL-1.3-no-invariants-only.txt \
> +       LICENSES/GPL-2.0-only.txt \
> +       LICENSES/GPL-3.0-only.txt \
> +       LICENSES/LGPL-3.0-only.txt \
> +       LICENSES/LicenseRef-Qt-Commercial.txt \
> +       LICENSES/MIT.txt \
> +       LICENSES/OFL-1.1.txt \
> +       LICENSES/Qt-GPL-exception-1.0.txt
> +
> +QT6POSITIONING_DEPENDENCIES =3D qt6base
> +
> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE)$(BR2_PACKAGE_QT6DECLARATIVE_QUICK),y=
y)
> +QT6POSITIONING_DEPENDENCIES +=3D qt6declarative
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6SERIALPORT),y)
> +QT6POSITIONING_DEPENDENCIES +=3D qt6serialport
> +endif
> +
> +$(eval $(cmake-package))
> --
> 2.39.5
>

Regards,
Roy

--000000000000ef7957062edf46cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bernd,</div><div><br></div><div>I have some commen=
ts, mainly on what licensing files and licenses to list. But this is unclea=
r to me. So you should ask Thomas or someone else about this.</div><div><br=
></div><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">s=C3=B8n. 23. feb. 2025 kl. 19:37 skrev Bernd Kuhls &lt;=
<a href=3D"mailto:bernd@kuhls.net">bernd@kuhls.net</a>&gt;:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Needed for GPS support in Stell=
arium.<br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D=
"_blank">bernd@kuhls.net</a>&gt;<br>
---<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0package/qt6/qt6positioning/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 8 ++++<br>
=C2=A0.../qt6/qt6positioning/qt6positioning.hash=C2=A0 =C2=A0 | 16 +++++++<=
br>
=C2=A0package/qt6/qt6positioning/<a href=3D"http://qt6positioning.mk" rel=
=3D"noreferrer" target=3D"_blank">qt6positioning.mk</a>=C2=A0 | 47 ++++++++=
+++++++++++<br>
=C2=A04 files changed, 72 insertions(+)<br>
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
index 0000000000..a083dcffb3<br>
--- /dev/null<br>
+++ b/package/qt6/qt6positioning/Config.in<br>
@@ -0,0 +1,8 @@<br>
+config BR2_PACKAGE_QT6POSITIONING <br></blockquote><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;qt6positi=
oning&quot;<br></blockquote><div><br></div><div>Can you explain why you nee=
d to select the Gui component here? Looking at the CMake files the Gui comp=
onent looks optional:</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_GUI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This package provides Qt6 Positioning:<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtposi=
tioning-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/=
qt-6/qtpositioning-index.html</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://code.qt.io/cgit/qt/qt=
positioning.git" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/cg=
it/qt/qtpositioning.git</a><br>
diff --git a/package/qt6/qt6positioning/qt6positioning.hash b/package/qt6/q=
t6positioning/qt6positioning.hash<br>
new file mode 100644<br>
index 0000000000..65c58c484c<br>
--- /dev/null<br>
+++ b/package/qt6/qt6positioning/qt6positioning.hash<br>
@@ -0,0 +1,16 @@<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.8/6.=
8.1/submodules/qtpositioning-everywhere-src-6.8.1.tar.xz.sha256+sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.8/6.8.1/submodules/qtpositioning-everywhere-src-6.8.1.tar.xz.sha256<br=
>
+sha256</a>=C2=A0 e310e7232591d4beb1785bfff8ff3e77430bdf5e9a17f56694b732f52=
67df78d=C2=A0 qtpositioning-everywhere-src-6.8.1.tar.xz<br>
+<br>
+# Hashes for license files<br></blockquote><div><br></div><div>You can pro=
bably remove and add some checksums here... Se my comments further down on =
LICESENS_FILES.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
+sha256=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523=
d30=C2=A0 LICENSES/Apache-2.0.txt<br>
+sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1d=
cce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
+sha256=C2=A0 3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b04965=
3f5=C2=A0 LICENSES/BSL-1.0.txt<br>
+sha256=C2=A0 a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0=
499=C2=A0 LICENSES/CC0-1.0.txt<br>
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
+sha256=C2=A0 d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf=
1fc=C2=A0 LICENSES/MIT.txt<br>
+sha256=C2=A0 ed0df7c746c39b27f297cc1bf5e8cdfa5b53c7056572092a77db02278435a=
689=C2=A0 LICENSES/OFL-1.1.txt<br>
+sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b053084=
6b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
diff --git a/package/qt6/qt6positioning/<a href=3D"http://qt6positioning.mk=
" rel=3D"noreferrer" target=3D"_blank">qt6positioning.mk</a> b/package/qt6/=
qt6positioning/<a href=3D"http://qt6positioning.mk" rel=3D"noreferrer" targ=
et=3D"_blank">qt6positioning.mk</a><br>
new file mode 100644<br>
index 0000000000..7fe0e74c5b<br>
--- /dev/null<br>
+++ b/package/qt6/qt6positioning/<a href=3D"http://qt6positioning.mk" rel=
=3D"noreferrer" target=3D"_blank">qt6positioning.mk</a><br>
@@ -0,0 +1,47 @@<br>
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
+QT6POSITIONING_CMAKE_BACKEND =3D ninja<br>
+ <br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+QT6PO=
SITIONING_LICENSE =3D \<br></blockquote><div><br></div><div>I think the mai=
ntainers agreed on only lisiting the licenses for things that end up on tar=
get, and only the top-level license which is listed here: <a href=3D"https:=
//doc.qt.io/qt-6/qtpositioning-index.html#licenses">https://doc.qt.io/qt-6/=
qtpositioning-index.html#licenses</a>.</div><div>So I think it is enough to=
 write:</div><div><br></div><div>QT6POSITIONING_LICENSE =3D=C2=A0 GPL-2.0 o=
r GPL-3.0 or LGPL-3.0<br>=C2=A0 <br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-2.0 or GPL-3.0 or LGPL-3.0, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BSL-1.0, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CC0-1.0, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GFDL-1.3 no invariants (docs), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0 WITH Qt-GPL-exception-1.0, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0OFL-1.1 (TitilliumWeb), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause (examples + buildsystem) <br></blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">+<br></blockquote=
><div><br></div><div>Here I think you can drop the license-files for things=
 that don&#39;t end up on target:</div><div><br></div><div>
QT6POSITIONING_LICENSE_FILES =3D \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 LICENSES/GPL-2.0-only.txt \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 LICENSES/GPL-3.0-only.txt \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
</div><div><br></div><div>See also: src/3rdparty/*/{qt_attribution.json,LIC=
ENSE}. Maybe we should add license files for these sub-level licenses too?<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+QT6POSITIONING_LICENSE_FILES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/Apache-2.0.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/BSD-3-Clause.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/BSL-1.0.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/CC0-1.0.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GFDL-1.3-no-invariants-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GPL-2.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/LGPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/LicenseRef-Qt-Commercial.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/MIT.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/OFL-1.1.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/Qt-GPL-exception-1.0.txt<br>
+<br>
+QT6POSITIONING_DEPENDENCIES =3D qt6base<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE)$(BR2_PACKAGE_QT6DECLARATIVE_QUICK),yy)=
<br>
+QT6POSITIONING_DEPENDENCIES +=3D qt6declarative<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6SERIALPORT),y)<br>
+QT6POSITIONING_DEPENDENCIES +=3D qt6serialport<br>
+endif<br>
+<br>
+$(eval $(cmake-package))<br>
-- <br>
2.39.5<br></blockquote><div><br></div><div>Regards,</div><div>Roy <br></div=
></div></div>

--000000000000ef7957062edf46cf--

--===============0207195634626065766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0207195634626065766==--
