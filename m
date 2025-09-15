Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786D7CAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E3DF608D1;
	Mon, 15 Sep 2025 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFgS5tJct1gC; Mon, 15 Sep 2025 21:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4429E60B56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4429E60B56;
	Mon, 15 Sep 2025 21:00:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DC2D1F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 143BF40430
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 21:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdpoOj5DIGRV for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 21:00:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6DD540404
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6DD540404
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6DD540404
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 21:00:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0A3FB2003C8;
 Mon, 15 Sep 2025 23:00:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Sep 2025 23:00:08 +0200
MIME-Version: 1.0
Date: Mon, 15 Sep 2025 23:00:08 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915200742.299662-1-fido_max@inbox.ru>
References: <20250915200742.299662-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.11
Message-ID: <511eb8df048c640ed2299f56cb7f13d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757970010;
 bh=PCYVIDLsA7+O/Za8a15CntNhZYLtuj9hfp77pq0cSpU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=On3qe+QYtEZUQPmvgtUhfmxa3j7HJEyPATOZbt/qWYAhR0bft29mcrfi3j8/B3azG
 T50dB0ogkO1eC2kPrRpOkLJz9+k5lxEFmAuy0nQCtAUacvldUqv11G6QVNTpg7Busy
 Sw8MAO8D8ZS8EvvJyOda5AcJtV+VvyTYu+JS9OMfO/+Pd8abMRBxsTywNk3zR8nC7H
 6qxZbDXInACqOrVkj/uR34PbHc6J6QZOxG9fxmFFEnBzyoDdgVRS6jn2ddQssOw1oD
 ghj64d+TCA5PGkXaZio1trhbRQkppVGGiV16O8bbSbrS6F11UhmnjgyY/C53fUlW6M
 38vK4Ln1Sf31w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=On3qe+QY
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libgeos: bump version to
 3.14.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxim,

On 15/09/2025 22:07, Maxim Kochetkov via buildroot wrote:
> Changelog: https://github.com/libgeos/geos/releases/tag/3.14.0
> 
> Bump minimal GCC version to 7. (Switched to C++17 as minimum 
> requirement)
> https://github.com/libgeos/geos/commit/e142764b77f4b8d0c36ec88406300c5f876743fb
> 
> Since commit 
> https://github.com/libgeos/geos/commit/26292ce88077321ced5db5869ea0b11cabaa2d12
> libgeos uses fenv.h to catch FPU exceptions. Some libc implementation 
> may
> have no fenv support. So add a patch to detect fenv.h availability.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Thanks for the updated patch. It now passes "test-pkg -a".
So I applied it on master, with few minor fixups. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/c7be3e603830f505c0c7df7e1b967122aa06fed0

I also have a small comment on your upstream patch proposal. See below.

[...]
> diff --git 
> a/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch 
> b/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch
> new file mode 100644
> index 0000000000..7b0760fba7
> --- /dev/null
> +++ 
> b/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch
> @@ -0,0 +1,70 @@
> +From a6bac7bd506988085fa692ff2e12727ae0e9db84 Mon Sep 17 00:00:00 2001
> +From: Maxim Kochetkov <fido_max@inbox.ru>
> +Date: Mon, 15 Sep 2025 17:16:08 +0300
> +Subject: [PATCH 1/1] geosop: make floating-point exceptions optional
> +
> +commit 26292ce ("geosop: show most floating-point exceptions in 
> verbose mode")
> +add fenv.h dependency. Some libc implementations (uclibc-ng )may have 
> no fenv
> +support. So make floating-point exceptions optional and detetct fenv.h 
> at
> +configure stage.
> +
> +Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> +---
> + CMakeLists.txt         | 7 +++++++
> + util/geosop/GeosOp.cpp | 6 ++++++
> + 2 files changed, 13 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 12411e586..a1e2f0c6e 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -558,3 +558,10 @@ if(PROJECT_IS_TOP_LEVEL)
> +
> +   unset(_is_multi_config_generator)
> + endif()  # PROJECT_IS_TOP_LEVEL
> ++
> ++include(CheckIncludeFile)
> ++check_include_file(fenv.h HAVE_FENV_H)
> ++
> ++if(HAVE_FENV_H)
> ++    target_compile_definitions(geos_cxx_flags INTERFACE HAVE_FENV)
> ++endif()
> +diff --git a/util/geosop/GeosOp.cpp b/util/geosop/GeosOp.cpp
> +index 2cb17f000..05307cf30 100644
> +--- a/util/geosop/GeosOp.cpp
> ++++ b/util/geosop/GeosOp.cpp
> +@@ -26,7 +26,9 @@
> + #include <geos/io/WKBStreamReader.h>
> + #include <geos/io/WKBWriter.h>
> +
> ++#if defined(HAVE_FENV)
> + #include <cfenv>
> ++#endif
> + #include <fstream>
> + #include <iostream>
> + #include <sstream>
> +@@ -394,10 +396,13 @@ void GeosOp::run(OpArguments& opArgs) {
> +     //------------------------
> +
> +     try {
> ++#if defined(HAVE_FENV)
> +         std::feclearexcept(FE_ALL_EXCEPT); // clear floating-point 
> status flags
> ++#endif
> +
> +         execute(op, opArgs);
> +
> ++#if defined(HAVE_FENV)
> +         // Catch everything except for FE_INEXACT, which is usually 
> harmless
> +         const int fpexp = std::fetestexcept(FE_ALL_EXCEPT ^ 
> FE_INEXACT);
> +         if (args.isVerbose && (fpexp != 0)) {
> +@@ -414,6 +419,7 @@ void GeosOp::run(OpArguments& opArgs) {
> +                 std::cerr << " FE_UNDERFLOW";

A side note for the upsteam: testing fenv.h alone might not be
sufficient for a complete package portability. Quoting the
fetestexcept() manual page:
https://linux.die.net/man/3/fetestexcept

"""
Each of the macros FE_DIVBYZERO, FE_INEXACT, FE_INVALID, FE_OVERFLOW,
FE_UNDERFLOW is defined when the implementation supports handling of
the corresponding exception...
"""

So it seems theoretically possible that an implementation has the
fenv.h header, but not all FE_ macros.

So each macro usage should probably be protected too. For example:

#if defined(FE_DIVBYZERO)
if (fpexp & FE_DIVBYZERO)
     std::cerr << " FE_DIVBYZERO";
#endif

In practice, in Buildroot, all toolchains having fenv.h are also
defining all the FE_ macros.

> +             std::cerr << std::endl;
> +         }
> ++#endif
> +     }
> +     catch (std::exception &e) {
> +         std::cerr << "Run-time exception: " << e.what() << std::endl;
> +--
> +2.51.0
> +

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
