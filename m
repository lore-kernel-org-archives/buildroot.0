Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2F2C5B549
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 08:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA76240BB6;
	Mon,  2 Jun 2025 08:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKiw72XLk18W; Mon,  2 Jun 2025 08:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C97DE40AF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C97DE40AF5;
	Mon,  2 Jun 2025 08:20:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3830F127
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E471811F0
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHNpaDVaxrBF for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 08:20:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E38C811E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E38C811E3
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E38C811E3
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:20:10 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-32a9e5b625eso16542021fa.2
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 01:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748852408; x=1749457208;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GZ6hjrpl6xn7BT1ByZaBeQYx1KbILTPneiHjh9dCY+Y=;
 b=OVWhm/DapGGoNyhrbrdBpVOZoSjtMpbXfHZSZLXZb3QH5R7PfSSFx4ERQvW843gSRN
 QmjO+eFrggTdbYVzENA36sMemJ5XXKayHLnU+aqsrSWqz4HG+cj9Oj4Wq3LxEtmwiR0g
 cSSLo76PgQ2QOHnufHDzX/12nn+v0oIRLel0T9/+OPNrYGg1WZyaYjwHK6xtKkEW86KU
 q9F6qEV2cEYCTqd9FsLNZqoGeWCstL2vlCjROzhn6RW6/NFSrp/cCkHeN/aAAEZZxple
 EF8A33PYCRIla26/bL5Haf97hyi1siNmwj4TZF5XmvwN9PPgsavf6qdR9BLiu6XcTGSa
 cR+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSIDw3oQAO0JNaYNDHD54fYaAZ+zRGLAD2coMWZ3FHM6YGNPAQVGtCn0k8GTcP19X6ZWnH6eyOrog=@buildroot.org
X-Gm-Message-State: AOJu0Yy7SzFheuBtUi31kIB/kF+YkGcJI4m0/YUx9StexeUq7kVE4Ibd
 Pz97iKWiYyzq4WXcIyECkNkTqxDyyr4WFjZvM0z7/B+BbSHRQ0aVYyfOK2fN+u2AbdZsehroEUk
 xaHBML93uqahoGxF/ke0m/+aoyuGp5szKUTroO60=
X-Gm-Gg: ASbGncvvYX2bS2DQEtyZDok9OnVf1AnXh37wRuKqeTh/ToFpIrbeybdqqSfQ4Sew5G5
 kQ052/bJ/Iiz+FFladPFoX296dpI8eRiapXGNPubjKpt53Z4+zDTIa75HfSz2wjiFzo+ya0L6Sa
 KaIwod4bTtR0Nt82jF2FTGuqdsMisBwayQ4Q==
X-Google-Smtp-Source: AGHT+IEZPzVhaFjKR/QiOSgFG9Pai7Hwb/71EsqxYMBQdqiPLUijU1gKhYUxcZdnGZXYYQEIoF+0r0WsrPy0FZKcvgk=
X-Received: by 2002:a05:651c:2109:b0:32a:8b58:c064 with SMTP id
 38308e7fff4ca-32a9080c285mr32353271fa.35.1748852407711; Mon, 02 Jun 2025
 01:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250303161557.571619-1-alex.bennee@linaro.org>
 <20250303161557.571619-6-alex.bennee@linaro.org>
 <CAEyMn7b+fVD=kWqSjGhd=NuJ2iK==iBy0sjd09Ewu8rZM-Gm5g@mail.gmail.com>
 <e11293aa1697c12bc0d3a4196c0e4beb@free.fr>
In-Reply-To: <e11293aa1697c12bc0d3a4196c0e4beb@free.fr>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 2 Jun 2025 10:19:53 +0200
X-Gm-Features: AX0GCFsNu9qm3UfepIiphAF-nvEbzFFbkq8Ig7mHaGWxuvGYOIDwLXhW_L_30HE
Message-ID: <CAEyMn7bL2roKDHnMrK2S7G1x3qJj9MJ7+r_4LOktsZzFiVARvw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748852408; x=1749457208; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GZ6hjrpl6xn7BT1ByZaBeQYx1KbILTPneiHjh9dCY+Y=;
 b=J8dme49/XSbYKIx125Ql5d2id7d64lbpvwx2cNEBRow46gRMmCz39BWD6xKbJs6ZfR
 FHYNnRYnJGqlymhPueZEWfVr6ttD06sRbv1bg6bRja+aJL9h0xI1HfvwOqCd20Z1kTvO
 PHJDFhllL4LZumyJ0vhwoEEkz4gxXWBrANpBmEbDA2uxioYjEQtvrAPDzrsRNsi61fC0
 zxmJF8UTWe6ywioFbHmOC3cyVCAyhl2bPEALNk5rYgM3owPeUjNTBm5lZYSLLau1dK6C
 viKJzsGkMVSx7+vhHHa6o4saVicTSOKozyUjBf3w+Xp0Jg37OQUNIsHGJMwwm7gBaxaT
 Bd2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J8dme49/
Subject: Re: [Buildroot] [PATCH v4 5/6] package/vkmark: add vkmark
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6269793726708835991=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6269793726708835991==
Content-Type: multipart/alternative; boundary="00000000000086bc2d0636926eb5"

--00000000000086bc2d0636926eb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Am Sa., 31. Mai 2025 um 23:14 Uhr schrieb Julien Olivain <ju.o@free.fr>:

