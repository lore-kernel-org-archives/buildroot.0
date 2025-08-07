Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885B5C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CF944054D;
	Thu,  7 Aug 2025 18:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3650Fx1-1tkj; Thu,  7 Aug 2025 18:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03A3740564
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A3740564;
	Thu,  7 Aug 2025 18:24:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9B7710A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C33060642
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZSxN2EWu49E for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 699A660604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 699A660604
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 699A660604
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b8de6f7556so749946f8f.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591037; x=1755195837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4MUbk8c4RQ7fHNgS623xG3vn44aRqYFl3NIrnajeq0=;
 b=QSNV+d9TX5jS/Nxagtf9nDmkB0BFuZjVad0y+SGcwQbt1/hgYzQ7Kz0CydcwCwTR6T
 mTzELxMXnswuBsnrlEduUT1f+3fzjHuHE1dl7auENXsK7btbC2FYP2NweaaCk3RuCZUO
 IdbHu1x36ICRVfI7ks3DRgdcs5oMlradLZ/6AyqymFz8FpWiUzFOzNip2rGlpPhtsoW7
 13hSWbeuKeJ6MAp2It+gh6DEiEh5oKLtHXuKJRjDYnNsMhjosM9li3nTbeGt9OQtUqmz
 pWx62EY8V9Bi92hv3MixXwoks0HPbX2GP+n3rmup9knYqyhXQ6LJAgBeLlYb9XVRDDhC
 U+dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwN9CKBlwbtj5bdcePOybKwU6KTMAk7/E6SV1rB/wt8WU9SFWjSIlmSGTc6QDGoUwGJl9Gx4VTn5w=@buildroot.org
X-Gm-Message-State: AOJu0YztxFcOO61/r3vsG8BPZEEU+98Sx0S8gK+DE9tVN34Rs+yXF3Po
 3a1qVBsgOfuejcTI5G+YZp3mg0s/j7W1Cpqh6rXFn7pDj7jSPu33aU1WS8H0UndJJDg=
X-Gm-Gg: ASbGncu95O+JxvjMod8Q/UKd93nrkkYBPKPmu6kG7A+/VNQ9y1WFInP6NGN9PI9lDAY
 zs2PJb4Yx+pKxUckO1VUTXyAh0nudBP6PMKk8JhxU3wYSB7Jw5zyHUGNpiyXwV3f/IA3woSZKKy
 qax3S28KR40p7UmgvvxqbFGeKV6SFVMleQKXHoRVQWHxK2jY59Pcxk14/ldtw2NsfwG3Fpw8/zf
 drqEanf5r4zfW5fXW02TeM4KxxY8KzohqlVgSDY9v6v34zrKIcBkXs6O1PAlXBOOtoS3K7zljLn
 5vAtT3JIXsCbfLT2stduVOMc5D8TSNppfoowJTqs9f6xAKPnRR0O3rdw+w4WEtuOTDVGEGFiFhD
 KqlUDlyOivMv0IQ==
