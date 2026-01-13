Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04391D29DE5
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0A708410B;
	Tue, 13 Jan 2026 19:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_RVK0GMv7Rz; Tue, 13 Jan 2026 19:45:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E668B84111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333532;
	bh=VD87Vqj/AXZP7HaJjnuD/5ngzu7Oih8ThnDPE4gcmWA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z0o6Y99oIZbEOPd1zysQnyDrmEPESDTyojxkv7KN62+LA6ME+ku3H9nINUWQvYnVH
	 UyP/aLtigX/e+tUg4fNb1cvHMbskdF/KBGlUZgRw5ViE0ykRMn3FjzHFKPxL8eZBrN
	 CGjrnayb+X8adjXM/wuTFxwWZ0a9jJLYGbAGWeiwMIwt+1nc0J7UlNdv/y/1ASgkzc
	 Ne5I5M5RlN5G/N5FhZNeFSslysdbkX9U5FBSuZoyEVEAAGtBnsGfc4qv7escwnQ+pY
	 Nvc5QXynaMe/D0Nzv0worx+af5YpjmY4phL6w3lxwQVPxptoS8EJIGPex78o3Roc0f
	 sCf+NwiHvbhFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E668B84111;
	Tue, 13 Jan 2026 19:45:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90458231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 777734078B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzeyOzDOug7G for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51F95408E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51F95408E2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51F95408E2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6773DB97A885; Tue, 13 Jan 2026 20:45:24 +0100 (CET)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:22 +0100
Message-ID: <20260113194522.97612-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250904195812.3259342-4-buildroot@heine.tech>
References: <20250904195812.3259342-4-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333524; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=4piuE2bdaKFPohmQl+rqFMmnvmZi7fnZS7wmwFa6AoM=;
 b=Gjvc2MO8Oc+1KOYM0tjg3ID7NgUcwzL0sH/8v3JhVAvEbNwuFEyFnxkdrUmY45pIxKZ6Cn
 1gyWaAL+TWTRTVg3PdLCYUC1DiKdjR22skPzWxLsSdA1Y6axN6/9nRxGcHIvKQhnjtXszn
 RWwb0Ynu0Kn6mJaIwROjdCjdKyfYwugfxRMKFWcS+iKKeQj9ZUwUaMxbh5cVr4e4ZbdFu5
 6zT5m4AWhQwd0Cr0JzkbKZASk9RRmR+lx5pzJ4RwaRcSLe18iRbHllV8CiWuVfT2TLuP4V
 NA0lDDf+NnVhNPBrwFburGdVCWw3/n6uHIxCYQj+kOejH4rF7AckMmGGIXV9Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Gjvc2MO8
