Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A659C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1766541635;
	Tue, 15 Mar 2022 21:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGrtZVDCKFNm; Tue, 15 Mar 2022 21:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F07A7415BA;
	Tue, 15 Mar 2022 21:47:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1E61BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88E71404EB
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1VWtTsV4hAb for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:47:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 016B940154
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:47:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w25so483360edi.11
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dh3cR1AMH+NgbQZxZ85/Djr+1vaTk64E8DlxDRN2Fyo=;
 b=IYFWKD0wKFgjI6RL+oLcj0C6cR4l55gBhgspHhxbXXJldhg2DNWrtmnl+z6Kks1FIn
 Lu1jrhV1AQp6dYejymgiVdfsNmdwB04mGHXSHYXgyVtSwSQOL+Drw+V9C0DsXB0U23m4
 W0nWWPdfwQlK+fKnVaKvW3WEw9Hy5O8E37ivUKvfhyU+ciew4qieuC0DX1QOVef9Ukto
 DZP4/Z1p1I0MOXAFbTkYbYq920TC8HL8xZ2gwuTjjoT2hGIi02UiCtoJGnZ2C6Ucgwwk
 zkGBG9u7wud7BL2ZRhCwErLT/h24u1Y/M0Ev/e4J/XnjBh8URze5dfxbmI663qXMxCBD
 VB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dh3cR1AMH+NgbQZxZ85/Djr+1vaTk64E8DlxDRN2Fyo=;
 b=IcwWo2gp1Ue20JxG0LZYLthBK2dnL50ux8p4ePuzW+i8FaijTFO3v1mAxWm3hasCw5
 Vvr4z+LX2S6r7F2atA4esdHd+FqPMHTCqQ4OYoOrgUJU28VEUW7U/5FzZwCgpTpUffZb
 zk0eTC0cnUZFF4xanvTpUq1vcCJn5jj965yOOTspFxJJLTT108WYVLBW5y6RXCxfRDiI
 kSetReUCxokipqbUuNMpnWQup0ZXh26dzocxtngPZ/U+bWtXYPcupaHitsHV1Ofu8CO5
 Hfl+ft0z5bxlPYsyICAu5Aue1kcJW/8M9UgE/LXtKbDSpbNq3UQ1V2ylMlD21okCr6kR
 XrJg==
X-Gm-Message-State: AOAM532onsQNq7FQ0TSihcddYZzKkenJ+oxct6bFtCn/jFzNV28Pop7V
 q8PcKwI0tIMCJ9GkvX5s0PZ1mQ==
X-Google-Smtp-Source: ABdhPJzMUNWRimrYbQkiQ6mQo2V/+NV+I8OIyylx8MmOr8GshALR2OMLdiblPE6tbalIEO5LP7sY0Q==
X-Received: by 2002:a05:6402:2812:b0:416:46ab:818c with SMTP id
 h18-20020a056402281200b0041646ab818cmr26908557ede.258.1647380832082; 
 Tue, 15 Mar 2022 14:47:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056402440e00b00416046b623csm99689eda.2.2022.03.15.14.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:47:11 -0700 (PDT)
Message-ID: <0fc0da93-ce87-7965-be20-f197d0825cbe@mind.be>
Date: Tue, 15 Mar 2022 22:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, buildroot@buildroot.org
References: <20220309132835.7251-1-abrodkin@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220309132835.7251-1-abrodkin@synopsys.com>
Subject: Re: [Buildroot] [PATCH] qt5: enable JS and WebKit for ARC
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/03/2022 14:28, Alexey Brodkin via buildroot wrote:
> This patch adds support of ARC architecture in Qt's JS core and Webkit.
> The change itself is quite straight-forward:
> 
>   1. Enable JS core for ARC
>   2. Make sure so-called "large memory model" is used,
>      i.e. relocations with long jumps are being generated for global
>      symbols, as otherwise insanely huge libqt5webkit.so fails to link
>      because some symbols might be more than 32 MiB away from each other.
>   3. Make the original WebKit build system aware of yet another CPU
>      architecture with explicitly disabled JIT in JS core for ARC.
> 
> Obviously, this one depends on [1].
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20220221140628.2295-1-abrodkin@synopsys.com/
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> ---
>   package/qt5/Config.in                         |  2 +-
>   package/qt5/qt5base/qt5base.mk                | 13 +++
>   .../0005-Add-support-for-ARC-processors.patch | 93 +++++++++++++++++++
>   3 files changed, 107 insertions(+), 1 deletion(-)
>   create mode 100644 package/qt5/qt5webkit/0005-Add-support-for-ARC-processors.patch
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index f2b1ff4a19..cbb2e06a21 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>   	bool
>   	default y
>   	# Javascript engine is only available on certain architectures
> -	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel
> +	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel || BR2_arc
>   	# ARM needs BLX, so v5t+
>   	depends on !BR2_ARM_CPU_ARMV4
>   
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index ef38d03253..b25e0f44b6 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -201,6 +201,19 @@ endif
>   QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
>   QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
>   
> +ifeq ($(BR2_arc),y)
> +# In case of -Os (which is default in BR) gcc will use millicode implementation
> +# from libgcc. That along with performance degradation may lead to issues during
> +# linkage stage. In case of QtWebkit exactly that happens - millicode functions
> +# get put way too far from caller functions and so linker fails.
> +# To solve that problem we explicitly disable millicode call generation for Qt.
> +# Also due to some Qt5 libs being really huge (the best example is QtWebKit)
> +# it's good to firce compiler to not assume short or even medium-length calls
> +# could be used. I.e. always use long jump instaructions.
> +# Otherwise there's a high risk of hitting link-time failures.
> +QT5BASE_CFLAGS += -mno-millicode -mlong-calls
> +endif
> +
>   ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
>   QT5BASE_CONFIGURE_OPTS += -eglfs
>   QT5BASE_DEPENDENCIES   += libegl
> diff --git a/package/qt5/qt5webkit/0005-Add-support-for-ARC-processors.patch b/package/qt5/qt5webkit/0005-Add-support-for-ARC-processors.patch
> new file mode 100644
> index 0000000000..92f023eab6
> --- /dev/null
> +++ b/package/qt5/qt5webkit/0005-Add-support-for-ARC-processors.patch
> @@ -0,0 +1,93 @@
> +From 8da574cf8f30f69e47f76705aa2eb07000540aeb Mon Sep 17 00:00:00 2001
> +From: Alexey Brodkin <abrodkin@synopsys.com>
> +Date: Mon, 21 Feb 2022 18:28:00 +0300
> +Subject: [PATCH] Add support for ARC processors
> +
> +Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

  Upstream status of this patch?

  Anyway, applied to master, thanks.

  Regards,
  Arnout

