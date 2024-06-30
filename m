Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D1BC30653
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 09:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A50224094F;
	Sun, 30 Jun 2024 09:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ix_ZYO6EeotA; Sun, 30 Jun 2024 09:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 228C7408D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 228C7408D1;
	Sun, 30 Jun 2024 09:29:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76A2E1BF969
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6414C4090F
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 245TOR9MLgWs for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 09:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89B02405AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89B02405AE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89B02405AE
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 09:29:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7E00213F81D;
 Sun, 30 Jun 2024 11:29:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Jun 2024 11:29:29 +0200
Date: Sun, 30 Jun 2024 11:29:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZoEleQA02NoAZXh2@landeda>
References: <20240629121349.9391-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240629121349.9391-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719739771;
 bh=eNm48c4M0FUJf2IFSParEcwwQ0Y7GObpJzOzOkbn+vE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GsD/hFjjE/RvFQ9Qo3QW/8wVHFudZLyOyyOSRUkCkzNW+xXsukpG2l4WswBAzWsHd
 Ds2K8N4AIVViyMb3TR9zoVQ26VsTeJ4zSxOubzrHlzvg9Tmo5whXkI7UGs7Jr1SgOb
 MfWIc/Q7wlO5dIFKg+JNfknYF9jiBiJqJz+2GrrZKHCW6sQ6KmSL0/99o8RTNMOWS3
 dkJqDjK7oBWMgAcet+nVL0lplnfREFeU331f6QI3gr/FrlhDF8Z1NteHRqH35/oG/h
 9JkNxspbYalxFr2KOyvXgiyEM1v4R/ZhTRYzailnxGNcj2GRUPuLUzOGHEWDJ7iJOT
 vzRefAms2x7ZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GsD/hFjj
Subject: Re: [Buildroot] [PATCH v2 1/1] package/eigen: fix patch fuzz
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