Subject: Re: [Buildroot] [PATCH v2 2/2] package/boost: remove dependencies
 on Boost.System
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
> Boost.System is a header only library since Boost 1.69.0 [0].
> 
> A Stub Library remained for backward compatibility. This
> mainly affects CMake Packages that use FindPackage and
> explicitly list 'system'.
> 
> For Boost internal modules this is not the case so remove this
> dependency.
> 
> Buildroot packages should select BR2_PACKAGE_BOOST_SYSTEM explicitly
> if needed and not rely on a proxy dependency from other boost packages.
> 
> [0] https://github.com/boostorg/system/blob/develop/doc/system/changes.adoc#changes-in-boost-169
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/boost/Config.in | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index c7c90aa9ab..fc7fd1c6cb 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -24,7 +24,6 @@ config BR2_PACKAGE_BOOST_ATOMIC
>  
>  config BR2_PACKAGE_BOOST_CHRONO
>  	bool "boost-chrono"
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	help
>  	  Useful time utilities. C++11.
>  
> @@ -62,7 +61,6 @@ config BR2_PACKAGE_BOOST_CONTRACT
>  	bool "boost-contract"
>  	# pthread_condattr_setclock
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	help
>  	  Contract programming for C++.
>  
> @@ -77,7 +75,6 @@ config BR2_PACKAGE_BOOST_COROUTINE
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
>  	select BR2_PACKAGE_BOOST_CHRONO
>  	select BR2_PACKAGE_BOOST_CONTEXT
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	select BR2_PACKAGE_BOOST_THREAD
>  	help
>  	  deprecated coroutine library, the non-deprecated coroutine2
> @@ -117,7 +114,6 @@ config BR2_PACKAGE_BOOST_FIBER
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	select BR2_PACKAGE_BOOST_CONTEXT
>  	select BR2_PACKAGE_BOOST_FILESYSTEM
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	help
>  	  C++11 userland threads library.
>  
> @@ -134,7 +130,6 @@ config BR2_PACKAGE_BOOST_FILESYSTEM
>  	bool "boost-filesystem"
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
>  	select BR2_PACKAGE_BOOST_ATOMIC
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	help
>  	  The Boost Filesystem Library provides portable facilities to
>  	  query and manipulate paths, files, and directories.
> @@ -184,7 +179,6 @@ config BR2_PACKAGE_BOOST_LOCALE
>  	depends on !(BR2_TOOLCHAIN_HAS_GCC_BUG_64735 && BR2_PACKAGE_ICU) # boost-thread
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
>  		|| !BR2_PACKAGE_ICU # boost-thread
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	select BR2_PACKAGE_BOOST_THREAD if BR2_PACKAGE_ICU
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	help
> @@ -209,7 +203,6 @@ config BR2_PACKAGE_BOOST_LOG
>  	select BR2_PACKAGE_BOOST_DATE_TIME
>  	select BR2_PACKAGE_BOOST_FILESYSTEM
>  	select BR2_PACKAGE_BOOST_REGEX
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	select BR2_PACKAGE_BOOST_THREAD
>  	help
>  	  Logging library.
> @@ -279,7 +272,6 @@ config BR2_PACKAGE_BOOST_PYTHON
>  
>  config BR2_PACKAGE_BOOST_RANDOM
>  	bool "boost-random"
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	help
>  	  A complete system for random number generation.
>  
> @@ -306,13 +298,14 @@ comment "boost-stacktrace needs a toolchain w/ dynamic library"
>  config BR2_PACKAGE_BOOST_SYSTEM
>  	bool "boost-system"
>  	help
> -	  Operating system support, including the diagnostics support
> -	  that will be part of the C++0x standard library.
> +	  Extensible Error Reporting.      
> +
> +	  This library is now header only. Building a stub library
> +	  is still supported for backward compatibility.
>  
>  config BR2_PACKAGE_BOOST_TEST
>  	bool "boost-test"
>  	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	select BR2_PACKAGE_BOOST_TIMER
>  	help
>  	  Support for simple program testing, full unit testing, and for
> @@ -323,7 +316,6 @@ config BR2_PACKAGE_BOOST_THREAD
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
>  	select BR2_PACKAGE_BOOST_CHRONO
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	help
>  	  Portable C++ multi-threading. C++11, C++14.
>  
> @@ -333,7 +325,6 @@ comment "boost-thread needs a toolchain not affected by GCC bug 64735"
>  config BR2_PACKAGE_BOOST_TIMER
>  	bool "boost-timer"
>  	select BR2_PACKAGE_BOOST_CHRONO
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	help
>  	  Event timer, progress timer, and progress display classes.
>  
> @@ -341,7 +332,6 @@ config BR2_PACKAGE_BOOST_TYPE_ERASURE
>  	bool "boost-type_erasure"
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	select BR2_PACKAGE_BOOST_THREAD
>  	help
>  	  Runtime polymorphism based on concepts.
> @@ -371,7 +361,6 @@ config BR2_PACKAGE_BOOST_WAVE
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
>  	select BR2_PACKAGE_BOOST_DATE_TIME
>  	select BR2_PACKAGE_BOOST_FILESYSTEM
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	select BR2_PACKAGE_BOOST_THREAD
>  	help
>  	  The Boost.Wave library is a Standards conformant, and highly
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
