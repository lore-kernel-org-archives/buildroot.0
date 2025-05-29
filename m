Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3513C54FB3
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 13:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53467613CB;
	Thu, 29 May 2025 13:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67jhesaESt2m; Thu, 29 May 2025 13:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F596613CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F596613CE;
	Thu, 29 May 2025 13:27:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E4D914F
 for <buildroot@buildroot.org>; Thu, 29 May 2025 13:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0182B408F9
 for <buildroot@buildroot.org>; Thu, 29 May 2025 13:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnaFo8MgfHts for <buildroot@buildroot.org>;
 Thu, 29 May 2025 13:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70B954082D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70B954082D
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70B954082D
 for <buildroot@buildroot.org>; Thu, 29 May 2025 13:27:39 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-32925727810so7810791fa.0
 for <buildroot@buildroot.org>; Thu, 29 May 2025 06:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748525257; x=1749130057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sA8biR2U0vRxOveNPCovUspyBN01yDo50wjqTaLwfR4=;
 b=XU4PdBM3DrHLmNwqrZnth0QmUqTkGkozY0r0P8VV0j6lSLEwWEdF5CrxSvqz2H2nBN
 soHulJekUNXR7ZTrxDvRHIyJI7wDHkkY2LqrTjd1LdAA9T7bVzo88Kym6ePrKnOM/kHY
 2l+PKU7zmUlTCGKsAE9A+ZV0fzXR89V60vy9MPkM5D3f4YdTSEKa7Mp4cEKv8djW8OLR
 9SfPrE+lSyKJ2viLl06xKLo5Hnnd2ejV9wYSSekpDQGNPG+5Xi1OFXsIMhMCjDL8fAg2
 G0fRjKxFx8zQL+8xWJS5FNfXR0Pw8rvRCmdb6TkYSxB8mYat3cRIEzhW6L+IYydZQ307
 wreg==
X-Gm-Message-State: AOJu0YykR+parUywhANbZxcf2YkJ+BPuRCmwAm/uC+vT1ueVaJaar1kF
 cfzWBJxKMWh3WSYL6fZ09SqZvA78D7+r3ugWfpwR/Li9dhR7ypHvVKjN8/qdlcNob+fNcj2cTwr
 ECZ04FVAb0Fff+E34KuT93SS2MgEmbA5pRw==
X-Gm-Gg: ASbGncvCqsa3oHSPiqh0qaPlk2bBlOPghTVSBQ/EB2U/RALxo9ZPG7ysbGNs/XFixrq
 LetPRAeZvU4k3FQA0KtvhEFI7d466TzFDaYsqWTS9zVvqrQ36nPppfPTs7GkSu29txzkFzriQLK
 O0ntF5qPhuSa9FKQfUPKVtJxzjms0fjNqGf7MnCk5PrhOOZ37+bU6mPD+dD5o66idXM9c=
X-Google-Smtp-Source: AGHT+IG7l1J45btGXVaoMJWjPtT8+lqwoRFbDJkQ207tpTVlTkaq5tb8Sp+MJqAV7nTcdKVNnt7yeTQzJ7VQltdGmOQ=
X-Received: by 2002:a05:651c:3238:b0:30b:b987:b6a7 with SMTP id
 38308e7fff4ca-32a873897d6mr7303501fa.0.1748525257044; Thu, 29 May 2025
 06:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250303161557.571619-1-alex.bennee@linaro.org>
 <20250303161557.571619-6-alex.bennee@linaro.org>
 <CAEyMn7b+fVD=kWqSjGhd=NuJ2iK==iBy0sjd09Ewu8rZM-Gm5g@mail.gmail.com>
In-Reply-To: <CAEyMn7b+fVD=kWqSjGhd=NuJ2iK==iBy0sjd09Ewu8rZM-Gm5g@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 29 May 2025 15:27:24 +0200
X-Gm-Features: AX0GCFsluvnwR8se4CSIClBRsPejWwWw3r-00eT6ZPWU1mm-lIuYZMAM24Tti50
Message-ID: <CAEyMn7babL8yacpZkmGNjVYOEd=T4uHi7dW8xCs5XDn7sxrvzA@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748525257; x=1749130057; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sA8biR2U0vRxOveNPCovUspyBN01yDo50wjqTaLwfR4=;
 b=Ounn/Kzbpylh9PWspeWwvXEMS9hViCZul1upNT/pKjBp2jDPEYww3HECGPxSVM/oaW
 7ISv1HaGIJDT9Zpd/w3uBVBWHBN6TqLGbT7SDc+wtBDz1J9x9AEUC0c9p34MYVZKvKot
 SY/z3ebpXYyiHn1qEe8tlJv93bI+xR45Tnz0tNjw3VPS1GE2v5VElnx6bSEKqFAEeI56
 Len+lMHvgGZhNu3JjDyyzBIziwfZ3IFyxwttcLxGE3IT+NwQLwFhVpBLzEnLp9HUNZJ7
 QaJpdfSZOG1TxaVv9BHyySas3obEXaaXVLw1s2QZ9C/EQf+isCcbfa1ugumEepBbVbu7
 MnCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ounn/Kzb
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
Content-Type: multipart/mixed; boundary="===============7245248248209442271=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7245248248209442271==
Content-Type: multipart/alternative; boundary="000000000000d3b6580636464273"

