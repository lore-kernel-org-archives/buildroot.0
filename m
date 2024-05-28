Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5287DC25B78
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 19:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1B0D4026C;
	Tue, 28 May 2024 19:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDbkABmn73Hf; Tue, 28 May 2024 19:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D9EB402C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D9EB402C9;
	Tue, 28 May 2024 19:20:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66C8F1D2680
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 19:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 526BE402C9
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 19:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xFQJo3MgYeK for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 19:20:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B546C4026C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B546C4026C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B546C4026C
 for <buildroot@buildroot.org>; Tue, 28 May 2024 19:20:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7F0FEB0055A;
 Tue, 28 May 2024 21:20:23 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 May 2024 21:20:08 +0200
Message-ID: <20240528192008.32699-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716924025;
 bh=OusqilaiAYTb15i7XZfbNlohZNFG47mM5Ir3W0HqOU0=;
 h=From:To:Cc:Subject:Date:From;
 b=hDbz82eA3NUhQOeQWSbqB8pbMBZRFomQeZYFVddPpG5LF0XLDouIdI8p99E/lM/Nt
 rkX/Fdx5Df75J2yX3kuWVOqRGLZpjtfr4xLGDIfPIilxfJGnXX7q4bTI/DVilpE6Ta
 b241QwPhNQjf2EXkDBG9nSdiyicDjP9n9U1unWM19Or4UUEnvOiRehkerA2mK8q+PZ
 87c4iBwf9orfOLi8dlBfB/B7BI3eI0dsxrfCUGFxE1iJlEXGgCjahK4u6NbWwFq+xZ
 Sts/+AWwDzpqRR+cmcVgvdvmOzQoFm7xMfHCxqu8TaWy84o/cNzw/DKa6J4ZCDRgfK
 BxBDoP638by0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hDbz82eA
Subject: [Buildroot] [PATCH 1/1] package/ccache: always disable developer
 mode
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
Cc: Julien Olivain <ju.o@free.fr>, Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ccache CMake build system has some conditions that automatically
enables a developer mode (sets CCACHE_DEV_MODE=ON). See [1].

More specifically, if CCACHE_DEV_MODE is unset AND the environment
variable "CI" is set, CCACHE_DEV_MODE is set to "ON".

This situation can happen when Buildroot builds are executed in
Jenkins jobs, for example. Since Buildroot does not set
CCACHE_DEV_MODE and Jenkins sets the "CI" environment variable,
this ccache developer mode can be enabled in an unexpected way
for the Buildroot user. For example, it happened that a Jenkins build
breaks, while the build with the same configuration in the user
session is working.

One of the effects of enabling this ccache developer mode, is to treat
compiler warnings as errors, see [3]. This can lead to build error,
depending on the ccache version and the host compiler being used.

This behavior can be reproduced and observed, with commands:

    cat > .config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_CCACHE=y
    BR2_PACKAGE_BUSYBOX=y
    EOF
    make olddefconfig

    make clean
    make host-ccache

Outputs:

    ...
    -- Ccache version: 4.9.1
    -- Ccache dev mode: OFF
    -- Setting CMAKE_BUILD_TYPE to Release as none was specified.
    ...

Whereas:

    make clean
    CI=true make host-ccache

Outputs:

    ...
    -- Ccache version: 4.9.1
    -- Ccache dev mode: ON
    -- Setting CMAKE_BUILD_TYPE to Debug as none was specified.
    ...

For a failure example: on Fedora 40 with host gcc 14.1.1, Buildroot at
tag 2024.02 has ccache 4.8.2. Host ccache can fail, when building with
"CI=true make host-ccache" with output:

    /buildroot/output/build/host-ccache-4.8.2/src/third_party/fmt/core.h:3119:44:   in 'constexpr' expansion of 'fmt::v8::make_format_args<>(args#0, args#1)'
    /buildroot/output/build/host-ccache-4.8.2/src/third_party/fmt/core.h:1706:15: error: possibly dangling reference to a temporary [-Werror=dangling-reference]
     1706 |   const auto& arg = arg_mapper<Context>().map(std::forward<T>(val));
          |               ^~~

This commit sets CCACHE_DEV_MODE=OFF to make the ccache behavior more
deterministic in Buildroot, independently of being used in a CI tool
or not.

[1] https://github.com/ccache/ccache/blob/v4.9.1/CMakeLists.txt#L56
[2] https://github.com/jenkinsci/jenkins/blob/jenkins-2.459/core/src/main/java/jenkins/model/CoreEnvironmentContributor.java#L43
[3] https://github.com/ccache/ccache/blob/v4.9.1/cmake/StandardWarnings.cmake#L5

Reported-by: Xavier Roumegue <xroumegue@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Note: while this patch is meant for master branch, I believe it would
also be interesting to apply this patch on maintenance branches, like
2024.02.x, because they includes older ccache versions which are likely
to generate compiler warnings (and therefore errors in the described
case). I let the maintainers decide.
---
 package/ccache/ccache.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 4a45ea12e4e..0b2c02e8a73 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -15,6 +15,7 @@ HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd
 HOST_CCACHE_CONF_OPTS += \
 	-UCMAKE_C_COMPILER_LAUNCHER \
 	-UCMAKE_CXX_COMPILER_LAUNCHER \
+	-DCCACHE_DEV_MODE=OFF \
 	-DZSTD_FROM_INTERNET=OFF \
 	-DHIREDIS_FROM_INTERNET=OFF \
 	-DENABLE_TESTING=OFF
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
