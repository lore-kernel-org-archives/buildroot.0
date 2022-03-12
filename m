Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E99CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9C9681DAB;
	Sat, 12 Mar 2022 16:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fx5iin31VAUi; Sat, 12 Mar 2022 16:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3FDE823A0;
	Sat, 12 Mar 2022 16:56:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BC461BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89CC7410E1
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKxo9W5yXdOR for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:56:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01299410D0
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:56:20 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b15so10416137edn.4
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 08:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RsW/HL9tRJjIevWkD0lYs2TSccRFWFVlvsM9lxXQnNE=;
 b=Ws7I6jGV6XXwFm7Cm0KYE1cGowExZBae5c78G5Zfhce6GOFhV3c9ytAug2CklsHXTu
 4TXaNYXfHETIn6/mfecNJUaaFFuhpMZOsHTF8acCr1H3bJ4SwzNxCa86z8EqljUCgdCl
 eX+0LwoeYw5Jpxra94MSZBduFABd4Oq5jpvnpAWdJic+yQ5DR3+IrDDiQQ3MZraFrigo
 UujZODLVv1IlJbyZWiiks6RoS7l/+FmfXOW8fFb/gmUdIiHsFV7To+hbhrPoeThieMSS
 6TjMHPRv2bU7qhh3qPM/UTh6h7Hecv6Rlz1fM4OP/os5W6sRa+byr8hFX1nTiHKL3hPo
 /QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RsW/HL9tRJjIevWkD0lYs2TSccRFWFVlvsM9lxXQnNE=;
 b=5vRpWBuY/flnhGw0eLKkHtpulX9U8hr5yS3BZ7xWbq5KVrBravogcyUS+mlSsZ5J5h
 1DQconyNm23KH12oCO2s6BTK5brdRyNbNeFwDqugYDL+Ejkgj+b+umq01APZcbpvLeXD
 t5sh48EjWpK8DAL1/2GubrhEjcbIwtOMf0P4suftOuyHqf9gGzNvHYh0ProDqoFnHI8G
 UFZaoAoI7rdA5ZD360aFn3E657Vs9DrFvdAgilXit6NQOaspvvQoBpA3RVg+opUpnYMh
 6Uzpznwqz6e8a42Frf98zv1Mi4nT3dhDonTSbiS6tljw86WWdfwzVfErZEhy+kFEYv0A
 oAag==
X-Gm-Message-State: AOAM530XMTQOYG4j9DznH7fBJhnApevkqbAU2Vg+WWOHnA+wUAGSrZQv
 6/XWaSrL7Ii4XKQtlHdrgXRPSA==
X-Google-Smtp-Source: ABdhPJxdyqmeBX0/wrQadUE+Hqtm4WXk7Xj8KLqrqDnrmaStsrV7B21bbUTewfaZxDSYte4HGx3KYQ==
X-Received: by 2002:a05:6402:4c6:b0:410:b8e5:334 with SMTP id
 n6-20020a05640204c600b00410b8e50334mr13497661edw.321.1647104179110; 
 Sat, 12 Mar 2022 08:56:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 bc14-20020a056402204e00b004186d45f8b2sm702097edb.43.2022.03.12.08.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 08:56:18 -0800 (PST)