--000000000000d3b6580636464273
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Am Mi., 28. Mai 2025 um 16:00 Uhr schrieb Heiko Thiery <
heiko.thiery@gmail.com>:

> Hi Alex,
>
> thank you for these series.
>
> Am Mo., 3. M=C3=A4rz 2025 um 17:16 Uhr schrieb Alex Benn=C3=A9e <
> alex.bennee@linaro.org>:
>
>> We build from the recent 2025.1 release although we need one commit
>> from master to better handle the missing KHR_display extension.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> ---
>> v4
>>   - fix tab vs space damage
>>   - don't if BR2_PACKAGE_VKMARK_FLAVOR_ANY
>>   - make comments properly depend
>>   - use the new 2025.01 release
>>   - add sha256sum of COPYING-LGPL2.1
>>   - alphabetic sort of initial VKMARK_DEPENDENCIES
>>   - add vulkan error probing patch
>> v3
>>   - add xcb-util-wm deps under X11
>>   - add assimp directly to VKMARK_DEPENDENCIES
>>   - drop duplicate BR2_INSTALL_LIBSTDCPP
>>   - drop BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>> v2
>>   - fix whitespace errors in Config.in
>>   - fix sorting of sources
>>   - add DEVELOPERS entry
>>   - rework KConfig based on review
>>   - drop unused sha256sum
>>   - explicitly enable/disable the backends
>> ---
>>  DEVELOPERS                                    |  3 +
>>  package/Config.in                             |  1 +
>>  ...-handle-Vulkan-errors-during-probing.patch | 77 +++++++++++++++++++
>>  package/vkmark/Config.in                      | 48 ++++++++++++
>>  package/vkmark/vkmark.hash                    |  3 +
>>  package/vkmark/vkmark.mk                      | 34 ++++++++
>>  6 files changed, 166 insertions(+)
>>  create mode 100644
>> package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-probing=
.patch
>>  create mode 100644 package/vkmark/Config.in
>>  create mode 100644 package/vkmark/vkmark.hash
>>  create mode 100644 package/vkmark/vkmark.mk
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 1f04dd2a1e..03af6cb426 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -144,6 +144,9 @@ F:  package/liblog4c-localtime/
>>  N:     Alexandre Belloni <alexandre.belloni@bootlin.com>
>>  F:     package/tz/
>>
>> +N:     Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> +F:     package/vkmark/
>> +
>>  N:     Alexandre Esse <alexandre.esse.dev@gmail.com>
>>  F:     package/kvazaar/
>>  F:     package/v4l2loopback/
>> diff --git a/package/Config.in b/package/Config.in
>> index 30ba7c206a..7b9615efe6 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -338,6 +338,7 @@ comment "Graphic applications"
>>         source "package/swaybg/Config.in"
>>         source "package/tesseract-ocr/Config.in"
>>         source "package/tinifier/Config.in"
>> +       source "package/vkmark/Config.in"
>>
>>  comment "Graphic libraries"
>>         source "package/cegui/Config.in"
>> diff --git
>> a/package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-probi=
ng.patch
>> b/package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-probi=
ng.patch
>> new file mode 100644
>> index 0000000000..7e2e43a946
>> --- /dev/null
>> +++
>> b/package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-probi=
ng.patch
>> @@ -0,0 +1,77 @@
>> +From adf1aa346d99d29ad2c5c945c3e4de5e0e3e12cb Mon Sep 17 00:00:00 2001
>> +From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
>> +Date: Thu, 27 Feb 2025 14:33:49 +0200
>> +Subject: [PATCH] display: Properly handle Vulkan errors during probing
>> +
>> +The vk::createInstance() function throws an exception on error,
>> +so handle it instead of checking for a null return value.
>> +
>> +Signed-of-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> +Upstream:
>> https://github.com/vkmark/vkmark/commit/37d0a0d7fa6dcde6f62718d2115e8b76=
646bff23
>> +
>> +---
>> + src/ws/display_window_system_plugin.cpp | 39 ++++++++++++-------------
>> + 1 file changed, 19 insertions(+), 20 deletions(-)
>> +
>> +diff --git a/src/ws/display_window_system_plugin.cpp
>> b/src/ws/display_window_system_plugin.cpp
>> +index 523092b..fcbd949 100644
>> +--- a/src/ws/display_window_system_plugin.cpp
>> ++++ b/src/ws/display_window_system_plugin.cpp
>> +@@ -72,24 +72,22 @@ int vkmark_window_system_probe(Options const&
>> options)
>> +         .setPApplicationInfo(&app_info)
>> +         .setEnabledExtensionCount(exts.size())
>> +         .setPpEnabledExtensionNames(exts.data());
>> +-    auto vk_instance =3D ManagedResource<vk::Instance>{
>> +-        vk::createInstance(create_info),
>> +-        [] (auto& i) { i.destroy(); }};
>> +-    if (!vk_instance.raw)
>> +-        return VKMARK_WINDOW_SYSTEM_PROBE_BAD;
>> +-
>> +-    auto physical_devices =3D vk_instance.raw.enumeratePhysicalDevices=
();
>> +-    auto physical_device =3D options.use_device_with_uuid ?
>> +-        std::find_if(
>> +-            physical_devices.begin(), physical_devices.end(),
>> +-            [&options] (auto pd) {
>> +-                return
>> static_cast<DeviceUUID>(pd.getProperties().pipelineCacheUUID) =3D=3D
>> +-                    options.use_device_with_uuid; }) :
>> +-        physical_devices.begin();
>> +-
>> +-    if (physical_device !=3D physical_devices.end())
>> ++
>> ++    try
>> +     {
>> +-        try
>> ++        auto vk_instance =3D ManagedResource<vk::Instance>{
>> ++            vk::createInstance(create_info),
>> ++            [] (auto& i) { i.destroy(); }};
>> ++        auto physical_devices =3D
>> vk_instance.raw.enumeratePhysicalDevices();
>> ++        auto physical_device =3D options.use_device_with_uuid ?
>> ++            std::find_if(
>> ++                physical_devices.begin(), physical_devices.end(),
>> ++                [&options] (auto pd) {
>> ++                    return
>> static_cast<DeviceUUID>(pd.getProperties().pipelineCacheUUID) =3D=3D
>> ++                        options.use_device_with_uuid; }) :
>> ++            physical_devices.begin();
>> ++
>> ++        if (physical_device !=3D physical_devices.end())
>> +         {
>> +             auto display_index =3D
>> std::stoi(get_display_index_option(options));
>> +             if (display_index < 0)
>> +@@ -97,10 +95,11 @@ int vkmark_window_system_probe(Options const&
>> options)
>> +
>>  DisplayNativeSystem::get_display_surface_create_info(*physical_device,
>> display_index);
>> +             return VKMARK_WINDOW_SYSTEM_PROBE_OK +
>> VKMARK_DISPLAY_WINDOW_SYSTEM_PRIORITY;
>> +         }
>> +-        catch (...)
>> +-        {
>> +-        }
>> +     }
>> ++    catch (...)
>> ++    {
>> ++    }
>> ++
>> +
>> +     return VKMARK_WINDOW_SYSTEM_PROBE_BAD;
>> + }
>> +--
>> +2.39.5
>> +
>> diff --git a/package/vkmark/Config.in b/package/vkmark/Config.in
>> new file mode 100644
>> index 0000000000..032eb47dc9
>> --- /dev/null
>> +++ b/package/vkmark/Config.in
>> @@ -0,0 +1,48 @@
>> +config BR2_PACKAGE_VKMARK_FLAVOR_ANY
>> +       bool
>> +
>> +config BR2_PACKAGE_VKMARK_FLAVOR_KMS
>> +       bool
>> +       default y if BR2_PACKAGE_HAS_LIBGBM
>> +       select BR2_PACKAGE_VKMARK_FLAVOR_ANY
>> +
>> +config BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND
>> +       bool
>> +       default y if BR2_PACKAGE_WAYLAND
>> +       select BR2_PACKAGE_VKMARK_FLAVOR_ANY
>> +
>> +config BR2_PACKAGE_VKMARK_FLAVOR_X11
>> +       bool
>> +       default y if BR2_PACKAGE_XORG7
>> +       select BR2_PACKAGE_VKMARK_FLAVOR_ANY
>> +
>> +config BR2_PACKAGE_VKMARK
>> +       bool "vkmark"
>> +       depends on BR2_PACKAGE_VKMARK_FLAVOR_ANY
>> +       select BR2_PACKAGE_VULKAN_HEADERS
>> +       select BR2_PACKAGE_VULKAN_LOADER
>> +       depends on !BR2_STATIC_LIBS # vulkan-loader
>> +       depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
>> +       select BR2_PACKAGE_GLM
>> +       depends on BR2_USE_WCHAR # assimp
>> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # assimp
>> +       depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader, glm, assimp,
>> vkmark
>> +       select BR2_PACKAGE_ASSIMP
>> +       select BR2_PACKAGE_WAYLAND_PROTOCOLS if
>> BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND
>> +       select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_VKMARK_FLAVOR_X11
>> +       select BR2_PACKAGE_XCB_UTIL_WM if BR2_PACKAGE_VKMARK_FLAVOR_X11
>> +       select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_VKMARK_FLAVOR_KMS
>> +       help
>> +         vmmark is an Vulkan GPU benchmark.
>> +
>> +         https://github.com/vkmark/vkmark
>> +
>> +comment "vkmark needs a toolchain w/ dynamic library, threads, wchar,
>> gcc >=3D 7, C++"
>> +       depends on BR2_STATIC_LIBS || \
>> +       !BR2_TOOLCHAIN_HAS_THREADS || \
>> +       !BR2_USE_WCHAR || \
>> +       !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
>> +       !BR2_INSTALL_LIBSTDCPP
>> +
>> +comment "vkmark needs a backend: gbm, wayland or xcb"
>> +       depends on !BR2_PACKAGE_VKMARK_FLAVOR_ANY
>> diff --git a/package/vkmark/vkmark.hash b/package/vkmark/vkmark.hash
>> new file mode 100644
>> index 0000000000..2650f4ccd4
>> --- /dev/null
>> +++ b/package/vkmark/vkmark.hash
>> @@ -0,0 +1,3 @@
>> +# Locally computed
>> +sha256
>> 1ae362844344d0f9878b7a3f13005f77eae705108892a4e8abf237d452d37edc
>> vkmark-2025.01.tar.gz
>> +sha256
>> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551
>> COPYING-LGPL2.1
>> diff --git a/package/vkmark/vkmark.mk b/package/vkmark/vkmark.mk
>> new file mode 100644
>> index 0000000000..7b721c6c99
>> --- /dev/null
>> +++ b/package/vkmark/vkmark.mk
>> @@ -0,0 +1,34 @@
>>
>> +#######################################################################=
#########
>> +#
>> +# vkmark
>> +#
>>
>> +#######################################################################=
#########
>> +
>> +VKMARK_VERSION =3D 2025.01
>> +VKMARK_SITE =3D $(call github,vkmark,vkmark,$(VKMARK_VERSION))
>> +VKMARK_LICENSE =3D LGPL-2.1
>> +VKMARK_LICENSE_FILES =3D COPYING-LGPL2.1
>> +VKMARK_DEPENDENCIES =3D assimp glm host-pkgconf vulkan-headers
>> vulkan-loader
>> +
>> +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_KMS),y)
>> +VKMARK_DEPENDENCIES +=3D libdrm libgbm
>> +VKMARK_CONF_OPTS +=3D -Dkms=3Dtrue
>> +else
>> +VKMARK_CONF_OPTS +=3D -Dkms=3Dfalse
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_WAYLAND),y)
>> +VKMARK_DEPENDENCIES +=3D wayland wayland-protocols
>> +VKMARK_CONF_OPTS +=3D -Dwayland=3Dtrue
>> +else
>> +VKMARK_CONF_OPTS +=3D -Dwayland=3Dfalse
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_VKMARK_FLAVOR_X11),y)
>> +VKMARK_DEPENDENCIES +=3D libxcb xcb-util-wm
>> +VKMARK_CONF_OPTS +=3D -Dxcb=3Dtrue
>> +else
>> +VKMARK_CONF_OPTS +=3D -Dxcb=3Dfalse
>> +endif
>> +
>> +$(eval $(meson-package))
>> --
>> 2.39.5
>>
>>
>
>  I tried to build vkmark but get this error:
>
> >>> vkmark custom Configuring
> rm -rf
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//buildr=
oot-build
> mkdir -p
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//buildr=
oot-build
> sed -e "/^\[binaries\]$/s:$::" -e "/^\[properties\]$/s:$::"         -e
> "s%@TARGET_CC@%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aar=
ch64-linux-gcc%g"
> -e "s%@TARGET_CXX@%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin=
/aarch64-linux-g++%g"
> -e "s%@TARGET_AR@%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/=
aarch64-linux-gcc-ar%g"
> -e "s%@TARGET_FC@%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/=
aarch64-linux-gfortran%g"
> -e "s%@TARGET_STRIP@%/srv/storage/hthiery/sources/sa67/out-graphic/host/b=
in/aarch64-linux-strip%g"
> -e "s%@TARGET_ARCH@%aarch64%g" -e "s%@TARGET_CPU@%cortex-a53%g" -e
> "s%@TARGET_ENDIAN@%little%g" -e "s%@TARGET_FCFLAGS@%%g" -e
> "s%@TARGET_CFLAGS@%'-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE',
> '-D_FILE_OFFSET_BITS=3D64', '-O2', '-g0', '-D_FORTIFY_SOURCE=3D1'%g" -e
> "s%@TARGET_LDFLAGS@%%g" -e "s%@TARGET_CXXFLAGS@%'-D_LARGEFILE_SOURCE',
> '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=3D64', '-O2', '-g0',
> '-D_FORTIFY_SOURCE=3D1'%g" -e "s%@BR2_CMAKE@%/srv/storage/hthiery/sources=
/sa67/out-graphic/host/bin/cmake%g"
> -e "s%@PKGCONF_HOST_BINARY@%/srv/storage/hthiery/sources/sa67/out-graphic=
/host/bin/pkgconf%g"
> -e "s%@HOST_DIR@%/srv/storage/hthiery/sources/sa67/out-graphic/host%g" -e
> "s%@STAGING_DIR@%/srv/storage/hthiery/sources/sa67/out-graphic/host/aarch=
64-buildroot-linux-gnu/sysroot%g"
> -e "s%@STATIC@%false%g"
> /srv/storage/hthiery/sources/sa67/buildroot/support/misc/
> cross-compilation.conf.in >
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//buildr=
oot-build/cross-compilation.conf
> PATH=3D"/srv/storage/hthiery/sources/sa67/out-graphic/host/bin:/srv/stora=
ge/hthiery/sources/sa67/out-graphic/host/sbin:/home/hthiery/.local/bin:/hom=
e/hthiery/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
> CC_FOR_BUILD=3D"/usr/bin/gcc" CXX_FOR_BUILD=3D"/usr/bin/g++"
>  PYTHONNOUSERSITE=3Dy
> /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/meson setup
> --prefix=3D/usr --libdir=3Dlib --default-library=3Dshared --buildtype=3Dr=
elease
> --cross-file=3D/srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark=
-custom//buildroot-build/cross-compilation.conf
> -Db_pie=3Dfalse -Db_staticpic=3Dtrue -Dstrip=3Dfalse
> -Dbuild.pkg_config_path=3D/srv/storage/hthiery/sources/sa67/out-graphic/h=
ost/lib/pkgconfig
> -Dbuild.cmake_prefix_path=3D/srv/storage/hthiery/sources/sa67/out-graphic=
/host/lib/cmake
> -Dkms=3Dtrue -Dwayland=3Dfalse -Dxcb=3Dfalse
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom/
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom//buildr=
oot-build
> The Meson build system
> Version: 1.7.0
> Source dir:
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom
> Build dir:
> /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-custom/buildro=
ot-build
> Build type: cross build
> Project name: vkmark
> Project version: 2025.01
> C compiler for the host machine:
> /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-gcc
> (gcc 14.2.0 "aarch64-linux-gcc.br_real (Buildroot
> 2021.11-12449-g1bef613319) 14.2.0")
> C linker for the host machine:
> /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-gcc
> ld.bfd 2.42
> C++ compiler for the host machine:
> /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-g++
> (gcc 14.2.0 "aarch64-linux-g++.br_real (Buildroot
> 2021.11-12449-g1bef613319) 14.2.0")
> C++ linker for the host machine:
> /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-g++
> ld.bfd 2.42
> C compiler for the build machine: /usr/bin/gcc (gcc 8.3.0 "gcc (Debian
> 8.3.0-6) 8.3.0")
> C linker for the build machine: /usr/bin/gcc ld.bfd 2.31.1
> C++ compiler for the build machine: /usr/bin/g++ (gcc 8.3.0 "g++ (Debian
> 8.3.0-6) 8.3.0")
> C++ linker for the build machine: /usr/bin/g++ ld.bfd 2.31.1
> Build machine cpu family: x86_64
> Build machine cpu: x86_64
> Host machine cpu family: aarch64
> Host machine cpu: cortex-a53
> Target machine cpu family: aarch64
> Target machine cpu: cortex-a53
> Found pkg-config: YES
> (/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/pkg-config) 2.3.0
> Build-time dependency vulkan found: YES 1.4.307
> Library dl found: YES
> Found pkg-config: YES
> (/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/pkgconf) 2.3.0
> Found CMake: /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/cmake
> (3.31.5)
> Run-time dependency glm found: YES 1.0.0
> Run-time dependency assimp found: YES 5.4.3
> Run-time dependency xcb found: NO (tried pkgconfig and cmake)
> Run-time dependency xcb-icccm found: NO (tried pkgconfig and cmake)
> Run-time dependency wayland-client found: NO (tried pkgconfig and cmake)
> Run-time dependency wayland-protocols found: NO (tried pkgconfig and cmak=
e)
> Run-time dependency wayland-scanner found: NO (tried pkgconfig and cmake)
> Run-time dependency libdrm found: YES 2.4.124
> Run-time dependency gbm found: YES 25.0.6
> Program python3 found: YES
> (/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/python3)
>
> ../out-graphic/build/vkmark-custom/src/meson.build:9:19: ERROR: File
> /usr/share/vulkan/registry/vk.xml does not exist
>
>
>
> Is the vk.xml file installed on your system in
> /usr/share/vulkan/registry/vk.xml? I think the problem is related to the
> vulkan.pc file that has a wrong prefix value set.
>

