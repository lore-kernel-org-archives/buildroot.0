Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E27CC54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC77181DE9;
	Wed, 27 Mar 2024 22:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3a_Mt6MxyEJ; Wed, 27 Mar 2024 22:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5B7D81E91
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B7D81E91;
	Wed, 27 Mar 2024 22:06:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06FBC1BF33B
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 010C460BD2
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueDAafoYxV8D for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D144F6065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D144F6065F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D144F6065F
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:06:11 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4148c6132b4so8377525e9.1
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 15:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711577170; x=1712181970;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1C9cTgrIao/NS8zK1LgY2v2yOwvP828iCadkOW0toB8=;
 b=GvABTNJvv16+31Il9ZUNgbVyzWKej9JL7DWu0ui4mZwlqmUDJuFbto97eHaL6ReArZ
 NDMMPeh6qtVkVaipm13YONLMptdminmt+QstnaUinUZPZoaw7NONwQG01v6NYeMauMZU
 D/u/hRAQAWNokKGLfugi8xz7+TJ4+Yv3GHm4yYwHYc7isxqxAFzlIXhTe9vSEaOvZWeZ
 gQsI3c6l0I5MIseat23nT7EFFAYvpsgHyZ55pZZXIYLtn0f0U6pX9zZrDGDU+l4bvofd
 a+o7xDNXSnT7os+A77FJGd4nfRx2IEpstrUr1qbPeth2JnlbPY/6Bh2lQSgpS61x34vQ
 UOag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa+jI+88D9mvWsH+89rcZV60u5C9IHvvGY11fq7+O9+ol/80yEyT0yCEQmlCjmD60iIexko/FATIBa4yKGefLeUz8DDobUtQ==
X-Gm-Message-State: AOJu0Yy23XZaFgyimaING7Md0oFeTkRDW41OW/BoVv30Of7kDD6kkjUQ
 5WCRAnzB110UkW//PSYBi27Olk3MyzvGG50SeEw4nxcnihnA28Lqf3CBAnPzJCytlXbEAgMtPJx
 S
X-Google-Smtp-Source: AGHT+IGwZYlAmnd4PPsJkboZBfFz15YxLJAkTk8flIhutppGwmqMMKcIC3B7U1BWGgdZMRmYGqalKQ==
X-Received: by 2002:a05:600c:4f13:b0:414:8fa5:b9a1 with SMTP id
 l19-20020a05600c4f1300b004148fa5b9a1mr449749wmq.5.1711577169973; 
 Wed, 27 Mar 2024 15:06:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b0041409d4841dsm196116wmq.33.2024.03.27.15.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 15:06:09 -0700 (PDT)
Message-ID: <eaa0159b-a1d3-4675-b941-504d92085de8@mind.be>
Date: Wed, 27 Mar 2024 23:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240324180645.519798-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240324180645.519798-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711577170; x=1712181970; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1C9cTgrIao/NS8zK1LgY2v2yOwvP828iCadkOW0toB8=;
 b=BFsP4YCoCdOCLmPdzHB6cW3usEjrIgYvAu8/zOgEcfDJz9ALx3b4Hy2ps81pKixiea
 Tk+/4fjpVR+EGSxfWgg0JiuasvALKfjQkS62OV0p8H6T2bn7S8WITYqwQdWD/YntaAsK
 nZzhYuQ8T6f9YtGMXz8mAlfAktHuYSq23wzTwBfqQdGI/TeND4Db27/awM897ojwTQVi
 gkhLds+P7HRERcNHEvaPiDMtuinzVwJ2bfjTe05VzCLgxBs5gFNKYtSFFjWDLpUdHc3B
 7aZx5Ouj2khLJuN3y6kDvlixNUgdu0mlL4G2UNkyoZhwrpoHq85Jyi7B7mNzpmWFnsht
 f8QQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BFsP4YCo