> Hi Heiko, Alex,
>
> On 28/05/2025 16:00, Heiko Thiery wrote:
> > Hi Alex,
> >
> > thank you for these series.
> >
> > Am Mo., 3. M=C3=A4rz 2025 um 17:16 Uhr schrieb Alex Benn=C3=A9e
> > <alex.bennee@linaro.org>:
> >
> >> We build from the recent 2025.1 release although we need one commit
> >> from master to better handle the missing KHR_display extension.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>
> >> ---
> >> v4
> >> - fix tab vs space damage
> >> - don't if BR2_PACKAGE_VKMARK_FLAVOR_ANY
> >> - make comments properly depend
> >> - use the new 2025.01 release
> >> - add sha256sum of COPYING-LGPL2.1
> >> - alphabetic sort of initial VKMARK_DEPENDENCIES
> >> - add vulkan error probing patch
> >> v3
> >> - add xcb-util-wm deps under X11
> >> - add assimp directly to VKMARK_DEPENDENCIES
> >> - drop duplicate BR2_INSTALL_LIBSTDCPP
> >> - drop BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> >> v2
> >> - fix whitespace errors in Config.in
> >> - fix sorting of sources
> >> - add DEVELOPERS entry
> >> - rework KConfig based on review
> >> - drop unused sha256sum
> >> - explicitly enable/disable the backends
> >> ---
> >> DEVELOPERS                                    |  3 +
> >> package/Config.in                             |  1 +
> >> ...-handle-Vulkan-errors-during-probing.patch | 77
> >> +++++++++++++++++++
> >> package/vkmark/Config.in                      | 48 ++++++++++++
> >> package/vkmark/vkmark.hash                    |  3 +
> >> package/vkmark/vkmark.mk [1]                      | 34 ++++++++
> >> 6 files changed, 166 insertions(+)
> >> create mode 100644
> >>
> >
> package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-probing.=
patch
> >> create mode 100644 package/vkmark/Config.in
> >> create mode 100644 package/vkmark/vkmark.hash
> >> create mode 100644 package/vkmark/vkmark.mk [1]
> >>
> >> diff --git a/DEVELOPERS b/DEVELOPERS
> >> index 1f04dd2a1e..03af6cb426 100644
> >> --- a/DEVELOPERS
> >> +++ b/DEVELOPERS
> >> @@ -144,6 +144,9 @@ F:  package/liblog4c-localtime/
> >> N:     Alexandre Belloni <alexandre.belloni@bootlin.com>
> >> F:     package/tz/
> >>
> >> +N:     Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> +F:     package/vkmark/
> >> +
> >> N:     Alexandre Esse <alexandre.esse.dev@gmail.com>
> >> F:     package/kvazaar/
> >> F:     package/v4l2loopback/
> >> diff --git a/package/Config.in b/package/Config.in
> >> index 30ba7c206a..7b9615efe6 100644
> >> --- a/package/Config.in
> >> +++ b/package/Config.in
> >> @@ -338,6 +338,7 @@ comment "Graphic applications"
> >> source "package/swaybg/Config.in"
> >> source "package/tesseract-ocr/Config.in"
> >> source "package/tinifier/Config.in"
> >> +       source "package/vkmark/Config.in"
> >>
> >> comment "Graphic libraries"
> >> source "package/cegui/Config.in"
> >> diff --git
> >>
> >
> a/package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-probin=
g.patch
> >>
> >
> b/package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-probin=
g.patch
> >> new file mode 100644
> >> index 0000000000..7e2e43a946
> >> --- /dev/null
> >> +++
> >>
> >
> b/package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-probin=
g.patch
> >> @@ -0,0 +1,77 @@
> >> +From adf1aa346d99d29ad2c5c945c3e4de5e0e3e12cb Mon Sep 17 00:00:00
> >> 2001
> >> +From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
> >> +Date: Thu, 27 Feb 2025 14:33:49 +0200
> >> +Subject: [PATCH] display: Properly handle Vulkan errors during
> >> probing
> >> +
> >> +The vk::createInstance() function throws an exception on error,
> >> +so handle it instead of checking for a null return value.
> >> +
> >> +Signed-of-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> +Upstream:
> >>
> >
> https://github.com/vkmark/vkmark/commit/37d0a0d7fa6dcde6f62718d2115e8b766=
46bff23
> >> +
> >> +---
> >> + src/ws/display_window_system_plugin.cpp | 39
> >> ++++++++++++-------------
> >> + 1 file changed, 19 insertions(+), 20 deletions(-)
> >> +
> >> +diff --git a/src/ws/display_window_system_plugin.cpp
> >> b/src/ws/display_window_system_plugin.cpp
> >> +index 523092b..fcbd949 100644
> >> +--- a/src/ws/display_window_system_plugin.cpp
> >> ++++ b/src/ws/display_window_system_plugin.cpp
> >> +@@ -72,24 +72,22 @@ int vkmark_window_system_probe(Options const&
> >> options)
> >> +         .setPApplicationInfo(&app_info)
> >> +         .setEnabledExtensionCount(exts.size())
> >> +         .setPpEnabledExtensionNames(exts.data());
> >> +-    auto vk_instance =3D ManagedResource<vk::Instance>{
> >> +-        vk::createInstance(create_info),
> >> +-        [] (auto& i) { i.destroy(); }};
> >> +-    if (!vk_instance.raw)
> >> +-        return VKMARK_WINDOW_SYSTEM_PROBE_BAD;
> >> +-
> >> +-    auto physical_devices =3D
> >> vk_instance.raw.enumeratePhysicalDevices();
> >> +-    auto physical_device =3D options.use_device_with_uuid ?
> >> +-        std::find_if(
> >> +-            physical_devices.begin(), physical_devices.end(),
> >> +-            [&options] (auto pd) {
> >> +-                return
> >> static_cast<DeviceUUID>(pd.getProperties().pipelineCacheUUID) =3D=3D
> >> +-                    options.use_device_with_uuid; }) :
> >> +-        physical_devices.begin();
> >> +-
> >> +-    if (physical_device !=3D physical_devices.end())
> >> ++
> >> ++    try
> >> +     {
> >> +-        try
> >> ++        auto vk_instance =3D ManagedResource<vk::Instance>{
> >> ++            vk::createInstance(create_info),
> >> ++            [] (auto& i) { i.destroy(); }};
> >> ++        auto physical_devices =3D
> >> vk_instance.raw.enumeratePhysicalDevices();
> >> ++        auto physical_device =3D options.use_device_with_uuid ?
> >> ++            std::find_if(
> >> ++                physical_devices.begin(), physical_devices.end(),
> >> ++                [&options] (auto pd) {
> >> ++                    return
> >> static_cast<DeviceUUID>(pd.getProperties().pipelineCacheUUID) =3D=3D
> >> ++                        options.use_device_with_uuid; }) :
> >> ++            physical_devices.begin();
> >> ++
> >> ++        if (physical_device !=3D physical_devices.end())
> >> +         {
> >> +             auto display_index =3D
> >> std::stoi(get_display_index_option(options));
> >> +             if (display_index < 0)
> >> +@@ -97,10 +95,11 @@ int vkmark_window_system_probe(Options const&
> >> options)
> >> +
> >>
> > DisplayNativeSystem::get_display_surface_create_info(*physical_device,
> >> display_index);
> >> +             return VKMARK_WINDOW_SYSTEM_PROBE_OK +
> >> VKMARK_DISPLAY_WINDOW_SYSTEM_PRIORITY;
> >> +         }
> >> +-        catch (...)
> >> +-        {
> >> +-        }
> >> +     }
> >> ++    catch (...)
> >> ++    {
> >> ++    }
> >> ++
> >> +
> >> +     return VKMARK_WINDOW_SYSTEM_PROBE_BAD;
> >> + }
> >> +--
> >> +2.39.5
> >> +
> >> diff --git a/package/vkmark/Config.in b/package/vkmark/Config.in
> >> new file mode 100644
> >> index 0000000000..032eb47dc9
> >> --- /dev/null
> >> +++ b/package/vkmark/Config.in
> >> @@ -0,0 +1,48 @@
> >> +config BR2_PACKAGE_VKMARK_FLAVOR_ANY
> >> +       bool
> >> +
> >> +config BR2_PACKAGE_VKMARK_FLAVOR_KMS
> >> +       bool
> >> +       default y if BR2_PACKAGE_HAS_LIBGBM
> >> +       select BR2_PACKAGE_VKMARK_FLAVOR_ANY
> >> +
> >> +config BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND
> >> +       bool
> >> +       default y if BR2_PACKAGE_WAYLAND
> >> +       select BR2_PACKAGE_VKMARK_FLAVOR_ANY
> >> +
> >> +config BR2_PACKAGE_VKMARK_FLAVOR_X11
> >> +       bool
> >> +       default y if BR2_PACKAGE_XORG7
> >> +       select BR2_PACKAGE_VKMARK_FLAVOR_ANY
> >> +
> >> +config BR2_PACKAGE_VKMARK
> >> +       bool "vkmark"
> >> +       depends on BR2_PACKAGE_VKMARK_FLAVOR_ANY
> >> +       select BR2_PACKAGE_VULKAN_HEADERS
> >> +       select BR2_PACKAGE_VULKAN_LOADER
> >> +       depends on !BR2_STATIC_LIBS # vulkan-loader
> >> +       depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
> >> +       select BR2_PACKAGE_GLM
> >> +       depends on BR2_USE_WCHAR # assimp
> >> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # assimp
> >> +       depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader, glm,
> >> assimp, vkmark
> >> +       select BR2_PACKAGE_ASSIMP
> >> +       select BR2_PACKAGE_WAYLAND_PROTOCOLS if
> >> BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND
> >> +       select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_VKMARK_FLAVOR_X11
> >> +       select BR2_PACKAGE_XCB_UTIL_WM if
> >> BR2_PACKAGE_VKMARK_FLAVOR_X11
> >> +       select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_VKMARK_FLAVOR_KMS
> >> +       help
> >> +         vmmark is an Vulkan GPU benchmark.
> >> +
> >> +         https://github.com/vkmark/vkmark
> >> +
> >> +comment "vkmark needs a toolchain w/ dynamic library, threads,
> >> wchar, gcc >=3D 7, C++"
> >> +       depends on BR2_STATIC_LIBS || \
> >> +       !BR2_TOOLCHAIN_HAS_THREADS || \
> >> +       !BR2_USE_WCHAR || \
> >> +       !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> >> +       !BR2_INSTALL_LIBSTDCPP
> >> +
> >> +comment "vkmark needs a backend: gbm, wayland or xcb"
> >> +       depends on !BR2_PACKAGE_VKMARK_FLAVOR_ANY
> >> diff --git a/package/vkmark/vkmark.hash b/package/vkmark/vkmark.hash
> >> new file mode 100644
> >> index 0000000000..2650f4ccd4
> >> --- /dev/null
> >> +++ b/package/vkmark/vkmark.hash
> >> @@ -0,0 +1,3 @@
> >> +# Locally computed
> >> +sha256
> >> 1ae362844344d0f9878b7a3f13005f77eae705108892a4e8abf237d452d37edc
> >> vkmark-2025.01.tar.gz
> >> +sha256
> >> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551
> >> COPYING-LGPL2.1
> >> diff --git a/package/vkmark/vkmark.mk [1] b/package/vkmark/vkmark.mk
> >> [1]
> >> new file mode 100644
> >> index 0000000000..7b721c6c99
> >> --- /dev/null
> >> +++ b/package/vkmark/vkmark.mk [1]
> >> @@ -0,0 +1,34 @@
> >>
> >
> +########################################################################=
########
> >> +#
> >> +# vkmark
> >> +#
> >>
> >
> +########################################################################=
########
> >> +
> >> +VKMARK_VERSION =3D 2025.01
> >> +VKMARK_SITE =3D $(call github,vkmark,vkmark,$(VKMARK_VERSION))
> >> +VKMARK_LICENSE =3D LGPL-2.1
> >> +VKMARK_LICENSE_FILES =3D COPYING-LGPL2.1
> >> +VKMARK_DEPENDENCIES =3D assimp glm host-pkgconf vulkan-headers
> >> vulkan-loader
> >> +
> >> +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_KMS),y)
> >> +VKMARK_DEPENDENCIES +=3D libdrm libgbm
> >> +VKMARK_CONF_OPTS +=3D -Dkms=3Dtrue
> >> +else
> >> +VKMARK_CONF_OPTS +=3D -Dkms=3Dfalse
> >> +endif
> >> +
> >> +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND),y)
> >> +VKMARK_DEPENDENCIES +=3D wayland wayland-protocols
> >> +VKMARK_CONF_OPTS +=3D -Dwayland=3Dtrue
> >> +else
> >> +VKMARK_CONF_OPTS +=3D -Dwayland=3Dfalse
> >> +endif
> >> +
> >> +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_X11),y)
> >> +VKMARK_DEPENDENCIES +=3D libxcb xcb-util-wm
> >> +VKMARK_CONF_OPTS +=3D -Dxcb=3Dtrue
> >> +else
> >> +VKMARK_CONF_OPTS +=3D -Dxcb=3Dfalse
> >> +endif
> >> +
> >> +$(eval $(meson-package))
> >> --
> >> 2.39.5
> >
> >  I tried to build vkmark but get this error:
> >
> >>>> vkmark custom Configuring
> > rm -rf
> >
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//buildr=
oot-build
> > mkdir -p
> >
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//buildr=
oot-build
> > sed -e "/^\[binaries\]$/s:$::" -e "/^\[properties\]$/s:$::"         -e
> > "s%@TARGET_CC
> @%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-gc=
c%g"
> > -e
> > "s%@TARGET_CXX
> @%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-g+=
+%g"
> > -e
> > "s%@TARGET_AR
> @%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-gc=
c-ar%g"
> > -e
> > "s%@TARGET_FC
> @%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-gf=
ortran%g"
> > -e
> > "s%@TARGET_STRIP
> @%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-st=
rip%g"
> > -e "s%@TARGET_ARCH@%aarch64%g" -e "s%@TARGET_CPU@%cortex-a53%g" -e
> > "s%@TARGET_ENDIAN@%little%g" -e "s%@TARGET_FCFLAGS@%%g" -e
> > "s%@TARGET_CFLAGS@%'-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE',
> > '-D_FILE_OFFSET_BITS=3D64', '-O2', '-g0', '-D_FORTIFY_SOURCE=3D1'%g" -e
> > "s%@TARGET_LDFLAGS@%%g" -e "s%@TARGET_CXXFLAGS@%'-D_LARGEFILE_SOURCE',
> > '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=3D64', '-O2', '-g0',
> > '-D_FORTIFY_SOURCE=3D1'%g" -e
> > "s%@BR2_CMAKE
> @%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/cmake%g"
> > -e
> > "s%@PKGCONF_HOST_BINARY
> @%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/pkgconf%g"
> > -e "s%@HOST_DIR@%/srv/storage/hthiery/sources/sa67/out-graphic/host%g"
> > -e
> > "s%@STAGING_DIR
> @%/srv/storage/hthiery/sources/sa67/out-graphic/host/aarch64-buildroot-li=
nux-gnu/sysroot%g"
> > -e "s%@STATIC@%false%g"
> > /srv/storage/hthiery/sources/sa67/buildroot/support/misc/
> cross-compilation.conf.in
> > [2] >
> >
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//buildr=
oot-build/cross-compilation.conf
> >
> PATH=3D"/srv/storage/hthiery/sources/sa67/out-graphic/host/bin:/srv/stora=
ge/hthiery/sources/sa67/out-graphic/host/sbin:/home/hthiery/.local/bin:/hom=
e/hthiery/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
> > CC_FOR_BUILD=3D"/usr/bin/gcc" CXX_FOR_BUILD=3D"/usr/bin/g++"
> > PYTHONNOUSERSITE=3Dy
> > /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/meson setup
> > --prefix=3D/usr --libdir=3Dlib --default-library=3Dshared
> > --buildtype=3Drelease
> >
> --cross-file=3D/srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark=
-custom//buildroot-build/cross-compilation.conf
> > -Db_pie=3Dfalse -Db_staticpic=3Dtrue -Dstrip=3Dfalse
> >
> -Dbuild.pkg_config_path=3D/srv/storage/hthiery/sources/sa67/out-graphic/h=
ost/lib/pkgconfig
> >
> -Dbuild.cmake_prefix_path=3D/srv/storage/hthiery/sources/sa67/out-graphic=
/host/lib/cmake
> > -Dkms=3Dtrue -Dwayland=3Dfalse -Dxcb=3Dfalse
> > /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom/
> >
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//buildr=
oot-build
> > The Meson build system
> > Version: 1.7.0
> > Source dir:
> > /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom
> > Build dir:
> >
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom/buildro=
ot-build
> > Build type: cross build
> > Project name: vkmark
> > Project version: 2025.01
> > C compiler for the host machine:
> > /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-gc=
c
> > (gcc 14.2.0 "aarch64-linux-gcc.br_real (Buildroot
> > 2021.11-12449-g1bef613319) 14.2.0")
> > C linker for the host machine:
> > /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-gc=
c
> > ld.bfd 2.42
> > C++ compiler for the host machine:
> > /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-g+=
+
> > (gcc 14.2.0 "aarch64-linux-g++.br_real (Buildroot
> > 2021.11-12449-g1bef613319) 14.2.0")
> > C++ linker for the host machine:
> > /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-g+=
+
> > ld.bfd 2.42
> > C compiler for the build machine: /usr/bin/gcc (gcc 8.3.0 "gcc (Debian
> > 8.3.0-6) 8.3.0")
> > C linker for the build machine: /usr/bin/gcc ld.bfd 2.31.1
> > C++ compiler for the build machine: /usr/bin/g++ (gcc 8.3.0 "g++
> > (Debian 8.3.0-6) 8.3.0")
> > C++ linker for the build machine: /usr/bin/g++ ld.bfd 2.31.1
> > Build machine cpu family: x86_64
> > Build machine cpu: x86_64
> > Host machine cpu family: aarch64
> > Host machine cpu: cortex-a53
> > Target machine cpu family: aarch64
> > Target machine cpu: cortex-a53
> > Found pkg-config: YES
> > (/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/pkg-config)
> > 2.3.0
> > Build-time dependency vulkan found: YES 1.4.307
> > Library dl found: YES
> > Found pkg-config: YES
> > (/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/pkgconf) 2.3.0
> > Found CMake:
> > /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/cmake (3.31.5)
> > Run-time dependency glm found: YES 1.0.0
> > Run-time dependency assimp found: YES 5.4.3
> > Run-time dependency xcb found: NO (tried pkgconfig and cmake)
> > Run-time dependency xcb-icccm found: NO (tried pkgconfig and cmake)
> > Run-time dependency wayland-client found: NO (tried pkgconfig and
> > cmake)
> > Run-time dependency wayland-protocols found: NO (tried pkgconfig and
> > cmake)
> > Run-time dependency wayland-scanner found: NO (tried pkgconfig and
> > cmake)
> > Run-time dependency libdrm found: YES 2.4.124
> > Run-time dependency gbm found: YES 25.0.6
> > Program python3 found: YES
> > (/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/python3)
> >
> > ../out-graphic/build/vkmark-custom/src/meson.build:9:19: ERROR: File
> > /usr/share/vulkan/registry/vk.xml does not exist
> >
> > Is the vk.xml file installed on your system in
> > /usr/share/vulkan/registry/vk.xml? I think the problem is related to
> > the vulkan.pc file that has a wrong prefix value set.
> >
> > Can you confirm that?
>
> I can reproduce the issue. When using the Buildroot docker
> reference image, with the commands:
>
>      utils/docker-run
>      cat >.config <<EOF
>      BR2_aarch64=3Dy
>      BR2_TOOLCHAIN_EXTERNAL=3Dy
>      BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy
>      BR2_TARGET_GENERIC_GETTY_PORT=3D"ttyAMA0"
>      BR2_SYSTEM_DHCP=3D"eth0"
>      BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
>      BR2_ROOTFS_POST_SCRIPT_ARGS=3D"qemu_aarch64_virt_defconfig"
>      BR2_LINUX_KERNEL=3Dy
>      BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
>
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/aarch64-virt/linux.conf=
ig"
>      BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
>      BR2_PACKAGE_VKMARK=3Dy
>      BR2_PACKAGE_MESA3D=3Dy
>      BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=3Dy
>      BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO=3Dy
>      BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy
>      BR2_TARGET_ROOTFS_EXT2=3Dy
>      BR2_TARGET_ROOTFS_EXT2_4=3Dy
>      BR2_TARGET_ROOTFS_EXT2_SIZE=3D"600M"
>      # BR2_TARGET_ROOTFS_TAR is not set
>      EOF
>      make olddefconfig
>      make
>
> It fails with:
>
>      output/build/vkmark-2025.01/src/meson.build:9:19: ERROR: File
> /usr/share/vulkan/registry/vk.xml does not exist.
>
> If I build directly on my host system, which has the vulkan headers
> available at /usr/share/vulkan/registry/vk.xml, it works.
>
> vkmark meson should take the file from:
> $(STAGING_DIR)/usr/share/vulkan/registry/vk.xml
>

You are right. It is related to the location of the vk.xml file. I opened
an issue on the vkmark github page:
https://github.com/vkmark/vkmark/issues/75.

I have a workaround for that but it does not seem like a valid final
solution. See my comment in the github issue.


>
> > ---
> > Heiko
> >
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@buildroot.org
> >> https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> >
> > Links:
> > ------
> > [1] http://vkmark.mk
> > [2] http://cross-compilation.conf.in
>
> Best regards,
>
> Julien.
>

BR
--
Heiko

--00000000000086bc2d0636926eb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Sa., 31. Mai =
2025 um 23:14=C2=A0Uhr schrieb Julien Olivain &lt;<a href=3D"mailto:ju.o@fr=
ee.fr">ju.o@free.fr</a>&gt;:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Heiko, Alex,<br>
<br>
On 28/05/2025 16:00, Heiko Thiery wrote:<br>
&gt; Hi Alex,<br>
&gt; <br>
&gt; thank you for these series.<br>
&gt; <br>
&gt; Am Mo., 3. M=C3=A4rz 2025 um 17:16 Uhr schrieb Alex Benn=C3=A9e<br>
&gt; &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">alex.b=
ennee@linaro.org</a>&gt;:<br>
&gt; <br>
&gt;&gt; We build from the recent 2025.1 release although we need one commi=
t<br>
&gt;&gt; from master to better handle the missing KHR_display extension.<br=
>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@=
linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt; <br>
&gt;&gt; ---<br>
&gt;&gt; v4<br>
&gt;&gt; - fix tab vs space damage<br>
&gt;&gt; - don&#39;t if BR2_PACKAGE_VKMARK_FLAVOR_ANY<br>
&gt;&gt; - make comments properly depend<br>
&gt;&gt; - use the new 2025.01 release<br>
&gt;&gt; - add sha256sum of COPYING-LGPL2.1<br>
&gt;&gt; - alphabetic sort of initial VKMARK_DEPENDENCIES<br>
&gt;&gt; - add vulkan error probing patch<br>
&gt;&gt; v3<br>
&gt;&gt; - add xcb-util-wm deps under X11<br>
&gt;&gt; - add assimp directly to VKMARK_DEPENDENCIES<br>
&gt;&gt; - drop duplicate BR2_INSTALL_LIBSTDCPP<br>
&gt;&gt; - drop BR2_TOOLCHAIN_GCC_AT_LEAST_4_9<br>
&gt;&gt; v2<br>
&gt;&gt; - fix whitespace errors in Config.in<br>
&gt;&gt; - fix sorting of sources<br>
&gt;&gt; - add DEVELOPERS entry<br>
&gt;&gt; - rework KConfig based on review<br>
&gt;&gt; - drop unused sha256sum<br>
&gt;&gt; - explicitly enable/disable the backends<br>
&gt;&gt; ---<br>
&gt;&gt; DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 +<br>
&gt;&gt; package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;&gt; ...-handle-Vulkan-errors-during-probing.patch | 77<br>
&gt;&gt; +++++++++++++++++++<br>
&gt;&gt; package/vkmark/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 48 ++++++++++++<br>
&gt;&gt; package/vkmark/vkmark.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt;&gt; package/vkmark/<a href=3D"http://vkmark.mk" rel=3D"noreferrer" tar=
get=3D"_blank">vkmark.mk</a> [1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 34 ++++++++<br>
&gt;&gt; 6 files changed, 166 insertions(+)<br>
&gt;&gt; create mode 100644<br>
&gt;&gt; <br>
&gt; package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-probi=
ng.patch<br>
&gt;&gt; create mode 100644 package/vkmark/Config.in<br>
&gt;&gt; create mode 100644 package/vkmark/vkmark.hash<br>
&gt;&gt; create mode 100644 package/vkmark/<a href=3D"http://vkmark.mk" rel=
=3D"noreferrer" target=3D"_blank">vkmark.mk</a> [1]<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt;&gt; index 1f04dd2a1e..03af6cb426 100644<br>
&gt;&gt; --- a/DEVELOPERS<br>
&gt;&gt; +++ b/DEVELOPERS<br>
&gt;&gt; @@ -144,6 +144,9 @@ F:=C2=A0 package/liblog4c-localtime/<br>
&gt;&gt; N:=C2=A0 =C2=A0 =C2=A0Alexandre Belloni &lt;<a href=3D"mailto:alex=
andre.belloni@bootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com<=
/a>&gt;<br>
&gt;&gt; F:=C2=A0 =C2=A0 =C2=A0package/tz/<br>
&gt;&gt; <br>
&gt;&gt; +N:=C2=A0 =C2=A0 =C2=A0Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex=
.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt; +F:=C2=A0 =C2=A0 =C2=A0package/vkmark/<br>
&gt;&gt; +<br>
&gt;&gt; N:=C2=A0 =C2=A0 =C2=A0Alexandre Esse &lt;<a href=3D"mailto:alexand=
re.esse.dev@gmail.com" target=3D"_blank">alexandre.esse.dev@gmail.com</a>&g=
t;<br>
&gt;&gt; F:=C2=A0 =C2=A0 =C2=A0package/kvazaar/<br>
&gt;&gt; F:=C2=A0 =C2=A0 =C2=A0package/v4l2loopback/<br>
&gt;&gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt;&gt; index 30ba7c206a..7b9615efe6 100644<br>
&gt;&gt; --- a/package/Config.in<br>
&gt;&gt; +++ b/package/Config.in<br>
&gt;&gt; @@ -338,6 +338,7 @@ comment &quot;Graphic applications&quot;<br>
&gt;&gt; source &quot;package/swaybg/Config.in&quot;<br>
&gt;&gt; source &quot;package/tesseract-ocr/Config.in&quot;<br>
&gt;&gt; source &quot;package/tinifier/Config.in&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/vkmark/Config.in&=
quot;<br>
&gt;&gt; <br>
&gt;&gt; comment &quot;Graphic libraries&quot;<br>
&gt;&gt; source &quot;package/cegui/Config.in&quot;<br>
&gt;&gt; diff --git<br>
&gt;&gt; <br>
&gt; a/package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-pro=
bing.patch<br>
&gt;&gt; <br>
&gt; b/package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-pro=
bing.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..7e2e43a946<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++<br>
&gt;&gt; <br>
&gt; b/package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-pro=
bing.patch<br>
&gt;&gt; @@ -0,0 +1,77 @@<br>
&gt;&gt; +From adf1aa346d99d29ad2c5c945c3e4de5e0e3e12cb Mon Sep 17 00:00:00=
<br>
&gt;&gt; 2001<br>
&gt;&gt; +From: Alexandros Frantzis &lt;<a href=3D"mailto:alexandros.frantz=
is@collabora.com" target=3D"_blank">alexandros.frantzis@collabora.com</a>&g=
t;<br>
&gt;&gt; +Date: Thu, 27 Feb 2025 14:33:49 +0200<br>
&gt;&gt; +Subject: [PATCH] display: Properly handle Vulkan errors during<br=
>
&gt;&gt; probing<br>
&gt;&gt; +<br>
&gt;&gt; +The vk::createInstance() function throws an exception on error,<b=
r>
&gt;&gt; +so handle it instead of checking for a null return value.<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-of-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@=
linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt; +Upstream:<br>
&gt;&gt; <br>
&gt; <a href=3D"https://github.com/vkmark/vkmark/commit/37d0a0d7fa6dcde6f62=
718d2115e8b76646bff23" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/vkmark/vkmark/commit/37d0a0d7fa6dcde6f62718d2115e8b76646bff23</a><br>
&gt;&gt; +<br>
&gt;&gt; +---<br>
&gt;&gt; + src/ws/display_window_system_plugin.cpp | 39<br>
&gt;&gt; ++++++++++++-------------<br>
&gt;&gt; + 1 file changed, 19 insertions(+), 20 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/ws/display_window_system_plugin.cpp<br>
&gt;&gt; b/src/ws/display_window_system_plugin.cpp<br>
&gt;&gt; +index 523092b..fcbd949 100644<br>
&gt;&gt; +--- a/src/ws/display_window_system_plugin.cpp<br>
&gt;&gt; ++++ b/src/ws/display_window_system_plugin.cpp<br>
&gt;&gt; +@@ -72,24 +72,22 @@ int vkmark_window_system_probe(Options const&=
amp;<br>
&gt;&gt; options)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.setPApplicationInfo(&amp;app_i=
nfo)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.setEnabledExtensionCount(exts.=
size())<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.setPpEnabledExtensionNames(ext=
s.data());<br>
&gt;&gt; +-=C2=A0 =C2=A0 auto vk_instance =3D ManagedResource&lt;vk::Instan=
ce&gt;{<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vk::createInstance(create_info),<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [] (auto&amp; i) { i.destroy(); }};<=
br>
&gt;&gt; +-=C2=A0 =C2=A0 if (!vk_instance.raw)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VKMARK_WINDOW_SYSTEM_PROBE_BA=
D;<br>
&gt;&gt; +-<br>
&gt;&gt; +-=C2=A0 =C2=A0 auto physical_devices =3D<br>
&gt;&gt; vk_instance.raw.enumeratePhysicalDevices();<br>
&gt;&gt; +-=C2=A0 =C2=A0 auto physical_device =3D options.use_device_with_u=
uid ?<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::find_if(<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical_devices.begin=
(), physical_devices.end(),<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&amp;options] (auto p=
d) {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<b=
r>
&gt;&gt; static_cast&lt;DeviceUUID&gt;(pd.getProperties().pipelineCacheUUID=
) =3D=3D<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 options.use_device_with_uuid; }) :<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 physical_devices.begin();<br>
&gt;&gt; +-<br>
&gt;&gt; +-=C2=A0 =C2=A0 if (physical_device !=3D physical_devices.end())<b=
r>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 try<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 try<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 auto vk_instance =3D ManagedResource=
&lt;vk::Instance&gt;{<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vk::createInstance(cre=
ate_info),<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [] (auto&amp; i) { i.d=
estroy(); }};<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 auto physical_devices =3D<br>
&gt;&gt; vk_instance.raw.enumeratePhysicalDevices();<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 auto physical_device =3D options.use=
_device_with_uuid ?<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 std::find_if(<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical=
_devices.begin(), physical_devices.end(),<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&amp;op=
tions] (auto pd) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return<br>
&gt;&gt; static_cast&lt;DeviceUUID&gt;(pd.getProperties().pipelineCacheUUID=
) =3D=3D<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 options.use_device_with_uuid; }) :<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical_devices.begin=
();<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (physical_device !=3D physical_de=
vices.end())<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto display_inde=
x =3D<br>
&gt;&gt; std::stoi(get_display_index_option(options));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (display_index=
 &lt; 0)<br>
