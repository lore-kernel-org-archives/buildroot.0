Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CE3EE57DB
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 21:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D0F606D3;
	Wed, 11 Sep 2024 21:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyVPLTv7MoFB; Wed, 11 Sep 2024 21:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59D2E60720
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59D2E60720;
	Wed, 11 Sep 2024 21:07:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3F2F1BF2CC
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 21:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D35C58174D
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 21:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gsRTKctBfUU for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 21:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 231B08174C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 231B08174C
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 231B08174C
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 21:07:35 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-6db836c6bd7so2524757b3.3
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 14:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726088854; x=1726693654;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KAPURZio5mcUUDT7D75slxYwAamJ7Ic2dsP1d3wa+2E=;
 b=YyPJL9IH+B15Km1HVeSRDmTQ7NEbeDLePutvRGg+25bkl/7Bb0upQcW3G14pE5Vc4g
 GZRFCWrS6q+B7WS7cluieAlneyJaXWVUqe3wRnNrcZa95aWamgU9wAZTuLX2wdPC8GEM
 URvtrZqs+fM6zQ/l57HfLm/s6QIXggRDZeYaHPX2yM6xaeRKYTIvrhcQOiTMlbSWRrEw
 IeKZp1QUDyTeI4jI84V4fP9l1Ja0SQQSsc/IAl3eZi1h2BvNZRQbtyM5/9XNVvga4onc
 vzA9VXIwEGSx6604l3ixoy2X+ixqLIX0/5h/6j+iyS1xYp1jooNJDG3ox+C/Rdyapte7
 5HCg==
X-Gm-Message-State: AOJu0Yyc6GLp17o4N/g4d2Qru+22n9kdQXiHRJrrYHTXOlH0oL0D/6s9
 i+zsz50yi86SaOGUV4yVSg+Z8lHk82mbQR4XJcR9hUJ+SY9M7jicw2l3UiyAmzbGKY0ozv5rQUR
 Y8E3PcgjbIz/K9kzLKrTd+UYGPj4=
X-Google-Smtp-Source: AGHT+IG51w9c1pe4Z7YPUIX7PaopugYT4ji+X9hJSBwnQpbjHetSE8gxnZJQ5HQSms5HO2twCXxK/8rmAu1Id4rhs4s=
X-Received: by 2002:a05:690c:f02:b0:6b2:28c3:b729 with SMTP id
 00721157ae682-6dbb6add252mr12218997b3.4.1726088854412; Wed, 11 Sep 2024
 14:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240911131503.2305836-1-christian@klarinett.li>
In-Reply-To: <20240911131503.2305836-1-christian@klarinett.li>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Wed, 11 Sep 2024 23:07:22 +0200
Message-ID: <CA+R_deqvCM9UL4f6hNxXY0CcNiQbuyWL3_kN_sMRizbsDnZDWw@mail.gmail.com>
To: Christian Hitz <christian@klarinett.li>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726088854; x=1726693654; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KAPURZio5mcUUDT7D75slxYwAamJ7Ic2dsP1d3wa+2E=;
 b=NYgq7apBP4iY9yoDWmdE+tkir/8dRT5dx/YmKF4smptyv28IrWlo2WWiGMDlWuTZ1r
 pPN92p+vW8wlHtt2iUnCIabGOjO4AfNiH12bIKgPzUy7mjbm1g0aDuIoLl0BqOCYr8cx
 KpoPYpzQ+7FaEUBvNqA2xqS3AEdik0Cv7hQVBxdUlGyifuSjqod3YFghAvGBBiQLDROk
 yQsc1Oq0zcPwBuc4kNpeqdUK+qJkRqNjK6Z3TAOFydT18z1ex8G6Cz34uDmsuCDEXaz2
 cDHnkjxRth2gqaYDqy4/Wr8vHThLdWLLtghOtYh1B6+6BiW/ukgIZ9rBCB2PzHC+sCPG
 g+HQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NYgq7apB
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6scxml: new package
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
Content-Type: multipart/mixed; boundary="===============2027995875720496201=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2027995875720496201==
Content-Type: multipart/alternative; boundary="00000000000004a88b0621de61ea"

--00000000000004a88b0621de61ea
Content-Type: text/plain; charset="UTF-8"

Hi Christian and Thomas,

Good to see you are working on this, Christian!

Thomas, please verify the sanity if my comments.

