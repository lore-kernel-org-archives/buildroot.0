Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47317C83030
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 22:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 007D5841F1;
	Mon, 30 Jun 2025 22:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTzEddvrlfaz; Mon, 30 Jun 2025 22:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE2684A2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE2684A2A;
	Mon, 30 Jun 2025 22:09:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A671C9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 22:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B074E4184B
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 22:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYX9M0ebfr38 for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 22:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 743F14018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 743F14018E
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 743F14018E
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 22:09:50 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-710e344bbf9so26274757b3.2
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 15:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751321389; x=1751926189;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FgVmMAcW0hpztTBLwyWlRAyU/zGjoMwOAxfMQpMXrCM=;
 b=HC5vuHdzyV+s+a8Rd+TLNhhpCORW+F+yhFyRoojo7J9zouWwojoygbizMaCJdobwFz
 dPQZYVl2X4k74SF81Thg5zTokfaBk9OfnzgxAXTdR4XmAbakT+4Kvz16B1+STXmLMiQ7
 NVsmJTPGukbPlNj0PASIcI9fDNDGcyLNRzc5u+tubbY5eDmLexyc3ukSc1X69N69CZJn
 R7MwlTggVETrXWKmHuAjZ2JofBS2x56Jv9GaPDGwhynGmWyLj2h4fpdsoMmtOrmlmUbV
 GiXBHYGu0FouJmrxlZ+USelv6Wfd062J3QjFfks8+hDC0+019vls9s39v7SDxBFbBNvj
 BhsA==
X-Gm-Message-State: AOJu0YzZqSs43JwHtPEay/AF3+XwGY5qYnSxCFaiBLfQYkDsVsDZinyR
 lepFeNv1cRqg2pyXIlMa4luwTxyplvvEf4AvPNBIhYHIJ1oAj8ePV/WzwcZX2KKq3Q9acAwGsmU
 23ztE/0y9kvAXaHNZzMVF2JuNJvoTWsQ34V3m
X-Gm-Gg: ASbGncvYxNeXjkw+gZHWLkM7xf/wbKVWS5aDbrAwUt2GxfDWmp/QEBYdU3eV46dg7KZ
 UuXjKhSs2gcRF6uhi1Q+2r+q3wywllG9g5dGiKe46t6HgJVfO+VzxQAt9VqfIKoGujiCGPHxxbx
 2//lmKrnoLXAXvxFmK2ILSumpWyyjTLaJxg3xBM4qffRcl
X-Google-Smtp-Source: AGHT+IGWi/VOe4OL07eryYm0ZqFS9qL3b1gf7yxLTIf82N6T8ZjgYJHZXrckQYMd6eX30UFtfoizhC4vXSQ+notYYHA=
X-Received: by 2002:a05:690c:350d:b0:6fb:9280:5bf4 with SMTP id
 00721157ae682-715171a3666mr233904757b3.30.1751321388855; Mon, 30 Jun 2025
 15:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250628140550.4030996-1-roykollensvendsen@gmail.com>
 <20250628140550.4030996-3-roykollensvendsen@gmail.com>
In-Reply-To: <20250628140550.4030996-3-roykollensvendsen@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Tue, 1 Jul 2025 00:09:36 +0200
X-Gm-Features: Ac12FXymliwE2y4yGu5iOcoeX8l5PmyOy7sDcI5C86BCrEk84HUGr6fmUt2eJTw
Message-ID: <CA+R_deq6LLZWTM5w134ES0FPftcao1TJ-KSwS0LnOx8m9zYHYg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751321389; x=1751926189; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FgVmMAcW0hpztTBLwyWlRAyU/zGjoMwOAxfMQpMXrCM=;
 b=NVT1jRrS6gyuwJZE6P2GTn8rHUdjdYmxdPJwhPybhB+gEwNlCXWm35X08O4pb/8yej
 xI2KhYwS6pmt01t2x4GBjEMptQcM4RtEzGV+ykMvJpGCZGsOVh5tiqFrnZTwOaSENx7s
 e23rUYC1Qae7/NMQhPFc3TifOUUsgsZDOxeS11OqKcjnLPCTJSzsDjwK8swsbQ3Ocqzd
 G+gwupjdU1aU/F9NhO5FabfNK2S7/MpTLmpAwu/RmIqfQA2kDcqHMY2P94ZbB5YNlOR4
 zY07MU28LORymgA4UUw75EF9b9BwYEG+vwBf/7HrtHuqtuL84NuIkc4SRFidsG6d/Ycd
 eXBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NVT1jRrS
Subject: Re: [Buildroot] [RFC 2/2] package/qt6/qt6webengine: new package
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
Cc: Bernd Kuhls <bernd@kuhls.net>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: multipart/mixed; boundary="===============7867509688888412431=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7867509688888412431==
Content-Type: multipart/alternative; boundary="0000000000004535980638d149c9"

--0000000000004535980638d149c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

l=C3=B8r. 28. juni 2025 kl. 16:06 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  package/qt6/Config.in                         |   1 +
>  ...ld-in-buildroot-caused-by-duplicated.patch |  25 ++
>  package/qt6/qt6webengine/Config.in            |  79 ++++
>  package/qt6/qt6webengine/qt6webengine.hash    |  15 +
>  package/qt6/qt6webengine/qt6webengine.mk      | 417 ++++++++++++++++++
>  5 files changed, 537 insertions(+)
>  create mode 100644
> package/qt6/qt6webengine/0001-fix-chromium-build-in-buildroot-caused-by-d=
uplicated.patch
>  create mode 100644 package/qt6/qt6webengine/Config.in
>  create mode 100644 package/qt6/qt6webengine/qt6webengine.hash
>  create mode 100644 package/qt6/qt6webengine/qt6webengine.mk
>
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index 7a998b922d..99c7b026b8 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -68,6 +68,7 @@ source "package/qt6/qt6tools/Config.in"
>  source "package/qt6/qt6virtualkeyboard/Config.in"
>  source "package/qt6/qt6wayland/Config.in"
>  source "package/qt6/qt6webchannel/Config.in"
> +source "package/qt6/qt6webengine/Config.in"
>  source "package/qt6/qt6websockets/Config.in"
>
>  endif
>

I'll try to replace the following patch by setting '-DCMAKE_SYSROOT=3D' in
CONF_OPTS.


