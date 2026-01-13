Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB082D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A228184493;
	Tue, 13 Jan 2026 19:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLuQ6yY4Ao-k; Tue, 13 Jan 2026 19:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50ED58448A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333710;
	bh=dvQ/r9UcBIXg9Likli03QnFLh92a7CjVnrOpbyKiX+U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lYg5RDNyiBl4KyzWDlcCTkjo0ILBl5YL3xtqAS7gXJnA0JWypau6PyWoM4UQ62N+J
	 PJfvfMt70d4AHxUKlyjp721dptBVBnX/qO6/de9RQYlRQWVHrJ4oJlFbjQS8dPKOiW
	 T/Kdi4FV2lAProXem0CHROpYrv7LgfbgjY+YwQmdqwKzo8FOp9pZQQYgcTugP4iUye
	 zk//8As1ZIncojxgoQ+07Hae+IkM5gKluzSxAeREVpOQGrnSCQ4cIoLuoB9KYpwLGP
	 FncXxVNtZUuMLfwb9YZzQzyWkPVeAqzbuEj8hfoYk3kamkcb/c2yKMqmIlCzyRjMbI
	 vRSAr2OnRT9Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50ED58448A;
	Tue, 13 Jan 2026 19:48:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 102CA1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0156760BB2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBK9Fbv8ywGd for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:48:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B2E860B91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B2E860B91
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B2E860B91
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A35C0B97A886; Tue, 13 Jan 2026 20:48:21 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:48:20 +0100
Message-ID: <20260113194820.100725-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103154904.1130572-1-bernd@kuhls.net>
References: <20260103154904.1130572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333701; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=5L9phzDFf1E2Ud1cHVWqCjCJYgvYExfeiu3CQNDFU+Q=;
 b=f3RciFbUTscUEHSMtTjS4SJwHcfD2bf70ys/Vcg3WfQ0Sirxce5kVg8s+TFxUEdv8QCKSy
 KCZo/jwJW+gLfg2GfyW/A5UuDOs9fRuT1GHIJeNmLKjm5nRQSA0/l0AQn60GgmSlwp3ZyA
 wxloht+7SC0T8Q1TmIq+Y8L0CSOmjEtDTUiHRs5KeMjwscQ88+6pTUhGyF/2HJLspROuY9
 xHeGk5uyc3UhthftdQ3ouHIPBMzOVDbbQMNNjzeYq1z1pu3S08CGpN92NPis509o91CEbw
 vEYErjZFw2zykVXFoTgpXnthHM+pA7NLtHktsvHVik148gOtC0e8s/Ofcfm8Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=f3RciFbU