I did some more debugging on that failure and see that on another host it
builds just fine. It is not related to the vulkan.pc file, because on the
machine where the build successfully builds the content is the same. There
seems to be another problem. I did some more tests but cannot find the root
cause of the failure at the moment.

--
Heiko


>
> Can you confirm that?
>
> ---
> Heiko
>
>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>

--000000000000d3b6580636464273
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Alex,</div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Mi., 28.=
 Mai 2025 um 16:00=C2=A0Uhr schrieb Heiko Thiery &lt;<a href=3D"mailto:heik=
o.thiery@gmail.com">heiko.thiery@gmail.com</a>&gt;:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi Al=
ex,<div><br></div><div>thank you for these series.</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Mo., 3. M=C3=A4r=
z 2025 um 17:16=C2=A0Uhr schrieb Alex Benn=C3=A9e &lt;<a href=3D"mailto:ale=
x.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">We build from the re=
cent 2025.1 release although we need one commit<br>
from master to better handle the missing KHR_display extension.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br>
---<br>
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
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
3 +<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0...-handle-Vulkan-errors-during-probing.patch | 77 ++++++++++++++++++=
+<br>
=C2=A0package/vkmark/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 48 ++++++++++++<br>
=C2=A0package/vkmark/vkmark.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A0package/vkmark/<a href=3D"http://vkmark.mk" rel=3D"noreferrer" target=
=3D"_blank">vkmark.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 34 ++++++++<br>
=C2=A06 files changed, 166 insertions(+)<br>
=C2=A0create mode 100644 package/vkmark/0001-display-Properly-handle-Vulkan=
-errors-during-probing.patch<br>
=C2=A0create mode 100644 package/vkmark/Config.in<br>
=C2=A0create mode 100644 package/vkmark/vkmark.hash<br>
=C2=A0create mode 100644 package/vkmark/<a href=3D"http://vkmark.mk" rel=3D=
"noreferrer" target=3D"_blank">vkmark.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 1f04dd2a1e..03af6cb426 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -144,6 +144,9 @@ F:=C2=A0 package/liblog4c-localtime/<br>
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
index 30ba7c206a..7b9615efe6 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -338,6 +338,7 @@ comment &quot;Graphic applications&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/swaybg/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/tesseract-ocr/Config.in&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/tinifier/Config.in&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/vkmark/Config.in&quot;<br>
<br>
=C2=A0comment &quot;Graphic libraries&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cegui/Config.in&quot;<br>
diff --git a/package/vkmark/0001-display-Properly-handle-Vulkan-errors-duri=
ng-probing.patch b/package/vkmark/0001-display-Properly-handle-Vulkan-error=
s-during-probing.patch<br>
new file mode 100644<br>
index 0000000000..7e2e43a946<br>
--- /dev/null<br>
+++ b/package/vkmark/0001-display-Properly-handle-Vulkan-errors-during-prob=
ing.patch<br>
@@ -0,0 +1,77 @@<br>
+From adf1aa346d99d29ad2c5c945c3e4de5e0e3e12cb Mon Sep 17 00:00:00 2001<br>
+From: Alexandros Frantzis &lt;<a href=3D"mailto:alexandros.frantzis@collab=
ora.com" target=3D"_blank">alexandros.frantzis@collabora.com</a>&gt;<br>
+Date: Thu, 27 Feb 2025 14:33:49 +0200<br>
+Subject: [PATCH] display: Properly handle Vulkan errors during probing<br>
+<br>
+The vk::createInstance() function throws an exception on error,<br>
+so handle it instead of checking for a null return value.<br>
+<br>
+Signed-of-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
+Upstream: <a href=3D"https://github.com/vkmark/vkmark/commit/37d0a0d7fa6dc=
de6f62718d2115e8b76646bff23" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/vkmark/vkmark/commit/37d0a0d7fa6dcde6f62718d2115e8b76646bff23</a>=
<br>
+<br>
+---<br>
+ src/ws/display_window_system_plugin.cpp | 39 ++++++++++++-------------<br=
>
+ 1 file changed, 19 insertions(+), 20 deletions(-)<br>
+<br>
+diff --git a/src/ws/display_window_system_plugin.cpp b/src/ws/display_wind=
ow_system_plugin.cpp<br>
+index 523092b..fcbd949 100644<br>
+--- a/src/ws/display_window_system_plugin.cpp<br>
++++ b/src/ws/display_window_system_plugin.cpp<br>
+@@ -72,24 +72,22 @@ int vkmark_window_system_probe(Options const&amp; opti=
ons)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.setPApplicationInfo(&amp;app_info)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.setEnabledExtensionCount(exts.size())<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.setPpEnabledExtensionNames(exts.data())=
;<br>
+-=C2=A0 =C2=A0 auto vk_instance =3D ManagedResource&lt;vk::Instance&gt;{<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vk::createInstance(create_info),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [] (auto&amp; i) { i.destroy(); }};<br>
+-=C2=A0 =C2=A0 if (!vk_instance.raw)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VKMARK_WINDOW_SYSTEM_PROBE_BAD;<br>
+-<br>
+-=C2=A0 =C2=A0 auto physical_devices =3D vk_instance.raw.enumeratePhysical=
Devices();<br>
+-=C2=A0 =C2=A0 auto physical_device =3D options.use_device_with_uuid ?<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::find_if(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical_devices.begin(), physi=
cal_devices.end(),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&amp;options] (auto pd) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return static_cas=
t&lt;DeviceUUID&gt;(pd.getProperties().pipelineCacheUUID) =3D=3D<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opt=
ions.use_device_with_uuid; }) :<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 physical_devices.begin();<br>
+-<br>
+-=C2=A0 =C2=A0 if (physical_device !=3D physical_devices.end())<br>
++<br>
++=C2=A0 =C2=A0 try<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 try<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 auto vk_instance =3D ManagedResource&lt;vk::I=
nstance&gt;{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vk::createInstance(create_info)=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [] (auto&amp; i) { i.destroy();=
 }};<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 auto physical_devices =3D vk_instance.raw.enu=