X-Google-Smtp-Source: AGHT+IGUh6wH0IEwBBaVHkdRstA1tDvkuyHJZ9OoSQbgvMJfZrciUCqLnK3ugZVm9a9Hyhzdd6/ZZA==
X-Received: by 2002:a05:6000:2dc2:b0:3b8:d16a:a4b1 with SMTP id
 ffacd0b85a97d-3b900b56018mr176949f8f.58.1754591037329; 
 Thu, 07 Aug 2025 11:23:57 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0683045sm18263770f8f.41.2025.08.07.11.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:57 -0700 (PDT)
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:56 +0200
Message-ID: <20250807182356.723921-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250708215011.1213438-1-aperez@igalia.com>
References: <20250708215011.1213438-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591037; x=1755195837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4MUbk8c4RQ7fHNgS623xG3vn44aRqYFl3NIrnajeq0=;
 b=SGQaY0hS4OT9u6WcovdEAcvr1s4nB/40ImXHWEPsutZupAf+9oYj3+U3A5YlRR6AG0
 ODeM/mT5Jj3mvuglM7wkvL7naL5IlzFP7cBsJwNCJGqNg5vLEztZ6kD6tdL0Tl8B3+G3
 U7m/ySqMUhhe39D3tFDahrqcjfODAN4qQaUQ9wRI84nKm1IwWctTzg8P7ZWw8Sd9R3Hg
 CzD6y20awt5fvmBNN82+kf/fHIlS4AkFxJ3WVVnIMX31iw4eDea96zX0rmzCPHly47cM
 rkmVOx/fRr8DnKp1VxjKlFHN7VaqOLXedt9TVaz9ySmfBon+gyLIJn3d9bI8mW3j2Lr8
 z6Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SGQaY0hS
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.48.3
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This bumps WPE WebKit to the 2.48 stable series, skipping over 2.46.
> 
> WPE WebKit 2.48 and 2.46 highlights:
> 
> - https://wpewebkit.org/blog/2025-04-11-wpewebkit-2.48.html
> - https://wpewebkit.org/blog/2024-wpewebkit-2.46.html
> 
> Release notes:
> 
> - https://wpewebkit.org/release/wpewebkit-2.48.3.html
> - https://wpewebkit.org/release/wpewebkit-2.48.2.html
> - https://wpewebkit.org/release/wpewebkit-2.48.1.html
> - https://wpewebkit.org/release/wpewebkit-2.48.0.html
> - https://wpewebkit.org/release/wpewebkit-2.46.7.html
> - https://wpewebkit.org/release/wpewebkit-2.46.6.html
> - https://wpewebkit.org/release/wpewebkit-2.46.5.html
> - https://wpewebkit.org/release/wpewebkit-2.46.4.html
> - https://wpewebkit.org/release/wpewebkit-2.46.3.html
> - https://wpewebkit.org/release/wpewebkit-2.46.2.html
> - https://wpewebkit.org/release/wpewebkit-2.46.1.html
> - https://wpewebkit.org/release/wpewebkit-2.46.0.html
> 
> Fixes the following security issues:
> 
> - From https://wpewebkit.org/security/WSA-2025-0004.html
>   CVE-2025-24223, CVE-2025-31204, CVE-2025-31205, CVE-2025-31206,
>   CVE-2025-31215, CVE-2025-31257
> 
> - From https://wpewebkit.org/security/WSA-2025-0003.html
>   CVE-2024-54551, CVE-2025-24208, CVE-2025-24209, CVE-2025-24213,
>   CVE-2025-24216, CVE-2025-24264, CVE-2025-30427
> 
> - From https://wpewebkit.org/security/WSA-2025-0002.html
>   CVE-2024-44192, CVE-2024-54467, CVE-2025-24201
> 
> - From https://wpewebkit.org/security/WSA-2025-0001.html
>   CVE-2024-27856, CVE-2024-54543, CVE-2024-54658, CVE-2025-24143,
>   CVE-2025-24150, CVE-2025-24158, CVE-2025-24162
> 
> - From https://wpewebkit.org/security/WSA-2024-0008.html
>   CVE-2024-54479, CVE-2024-54502, CVE-2024-54505, CVE-2024-54508,
>   CVE-2024-54534
> 
> - From https://wpewebkit.org/security/WSA-2024-0007.html
>   CVE-2024-44308, CVE-2024-44309
> 
> - From https://wpewebkit.org/security/WSA-2024-0006.html
>   CVE-2024-44185, CVE-2024-44244, CVE-2024-44296
> 
> - From https://wpewebkit.org/security/WSA-2024-0005.html
>   CVE-2024-40866, CVE-2024-44187
> 
> As for build system changes, the minimum GCC requirement gets raised to
> version 11 [1], the ENABLE_SPEECH_SYNTHESIS option is now enabled by
> default [2] and needs handling, and Skia (bundled with the sources) is
> now preferred on little-endian targets.
> 
> [1] https://github.com/WebKit/WebKit/commit/682ac4ba74c53d0cd488c7a595096224a9abb036
> [2] https://github.com/WebKit/WebKit/commit/10381a8de938024f31935184af470ccbce0b22d9
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...d-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch | 44 +++++++++++++++++++
>  package/wpewebkit/Config.in                   | 11 ++---
>  package/wpewebkit/wpewebkit.hash              |  8 ++--
>  package/wpewebkit/wpewebkit.mk                | 27 +++++++++++-
>  4 files changed, 79 insertions(+), 11 deletions(-)
>  create mode 100644 package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch
> 
> diff --git a/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch b/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch
> new file mode 100644
> index 0000000000..8432543e07
> --- /dev/null
> +++ b/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch
> @@ -0,0 +1,44 @@
> +From 94acd1ce0ff2860b19f22ab2d386d7711c9699b7 Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Tue, 8 Jul 2025 21:46:44 +0300
> +Subject: [PATCH] [WPE] Fix the build with USE_SKIA_OPENTYPE_SVG=ON and
> + USE_SYSPROF_CAPTURE=OFF
> +
> +Unreviewed build fix.
> +
> +When backporting 287859@main the #include for the needed Skia header
> +slipped inside an USE(SYSPROF_CAPTURE) guard. This moves the guards
> +and #include statements to their correct places.
> +
> +* Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp:
> +
> +Canonical link: https://commits.webkit.org/290945.273@webkitglib/2.48
> +
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +Upstream: https://github.com/WebKit/WebKit/commit/943d05f0c9b03c053a456c90c2a8817c1f679711
> +---
> + Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp b/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
> +index a06e33fd04f8..5fb245ce0b66 100644
> +--- a/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
> ++++ b/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
> +@@ -43,11 +43,12 @@
> + #include <skia/core/SkGraphics.h>
> + #endif
> + 
> +-#if USE(SYSPROF_CAPTURE)
> +-#include <wtf/SystemTracing.h>
> + #if USE(SKIA_OPENTYPE_SVG)
> + #include <skia/modules/svg/SkSVGOpenTypeSVGDecoder.h>
> + #endif
> ++
> ++#if USE(SYSPROF_CAPTURE)
> ++#include <wtf/SystemTracing.h>
> + #endif
> + 
> + namespace WebKit {
> +-- 
> +2.50.1
> +
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 512f7ea672..969590482c 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -16,12 +16,12 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>  
> -comment "wpewebkit needs a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 10, host gcc >= 4.9"
> +comment "wpewebkit needs a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11 \
>  		|| !BR2_HOST_GCC_AT_LEAST_4_9
>  
>  comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
> @@ -36,13 +36,13 @@ config BR2_PACKAGE_WPEWEBKIT
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
>  	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	depends on BR2_USE_WCHAR # icu, libsoup3
>  	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
>  	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
> -	select BR2_PACKAGE_CAIRO
> -	select BR2_PACKAGE_CAIRO_PNG
> +	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"
> +	select BR2_PACKAGE_CAIRO_PNG if BR2_ENDIAN = "BIG"
>  	select BR2_PACKAGE_HARFBUZZ
>  	select BR2_PACKAGE_ICU
>  	select BR2_PACKAGE_JPEG
> @@ -56,6 +56,7 @@ config BR2_PACKAGE_WPEWEBKIT
>  	select BR2_PACKAGE_WAYLAND_PROTOCOLS
>  	select BR2_PACKAGE_WEBP
>  	select BR2_PACKAGE_WEBP_DEMUX
> +	select BR2_PACKAGE_WEBP_MUX
>  	select BR2_PACKAGE_WPEBACKEND_FDO
>  	help
>  	  WPE (Web Platform for Embedded) port of the WebKit engine,
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index 7a7cef15a5..332fd9deaa 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.44.4.tar.xz.sums
> -md5  4d91f3ff629c9356dcff866b68a4646f  wpewebkit-2.44.4.tar.xz
> -sha1  ef1ea0484e9ec17a362afe9a709fe0754f05cc14  wpewebkit-2.44.4.tar.xz
> -sha256  cd6042c63a6f883cc1586e5cea94e846aaaee6a864c14988e8af4ef4f362ba3b  wpewebkit-2.44.4.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.48.3.tar.xz.sums
> +md5  2d3b7fa3c62886546f918fcc289cabbe  wpewebkit-2.48.3.tar.xz
> +sha1  8a90b9ff8809c99c306defc1a08e50a31a09c590  wpewebkit-2.48.3.tar.xz
> +sha256  807571f07e87823b8fb79564692c9b1ef81ee62edbf51345a15bd0e7e1f2e07b  wpewebkit-2.48.3.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 6a8e9c637c..796e271ecb 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # The middle number is even for stable releases, odd for development ones.
> -WPEWEBKIT_VERSION = 2.44.4
> +WPEWEBKIT_VERSION = 2.48.3
>  WPEWEBKIT_SITE = https://wpewebkit.org/releases
>  WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>  WPEWEBKIT_INSTALL_STAGING = YES
> @@ -16,7 +16,7 @@ WPEWEBKIT_LICENSE_FILES = \
>  WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
>  WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
>  WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
> -	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup3 libtasn1 \
> +	harfbuzz icu jpeg libepoxy libgcrypt libgles libsoup3 libtasn1 \
>  	libpng libxslt wayland-protocols webp wpebackend-fdo
>  
>  WPEWEBKIT_CMAKE_BACKEND = ninja
> @@ -30,6 +30,15 @@ WPEWEBKIT_CONF_OPTS = \
>  	-DENABLE_WEB_RTC=OFF \
>  	-DUSE_ATK=OFF
>  
> +# WPE WebKit uses a bundled copy of Skia since 2.46.0 for
> +# little-endian targets, and Cairo for big-endian ones.
> +ifeq ($(BR2_ENDIAN),"BIG")
> +WPEWEBKIT_DEPENDENCIES += cairo
> +WPEWEBKIT_CONF_OPTS += -DUSE_SKIA=OFF
> +else
> +WPEWEBKIT_CONF_OPTS += -DUSE_SKIA=ON
> +endif
> +
>  ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
>  WPEWEBKIT_CONF_OPTS += \
>  	-DENABLE_BUBBLEWRAP_SANDBOX=ON \
> @@ -79,6 +88,13 @@ else
>  WPEWEBKIT_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_FLITE),y)
> +WPEWEBKIT_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=ON
> +WPEWEBKIT_DEPENDENCIES += flite
> +else
> +WPEWEBKIT_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LCMS2),y)
>  WPEWEBKIT_CONF_OPTS += -DUSE_LCMS=ON
>  WPEWEBKIT_DEPENDENCIES += lcms2
> @@ -114,6 +130,13 @@ else
>  WPEWEBKIT_CONF_OPTS += -DUSE_JPEGXL=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSPROF),y)
> +WPEWEBKIT_CONF_OPTS += -DUSE_SYSPROF_CAPTURE=ON
> +WPEWEBKIT_DEPENDENCIES += sysprof
> +else
> +WPEWEBKIT_CONF_OPTS += -DUSE_SYSPROF_CAPTURE=OFF
> +endif
> +
>  ifeq ($(BR2_INIT_SYSTEMD),y)
>  WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=ON
>  WPEWEBKIT_DEPENDENCIES += systemd
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
