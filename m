Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C3EC5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 14:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0CC40C3D;
	Sat,  7 Jun 2025 14:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yG_u8zXueB3z; Sat,  7 Jun 2025 14:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E091B40C46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E091B40C46;
	Sat,  7 Jun 2025 14:32:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80677C8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 14:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74AF06065F
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 14:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNpgOI-7mBwa for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 14:32:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.49;
 helo=mail-lf1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 456386006A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 456386006A
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 456386006A
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 14:32:42 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5532f9ac219so3496306e87.1
 for <buildroot@buildroot.org>; Sat, 07 Jun 2025 07:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749306760; x=1749911560;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FoT/BWSzflKXczYVkPjWy/stPXSEO1j4ySFYXWjw69U=;
 b=QRA4J5IZ6MJicT87jViyBIsbZTSKUkpREAC26yAIrPzKCH1zX+IEqg+A1N/gnZZaPa
 pc5M1kW8+kswttJTyY2tlL+nuPt+4w5njhdbDLCQ492ygHXx2NzhZNVyVeocWFB2DUQm
 qJHEYwEzuru6dXt0ArEm5P4707q4vdZHBTaqstxndQNpSXf1FxFT8//+hp5iDxOwDUkY
 pISeS9IcIfgji2PstmHLG7NdZPUhyQUqLjGXHujrYKZgDb0KDJD01gkGTi5gzeGgZXNb
 aO+tn7DiPteGWD7Rh+HqGHY95mixn+TFWayjnirlfWacNRSk4cJVJIUQmlPqE9iPT40J
 9gLA==
X-Gm-Message-State: AOJu0YzTYNkLVniIbtrctSZTGJ4Ml+8HD7OUnfRnrL0jvk+/Cs/Ch0qu
 tUTXfd4hjU5ZhyRQp4A7n6WHctLZGze7lWpM1wgXbdWc7YRIlJRsjUkia23UezXJ
X-Gm-Gg: ASbGnctZt3cXKpGWXikSXrD5Kkhchf9I9IlcS3j6QmUF3nTlk3O2tQgRBZw6DFqRZAf
 XX0EZJvQ41GXPJpRAMiu5ufLI3v0qBE64SNyIEhBQN3tPhqF4qqupLFNtjvUfussFFy00UNAJH9
 fObmdo4WDWUMuw+TA0GjpyDXkVTfjHyjLTnQbX0pd964IA+BTaf1gbqyDhWzsYZEfVpBQ1Bpn3v
 TuhJ7TSez2cyBg/0ZAKtcR2EJI3B4AfeEtTaqnjGVn5CyGIh/4nhLZtXBqic+z8Katt/uMR6xL4
 JQtCZm3t7NMb4ipYA/apHImJ3v3hFU/EvpbAahQ/2ISwUxs283jfhN+REaoRG7TO37gbos+hYiu
 XZm0vlog6KwhyV3nBULC2uZE=
X-Google-Smtp-Source: AGHT+IHc6VZN4bU9IQj3B2ttBt/nbp8pR2QdAhxSmYOqkLiA1jsv6+YMd60/iGLrJ29yAA8kf0aWXQ==
X-Received: by 2002:a05:6512:e88:b0:553:1f8e:f27f with SMTP id
 2adb3069b0e04-55366bf1524mr1847699e87.30.1749306759215; 
 Sat, 07 Jun 2025 07:32:39 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677222d7sm527970e87.128.2025.06.07.07.32.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jun 2025 07:32:38 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5532f9ac219so3496295e87.1
 for <buildroot@buildroot.org>; Sat, 07 Jun 2025 07:32:38 -0700 (PDT)
X-Received: by 2002:a2e:b892:0:b0:32a:62a2:f744 with SMTP id
 38308e7fff4ca-32adfaffc5cmr16952381fa.6.1749306758459; Sat, 07 Jun 2025
 07:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250607114425.774736-1-thomas.perale@mind.be>
 <378bb6eb-a1d1-4757-b79b-5f6d52f6b0ad@mind.be>
