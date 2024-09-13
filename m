Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A573EEEEC39
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 07:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D876E600CA;
	Fri, 13 Sep 2024 07:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADE5Ds2qoRLm; Fri, 13 Sep 2024 07:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3064C60672
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3064C60672;
	Fri, 13 Sep 2024 07:17:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11D031BF855
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 07:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00CB284191
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 07:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FXAz9iNDKXB for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 07:17:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BA3A8415B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BA3A8415B
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BA3A8415B
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 07:17:48 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e1a989bd17aso599265276.1
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 00:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726211867; x=1726816667;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OHQx6v5Jyr5hVWdcoljcmWh3P7YAo7u9LvEdD+8HxBU=;
 b=ijMBZTfEmBHJWBwTjXfLqLDVKlxzh+ZKC96FnGpM6hWb/kewjk5cZyXhOaL526PKKp
 0KRleUtL8yx0tDRirx0gaPHf8QIU5PyYYusL1XWVu7I1v11cDvDYO5gIAzujwpuCJFVG
 Ub/SDP1+8o300gY2T3gAekybYzb+att1/z0U95CeoM6qAoHpES9aOHqNKxFFx+bC5v92
 5brh06NBLOJOf6U357NpqmYh0Fu4S4xXztJ+TXvGdi0BF7O8mmmvPZgq/lCu3duXtfIG
 LbuYjOk3BEebA85qqTwXeKQVk2s39OhMssjciezXk2kuL65Mp3tqdwnzC7Kh4IvYEWHn
 JfCQ==
X-Gm-Message-State: AOJu0YzvdvWm2r3RMXvPFpIpPjFycHRb9PZn4mdoF66hQZiu/usbCvT5
 V2hDcxUcYYYnKBgVCPb4WWGMYpDwBA4TAasJA4PrcP8Nc44CoKWZApuGycIEYCmQf38Jmhp7p1L
 Mpv8dfLMVhBgeNHadL4iQOQckbyA=
X-Google-Smtp-Source: AGHT+IExd/HbCk1zDKm/Yqzr4Fskgb9fxRlzc/yPfal4m0QX0nvjuvLk6KCBg7YXl6nIurTA99dnxVsMVF6HYyxXBpg=
X-Received: by 2002:a05:6902:2186:b0:e1d:2261:cb25 with SMTP id
 3f1490d57ef6-e1db00c664amr1313779276.18.1726211866936; Fri, 13 Sep 2024
 00:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240911140214.2479977-1-christian@klarinett.li>
 <20240912090246.618903-1-christian@klarinett.li>
In-Reply-To: <20240912090246.618903-1-christian@klarinett.li>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Fri, 13 Sep 2024 09:17:35 +0200
Message-ID: <CA+R_depEZMghW6+r2v90xw-pqvgwx_yNOEhgkqQGrQy76NjSPg@mail.gmail.com>
To: Christian Hitz <christian@klarinett.li>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726211867; x=1726816667; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OHQx6v5Jyr5hVWdcoljcmWh3P7YAo7u9LvEdD+8HxBU=;
 b=hsmWhmLnW4blslJ6cA5utNUxU5qcaf+Hg2XuLMidiIaP0NCRUKSYGr/Dxc7UNR5pBh
 3iB8d+MiExotbB/+hVfLPTQMUvNuxyZOLiLNZJHRah3qwod7ZwgL/RjauLKuZGR6mYUa
 386R5U1e81jZ/IJJ9DzPcY1WjoH914T9Er54XVJg0wTD8Zg2SKriPZnhUOyDYBq9peUA
 8I3OOIaUsl55arft/HXRzjhI/XK1wMuJHHKkLlkSRtwLVJqGlT5oKOiwJcWsoMuVedP9
 7GLYFAahAr4X+Az7w7Fc0mrAsNyVOEKtzUABQK1fpQGweKCi3OyrX9SRlZbeTVYLfVLR
 dwaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hsmWhmLn
Subject: Re: [Buildroot] [PATCH v3] package/qt6/qt6scxml: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Hitz <christian.hitz@bbv.ch>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0748527044956974446=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0748527044956974446==
Content-Type: multipart/alternative; boundary="00000000000022cfca0621fb054f"

