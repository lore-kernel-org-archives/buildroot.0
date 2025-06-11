Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFA9C677C4
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 13:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF2B421F6;
	Wed, 11 Jun 2025 13:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzMcxemQkUfZ; Wed, 11 Jun 2025 13:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 604A342162
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 604A342162;
	Wed, 11 Jun 2025 13:11:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D344237
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 13:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1932160A73
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 13:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vreda12XgmgK for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 13:11:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21A69608D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21A69608D4
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21A69608D4
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 13:11:20 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-32addf54a00so47341611fa.1
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 06:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749647478; x=1750252278;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z9Beav3Di/MstijQdVeOC1nISvAKI0RBsxdJj/OI1X8=;
 b=rc1kf1eJUEtj5W6+BSFz7FvIrH+HIXL7N4jNImNup5qN+4k0SCYBwCjFafdNQnS4MQ
 6cNpBaXhBsUyoB9UIKrKH0nvMvcQ4uPp42tBAPtMbjV5pNHg0cWhB0+hKFhaYwkusAsw
 XipsaWGVCzUTcmu3DcD8j4NxLiHBI1+m5+sGDCOG+Eyewf+F2qSriYJZr04RkStrVIF/
 WZBMxeh9/8Ob/1LqFo8NWWSqv2AUTpO6uPYG8vJ99erlF7LgQuRkg3jlRcoSj5f1Od3P
 9iM3gHfvFezXTeW+5tGO9oMYq08KizUHukE2O2A3XRtrR3zKBlGIpReYFHckhWp3dQG3
 9+yA==
X-Gm-Message-State: AOJu0YyWttcUcXQDxoRW7ZEgLHANCtcDtgHr+LdOCcsywwYFvnYv3KJj
 +TTVFhDvInhvZgihqbTIbgezJskDk23JObno128Yq1qnLPhdqA5dARbcwmmmziVSretGCkAXPrH
 kZmhDRafidQH6mO1XbT7bn9ep4vmnIvU=
X-Gm-Gg: ASbGncsR3vxgmR2F6AUwMEtGNbqDqydKrPR7yc7OEVGdSz9vKbpSUByf0KDCmgMEMDu
 ts+ToyynRAVJwJchxXGX921m3ZTMUtq9USGT8rTRfQFIlVUMZeNTtZYfyDUoSTZXwPGl693YDTN
 yB2web3QB6/HGPSAL0LhvSeFiANdsOHpMh+DUNfxNzY0dM
X-Google-Smtp-Source: AGHT+IGI/vh3+9IjhU2/pqpR3ZHsRpxzCpVNTUd0kai9LdLEOK1oNIWkeUx39ZuI3mG/c+x5yhqPCiKoH/sgyLGLSdo=
X-Received: by 2002:a05:651c:4cb:b0:30d:626e:d03a with SMTP id
 38308e7fff4ca-32b21dfccfdmr9969901fa.34.1749647477432; Wed, 11 Jun 2025
 06:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250611111640.702572-1-alex.bennee@linaro.org>
 <20250611111640.702572-5-alex.bennee@linaro.org>
In-Reply-To: <20250611111640.702572-5-alex.bennee@linaro.org>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 11 Jun 2025 15:11:05 +0200
X-Gm-Features: AX0GCFt3JE1gPmsrrovNQYukXgWVvmqB_py-3hY3p0myudwG0hiZFG5uu92lSds
Message-ID: <CAEyMn7Yu_ZAPhaAOSHO7K+LbbVAGQqe84_UCe4uKqnJ+4UbDsQ@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749647478; x=1750252278; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9Beav3Di/MstijQdVeOC1nISvAKI0RBsxdJj/OI1X8=;
 b=BtHMAgYPRIjqirrWpQNWh82jWkV3tW5vDxf+iCVUzuuuTz/KhjzgT+XJFAJgXkF+E4
 UPRujeQshzjvcjRGfoorYGvo8NcMwnDeiKsE8Bd32LNfl4GNmAKPRlmwvaUL8vH4TG6X
 iJftNApsJslD20vgpmimiKGDXQicdiL+2YjEFA9sp73SSd160ItDsaVr2z37s70h1JY/
 +a9F3Xm67krJ7XBG3a/So1gVKQTHaGA07ShdYMO8G1RW9vDPd7jlHkJFXf8K1h4ogYvF
 eF+1E0D9QJwfRVs0AnxBcp3yTuaMe57YUtpRzYA+IMGKT+p0uvHG2uWEUS5diMQerCFa
 UAMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BtHMAgYP
