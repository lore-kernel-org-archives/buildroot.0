Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDA9C6FD19
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 19:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B62041BA6;
	Fri, 10 Mar 2023 19:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B62041BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3izaipKck5qD; Fri, 10 Mar 2023 19:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64FCD41C73;
	Fri, 10 Mar 2023 19:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64FCD41C73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2AD61BF2F0
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 19:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B89782302
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 19:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B89782302
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fthX4qhlxja for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 19:53:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C99E82301
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C99E82301
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 19:53:52 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id o12so25075218edb.9
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 11:53:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678478030;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aXYRmvf7jIyIX33Av03intuLLS+8/HfWQS4zNv0hRzc=;
 b=0+Lg2O0vbTrJJ1UkJpwX+Irx8u3dBacuIuqqWYzFg2cgW9nduOSy4eNIwKHGziWNyk
 k0/Vd7YMr7WbWcf/RDzX7rtCCJzFpn/bByp/Qx8BTH6BaiYg42lDM23rfFggGjnmb7iC
 YMB60ADWbMZyG+maFvstmHhz7dUOz01ozWsVR/ueaLayZAoTh5EcgSy2F84sQamzsMIS
 X+IXh9Q9Xp2umKi5nkX4RWKPfX3SPw1Sg/sw5FU1QsvrhwUlJGqYLNOwYkU6D26gw0/j
 c22MO95XHVKaSF70g2q1tuAHKdoT49jGr3t/yfrmA+ZFS7O2pwSBUJUdoQ6oRstD5jl2
 /y2Q==
X-Gm-Message-State: AO0yUKUrfUlON9mPICGOUt/wUCHIOEHnPQFOKbWSUTRvCm/oqnN14VFN
 stnSuUKqgEGqH6gw99onjvct2g==
X-Google-Smtp-Source: AK7set9RjhsESuagppwSmYRX/exgtnCowPbsJzm1jQhumNBOVZSF02AJSRipSWkREL2tMWVyOPMoVg==
X-Received: by 2002:a17:907:98d2:b0:8af:54d0:181d with SMTP id
 kd18-20020a17090798d200b008af54d0181dmr22892856ejc.35.1678478030389; 
 Fri, 10 Mar 2023 11:53:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a17090607cf00b00914fec9f40esm237809ejc.71.2023.03.10.11.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:53:49 -0800 (PST)
Message-ID: <e2b2a825-c8d6-deb9-6c65-ef0b1e4df3c0@mind.be>
Date: Fri, 10 Mar 2023 20:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20230310165900.46687-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230310165900.46687-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678478030;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aXYRmvf7jIyIX33Av03intuLLS+8/HfWQS4zNv0hRzc=;
 b=M+cva43cfFGoejP3dmWjSEUvNEwcbjHUqDeHYvFOGoi9OTfZXZx6uMMxUAx7qlE8vA
 Tgoxh1CPdcfl1g/dpWSxwP0L22fIr8rReTIJTmFZM3pWPPUhUihcGGdIr/rYWDxOfpQr
 BPmpQQdq0KG5I17aTvs8nJ2F5jgX3X6RnLt1a8nJWc4TrJGqvcT9LAupleSPdCyfN8sn
 HH2NqI1HL/BzJ4WSyTsnUB1ksi6hT2NyRykUGPEyu41enrluAxUN/QM0wUGHshLZ5EzK
 r7oOgLeu8CAuTKJWQHtt696tbOtqt/53DrqxMOEsQdtfg5YJ3haP4NXJq9XIrD8MHp3g
 Wnzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M+cva43c