Subject: Re: [Buildroot] [PATCH 1/1] package/icu: needs C++17
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 bumped icu from
> version 73-2 to 77-1.
> 
> Upstream raised the minimum C++ requirement to C++17 in version 75-1:
> 
> https://github.com/unicode-org/icu/releases/tag/release-75-1
> https://icu.unicode.org/download/75
> "C++ code now requires C++17 [...]"
> 
> This commit switches the minimum gcc version to 7.
> 
> No autobuilder errors were recorded which relate to the gcc version used.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/cppcms/Config.in               | 10 +++++-----
>  package/icu/Config.in                  | 10 +++++-----
>  package/php/Config.ext                 | 10 +++++-----
>  package/python-mwscrape2slob/Config.in | 10 +++++-----
>  package/python-pyicu/Config.in         | 10 +++++-----
>  package/python-slob/Config.in          | 10 +++++-----
>  package/qt-webkit-kiosk/Config.in      | 10 +++++-----
>  package/qt5/qt5base/Config.in          | 10 +++++-----
>  package/qt5/qt5webengine/Config.in     |  6 +++---
>  package/qt5/qt5webkit/Config.in        | 10 +++++-----
>  package/webkitgtk/Config.in            |  6 +++---
>  package/wpewebkit/Config.in            |  6 +++---
>  12 files changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
> index 6c0bff934c..48266e00c1 100644
> --- a/package/cppcms/Config.in
> +++ b/package/cppcms/Config.in
> @@ -24,17 +24,17 @@ if BR2_PACKAGE_CPPCMS
>  config BR2_PACKAGE_CPPCMS_ICU
>  	bool "enable icu support"
>  	depends on !BR2_BINFMT_FLAT # icu
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
>  	select BR2_PACKAGE_ICU
>  	help
>  	  Using ICU allows advanced localization features into CppCMS,
>  	  in another hand ICU is heavier than iconv.
>  
> -comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
> +comment "icu support needs a toolchain w/ gcc >= 7, host gcc >= 7"
>  	depends on !BR2_BINFMT_FLAT
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
>  
>  endif
>  
> diff --git a/package/icu/Config.in b/package/icu/Config.in
> index 4ed662e887..542acc4187 100644
> --- a/package/icu/Config.in
> +++ b/package/icu/Config.in
> @@ -2,8 +2,8 @@ config BR2_PACKAGE_ICU
>  	bool "icu"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11 PR56019
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11 PR56019
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# icu does some funky things by generating by itself an ELF
>  	# file, and it cannot easily be changed to generate FLAT
> @@ -27,9 +27,9 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
>  
>  endif
>  
> -comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.9, host gcc >= 4.9"
> +comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 7, host gcc >= 7"
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 8cf4a7d160..e6f29cdf4c 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -231,10 +231,10 @@ config BR2_PACKAGE_PHP_EXT_ICONV
>  
>  config BR2_PACKAGE_PHP_EXT_INTL
>  	bool "intl"
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
>  	depends on !BR2_BINFMT_FLAT # icu
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
>  	depends on !BR2_STATIC_LIBS
> @@ -242,12 +242,12 @@ config BR2_PACKAGE_PHP_EXT_INTL
>  	help
>  	  Internationalization support
>  
> -comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9, host gcc >= 4.9"
> +comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 7"
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
>  
>  config BR2_PACKAGE_PHP_EXT_MBSTRING
>  	bool "mbstring"
> diff --git a/package/python-mwscrape2slob/Config.in b/package/python-mwscrape2slob/Config.in
> index 6ced253451..940ff48059 100644
> --- a/package/python-mwscrape2slob/Config.in
> +++ b/package/python-mwscrape2slob/Config.in
> @@ -1,9 +1,9 @@
>  config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
>  	bool "python-mwscrape2slob"
>  	depends on !BR2_BINFMT_FLAT # python-slob -> python-pyicu -> icu
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # python-slob -> python-pyicu -> icu
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # python-slob -> python-pyicu -> icu
>  	depends on BR2_INSTALL_LIBSTDCPP # python-slob -> python-pyicu -> icu
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-slob -> python-pyicu -> icu
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # python-slob -> python-pyicu -> icu
>  	select BR2_PACKAGE_PYTHON_COUCHDB # runtime
>  	select BR2_PACKAGE_PYTHON_CSSSELECT # runtime
>  	select BR2_PACKAGE_PYTHON_CSSUTILS # runtime
> @@ -15,7 +15,7 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
>  
>  	  https://github.com/itkach/mwscrape2slob
>  
> -comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
> +comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 7, host gcc >= 7"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
> diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
> index cbd75c0119..34655d4565 100644
> --- a/package/python-pyicu/Config.in
> +++ b/package/python-pyicu/Config.in
> @@ -1,17 +1,17 @@
>  config BR2_PACKAGE_PYTHON_PYICU
>  	bool "python-pyicu"
>  	depends on !BR2_BINFMT_FLAT # icu
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
>  	depends on BR2_INSTALL_LIBSTDCPP # icu
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
>  	select BR2_PACKAGE_ICU
>  	help
>  	  Python extension wrapping the ICU C++ API.
>  
>  	  https://gitlab.pyicu.org/main/pyicu
>  
> -comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
> +comment "python-pyicu needs a toolchain w/ C++, gcc >= 7, host gcc >= 7"
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
> diff --git a/package/python-slob/Config.in b/package/python-slob/Config.in
> index c06f544534..293dd67de2 100644
> --- a/package/python-slob/Config.in
> +++ b/package/python-slob/Config.in
> @@ -1,9 +1,9 @@
>  config BR2_PACKAGE_PYTHON_SLOB
>  	bool "python-slob"
>  	depends on !BR2_BINFMT_FLAT # python-pyicu -> icu
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # python-pyicu -> icu
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # python-pyicu -> icu
>  	depends on BR2_INSTALL_LIBSTDCPP # python-pyicu -> icu
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-pyicu -> icu
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # python-pyicu -> icu
>  	select BR2_PACKAGE_PYTHON_PYICU # runtime
>  	# although optional, it is used as default compression
>  	select BR2_PACKAGE_PYTHON3_XZ # runtime
> @@ -13,7 +13,7 @@ config BR2_PACKAGE_PYTHON_SLOB
>  
>  	  https://github.com/itkach/slob
>  
> -comment "python-slob needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
> +comment "python-slob needs a toolchain w/ C++, gcc >= 7, host gcc >= 7"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
> diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
> index 80f8e7c464..2df1f4da39 100644
> --- a/package/qt-webkit-kiosk/Config.in
> +++ b/package/qt-webkit-kiosk/Config.in
> @@ -3,8 +3,8 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
>  	depends on BR2_PACKAGE_QT5
>  	depends on !BR2_STATIC_LIBS # qt5webkit
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5webkit -> icu
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # qt5webkit -> icu
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # qt5webkit -> icu
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # qt5webkit -> icu
>  	depends on !BR2_BINFMT_FLAT # qt5webkit -> icu
>  	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
>  	select BR2_PACKAGE_OPENSSL
> @@ -26,9 +26,9 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
>  
>  endif
>  
> -comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 4.9, host gcc >= 4.9"
> -	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9
> +comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 7, host gcc >= 7"
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_MIPS_SOFT_FLOAT
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index 8f14540eb4..dfaa798bd4 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -290,17 +290,17 @@ config BR2_PACKAGE_QT5BASE_DBUS
>  config BR2_PACKAGE_QT5BASE_ICU
>  	bool "Enable ICU support"
>  	depends on !BR2_BINFMT_FLAT # icu
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
>  	select BR2_PACKAGE_ICU
>  	help
>  	  This option enables ICU support in Qt5. This is for example
>  	  needed for Qt5Webkit.
>  
> -comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
> +comment "icu support needs a toolchain w/ gcc >= 7, host gcc >= 7"
>  	depends on !BR2_BINFMT_FLAT
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
>  
>  config BR2_PACKAGE_QT5BASE_TSLIB
>  	bool "Enable Tslib support"
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 6179591399..0dd1483c57 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -10,10 +10,10 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT # qt5base-icu
>  	depends on BR2_USE_MMU # libglib2, qt5base-dbus
>  
> -comment "qt5webengine needs udev /dev management and a glibc toolchain w/ host gcc >= 4.9, threads, wchar"
> +comment "qt5webengine needs udev /dev management and a glibc toolchain w/ host gcc >= 7, threads, wchar"
>  	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_7 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
>  
>  comment "qt5webengine needs an OpenGL and EGL-capable backend"
> @@ -24,7 +24,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>  	bool "qt5webengine"
>  	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # qt5base-icu
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libvpx
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
> diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
> index 9b84ac5f96..52e5606534 100644
> --- a/package/qt5/qt5webkit/Config.in
> +++ b/package/qt5/qt5webkit/Config.in
> @@ -3,8 +3,8 @@ config BR2_PACKAGE_QT5WEBKIT
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>  	depends on BR2_INSTALL_LIBSTDCPP # leveldb
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # leveldb
>  	depends on !BR2_BINFMT_FLAT # icu
>  	# assumes a FPU is available on MIPS
> @@ -50,9 +50,9 @@ config BR2_PACKAGE_QT5WEBKIT
>  
>  	  https://doc.qt.io/archives/qt-5.5/qtwebkit-index.html
>  
> -comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.9, host gcc >= 4.9"
> -	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9
> +comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 7, host gcc >= 7"
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_MIPS_SOFT_FLOAT
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index 7827dc6218..3a4c3ed792 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -16,14 +16,14 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>  
> -comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
> +comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
>  	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT
>  	depends on (!BR2_PACKAGE_LIBGTK3 && !BR2_PACKAGE_LIBGTK4) || \
>  		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9
> +		!BR2_HOST_GCC_AT_LEAST_7
>  	depends on BR2_USE_MMU
>  
>  config BR2_PACKAGE_WEBKITGTK
> @@ -31,7 +31,7 @@ config BR2_PACKAGE_WEBKITGTK
>  	depends on !BR2_STATIC_LIBS # wayland
>  	depends on !BR2_BINFMT_FLAT # icu
>  	depends on BR2_PACKAGE_HAS_LIBEGL
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 5cbba43792..73ba4e6bdf 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -16,13 +16,13 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>  
> -comment "wpewebkit needs a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
> +comment "wpewebkit needs a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11 \
> -		|| !BR2_HOST_GCC_AT_LEAST_4_9
> +		|| !BR2_HOST_GCC_AT_LEAST_7
>  
>  comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
> @@ -33,7 +33,7 @@ config BR2_PACKAGE_WPEWEBKIT
>  	bool "wpewebkit"
>  	depends on !BR2_STATIC_LIBS # wayland
>  	depends on !BR2_BINFMT_FLAT # icu
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
>  	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