Subject: Re: [Buildroot] [PATCH v6 4/5] package/vkmark: add vkmark
 benchmarking tool
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
Content-Type: multipart/mixed; boundary="===============3087633954881977088=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3087633954881977088==
Content-Type: multipart/alternative; boundary="0000000000005fe81d06374b8c37"

--0000000000005fe81d06374b8c37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Am Mi., 11. Juni 2025 um 13:16 Uhr schrieb Alex Benn=C3=A9e <
alex.bennee@linaro.org>:

> We build from a recent HEAD to ensure we have the fixes to better
> handle the missing KHR_display extension.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>
I tried to build vkmark against, now with wayland enabled and I see this:


Program /usr/bin/wayland-scanner found: NO

../out-weston/build/vkmark-36e7d9b2ecf723e876add65534e95f55ec1bc79d/src/mes=
on.build:116:22:
ERROR: Program '/usr/bin/wayland-scanner' not found or not executable

A full log can be found at
/srv/storage/hthiery/sources/sa67/out-weston/build/vkmark-36e7d9b2ecf723e87=
6add65534e95f55ec1bc79d/buildroot-build/meson-logs/meson-log.txt
make[1]: *** [package/pkg-generic.mk:263:
/srv/storage/hthiery/sources/sa67/out-weston/build/vkmark-36e7d9b2ecf723e87=
6add65534e95f55ec1bc79d/.stamp_configured]
Error 1
make: *** [Makefile:23: _all] Error 2


It looks like here we have something similar like before. It looks under
'/usr/bin/wayland-scanner' but the prefix is missing.