> diff --git
> a/package/qt6/qt6webengine/0001-fix-chromium-build-in-buildroot-caused-by=
-duplicated.patch
> b/package/qt6/qt6webengine/0001-fix-chromium-build-in-buildroot-caused-by=
-duplicated.patch
> new file mode 100644
> index 0000000000..a3e44720eb
> --- /dev/null
> +++
> b/package/qt6/qt6webengine/0001-fix-chromium-build-in-buildroot-caused-by=
-duplicated.patch
> @@ -0,0 +1,25 @@
> +From a827b84caf49d19f0c21669e5a0bf8fbcba5a5a1 Mon Sep 17 00:00:00 2001
> +From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> +Date: Tue, 24 Jun 2025 00:08:34 +0200
> +Subject: [PATCH] fix chromium build in buildroot caused by duplicated pa=
th
> +
> +---
> + cmake/QtToolchainHelpers.cmake | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cmake/QtToolchainHelpers.cmake
> b/cmake/QtToolchainHelpers.cmake
> +index eaa3a4339..5b7a3f166 100644
> +--- a/cmake/QtToolchainHelpers.cmake
> ++++ b/cmake/QtToolchainHelpers.cmake
> +@@ -563,7 +563,7 @@ macro(append_toolchain_setup)
> +             list(APPEND gnArgArg host_cpu=3D"${cpu}")
> +         endif()
> +         if(CMAKE_SYSROOT)
> +-            list(APPEND gnArgArg target_sysroot=3D"${CMAKE_SYSROOT}")
> ++#            list(APPEND gnArgArg target_sysroot=3D"${CMAKE_SYSROOT}")
> +         endif()
> +     elseif(MACOS)
> +         get_gn_arch(cpu ${arch})
> +--
> +2.49.0
> +
> diff --git a/package/qt6/qt6webengine/Config.in
> b/package/qt6/qt6webengine/Config.in
> new file mode 100644
> index 0000000000..9cb7e39508
> --- /dev/null
> +++ b/package/qt6/qt6webengine/Config.in
> @@ -0,0 +1,79 @@
> +config BR2_PACKAGE_QT6WEBENGINE_ARCH_SUPPORTS
> +       bool
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n309
> +       # May be extended to other arm variants later
> +       default y if BR2_aarch64 || BR2_x86_64 || (BR2_arm &&
> BR2_ARM_CPU_ARMV7A)
> +       depends on BR2_HOSTARCH =3D "x86_64"
> +
> +comment "qt6webengine needs udev /dev management and a glibc toolchain w=
/
> host gcc >=3D 10"
> +       depends on BR2_PACKAGE_QT6WEBENGINE_ARCH_SUPPORTS
> +       depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || =
\
> +               !BR2_HOST_GCC_AT_LEAST_10
> +
> +comment "qt6webengine needs an OpenGL and EGL-capable backend"
> +       depends on BR2_PACKAGE_Q6WEBENGINE_ARCH_SUPPORTS
> +       depends on !BR2_PACKAGE_QT6_GL_SUPPORTS || !BR2_PACKAGE_HAS_LIBEG=
L
> +
> +config BR2_PACKAGE_QT6WEBENGINE
> +       bool "qt6webengine"
> +       depends on BR2_PACKAGE_QT6WEBENGINE_ARCH_SUPPORTS
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n377
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n501
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n14
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n263
> +       depends on BR2_HOST_GCC_AT_LEAST_10 # C++20
> +       depends on BR2_PACKAGE_QT6_GL_SUPPORTS
> +       depends on BR2_PACKAGE_HAS_LIBEGL
> +       depends on BR2_PACKAGE_HAS_UDEV
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n279
> +       select BR2_PACKAGE_QT6BASE_GUI
> +       select BR2_PACKAGE_QT6DECLARATIVE
> +       select BR2_PACKAGE_QT6DECLARATIVE_QUICK
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n270
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n9
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/.cmake.conf?h=3D6.9.1#n3
> +       select BR2_HOST_CMAKE_AT_LEAST_3_19
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n324
> +       select BR2_PACKAGE_HOST_NODEJS
>

I forgot to send the patches to enable the host variant of python-html5lib:


> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n347
> +       select BR2_PACKAGE_HOST_PYTHON_HTML5LIB
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n439
> +       select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_QT6BASE_XCB
> +       select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_QT6BASE_XCB
> +       select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_QT6BASE_XCB
> +       select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_QT6BASE_XCB
> +       select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_QT6BASE_XCB
> +       select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_QT6BASE_XCB
> +       select BR2_PACKAGE_XLIB_LIBXKBFILE if BR2_PACKAGE_QT6BASE_XCB
> +       select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_QT6BASE_XCB
> +       select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_QT6BASE_XCB
> +       select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_QT6BASE_XCB
> +       select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_QT6BASE_XCB
>

I have to select libnss since it is a required dependency.