meratePhysicalDevices();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 auto physical_device =3D options.use_device_w=
ith_uuid ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 std::find_if(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical_devices.=
begin(), physical_devices.end(),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&amp;options] (a=
uto pd) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn static_cast&lt;DeviceUUID&gt;(pd.getProperties().pipelineCacheUUID) =3D=
=3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 options.use_device_with_uuid; }) :<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical_devices.begin();<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (physical_device !=3D physical_devices.end=
())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto display_index =3D std=
::stoi(get_display_index_option(options));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (display_index &lt; 0)<=
br>
+@@ -97,10 +95,11 @@ int vkmark_window_system_probe(Options const&amp; opti=
ons)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DisplayNativeSystem::get_d=
isplay_surface_create_info(*physical_device, display_index);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return VKMARK_WINDOW_SYSTE=
M_PROBE_OK + VKMARK_DISPLAY_WINDOW_SYSTEM_PRIORITY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 catch (...)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 catch (...)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0return VKMARK_WINDOW_SYSTEM_PROBE_BAD;<br>
+ }<br>
+-- <br>
+2.39.5<br>
+<br>
diff --git a/package/vkmark/Config.in b/package/vkmark/Config.in<br>
new file mode 100644<br>
index 0000000000..032eb47dc9<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VULKAN_HEADERS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_VULKAN_LOADER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # vulkan-loader<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-l=
oader<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GLM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # assimp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # assim=
p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP # vulkan-loade=
r, glm, assimp, vkmark<br>
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
index 0000000000..2650f4ccd4<br>
--- /dev/null<br>
+++ b/package/vkmark/vkmark.hash<br>
@@ -0,0 +1,3 @@<br>
+# Locally computed<br>
+sha256=C2=A0 1ae362844344d0f9878b7a3f13005f77eae705108892a4e8abf237d452d37=
edc=C2=A0 vkmark-2025.01.tar.gz<br>
+sha256=C2=A0 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe=
551=C2=A0 COPYING-LGPL2.1<br>
diff --git a/package/vkmark/<a href=3D"http://vkmark.mk" rel=3D"noreferrer"=
 target=3D"_blank">vkmark.mk</a> b/package/vkmark/<a href=3D"http://vkmark.=