On 2024-06-29 14:13 +0200, Julien Olivain spake thusly:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, eigen fails to build with output:
> 
>     Applying 0001-Adds-new-CMake-Options-for-controlling-build-components.patch using patch:
>     patching file CMakeLists.txt
>     Hunk #1 succeeded at 495 (offset 18 lines).
>     Hunk #2 succeeded at 615 (offset 1 line).
>     Hunk #3 succeeded at 652 (offset -8 lines).
>     patching file blas/CMakeLists.txt
>     patching file lapack/CMakeLists.txt
>     Hunk #1 FAILED at 1.
>     Hunk #2 succeeded at 450 (offset -7 lines).
>     1 out of 2 hunks FAILED -- saving rejects to file lapack/CMakeLists.txt.rej
> 
> This commit refreshes the package patch on the current package version.
> Since the patch file name changed in the regeneration, the
> ".checkpackageignore" entry is updated accordingly.
> 
> Fixes:
> http://autobuild.buildroot.org/results/6fd059b4e7f83a38683341ea1ea02e13d1a92449
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Change v1 -> v2:
> - update .checkpackageignore entry
> ---
>  .checkpackageignore                           |  2 +-
>  ...tions-for-controlling-build-compone.patch} | 25 +++++++++++--------
>  2 files changed, 15 insertions(+), 12 deletions(-)
>  rename package/eigen/{0001-Adds-new-CMake-Options-for-controlling-build-components.patch => 0001-Adds-new-CMake-Options-for-controlling-build-compone.patch} (80%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 313201b0e68..9d441eb4276 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -564,7 +564,7 @@ package/ecryptfs-utils/0003-fix-parallel-build-issue.patch lib_patch.Upstream
>  package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch lib_patch.Upstream
>  package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch lib_patch.Upstream
>  package/efl/0003-ecore_fb-fix-build-with-tslib.patch lib_patch.Upstream
> -package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch lib_patch.Upstream
> +package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch lib_patch.Upstream
>  package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch lib_patch.Upstream
>  package/ejabberd/0002-fix-ejabberdctl.patch lib_patch.Upstream
>  package/ejabberd/0003-correct-includes.patch lib_patch.Upstream
> diff --git a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
> similarity index 80%
> rename from package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
> rename to package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
> index 693e610d0a8..737e7d39b71 100644
> --- a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
> +++ b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
> @@ -1,4 +1,4 @@
> -From cf82186416d04ea5df2a397d8fe09dc78d40ca65 Mon Sep 17 00:00:00 2001
> +From f49d5c1a6b7c22be359189cd0b1e2e766bd05365 Mon Sep 17 00:00:00 2001
>  From: =?UTF-8?q?Antonio=20S=C3=A1nchez?= <cantonios@google.com>
>  Date: Sat, 5 Mar 2022 05:49:45 +0000
>  Subject: [PATCH] Adds new CMake Options for controlling build components.
> @@ -6,6 +6,8 @@ Subject: [PATCH] Adds new CMake Options for controlling build components.
>  [Retrieved from:
>  https://gitlab.com/libeigen/eigen/-/commit/cf82186416d04ea5df2a397d8fe09dc78d40ca65]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Julien: rebased patch on 3.4.0]
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
>  ---
>   CMakeLists.txt        | 6 ++++++
>   blas/CMakeLists.txt   | 3 ++-
> @@ -13,10 +15,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   3 files changed, 13 insertions(+), 1 deletion(-)
>  
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index de1c23e91..0af36a53a 100644
> +index f3e69b845..74ff755f5 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -477,6 +477,9 @@ if(EIGEN_BUILD_TESTING)
> +@@ -495,6 +495,9 @@ if(BUILD_TESTING)
>     add_subdirectory(failtest)
>   endif()
>   
> @@ -26,7 +28,7 @@ index de1c23e91..0af36a53a 100644
>   if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
>     add_subdirectory(blas)
>     add_subdirectory(lapack)
> -@@ -611,6 +614,8 @@ set_target_properties (eigen PROPERTIES EXPORT_NAME Eigen)
> +@@ -612,6 +615,8 @@ set_target_properties (eigen PROPERTIES EXPORT_NAME Eigen)
>   
>   install (TARGETS eigen EXPORT Eigen3Targets)
>   
> @@ -35,7 +37,7 @@ index de1c23e91..0af36a53a 100644
>   configure_package_config_file (
>     ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Eigen3Config.cmake.in
>     ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
> -@@ -655,6 +660,7 @@ install (FILES ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
> +@@ -647,6 +652,7 @@ install ( FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake/UseEigen3.cmake
>   # Add uninstall target
>   add_custom_target ( uninstall
>       COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/EigenUninstall.cmake)
> @@ -44,7 +46,7 @@ index de1c23e91..0af36a53a 100644
>   if (EIGEN_SPLIT_TESTSUITE)
>     ei_split_testsuite("${EIGEN_SPLIT_TESTSUITE}")
>  diff --git a/blas/CMakeLists.txt b/blas/CMakeLists.txt
> -index 8d3cb86dc..c530957fb 100644
> +index f3a94ec4a..d07090f69 100644
>  --- a/blas/CMakeLists.txt
>  +++ b/blas/CMakeLists.txt
>  @@ -1,6 +1,7 @@
> @@ -55,17 +57,18 @@ index 8d3cb86dc..c530957fb 100644
>   include(CheckLanguage)
>   check_language(Fortran)
>   if(CMAKE_Fortran_COMPILER)
> -@@ -59,4 +60,4 @@ if(EIGEN_BUILD_TESTING)
> +@@ -59,4 +60,4 @@ if(BUILD_TESTING)
>   endif()
>   
>   endif()
>  -
>  +endif()
>  diff --git a/lapack/CMakeLists.txt b/lapack/CMakeLists.txt
> -index c8ca64001..8d6d75401 100644
> +index e48497fda..71255d96d 100644
>  --- a/lapack/CMakeLists.txt
>  +++ b/lapack/CMakeLists.txt
> -@@ -1,5 +1,7 @@
> +@@ -1,6 +1,8 @@
> + 
>   project(EigenLapack CXX)
>   
>  +if(EIGEN_BUILD_LAPACK AND EIGEN_BUILD_BLAS)
> @@ -73,7 +76,7 @@ index c8ca64001..8d6d75401 100644
>   include(CheckLanguage)
>   check_language(Fortran)
>   if(CMAKE_Fortran_COMPILER)
> -@@ -457,3 +459,6 @@ if(EXISTS ${eigen_full_path_to_testing_lapack})
> +@@ -450,3 +452,6 @@ if(EXISTS ${eigen_full_path_to_testing_lapack})
>   
>   endif()
>   
> @@ -81,5 +84,5 @@ index c8ca64001..8d6d75401 100644
>  + message(FATAL_ERROR "EIGEN_BUILD_LAPACK requires EIGEN_BUILD_BLAS")
>  +endif() #EIGEN_BUILD_LAPACK
>  -- 
> -GitLab
> +2.45.2
>  
> -- 
> 2.45.2
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
