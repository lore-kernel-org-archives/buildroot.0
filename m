Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC93FC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 19:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47DA380F35;
	Sun,  1 Jun 2025 19:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oY-LnD1qm80M; Sun,  1 Jun 2025 19:29:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F0B180F36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F0B180F36;
	Sun,  1 Jun 2025 19:29:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68CD6222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 19:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AE834048A
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 19:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saeEFcwXf2MT for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 19:29:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB60040480
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB60040480
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB60040480
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 19:29:35 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-70e3e0415a7so33736927b3.0
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 12:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748806175; x=1749410975;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hNDAdOlC3HbjBxkT63V2ZnEfYS0tbtGtavoUjqr5ji8=;
 b=c3yUXOHA4MDnWjPrrJd5Au/gzfN227BYt8lYJ7AbZ+wdjaAOhh/lIseYgEvhu1o2ki
 YJqklZ4eAJbYNP7aInjn/do/oe7ZlWqu2Y21QBuHr1nIfmz0YqXv9/HfRVsxVFHeu9iF
 EvyynxjyeJVmViTbYvjHVy9m7lQcw0tdNFrny9OTxWBuxwIgP+U0jmBACDcFOfPimuKA
 YoyDmSBwfGYj/Kv8Nei+lCQ4nPpXAz6c3Hn2lT32nBQmqgQhmpvLxjXLtwZ8UxucZLHi
 M9B7f4VT4AsWjDegusweiSljRykCky6xdz659yCDHBM7Y5QDwJukSolURbCzEbJg8w51
 58Gg==
X-Gm-Message-State: AOJu0Yx+77qv8leRsQBWmcOkkX5UEuJl80bbqJYlM9xf1l870REPdBG1
 l6bh/DQDdMJ5vWeXwRAQcq/nMfqxbYrilLpWOaOP5k9IaM/nJapaHl9+HQga0pzW4vBCQVl6ZIm
 hWkuHYQFY35PJLXnWJahN3M514Yf6lGlB4g==
X-Gm-Gg: ASbGnctD/7JQ+j8jXdyZhIflKQ+hkltOlFAxFhBgR8cgdScqJn/kc7DLgCWNXhFacN6
 01NAryQDn5ejDBcWK9GNcS+3h6QxFu1D/lMXzw3TGpufUFdaBkDKBf1GFrhOV0QtD4U2vP/5Bga
 5P0KTZe2W6/4DwEyt2quhETrfwEZCJGk+JPmbElvQszEH6
X-Google-Smtp-Source: AGHT+IFdXNTUe/SWiKptiPXF1zwmx2HXKjmjZy4ziD9XAr3igFg2R/Kz/ghUtMdJgcbXZ/RgcWMOrLn7fyf4Zmg4IOE=
X-Received: by 2002:a05:690c:6403:b0:70e:7158:6fda with SMTP id
 00721157ae682-70f877a3b54mr220651467b3.9.1748806174610; Sun, 01 Jun 2025
 12:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250601132736.3582117-1-roykollensvendsen@gmail.com>
 <20250601132736.3582117-2-roykollensvendsen@gmail.com>
In-Reply-To: <20250601132736.3582117-2-roykollensvendsen@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 1 Jun 2025 21:29:23 +0200
X-Gm-Features: AX0GCFujqMAMkgBw5oGhjWXhbA7oaaxfh4pt5Mo8_v9eUgMVRSmCoD-IWThCUWw
Message-ID: <CA+R_depOrd5x-eWL_BX5FC6VbWpR7yezn0TNF7HQ7UOzyxUn+w@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748806175; x=1749410975; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hNDAdOlC3HbjBxkT63V2ZnEfYS0tbtGtavoUjqr5ji8=;
 b=moVrIb9sfx5EKMtevz5q81S6De9u4w57VFam09WFLmSiyefD8/FS9PfoOAsP/DCUoP
 MnkImiIE3jCw6POiCbsIgwxian3H+FuxKGNkMEY0oqnoK9MrhpQ2ITbQbDvTL3kPE4+K
 yctC5hO4tvvtbEbMablwy0vCWczGncTjzGuw4fDNJvLLsKKDw39XeADg9jvyWKtxMocI
 whze+2UCzGSa8vzR2tWbYJe1spcT2i746Glw6qkCnTUDqHKwFY5LZW2PQmP7UePcUIyE
 aSkIfFl5+F39XHdcedBhgx0LIu0VDKYs//whnmwpsjJr93MjDeKg0FdMuLSES1fu9+RO
 Uf1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=moVrIb9s
