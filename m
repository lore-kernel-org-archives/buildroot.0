Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E7BC5478A
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 18:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D941606F3;
	Wed, 21 Feb 2024 18:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7utO9KoecIEt; Wed, 21 Feb 2024 18:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DA5760F2C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DA5760F2C;
	Wed, 21 Feb 2024 18:03:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30C9C1BF2FD
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E1BF60F2C
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0kwQ7slbJ85M for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 18:03:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00454606F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00454606F3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00454606F3
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 18:03:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3B94113F879;
 Wed, 21 Feb 2024 19:03:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 19:03:27 +0100
Date: Wed, 21 Feb 2024 19:03:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZdY67xA1fbowX6pm@landeda>
References: <20240219221458.831078-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219221458.831078-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708538609;
 bh=m0BSHNoHeBdBwhu1vXBsrpCvmHzmQfnogs6knDFROA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PaZAhAgu2xVFIamOhVMIvwbeIzbDTwjgifMrptj2IZutA0m7X6tcBPZPXdZFSDxoZ
 60UKe6kMxlJjyCjH+BEgnwpHm8SJ3nh76uBPEuPkbthgvEqQM+nQvAYlmyl0gYVuJn
 zylXgHnCnUpueOhdI9euJEQzT43BkKBu9NPbXhX5dhBjBPwUWnnLsT5a1DLJELWiDr
 9OjxZOHR2Ca09BJNGYwtBaejhtAGQrq05TaEq9NaC8gk6hmRVl39RuK9AmKUnzsg78
 oAPD4LbvkkZTJvS0VEdmdvEuDM+Or6QxP58WxLdMTo57c7bg8X1DioQ2o/QAx+0/dX
 GTvuk0jsZEAWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PaZAhAgu
Subject: Re: [Buildroot] [PATCH 1/1] package/highway: bump to version 1.1.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-02-19 23:14 +0100, Julien Olivain spake thusly:
> For release note, see [1].
> 
> This commit removes the package patch, as it is now included in this new
> release.
> 
> LICENSE-BSD3 hash changed, due to reformatting. See [2].
> 
> [1] https://github.com/google/highway/releases/tag/1.1.0
> [2] https://github.com/google/highway/commit/edc35d14c77cb24dc1163989c762d69694e0e955
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...1-add-required-RISC-V-flags-to-CMake.patch | 42 -------------------
>  package/highway/highway.hash                  |  4 +-
>  package/highway/highway.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 45 deletions(-)
>  delete mode 100644 package/highway/0001-add-required-RISC-V-flags-to-CMake.patch
> 
> diff --git a/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch b/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch
> deleted file mode 100644
> index bfcbfb055cb..00000000000
> --- a/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 5d58d233fbcec0c6a39df8186a877329147324b3 Mon Sep 17 00:00:00 2001
> -From: Mathieu Malaterre <mathieu.malaterre@gmail.com>
> -Date: Wed, 13 Sep 2023 08:37:54 +0200
> -Subject: [PATCH] Add an option to opt-out of HWY_RISCV
> -
> -Fixes #1740
> -
> -Upstream: https://github.com/google/highway/commit/5d58d233fbcec0c6a39df8186a877329147324b3
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - CMakeLists.txt | 11 ++++++++---
> - 1 file changed, 8 insertions(+), 3 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index c2bf57b3f5..be639c945f 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -61,6 +61,9 @@ set(HWY_CMAKE_ARM7 OFF CACHE BOOL "Set copts for Armv7 with NEON (requires vfpv4
> - # skipped. For GCC 13.1+, you can also build with -fexcess-precision=standard.
> - set(HWY_CMAKE_SSE2 OFF CACHE BOOL "Set SSE2 as baseline for 32-bit x86?")
> - 
> -+# Currently this will compile the entire codebase with `-march=rv64gcv1p0`:
> -+set(HWY_CMAKE_RVV ON CACHE BOOL "Set copts for RISCV with RVV?")
> -+
> - # Unconditionally adding -Werror risks breaking the build when new warnings
> - # arise due to compiler/platform changes. Enable this in CI/tests.
> - set(HWY_WARNINGS_ARE_ERRORS OFF CACHE BOOL "Add -Werror flag?")
> -@@ -260,9 +263,11 @@ else()
> -     # gcc(13) and recent clang both support V, but not yet runtime dispatch, so
> -     # we add the gcv compiler flag, which then requires the CPU (now when using
> -     # either compiler) to support V.
> --    list(APPEND HWY_FLAGS -march=rv64gcv1p0)
> --    if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
> --      list(APPEND HWY_FLAGS -menable-experimental-extensions)
> -+    if(HWY_CMAKE_RVV)
> -+      list(APPEND HWY_FLAGS -march=rv64gcv1p0)
> -+      if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
> -+        list(APPEND HWY_FLAGS -menable-experimental-extensions)
> -+      endif()
> -     endif()
> -   endif()
> - 
> diff --git a/package/highway/highway.hash b/package/highway/highway.hash
> index 3cb497f20a7..270131134ec 100644
> --- a/package/highway/highway.hash
> +++ b/package/highway/highway.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  5434488108186c170a5e2fca5e3c9b6ef59a1caa4d520b008a9b8be6b8abe6c5  highway-1.0.7.tar.gz
> +sha256  354a8b4539b588e70b98ec70844273e3f2741302c4c377bcc4e81b3d1866f7c9  highway-1.1.0.tar.gz
>  sha256  43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1  LICENSE
> -sha256  6dcc159f448e3aca73a15e355d0a6735ca3fd224abe637e0b7437dce2d24f765  LICENSE-BSD3
> +sha256  d25e82e26acd42ca3ccc9993622631163425b869b9e16284226d534cff6470f2  LICENSE-BSD3
> diff --git a/package/highway/highway.mk b/package/highway/highway.mk
> index b45fa8df74d..3eb0d7a4aa2 100644
> --- a/package/highway/highway.mk
> +++ b/package/highway/highway.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HIGHWAY_VERSION = 1.0.7
> +HIGHWAY_VERSION = 1.1.0
>  HIGHWAY_SITE = $(call github,google,highway,$(HIGHWAY_VERSION))
>  HIGHWAY_LICENSE = Apache-2.0 or BSD-3-Clause
>  HIGHWAY_LICENSE_FILES = LICENSE LICENSE-BSD3
> -- 
> 2.43.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