--00000000000022cfca0621fb054f
Content-Type: text/plain; charset="UTF-8"

tor. 12. sep. 2024 kl. 11:03 skrev Christian Hitz <christian@klarinett.li>:

> From: Christian Hitz <christian.hitz@bbv.ch>
>
> Cross-compiling requires the host variant of the same package.
>
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
> Changes v2 -> v3:
>   - mention StateMaching and Scxml modules in help text
>   - fix typo in QT6SCXML_SOURCE
>   - add host-qt6declarative dependency to host package
>   - add BSD-3-Clause for buildsystem, examples and QML files
> Changes v1 -> v2:
>   - make dependency on qt6declarative optional
> ---
>  package/qt6/Config.in              |  1 +
>  package/qt6/qt6scxml/Config.in     | 14 +++++++++
>  package/qt6/qt6scxml/qt6scxml.hash | 11 +++++++
>  package/qt6/qt6scxml/qt6scxml.mk   | 48 ++++++++++++++++++++++++++++++
>  4 files changed, 74 insertions(+)
>  create mode 100644 package/qt6/qt6scxml/Config.in
>  create mode 100644 package/qt6/qt6scxml/qt6scxml.hash
>  create mode 100644 package/qt6/qt6scxml/qt6scxml.mk
>
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index 29c1c25c7f..4cbb60322c 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -49,6 +49,7 @@ source "package/qt6/qt6declarative/Config.in"
>  source "package/qt6/qt6languageserver/Config.in"
>  source "package/qt6/qt6mqtt/Config.in"
>  source "package/qt6/qt6opcua/Config.in"
> +source "package/qt6/qt6scxml/Config.in"
>  source "package/qt6/qt6serialbus/Config.in"
>  source "package/qt6/qt6serialport/Config.in"
>  source "package/qt6/qt6shadertools/Config.in"
> diff --git a/package/qt6/qt6scxml/Config.in
> b/package/qt6/qt6scxml/Config.in
> new file mode 100644
> index 0000000000..ff738bdc17
> --- /dev/null
> +++ b/package/qt6/qt6scxml/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_QT6SCXML
> +       bool "qt6scxml"
> +       help
> +         This repository contains two relates state machine modules:
>

I think this is more correct:

         This package contains the following Qt modules:


> +
> +         * Qt6::StateMachine: The State Machine framework provides
>

Maybe indent with two spaces the bullet points and associated text. I've
seen this in other packages.

Example from bind:

help
 BIND (Berkeley Internet Name Domain) is an
 implementation of the Domain Name System (DNS) protocols
 and provides an openly redistributable reference
 implementation of the major components of the Domain
 Name System, including:

   * a Domain Name System server (named)
   * a Domain Name System resolver library
   * tools for verifying the proper operation of the DNS
     server

Maybe drop the '::' so the name correspond to what is found in the
documentation:

 * Qt StateMachine: The State Machine framework provides


> +           classes for creating and executing state graphs.
> +
> +         https://doc.qt.io/qt-6/qtstatemachine-index.html
>


+
> +         * Qt6::Scxml: The Qt SCXML module provides functionality to
>

Maybe drop the '::' and use uppercase letters for SCXML so the name
correspond to what is found in the documentation. And also use this instead
of repeating the name of the module in the info text:

* Qt SCXML: This module provides functionality to


+           create state machines from SCXML files.
> +
> +         https://doc.qt.io/qt-6/qtscxml-index.html


Maybe we should also say something about the statemachine compiler tool?