Subject: Re: [Buildroot] [PATCH v3 1/3] package/qt6/qt6tools: fix build
 failures
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
Content-Type: multipart/mixed; boundary="===============8741682206729859221=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8741682206729859221==
Content-Type: multipart/alternative; boundary="000000000000d196f6063687aad0"

--000000000000d196f6063687aad0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After some testing I see I need the target package anyway, so I'll just
disable some features unconditionally instead of removing the target
variant.

s=C3=B8n. 1. juni 2025 kl. 15:28 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> Remove target package to fix linguist, designer and assistant build
> failures:
>
> Fixes:
> -- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)
> CMake Error at
> <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
>   Failed to find the host tool "Qt6::lconvert".  It is part of the
>   Qt6LinguistTools package, but the package could not be found.  Make sur=
e
>   you have built and installed the host Linguist module, which will ensur=
e
>   the creation of the Qt6LinguistTools package.
> Call Stack (most recent call first):
>   <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83
> (qt_internal_find_tool)
>   src/linguist/lconvert/CMakeLists.txt:9 (qt_internal_add_tool)
>
> The above error can be triggered by the following defconfig:
> BR2_arm=3Dy
> BR2_cortex_a9=3Dy
> BR2_ARM_ENABLE_VFP=3Dy
> BR2_TOOLCHAIN_EXTERNAL=3Dy
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=3Dy
> BR2_PACKAGE_QT6=3Dy
> BR2_PACKAGE_QT6BASE_GUI=3Dy
> BR2_PACKAGE_QT6BASE_PNG=3Dy
> BR2_PACKAGE_QT6BASE_WIDGETS=3Dy
> BR2_PACKAGE_QT6TOOLS=3Dy
>
> Fixes:
> CMake Error at
> <...>/output/build/qt6base-6.8.1/cmake/QtPublicWalkLibsHelpers.cmake:267
> (message):
>   The Xml target is mentioned as a dependency for Designer, but not
> declared.
> Call Stack (most recent call first):
>   <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:8
> (__qt_internal_walk_libs)
>   <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:47
> (qt_collect_libs)
>
> <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtModuleHelpers.cmake:10=
27
> (qt_generate_prl_file)
>
> <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtScopeFinalizerHelpers.=
cmake:24:EVAL:1
> (qt_finalize_module)
>   src/designer/src/lib/CMakeLists.txt:DEFERRED
>
> The above error can be triggered by the following defconfig:
> BR2_arm=3Dy
> BR2_cortex_a9=3Dy
> BR2_ARM_ENABLE_VFP=3Dy
> BR2_TOOLCHAIN_EXTERNAL=3Dy
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=3Dy
> BR2_PACKAGE_QT6=3Dy
> BR2_PACKAGE_QT6BASE_GUI=3Dy
> BR2_PACKAGE_QT6BASE_PNG=3Dy
> BR2_PACKAGE_QT6BASE_WIDGETS=3Dy
> BR2_PACKAGE_QT6TOOLS=3Dy
>
> Fixes:
> CMake Error at
> <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
>   Failed to find the host tool "Qt6::qhelpgenerator".  It is part of the
>   Qt6ToolsTools package, but the package did not contain the tool.  Make
> sure
>   that the host module Tools was built with all features enabled (no
>   explicitly disabled tools).
> Call Stack (most recent call first):
>   <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83
> (qt_internal_find_tool)
>   src/assistant/qhelpgenerator/CMakeLists.txt:9 (qt_internal_add_tool)
>
> The above error can be triggered by the following defconfig:
> BR2_arm=3Dy
> BR2_cortex_a9=3Dy
> BR2_ARM_ENABLE_VFP=3Dy
> BR2_TOOLCHAIN_EXTERNAL=3Dy
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=3Dy
> BR2_PACKAGE_QT6=3Dy
> BR2_PACKAGE_QT6BASE_GUI=3Dy
> BR2_PACKAGE_QT6BASE_PNG=3Dy
> BR2_PACKAGE_QT6BASE_PRINTSUPPORT=3Dy
> BR2_PACKAGE_QT6BASE_SQL=3Dy
> BR2_PACKAGE_QT6BASE_SQLITE=3Dy
> BR2_PACKAGE_QT6BASE_WIDGETS=3Dy
> BR2_PACKAGE_QT6TOOLS=3Dy
>
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  package/qt6/Config.in               |  1 -
>  package/qt6/qt6tools/Config.in      | 13 -------------
>  package/qt6/qt6tools/Config.in.host |  3 ---
>  package/qt6/qt6tools/qt6tools.mk    | 15 ---------------
>  4 files changed, 32 deletions(-)
>  delete mode 100644 package/qt6/qt6tools/Config.in
>
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index 10594691cf..5c18c6a3fd 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -59,7 +59,6 @@ source "package/qt6/qt6serialbus/Config.in"
>  source "package/qt6/qt6serialport/Config.in"
>  source "package/qt6/qt6shadertools/Config.in"
>  source "package/qt6/qt6svg/Config.in"
> -source "package/qt6/qt6tools/Config.in"
>  source "package/qt6/qt6virtualkeyboard/Config.in"
>  source "package/qt6/qt6wayland/Config.in"
>  source "package/qt6/qt6websockets/Config.in"
> diff --git a/package/qt6/qt6tools/Config.in
> b/package/qt6/qt6tools/Config.in
> deleted file mode 100644
> index 1828e5f043..0000000000
> --- a/package/qt6/qt6tools/Config.in
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -config BR2_PACKAGE_QT6TOOLS
> -       bool "qt6tools"
> -       # The Qt Network module is required
> -       select BR2_PACKAGE_QT6BASE_NETWORK
> -       select BR2_PACKAGE_HOST_QT6TOOLS
> -       help
> -         Qt is a cross-platform application and UI framework for
> -         developers using C++.
> -
> -         Qt Tools provides tools facilitate the development
> -         and design of applications.
> -
> -         https://github.com/qt/qttools
> diff --git a/package/qt6/qt6tools/Config.in.host
> b/package/qt6/qt6tools/Config.in.host
> index 7a6f8a5176..404ebfa923 100644
> --- a/package/qt6/qt6tools/Config.in.host
> +++ b/package/qt6/qt6tools/Config.in.host
> @@ -2,9 +2,6 @@ config BR2_PACKAGE_HOST_QT6TOOLS
>         bool "host qt6tools"
>         # The Qt Qt Network module is required
>         select BR2_PACKAGE_HOST_QT6BASE_NETWORK
> -       # Requires the Qt Sql module to build the qhelpgenerator
> -       # tool, if target support for Sql is present
> -       select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
>         help
>           Qt is a cross-platform application and UI framework for
>           developers using C++.
> diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/
> qt6tools.mk
> index b063f08887..f5cfbaec9a 100644
> --- a/package/qt6/qt6tools/qt6tools.mk
> +++ b/package/qt6/qt6tools/qt6tools.mk
> @@ -27,20 +27,6 @@ QT6TOOLS_LICENSE_FILES =3D \
>         LICENSES/LGPL-3.0-only.txt \
>         LICENSES/Qt-GPL-exception-1.0.txt
>
> -QT6TOOLS_CONF_OPTS =3D \
> -       -DQT_HOST_PATH=3D$(HOST_DIR) \
> -       -DBUILD_WITH_PCH=3DOFF \
> -       -DQT_BUILD_EXAMPLES=3DOFF \
> -       -DQT_BUILD_TESTS=3DOFF
> -
> -QT6TOOLS_DEPENDENCIES =3D \
> -       qt6base \
> -       host-qt6tools
> -
> -ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> -QT6TOOLS_DEPENDENCIES +=3D qt6declarative
> -endif
> -
>  HOST_QT6TOOLS_CONF_OPTS =3D \
>         -DQT_BUILD_EXAMPLES=3DOFF \
>         -DQT_BUILD_TESTS=3DOFF
> @@ -59,5 +45,4 @@ else
>  HOST_QT6TOOLS_CONF_OPTS +=3D -DFEATURE_linguist=3DOFF
>  endif
>
> -$(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> --
> 2.49.0
>
>

--000000000000d196f6063687aad0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">After some testing I see I need the target package anyway,=
 so I&#39;ll just disable some features unconditionally instead of removing=
 the target variant.</div><br><div class=3D"gmail_quote gmail_quote_contain=
er"><div dir=3D"ltr" class=3D"gmail_attr">s=C3=B8n. 1. juni 2025 kl. 15:28 =
skrev Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com=
">roykollensvendsen@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Remove target package to fix linguist, designer and =
assistant build<br>
failures:<br>
<br>
Fixes:<br>
-- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)<br>
CMake Error at &lt;...&gt;/output/build/qt6base-6.8.1/cmake/QtToolHelpers.c=
make:768 (message):<br>
=C2=A0 Failed to find the host tool &quot;Qt6::lconvert&quot;.=C2=A0 It is =
part of the<br>
=C2=A0 Qt6LinguistTools package, but the package could not be found.=C2=A0 =
Make sure<br>
=C2=A0 you have built and installed the host Linguist module, which will en=
sure<br>
=C2=A0 the creation of the Qt6LinguistTools package.<br>
Call Stack (most recent call first):<br>
=C2=A0 &lt;...&gt;/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83 =
(qt_internal_find_tool)<br>
=C2=A0 src/linguist/lconvert/CMakeLists.txt:9 (qt_internal_add_tool)<br>
<br>
The above error can be triggered by the following defconfig:<br>
BR2_arm=3Dy<br>
BR2_cortex_a9=3Dy<br>
BR2_ARM_ENABLE_VFP=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=3Dy<br>
BR2_PACKAGE_QT6=3Dy<br>
BR2_PACKAGE_QT6BASE_GUI=3Dy<br>
BR2_PACKAGE_QT6BASE_PNG=3Dy<br>
BR2_PACKAGE_QT6BASE_WIDGETS=3Dy<br>
BR2_PACKAGE_QT6TOOLS=3Dy<br>
<br>
Fixes:<br>
CMake Error at &lt;...&gt;/output/build/qt6base-6.8.1/cmake/QtPublicWalkLib=
sHelpers.cmake:267 (message):<br>
=C2=A0 The Xml target is mentioned as a dependency for Designer, but not de=
clared.<br>
Call Stack (most recent call first):<br>
=C2=A0 &lt;...&gt;/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:8 (_=
_qt_internal_walk_libs)<br>
=C2=A0 &lt;...&gt;/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:47 (=
qt_collect_libs)<br>
=C2=A0 &lt;...&gt;/buildroot/output/build/qt6base-6.8.1/cmake/QtModuleHelpe=
rs.cmake:1027 (qt_generate_prl_file)<br>
=C2=A0 &lt;...&gt;/buildroot/output/build/qt6base-6.8.1/cmake/QtScopeFinali=
zerHelpers.cmake:24:EVAL:1 (qt_finalize_module)<br>
=C2=A0 src/designer/src/lib/CMakeLists.txt:DEFERRED<br>
<br>
The above error can be triggered by the following defconfig:<br>
BR2_arm=3Dy<br>
BR2_cortex_a9=3Dy<br>
BR2_ARM_ENABLE_VFP=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=3Dy<br>
BR2_PACKAGE_QT6=3Dy<br>
BR2_PACKAGE_QT6BASE_GUI=3Dy<br>
BR2_PACKAGE_QT6BASE_PNG=3Dy<br>
BR2_PACKAGE_QT6BASE_WIDGETS=3Dy<br>
BR2_PACKAGE_QT6TOOLS=3Dy<br>
<br>
Fixes:<br>
CMake Error at &lt;...&gt;/output/build/qt6base-6.8.1/cmake/QtToolHelpers.c=
make:768 (message):<br>
=C2=A0 Failed to find the host tool &quot;Qt6::qhelpgenerator&quot;.=C2=A0 =
It is part of the<br>
=C2=A0 Qt6ToolsTools package, but the package did not contain the tool.=C2=
=A0 Make sure<br>
=C2=A0 that the host module Tools was built with all features enabled (no<b=
r>
=C2=A0 explicitly disabled tools).<br>
Call Stack (most recent call first):<br>
=C2=A0 &lt;...&gt;/buildroot/output/build/qt6base-6.8.1/cmake/QtToolHelpers=
.cmake:83 (qt_internal_find_tool)<br>
=C2=A0 src/assistant/qhelpgenerator/CMakeLists.txt:9 (qt_internal_add_tool)=
<br>
<br>
The above error can be triggered by the following defconfig:<br>
BR2_arm=3Dy<br>
BR2_cortex_a9=3Dy<br>
BR2_ARM_ENABLE_VFP=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=3Dy<br>
BR2_PACKAGE_QT6=3Dy<br>
BR2_PACKAGE_QT6BASE_GUI=3Dy<br>
BR2_PACKAGE_QT6BASE_PNG=3Dy<br>
BR2_PACKAGE_QT6BASE_PRINTSUPPORT=3Dy<br>
BR2_PACKAGE_QT6BASE_SQL=3Dy<br>
BR2_PACKAGE_QT6BASE_SQLITE=3Dy<br>
BR2_PACKAGE_QT6BASE_WIDGETS=3Dy<br>
BR2_PACKAGE_QT6TOOLS=3Dy<br>
<br>
Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@=
gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 -<br>
=C2=A0package/qt6/qt6tools/Config.in=C2=A0 =C2=A0 =C2=A0 | 13 -------------=
<br>
=C2=A0package/qt6/qt6tools/Config.in.host |=C2=A0 3 ---<br>
=C2=A0package/qt6/qt6tools/<a href=3D"http://qt6tools.mk" rel=3D"noreferrer=
" target=3D"_blank">qt6tools.mk</a>=C2=A0 =C2=A0 | 15 ---------------<br>
=C2=A04 files changed, 32 deletions(-)<br>
=C2=A0delete mode 100644 package/qt6/qt6tools/Config.in<br>
<br>
diff --git a/package/qt6/Config.in b/package/qt6/Config.in<br>
index 10594691cf..5c18c6a3fd 100644<br>
--- a/package/qt6/Config.in<br>
+++ b/package/qt6/Config.in<br>
@@ -59,7 +59,6 @@ source &quot;package/qt6/qt6serialbus/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6serialport/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6shadertools/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6svg/Config.in&quot;<br>
-source &quot;package/qt6/qt6tools/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6virtualkeyboard/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6wayland/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6websockets/Config.in&quot;<br>
diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.i=
n<br>
deleted file mode 100644<br>
index 1828e5f043..0000000000<br>
--- a/package/qt6/qt6tools/Config.in<br>
+++ /dev/null<br>
@@ -1,13 +0,0 @@<br>
-config BR2_PACKAGE_QT6TOOLS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;qt6tools&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# The Qt Network module is required<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_NETWORK<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_QT6TOOLS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Qt is a cross-platform application and U=
I framework for<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0developers using C++.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Qt Tools provides tools facilitate the d=
evelopment<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and design of applications.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/qt/qttools=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/qt/qttools</a><br=
>
diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Con=
fig.in.host<br>
index 7a6f8a5176..404ebfa923 100644<br>
--- a/package/qt6/qt6tools/Config.in.host<br>
+++ b/package/qt6/qt6tools/Config.in.host<br>
@@ -2,9 +2,6 @@ config BR2_PACKAGE_HOST_QT6TOOLS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;host qt6tools&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The Qt Qt Network module is required<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_HOST_QT6BASE_NETWORK<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Requires the Qt Sql module to build the qhelp=
generator<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# tool, if target support for Sql is present<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACK=
AGE_QT6BASE_SQL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Qt is a cross-platform application and U=
I framework for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 developers using C++.<br>
diff --git a/package/qt6/qt6tools/<a href=3D"http://qt6tools.mk" rel=3D"nor=
eferrer" target=3D"_blank">qt6tools.mk</a> b/package/qt6/qt6tools/<a href=
=3D"http://qt6tools.mk" rel=3D"noreferrer" target=3D"_blank">qt6tools.mk</a=
><br>
index b063f08887..f5cfbaec9a 100644<br>
--- a/package/qt6/qt6tools/<a href=3D"http://qt6tools.mk" rel=3D"noreferrer=
" target=3D"_blank">qt6tools.mk</a><br>
+++ b/package/qt6/qt6tools/<a href=3D"http://qt6tools.mk" rel=3D"noreferrer=
" target=3D"_blank">qt6tools.mk</a><br>
@@ -27,20 +27,6 @@ QT6TOOLS_LICENSE_FILES =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LICENSES/LGPL-3.0-only.txt \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
<br>
-QT6TOOLS_CONF_OPTS =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF<br>
-<br>
-QT6TOOLS_DEPENDENCIES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0qt6base \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0host-qt6tools<br>
-<br>
-ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)<br>
-QT6TOOLS_DEPENDENCIES +=3D qt6declarative<br>
-endif<br>
-<br>
=C2=A0HOST_QT6TOOLS_CONF_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DQT_BUILD_EXAMPLES=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DQT_BUILD_TESTS=3DOFF<br>
@@ -59,5 +45,4 @@ else<br>
=C2=A0HOST_QT6TOOLS_CONF_OPTS +=3D -DFEATURE_linguist=3DOFF<br>
=C2=A0endif<br>
<br>
-$(eval $(cmake-package))<br>
=C2=A0$(eval $(host-cmake-package))<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--000000000000d196f6063687aad0--

--===============8741682206729859221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8741682206729859221==--