> ---
> v6
>   - add patches from https://github.com/vkmark/vkmark/pull/76
>   - sort Kconfig symbols
>   - update .checkpackageignore
> v5
>   - move from 2025.1 to HEAD (36e7d9b build: Enable precompiled headers)
>   - drop old patch (see adf1aa3 for final fix)
> v4
>   - fix tab vs space damage
>   - don't if BR2_PACKAGE_VKMARK_FLAVOR_ANY
>   - make comments properly depend
>   - use the new 2025.01 release
>   - add sha256sum of COPYING-LGPL2.1
>   - alphabetic sort of initial VKMARK_DEPENDENCIES
>   - add vulkan error probing patch
> v3
>   - add xcb-util-wm deps under X11
>   - add assimp directly to VKMARK_DEPENDENCIES
>   - drop duplicate BR2_INSTALL_LIBSTDCPP
>   - drop BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> v2
>   - fix whitespace errors in Config.in
>   - fix sorting of sources
>   - add DEVELOPERS entry
>   - rework KConfig based on review
>   - drop unused sha256sum
>   - explicitly enable/disable the backends
> ---
>  .checkpackageignore                           |  2 +
>  DEVELOPERS                                    |  3 +
>  package/Config.in                             |  1 +
>  ...ce-deprecated-get_pkgconfig_variable.patch | 66 +++++++++++++++++++
>  ...02-meson-fix-cross-compilation-50-75.patch | 35 ++++++++++
>  package/vkmark/Config.in                      | 48 ++++++++++++++
>  package/vkmark/vkmark.hash                    |  3 +
>  package/vkmark/vkmark.mk                      | 34 ++++++++++
>  8 files changed, 192 insertions(+)
>  create mode 100644
> package/vkmark/0001-meson-replace-deprecated-get_pkgconfig_variable.patch
>  create mode 100644
> package/vkmark/0002-meson-fix-cross-compilation-50-75.patch
>  create mode 100644 package/vkmark/Config.in
>  create mode 100644 package/vkmark/vkmark.hash
>  create mode 100644 package/vkmark/vkmark.mk
>
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 5cbbbd38ba..2f8f717aec 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1203,6 +1203,8 @@
> package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch lib_patch.Upstream
>  package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-avail=
ab.patch
> lib_patch.Upstream
>  package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
> lib_patch.Upstream
>  package/vdr/0001-getloadavg.patch lib_patch.Upstream
> +package/vkmark/0001-meson-replace-deprecated-get_pkgconfig_variable.patc=
h
> lib_patch.NumberedSubject lib_patch.Upstream
> +package/vkmark/0002-meson-fix-cross-compilation-50-75.patch
> lib_patch.NumberedSubject lib_patch.Upstream
>  package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch
> lib_patch.Upstream
>  package/vlc/0002-automake-add-subdir-objects-option.patch
> lib_patch.Upstream
>  package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch
> lib_patch.Upstream
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a7bb3bd834..774381e77c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -141,6 +141,9 @@ F:  package/liblog4c-localtime/
>  N:     Alexandre Belloni <alexandre.belloni@bootlin.com>
>  F:     package/tz/
>
> +N:     Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +F:     package/vkmark/
> +
>  N:     Alexandre Esse <alexandre.esse.dev@gmail.com>
>  F:     package/kvazaar/
>  F:     package/v4l2loopback/
> diff --git a/package/Config.in b/package/Config.in
> index 2db555350d..804c7979b0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -339,6 +339,7 @@ comment "Graphic applications"
>         source "package/swaybg/Config.in"
>         source "package/tesseract-ocr/Config.in"
>         source "package/tinifier/Config.in"
> +       source "package/vkmark/Config.in"
>
>  comment "Graphic libraries"
>         source "package/cegui/Config.in"
> diff --git
> a/package/vkmark/0001-meson-replace-deprecated-get_pkgconfig_variable.pat=
ch
> b/package/vkmark/0001-meson-replace-deprecated-get_pkgconfig_variable.pat=
ch
> new file mode 100644
> index 0000000000..1a24a62526
> --- /dev/null
> +++
> b/package/vkmark/0001-meson-replace-deprecated-get_pkgconfig_variable.pat=
ch
> @@ -0,0 +1,66 @@
> +From d14487a31026a25ca0c294989e1db4d5039a6270 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>
> +Date: Fri, 6 Jun 2025 17:40:02 +0100
> +Subject: [PATCH 1/2] meson: replace deprecated get_pkgconfig_variable
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This function will be deprecated on modern mesons. Update the minimum
> +version to 0.56 which is enough for most of the current LTS's and
> +replace with calls to get_variable().
> +
> +Looking at repology this covers:
> +
> +  Debian Bookworm (soon to be oldstable): 1.0.1-5
> +  Ubuntu 22.04: 0.61.2
> +  CentOS Stream 8: 0.58.2 (CentOS 8 Power Tools is 0.55.3)
> +  openSUSE Leap 15.6: 1.3.1
> +  FreeBSD Ports: 1.7.0
> +
> +Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +---
> + meson.build     | 2 +-
> + src/meson.build | 6 +++---
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index e7bdb18..2d08d53 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -3,7 +3,7 @@ project(
> +     ['cpp', 'c'],
> +     default_options : ['cpp_std=3Dc++17'],
> +     version : '2025.01',
> +-    meson_version: '>=3D0.45'
> ++    meson_version: '>=3D0.58'
> +     )
> +
> + root_incdir =3D include_directories('.')
> +diff --git a/src/meson.build b/src/meson.build
> +index 5c543d6..a664ddc 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -1,7 +1,7 @@
> + prog_python =3D find_program('python3')
> +
> + vk_xml =3D join_paths([
> +-    vulkan_dep.get_pkgconfig_variable('prefix'),
> ++    vulkan_dep.get_variable('prefix'),
> +     'share', 'vulkan', 'registry',
> +     'vk.xml'
> +     ])
> +@@ -111,8 +111,8 @@ if build_xcb_ws
> + endif
> +
> + if build_wayland_ws
> +-    wayland_scanner =3D
> find_program(wayland_scanner_dep.get_pkgconfig_variable('wayland_scanner'=
))
> +-    wayland_protocols_dir =3D
> wayland_protocols_dep.get_pkgconfig_variable('pkgdatadir')
> ++    wayland_scanner =3D
> find_program(wayland_scanner_dep.get_variable('wayland_scanner'))
> ++    wayland_protocols_dir =3D
> wayland_protocols_dep.get_variable('pkgdatadir')
> +
> +     xdg_shell_xml_path =3D wayland_protocols_dir +
> '/stable/xdg-shell/xdg-shell.xml'
> +     xdg_shell_client_header =3D custom_target(
> +--
> +2.47.2
> +
> diff --git a/package/vkmark/0002-meson-fix-cross-compilation-50-75.patch
> b/package/vkmark/0002-meson-fix-cross-compilation-50-75.patch
> new file mode 100644
> index 0000000000..92b8cbc1b9
> --- /dev/null
> +++ b/package/vkmark/0002-meson-fix-cross-compilation-50-75.patch
> @@ -0,0 +1,35 @@
> +From dc9a0c2d8687501ddf97c97599fa7a69d07d3d3d Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>
> +Date: Fri, 6 Jun 2025 17:48:40 +0100
> +Subject: [PATCH 2/2] meson: fix cross-compilation (#50, #75)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Now we have updated the minimum meson version we can apply sys_root to
> +the prefix variable to ensure we can find the right vk.xml when
> +cross-compiling.
> +
> +Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +---
> + src/meson.build | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index a664ddc..b0e8c4a 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -1,7 +1,9 @@
> + prog_python =3D find_program('python3')
> +
> ++vulkan_prefix =3D meson.get_external_property('sys_root', '') +
> vulkan_dep.get_variable('prefix')
> ++
> + vk_xml =3D join_paths([
> +-    vulkan_dep.get_variable('prefix'),
> ++    vulkan_prefix,
> +     'share', 'vulkan', 'registry',
> +     'vk.xml'
> +     ])
> +--
> +2.47.2
> +
> diff --git a/package/vkmark/Config.in b/package/vkmark/Config.in
> new file mode 100644
> index 0000000000..b0e85c9c55
> --- /dev/null
> +++ b/package/vkmark/Config.in
> @@ -0,0 +1,48 @@
> +config BR2_PACKAGE_VKMARK_FLAVOR_ANY
> +       bool
> +
> +config BR2_PACKAGE_VKMARK_FLAVOR_KMS
> +       bool
> +       default y if BR2_PACKAGE_HAS_LIBGBM
> +       select BR2_PACKAGE_VKMARK_FLAVOR_ANY
> +
> +config BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND
> +       bool
> +       default y if BR2_PACKAGE_WAYLAND
> +       select BR2_PACKAGE_VKMARK_FLAVOR_ANY
> +
> +config BR2_PACKAGE_VKMARK_FLAVOR_X11
> +       bool
> +       default y if BR2_PACKAGE_XORG7
> +       select BR2_PACKAGE_VKMARK_FLAVOR_ANY
> +
> +config BR2_PACKAGE_VKMARK
> +       bool "vkmark"
> +       depends on BR2_PACKAGE_VKMARK_FLAVOR_ANY
> +       depends on !BR2_STATIC_LIBS # vulkan-loader
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
> +       depends on BR2_USE_WCHAR # assimp
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # assimp
> +       depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader, glm, assimp,
> vkmark
> +       select BR2_PACKAGE_VULKAN_HEADERS
> +       select BR2_PACKAGE_VULKAN_LOADER
> +       select BR2_PACKAGE_GLM
> +       select BR2_PACKAGE_ASSIMP
> +       select BR2_PACKAGE_WAYLAND_PROTOCOLS if
> BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND
> +       select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_VKMARK_FLAVOR_X11
> +       select BR2_PACKAGE_XCB_UTIL_WM if BR2_PACKAGE_VKMARK_FLAVOR_X11
> +       select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_VKMARK_FLAVOR_KMS
> +       help
> +         vmmark is an Vulkan GPU benchmark.
> +
> +         https://github.com/vkmark/vkmark
> +
> +comment "vkmark needs a toolchain w/ dynamic library, threads, wchar, gc=
c
> >=3D 7, C++"
> +       depends on BR2_STATIC_LIBS || \
> +       !BR2_TOOLCHAIN_HAS_THREADS || \
> +       !BR2_USE_WCHAR || \
> +       !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +       !BR2_INSTALL_LIBSTDCPP
> +
> +comment "vkmark needs a backend: gbm, wayland or xcb"
> +       depends on !BR2_PACKAGE_VKMARK_FLAVOR_ANY
> diff --git a/package/vkmark/vkmark.hash b/package/vkmark/vkmark.hash
> new file mode 100644
> index 0000000000..34c3121939
> --- /dev/null
> +++ b/package/vkmark/vkmark.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  2225ef4e3ba785abcc249664644908b909517cae6c04bf37e9f3d0cf206efe83
> vkmark-36e7d9b2ecf723e876add65534e95f55ec1bc79d.tar.gz
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551
> COPYING-LGPL2.1
> diff --git a/package/vkmark/vkmark.mk b/package/vkmark/vkmark.mk
> new file mode 100644
> index 0000000000..d7e8ea2e6d
> --- /dev/null
> +++ b/package/vkmark/vkmark.mk
> @@ -0,0 +1,34 @@
>
> +########################################################################=
########
> +#
> +# vkmark
> +#
>
> +########################################################################=
########
> +
> +VKMARK_VERSION =3D 36e7d9b2ecf723e876add65534e95f55ec1bc79d
> +VKMARK_SITE =3D $(call github,vkmark,vkmark,$(VKMARK_VERSION))
> +VKMARK_LICENSE =3D LGPL-2.1
> +VKMARK_LICENSE_FILES =3D COPYING-LGPL2.1
> +VKMARK_DEPENDENCIES =3D assimp glm host-pkgconf vulkan-headers vulkan-lo=
ader
> +
> +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_KMS),y)
> +VKMARK_DEPENDENCIES +=3D libdrm libgbm
> +VKMARK_CONF_OPTS +=3D -Dkms=3Dtrue
> +else
> +VKMARK_CONF_OPTS +=3D -Dkms=3Dfalse
> +endif
> +
> +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND),y)
> +VKMARK_DEPENDENCIES +=3D wayland wayland-protocols
> +VKMARK_CONF_OPTS +=3D -Dwayland=3Dtrue
> +else
> +VKMARK_CONF_OPTS +=3D -Dwayland=3Dfalse
> +endif
> +
> +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_X11),y)
> +VKMARK_DEPENDENCIES +=3D libxcb xcb-util-wm
> +VKMARK_CONF_OPTS +=3D -Dxcb=3Dtrue
> +else
> +VKMARK_CONF_OPTS +=3D -Dxcb=3Dfalse
> +endif
> +
> +$(eval $(meson-package))
> --
> 2.47.2
>
>