>
> diff --git a/package/qt6/qt6scxml/qt6scxml.hash
> b/package/qt6/qt6scxml/qt6scxml.hash
> new file mode 100644
> index 0000000000..6c39be214a
> --- /dev/null
> +++ b/package/qt6/qt6scxml/qt6scxml.hash
> @@ -0,0 +1,11 @@
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtscxml-everywhere-src-6.7.2.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtscxml-everywhere-src-6.7.2.tar.xz.sha256+sha256>
> 20ecf93506d48f27b492ad3dd9d88830e08d642faec3071ce53396a8ae05c86f
> qtscxml-everywhere-src-6.7.2.tar.xz
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
> diff --git a/package/qt6/qt6scxml/qt6scxml.mk b/package/qt6/qt6scxml/
> qt6scxml.mk
> new file mode 100644
> index 0000000000..85ff17e42f
> --- /dev/null
> +++ b/package/qt6/qt6scxml/qt6scxml.mk
> @@ -0,0 +1,48 @@
>
> +################################################################################
> +#
> +# qt6scxml
> +#
>
> +################################################################################
> +
> +QT6SCXML_VERSION = $(QT6_VERSION)
> +QT6SCXML_SITE = $(QT6_SITE)
> +QT6SCXML_SOURCE =
> qtscxml-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SCXML_VERSION).tar.xz
> +QT6SCXML_INSTALL_STAGING = YES
> +QT6SCXML_SUPPORTS_IN_SOURCE_BUILD = NO
> +QT6SCXML_CMAKE_BACKEND = ninja
> +
> +QT6SCXML_LICENSE = \
> +       BSD-3-Clause (buildsystem, examples, QML), \
>

Some test qml files are under GPL-3.0-only. So I think it would be best to
summarize as (buildsystem, examples, snippets)

These are also the categories used in licenseRule.json:
...
"(.*)(examples/|snippets/)" : {
                "comment" : "Default",
                "file type" : "examples and snippets",
                "spdx" : ["LicenseRef-Qt-Commercial OR BSD-3-Clause"]
            }
...

+       GFDL-1.3-no-invariants (docs), \
> +       GPL-2.0 or GPL-3.0 or LGPL-3.0, \
> +       GPL-3.0 with exception (tools), \
> +       GPL-3.0 (tests)
> +
> +QT6SCXML_LICENSE_FILES = \
> +       LICENSES/BSD-3-Clause.txt \
> +       LICENSES/GFDL-1.3-no-invariants-only.txt \
> +       LICENSES/GPL-2.0-only.txt \
> +       LICENSES/GPL-3.0-only.txt \
> +       LICENSES/LGPL-3.0-only.txt \
> +       LICENSES/Qt-GPL-exception-1.0.txt
> +
> +QT6SCXML_CONF_OPTS = \
> +       -DQT_HOST_PATH=$(HOST_DIR) \
> +       -DBUILD_WITH_PCH=OFF \
> +       -DQT_BUILD_EXAMPLES=OFF \
> +       -DQT_BUILD_TESTS=OFF
> +
> +QT6SCXML_DEPENDENCIES = \
> +       host-qt6scxml \
> +       qt6base
> +
> +HOST_QT6SCXML_DEPENDENCIES = \
> +       host-qt6base
> +
> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> +QT6SCXML_DEPENDENCIES += qt6declarative
> +HOST_QT6SCXML_DEPENDENCIES += host-qt6declarative
>

What if we only build host-qt6scxml?


> +endif
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> --
> 2.46.0
>
>