&gt;&gt; +@@ -97,10 +95,11 @@ int vkmark_window_system_probe(Options const&=
amp;<br>
&gt;&gt; options)<br>
&gt;&gt; +<br>
&gt;&gt; <br>
&gt; DisplayNativeSystem::get_display_surface_create_info(*physical_device,=
<br>
&gt;&gt; display_index);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return VKMARK_WIN=
DOW_SYSTEM_PROBE_OK +<br>
&gt;&gt; VKMARK_DISPLAY_WINDOW_SYSTEM_PRIORITY;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 catch (...)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 =C2=A0 catch (...)<br>
&gt;&gt; ++=C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 }<br>
&gt;&gt; ++<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return VKMARK_WINDOW_SYSTEM_PROBE_BAD;<br>
&gt;&gt; + }<br>
&gt;&gt; +--<br>
&gt;&gt; +2.39.5<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/package/vkmark/Config.in b/package/vkmark/Config.in<b=
r>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..032eb47dc9<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/package/vkmark/Config.in<br>
&gt;&gt; @@ -0,0 +1,48 @@<br>
&gt;&gt; +config BR2_PACKAGE_VKMARK_FLAVOR_ANY<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_VKMARK_FLAVOR_KMS<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_PACKAGE_HAS_LIBGBM<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VKMARK_FLAVOR_ANY<b=
r>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_PACKAGE_WAYLAND<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VKMARK_FLAVOR_ANY<b=
r>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_VKMARK_FLAVOR_X11<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_PACKAGE_XORG7<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VKMARK_FLAVOR_ANY<b=
r>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_VKMARK<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;vkmark&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_VKMARK_FLAVOR_A=
NY<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VULKAN_HEADERS<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VULKAN_LOADER<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # vulkan-l=
oader<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS #=
 vulkan-loader<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GLM<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # assimp<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_=