> +---
> + CMakeLists.txt                       | 4 +++-
> + Source/JavaScriptCore/CMakeLists.txt | 3 ++-
> + Source/WTF/wtf/Platform.h            | 8 ++++++++
> + Source/WTF/wtf/dtoa/utils.h          | 2 +-
> + Source/cmake/OptionsQt.cmake         | 4 ++++
> + 5 files changed, 18 insertions(+), 3 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 31a2ea1fd..f0dfbda5b 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -57,7 +57,9 @@ if (MSVC_CXX_ARCHITECTURE_ID)
> + else ()
> +     string(TOLOWER ${CMAKE_SYSTEM_PROCESSOR} LOWERCASE_CMAKE_SYSTEM_PROCESSOR)
> + endif ()
> +-if (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
> ++if (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^arc")
> ++    set(WTF_CPU_ARC 1)
> ++elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
> +     set(WTF_CPU_ARM 1)
> + elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^aarch64")
> +     set(WTF_CPU_ARM64 1)
> +diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
> +index 937b3ed00..205dde288 100644
> +--- a/Source/JavaScriptCore/CMakeLists.txt
> ++++ b/Source/JavaScriptCore/CMakeLists.txt
> +@@ -1275,7 +1275,8 @@ if (ENABLE_WEB_REPLAY)
> +     list(APPEND JavaScriptCore_HEADERS ${DERIVED_SOURCES_JAVASCRIPTCORE_DIR}/JSReplayInputs.h)
> + endif ()
> +
> +-if (WTF_CPU_ARM)
> ++if (WTF_CPU_ARC)
> ++elseif (WTF_CPU_ARM)
> + elseif (WTF_CPU_ARM64)
> + elseif (WTF_CPU_ALPHA)
> + elseif (WTF_CPU_HPPA)
> +diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
> +index 5717f3ea1..b327ed693 100644
> +--- a/Source/WTF/wtf/Platform.h
> ++++ b/Source/WTF/wtf/Platform.h
> +@@ -349,6 +349,14 @@
> +
> + #endif /* ARM */
> +
> ++/* CPU(ARC) - ARC */
> ++#if defined(__arc__)
> ++#define WTF_CPU_ARC 1
> ++#if defined(__BIG_ENDIAN__)
> ++#define WTF_CPU_BIG_ENDIAN 1
> ++#endif
> ++#endif
> ++
> + #if CPU(ARM) || CPU(MIPS) || CPU(SH4) || CPU(ALPHA) || CPU(HPPA)
> + #define WTF_CPU_NEEDS_ALIGNED_ACCESS 1
> + #endif
> +diff --git a/Source/WTF/wtf/dtoa/utils.h b/Source/WTF/wtf/dtoa/utils.h
> +index 889642cee..8f1e9933e 100644
> +--- a/Source/WTF/wtf/dtoa/utils.h
> ++++ b/Source/WTF/wtf/dtoa/utils.h
> +@@ -49,7 +49,7 @@
> + defined(__ARMEL__) || \
> + defined(_MIPS_ARCH_MIPS32R2)
> + #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
> +-#elif CPU(MIPS) || CPU(MIPS64) || CPU(PPC) || CPU(PPC64) || CPU(PPC64LE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(ALPHA) || CPU(ARM64) || CPU(HPPA)
> ++#elif CPU(MIPS) || CPU(MIPS64) || CPU(PPC) || CPU(PPC64) || CPU(PPC64LE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(ALPHA) || CPU(ARM64) || CPU(HPPA) || CPU(ARC)
> + #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
> + #elif defined(_M_IX86) || defined(__i386__)
> + #if defined(_WIN32)
> +diff --git a/Source/cmake/OptionsQt.cmake b/Source/cmake/OptionsQt.cmake
> +index ec6081de0..e1a5efc1e 100644
> +--- a/Source/cmake/OptionsQt.cmake
> ++++ b/Source/cmake/OptionsQt.cmake
> +@@ -365,6 +365,10 @@ if (MINGW AND CMAKE_SIZEOF_VOID_P EQUAL 8)
> +     WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_JIT PRIVATE OFF)
> + endif ()
> +
> ++if (WTF_CPU_ARC)
> ++    WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_JIT PRIVATE OFF)
> ++endif ()
> ++
> + WEBKIT_OPTION_CONFLICT(USE_GSTREAMER USE_QT_MULTIMEDIA)
> + WEBKIT_OPTION_CONFLICT(USE_GSTREAMER USE_MEDIA_FOUNDATION)
> + WEBKIT_OPTION_CONFLICT(USE_QT_MULTIMEDIA USE_MEDIA_FOUNDATION)
> +--
> +2.25.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