Subject: Re: [Buildroot] [PATCH 1/1] package/znc: Fix build with LibreSSL
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
Cc: =?UTF-8?Q?C=c3=a9dric_Ch=c3=a9pied?= <cedric.chepied@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/03/2023 17:59, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/3fe/3fec5c3a21af47b5f4e8adcaf4ce1fff5070e00a/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...0001-LibreSSL-3.5-opaqued-structures.patch | 27 ++++++++
>   .../znc/0002-Fix-build-with-libressl.patch    | 68 +++++++++++++++++++
>   ...DH_get0_key-have-existed-since-Libre.patch | 30 ++++++++
>   3 files changed, 125 insertions(+)
>   create mode 100644 package/znc/0001-LibreSSL-3.5-opaqued-structures.patch
>   create mode 100644 package/znc/0002-Fix-build-with-libressl.patch
>   create mode 100644 package/znc/0003-DH_set0_pqg-and-DH_get0_key-have-existed-since-Libre.patch
> 
> diff --git a/package/znc/0001-LibreSSL-3.5-opaqued-structures.patch b/package/znc/0001-LibreSSL-3.5-opaqued-structures.patch
> new file mode 100644
> index 0000000000..d0019e21a4
> --- /dev/null
> +++ b/package/znc/0001-LibreSSL-3.5-opaqued-structures.patch
> @@ -0,0 +1,27 @@
> +From 87f3dac8ba8dea5628b05416bdef454b4ef2d236 Mon Sep 17 00:00:00 2001
> +From: Charlie Li <git@vishwin.info>
> +Date: Mon, 14 Mar 2022 17:36:36 -0400
> +Subject: [PATCH] LibreSSL 3.5 opaqued structures
> +
> +Downloaded from upstream commit
> +https://github.com/znc/Csocket/commit/87f3dac8ba8dea5628b05416bdef454b4ef2d236
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +(rebased for znc)
> +---
> + Csocket.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Csocket.cc b/Csocket.cc
> +index 46a3bfd..a30da14 100644
> +--- a/third_party/Csocket/Csocket.cc
> ++++ b/third_party/Csocket/Csocket.cc
> +@@ -61,7 +61,7 @@
> + #  define OPENSSL_NO_TLS1_1            /* 1.0.1-pre~: openssl/openssl@637f374ad49d5f6d4f81d87d7cdd226428aa470c */
> + #  define OPENSSL_NO_TLS1_2            /* 1.0.1-pre~: openssl/openssl@7409d7ad517650db332ae528915a570e4e0ab88b */
> + # endif
> +-# ifndef LIBRESSL_VERSION_NUMBER /* forked from OpenSSL 1.0.1g, sets high version "with the idea of discouraging software from relying on magic numbers for detecting features"(!) */
> ++# if !defined(LIBRESSL_VERSION_NUMBER) || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x03050000fL)
> + #  if OPENSSL_VERSION_NUMBER >= 0x10100000
> + #   undef HAVE_ERR_REMOVE_THREAD_STATE /* 1.1.0-pre4: openssl/openssl@8509dcc9f319190c565ab6baad7c88d37a951d1c */
> + #   undef OPENSSL_NO_SSL2              /* 1.1.0-pre4: openssl/openssl@e80381e1a3309f5d4a783bcaa508a90187a48882 */
> diff --git a/package/znc/0002-Fix-build-with-libressl.patch b/package/znc/0002-Fix-build-with-libressl.patch
> new file mode 100644
> index 0000000000..b8d22445fb
> --- /dev/null
> +++ b/package/znc/0002-Fix-build-with-libressl.patch
> @@ -0,0 +1,68 @@
> +From dcb5f3df82fcfec48aab356252067dc897fb98cf Mon Sep 17 00:00:00 2001
> +From: Alexey Sokolov <alexey+znc@asokolov.org>
> +Date: Sun, 14 Nov 2021 00:45:01 +0000
> +Subject: [PATCH] Fix build with libressl
> +
> +It got another feature of openssl implemented, which broke this
> +
> +Downloaded from upstream commit
> +https://github.com/znc/znc/commit/dcb5f3df82fcfec48aab356252067dc897fb98cf
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + CMakeLists.txt                   | 14 ++++++++++++++
> + include/znc/zncconfig.h.cmake.in |  1 +
> + modules/schat.cpp                |  3 +--
> + 3 files changed, 16 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 0913ff2691..1f77f5632b 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -82,6 +82,20 @@ endmacro()
> + tristate_option(OPENSSL "Support SSL")
> + if(WANT_OPENSSL)
> + 	find_package(OpenSSL ${TRISTATE_OPENSSL_REQUIRED})
> ++
> ++	if(OPENSSL_FOUND)
> ++		# SSL_SESSION was made opaque in OpenSSL 1.1.0;
> ++		# LibreSSL gained that function later too.
> ++		# TODO: maybe remove this check at some point, and stop supporting old
> ++		# libssl versions
> ++		function(check_SSL_SESSION_get0_cipher)
> ++			set(CMAKE_REQUIRED_LIBRARIES ${OPENSSL_LIBRARIES})
> ++			set(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
> ++			check_cxx_symbol_exists(SSL_SESSION_get0_cipher openssl/ssl.h
> ++				HAVE_SSL_SESSION_get0_cipher)
> ++		endfunction()
> ++		check_SSL_SESSION_get0_cipher()
> ++	endif()
> + endif()
> + set(HAVE_LIBSSL "${OPENSSL_FOUND}")
> +
> +diff --git a/include/znc/zncconfig.h.cmake.in b/include/znc/zncconfig.h.cmake.in
> +index 5426b828af..7b07b99aec 100644
> +--- a/include/znc/zncconfig.h.cmake.in
> ++++ b/include/znc/zncconfig.h.cmake.in
> +@@ -31,6 +31,7 @@
> + #define HAVE_PTHREAD 1
> + #cmakedefine HAVE_THREADED_DNS 1
> + #cmakedefine HAVE_LIBSSL 1
> ++#cmakedefine HAVE_SSL_SESSION_get0_cipher 1
> + #cmakedefine HAVE_IPV6 1
> + #cmakedefine HAVE_ZLIB 1
> + #cmakedefine HAVE_I18N 1
> +diff --git a/modules/schat.cpp b/modules/schat.cpp
> +index aa7a338dcd..66e67e695c 100644
> +--- a/modules/schat.cpp
> ++++ b/modules/schat.cpp
> +@@ -25,8 +25,7 @@
> + #include <znc/User.h>
> + #include <znc/IRCNetwork.h>
> +
> +-#if !defined(OPENSSL_VERSION_NUMBER) || defined(LIBRESSL_VERSION_NUMBER) || \
> +-    OPENSSL_VERSION_NUMBER < 0x10100007
> ++#ifndef HAVE_SSL_SESSION_get0_cipher
> + /* SSL_SESSION was made opaque in OpenSSL 1.1.0, cipher accessor was added 2
> + weeks before the public release.
> + See openssl/openssl@e92813234318635639dba0168c7ef5568757449b. */
> diff --git a/package/znc/0003-DH_set0_pqg-and-DH_get0_key-have-existed-since-Libre.patch b/package/znc/0003-DH_set0_pqg-and-DH_get0_key-have-existed-since-Libre.patch
> new file mode 100644
> index 0000000000..a2946643fc
> --- /dev/null
> +++ b/package/znc/0003-DH_set0_pqg-and-DH_get0_key-have-existed-since-Libre.patch
> @@ -0,0 +1,30 @@
> +From 7c8ac8981a8516edaba469641aff4d8ec452ae9e Mon Sep 17 00:00:00 2001
> +From: Charlie Li <git@vishwin.info>
> +Date: Mon, 14 Mar 2022 18:32:46 -0400
> +Subject: [PATCH] DH_set0_pqg and DH_get0_key have existed since LibreSSL 2.7
> +
> +https://github.com/libressl-portable/openbsd/commit/848e2a019c796b685fc8c5848283b86e48fbe0bf
> +https://github.com/libressl-portable/openbsd/commit/3789e379353c1d53313a249461b3d735de4ac742
> +
> +Downloaded from upstream commit
> +https://github.com/znc/znc/commit/7c8ac8981a8516edaba469641aff4d8ec452ae9e
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + modules/crypt.cpp | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/modules/crypt.cpp b/modules/crypt.cpp
> +index 7655371b6e..68f7aafcea 100644
> +--- a/modules/crypt.cpp
> ++++ b/modules/crypt.cpp
> +@@ -68,7 +68,8 @@ class CCryptMod : public CModule {
> +     CString m_sPrivKey;
> +     CString m_sPubKey;
> +
> +-#if OPENSSL_VERSION_NUMBER < 0X10100000L || defined(LIBRESSL_VERSION_NUMBER)
> ++#if OPENSSL_VERSION_NUMBER < 0X10100000L || \
> ++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x02070000fL)
> +     static int DH_set0_pqg(DH* dh, BIGNUM* p, BIGNUM* q, BIGNUM* g) {
> +         /* If the fields p and g in dh are nullptr, the corresponding input
> +          * parameters MUST be non-nullptr.  q may remain nullptr.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