In-Reply-To: <378bb6eb-a1d1-4757-b79b-5f6d52f6b0ad@mind.be>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 7 Jun 2025 16:32:26 +0200
X-Gmail-Original-Message-ID: <CACXRmJj_f2Q5d9KTxLA0yz2fxLXX8hFZXDZQjyq17ioNy6uQ=w@mail.gmail.com>
X-Gm-Features: AX0GCFtZ7xOMFWgFMM76o3LEZoI-CNO6QdCSp9vFTiEWrJDNSvpaEbCh4JN0ybU
Message-ID: <CACXRmJj_f2Q5d9KTxLA0yz2fxLXX8hFZXDZQjyq17ioNy6uQ=w@mail.gmail.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas@devoogdt.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, All,


I tried native compilation using these flags on v3.2.10:

CXX=/bin/false cmake -DCMAKE_INSTALL_PREFIX="/usr"
-DCMAKE_INSTALL_RUNSTATEDIR="/run" -DCMAKE_COLOR_MAKEFILE=OFF
-DBUILD_DOC=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF
-DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF -DBUILD_TESTS=OFF
-DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON  -DFLB_DEBUG=No
-DFLB_RELEASE=Yes -DFLB_SECURITY=No -DFLB_EXAMPLES=No
-DFLB_CHUNK_TRACE=No -DFLB_PREFER_SYSTEM_LIB_CARES=Yes
-DFLB_PREFER_SYSTEM_LIB_NGHTTP2=Yes -DFLB_WASM=No -DFLB_BACKTRACE=No
-DFLB_JEMALLOC=No -DFLB_LUAJIT=No -DBUILD_SHARED_LIBS=OFF
-DCMAKE_INSTALL_SYSCONFDIR="/etc/" -DCMAKE_EXE_LINKER_FLAGS="-latomic"
-DCMAKE_POLICY_VERSION_MINIMUM=3.5 ../