--0000000000005fe81d06374b8c37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Alex,</div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Mi., 11.=
 Juni 2025 um 13:16=C2=A0Uhr schrieb Alex Benn=C3=A9e &lt;<a href=3D"mailto=
:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt;:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">We build from a recent HEAD to ens=
ure we have the fixes to better<br>
handle the missing KHR_display extension.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br></blockquote><div><br></div><div>I tried to build vkmark against, now w=
ith wayland enabled and I see this:</div><div><br></div><div><br>Program /u=
sr/bin/wayland-scanner found: NO<br><br>../out-weston/build/vkmark-36e7d9b2=
ecf723e876add65534e95f55ec1bc79d/src/meson.build:116:22: ERROR: Program &#3=
9;/usr/bin/wayland-scanner&#39; not found or not executable<br><br>A full l=
og can be found at /srv/storage/hthiery/sources/sa67/out-weston/build/vkmar=
k-36e7d9b2ecf723e876add65534e95f55ec1bc79d/buildroot-build/meson-logs/meson=
-log.txt<br>make[1]: *** [package/<a href=3D"http://pkg-generic.mk:263">pkg=
-generic.mk:263</a>: /srv/storage/hthiery/sources/sa67/out-weston/build/vkm=
ark-36e7d9b2ecf723e876add65534e95f55ec1bc79d/.stamp_configured] Error 1<br>=
make: *** [Makefile:23: _all] Error 2<br></div><div><br></div><div><br></di=
v><div>It looks like here we have something similar like before. It looks u=
nder=C2=A0 &#39;/usr/bin/wayland-scanner&#39; but the prefix is missing.</d=
iv><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
v6<br>
=C2=A0 - add patches from <a href=3D"https://github.com/vkmark/vkmark/pull/=
76" rel=3D"noreferrer" target=3D"_blank">https://github.com/vkmark/vkmark/p=
ull/76</a><br>
=C2=A0 - sort Kconfig symbols<br>
=C2=A0 - update .checkpackageignore<br>
v5<br>
=C2=A0 - move from 2025.1 to HEAD (36e7d9b build: Enable precompiled header=
s)<br>
=C2=A0 - drop old patch (see adf1aa3 for final fix)<br>
v4<br>
=C2=A0 - fix tab vs space damage<br>
=C2=A0 - don&#39;t if BR2_PACKAGE_VKMARK_FLAVOR_ANY<br>
=C2=A0 - make comments properly depend<br>
=C2=A0 - use the new 2025.01 release<br>
=C2=A0 - add sha256sum of COPYING-LGPL2.1<br>
=C2=A0 - alphabetic sort of initial VKMARK_DEPENDENCIES<br>
=C2=A0 - add vulkan error probing patch<br>
v3<br>
=C2=A0 - add xcb-util-wm deps under X11<br>
=C2=A0 - add assimp directly to VKMARK_DEPENDENCIES<br>
=C2=A0 - drop duplicate BR2_INSTALL_LIBSTDCPP<br>
=C2=A0 - drop BR2_TOOLCHAIN_GCC_AT_LEAST_4_9<br>
v2<br>
=C2=A0 - fix whitespace errors in Config.in<br>
=C2=A0 - fix sorting of sources<br>
=C2=A0 - add DEVELOPERS entry<br>
=C2=A0 - rework KConfig based on review<br>
=C2=A0 - drop unused sha256sum<br>
=C2=A0 - explicitly enable/disable the backends<br>
---<br>
=C2=A0.checkpackageignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
3 +<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0...ce-deprecated-get_pkgconfig_variable.patch | 66 ++++++++++++++++++=
+<br>
=C2=A0...02-meson-fix-cross-compilation-50-75.patch | 35 ++++++++++<br>
=C2=A0package/vkmark/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 48 ++++++++++++++<br>
=C2=A0package/vkmark/vkmark.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A0package/vkmark/<a href=3D"http://vkmark.mk" rel=3D"noreferrer" target=
=3D"_blank">vkmark.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 34 ++++++++++<br>
=C2=A08 files changed, 192 insertions(+)<br>
=C2=A0create mode 100644 package/vkmark/0001-meson-replace-deprecated-get_p=
kgconfig_variable.patch<br>
=C2=A0create mode 100644 package/vkmark/0002-meson-fix-cross-compilation-50=
-75.patch<br>
=C2=A0create mode 100644 package/vkmark/Config.in<br>
=C2=A0create mode 100644 package/vkmark/vkmark.hash<br>
=C2=A0create mode 100644 package/vkmark/<a href=3D"http://vkmark.mk" rel=3D=
"noreferrer" target=3D"_blank">vkmark.mk</a><br>
<br>
diff --git a/.checkpackageignore b/.checkpackageignore<br>
index 5cbbbd38ba..2f8f717aec 100644<br>
--- a/.checkpackageignore<br>
+++ b/.checkpackageignore<br>
@@ -1203,6 +1203,8 @@ package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch=
 lib_patch.Upstream<br>