> +       help
> +         This package provides Qt6 WebEngine:
> +
> +         https://doc.qt.io/qt-6/qtwebengine-index.html
> +         https://code.qt.io/cgit/qt/qtwebengine.git/
> +
> +if BR2_PACKAGE_QT6WEBENGINE
> +
> +config BR2_PACKAGE_QT6WEBENGINE_PROPRIETARY_CODECS
> +       bool "proprietary codecs"
> +       help
> +         Enables the use of proprietary codecs such as h.264/h.265 and
> +         MP3.
> +
> +config BR2_PACKAGE_QT6WEBENGINE_SPELLCHECKER
> +       bool "spellchecker"
> +       help
> +         Provides a spellchecker.
> +
> +config BR2_PACKAGE_QT6WEBENGINE_WEBRTC
> +       bool "webrtc"
> +       #
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n138
> +       select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_QT6BASE_XCB
> +       help
> +         Provides WebRTC support.
> +
> +endif
> diff --git a/package/qt6/qt6webengine/qt6webengine.hash
> b/package/qt6/qt6webengine/qt6webengine.hash
> new file mode 100644
> index 0000000000..c439848257
> --- /dev/null
> +++ b/package/qt6/qt6webengine/qt6webengine.hash
> @@ -0,0 +1,15 @@
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtwebeng=
ine-everywhere-src-6.9.1.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtweben=
gine-everywhere-src-6.9.1.tar.xz.sha256+sha256>
> 787dfde22b348f6d620f2207ed7e32ad0a5389373182614272de28ff3f91c26c
> qtwebengine-everywhere-src-6.9.1.tar.xz
> +
> +# Hashes for license files:
> +sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb
> LICENSES/Apache-2.0.txt
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> +sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499
> LICENSES/CC0-1.0.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/GPL-3.0-only.txt
> +sha256  0d816b54ffd9a6cf3bb78f2241c4e45f099b92d36d76c6944c184daa90f65a62
> LICENSES/LGPL-2.0-or-later.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSES/LGPL-3.0-only.txt
> +sha256  4f740497cf8ad0e564de90d3416a06c3d6b1d69d6883fe539925e3353d68a466
> LICENSES/LicenseRef-Tango-Icons-Public-Domain.txt
> +sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc
> LICENSES/MIT.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6webengine/qt6webengine.mk
> b/package/qt6/qt6webengine/qt6webengine.mk
> new file mode 100644
> index 0000000000..982bdce873
> --- /dev/null
> +++ b/package/qt6/qt6webengine/qt6webengine.mk
> @@ -0,0 +1,417 @@
>
> +########################################################################=
########
> +#
> +# qt6webengine
> +#
>
> +########################################################################=
########
> +
> +QT6WEBENGINE_VERSION =3D $(QT6_VERSION)
> +QT6WEBENGINE_SITE =3D $(QT6_SITE)
> +QT6WEBENGINE_SOURCE =3D
> qtwebengine-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WEBENGINE_VERSION).tar.xz
> +QT6WEBENGINE_INSTALL_STAGING =3D YES
> +QT6WEBENGINE_SUPPORTS_IN_SOURCE_BUILD =3D NO
> +QT6WEBENGINE_CMAKE_BACKEND =3D ninja
> +
> +QT6WEBENGINE_LICENSE =3D \
> +       Apache-2.0 \
> +       BSD-3-Clause \
> +       GPL-3.0 with Qt-GPL-exception-1.0 \
> +       LGPL-3.0 or GPL-2.0 or GPL-3.0 \
> +       MIT
> +
> +QT6WEBENGINE_LICENSE_FILES =3D \
> +       LICENSES/Apache-2.0.txt \
> +       LICENSES/BSD-3-Clause.txt \
> +       LICENSES/CC0-1.0.txt \
> +       LICENSES/GFDL-1.3-no-invariants-only.txt \
> +       LICENSES/GPL-2.0-only.txt \
> +       LICENSES/GPL-3.0-only.txt \
> +       LICENSES/LGPL-2.0-or-later.txt \
> +       LICENSES/LGPL-3.0-only.txt \
> +       LICENSES/LicenseRef-Tango-Icons-Public-Domain.txt \
> +       LICENSES/MIT.txt \
> +       LICENSES/Qt-GPL-exception-1.0.txt
> +
> +QT6WEBENGINE_CONF_OPTS =3D \
> +       -DBUILD_WITH_PCH=3DOFF \
> +       -DFEATURE_qtwebengine_build=3DON \
> +       -DFEATURE_qtpdf_build=3DOFF \
> +       -DQT_BUILD_EXAMPLES=3DOFF \
> +       -DQT_BUILD_TESTS=3DOFF \
> +       -DQT_HOST_PATH=3D$(HOST_DIR) \
> +       -DQT_SHOW_EXTRA_IDE_SOURCES=3DOFF
> +
> +# Host tools
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n37
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n37+QT6WEBENGINE_DEPENDENCIES>
> =3D host-ninja
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n48
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n48+QT6WEBENGINE_DEPENDENCIES>
> +=3D host-nodejs
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n38
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n38+QT6WEBENGINE_DEPENDENCIES>
> +=3D host-qt6webengine # gn host tool
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n347
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n347+QT6WEBENGINE_DEPENDENCIES>
> +=3D host-python-html5lib
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n352
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n352+QT6WEBENGINE_DEPENDENCIES>
> +=3D host-gperf
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n358
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n358+QT6WEBENGINE_DEPENDENCIES>
> +=3D host-bison
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n364
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n364+QT6WEBENGINE_DEPENDENCIES>
> +=3D host-flex
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n370
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n370+QT6WEBENGINE_DEPENDENCIES>
> +=3D host-pkgconf
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n279
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n279+QT6WEBENGINE_DEPENDENCIES>
> +=3D \
> +       host-qt6declarative \
> +       qt6base \
> +       qt6declarative
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n414
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n414+QT6WEBENGINE_DEPENDENCIES>
> +=3D \
> +       host-libnss \
> +       libnss
> +
> +QT6WEBENGINE_DEPENDENCIES +=3D host-fontconfig
> +
> +## Core
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n55
> +QT6WEBENGINE_CONF_OPTS
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.c=
make?h=3D6.9.1#n55+QT6WEBENGINE_CONF_OPTS>
> +=3D -DFEATURE_webengine_embedded_build=3DON
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n61
> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_alsa=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D alsa-lib
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_alsa=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n72
> +ifeq ($(BR2_PACKAGE_QT6POSITIONING),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_geolocation=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D qt6positioning
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_geolocation=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n76
> +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_pulseaudio=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D pulseaudio
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_pulseaudio=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n81
> +ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_gbm=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D libgbm
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_gbm=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n87
> +ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_printing_and_pdf=3DON
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_printing_and_pdf=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n93
> +ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_pepper_plugins=3DON
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_pepper_plugins=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n98
> +ifeq ($(BR2_PACKAGE_QT6WEBCHANNEL),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webchannel=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D qt6webchannel
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webchannel=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n104
> +ifeq ($(BR2_PACKAGE_QT6WEBENGINE_PROPRIETARY_CODECS),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_proprietary_codecs=3DON
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_proprietary_codecs=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n117
> +ifeq ($(BR2_PACKAGE_QT6WEBENGINE_SPELLCHECKER),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_spellchecker=3DON
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_spellchecker=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n134
> +ifeq ($(BR2_PACKAGE_QT6WEBENGINE_WEBRTC),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webrtc=3DON
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n140
> +ifeq ($(BR2_PACKAGE_GLIB2),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webrtc_pipewire=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D libglib2 # gio
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webrtc_pipewire=3DOFF
> +endif
> +ifeq ($(BR2_PACKAGE_QT6WEBENGINE_HAS_X11_SUPPORT),y)
> +QT6WEBENGINE_DEPENDENCIES +=3D xlib_libXdamage
> +endif
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webrtc=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n161
> +ifeq ($(BR2_PACKAGE_QT6BASE_VULKAN),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_vulkan=3DON
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_vulkan=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cm=
ake?h=3D6.9.1#n168
> +ifeq ($(BR2_PACKAGE_LIBVPX),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_vaapi=3DOFF
> +else ifeq ($(BR2_PACKAGE_HAS_LIBGBM)$(BR2_PACKAGE_LIBVA),yy)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_vaapi=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D libgbm libva
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_vaapi=3DOFF
> +endif
> +
> +## Optional system libraries
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n598
> +ifeq ($(BR2_PACKAGE_RE2),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_re2=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D re2
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_re2=3DOFF
> +endif
> +
>

I'll have to do something to be able to use system icu:


> +# DEBUG THIS:
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n603
> +#ifeq
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n603+%23ifeq>
> ($(BR2_PACKAGE_ICU),y)
> +#QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_icu=3DON
> +#QT6WEBENGINE_DEPENDENCIES +=3D icu
> +#else
> +#QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_icu=3DOFF
> +#endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n608
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n79
> +ifeq
> ($(BR2_PACKAGE_WEBP)$(BR2_PACKAGE_WEBP_MUX)$(BR2_PACKAGE_WEBP_DEMUX),yyy)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libwebp=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D host-webp webp
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libwebp=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n612
> +ifeq ($(BR2_PACKAGE_OPENJPEG),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libopenjpeg2=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D openjpeg
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libopenjpeg2=3DOF=
F
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n616
> +ifeq ($(BR2_PACKAGE_OPUS),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_opus=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D opus
> +# host perl is needed for optimization of opus:
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n810
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n810+QT6WEBENGINE_DEPENDENCIES>
> +=3D host-perl
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_opus=3DOFF
> +endif
> +
>

I have to modify system ffmpeg to make this work:


> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n620
> +ifeq
> ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_OPUS)$(BR2_PACKAGE_WEBP)$(BR2_PACKAGE=
_WEBP_MUX)$(BR2_PACKAGE_WEBP_DEMUX),yyyyy)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_ffmpeg=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D ffmpeg
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_ffmpeg=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n625
> +ifeq ($(BR2_PACKAGE_LIBVPX),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libvpx=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D libvpx
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libvpx=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n630
> +ifeq ($(BR2_PACKAGE_SNAPPY),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_snappy=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D snappy
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_snappy=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n634
> +ifeq ($(BR2_PACKAGE_GLIB2),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_glib=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D libglib2
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_glib=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n638
> +ifeq ($(BR2_PACKAGE_HAS_ZLIB),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_zlib=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D zlib
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_zlib=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n648
> +ifeq ($(BR2_PACKAGE_MINIZIP),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_minizip=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D minizip
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_minizip=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n652
> +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libevent=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D libevent
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libevent=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n656
> +ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT),yy)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libxml=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D libxml2 libxslt
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libxml=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n660
> +ifeq ($(BR2_PACKAGE_LCMS2),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_lcms2=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D lcms2
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_lcms2=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n664
> +ifeq
> ($(BR2_PACKAGE_LIBPNG)$(BR2_PACKAGE_QT6BASE_GUI)$(BR2_PACKAGE_QT6BASE_PNG=
),yyy)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libpng=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D libpng
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libpng=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n668
> +ifeq ($(BR2_PACKAGE_TIFF)$(BR2_PACKAGE_QT6BASE_GUI),yy)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libtiff=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D tiff
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libtiff=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n679
> +ifeq
> ($(BR2_PACKAGE_HAS_JPEG)$(BR2_PACKAGE_QT6BASE_GUI)$(BR2_PACKAGE_QT6BASE_J=
PEG),yyy)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libjpeg=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D jpeg
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libjpeg=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n690
> +ifeq
> ($(BR2_PACKAGE_HARFBUZZ)$(BR2_PACKAGE_QT6BASE_GUI)$(BR2_PACKAGE_QT6BASE_H=
ARFBUZZ),yyy)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_harfbuzz=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D harfbuzz
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_harfbuzz=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n701
> +ifeq ($(BR2_PACKAGE_FREETYPE)$(BR2_PACKAGE_QT6BASE_GUI),yyy)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_freetype=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D freetype
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_freetype=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n712
> +ifeq ($(BR2_PACKAGE_PCIUTILS),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libpci=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D pciutils # libpci
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libpci=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n717
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libudev=3DON
> +QT6WEBENGINE_DEPENDENCIES +=3D udev
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libudev=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n722
> +ifeq ($(BR2_PACKAGE_QT6BASE_XCB),y)
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_ozone_x11=3DON
> +# https://doc.qt.io/qt-6/qtwebengine-platform-notes.html#linux
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1=
#n439
> +QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.=
1#n439+QT6WEBENGINE_DEPENDENCIES>
> +=3D \
> +       libdrm \
> +       libxcb \
> +       libxkbcommon \
> +       xlib_libX11 \
> +       xlib_libXcomposite \
> +       xlib_libXcursor \
> +       xlib_libXi \
> +       xlib_libxkbfile \
> +       xlib_libXrandr \
> +       xlib_libxshmfence \
> +       xlib_libXtst \
> +       xorgproto
> +else
> +QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_ozone_x11=3DOFF
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.txt?h=3D6.9.1#=
n35
> +ifeq ($(BR2_PACKAGE_QT6SVG),y)
> +QT6WEBENGINE_DEPENDENCIES +=3D qt6svg
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.txt?h=3D6.9.1#=
n35
> +ifeq ($(BR2_PACKAGE_QT6TOOLS),y)
> +QT6WEBENGINE_DEPENDENCIES +=3D qt6tools
> +endif
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.txt?h=3D6.9.1#=
n35
> +ifeq ($(BR2_PACKAGE_QT6WEBSOCKETS),y)
> +QT6WEBENGINE_DEPENDENCIES +=3D qt6websockets
> +endif
> +
> +# Host tool 'gn' is required:
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/CMakeLists.txt?h=3D6.=
9.1#n120
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.txt?h=3D6.9.1#=
n22
> +HOST_QT6WEBENGINE_CONF_OPTS
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.txt?h=3D6.9.1=
#n22+HOST_QT6WEBENGINE_CONF_OPTS>
> =3D \
> +       -DBUILD_ONLY_GN=3DON \
> +       -DBUILD_WITH_PCH=3DOFF \
> +       -DQT_BUILD_EXAMPLES=3DOFF \
> +       -DQT_BUILD_TESTS=3DOFF \
> +       -DQT_SHOW_EXTRA_IDE_SOURCES=3DOFF
> +
> +#
> https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/gn/CMakeLists.txt?h=
=3D6.9.1#n29
> +HOST_QT6WEBENGINE_DEPENDENCIES
> <https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/gn/CMakeLists.txt?h=
=3D6.9.1#n29+HOST_QT6WEBENGINE_DEPENDENCIES>
> =3D \
> +       host-python3 \
> +       host-ninja
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> --
> 2.49.0
>
>

--0000000000004535980638d149c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">l=C3=B8r. 28. j=
uni 2025 kl. 16:06 skrev Roy Kollen Svendsen &lt;<a href=3D"mailto:roykolle=
nsvendsen@gmail.com">roykollensvendsen@gmail.com</a>&gt;:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Roy Kollen Svendse=
n &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" target=3D"_blank">royk=
ollensvendsen@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...ld-in-buildroot-caused-by-duplicated.patch |=C2=A0 25 ++<br>
=C2=A0package/qt6/qt6webengine/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 79 ++++<br>
=C2=A0package/qt6/qt6webengine/qt6webengine.hash=C2=A0 =C2=A0 |=C2=A0 15 +<=
br>
=C2=A0package/qt6/qt6webengine/<a href=3D"http://qt6webengine.mk" rel=3D"no=
referrer" target=3D"_blank">qt6webengine.mk</a>=C2=A0 =C2=A0 =C2=A0 | 417 +=
+++++++++++++++++<br>
=C2=A05 files changed, 537 insertions(+)<br>
=C2=A0create mode 100644 package/qt6/qt6webengine/0001-fix-chromium-build-i=
n-buildroot-caused-by-duplicated.patch<br>
=C2=A0create mode 100644 package/qt6/qt6webengine/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6webengine/qt6webengine.hash<br>
=C2=A0create mode 100644 package/qt6/qt6webengine/<a href=3D"http://qt6webe=
ngine.mk" rel=3D"noreferrer" target=3D"_blank">qt6webengine.mk</a><br>
<br>
diff --git a/package/qt6/Config.in b/package/qt6/Config.in<br>
index 7a998b922d..99c7b026b8 100644<br>
--- a/package/qt6/Config.in<br>
+++ b/package/qt6/Config.in<br>
@@ -68,6 +68,7 @@ source &quot;package/qt6/qt6tools/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6virtualkeyboard/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6wayland/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6webchannel/Config.in&quot;<br>
+source &quot;package/qt6/qt6webengine/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6websockets/Config.in&quot;<br>
<br>
=C2=A0endif<br></blockquote><div><br></div><div>I&#39;ll try to replace the=
 following patch by setting &#39;-DCMAKE_SYSROOT=3D&#39; in CONF_OPTS.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/package/qt6/qt6webengine/0001-fix-chromium-build-in-buildroot-=
caused-by-duplicated.patch b/package/qt6/qt6webengine/0001-fix-chromium-bui=
ld-in-buildroot-caused-by-duplicated.patch<br>
new file mode 100644<br>
index 0000000000..a3e44720eb<br>
--- /dev/null<br>
+++ b/package/qt6/qt6webengine/0001-fix-chromium-build-in-buildroot-caused-=
by-duplicated.patch<br>
@@ -0,0 +1,25 @@<br>
+From a827b84caf49d19f0c21669e5a0bf8fbcba5a5a1 Mon Sep 17 00:00:00 2001<br>
+From: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.co=
m" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<br>
+Date: Tue, 24 Jun 2025 00:08:34 +0200<br>
+Subject: [PATCH] fix chromium build in buildroot caused by duplicated path=
<br>
+<br>
+---<br>
+ cmake/QtToolchainHelpers.cmake | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/cmake/QtToolchainHelpers.cmake b/cmake/QtToolchainHelpers.cma=
ke<br>
+index eaa3a4339..5b7a3f166 100644<br>
+--- a/cmake/QtToolchainHelpers.cmake<br>
++++ b/cmake/QtToolchainHelpers.cmake<br>
+@@ -563,7 +563,7 @@ macro(append_toolchain_setup)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list(APPEND gnArgArg host_=
cpu=3D&quot;${cpu}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endif()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(CMAKE_SYSROOT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list(APPEND gnArgArg target_sys=
root=3D&quot;${CMAKE_SYSROOT}&quot;)<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list(APPEND gnArgArg target_sy=
sroot=3D&quot;${CMAKE_SYSROOT}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endif()<br>
+=C2=A0 =C2=A0 =C2=A0elseif(MACOS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_gn_arch(cpu ${arch})<br>
+-- <br>
+2.49.0<br>
+<br>
diff --git a/package/qt6/qt6webengine/Config.in b/package/qt6/qt6webengine/=
Config.in<br>
new file mode 100644<br>
index 0000000000..9cb7e39508<br>
--- /dev/null<br>
+++ b/package/qt6/qt6webengine/Config.in<br>
@@ -0,0 +1,79 @@<br>
+config BR2_PACKAGE_QT6WEBENGINE_ARCH_SUPPORTS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/configure.cmake?h=3D6.9.1#n309" rel=3D"noreferrer" target=3D"=
_blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=
=3D6.9.1#n309</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# May be extended to other arm variants later<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_aarch64 || BR2_x86_64 || (BR2_=
arm &amp;&amp; BR2_ARM_CPU_ARMV7A)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_HOSTARCH =3D &quot;x86_64&quot;<=
br>
+<br>
+comment &quot;qt6webengine needs udev /dev management and a glibc toolchai=
n w/ host gcc &gt;=3D 10&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT6WEBENGINE_ARCH_SUPPOR=
TS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCH=
AIN_USES_GLIBC || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_HOST_GCC_AT_LE=
AST_10<br>
+<br>
+comment &quot;qt6webengine needs an OpenGL and EGL-capable backend&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_Q6WEBENGINE_ARCH_SUPPORT=
S<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_QT6_GL_SUPPORTS || !BR2=
_PACKAGE_HAS_LIBEGL<br>
+<br>
+config BR2_PACKAGE_QT6WEBENGINE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;qt6webengine&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT6WEBENGINE_ARCH_SUPPOR=
TS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/configure.cmake?h=3D6.9.1#n377" rel=3D"noreferrer" target=3D"=
_blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=
=3D6.9.1#n377</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_USES_GLIBC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/configure.cmake?h=3D6.9.1#n501" rel=3D"noreferrer" target=3D"=
_blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=
=3D6.9.1#n501</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/configure.cmake?h=3D6.9.1#n14" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D=
6.9.1#n14</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/configure.cmake?h=3D6.9.1#n263" rel=3D"noreferrer" target=3D"=
_blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=
=3D6.9.1#n263</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_HOST_GCC_AT_LEAST_10 # C++20<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT6_GL_SUPPORTS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_LIBEGL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_UDEV<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/configure.cmake?h=3D6.9.1#n279" rel=3D"noreferrer" target=3D"=
_blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=
=3D6.9.1#n279</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_GUI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6DECLARATIVE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6DECLARATIVE_QUICK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/configure.cmake?h=3D6.9.1#n270" rel=3D"noreferrer" target=3D"=
_blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=
=3D6.9.1#n270</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/configure.cmake?h=3D6.9.1#n9" rel=3D"noreferrer" target=3D"_b=
lank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6=
.9.1#n9</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/.cmake.conf?h=3D6.9.1#n3" rel=3D"noreferrer" target=3D"_blank=
">https://code.qt.io/cgit/qt/qtwebengine.git/tree/.cmake.conf?h=3D6.9.1#n3<=
/a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_HOST_CMAKE_AT_LEAST_3_19<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#<a href=3D"https://code.qt.io/cgit/qt/qtwebeng=
ine.git/tree/configure.cmake?h=3D6.9.1#n324" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D=
6.9.1#n324</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_NODEJS<br>
</blockquote><div><br></div><div>I forgot to send the patches to enable the=
 host variant of python-html5lib:</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"h=
ttps://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n3=
47" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/configure.cmake?h=3D6.9.1#n347</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_PYTHON_HTML5LIB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/configure.cmake?h=3D6.9.1#n439" rel=3D"noreferrer" target=3D"=
_blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=
=3D6.9.1#n439</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_QT6BAS=
E_XCB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_=
QT6BASE_XCB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_Q=
T6BASE_XCB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PA=
CKAGE_QT6BASE_XCB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKA=
GE_QT6BASE_XCB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_QT=
6BASE_XCB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XLIB_LIBXKBFILE if BR2_PACKA=
GE_QT6BASE_XCB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAG=
E_QT6BASE_XCB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PAC=
KAGE_QT6BASE_XCB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_=
QT6BASE_XCB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_QT6=
BASE_XCB<br></blockquote><div><br></div><div>I have to select libnss since =
it is a required dependency.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This package provides Qt6 WebEngine:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtwebe=
ngine-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/qt=
-6/qtwebengine-index.html</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://code.qt.io/cgit/qt/qt=
webengine.git/" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/cgi=
t/qt/qtwebengine.git/</a><br>
+<br>
+if BR2_PACKAGE_QT6WEBENGINE<br>
+<br>
+config BR2_PACKAGE_QT6WEBENGINE_PROPRIETARY_CODECS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;proprietary codecs&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enables the use of proprietary codecs su=
ch as h.264/h.265 and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MP3.<br>
+<br>
+config BR2_PACKAGE_QT6WEBENGINE_SPELLCHECKER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;spellchecker&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Provides a spellchecker.<br>
+<br>
+config BR2_PACKAGE_QT6WEBENGINE_WEBRTC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;webrtc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://code.qt.io/cgit/qt/qtweben=
gine.git/tree/src/core/api/configure.cmake?h=3D6.9.1#n138" rel=3D"noreferre=
r" target=3D"_blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/co=
re/api/configure.cmake?h=3D6.9.1#n138</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKA=
GE_QT6BASE_XCB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Provides WebRTC support.<br>
+<br>
+endif<br>
diff --git a/package/qt6/qt6webengine/qt6webengine.hash b/package/qt6/qt6we=
bengine/qt6webengine.hash<br>
new file mode 100644<br>
index 0000000000..c439848257<br>
--- /dev/null<br>
+++ b/package/qt6/qt6webengine/qt6webengine.hash<br>
@@ -0,0 +1,15 @@<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.9/6.=
9.1/submodules/qtwebengine-everywhere-src-6.9.1.tar.xz.sha256+sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.9/6.9.1/submodules/qtwebengine-everywhere-src-6.9.1.tar.xz.sha256<br>
+sha256</a>=C2=A0 787dfde22b348f6d620f2207ed7e32ad0a5389373182614272de28ff3=
f91c26c=C2=A0 qtwebengine-everywhere-src-6.9.1.tar.xz<br>
+<br>
+# Hashes for license files:<br>
+sha256=C2=A0 e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c8=
9cb=C2=A0 LICENSES/Apache-2.0.txt<br>
+sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1d=
cce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
+sha256=C2=A0 a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0=
499=C2=A0 LICENSES/CC0-1.0.txt<br>
+sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b20=
6a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
+sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880=
643=C2=A0 LICENSES/GPL-2.0-only.txt<br>
+sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b=
903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
+sha256=C2=A0 0d816b54ffd9a6cf3bb78f2241c4e45f099b92d36d76c6944c184daa90f65=
a62=C2=A0 LICENSES/LGPL-2.0-or-later.txt<br>
+sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464=
768=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
+sha256=C2=A0 4f740497cf8ad0e564de90d3416a06c3d6b1d69d6883fe539925e3353d68a=
466=C2=A0 LICENSES/LicenseRef-Tango-Icons-Public-Domain.txt<br>
+sha256=C2=A0 d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf=
1fc=C2=A0 LICENSES/MIT.txt<br>
+sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b053084=
6b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
diff --git a/package/qt6/qt6webengine/<a href=3D"http://qt6webengine.mk" re=
l=3D"noreferrer" target=3D"_blank">qt6webengine.mk</a> b/package/qt6/qt6web=
engine/<a href=3D"http://qt6webengine.mk" rel=3D"noreferrer" target=3D"_bla=
nk">qt6webengine.mk</a><br>
new file mode 100644<br>
index 0000000000..982bdce873<br>
--- /dev/null<br>
+++ b/package/qt6/qt6webengine/<a href=3D"http://qt6webengine.mk" rel=3D"no=
referrer" target=3D"_blank">qt6webengine.mk</a><br>
@@ -0,0 +1,417 @@<br>
+##########################################################################=
######<br>
+#<br>
+# qt6webengine<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+QT6WEBENGINE_VERSION =3D $(QT6_VERSION)<br>
+QT6WEBENGINE_SITE =3D $(QT6_SITE)<br>
+QT6WEBENGINE_SOURCE =3D qtwebengine-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WEBE=
NGINE_VERSION).tar.xz<br>
+QT6WEBENGINE_INSTALL_STAGING =3D YES<br>
+QT6WEBENGINE_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
+QT6WEBENGINE_CMAKE_BACKEND =3D ninja<br>
+<br>
+QT6WEBENGINE_LICENSE =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Apache-2.0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0 with Qt-GPL-exception-1.0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LGPL-3.0 or GPL-2.0 or GPL-3.0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MIT<br>
+<br>
+QT6WEBENGINE_LICENSE_FILES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/Apache-2.0.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/BSD-3-Clause.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/CC0-1.0.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GFDL-1.3-no-invariants-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GPL-2.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/LGPL-2.0-or-later.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/LGPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/LicenseRef-Tango-Icons-Public-Domain.t=
xt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/MIT.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/Qt-GPL-exception-1.0.txt<br>
+<br>
+QT6WEBENGINE_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_qtwebengine_build=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_qtpdf_build=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_SHOW_EXTRA_IDE_SOURCES=3DOFF<br>
+<br>
+# Host tools<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n37+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_b=
lank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6=
.9.1#n37<br>
+QT6WEBENGINE_DEPENDENCIES</a> =3D host-ninja<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n48+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_b=
lank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6=
.9.1#n48<br>
+QT6WEBENGINE_DEPENDENCIES</a> +=3D host-nodejs<br>
+<br>
+#<a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmak=
e?h=3D6.9.1#n38+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_bl=
ank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.=
9.1#n38<br>
+QT6WEBENGINE_DEPENDENCIES</a> +=3D host-qt6webengine # gn host tool<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n347+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D=
6.9.1#n347<br>
+QT6WEBENGINE_DEPENDENCIES</a> +=3D host-python-html5lib<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n352+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D=
6.9.1#n352<br>
+QT6WEBENGINE_DEPENDENCIES</a> +=3D host-gperf<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n358+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D=
6.9.1#n358<br>
+QT6WEBENGINE_DEPENDENCIES</a> +=3D host-bison<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n364+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D=
6.9.1#n364<br>
+QT6WEBENGINE_DEPENDENCIES</a> +=3D host-flex<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n370+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D=
6.9.1#n370<br>
+QT6WEBENGINE_DEPENDENCIES</a> +=3D host-pkgconf<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n279+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D=
6.9.1#n279<br>
+QT6WEBENGINE_DEPENDENCIES</a> +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-qt6declarative \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qt6base \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qt6declarative<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n414+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D=
6.9.1#n414<br>
+QT6WEBENGINE_DEPENDENCIES</a> +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-libnss \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libnss<br>
+<br>
+QT6WEBENGINE_DEPENDENCIES +=3D host-fontconfig<br>
+<br>
+## Core<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n55+QT6WEBENGINE_CONF_OPTS" rel=3D"noreferrer" ta=
rget=3D"_blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/ap=
i/configure.cmake?h=3D6.9.1#n55<br>
+QT6WEBENGINE_CONF_OPTS</a> +=3D -DFEATURE_webengine_embedded_build=3DON<br=
>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n61" rel=3D"noreferrer" target=3D"_blank">https:/=
/code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D6=
.9.1#n61</a><br>
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_alsa=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D alsa-lib<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_alsa=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n72" rel=3D"noreferrer" target=3D"_blank">https:/=
/code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D6=
.9.1#n72</a><br>
+ifeq ($(BR2_PACKAGE_QT6POSITIONING),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_geolocation=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D qt6positioning<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_geolocation=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n76" rel=3D"noreferrer" target=3D"_blank">https:/=
/code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D6=
.9.1#n76</a><br>
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_pulseaudio=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D pulseaudio<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_pulseaudio=3DOFF<br=
>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n81" rel=3D"noreferrer" target=3D"_blank">https:/=
/code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D6=
.9.1#n81</a><br>
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_gbm=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D libgbm<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_gbm=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n87" rel=3D"noreferrer" target=3D"_blank">https:/=
/code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D6=
.9.1#n87</a><br>
+ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_printing_and_pdf=3DON<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_printing_and_pdf=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n93" rel=3D"noreferrer" target=3D"_blank">https:/=
/code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D6=
.9.1#n93</a><br>
+ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_pepper_plugins=3DON<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_pepper_plugins=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n98" rel=3D"noreferrer" target=3D"_blank">https:/=
/code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D6=
.9.1#n98</a><br>
+ifeq ($(BR2_PACKAGE_QT6WEBCHANNEL),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webchannel=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D qt6webchannel<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webchannel=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n104" rel=3D"noreferrer" target=3D"_blank">https:=
//code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D=
6.9.1#n104</a><br>
+ifeq ($(BR2_PACKAGE_QT6WEBENGINE_PROPRIETARY_CODECS),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_proprietary_codecs=3DON<br=
>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_proprietary_codecs=3DOFF<b=
r>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n117" rel=3D"noreferrer" target=3D"_blank">https:=
//code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D=
6.9.1#n117</a><br>
+ifeq ($(BR2_PACKAGE_QT6WEBENGINE_SPELLCHECKER),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_spellchecker=3DON<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_spellchecker=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n134" rel=3D"noreferrer" target=3D"_blank">https:=
//code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D=
6.9.1#n134</a><br>
+ifeq ($(BR2_PACKAGE_QT6WEBENGINE_WEBRTC),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webrtc=3DON<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n140" rel=3D"noreferrer" target=3D"_blank">https:=
//code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D=
6.9.1#n140</a><br>
+ifeq ($(BR2_PACKAGE_GLIB2),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webrtc_pipewire=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D libglib2 # gio<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webrtc_pipewire=3DOFF<br>
+endif<br>
+ifeq ($(BR2_PACKAGE_QT6WEBENGINE_HAS_X11_SUPPORT),y)<br>
+QT6WEBENGINE_DEPENDENCIES +=3D xlib_libXdamage<br>
+endif<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_webrtc=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n161" rel=3D"noreferrer" target=3D"_blank">https:=
//code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D=
6.9.1#n161</a><br>
+ifeq ($(BR2_PACKAGE_QT6BASE_VULKAN),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_vulkan=3DON<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_vulkan=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/=
configure.cmake?h=3D6.9.1#n168" rel=3D"noreferrer" target=3D"_blank">https:=
//code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=3D=
6.9.1#n168</a><br>
+ifeq ($(BR2_PACKAGE_LIBVPX),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_vaapi=3DOFF<br>
+else ifeq ($(BR2_PACKAGE_HAS_LIBGBM)$(BR2_PACKAGE_LIBVA),yy)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_vaapi=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D libgbm libva<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_vaapi=3DOFF<br>
+endif<br>
+<br>
+## Optional system libraries<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n598" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n598</a><br>
+ifeq ($(BR2_PACKAGE_RE2),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_re2=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D re2<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_re2=3DOFF<br>
+endif<br>
+<br></blockquote><div><br></div><div>I&#39;ll have to do something to be a=
ble to use system icu:</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
+# DEBUG THIS:<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n603+%23ifeq" rel=3D"noreferrer" target=3D"_blank">https://cod=
e.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n603<br>
+#ifeq</a> ($(BR2_PACKAGE_ICU),y)<br>
+#QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_icu=3DON<br>
+#QT6WEBENGINE_DEPENDENCIES +=3D icu<br>
+#else<br>
+#QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_icu=3DOFF<br>
+#endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n608" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n608</a><br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n79" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n79</a><br>
+ifeq ($(BR2_PACKAGE_WEBP)$(BR2_PACKAGE_WEBP_MUX)$(BR2_PACKAGE_WEBP_DEMUX),=
yyy)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libwebp=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D host-webp webp<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libwebp=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n612" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n612</a><br>
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libopenjpeg2=3DON<b=
r>
+QT6WEBENGINE_DEPENDENCIES +=3D openjpeg<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libopenjpeg2=3DOFF<=
br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n616" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n616</a><br>
+ifeq ($(BR2_PACKAGE_OPUS),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_opus=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D opus<br>
+# host perl is needed for optimization of opus:<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n810+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D=
6.9.1#n810<br>
+QT6WEBENGINE_DEPENDENCIES</a> +=3D host-perl<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_opus=3DOFF<br>
+endif<br>
+<br>
</blockquote><div><br></div><div>I have to modify system ffmpeg to make thi=
s work:</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configur=
e.cmake?h=3D6.9.1#n620" rel=3D"noreferrer" target=3D"_blank">https://code.q=
t.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n620</a><br>
+ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_OPUS)$(BR2_PACKAGE_WEBP)$(BR2_PAC=
KAGE_WEBP_MUX)$(BR2_PACKAGE_WEBP_DEMUX),yyyyy)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_ffmpeg=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D ffmpeg<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_ffmpeg=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n625" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n625</a><br>
+ifeq ($(BR2_PACKAGE_LIBVPX),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libvpx=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D libvpx<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libvpx=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n630" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n630</a><br>
+ifeq ($(BR2_PACKAGE_SNAPPY),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_snappy=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D snappy<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_snappy=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n634" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n634</a><br>
+ifeq ($(BR2_PACKAGE_GLIB2),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_glib=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D libglib2<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_glib=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n638" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n638</a><br>
+ifeq ($(BR2_PACKAGE_HAS_ZLIB),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_zlib=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D zlib<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_zlib=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n648" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n648</a><br>
+ifeq ($(BR2_PACKAGE_MINIZIP),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_minizip=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D minizip<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_minizip=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n652" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n652</a><br>
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libevent=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D libevent<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libevent=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n656" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n656</a><br>
+ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT),yy)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libxml=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D libxml2 libxslt<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libxml=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n660" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n660</a><br>
+ifeq ($(BR2_PACKAGE_LCMS2),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_lcms2=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D lcms2<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_lcms2=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n664" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n664</a><br>
+ifeq ($(BR2_PACKAGE_LIBPNG)$(BR2_PACKAGE_QT6BASE_GUI)$(BR2_PACKAGE_QT6BASE=
_PNG),yyy)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libpng=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D libpng<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libpng=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n668" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n668</a><br>
+ifeq ($(BR2_PACKAGE_TIFF)$(BR2_PACKAGE_QT6BASE_GUI),yy)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libtiff=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D tiff<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libtiff=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n679" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n679</a><br>
+ifeq ($(BR2_PACKAGE_HAS_JPEG)$(BR2_PACKAGE_QT6BASE_GUI)$(BR2_PACKAGE_QT6BA=
SE_JPEG),yyy)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libjpeg=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D jpeg<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libjpeg=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n690" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n690</a><br>
+ifeq ($(BR2_PACKAGE_HARFBUZZ)$(BR2_PACKAGE_QT6BASE_GUI)$(BR2_PACKAGE_QT6BA=
SE_HARFBUZZ),yyy)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_harfbuzz=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D harfbuzz<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_harfbuzz=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n701" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n701</a><br>
+ifeq ($(BR2_PACKAGE_FREETYPE)$(BR2_PACKAGE_QT6BASE_GUI),yyy)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_freetype=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D freetype<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_freetype=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n712" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n712</a><br>
+ifeq ($(BR2_PACKAGE_PCIUTILS),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libpci=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D pciutils # libpci<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libpci=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n717" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n717</a><br>
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libudev=3DON<br>
+QT6WEBENGINE_DEPENDENCIES +=3D udev<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_system_libudev=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n722" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/=
cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D6.9.1#n722</a><br>
+ifeq ($(BR2_PACKAGE_QT6BASE_XCB),y)<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_ozone_x11=3DON<br>
+# <a href=3D"https://doc.qt.io/qt-6/qtwebengine-platform-notes.html#linux"=
 rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/qt-6/qtwebengine-pl=
atform-notes.html#linux</a><br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cma=
ke?h=3D6.9.1#n439+QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=3D=
6.9.1#n439<br>
+QT6WEBENGINE_DEPENDENCIES</a> +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libdrm \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libxcb \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libxkbcommon \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xlib_libX11 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xlib_libXcomposite \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xlib_libXcursor \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xlib_libXi \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xlib_libxkbfile \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xlib_libXrandr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xlib_libxshmfence \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xlib_libXtst \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xorgproto<br>
+else<br>
+QT6WEBENGINE_CONF_OPTS +=3D -DFEATURE_webengine_ozone_x11=3DOFF<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.tx=
t?h=3D6.9.1#n35" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/cg=
it/qt/qtwebengine.git/tree/CMakeLists.txt?h=3D6.9.1#n35</a><br>
+ifeq ($(BR2_PACKAGE_QT6SVG),y)<br>
+QT6WEBENGINE_DEPENDENCIES +=3D qt6svg<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.tx=
t?h=3D6.9.1#n35" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/cg=
it/qt/qtwebengine.git/tree/CMakeLists.txt?h=3D6.9.1#n35</a><br>
+ifeq ($(BR2_PACKAGE_QT6TOOLS),y)<br>
+QT6WEBENGINE_DEPENDENCIES +=3D qt6tools<br>
+endif<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.tx=
t?h=3D6.9.1#n35" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/cg=
it/qt/qtwebengine.git/tree/CMakeLists.txt?h=3D6.9.1#n35</a><br>
+ifeq ($(BR2_PACKAGE_QT6WEBSOCKETS),y)<br>
+QT6WEBENGINE_DEPENDENCIES +=3D qt6websockets<br>
+endif<br>
+<br>
+# Host tool &#39;gn&#39; is required:<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/CMakeList=
s.txt?h=3D6.9.1#n120" rel=3D"noreferrer" target=3D"_blank">https://code.qt.=
io/cgit/qt/qtwebengine.git/tree/src/CMakeLists.txt?h=3D6.9.1#n120</a><br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.tx=
t?h=3D6.9.1#n22+HOST_QT6WEBENGINE_CONF_OPTS" rel=3D"noreferrer" target=3D"_=
blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.txt?h=3D6=
.9.1#n22<br>
+HOST_QT6WEBENGINE_CONF_OPTS</a> =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_ONLY_GN=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_SHOW_EXTRA_IDE_SOURCES=3DOFF<br>
+<br>
+# <a href=3D"https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/gn/CMakeL=
ists.txt?h=3D6.9.1#n29+HOST_QT6WEBENGINE_DEPENDENCIES" rel=3D"noreferrer" t=
arget=3D"_blank">https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/gn/CMa=
keLists.txt?h=3D6.9.1#n29<br>
+HOST_QT6WEBENGINE_DEPENDENCIES</a> =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-python3 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-ninja<br>
+<br>
+$(eval $(cmake-package))<br>
+$(eval $(host-cmake-package))<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--0000000000004535980638d149c9--

--===============7867509688888412431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7867509688888412431==--