(Just copied it from
https://autobuild.buildroot.org/results/4b0/4b0646e8fcc3f023ab0173ea8725f381e5055152/)

To get it compiled, I needed these commits, on a fresh checkout:

000c68c04 lib: librdkafka: only require a C compiler
(https://github.com/fluent/fluent-bit/pull/10341/commits/7bba635f38b5e11bb2e8c491755bb65e40376b6a)
13d25f1fc lib: zstd: only require a C compiler
(https://github.com/fluent/fluent-bit/pull/10316/commits/1a33abea23004b68098ccc964939f0ae12696999)
45cb424bc lib: miniz: only require a C compiler
(https://github.com/fluent/fluent-bit/commit/9db9746060ffafbf849e8ea253a70a5467f0e827)
--> So yes, miniz is needed to compile it!

So it makes sense to add a patch for zstd and miniz, given that there
is already one for librdkafka.


Kr,

Thomas Devoogdt

Op za 7 jun 2025 om 13:47 schreef Thomas Perale <thomas.perale@mind.be>:
>
> Hi Thomas Devoogdt,
>
> I didn't manage to reproduce the build error for the lib miniz. Can you
> confirm it occurs on the v3.2.10 as well.
>
> Thanks.
> PERALE Thomas
>
> On 6/7/25 1:44 PM, Thomas Perale wrote:
> > Since the package bump [1] the fluent-bit package started to fail
> > because of an update introduced in fluent-bit v3.2.7 (see [2]).
> >
> > The following error appeared on the autobuilder in the LTS branch.
> >
> > ```
> > CMake Error at /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/CMakeTestCXXCompiler.cmake:73 (message):
> >    The C++ compiler
> >
> >      "/bin/false"
> >
> >    is not able to compile a simple test program.
> >
> >    It fails with the following output:
> >
> >      Change Dir: '/home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc'
> >
> >      Run Build Command(s): /home/buildroot/instance-0/output-1/host/bin/ninja -v cmTC_71bbf
> >      [1/2] /bin/false    -o CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o -c /home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc/testCXXCompiler.cxx
> >      FAILED: CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o
> >      /bin/false    -o CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o -c /home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc/testCXXCompiler.cxx
> >      ninja: build stopped: subcommand failed.
> >
> >    CMake will not be able to correctly generate this project.
> > Call Stack (most recent call first):
> >    lib/zstd-1.5.7/build/cmake/CMakeLists.txt:36 (project)
> > ```
> >
> > The commit [3] included two patches to fix the build error
> > for configs using toolchains without CXX.
> >
> > Since the build error was already present on v3.2.10,
> > those patches actually fix the error for LTS version as well.
> > This patch pick them from the series to apply them on the LTS
> > branch.
> >
> > [1] 8bc18fad29 package/fluent-bit: bump to 3.2.10
> > [2] https://github.com/fluent/fluent-bit/commit/0ce59cecdc3c3f8053bebe9d5d9ef7b30fc6c4e6
> > [3] 8181727e23 package/fluent-bit: bump to 4.0.0
> >
> > Fixes: https://autobuild.buildroot.org/results/4b0/4b0646e8fcc3f023ab0173ea8725f381e5055152/
> >
> > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> > ---
> >   ...able-CXX-support-if-tests-are-requir.patch | 34 +++++++++++++++++++
> >   ...-lib-miniz-only-require-a-C-compiler.patch | 27 +++++++++++++++
> >   2 files changed, 61 insertions(+)
> >   create mode 100644 package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
> >   create mode 100644 package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
> >
> > diff --git a/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
> > new file mode 100644
> > index 0000000000..f7b282165c
> > --- /dev/null
> > +++ b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
> > @@ -0,0 +1,34 @@
> > +From b6d898185d441e00acad867c0c80aadf4d7b0d37 Mon Sep 17 00:00:00 2001
> > +From: Thomas Devoogdt <thomas@devoogdt.com>
> > +Date: Tue, 1 Apr 2025 22:43:30 +0200
> > +Subject: [PATCH] lib: zstd: only enable CXX support if tests are required
> > +
> > +Upstream: https://github.com/facebook/zstd/pull/4357/files
> > +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> > +---
> > + lib/zstd-1.5.7/build/cmake/CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
> > +index 347d41c0f..70e233df3 100644
> > +--- a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
> > ++++ b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
> > +@@ -37,7 +37,6 @@ project(zstd
> > +   VERSION "${ZSTD_FULL_VERSION}"
> > +   LANGUAGES C   # Main library is in C
> > +             ASM # And ASM
> > +-            CXX # Testing contributed code also utilizes CXX
> > +   )
> > +
> > + message(STATUS "ZSTD VERSION: ${zstd_VERSION}")
> > +@@ -170,6 +169,7 @@ if (ZSTD_BUILD_PROGRAMS)
> > + endif ()
> > +
> > + if (ZSTD_BUILD_TESTS)
> > ++    enable_language(CXX)
> > +     enable_testing()
> > +     if (NOT ZSTD_BUILD_STATIC)
> > +         message(SEND_ERROR "You need to build static library to build tests")
> > +--
> > +2.43.0
> > +
> > diff --git a/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
> > new file mode 100644
> > index 0000000000..bfd32d6b68
> > --- /dev/null
> > +++ b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
> > @@ -0,0 +1,27 @@
> > +From 3732cea4bb3dd9b79732da7bfbf60258bc418195 Mon Sep 17 00:00:00 2001
> > +From: Thomas Devoogdt <thomas@devoogdt.com>
> > +Date: Tue, 1 Apr 2025 23:01:13 +0200
> > +Subject: [PATCH] lib: miniz: only require a C compiler
> > +
> > +Upstream: https://github.com/richgel999/miniz/pull/338
> > +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> > +---
> > + lib/miniz/CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/lib/miniz/CMakeLists.txt b/lib/miniz/CMakeLists.txt
> > +index ce6ade1c0..91012b36a 100644
> > +--- a/lib/miniz/CMakeLists.txt
> > ++++ b/lib/miniz/CMakeLists.txt
> > +@@ -7,7 +7,7 @@ if(DEFINED PROJECT_NAME)
> > + endif()
> > +
> > + if(CMAKE_MINOR_VERSION LESS 12)
> > +-  project(miniz)
> > ++  project(miniz C)
> > +   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
> > + else()
> > +   project(miniz C)
> > +--
> > +2.43.0
> > +
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
