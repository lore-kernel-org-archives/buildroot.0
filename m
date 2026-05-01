Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4FAFF8864
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 08:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ED018546B;
	Fri,  1 May 2026 08:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRr_aaCZi6AJ; Fri,  1 May 2026 08:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D00885535
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777624343;
	bh=7/FnHFgxQ+QngXkmzbC4xQZZrxiqeE/FcQ1Zu4dD4U8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d20IAwtsLn6YfmGjKcW6UMAGnUSoEUdPaX50LbXhD8SZDzsFIU09RXrrVEGIFE9sI
	 19LjRy0oSQYbHWHCdv5ZmXXfgo87tjzliM9zwsP0Tg1C1NR82m5+ikXD6tbwpac42/
	 zEJKUqxLpA4hF2/EZatc28393GFXXhfroe7D3QI5bLyBVSk5toXaeD4BtRdtirt7NA
	 QzpeJNFUt2ORqtkBOWVs6lF7djfXA2feCbmP9ro3W52u5A4+SD8Pdo1uF7ZbPMJzYY
	 bbH8+Hnb6mrdyZbDRsGItQn3SxV3znO9RrwQKpBtyG4BuaGj1X+Ll7Sj32jkgRvRZ0
	 QHcEBUkJCU1iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D00885535;
	Fri,  1 May 2026 08:32:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F8CC127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 08:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10FB740FE9
 for <buildroot@buildroot.org>; Fri,  1 May 2026 08:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eW1WoGR4Vn6J for <buildroot@buildroot.org>;
 Fri,  1 May 2026 08:32:20 +0000 (UTC)
X-Greylist: delayed 66142 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 01 May 2026 08:32:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3BD9D40A0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BD9D40A0B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BD9D40A0B
 for <buildroot@buildroot.org>; Fri,  1 May 2026 08:32:18 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:510c:d018:eae4:1043] (unknown
 [IPv6:2a01:e0a:12:eba0:510c:d018:eae4:1043])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 02F80BFBE6;
 Fri,  1 May 2026 10:32:13 +0200 (CEST)
Message-ID: <1ca6c61b-5edc-4e77-a0f5-10f9214e8414@grenoble.cnrs.fr>
Date: Fri, 1 May 2026 10:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260501062316.1942112-1-bernd@kuhls.net>
 <20260501062316.1942112-22-bernd@kuhls.net>
Content-Language: en-US, fr
In-Reply-To: <20260501062316.1942112-22-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1777624335;
 bh=w0WJm6cyOdppsiepRHJAF1AaJL+DCLnqBrnfuByGgU0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TW7CEUdG9pGuhyAmyvyDGXoMSVg6tBzNKslZFxzsayI3PGykePtnPrLa/yFxNFt1t
 kJZYAh38zzpns139nJDRjJMRN/9Y3dfTDH53F8A1RDVp+5KrVPH+ihD6xKTzLD3630
 hgEmvTnckjeU4IMu8tIKf9g9ugj+ehGd1NzyeintVSjoZeEBQDYmeSwiBhxIdtwahx
 81CrMtvQ1KToBArPA2Sg7l11blhrkaR/Hm6Cj7BQBhI7VAN9lIaIpvphs8ecge1KXw
 rx5945Ni7ETNsoN7xGVgf37f88fwItDLArrnBJxfc+hTLXh16/E/YMDmEJ5ysxSK6A
 4JDA60OYuliZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=TW7CEUdG
Subject: Re: [Buildroot] [PATCH v3 21/21] package/gcc: drop support for GCC
 13.x
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd! Hello all!