=C2=A0package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-av=
ailab.patch lib_patch.Upstream<br>
=C2=A0package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.pat=
ch lib_patch.Upstream<br>
=C2=A0package/vdr/0001-getloadavg.patch lib_patch.Upstream<br>
+package/vkmark/0001-meson-replace-deprecated-get_pkgconfig_variable.patch =
lib_patch.NumberedSubject lib_patch.Upstream<br>
+package/vkmark/0002-meson-fix-cross-compilation-50-75.patch lib_patch.Numb=
eredSubject lib_patch.Upstream<br>
=C2=A0package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.pat=
ch lib_patch.Upstream<br>
=C2=A0package/vlc/0002-automake-add-subdir-objects-option.patch lib_patch.U=
pstream<br>
=C2=A0package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch lib_pa=
tch.Upstream<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index a7bb3bd834..774381e77c 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -141,6 +141,9 @@ F:=C2=A0 package/liblog4c-localtime/<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Alexandre Belloni &lt;<a href=3D"mailto:alexand=
re.belloni@bootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>=
&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/tz/<br>
<br>
+N:=C2=A0 =C2=A0 =C2=A0Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@l=
inaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0package/vkmark/<br>
+<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Alexandre Esse &lt;<a href=3D"mailto:alexandre.=
esse.dev@gmail.com" target=3D"_blank">alexandre.esse.dev@gmail.com</a>&gt;<=
br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/kvazaar/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/v4l2loopback/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 2db555350d..804c7979b0 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -339,6 +339,7 @@ comment &quot;Graphic applications&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/swaybg/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/tesseract-ocr/Config.in&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/tinifier/Config.in&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/vkmark/Config.in&quot;<br>
<br>
=C2=A0comment &quot;Graphic libraries&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cegui/Config.in&quot;<br>
diff --git a/package/vkmark/0001-meson-replace-deprecated-get_pkgconfig_var=
iable.patch b/package/vkmark/0001-meson-replace-deprecated-get_pkgconfig_va=
riable.patch<br>
new file mode 100644<br>
index 0000000000..1a24a62526<br>
--- /dev/null<br>
+++ b/package/vkmark/0001-meson-replace-deprecated-get_pkgconfig_variable.p=
atch<br>
@@ -0,0 +1,66 @@<br>
+From d14487a31026a25ca0c294989e1db4d5039a6270 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D &lt;<a href=3D"mailto:alex.=
bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
+Date: Fri, 6 Jun 2025 17:40:02 +0100<br>
+Subject: [PATCH 1/2] meson: replace deprecated get_pkgconfig_variable<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+This function will be deprecated on modern mesons. Update the minimum<br>
+version to 0.56 which is enough for most of the current LTS&#39;s and<br>
+replace with calls to get_variable().<br>
+<br>
+Looking at repology this covers:<br>
+<br>
+=C2=A0 Debian Bookworm (soon to be oldstable): 1.0.1-5<br>
+=C2=A0 Ubuntu 22.04: 0.61.2<br>
+=C2=A0 CentOS Stream 8: 0.58.2 (CentOS 8 Power Tools is 0.55.3)<br>
+=C2=A0 openSUSE Leap 15.6: 1.3.1<br>
+=C2=A0 FreeBSD Ports: 1.7.0<br>
+<br>
+Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.o=
rg" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
+---<br>
+ meson.build=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ src/meson.build | 6 +++---<br>
+ 2 files changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index e7bdb18..2d08d53 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -3,7 +3,7 @@ project(<br>
+=C2=A0 =C2=A0 =C2=A0[&#39;cpp&#39;, &#39;c&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0default_options : [&#39;cpp_std=3Dc++17&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0version : &#39;2025.01&#39;,<br>
+-=C2=A0 =C2=A0 meson_version: &#39;&gt;=3D0.45&#39;<br>
++=C2=A0 =C2=A0 meson_version: &#39;&gt;=3D0.58&#39;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+ <br>
+ root_incdir =3D include_directories(&#39;.&#39;)<br>
+diff --git a/src/meson.build b/src/meson.build<br>
+index 5c543d6..a664ddc 100644<br>
+--- a/src/meson.build<br>
++++ b/src/meson.build<br>
+@@ -1,7 +1,7 @@<br>
+ prog_python =3D find_program(&#39;python3&#39;)<br>
+ <br>
+ vk_xml =3D join_paths([<br>
+-=C2=A0 =C2=A0 vulkan_dep.get_pkgconfig_variable(&#39;prefix&#39;),<br>
++=C2=A0 =C2=A0 vulkan_dep.get_variable(&#39;prefix&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0&#39;share&#39;, &#39;vulkan&#39;, &#39;registry&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0&#39;vk.xml&#39;<br>
+=C2=A0 =C2=A0 =C2=A0])<br>
+@@ -111,8 +111,8 @@ if build_xcb_ws<br>
+ endif<br>
+ <br>
+ if build_wayland_ws<br>
+-=C2=A0 =C2=A0 wayland_scanner =3D find_program(wayland_scanner_dep.get_pk=
gconfig_variable(&#39;wayland_scanner&#39;))<br>
+-=C2=A0 =C2=A0 wayland_protocols_dir =3D wayland_protocols_dep.get_pkgconf=
ig_variable(&#39;pkgdatadir&#39;)<br>
++=C2=A0 =C2=A0 wayland_scanner =3D find_program(wayland_scanner_dep.get_va=
riable(&#39;wayland_scanner&#39;))<br>
++=C2=A0 =C2=A0 wayland_protocols_dir =3D wayland_protocols_dep.get_variabl=
e(&#39;pkgdatadir&#39;)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0xdg_shell_xml_path =3D wayland_protocols_dir + &#39;/s=
table/xdg-shell/xdg-shell.xml&#39;<br>
+=C2=A0 =C2=A0 =C2=A0xdg_shell_client_header =3D custom_target(<br>
+-- <br>
+2.47.2<br>
+<br>
diff --git a/package/vkmark/0002-meson-fix-cross-compilation-50-75.patch b/=
package/vkmark/0002-meson-fix-cross-compilation-50-75.patch<br>
new file mode 100644<br>
index 0000000000..92b8cbc1b9<br>
--- /dev/null<br>
+++ b/package/vkmark/0002-meson-fix-cross-compilation-50-75.patch<br>
@@ -0,0 +1,35 @@<br>
+From dc9a0c2d8687501ddf97c97599fa7a69d07d3d3d Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D &lt;<a href=3D"mailto:alex.=
bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
+Date: Fri, 6 Jun 2025 17:48:40 +0100<br>
+Subject: [PATCH 2/2] meson: fix cross-compilation (#50, #75)<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Now we have updated the minimum meson version we can apply sys_root to<br>
+the prefix variable to ensure we can find the right vk.xml when<br>
+cross-compiling.<br>
+<br>
+Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.o=
rg" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
+---<br>
+ src/meson.build | 4 +++-<br>
+ 1 file changed, 3 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/meson.build b/src/meson.build<br>
+index a664ddc..b0e8c4a 100644<br>
+--- a/src/meson.build<br>
++++ b/src/meson.build<br>
+@@ -1,7 +1,9 @@<br>
+ prog_python =3D find_program(&#39;python3&#39;)<br>
+ <br>
++vulkan_prefix =3D meson.get_external_property(&#39;sys_root&#39;, &#39;&#=
39;) + vulkan_dep.get_variable(&#39;prefix&#39;)<br>
++<br>
+ vk_xml =3D join_paths([<br>
+-=C2=A0 =C2=A0 vulkan_dep.get_variable(&#39;prefix&#39;),<br>
++=C2=A0 =C2=A0 vulkan_prefix,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;share&#39;, &#39;vulkan&#39;, &#39;registry&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0&#39;vk.xml&#39;<br>
+=C2=A0 =C2=A0 =C2=A0])<br>
+-- <br>
+2.47.2<br>
+<br>
diff --git a/package/vkmark/Config.in b/package/vkmark/Config.in<br>
new file mode 100644<br>
index 0000000000..b0e85c9c55<br>
--- /dev/null<br>
+++ b/package/vkmark/Config.in<br>
@@ -0,0 +1,48 @@<br>
+config BR2_PACKAGE_VKMARK_FLAVOR_ANY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
+<br>
+config BR2_PACKAGE_VKMARK_FLAVOR_KMS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_PACKAGE_HAS_LIBGBM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VKMARK_FLAVOR_ANY<br>
+<br>
+config BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_PACKAGE_WAYLAND<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VKMARK_FLAVOR_ANY<br>
+<br>
+config BR2_PACKAGE_VKMARK_FLAVOR_X11<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_PACKAGE_XORG7<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VKMARK_FLAVOR_ANY<br>
+<br>
+config BR2_PACKAGE_VKMARK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;vkmark&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_VKMARK_FLAVOR_ANY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # vulkan-loader<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-l=
oader<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # assimp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # assim=
p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP # vulkan-loade=
r, glm, assimp, vkmark<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VULKAN_HEADERS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VULKAN_LOADER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GLM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ASSIMP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PAC=
KAGE_VKMARK_FLAVOR_WAYLAND<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_VKMARK=
_FLAVOR_X11<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XCB_UTIL_WM if BR2_PACKAGE_V=
KMARK_FLAVOR_X11<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_VKMARK=
_FLAVOR_KMS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmmark is an Vulkan GPU benchmark.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/vkmark/vkm=
ark" rel=3D"noreferrer" target=3D"_blank">https://github.com/vkmark/vkmark<=
/a><br>
+<br>
+comment &quot;vkmark needs a toolchain w/ dynamic library, threads, wchar,=
 gcc &gt;=3D 7, C++&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_STATIC_LIBS || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_HAS_THREADS || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_USE_WCHAR || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_INSTALL_LIBSTDCPP<br>
+<br>
+comment &quot;vkmark needs a backend: gbm, wayland or xcb&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_VKMARK_FLAVOR_ANY<br>
diff --git a/package/vkmark/vkmark.hash b/package/vkmark/vkmark.hash<br>
new file mode 100644<br>
index 0000000000..34c3121939<br>
--- /dev/null<br>
+++ b/package/vkmark/vkmark.hash<br>
@@ -0,0 +1,3 @@<br>
+# Locally computed<br>
+sha256=C2=A0 2225ef4e3ba785abcc249664644908b909517cae6c04bf37e9f3d0cf206ef=
e83=C2=A0 vkmark-36e7d9b2ecf723e876add65534e95f55ec1bc79d.tar.gz<br>
+sha256=C2=A0 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe=
551=C2=A0 COPYING-LGPL2.1<br>
diff --git a/package/vkmark/<a href=3D"http://vkmark.mk" rel=3D"noreferrer"=
 target=3D"_blank">vkmark.mk</a> b/package/vkmark/<a href=3D"http://vkmark.=
mk" rel=3D"noreferrer" target=3D"_blank">vkmark.mk</a><br>
new file mode 100644<br>
index 0000000000..d7e8ea2e6d<br>
--- /dev/null<br>
+++ b/package/vkmark/<a href=3D"http://vkmark.mk" rel=3D"noreferrer" target=
=3D"_blank">vkmark.mk</a><br>
@@ -0,0 +1,34 @@<br>
+##########################################################################=
######<br>
+#<br>
+# vkmark<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+VKMARK_VERSION =3D 36e7d9b2ecf723e876add65534e95f55ec1bc79d<br>
+VKMARK_SITE =3D $(call github,vkmark,vkmark,$(VKMARK_VERSION))<br>
+VKMARK_LICENSE =3D LGPL-2.1<br>
+VKMARK_LICENSE_FILES =3D COPYING-LGPL2.1<br>
+VKMARK_DEPENDENCIES =3D assimp glm host-pkgconf vulkan-headers vulkan-load=
er<br>
+<br>
+ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_KMS),y)<br>
+VKMARK_DEPENDENCIES +=3D libdrm libgbm<br>
+VKMARK_CONF_OPTS +=3D -Dkms=3Dtrue<br>
+else<br>
+VKMARK_CONF_OPTS +=3D -Dkms=3Dfalse<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND),y)<br>
+VKMARK_DEPENDENCIES +=3D wayland wayland-protocols<br>
+VKMARK_CONF_OPTS +=3D -Dwayland=3Dtrue<br>
+else<br>
+VKMARK_CONF_OPTS +=3D -Dwayland=3Dfalse<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_X11),y)<br>
+VKMARK_DEPENDENCIES +=3D libxcb xcb-util-wm<br>
+VKMARK_CONF_OPTS +=3D -Dxcb=3Dtrue<br>
+else<br>
+VKMARK_CONF_OPTS +=3D -Dxcb=3Dfalse<br>
+endif<br>
+<br>
+$(eval $(meson-package))<br>
-- <br>
2.47.2<br>
<br>
</blockquote></div></div>

--0000000000005fe81d06374b8c37--

--===============3087633954881977088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3087633954881977088==--
