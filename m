Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EE3C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 025C3407D7;
	Thu, 12 Jun 2025 20:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYIPuVe1ycaD; Thu, 12 Jun 2025 20:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00D1E40773
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00D1E40773;
	Thu, 12 Jun 2025 20:28:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC11D183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7E8F40773
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8QGOOBWA6Fm for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:28:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7C5340770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7C5340770
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7C5340770
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:28:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3C121C0F53; Thu, 12 Jun 2025 22:28:52 +0200 (CEST)
Message-ID: <f1528ae1-b4a3-4b48-93bc-bad38ba245ce@rnout.be>
Date: Thu, 12 Jun 2025 22:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
References: <20250607114425.774736-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250607114425.774736-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749760132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EfIOKl+YZKh3TshSd5G50zr7GPemPgYJAdbVxr84HhY=;
 b=EFKnnldZKVg43xI7RGE0ENPu3UGaXrNaQYIigruhA0G3kvo4vnN1TpjppGISJOFMRu7wBu
 VBCCDTWvwFdO0mFMT8a96Q5c03fGXqHvMQaxsYKQPRqXJ9txaPdCwead2TyFIZG8HXF9os
 NDtelmqjCutG9fZ/k0qDxjabLtSXBOx/qL/F5W/z4sOukSZcx7GeDA7FXzAk/G/bFqAeIc
 CR76ppnRHsaBizB3r43CpsOwNcX5oWtQ7FVYFyHBE7NYMk8Q4fTP4qs3fAEkmPxpGiC8xC
 vyiyhjfOMCCSJ0IORHEZw7ZwkwWpsCHEp83+N3G4zm5OtilXQXhcTc3Z5FaJaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=EFKnnldZ
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/fluent-bit: build fix for
 toolchains w/o CXX
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2025 13:44, Thomas Perale via buildroot wrote:
> Since the package bump [1] the fluent-bit package started to fail
> because of an update introduced in fluent-bit v3.2.7 (see [2]).
> 
> The following error appeared on the autobuilder in the LTS branch.
> 
> ```
> CMake Error at /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/CMakeTestCXXCompiler.cmake:73 (message):
>    The C++ compiler
> 
>      "/bin/false"
> 
>    is not able to compile a simple test program.
> 
>    It fails with the following output:
> 
>      Change Dir: '/home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc'
> 
>      Run Build Command(s): /home/buildroot/instance-0/output-1/host/bin/ninja -v cmTC_71bbf
>      [1/2] /bin/false    -o CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o -c /home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc/testCXXCompiler.cxx
>      FAILED: CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o
>      /bin/false    -o CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o -c /home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc/testCXXCompiler.cxx
>      ninja: build stopped: subcommand failed.
> 
>    CMake will not be able to correctly generate this project.
> Call Stack (most recent call first):
>    lib/zstd-1.5.7/build/cmake/CMakeLists.txt:36 (project)
> ```
> 
> The commit [3] included two patches to fix the build error
> for configs using toolchains without CXX.
> 
> Since the build error was already present on v3.2.10,
> those patches actually fix the error for LTS version as well.
> This patch pick them from the series to apply them on the LTS
> branch.
> 
> [1] 8bc18fad29 package/fluent-bit: bump to 3.2.10
> [2] https://github.com/fluent/fluent-bit/commit/0ce59cecdc3c3f8053bebe9d5d9ef7b30fc6c4e6
> [3] 8181727e23 package/fluent-bit: bump to 4.0.0
> 
> Fixes: https://autobuild.buildroot.org/results/4b0/4b0646e8fcc3f023ab0173ea8725f381e5055152/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...able-CXX-support-if-tests-are-requir.patch | 34 +++++++++++++++++++
>   ...-lib-miniz-only-require-a-C-compiler.patch | 27 +++++++++++++++
>   2 files changed, 61 insertions(+)
>   create mode 100644 package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
>   create mode 100644 package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
> 
> diff --git a/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
> new file mode 100644
> index 0000000000..f7b282165c
> --- /dev/null
> +++ b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
> @@ -0,0 +1,34 @@
> +From b6d898185d441e00acad867c0c80aadf4d7b0d37 Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas@devoogdt.com>
> +Date: Tue, 1 Apr 2025 22:43:30 +0200
> +Subject: [PATCH] lib: zstd: only enable CXX support if tests are required
> +
> +Upstream: https://github.com/facebook/zstd/pull/4357/files
> +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> +---
> + lib/zstd-1.5.7/build/cmake/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
> +index 347d41c0f..70e233df3 100644
> +--- a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
> ++++ b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
> +@@ -37,7 +37,6 @@ project(zstd
> +   VERSION "${ZSTD_FULL_VERSION}"
> +   LANGUAGES C   # Main library is in C
> +             ASM # And ASM
> +-            CXX # Testing contributed code also utilizes CXX
> +   )
> +
> + message(STATUS "ZSTD VERSION: ${zstd_VERSION}")
> +@@ -170,6 +169,7 @@ if (ZSTD_BUILD_PROGRAMS)
> + endif ()
> +
> + if (ZSTD_BUILD_TESTS)
> ++    enable_language(CXX)
> +     enable_testing()
> +     if (NOT ZSTD_BUILD_STATIC)
> +         message(SEND_ERROR "You need to build static library to build tests")
> +--
> +2.43.0
> +
> diff --git a/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
> new file mode 100644
> index 0000000000..bfd32d6b68
> --- /dev/null
> +++ b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
> @@ -0,0 +1,27 @@
> +From 3732cea4bb3dd9b79732da7bfbf60258bc418195 Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas@devoogdt.com>
> +Date: Tue, 1 Apr 2025 23:01:13 +0200
> +Subject: [PATCH] lib: miniz: only require a C compiler
> +
> +Upstream: https://github.com/richgel999/miniz/pull/338
> +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> +---
> + lib/miniz/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/miniz/CMakeLists.txt b/lib/miniz/CMakeLists.txt
> +index ce6ade1c0..91012b36a 100644
> +--- a/lib/miniz/CMakeLists.txt
> ++++ b/lib/miniz/CMakeLists.txt
> +@@ -7,7 +7,7 @@ if(DEFINED PROJECT_NAME)
> + endif()
> +
> + if(CMAKE_MINOR_VERSION LESS 12)
> +-  project(miniz)
> ++  project(miniz C)
> +   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
> + else()
> +   project(miniz C)
> +--
> +2.43.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