On 2026-05-01, Bernd Kuhls wrote:
> Now that we have added support for GCC 16.x, made GCC 15.x the
> default, let's drop support for GCC 13.x.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |   1 -
>  Config.in.legacy                              |   7 +
>  ...le-split-stack-for-non-thread-builds.patch |  26 ----
>  ...ISC-V-fix-build-issue-with-gcc-4.9.x.patch |  48 ------
>  ...emove-crypt-and-crypt_r-interceptors.patch | 146 ------------------
>  ...bsanitizer-Fix-build-with-glibc-2.42.patch |  81 ----------
>  package/gcc/Config.in.host                    |  13 --
>  package/gcc/gcc.hash                          |   2 -
>  8 files changed, 7 insertions(+), 317 deletions(-)
>  delete mode 100644 package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
>  delete mode 100644 package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
>  delete mode 100644 package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
>  delete mode 100644 package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index d7d0a9b6b6..347c4a2239 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -355,7 +355,6 @@ package/ftop/0001-overflow.patch lib_patch.Upstream
>  package/fwts/0001-build-do-not-use-Werror.patch lib_patch.Upstream
>  package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch lib_patch.Upstream
>  package/fxload/0001-fix-static-build.patch lib_patch.Upstream
> -package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
>  package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
>  package/gcc/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
>  package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
> diff --git a/Config.in.legacy b/Config.in.legacy
> index ead9ceaa08..2704ca288c 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2026.05"
>  
> +config BR2_GCC_VERSION_13_X
> +	bool "gcc 13.x support removed"
> +	select BR2_LEGACY
> +	help
> +	  Support for building a toolchain based on GCC 13.x has been
> +	  removed, chose a newer GCC version instead.
> +
>  config BR2_KERNEL_HEADERS_6_19
>  	bool "kernel headers version 6.19.x are no longer supported"
>  	select BR2_LEGACY
> diff --git a/package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
> deleted file mode 100644
> index e801085dad..0000000000
> --- a/package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 4f67134e0b1404fef4ea72342be8fab4c37ca8c8 Mon Sep 17 00:00:00 2001
> -From: Waldemar Brodkorb <wbx@openadk.org>
> -Date: Mon, 25 Jul 2022 00:29:55 +0200
> -Subject: [PATCH] disable split-stack for non-thread builds
> -
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -[Romain: convert to git format]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ----
> - libgcc/config/t-stack | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
> -index cc0366b4cd8..f3f97e86d60 100644
> ---- a/libgcc/config/t-stack
> -+++ b/libgcc/config/t-stack
> -@@ -1,4 +1,6 @@
> - # Makefile fragment to provide generic support for -fsplit-stack.
> - # This should be used in config.host for any host which supports
> - # -fsplit-stack.
> -+ifeq ($(enable_threads),yes)
> - LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
> -+endif
> --- 
> -2.34.3
> -
> diff --git a/package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
> deleted file mode 100644
> index 4368f08404..0000000000
> --- a/package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From e5253b777eefef7d66d3bd1c641de6d133d3573d Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@gmail.com>
> -Date: Tue, 2 May 2023 14:21:55 +0200
> -Subject: [PATCH] RISC-V: fix build issue with gcc 4.9.x
> -
> -GCC should still build with GCC 4.8.3 or newer [1]
> -using C++03 by default. But a recent change in
> -RISC-V port introduced a C++11 feature "std::log2" [2].
> -
> -Use log2 from the C header, without the namespace [3].
> -
> -[1] https://gcc.gnu.org/install/prerequisites.html
> -[2] https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=7caa1ae5e451e780fbc4746a54e3f19d4f4304dc
> -[3] https://stackoverflow.com/questions/26733413/error-log2-is-not-a-member-of-std
> -
> -Fixes:
> -https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276589
> -
> -gcc/ChangeLog:
> -	* config/riscv/genrvv-type-indexer.cc: Use log2 from the C header, without
> -	the namespace.
> -
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> -Upstream: https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=87c347c2897537a6aa391efbfc5ed00c625434fe
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - gcc/config/riscv/genrvv-type-indexer.cc | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gcc/config/riscv/genrvv-type-indexer.cc b/gcc/config/riscv/genrvv-type-indexer.cc
> -index e677b55290c..eebe382d1c3 100644
> ---- a/gcc/config/riscv/genrvv-type-indexer.cc
> -+++ b/gcc/config/riscv/genrvv-type-indexer.cc
> -@@ -115,9 +115,9 @@ same_ratio_eew_type (unsigned sew, int lmul_log2, unsigned eew, bool unsigned_p,
> -   if (sew == eew)
> -     elmul_log2 = lmul_log2;
> -   else if (sew > eew)
> --    elmul_log2 = lmul_log2 - std::log2 (sew / eew);
> -+    elmul_log2 = lmul_log2 - log2 (sew / eew);
> -   else /* sew < eew */
> --    elmul_log2 = lmul_log2 + std::log2 (eew / sew);
> -+    elmul_log2 = lmul_log2 + log2 (eew / sew);
> - 
> -   if (float_p)
> -     return floattype (eew, elmul_log2);
> --- 
> -2.34.3
> -
> diff --git a/package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
> deleted file mode 100644
> index 98bfed5949..0000000000
> --- a/package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
> +++ /dev/null
> @@ -1,146 +0,0 @@
> -From 3521d93c552a11640a959ee61d551c225981c448 Mon Sep 17 00:00:00 2001
> -From: Fangrui Song <i@maskray.me>
> -Date: Fri, 28 Apr 2023 09:59:17 -0700
> -Subject: [PATCH] Remove crypt and crypt_r interceptors
> -
> -From Florian Weimer's D144073
> -
> -> On GNU/Linux (glibc), the crypt and crypt_r functions are not part of the main shared object (libc.so.6), but libcrypt (with multiple possible sonames). The sanitizer libraries do not depend on libcrypt, so it can happen that during sanitizer library initialization, no real implementation will be found because the crypt, crypt_r functions are not present in the process image (yet). If its interceptors are called nevertheless, this results in a call through a null pointer when the sanitizer library attempts to forward the call to the real implementation.
> ->
> -> Many distributions have already switched to libxcrypt, a library that is separate from glibc and that can be build with sanitizers directly (avoiding the need for interceptors). This patch disables building the interceptor for glibc targets.
> -
> -Let's remove crypt and crypt_r interceptors (D68431) to fix issues with
> -newer glibc.
> -
> -For older glibc, msan will not know that an uninstrumented crypt_r call
> -initializes `data`, so there is a risk for false positives. However, with some
> -codebase survey, I think crypt_r uses are very few and the call sites typically
> -have a `memset(&data, 0, sizeof(data));` anyway.
> -
> -Fix https://github.com/google/sanitizers/issues/1365
> -Related: https://bugzilla.redhat.com/show_bug.cgi?id=2169432
> -
> -Reviewed By: #sanitizers, fweimer, thesamesam, vitalybuka
> -
> -Differential Revision: https://reviews.llvm.org/D149403
> -
> -[Thomas: taken from Crosstool-NG]
> -Upstream: (llvm) https://github.com/llvm/llvm-project/commit/d7bead833631486e337e541e692d9b4a1ca14edd
> -Upstream: (gcc)  https://github.com/gcc-mirror/gcc/commit/d96e14ceb9475f9bccbbc0325d5b11419fad9246
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - .../sanitizer_common_interceptors.inc         | 37 -------------------
> - .../sanitizer_platform_interceptors.h         |  2 -
> - .../sanitizer_platform_limits_posix.cpp       |  8 ----
> - .../sanitizer_platform_limits_posix.h         |  1 -
> - 4 files changed, 48 deletions(-)
> -
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
> -index ba4b80081f0..662c4199742 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
> -+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
> -@@ -10187,41 +10187,6 @@ INTERCEPTOR(SSIZE_T, getrandom, void *buf, SIZE_T buflen, unsigned int flags) {
> - #define INIT_GETRANDOM
> - #endif
> - 
> --#if SANITIZER_INTERCEPT_CRYPT
> --INTERCEPTOR(char *, crypt, char *key, char *salt) {
> --  void *ctx;
> --  COMMON_INTERCEPTOR_ENTER(ctx, crypt, key, salt);
> --  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
> --  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
> --  char *res = REAL(crypt)(key, salt);
> --  if (res != nullptr)
> --    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
> --  return res;
> --}
> --#define INIT_CRYPT COMMON_INTERCEPT_FUNCTION(crypt);
> --#else
> --#define INIT_CRYPT
> --#endif
> --
> --#if SANITIZER_INTERCEPT_CRYPT_R
> --INTERCEPTOR(char *, crypt_r, char *key, char *salt, void *data) {
> --  void *ctx;
> --  COMMON_INTERCEPTOR_ENTER(ctx, crypt_r, key, salt, data);
> --  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
> --  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
> --  char *res = REAL(crypt_r)(key, salt, data);
> --  if (res != nullptr) {
> --    COMMON_INTERCEPTOR_WRITE_RANGE(ctx, data,
> --                                   __sanitizer::struct_crypt_data_sz);
> --    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
> --  }
> --  return res;
> --}
> --#define INIT_CRYPT_R COMMON_INTERCEPT_FUNCTION(crypt_r);
> --#else
> --#define INIT_CRYPT_R
> --#endif
> --
> - #if SANITIZER_INTERCEPT_GETENTROPY
> - INTERCEPTOR(int, getentropy, void *buf, SIZE_T buflen) {
> -   void *ctx;
> -@@ -10772,8 +10737,6 @@ static void InitializeCommonInterceptors() {
> -   INIT_GETUSERSHELL;
> -   INIT_SL_INIT;
> -   INIT_GETRANDOM;
> --  INIT_CRYPT;
> --  INIT_CRYPT_R;
> -   INIT_GETENTROPY;
> -   INIT_QSORT;
> -   INIT_QSORT_R;
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
> -index 8307b1ec28b..d50166ee6ce 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
> -+++ b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
> -@@ -571,8 +571,6 @@
> - #define SANITIZER_INTERCEPT_FDEVNAME SI_FREEBSD
> - #define SANITIZER_INTERCEPT_GETUSERSHELL (SI_POSIX && !SI_ANDROID)
> - #define SANITIZER_INTERCEPT_SL_INIT (SI_FREEBSD || SI_NETBSD)
> --#define SANITIZER_INTERCEPT_CRYPT (SI_POSIX && !SI_ANDROID)
> --#define SANITIZER_INTERCEPT_CRYPT_R (SI_LINUX && !SI_ANDROID)
> - 
> - #define SANITIZER_INTERCEPT_GETRANDOM \
> -   ((SI_LINUX && __GLIBC_PREREQ(2, 25)) || SI_FREEBSD)
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -index c85cf1626a7..bcbd143d19d 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -@@ -176,10 +176,6 @@ typedef struct user_fpregs elf_fpregset_t;
> - #  include "sanitizer_platform_interceptors.h"
> - #  include "sanitizer_platform_limits_posix.h"
> - 
> --#if SANITIZER_INTERCEPT_CRYPT_R
> --#include <crypt.h>
> --#endif
> --
> - namespace __sanitizer {
> -   unsigned struct_utsname_sz = sizeof(struct utsname);
> -   unsigned struct_stat_sz = sizeof(struct stat);
> -@@ -283,10 +279,6 @@ namespace __sanitizer {
> -   unsigned struct_statvfs64_sz = sizeof(struct statvfs64);
> - #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
> - 
> --#if SANITIZER_INTERCEPT_CRYPT_R
> --  unsigned struct_crypt_data_sz = sizeof(struct crypt_data);
> --#endif
> --
> - #if SANITIZER_LINUX && !SANITIZER_ANDROID
> -   unsigned struct_timex_sz = sizeof(struct timex);
> -   unsigned struct_msqid_ds_sz = sizeof(struct msqid_ds);
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -index 44dd3d9e22d..29ebb304a9b 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -@@ -319,7 +319,6 @@ extern unsigned struct_msqid_ds_sz;
> - extern unsigned struct_mq_attr_sz;
> - extern unsigned struct_timex_sz;
> - extern unsigned struct_statvfs_sz;
> --extern unsigned struct_crypt_data_sz;
> - #endif  // SANITIZER_LINUX && !SANITIZER_ANDROID
> - 
> - struct __sanitizer_iovec {
> --- 
> -2.43.0
> -
> diff --git a/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch b/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
> deleted file mode 100644
> index 13f7f469c4..0000000000
> --- a/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
> -From: Florian Weimer <fweimer@redhat.com>
> -Date: Fri, 2 May 2025 17:41:43 +0200
> -Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
> -
> -The termio structure will be removed from glibc 2.42.  It has
> -been deprecated since the late 80s/early 90s.
> -
> -Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
> -("[sanitizer_common] Remove interceptors for deprecated struct termio
> -(#137403)").
> -
> -Co-Authored-By: Tom Stellard <tstellar@redhat.com>
> -
> -libsanitizer/
> -
> -	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
> -	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
> -	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
> -	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
> -
> -Upstream: 1789c57dc97ea2f9819ef89e28bf17208b6208e7 (gcc master branch)
> -Upstream: d32ece49d32b00448d967e7dbc6900fb25cbc775 (gcc 15.x branch)
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
> - .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
> - .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
> - 3 files changed, 12 deletions(-)
> -
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> -index 49ec4097c90..dda11daa77f 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> -+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> -@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
> -   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
> -   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
> -   _(TCFLSH, NONE, 0);
> --#if SANITIZER_GLIBC
> --  _(TCGETA, WRITE, struct_termio_sz);
> --#endif
> -   _(TCGETS, WRITE, struct_termios_sz);
> -   _(TCSBRK, NONE, 0);
> -   _(TCSBRKP, NONE, 0);
> --#if SANITIZER_GLIBC
> --  _(TCSETA, READ, struct_termio_sz);
> --  _(TCSETAF, READ, struct_termio_sz);
> --  _(TCSETAW, READ, struct_termio_sz);
> --#endif
> -   _(TCSETS, READ, struct_termios_sz);
> -   _(TCSETSF, READ, struct_termios_sz);
> -   _(TCSETSW, READ, struct_termios_sz);
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -index c87d5ef42c9..7bbc6f2edac 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> -   unsigned struct_input_id_sz = sizeof(struct input_id);
> -   unsigned struct_mtpos_sz = sizeof(struct mtpos);
> -   unsigned struct_rtentry_sz = sizeof(struct rtentry);
> --#if SANITIZER_GLIBC || SANITIZER_ANDROID
> --  unsigned struct_termio_sz = sizeof(struct termio);
> --#endif
> -   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
> -   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
> -   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -index c07f7cd0b0d..a80df656826 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
> - extern unsigned struct_input_absinfo_sz;
> - extern unsigned struct_input_id_sz;
> - extern unsigned struct_mtpos_sz;
> --extern unsigned struct_termio_sz;
> - extern unsigned struct_vt_consize_sz;
> - extern unsigned struct_vt_sizes_sz;
> - extern unsigned struct_vt_stat_sz;
> --- 
> -2.50.1
> -
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index e218b13bd2..cbad2aa12a 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -22,14 +22,6 @@ config BR2_GCC_VERSION_POWERPC_SPE
>  	depends on BR2_POWERPC_CPU_HAS_SPE
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
> -config BR2_GCC_VERSION_13_X
> -	bool "gcc 13.x"
> -	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
> -	# powerpc spe support has been deprecated since gcc 8.x.
> -	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
> -	depends on !BR2_POWERPC_CPU_HAS_SPE
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> -
>  config BR2_GCC_VERSION_14_X
>  	bool "gcc 14.x"
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
> @@ -76,8 +68,6 @@ config BR2_GCC_SUPPORTS_DLANG
>  config BR2_GCC_VERSION
>  	string
>  	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
> -	default "13.4.0"    if BR2_GCC_VERSION_13_X
> -	default "14.3.0"    if BR2_GCC_VERSION_14_X


Looks like the typo is back...

have a nice day!

Edgar.

>  	default "15.2.0"    if BR2_GCC_VERSION_15_X
>  	default "16.1.0"    if BR2_GCC_VERSION_16_X
>  	default "arc-2024.12-release" if BR2_GCC_VERSION_ARC
> @@ -107,9 +97,6 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
>  	# on architecture building libquadmath, wchar is required
>  	depends on !BR2_TOOLCHAIN_HAS_LIBQUADMATH || \
>  		(BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR)
> -	# internal compiler error: in gen_reg_rtx, at emit-rtl.cc:1167
> -	# fixed in gcc 14.x, so disable gcc 13.x
> -	depends on !(BR2_microblaze && BR2_GCC_VERSION_13_X)
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	help
>  	  Enable this option if you want your toolchain to support the
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index da6aa6e879..0b17a809c8 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -1,7 +1,5 @@
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
>  sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
> -# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.4.0/sha512.sum
> -sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
>  sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
