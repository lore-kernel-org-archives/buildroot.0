Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C01AC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB05F60FE0;
	Wed, 30 Aug 2023 20:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB05F60FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0r8UMeQ7nIk; Wed, 30 Aug 2023 20:05:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12EEB6128C;
	Wed, 30 Aug 2023 20:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12EEB6128C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74A3B1BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A6EE829A9
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A6EE829A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F0wld2r9Ae_K for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:05:01 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4032182792
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4032182792
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50079d148aeso374592e87.3
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 13:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425899; x=1694030699;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DcfPoPkw4lMP+TwjzIvYVXxjQBfzFF5nmPrViphdZNQ=;
 b=MbMcsV4kLEr7ORh+jmY9jlP43nw3cd/uaPBTM8BLrT1dnCPqzhqh94XwOXrwJh49pC
 TKn1Se5pixNE0L3xkY5dcsSe8F0FVB1AIpY1qXO/ZzpW85j4j24GT66gW34eK/Miw+VX
 1gYVaT1RxAmALmxZJ13puRTpqqFv5YtzEbCQd2zi81bdFKmbWOQ5GqToPthTocfsUvQb
 TtGFzafMDuFj3WHl0U++hm2WXbJUB9YsOSvn6kEZId34A/lRhroyottsDanfk3Y+d5RE
 jyeAzh7k01YwThWPNqMrdGdoCveq9VxS0PDhOKhAxp7K+4cipGIlwznG/gahuxojcFMX
 Pe6Q==
X-Gm-Message-State: AOJu0YxfmKvSb2FkZ6k4YBx5RknA9TWOOUz1Lbmva1sbz5fopsPsTWqD
 rGVYhDWfWiIM8kLUn6fMQ2EZYnSeCui9Kd5XH4M=
X-Google-Smtp-Source: AGHT+IEc6o3/yxDR6cjTGWi74Iih3gWaqUPABCryB9TbEkF8XgdN9aThruHA8DFgyJkCjzH1R/uOhQ==
X-Received: by 2002:ac2:59ca:0:b0:500:a397:d4f0 with SMTP id
 x10-20020ac259ca000000b00500a397d4f0mr2076653lfn.31.1693425898562; 
 Wed, 30 Aug 2023 13:04:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 sy22-20020a1709076f1600b00992d0de8762sm7454764ejc.216.2023.08.30.13.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 13:04:57 -0700 (PDT)
Message-ID: <feb33608-25fb-52a6-a84e-00300f4027ae@mind.be>
Date: Wed, 30 Aug 2023 22:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20230828223215.2428514-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20230828223215.2428514-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693425899; x=1694030699; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DcfPoPkw4lMP+TwjzIvYVXxjQBfzFF5nmPrViphdZNQ=;
 b=DJ37bRDKg/I+vo31ONdmq+Bg8lO8s/7//AWC+PJkkxHdd/JS/AtpR94dcFCI6EJ+6k
 +FsVK0kWKaN+9iiP578tOJ5eoMvCfafytWyb51HwJQl2NrX+4KdWncd1FXzSMVIX+5fS
 7zbD89+QPPJaBgEnOd50zZrfgbNpLD4lJYtfbtefTOoVgOws1c56lSH1SWlZoHiUshVr
 1wFRM52VTYWU0jWK6D/Ltpq80LDeKZCRi3LVz6sk0b+fCn5kjMdI2RzRknpDHo2bTrar
 IHhyj/1FMvAd4jshRrfJgQUMGOA/VrtQ1uIXVGoLyz9dMjIHlQsGx8ptwietgM3Fdhyp
 K11g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DJ37bRDK