mk" rel=3D"noreferrer" target=3D"_blank">vkmark.mk</a><br>
new file mode 100644<br>
index 0000000000..7b721c6c99<br>
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
+VKMARK_VERSION =3D 2025.01<br>
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
2.39.5<br>
<br></blockquote><div><br></div><div><br></div><div><div>=C2=A0I tried to b=
uild vkmark but get this=C2=A0error:</div><div><br></div><div>&gt;&gt;&gt; =
vkmark custom Configuring<br>rm -rf /srv/storage/hthiery/sources/sa67/out-g=
raphic/build/vkmark-custom//buildroot-build<br>mkdir -p /srv/storage/hthier=
y/sources/sa67/out-graphic/build/vkmark-custom//buildroot-build<br>sed -e &=
quot;/^\[binaries\]$/s:$::&quot; -e &quot;/^\[properties\]$/s:$::&quot; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s%@TARGET_CC@%/srv/storage/hthiery/source=
s/sa67/out-graphic/host/bin/aarch64-linux-gcc%g&quot; -e &quot;s%@TARGET_CX=
X@%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-g++=
%g&quot; -e &quot;s%@TARGET_AR@%/srv/storage/hthiery/sources/sa67/out-graph=
ic/host/bin/aarch64-linux-gcc-ar%g&quot; -e &quot;s%@TARGET_FC@%/srv/storag=
e/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-gfortran%g&quot; =
-e &quot;s%@TARGET_STRIP@%/srv/storage/hthiery/sources/sa67/out-graphic/hos=
t/bin/aarch64-linux-strip%g&quot; -e &quot;s%@TARGET_ARCH@%aarch64%g&quot; =
-e &quot;s%@TARGET_CPU@%cortex-a53%g&quot; -e &quot;s%@TARGET_ENDIAN@%littl=
e%g&quot; -e &quot;s%@TARGET_FCFLAGS@%%g&quot; -e &quot;s%@TARGET_CFLAGS@%&=
#39;-D_LARGEFILE_SOURCE&#39;, &#39;-D_LARGEFILE64_SOURCE&#39;, &#39;-D_FILE=
_OFFSET_BITS=3D64&#39;, &#39;-O2&#39;, &#39;-g0&#39;, &#39;-D_FORTIFY_SOURC=
E=3D1&#39;%g&quot; -e &quot;s%@TARGET_LDFLAGS@%%g&quot; -e &quot;s%@TARGET_=
CXXFLAGS@%&#39;-D_LARGEFILE_SOURCE&#39;, &#39;-D_LARGEFILE64_SOURCE&#39;, &=
#39;-D_FILE_OFFSET_BITS=3D64&#39;, &#39;-O2&#39;, &#39;-g0&#39;, &#39;-D_FO=
RTIFY_SOURCE=3D1&#39;%g&quot; -e &quot;s%@BR2_CMAKE@%/srv/storage/hthiery/s=
ources/sa67/out-graphic/host/bin/cmake%g&quot; -e &quot;s%@PKGCONF_HOST_BIN=
ARY@%/srv/storage/hthiery/sources/sa67/out-graphic/host/bin/pkgconf%g&quot;=
 -e &quot;s%@HOST_DIR@%/srv/storage/hthiery/sources/sa67/out-graphic/host%g=