Message-ID: <314366e5-64bd-57ea-284c-a21374d0bb91@mind.be>
Date: Sat, 12 Mar 2022 17:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220217183553.210835-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220217183553.210835-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH/next 1/2] package/intel-mediadriver: bump
 version to 22.2.1
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/02/2022 19:35, Bernd Kuhls wrote:
> Removed patch which was applied upstream:
> https://github.com/intel/media-driver/commit/8eab97af6e1c41fc7b9d72999ecb1c22d9e52db6
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...001-Add-MEDIA-BUILD-HARDENING-option.patch | 106 ------------------
>   .../intel-mediadriver/intel-mediadriver.hash  |   2 +-
>   .../intel-mediadriver/intel-mediadriver.mk    |   2 +-
>   3 files changed, 2 insertions(+), 108 deletions(-)
>   delete mode 100644 package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch
> 
> diff --git a/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch b/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch
> deleted file mode 100644
> index 968445759a..0000000000
> --- a/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -From 103c00c8d74a1cd87686850212bd93c0e4d59fc9 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Wed, 11 Aug 2021 21:34:59 +0200
> -Subject: [PATCH] Add MEDIA_BUILD_HARDENING option
> -
> -Add MEDIA_BUILD_HARDENING option to allow the user to disable hardening
> -options such as stack-protector-all or FORTIFY SOURCE 2 which are not
> -always available (e.g. fortify source 2 is only available on glibc >= 6
> -and not musl/uclibc-ng)
> -
> -Patch sent upstream: https://github.com/intel/media-driver/pull/1242
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -[Bernd: rebased for version 21.4.1]
> ----
> - cmrtlib/linux/CMakeLists.txt                       | 14 ++++++++++----
> - .../cmake/linux/media_compile_flags_linux.cmake    | 12 ++++++++++--
> - media_driver/media_top_cmake.cmake                 |  8 +++++++-
> - 3 files changed, 27 insertions(+), 7 deletions(-)
> -
> -diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
> -index 65f71ceef..b066138d9 100644
> ---- a/cmrtlib/linux/CMakeLists.txt
> -+++ b/cmrtlib/linux/CMakeLists.txt
> -@@ -32,12 +32,18 @@ else()
> - endif()
> -
> - # Set up compile options that will be used for the Linux build
> --set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all")
> --set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
> -+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive")
> -+set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing")
> - set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
> --set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all")
> --set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
> -+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive")
> -+set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
> - set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
> -+if(MEDIA_BUILD_HARDENING)
> -+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS} -fstack-protector-all")
> -+    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -D_FORTIFY_SOURCE=2")
> -+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS} -fstack-protector-all")
> -+    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -D_FORTIFY_SOURCE=2")
> -+endif()
> - if(MEDIA_BUILD_FATAL_WARNINGS)
> -     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS} -Werror")
> -     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS} -Werror")
> -diff --git a/media_driver/cmake/linux/media_compile_flags_linux.cmake b/media_driver/cmake/linux/media_compile_flags_linux.cmake
> -index 7a2bd64b6..98896b131 100755
> ---- a/media_driver/cmake/linux/media_compile_flags_linux.cmake
> -+++ b/media_driver/cmake/linux/media_compile_flags_linux.cmake
> -@@ -47,7 +47,6 @@ set(MEDIA_COMPILER_FLAGS_COMMON
> -     # Other common flags
> -     -fmessage-length=0
> -     -fvisibility=hidden
> --    -fstack-protector
> -     -fdata-sections
> -     -ffunction-sections
> -     -Wl,--gc-sections
> -@@ -64,6 +63,11 @@ set(MEDIA_COMPILER_FLAGS_COMMON
> -     -g
> - )
> -
> -+if(MEDIA_BUILD_HARDENING)
> -+    set(MEDIA_COMPILER_FLAGS_COMMON
> -+        ${MEDIA_COMPILER_FLAGS_COMMON}
> -+        -fstack-protector)
> -+endif()
> -
> - if(${UFO_MARCH} STREQUAL "slm")
> -     set(MEDIA_COMPILER_FLAGS_COMMON
> -@@ -119,9 +123,13 @@ if(${UFO_VARIANT} STREQUAL "default")
> -     set(MEDIA_COMPILER_FLAGS_RELEASE
> -         ${MEDIA_COMPILER_FLAGS_RELEASE}
> -         -O2
> --        -D_FORTIFY_SOURCE=2
> -         -fno-omit-frame-pointer
> -     )
> -+    if(MEDIA_BUILD_HARDENING)
> -+        set(MEDIA_COMPILER_FLAGS_RELEASE
> -+            ${MEDIA_COMPILER_FLAGS_RELEASE}
> -+            -D_FORTIFY_SOURCE=2)
> -+    endif()
> - endif()
> -
> - if(NOT ${PLATFORM} STREQUAL "android")
> -diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
> -index f089ea45f..b0b428914 100755
> ---- a/media_driver/media_top_cmake.cmake
> -+++ b/media_driver/media_top_cmake.cmake
> -@@ -113,7 +113,13 @@ if(MEDIA_BUILD_FATAL_WARNINGS)
> -     set_target_properties(${LIB_NAME_OBJ} PROPERTIES COMPILE_FLAGS "-Werror")
> - endif()
> -
> --set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS "-Wl,--no-as-needed -Wl,--gc-sections -z relro -z now -fstack-protector -fPIC")
> -+set(MEDIA_LINK_FLAGS "-Wl,--no-as-needed -Wl,--gc-sections -z relro -z now -fPIC")
> -+option(MEDIA_BUILD_HARDENING "Enable hardening (stack-protector, fortify source)" ON)
> -+if(MEDIA_BUILD_HARDENING)
> -+    set(MEDIA_LINK_FLAGS "${MEDIA_LINK_FLAGS} -fstack-protector")
> -+endif()
> -+set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS ${MEDIA_LINK_FLAGS})
> -+
> - set_target_properties(${LIB_NAME}        PROPERTIES PREFIX "")
> - set_target_properties(${LIB_NAME_STATIC} PROPERTIES PREFIX "")
> -
> diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
> index ceafa20e80..7c615620ae 100644
> --- a/package/intel-mediadriver/intel-mediadriver.hash
> +++ b/package/intel-mediadriver/intel-mediadriver.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  6eaa4a9caf58faa8934b253adb4b0ece1c7d5de6f084167d5138b4e3ba423683  intel-media-22.1.1.tar.gz
> +sha256  1a0277306d7bb3a1e20c7693ff090fa4ae5c0b68981aa13452ed1c6df9062854  intel-media-22.2.1.tar.gz
>   sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
> diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
> index d8820379e7..4895c1535d 100644
> --- a/package/intel-mediadriver/intel-mediadriver.mk
> +++ b/package/intel-mediadriver/intel-mediadriver.mk
> @@ -6,7 +6,7 @@
>   
>   # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
>   
> -INTEL_MEDIADRIVER_VERSION = 22.1.1
> +INTEL_MEDIADRIVER_VERSION = 22.2.1
>   INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
>   INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
>   INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