Subject: Re: [Buildroot] [PATCH] package/log4cxx: ignore CVE-2023-31038
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/08/2023 00:32, Thomas Petazzoni via buildroot wrote:
> CVE-2023-31038 affects log4cxx only if ODBC is supported. While
> CVE-2023-31038 has been fixed in newer versions of log4cxx, there is
> quite a huge gap to do a version bump, and the commit that fixes
> CVE-2023-31038 could not be identified.
> 
> Therefore, we want to rely on the fact that our log4cxx package does
> not support ODBC: there is indeed no explicit dependency on our
> unixodbc package in log4cxx.mk. However, log4cxx automatically detects
> if ODBC is available and if it is, it uses it.
> 
> So what we do in this commit is backport an upstream commit, which
> adds explicitly options to enable/disable ODBC and ESMTP support, and
> we use them to (1) always disable ODBC and (2) explicitly
> enable/disable ESMTP support.
> 
> Thanks to ODBC being disabled, we're not affected by CVE-2023-31038.
> 
> Of course, there is a potential regression for users who were relying
> on the implicit unixodbc dependency, but as we could not identify the
> commit fixing the CVE-2023-31038, this is the best we can do at the
> moment.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Make-ODBC-and-SMTP-opt-in-191.patch  | 73 +++++++++++++++++++
>   package/log4cxx/log4cxx.mk                    |  9 ++-
>   2 files changed, 81 insertions(+), 1 deletion(-)
>   create mode 100644 package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch
> 
> diff --git a/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch b/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch
> new file mode 100644
> index 0000000000..a116fcc491
> --- /dev/null
> +++ b/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch
> @@ -0,0 +1,73 @@
> +From 4900c27cc284ba2f671ae92e6ffb4ab391f9507a Mon Sep 17 00:00:00 2001
> +From: Robert Middleton <rm5248@users.noreply.github.com>
> +Date: Mon, 6 Feb 2023 20:39:02 -0500
> +Subject: [PATCH] Make ODBC and SMTP opt-in (#191)
> +
> +See #189
> +
> +Upstream: afeaab6d0f0107c77dfadcbe3708f170c48d5ed9
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + src/main/include/CMakeLists.txt | 40 ++++++++++++++++++++++++---------
> + 1 file changed, 30 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/main/include/CMakeLists.txt b/src/main/include/CMakeLists.txt
> +index e31443fb..d6835293 100644
> +--- a/src/main/include/CMakeLists.txt
> ++++ b/src/main/include/CMakeLists.txt
> +@@ -85,22 +85,42 @@ include(CheckIncludeFiles)
> + include(CheckIncludeFileCXX)
> + include(CheckLibraryExists)
> +
> +-if(WIN32)
> +-	CHECK_INCLUDE_FILES(sqlext.h HAS_ODBC)
> ++option(LOG4CXX_ENABLE_ODBC "Support logging via ODBC" OFF)
> ++if(LOG4CXX_ENABLE_ODBC)
> ++    if(WIN32)
> ++            CHECK_INCLUDE_FILES(sqlext.h HAS_ODBC)
> ++    else()
> ++            include(FindPkgConfig)
> ++
> ++            pkg_check_modules( odbc odbc )
> ++            if(${odbc_FOUND})
> ++                    set(HAS_ODBC 1)
> ++            else()
> ++                    set(HAS_ODBC 0)
> ++            endif(${odbc_FOUND})
> ++    endif(WIN32)
> ++
> ++    if(NOT ${HAS_ODBC})
> ++        message(SEND_ERROR "ODBC not found but requested")
> ++    endif()
> + else()
> +-	include(FindPkgConfig)
> +-
> +-	pkg_check_modules( odbc QUIET odbc )
> +-	if(${odbc_FOUND})
> +-		set(HAS_ODBC 1)
> +-	endif(${odbc_FOUND})
> +-endif(WIN32)
> ++    set(HAS_ODBC 0)
> ++endif(LOG4CXX_ENABLE_ODBC)
> ++
> ++option(LOG4CXX_ENABLE_ESMTP "Support logging via libesmtp" OFF)
> ++if(LOG4CXX_ENABLE_ESMTP)
> ++    CHECK_LIBRARY_EXISTS(esmtp smtp_create_session "" HAS_LIBESMTP)
> ++    if(NOT HAS_LIBESMTP)
> ++        message(SEND_ERROR "SMTP support with libesmtp not found but requested")
> ++    endif()
> ++else()
> ++    set(HAS_LIBESMTP 0)
> ++endif(LOG4CXX_ENABLE_ESMTP)
> +
> + CHECK_INCLUDE_FILE_CXX(locale HAS_STD_LOCALE)
> + CHECK_FUNCTION_EXISTS(mbsrtowcs HAS_MBSRTOWCS)
> + CHECK_FUNCTION_EXISTS(wcstombs HAS_WCSTOMBS)
> + CHECK_FUNCTION_EXISTS(fwide HAS_FWIDE)
> +-CHECK_LIBRARY_EXISTS(esmtp smtp_create_session "" HAS_LIBESMTP)
> + CHECK_FUNCTION_EXISTS(syslog HAS_SYSLOG)
> + if(UNIX)
> +     set(CMAKE_REQUIRED_LIBRARIES "pthread")
> +--
> +2.41.0
> +
> diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
> index a5569126d4..aee682529c 100644
> --- a/package/log4cxx/log4cxx.mk
> +++ b/package/log4cxx/log4cxx.mk
> @@ -11,10 +11,14 @@ LOG4CXX_INSTALL_STAGING = YES
>   LOG4CXX_LICENSE = Apache-2.0
>   LOG4CXX_LICENSE_FILES = LICENSE
>   LOG4CXX_CPE_ID_VENDOR = apache
> +# We do not support ODBC functionality
> +LOG4CXX_IGNORE_CVES = CVE-2023-31038
>   
> +# Note: if you want to support odbc, make sure CVE-2023-31038 is fixed
>   LOG4CXX_CONF_OPTS = \
>   	-DAPR_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apr-1-config \
> -	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config
> +	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config \
> +	-DLOG4CXX_ENABLE_ODBC=OFF
>   
>   LOG4CXX_DEPENDENCIES = apr apr-util
>   
> @@ -23,7 +27,10 @@ LOG4CXX_DEPENDENCIES += boost
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBESMTP),y)
> +LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=ON
>   LOG4CXX_DEPENDENCIES += libesmtp
> +else
> +LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=OFF
>   endif
>   
>   ifeq ($(BR2_USE_WCHAR),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