&quot; -e &quot;s%@STAGING_DIR@%/srv/storage/hthiery/sources/sa67/out-graph=
ic/host/aarch64-buildroot-linux-gnu/sysroot%g&quot; -e &quot;s%@STATIC@%fal=
se%g&quot; /srv/storage/hthiery/sources/sa67/buildroot/support/misc/<a href=
=3D"http://cross-compilation.conf.in" target=3D"_blank">cross-compilation.c=
onf.in</a> &gt; /srv/storage/hthiery/sources/sa67/out-graphic/build/vkmark-=
custom//buildroot-build/cross-compilation.conf<br>PATH=3D&quot;/srv/storage=
/hthiery/sources/sa67/out-graphic/host/bin:/srv/storage/hthiery/sources/sa6=
7/out-graphic/host/sbin:/home/hthiery/.local/bin:/home/hthiery/bin:/usr/loc=
al/bin:/usr/bin:/bin:/usr/local/games:/usr/games&quot; CC_FOR_BUILD=3D&quot=
;/usr/bin/gcc&quot; CXX_FOR_BUILD=3D&quot;/usr/bin/g++&quot; =C2=A0PYTHONNO=
USERSITE=3Dy /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/meson s=
etup --prefix=3D/usr --libdir=3Dlib --default-library=3Dshared --buildtype=
=3Drelease --cross-file=3D/srv/storage/hthiery/sources/sa67/out-graphic/bui=
ld/vkmark-custom//buildroot-build/cross-compilation.conf -Db_pie=3Dfalse -D=
b_staticpic=3Dtrue -Dstrip=3Dfalse -Dbuild.pkg_config_path=3D/srv/storage/h=
thiery/sources/sa67/out-graphic/host/lib/pkgconfig -Dbuild.cmake_prefix_pat=
h=3D/srv/storage/hthiery/sources/sa67/out-graphic/host/lib/cmake -Dkms=3Dtr=
ue -Dwayland=3Dfalse -Dxcb=3Dfalse /srv/storage/hthiery/sources/sa67/out-gr=
aphic/build/vkmark-custom/ /srv/storage/hthiery/sources/sa67/out-graphic/bu=
ild/vkmark-custom//buildroot-build<br>The Meson build system<br>Version: 1.=
7.0<br>Source dir: /srv/storage/hthiery/sources/sa67/out-graphic/build/vkma=
rk-custom<br>Build dir: /srv/storage/hthiery/sources/sa67/out-graphic/build=
/vkmark-custom/buildroot-build<br>Build type: cross build<br>Project name: =
vkmark<br>Project version: 2025.01<br>C compiler for the host machine: /srv=
/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-gcc (gcc 1=
4.2.0 &quot;aarch64-linux-gcc.br_real (Buildroot 2021.11-12449-g1bef613319)=
 14.2.0&quot;)<br>C linker for the host machine: /srv/storage/hthiery/sourc=