ons. 11. sep. 2024 kl. 15:15 skrev Christian Hitz <christian@klarinett.li>:
>
> From: Christian Hitz <christian.hitz@bbv.ch>
>
> Cross-compiling requires the host variant of the same package.
>
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
>  package/qt6/Config.in              |  1 +
>  package/qt6/qt6scxml/Config.in     | 11 ++++++++
>  package/qt6/qt6scxml/qt6scxml.hash | 11 ++++++++
>  package/qt6/qt6scxml/qt6scxml.mk   | 40 ++++++++++++++++++++++++++++++
>  4 files changed, 63 insertions(+)
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
b/package/qt6/qt6scxml/Config.in
> new file mode 100644
> index 0000000000..23561f61bc
> --- /dev/null
> +++ b/package/qt6/qt6scxml/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_QT6SCXML
> +       bool "qt6scxml"
> +       select BR2_PACKAGE_QT6DECLARATIVE

This is optional for both target and host.

> +       help
> +         Qt is a cross-platform application and UI framework for
> +         developers using C++.

You follow the samme pattern as many of the other Qt6 packages her.

But I don't think is it usefull to repeat this text in every qt6 package.

It should be enough to say it once. We should fix this for the other
packages as well.

> +
> +         The Qt SCXML module provides functionality to create state

When I grep for modules in the qtscxml repo I find the following:

$ grep -ir "qt_internal_add_.*module"
src/scxmlqml/CMakeLists.txt:qt_internal_add_qml_module(ScxmlQml
src/scxml/CMakeLists.txt:qt_internal_add_module(Scxml
src/statemachineqml/CMakeLists.txt:qt_internal_add_qml_module(StateMachineQml
src/statemachine/CMakeLists.txt:qt_internal_add_module(StateMachine

And I find the following non-test related tools:

$ grep -B 1 -ir "qt_internal_add_tool"
...
--
tools/qscxmlc/CMakeLists.txt-qt_get_tool_target_name(target_name qscxmlc)
tools/qscxmlc/CMakeLists.txt:qt_internal_add_tool(${target_name}

So rather than just saying something about one of the specific modules in
the repo I think
it is better to say something general about the qtscxml repo... and then
list  or say something
more specific about the modules and tools etc.

There seems to be a confusion about qt repos vs qt modules, which I've
probably contributed to.

We should update the info for existing modules to follow the same patter.

> +         machines from SCXML files.
> +
> +         https://doc.qt.io/qt-6/qtscxml-index.html
> diff --git a/package/qt6/qt6scxml/qt6scxml.hash
b/package/qt6/qt6scxml/qt6scxml.hash
> new file mode 100644
> index 0000000000..6c39be214a
> --- /dev/null
> +++ b/package/qt6/qt6scxml/qt6scxml.hash
> @@ -0,0 +1,11 @@
> +# Hash from:
https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtscxml-everywhere-src-6.7.2.tar.xz.sha256
> +sha256  20ecf93506d48f27b492ad3dd9d88830e08d642faec3071ce53396a8ae05c86f
 qtscxml-everywhere-src-6.7.2.tar.xz
> +
> +# Hashes for license files:
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
 LICENSES/BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
 LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
 LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
 LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
 LICENSES/LGPL-3.0-only.txt
> +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700
 LICENSES/LicenseRef-Qt-Commercial.txt

I think the file above is dropped in some of the existing packages. Can you
comment on this Thomas?

> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
 LICENSES/Qt-GPL-exception-1.0.txt

> diff --git a/package/qt6/qt6scxml/qt6scxml.mk b/package/qt6/qt6scxml/
qt6scxml.mk
> new file mode 100644
> index 0000000000..a455b01257
> --- /dev/null
> +++ b/package/qt6/qt6scxml/qt6scxml.mk
> @@ -0,0 +1,40 @@
>
+################################################################################
> +#
> +# qt6scxml
> +#
>
+################################################################################
> +
> +QT6SCXML_VERSION = $(QT6_VERSION)
> +QT6SCXML_SITE = $(QT6_SITE)
> +QT6SCXML_SOURCE =
qtscxml-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6CONNECTIVITY_VERSION).tar.xz
> +QT6SCXML_INSTALL_STAGING = YES
> +QT6SCXML_SUPPORTS_IN_SOURCE_BUILD = NO
> +

Maybe drop this new-line?

> +QT6SCXML_CMAKE_BACKEND = ninja
> +
> +QT6SCXML_LICENSE = \
> +       GPL-2.0+ or LGPL-3.0, \
> +       GPL-3.0 with exception(tools), \

Add a space after the license. Maybe we should be explicit about which
exception?

> +       GFDL-1.3 (docs)

I also like to sort the licenses Alphabetically and write the licenenses as
in the SPDX-License-Identifier (with some exception to like 'with', 'or',
'and' with small letters).

I also think it is good to be more explicit about which parts of software
the licenses applies to:

QT6SCXML_LICENSE = \
    BSD-3-Clause (buildsystem, examples, snippets), \
    GFDL-1.3-no-invariants (docs), \
    GPL-3.0 (tests), \
    GPL-3.0 with Qt-GPL-exception-1.0 (tools, utils), \
    LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)

By the way: In addition to grep-ing for spdx license identifiers there is
often some more interesting license information available in the
qt_attribution.json-files.

But in this case there were no such files.

> +
> +QT6SCXML_LICENSE_FILES = \
> +       LICENSES/GPL-2.0-only.txt \
> +       LICENSES/GPL-3.0-only.txt \
> +       LICENSES/LGPL-3.0-only.txt \
> +       LICENSES/GFDL-1.3-no-invariants-only.txt
> +

You dropped LICENSES/BSD-3-Clause.txt, the commercial license file and the
exception.

This is not done consistently in the existing qt6 packages. Thomas should
comment on this.

Maybe order these alphabetically and only drop the commercial license file?:

QT6SCXML_LICENSE_FILES = \
    LICENSES/BSD-3-Clause.txt \
    LICENSES/GFDL-1.3-no-invariants-only.txt \
    LICENSES/GPL-2.0-only.txt \
    LICENSES/GPL-3.0-only.txt \
    LICENSES/LGPL-3.0-only.txt \
    LICENSES/Qt-GPL-exception-1.0.txt

I think it is safer to specify too much license information than too little.

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

Add optional dependency for both target and host on qt6declarative:

$ grep -r "find_package(Qt6 \${PROJECT_VERSION}"
CMakeLists.txt:find_package(Qt6 ${PROJECT_VERSION} CONFIG REQUIRED
COMPONENTS BuildInternals Core)
CMakeLists.txt:find_package(Qt6 ${PROJECT_VERSION} CONFIG
OPTIONAL_COMPONENTS Gui Qml Widgets OpenGL OpenGLWidgets Network QuickTest)

$ cat dependencies.yaml
dependencies:
  ../qtbase:
    ref: b5fbe0923cfc566036b83c3d968f225b26117efc
    required: true
  ../qtdeclarative:
    ref: 12533cc0bd83a2076efb4af0bc1832b0db9568fc
    required: false

also expressed here:

CMakeLists.txt:find_package(Qt6 ${PROJECT_VERSION} CONFIG REQUIRED
COMPONENTS BuildInternals Core)
CMakeLists.txt:find_package(Qt6 ${PROJECT_VERSION} CONFIG
OPTIONAL_COMPONENTS Gui *Qml* Widgets OpenGL OpenGLWidgets Network
*QuickTest*)

> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> --
> 2.46.0
>

--00000000000004a88b0621de61ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Christian and Thomas,<br><br><div>Good to see you are w=
orking on this, Christian!</div><br>Thomas, please verify the sanity if my =
comments.<br><br>ons. 11. sep. 2024 kl. 15:15 skrev Christian Hitz &lt;<a h=
ref=3D"mailto:christian@klarinett.li">christian@klarinett.li</a>&gt;:<br>&g=
t;<br>&gt; From: Christian Hitz &lt;<a href=3D"mailto:christian.hitz@bbv.ch=
">christian.hitz@bbv.ch</a>&gt;<br>&gt;<br>&gt; Cross-compiling requires th=
e host variant of the same package.<br>&gt;<br>&gt; Signed-off-by: Christia=
n Hitz &lt;<a href=3D"mailto:christian.hitz@bbv.ch">christian.hitz@bbv.ch</=
a>&gt;<br>&gt; ---<br>&gt; =C2=A0package/qt6/Config.in =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A01 +<br>&gt; =C2=A0package/qt6/qt6scxml/=
Config.in =C2=A0 =C2=A0 | 11 ++++++++<br>&gt; =C2=A0package/qt6/qt6scxml/qt=
6scxml.hash | 11 ++++++++<br>&gt; =C2=A0package/qt6/qt6scxml/<a href=3D"htt=
p://qt6scxml.mk">qt6scxml.mk</a> =C2=A0 | 40 ++++++++++++++++++++++++++++++=
<br>&gt; =C2=A04 files changed, 63 insertions(+)<br>&gt; =C2=A0create mode =
100644 package/qt6/qt6scxml/Config.in<br>&gt; =C2=A0create mode 100644 pack=
age/qt6/qt6scxml/qt6scxml.hash<br>&gt; =C2=A0create mode 100644 package/qt6=
/qt6scxml/<a href=3D"http://qt6scxml.mk">qt6scxml.mk</a><br>&gt;<br>&gt; di=
ff --git a/package/qt6/Config.in b/package/qt6/Config.in<br>&gt; index 29c1=
c25c7f..4cbb60322c 100644<br>&gt; --- a/package/qt6/Config.in<br>&gt; +++ b=
/package/qt6/Config.in<br>&gt; @@ -49,6 +49,7 @@ source &quot;package/qt6/q=
t6declarative/Config.in&quot;<br>&gt; =C2=A0source &quot;package/qt6/qt6lan=
guageserver/Config.in&quot;<br>&gt; =C2=A0source &quot;package/qt6/qt6mqtt/=
Config.in&quot;<br>&gt; =C2=A0source &quot;package/qt6/qt6opcua/Config.in&q=
uot;<br>&gt; +source &quot;package/qt6/qt6scxml/Config.in&quot;<br>&gt; =C2=
=A0source &quot;package/qt6/qt6serialbus/Config.in&quot;<br>&gt; =C2=A0sour=
ce &quot;package/qt6/qt6serialport/Config.in&quot;<br>&gt; =C2=A0source &qu=
ot;package/qt6/qt6shadertools/Config.in&quot;<br>&gt; diff --git a/package/=
qt6/qt6scxml/Config.in b/package/qt6/qt6scxml/Config.in<br>&gt; new file mo=
de 100644<br>&gt; index 0000000000..23561f61bc<br>&gt; --- /dev/null<br>&gt=
; +++ b/package/qt6/qt6scxml/Config.in<br>&gt; @@ -0,0 +1,11 @@<br>&gt; +co=
nfig BR2_PACKAGE_QT6SCXML<br>&gt; + =C2=A0 =C2=A0 =C2=A0 bool &quot;qt6scxm=
l&quot;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_QT6DECLARATIVE<br=
><br>This is optional for both target and host.<br><br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 help<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Qt is a cross-platform a=
pplication and UI framework for<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 devel=
opers using C++.<br><br>You follow the samme pattern as many of the other Q=
t6 packages her.<br><br>But I don&#39;t think is it usefull to repeat this =
text in every qt6 package.<br><br>It should be enough to say it once. We sh=
ould fix this for the other<br>packages as well.<br><br>&gt; +<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The Qt SCXML module provides functionality to c=
reate state<br><br>When I grep for modules in the qtscxml repo I find the f=
ollowing:<br><br>$ grep -ir &quot;qt_internal_add_.*module&quot;<br>src/scx=
mlqml/CMakeLists.txt:qt_internal_add_qml_module(ScxmlQml<br>src/scxml/CMake=
Lists.txt:qt_internal_add_module(Scxml<br>src/statemachineqml/CMakeLists.tx=
t:qt_internal_add_qml_module(StateMachineQml<br>src/statemachine/CMakeLists=
.txt:qt_internal_add_module(StateMachine<br><br>And I find the following no=
n-test related tools:<br><br>$ grep -B 1 -ir &quot;qt_internal_add_tool&quo=
t;<br>...<br>--<br>tools/qscxmlc/CMakeLists.txt-qt_get_tool_target_name(tar=
get_name qscxmlc)<br>tools/qscxmlc/CMakeLists.txt:qt_internal_add_tool(${ta=
rget_name}<br><br>So rather than just saying something about one of the spe=
cific modules in the repo I think<br>it is better to say something general =
about the qtscxml repo... and then list =C2=A0or say something<br>more spec=
ific about the modules and tools etc.<br><br>There seems to be a confusion =
about qt repos vs qt modules, which I&#39;ve probably contributed to.<br><b=
r>We should update the info for existing modules to follow the same patter.=
<br><br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 machines from SCXML files.<br>&g=
t; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://doc.qt.io/qt-=
6/qtscxml-index.html">https://doc.qt.io/qt-6/qtscxml-index.html</a><br>&gt;=
 diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6=
scxml.hash<br>&gt; new file mode 100644<br>&gt; index 0000000000..6c39be214=
a<br>&gt; --- /dev/null<br>&gt; +++ b/package/qt6/qt6scxml/qt6scxml.hash<br=
>&gt; @@ -0,0 +1,11 @@<br>&gt; +# Hash from: <a href=3D"https://download.qt=
.io/official_releases/qt/6.7/6.7.2/submodules/qtscxml-everywhere-src-6.7.2.=
tar.xz.sha256">https://download.qt.io/official_releases/qt/6.7/6.7.2/submod=
ules/qtscxml-everywhere-src-6.7.2.tar.xz.sha256</a><br>&gt; +sha256 =C2=A02=
0ecf93506d48f27b492ad3dd9d88830e08d642faec3071ce53396a8ae05c86f =C2=A0qtscx=
ml-everywhere-src-6.7.2.tar.xz<br>&gt; +<br>&gt; +# Hashes for license file=
s:<br>&gt; +sha256 =C2=A09f0490f18656c6f2435bd14f603ef0c96434d1825615363dce=
43abb42ed1dcce =C2=A0LICENSES/BSD-3-Clause.txt<br>&gt; +sha256 =C2=A0110535=
522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4 =C2=A0LICENSES/G=
FDL-1.3-no-invariants-only.txt<br>&gt; +sha256 =C2=A08177f97513213526df2cf6=
184d8ff986c675afb514d4e68a404010521b880643 =C2=A0LICENSES/GPL-2.0-only.txt<=
br>&gt; +sha256 =C2=A08ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c=
545eb65b903 =C2=A0LICENSES/GPL-3.0-only.txt<br>&gt; +sha256 =C2=A0da7eabb7b=
afdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 =C2=A0LICENSES/LGPL=
-3.0-only.txt<br>&gt; +sha256 =C2=A09b1f50aae6267f9d5e0ceb6775ee86450262c25=
ec7c0573e151fe5d3f18a4700 =C2=A0LICENSES/LicenseRef-Qt-Commercial.txt<br><b=
r>I think the file above is dropped in some of the existing packages. Can y=
ou comment on this Thomas?<br><br>&gt; +sha256 =C2=A040678d338ce53cd93f8b22=
b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2 =C2=A0LICENSES/Qt-GPL-exception-=
1.0.txt<br><br>&gt; diff --git a/package/qt6/qt6scxml/<a href=3D"http://qt6=
scxml.mk">qt6scxml.mk</a> b/package/qt6/qt6scxml/<a href=3D"http://qt6scxml=
.mk">qt6scxml.mk</a><br>&gt; new file mode 100644<br>&gt; index 0000000000.=
.a455b01257<br>&gt; --- /dev/null<br>&gt; +++ b/package/qt6/qt6scxml/<a hre=
f=3D"http://qt6scxml.mk">qt6scxml.mk</a><br>&gt; @@ -0,0 +1,40 @@<br>&gt; +=
###########################################################################=
#####<br>&gt; +#<br>&gt; +# qt6scxml<br>&gt; +#<br>&gt; +##################=
##############################################################<br>&gt; +<br=
>&gt; +QT6SCXML_VERSION =3D $(QT6_VERSION)<br>&gt; +QT6SCXML_SITE =3D $(QT6=
_SITE)<br>&gt; +QT6SCXML_SOURCE =3D qtscxml-$(QT6_SOURCE_TARBALL_PREFIX)-$(=
QT6CONNECTIVITY_VERSION).tar.xz<br>&gt; +QT6SCXML_INSTALL_STAGING =3D YES<b=
r>&gt; +QT6SCXML_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>&gt; +<br><br>Maybe dro=
p this new-line?<br><br>&gt; +QT6SCXML_CMAKE_BACKEND =3D ninja<br>&gt; +<br=
>&gt; +QT6SCXML_LICENSE =3D \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 GPL-2.0+ or LG=
PL-3.0, \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 GPL-3.0 with exception(tools), \<b=
r><br>Add a space after the license. Maybe we should be explicit about whic=
h exception?<br><br>&gt; + =C2=A0 =C2=A0 =C2=A0 GFDL-1.3 (docs)<br><br>I al=
so like to sort the licenses Alphabetically and write the licenenses as in =
the SPDX-License-Identifier (with some exception to like &#39;with&#39;, &#=
39;or&#39;, &#39;and&#39; with small letters).<br><br>I also think it is go=
od to be more explicit about which parts of software the licenses applies t=
o:<br><br>QT6SCXML_LICENSE =3D \<br>=C2=A0 =C2=A0 BSD-3-Clause (buildsystem=
, examples, snippets), \<br>=C2=A0 =C2=A0 GFDL-1.3-no-invariants (docs), \<=
br>=C2=A0 =C2=A0 GPL-3.0 (tests), \<br>=C2=A0 =C2=A0 GPL-3.0 with Qt-GPL-ex=
ception-1.0 (tools, utils), \<br>=C2=A0 =C2=A0 LGPL-3.0 or GPL-2.0 or GPL-3=
.0 (modules, plugins)<br><br>By the way: In addition to grep-ing for spdx l=
icense identifiers there is often some more interesting license information=
 available in the qt_attribution.json-files.<br><br>But in this case there =
were no such files.<br><br>&gt; +<br>&gt; +QT6SCXML_LICENSE_FILES =3D \<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 LICENSES/GPL-2.0-only.txt \<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 LICENSES/GPL-3.0-only.txt \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 LI=
CENSES/LGPL-3.0-only.txt \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 LICENSES/GFDL-1.3=
-no-invariants-only.txt<br>&gt; +<br><br>You dropped LICENSES/BSD-3-Clause.=
txt, the commercial license file and the exception.<br><br>This is not done=
 consistently in the existing qt6 packages. Thomas should comment on this.<=
br><br>Maybe order these alphabetically and only drop the commercial licens=
e file?:<br><br>QT6SCXML_LICENSE_FILES =3D \<br>=C2=A0 =C2=A0 LICENSES/BSD-=
3-Clause.txt \<br>=C2=A0 =C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt \<=
br>=C2=A0 =C2=A0 LICENSES/GPL-2.0-only.txt \<br>=C2=A0 =C2=A0 LICENSES/GPL-=
3.0-only.txt \<br>=C2=A0 =C2=A0 LICENSES/LGPL-3.0-only.txt \<br>=C2=A0 =C2=
=A0 LICENSES/Qt-GPL-exception-1.0.txt<br><br>I think it is safer to specify=
 too much license information than too little.<br><br>&gt; +QT6SCXML_CONF_O=
PTS =3D \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 -DQT_HOST_PATH=3D$(HOST_DIR) \<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 -DBUILD_WITH_PCH=3DOFF \<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 -DQT_BUILD_EXAMPLES=3DOFF \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 -DQT_=
BUILD_TESTS=3DOFF<br>&gt; +<br>&gt; +QT6SCXML_DEPENDENCIES =3D \<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 host-qt6scxml \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 qt6base=
<br>&gt; +<br>&gt; +HOST_QT6SCXML_DEPENDENCIES =3D \<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 host-qt6base<br><br>Add optional dependency for both target and =
host on qt6declarative:<br><br>$ grep -r &quot;find_package(Qt6 \${PROJECT_=
VERSION}&quot;<br>CMakeLists.txt:find_package(Qt6 ${PROJECT_VERSION} CONFIG=
 REQUIRED COMPONENTS BuildInternals Core)<br>CMakeLists.txt:find_package(Qt=
6 ${PROJECT_VERSION} CONFIG OPTIONAL_COMPONENTS Gui Qml Widgets OpenGL Open=
GLWidgets Network QuickTest)<br><br>$ cat dependencies.yaml<br>dependencies=
:<br>=C2=A0 ../qtbase:<br>=C2=A0 =C2=A0 ref: b5fbe0923cfc566036b83c3d968f22=
5b26117efc<br>=C2=A0 =C2=A0 required: true<br>=C2=A0 ../qtdeclarative:<br>=
=C2=A0 =C2=A0 ref: 12533cc0bd83a2076efb4af0bc1832b0db9568fc<br>=C2=A0 =C2=
=A0 required: false<br><br><div>also expressed here: <br></div><div><br></d=
iv>CMakeLists.txt:find_package(Qt6 ${PROJECT_VERSION} CONFIG REQUIRED COMPO=
NENTS BuildInternals Core)<br>CMakeLists.txt:find_package(Qt6 ${PROJECT_VER=
SION} CONFIG OPTIONAL_COMPONENTS Gui <b>Qml</b> Widgets OpenGL OpenGLWidget=
s Network <b>QuickTest</b>)<br><div><br></div>&gt; +<br>&gt; +$(eval $(cmak=
e-package))<br>&gt; +$(eval $(host-cmake-package))<br>&gt; --<br>&gt; 2.46.=
0<br>&gt;</div>

--00000000000004a88b0621de61ea--

--===============2027995875720496201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2027995875720496201==--