Subject: Re: [Buildroot] [PATCH 1/1] package/log4cxx: bump to version 1.1.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 19:06, Fabrice Fontaine wrote:
> - Drop patch (already in version)
> - Drop LOG4CXX_IGNORE_CVES as CVE-2023-31038 has been fixed in 1.1.0
> - Add unixodbc optional dependency
> 
> https://logging.apache.org/log4cxx/latest_stable/changelog.html#1.1.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Make-ODBC-and-SMTP-opt-in-191.patch  | 73 -------------------
>   package/log4cxx/log4cxx.hash                  |  4 +-
>   package/log4cxx/log4cxx.mk                    | 15 ++--
>   3 files changed, 11 insertions(+), 81 deletions(-)
>   delete mode 100644 package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch
> 
> diff --git a/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch b/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch
> deleted file mode 100644
> index a116fcc491..0000000000
> --- a/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From 4900c27cc284ba2f671ae92e6ffb4ab391f9507a Mon Sep 17 00:00:00 2001
> -From: Robert Middleton <rm5248@users.noreply.github.com>
> -Date: Mon, 6 Feb 2023 20:39:02 -0500
> -Subject: [PATCH] Make ODBC and SMTP opt-in (#191)
> -
> -See #189
> -
> -Upstream: afeaab6d0f0107c77dfadcbe3708f170c48d5ed9
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - src/main/include/CMakeLists.txt | 40 ++++++++++++++++++++++++---------
> - 1 file changed, 30 insertions(+), 10 deletions(-)
> -
> -diff --git a/src/main/include/CMakeLists.txt b/src/main/include/CMakeLists.txt
> -index e31443fb..d6835293 100644
> ---- a/src/main/include/CMakeLists.txt
> -+++ b/src/main/include/CMakeLists.txt
> -@@ -85,22 +85,42 @@ include(CheckIncludeFiles)
> - include(CheckIncludeFileCXX)
> - include(CheckLibraryExists)
> -
> --if(WIN32)
> --	CHECK_INCLUDE_FILES(sqlext.h HAS_ODBC)
> -+option(LOG4CXX_ENABLE_ODBC "Support logging via ODBC" OFF)
> -+if(LOG4CXX_ENABLE_ODBC)
> -+    if(WIN32)
> -+            CHECK_INCLUDE_FILES(sqlext.h HAS_ODBC)
> -+    else()
> -+            include(FindPkgConfig)
> -+
> -+            pkg_check_modules( odbc odbc )
> -+            if(${odbc_FOUND})
> -+                    set(HAS_ODBC 1)
> -+            else()
> -+                    set(HAS_ODBC 0)
> -+            endif(${odbc_FOUND})
> -+    endif(WIN32)
> -+
> -+    if(NOT ${HAS_ODBC})
> -+        message(SEND_ERROR "ODBC not found but requested")
> -+    endif()
> - else()
> --	include(FindPkgConfig)
> --
> --	pkg_check_modules( odbc QUIET odbc )
> --	if(${odbc_FOUND})
> --		set(HAS_ODBC 1)
> --	endif(${odbc_FOUND})
> --endif(WIN32)
> -+    set(HAS_ODBC 0)
> -+endif(LOG4CXX_ENABLE_ODBC)
> -+
> -+option(LOG4CXX_ENABLE_ESMTP "Support logging via libesmtp" OFF)
> -+if(LOG4CXX_ENABLE_ESMTP)
> -+    CHECK_LIBRARY_EXISTS(esmtp smtp_create_session "" HAS_LIBESMTP)
> -+    if(NOT HAS_LIBESMTP)
> -+        message(SEND_ERROR "SMTP support with libesmtp not found but requested")
> -+    endif()
> -+else()
> -+    set(HAS_LIBESMTP 0)
> -+endif(LOG4CXX_ENABLE_ESMTP)
> -
> - CHECK_INCLUDE_FILE_CXX(locale HAS_STD_LOCALE)
> - CHECK_FUNCTION_EXISTS(mbsrtowcs HAS_MBSRTOWCS)
> - CHECK_FUNCTION_EXISTS(wcstombs HAS_WCSTOMBS)
> - CHECK_FUNCTION_EXISTS(fwide HAS_FWIDE)
> --CHECK_LIBRARY_EXISTS(esmtp smtp_create_session "" HAS_LIBESMTP)
> - CHECK_FUNCTION_EXISTS(syslog HAS_SYSLOG)
> - if(UNIX)
> -     set(CMAKE_REQUIRED_LIBRARIES "pthread")
> ---
> -2.41.0
> -
> diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
> index 8190f94aa3..728d49ee38 100644
> --- a/package/log4cxx/log4cxx.hash
> +++ b/package/log4cxx/log4cxx.hash
> @@ -1,4 +1,4 @@
> -# From https://www.apache.org/dist/logging/log4cxx/0.13.0/apache-log4cxx-0.13.0.tar.gz.sha512
> -sha512  2a5f4fecc0415d942658c588774f0666082c497b6fd49bf64ab3328a997775206788c9b10a8c89208896c57da52fcc12c18d5d11ca1d3bf699e4633b8fcea6e5  apache-log4cxx-0.13.0.tar.gz
> +# From https://www.apache.org/dist/logging/log4cxx/1.1.0/apache-log4cxx-1.1.0.tar.gz.sha512
> +sha512  66a66eab933a6afd0779e3f73f65afa4fb82481208b591fd7c7c86ded805f50abcd9cdf954bdb49e1e7f5198e6c1c4fff8a7e180ff5fff9491f1946e9ba6fe2b  apache-log4cxx-1.1.0.tar.gz
>   # Locally computed
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
> index aee682529c..8024c96d46 100644
> --- a/package/log4cxx/log4cxx.mk
> +++ b/package/log4cxx/log4cxx.mk
> @@ -4,21 +4,17 @@
>   #
>   ################################################################################
>   
> -LOG4CXX_VERSION = 0.13.0
> +LOG4CXX_VERSION = 1.1.0
>   LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
>   LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
>   LOG4CXX_INSTALL_STAGING = YES
>   LOG4CXX_LICENSE = Apache-2.0
>   LOG4CXX_LICENSE_FILES = LICENSE
>   LOG4CXX_CPE_ID_VENDOR = apache
> -# We do not support ODBC functionality
> -LOG4CXX_IGNORE_CVES = CVE-2023-31038
>   
> -# Note: if you want to support odbc, make sure CVE-2023-31038 is fixed
>   LOG4CXX_CONF_OPTS = \
>   	-DAPR_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apr-1-config \
> -	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config \
> -	-DLOG4CXX_ENABLE_ODBC=OFF
> +	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config
>   
>   LOG4CXX_DEPENDENCIES = apr apr-util
>   
> @@ -33,6 +29,13 @@ else
>   LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=OFF
>   endif
>   
> +ifeq ($(BR2_PACKAGE_UNIXODBC),y)
> +LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ODBC=ON
> +LOG4CXX_DEPENDENCIES += unixodbc
> +else
> +LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ODBC=OFF
> +endif
> +
>   ifeq ($(BR2_USE_WCHAR),y)
>   LOG4CXX_CONF_OPTS += -DLOG4CXX_WCHAR_T=ON
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