7 # assimp<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP # vul=
kan-loader, glm,<br>
&gt;&gt; assimp, vkmark<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ASSIMP<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_WAYLAND_PROTOCOLS i=
f<br>
&gt;&gt; BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBXCB if BR2_PACKA=
GE_VKMARK_FLAVOR_X11<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_XCB_UTIL_WM if<br>
&gt;&gt; BR2_PACKAGE_VKMARK_FLAVOR_X11<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBDRM if BR2_PACKA=
GE_VKMARK_FLAVOR_KMS<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmmark is an Vulkan GPU benchma=
rk.<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/v=
kmark/vkmark" rel=3D"noreferrer" target=3D"_blank">https://github.com/vkmar=
k/vkmark</a><br>
&gt;&gt; +<br>
&gt;&gt; +comment &quot;vkmark needs a toolchain w/ dynamic library, thread=
s,<br>
&gt;&gt; wchar, gcc &gt;=3D 7, C++&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_STATIC_LIBS || \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_HAS_THREADS || \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_USE_WCHAR || \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_INSTALL_LIBSTDCPP<br>
&gt;&gt; +<br>
&gt;&gt; +comment &quot;vkmark needs a backend: gbm, wayland or xcb&quot;<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_VKMARK_FLAVOR_=
ANY<br>
&gt;&gt; diff --git a/package/vkmark/vkmark.hash b/package/vkmark/vkmark.ha=
sh<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..2650f4ccd4<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/package/vkmark/vkmark.hash<br>
&gt;&gt; @@ -0,0 +1,3 @@<br>
&gt;&gt; +# Locally computed<br>
&gt;&gt; +sha256<br>
&gt;&gt; 1ae362844344d0f9878b7a3f13005f77eae705108892a4e8abf237d452d37edc<b=
r>
&gt;&gt; vkmark-2025.01.tar.gz<br>
&gt;&gt; +sha256<br>
&gt;&gt; dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551<b=
r>
&gt;&gt; COPYING-LGPL2.1<br>
&gt;&gt; diff --git a/package/vkmark/<a href=3D"http://vkmark.mk" rel=3D"no=
referrer" target=3D"_blank">vkmark.mk</a> [1] b/package/vkmark/<a href=3D"h=
ttp://vkmark.mk" rel=3D"noreferrer" target=3D"_blank">vkmark.mk</a><br>
&gt;&gt; [1]<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..7b721c6c99<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/package/vkmark/<a href=3D"http://vkmark.mk" rel=3D"noreferre=
r" target=3D"_blank">vkmark.mk</a> [1]<br>
&gt;&gt; @@ -0,0 +1,34 @@<br>
&gt;&gt; <br>
&gt; +#####################################################################=
###########<br>
&gt;&gt; +#<br>
&gt;&gt; +# vkmark<br>
&gt;&gt; +#<br>
&gt;&gt; <br>
&gt; +#####################################################################=
###########<br>
&gt;&gt; +<br>
&gt;&gt; +VKMARK_VERSION =3D 2025.01<br>
&gt;&gt; +VKMARK_SITE =3D $(call github,vkmark,vkmark,$(VKMARK_VERSION))<br=
>
&gt;&gt; +VKMARK_LICENSE =3D LGPL-2.1<br>
&gt;&gt; +VKMARK_LICENSE_FILES =3D COPYING-LGPL2.1<br>
&gt;&gt; +VKMARK_DEPENDENCIES =3D assimp glm host-pkgconf vulkan-headers<br=
>
&gt;&gt; vulkan-loader<br>
&gt;&gt; +<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_KMS),y)<br>
&gt;&gt; +VKMARK_DEPENDENCIES +=3D libdrm libgbm<br>
&gt;&gt; +VKMARK_CONF_OPTS +=3D -Dkms=3Dtrue<br>
&gt;&gt; +else<br>
&gt;&gt; +VKMARK_CONF_OPTS +=3D -Dkms=3Dfalse<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND),y)<br>
&gt;&gt; +VKMARK_DEPENDENCIES +=3D wayland wayland-protocols<br>
&gt;&gt; +VKMARK_CONF_OPTS +=3D -Dwayland=3Dtrue<br>
&gt;&gt; +else<br>
&gt;&gt; +VKMARK_CONF_OPTS +=3D -Dwayland=3Dfalse<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_X11),y)<br>
&gt;&gt; +VKMARK_DEPENDENCIES +=3D libxcb xcb-util-wm<br>
&gt;&gt; +VKMARK_CONF_OPTS +=3D -Dxcb=3Dtrue<br>
&gt;&gt; +else<br>
&gt;&gt; +VKMARK_CONF_OPTS +=3D -Dxcb=3Dfalse<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +$(eval $(meson-package))<br>
&gt;&gt; --<br>
&gt;&gt; 2.39.5<br>
&gt; <br>
&gt;=C2=A0 I tried to build vkmark but get this error:<br>
&gt; <br>
&gt;&gt;&gt;&gt; vkmark custom Configuring<br>
&gt; rm -rf<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//bui=
ldroot-build<br>
&gt; mkdir -p<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//bui=
ldroot-build<br>
&gt; sed -e &quot;/^\[binaries\]$/s:$::&quot; -e &quot;/^\[properties\]$/s:=
$::&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e<br>
&gt; &quot;s%@TARGET_CC@%/srv/storage/hthiery/sources/sa67/out-graphic/host=
/bin/aarch64-linux-gcc%g&quot;<br>
&gt; -e<br>
&gt; &quot;s%@TARGET_CXX@%/srv/storage/hthiery/sources/sa67/out-graphic/hos=
t/bin/aarch64-linux-g++%g&quot;<br>
&gt; -e<br>
&gt; &quot;s%@TARGET_AR@%/srv/storage/hthiery/sources/sa67/out-graphic/host=
/bin/aarch64-linux-gcc-ar%g&quot;<br>
&gt; -e<br>
&gt; &quot;s%@TARGET_FC@%/srv/storage/hthiery/sources/sa67/out-graphic/host=
/bin/aarch64-linux-gfortran%g&quot;<br>
&gt; -e<br>
&gt; &quot;s%@TARGET_STRIP@%/srv/storage/hthiery/sources/sa67/out-graphic/h=
ost/bin/aarch64-linux-strip%g&quot;<br>
&gt; -e &quot;s%@TARGET_ARCH@%aarch64%g&quot; -e &quot;s%@TARGET_CPU@%corte=
x-a53%g&quot; -e<br>
&gt; &quot;s%@TARGET_ENDIAN@%little%g&quot; -e &quot;s%@TARGET_FCFLAGS@%%g&=
quot; -e<br>
&gt; &quot;s%@TARGET_CFLAGS@%&#39;-D_LARGEFILE_SOURCE&#39;, &#39;-D_LARGEFI=
LE64_SOURCE&#39;,<br>
&gt; &#39;-D_FILE_OFFSET_BITS=3D64&#39;, &#39;-O2&#39;, &#39;-g0&#39;, &#39=
;-D_FORTIFY_SOURCE=3D1&#39;%g&quot; -e<br>
&gt; &quot;s%@TARGET_LDFLAGS@%%g&quot; -e &quot;s%@TARGET_CXXFLAGS@%&#39;-D=
_LARGEFILE_SOURCE&#39;,<br>
&gt; &#39;-D_LARGEFILE64_SOURCE&#39;, &#39;-D_FILE_OFFSET_BITS=3D64&#39;, &=
#39;-O2&#39;, &#39;-g0&#39;,<br>
&gt; &#39;-D_FORTIFY_SOURCE=3D1&#39;%g&quot; -e<br>
&gt; &quot;s%@BR2_CMAKE@%/srv/storage/hthiery/sources/sa67/out-graphic/host=
/bin/cmake%g&quot;<br>
&gt; -e<br>
&gt; &quot;s%@PKGCONF_HOST_BINARY@%/srv/storage/hthiery/sources/sa67/out-gr=
aphic/host/bin/pkgconf%g&quot;<br>
&gt; -e &quot;s%@HOST_DIR@%/srv/storage/hthiery/sources/sa67/out-graphic/ho=
st%g&quot;<br>
&gt; -e<br>
&gt; &quot;s%@STAGING_DIR@%/srv/storage/hthiery/sources/sa67/out-graphic/ho=
st/aarch64-buildroot-linux-gnu/sysroot%g&quot;<br>
&gt; -e &quot;s%@STATIC@%false%g&quot;<br>
&gt; /srv/storage/hthiery/sources/sa67/buildroot/support/misc/<a href=3D"ht=
tp://cross-compilation.conf.in" rel=3D"noreferrer" target=3D"_blank">cross-=
compilation.conf.in</a><br>
&gt; [2] &gt;<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//bui=
ldroot-build/cross-compilation.conf<br>
&gt; PATH=3D&quot;/srv/storage/hthiery/sources/sa67/out-graphic/host/bin:/s=
rv/storage/hthiery/sources/sa67/out-graphic/host/sbin:/home/hthiery/.local/=
bin:/home/hthiery/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/ga=
mes&quot;<br>
&gt; CC_FOR_BUILD=3D&quot;/usr/bin/gcc&quot; CXX_FOR_BUILD=3D&quot;/usr/bin=
/g++&quot;<br>
&gt; PYTHONNOUSERSITE=3Dy<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/meson setup<br>
&gt; --prefix=3D/usr --libdir=3Dlib --default-library=3Dshared<br>
&gt; --buildtype=3Drelease<br>
&gt; --cross-file=3D/srv/storage/hthiery/sources/sa67/out-graphic/build/vkm=
ark-custom//buildroot-build/cross-compilation.conf<br>
&gt; -Db_pie=3Dfalse -Db_staticpic=3Dtrue -Dstrip=3Dfalse<br>
&gt; -Dbuild.pkg_config_path=3D/srv/storage/hthiery/sources/sa67/out-graphi=
c/host/lib/pkgconfig<br>
&gt; -Dbuild.cmake_prefix_path=3D/srv/storage/hthiery/sources/sa67/out-grap=
hic/host/lib/cmake<br>
&gt; -Dkms=3Dtrue -Dwayland=3Dfalse -Dxcb=3Dfalse<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom/<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//bui=
ldroot-build<br>
&gt; The Meson build system<br>
&gt; Version: 1.7.0<br>
&gt; Source dir:<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom<br>
&gt; Build dir:<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom/buil=
droot-build<br>
&gt; Build type: cross build<br>
&gt; Project name: vkmark<br>
&gt; Project version: 2025.01<br>
&gt; C compiler for the host machine:<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-g=
cc<br>
&gt; (gcc 14.2.0 &quot;aarch64-linux-gcc.br_real (Buildroot<br>
&gt; 2021.11-12449-g1bef613319) 14.2.0&quot;)<br>
&gt; C linker for the host machine:<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-g=
cc<br>
&gt; ld.bfd 2.42<br>
&gt; C++ compiler for the host machine:<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-g=
++<br>
&gt; (gcc 14.2.0 &quot;aarch64-linux-g++.br_real (Buildroot<br>
&gt; 2021.11-12449-g1bef613319) 14.2.0&quot;)<br>
&gt; C++ linker for the host machine:<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-g=
++<br>
&gt; ld.bfd 2.42<br>
&gt; C compiler for the build machine: /usr/bin/gcc (gcc 8.3.0 &quot;gcc (D=
ebian<br>
&gt; 8.3.0-6) 8.3.0&quot;)<br>
&gt; C linker for the build machine: /usr/bin/gcc ld.bfd 2.31.1<br>
&gt; C++ compiler for the build machine: /usr/bin/g++ (gcc 8.3.0 &quot;g++<=
br>
&gt; (Debian 8.3.0-6) 8.3.0&quot;)<br>
&gt; C++ linker for the build machine: /usr/bin/g++ ld.bfd 2.31.1<br>
&gt; Build machine cpu family: x86_64<br>
&gt; Build machine cpu: x86_64<br>
&gt; Host machine cpu family: aarch64<br>
&gt; Host machine cpu: cortex-a53<br>
&gt; Target machine cpu family: aarch64<br>
&gt; Target machine cpu: cortex-a53<br>
&gt; Found pkg-config: YES<br>
&gt; (/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/pkg-config)<br=
>
&gt; 2.3.0<br>
&gt; Build-time dependency vulkan found: YES 1.4.307<br>
&gt; Library dl found: YES<br>
&gt; Found pkg-config: YES<br>
&gt; (/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/pkgconf) 2.3.0=
<br>
&gt; Found CMake:<br>
&gt; /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/cmake (3.31.5)<=
br>
&gt; Run-time dependency glm found: YES 1.0.0<br>
&gt; Run-time dependency assimp found: YES 5.4.3<br>
&gt; Run-time dependency xcb found: NO (tried pkgconfig and cmake)<br>
&gt; Run-time dependency xcb-icccm found: NO (tried pkgconfig and cmake)<br=
>
&gt; Run-time dependency wayland-client found: NO (tried pkgconfig and<br>
&gt; cmake)<br>
&gt; Run-time dependency wayland-protocols found: NO (tried pkgconfig and<b=
r>
&gt; cmake)<br>
&gt; Run-time dependency wayland-scanner found: NO (tried pkgconfig and<br>
&gt; cmake)<br>
&gt; Run-time dependency libdrm found: YES 2.4.124<br>
&gt; Run-time dependency gbm found: YES 25.0.6<br>
&gt; Program python3 found: YES<br>
&gt; (/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/python3)<br>
&gt; <br>
&gt; ../out-graphic/build/vkmark-custom/src/meson.build:9:19: ERROR: File<b=
r>
&gt; /usr/share/vulkan/registry/vk.xml does not exist<br>
&gt; <br>
&gt; Is the vk.xml file installed on your system in<br>
&gt; /usr/share/vulkan/registry/vk.xml? I think the problem is related to<b=
r>
&gt; the vulkan.pc file that has a wrong prefix value set.<br>
&gt; <br>
&gt; Can you confirm that?<br>
<br>
I can reproduce the issue. When using the Buildroot docker<br>
reference image, with the commands:<br>
<br>
=C2=A0 =C2=A0 =C2=A0utils/docker-run<br>
=C2=A0 =C2=A0 =C2=A0cat &gt;.config &lt;&lt;EOF<br>
=C2=A0 =C2=A0 =C2=A0BR2_aarch64=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttyAMA0&quot;<br>
=C2=A0 =C2=A0 =C2=A0BR2_SYSTEM_DHCP=3D&quot;eth0&quot;<br>
=C2=A0 =C2=A0 =C2=A0BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/post-im=
age.sh&quot;<br>
=C2=A0 =C2=A0 =C2=A0BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;qemu_aarch64_virt_d=
efconfig&quot;<br>
=C2=A0 =C2=A0 =C2=A0BR2_LINUX_KERNEL=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
<br>
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/aarch64-virt/linux.c=
onfig&quot;<br>
=C2=A0 =C2=A0 =C2=A0BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_VKMARK=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_MESA3D=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_TARGET_ROOTFS_EXT2=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
=C2=A0 =C2=A0 =C2=A0BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;600M&quot;<br>
=C2=A0 =C2=A0 =C2=A0# BR2_TARGET_ROOTFS_TAR is not set<br>
=C2=A0 =C2=A0 =C2=A0EOF<br>
=C2=A0 =C2=A0 =C2=A0make olddefconfig<br>
=C2=A0 =C2=A0 =C2=A0make<br>
<br>
It fails with:<br>
<br>
=C2=A0 =C2=A0 =C2=A0output/build/vkmark-2025.01/src/meson.build:9:19: ERROR=
: File <br>
/usr/share/vulkan/registry/vk.xml does not exist.<br>
<br>
If I build directly on my host system, which has the vulkan headers<br>
available at /usr/share/vulkan/registry/vk.xml, it works.<br>
<br>
vkmark meson should take the file from:<br>
$(STAGING_DIR)/usr/share/vulkan/registry/vk.xml<br></blockquote><div><br></=
div><div>You are right. It is related to the location of the vk.xml file. I=
 opened an issue on the vkmark github page:=C2=A0<a href=3D"https://github.=
com/vkmark/vkmark/issues/75">https://github.com/vkmark/vkmark/issues/75</a>=
.</div><div><br></div><div>I have a workaround for that but it does not see=
m like a valid final solution. See my comment in the github issue.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt; Heiko<br>
&gt; <br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; buildroot mailing list<br>
&gt;&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">build=
root@buildroot.org</a><br>
&gt;&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/l=
istinfo/buildroot</a><br>
&gt; <br>
&gt; <br>
&gt; Links:<br>
&gt; ------<br>
&gt; [1] <a href=3D"http://vkmark.mk" rel=3D"noreferrer" target=3D"_blank">=
http://vkmark.mk</a><br>
&gt; [2] <a href=3D"http://cross-compilation.conf.in" rel=3D"noreferrer" ta=
rget=3D"_blank">http://cross-compilation.conf.in</a><br>
<br>
Best regards,<br>
<br>
Julien.<br></blockquote><div><br></div><div>BR</div><div>--</div><div>Heiko=
=C2=A0</div></div></div>

--00000000000086bc2d0636926eb5--

--===============6269793726708835991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6269793726708835991==--