--00000000000022cfca0621fb054f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">tor. 12. sep. 2024 kl. 11:03 skrev Ch=
ristian Hitz &lt;<a href=3D"mailto:christian@klarinett.li">christian@klarin=
ett.li</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: Christian Hitz &lt;<a href=3D"mailto:christian.hitz@bbv.ch" target=3D=
"_blank">christian.hitz@bbv.ch</a>&gt;<br>
<br>
Cross-compiling requires the host variant of the same package.<br>
<br>
Signed-off-by: Christian Hitz &lt;<a href=3D"mailto:christian.hitz@bbv.ch" =
target=3D"_blank">christian.hitz@bbv.ch</a>&gt;<br>
---<br>
Changes v2 -&gt; v3:<br>
=C2=A0 - mention StateMaching and Scxml modules in help text<br>
=C2=A0 - fix typo in QT6SCXML_SOURCE<br>
=C2=A0 - add host-qt6declarative dependency to host package<br>
=C2=A0 - add BSD-3-Clause for buildsystem, examples and QML files<br>
Changes v1 -&gt; v2:<br>
=C2=A0 - make dependency on qt6declarative optional<br>
---<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 1 +<br>
=C2=A0package/qt6/qt6scxml/Config.in=C2=A0 =C2=A0 =C2=A0| 14 +++++++++<br>
=C2=A0package/qt6/qt6scxml/qt6scxml.hash | 11 +++++++<br>
=C2=A0package/qt6/qt6scxml/<a href=3D"http://qt6scxml.mk" rel=3D"noreferrer=
" target=3D"_blank">qt6scxml.mk</a>=C2=A0 =C2=A0| 48 ++++++++++++++++++++++=
++++++++<br>
=C2=A04 files changed, 74 insertions(+)<br>
=C2=A0create mode 100644 package/qt6/qt6scxml/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6scxml/qt6scxml.hash<br>
=C2=A0create mode 100644 package/qt6/qt6scxml/<a href=3D"http://qt6scxml.mk=
" rel=3D"noreferrer" target=3D"_blank">qt6scxml.mk</a><br>
<br>
diff --git a/package/qt6/Config.in b/package/qt6/Config.in<br>
index 29c1c25c7f..4cbb60322c 100644<br>
--- a/package/qt6/Config.in<br>
+++ b/package/qt6/Config.in<br>
@@ -49,6 +49,7 @@ source &quot;package/qt6/qt6declarative/Config.in&quot;<b=
r>
=C2=A0source &quot;package/qt6/qt6languageserver/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6mqtt/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6opcua/Config.in&quot;<br>
+source &quot;package/qt6/qt6scxml/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6serialbus/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6serialport/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6shadertools/Config.in&quot;<br>
diff --git a/package/qt6/qt6scxml/Config.in b/package/qt6/qt6scxml/Config.i=
n<br>
new file mode 100644<br>
index 0000000000..ff738bdc17<br>
--- /dev/null<br>
+++ b/package/qt6/qt6scxml/Config.in<br>
@@ -0,0 +1,14 @@<br>
+config BR2_PACKAGE_QT6SCXML<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;qt6scxml&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This repository contains two relates sta=
te machine modules:<br>
</blockquote><div><br></div>I think this is more correct:</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0 This package contains the following Qt modules:</div><d=
iv>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Qt6::StateMachine: The State Machine f=
ramework provides<br>
</blockquote><div><br></div><div>Maybe indent with two spaces the bullet po=
ints and associated text. I&#39;ve seen this in other packages.<br></div><d=
iv><br></div><div>Example from bind:<br></div><div><br></div><div>	help<br>=
	 =C2=A0BIND (Berkeley Internet Name Domain) is an<br>	 =C2=A0implementatio=
n of the Domain Name System (DNS) protocols<br>	 =C2=A0and provides an open=
ly redistributable reference<br>	 =C2=A0implementation of the major compone=
nts of the Domain<br>	 =C2=A0Name System, including:<br><br>	 =C2=A0 =C2=A0=
* a Domain Name System server (named)<br>	 =C2=A0 =C2=A0* a Domain Name Sys=
tem resolver library<br>	 =C2=A0 =C2=A0* tools for verifying the proper ope=
ration of the DNS<br>	 =C2=A0 =C2=A0 =C2=A0server<br></div><div><br></div><=
div>Maybe drop the &#39;::&#39; so the name correspond to what is found in =
the documentation:</div><div><br></div><div>=C2=A0* Qt StateMachine: The St=
ate Machine framework provides</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0class=
es for creating and executing state graphs.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtstat=
emachine-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io=
/qt-6/qtstatemachine-index.html</a><br></blockquote><div><br></div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Qt6::Scxml: The Qt SCXML module provid=
es functionality to<br>
</blockquote><div><br></div><div><div>Maybe drop the &#39;::&#39; and use u=
ppercase letters for SCXML so the name correspond to what is found in the d=
ocumentation. And also use this instead of repeating the name of the module=
 in the info text:<br></div><div><br></div><div>* Qt SCXML: This module pro=