es/sa67/out-graphic/host/bin/aarch64-linux-gcc ld.bfd 2.42<br>C++ compiler =
for the host machine: /srv/storage/hthiery/sources/sa67/out-graphic/host/bi=
n/aarch64-linux-g++ (gcc 14.2.0 &quot;aarch64-linux-g++.br_real (Buildroot =
2021.11-12449-g1bef613319) 14.2.0&quot;)<br>C++ linker for the host machine=
: /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/aarch64-linux-g++ =
ld.bfd 2.42<br>C compiler for the build machine: /usr/bin/gcc (gcc 8.3.0 &q=
uot;gcc (Debian 8.3.0-6) 8.3.0&quot;)<br>C linker for the build machine: /u=
sr/bin/gcc ld.bfd 2.31.1<br>C++ compiler for the build machine: /usr/bin/g+=
+ (gcc 8.3.0 &quot;g++ (Debian 8.3.0-6) 8.3.0&quot;)<br>C++ linker for the =
build machine: /usr/bin/g++ ld.bfd 2.31.1<br>Build machine cpu family: x86_=
64<br>Build machine cpu: x86_64<br>Host machine cpu family: aarch64<br>Host=
 machine cpu: cortex-a53<br>Target machine cpu family: aarch64<br>Target ma=
chine cpu: cortex-a53<br>Found pkg-config: YES (/srv/storage/hthiery/source=
s/sa67/out-graphic/host/bin/pkg-config) 2.3.0<br>Build-time dependency vulk=
an found: YES 1.4.307<br>Library dl found: YES<br>Found pkg-config: YES (/s=
rv/storage/hthiery/sources/sa67/out-graphic/host/bin/pkgconf) 2.3.0<br>Foun=
d CMake: /srv/storage/hthiery/sources/sa67/out-graphic/host/bin/cmake (3.31=
.5)<br>Run-time dependency glm found: YES 1.0.0<br>Run-time dependency assi=
mp found: YES 5.4.3<br>Run-time dependency xcb found: NO (tried pkgconfig a=
nd cmake)<br>Run-time dependency xcb-icccm found: NO (tried pkgconfig and c=
make)<br>Run-time dependency wayland-client found: NO (tried pkgconfig and =
cmake)<br>Run-time dependency wayland-protocols found: NO (tried pkgconfig =
and cmake)<br>Run-time dependency wayland-scanner found: NO (tried pkgconfi=
g and cmake)<br>Run-time dependency libdrm found: YES 2.4.124<br>Run-time d=
ependency gbm found: YES 25.0.6<br>Program python3 found: YES (/srv/storage=
/hthiery/sources/sa67/out-graphic/host/bin/python3)<br><br>../out-graphic/b=
uild/vkmark-custom/src/meson.build:9:19: ERROR: File /usr/share/vulkan/regi=
stry/vk.xml does not exist</div><div><br></div><div><br></div><div><br></di=
v><div>Is the vk.xml file installed on your system in /usr/share/vulkan/reg=
istry/vk.xml? I think=C2=A0the problem is related to the vulkan.pc file tha=
t has a wrong prefix value set.</div></div></div></div></blockquote><div><b=
r></div><div>I did some more debugging on that failure and see that on anot=
her host it builds just fine. It is not related to the vulkan.pc file, beca=
use on the machine where the build successfully builds the content is the s=
ame. There seems to be another problem. I did some more tests but cannot fi=
nd the root cause of the failure at the moment.</div><div><br></div><div>--=
</div><div>Heiko</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div><br></d=
iv><div>Can you confirm that?</div><div><br></div><div>---</div><div>Heiko<=
/div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000d3b6580636464273--

--===============7245248248209442271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7245248248209442271==--