vides functionality to</div><div>=C2=A0</div><div><br></div></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0create state machines from SCXML files.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtscxm=
l-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/qt-6/q=
tscxml-index.html</a></blockquote><div><br></div><div>Maybe we should also =
say something about the statemachine compiler tool? <br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6s=
cxml.hash<br>
new file mode 100644<br>
index 0000000000..6c39be214a<br>
--- /dev/null<br>
+++ b/package/qt6/qt6scxml/qt6scxml.hash<br>
@@ -0,0 +1,11 @@<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.7/6.=
7.2/submodules/qtscxml-everywhere-src-6.7.2.tar.xz.sha256+sha256" rel=3D"no=
referrer" target=3D"_blank">https://download.qt.io/official_releases/qt/6.7=
/6.7.2/submodules/qtscxml-everywhere-src-6.7.2.tar.xz.sha256<br>
+sha256</a>=C2=A0 20ecf93506d48f27b492ad3dd9d88830e08d642faec3071ce53396a8a=
e05c86f=C2=A0 qtscxml-everywhere-src-6.7.2.tar.xz<br>
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
diff --git a/package/qt6/qt6scxml/<a href=3D"http://qt6scxml.mk" rel=3D"nor=
eferrer" target=3D"_blank">qt6scxml.mk</a> b/package/qt6/qt6scxml/<a href=
=3D"http://qt6scxml.mk" rel=3D"noreferrer" target=3D"_blank">qt6scxml.mk</a=
><br>
new file mode 100644<br>
index 0000000000..85ff17e42f<br>
--- /dev/null<br>
+++ b/package/qt6/qt6scxml/<a href=3D"http://qt6scxml.mk" rel=3D"noreferrer=
" target=3D"_blank">qt6scxml.mk</a><br>
@@ -0,0 +1,48 @@<br>
+##########################################################################=
######<br>
+#<br>
+# qt6scxml<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+QT6SCXML_VERSION =3D $(QT6_VERSION)<br>
+QT6SCXML_SITE =3D $(QT6_SITE)<br>
+QT6SCXML_SOURCE =3D qtscxml-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SCXML_VERSIO=
N).tar.xz<br>
+QT6SCXML_INSTALL_STAGING =3D YES<br>
+QT6SCXML_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
+QT6SCXML_CMAKE_BACKEND =3D ninja<br>
+<br>
+QT6SCXML_LICENSE =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause (buildsystem, examples, QML), \<br=
></blockquote><div><br></div><div>Some test qml files are under=C2=A0GPL-3.=
0-only. So I think it would be best to summarize as (buildsystem, examples,=
 snippets)=C2=A0 </div><div><br></div><div>These are also the categories us=
ed in licenseRule.json:</div><div>...=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=
=A0 <br></div><div>&quot;(.*)(examples/|snippets/)&quot; : {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;comment&quot; : &quot;D=
efault&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &q=
uot;file type&quot; : &quot;examples and snippets&quot;,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;spdx&quot; : [&quot;License=
Ref-Qt-Commercial OR BSD-3-Clause&quot;]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br></div><div>...<br></div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GFDL-1.3-no-invariants (docs), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-2.0 or GPL-3.0 or LGPL-3.0, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0 with exception (tools), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0 (tests)<br>
+<br>
+QT6SCXML_LICENSE_FILES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/BSD-3-Clause.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GFDL-1.3-no-invariants-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GPL-2.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/LGPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/Qt-GPL-exception-1.0.txt<br>
+<br>
+QT6SCXML_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF<br>
+<br>
+QT6SCXML_DEPENDENCIES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-qt6scxml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qt6base<br>
+<br>
+HOST_QT6SCXML_DEPENDENCIES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-qt6base<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)<br>
+QT6SCXML_DEPENDENCIES +=3D qt6declarative<br>
+HOST_QT6SCXML_DEPENDENCIES +=3D host-qt6declarative<br>
</blockquote><div><br></div><div>What if we only build host-qt6scxml?</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+endif<b=
r>
+<br>
+$(eval $(cmake-package))<br>
+$(eval $(host-cmake-package))<br>
-- <br>
2.46.0<br>
<br>
</blockquote></div></div>

--00000000000022cfca0621fb054f--

--===============0748527044956974446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0748527044956974446==--
