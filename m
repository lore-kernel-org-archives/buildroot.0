Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A9FC25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 07:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D780F60783;
	Wed, 29 May 2024 07:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRqc0AzPEM0A; Wed, 29 May 2024 07:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1537360775
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1537360775;
	Wed, 29 May 2024 07:19:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2443E1D3286
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10540406E6
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0PqWdz8zqAWG for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 07:19:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF61D40762
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF61D40762
 for <buildroot@buildroot.org>; Wed, 29 May 2024 07:19:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB54B87739; Wed, 29 May 2024 07:19:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 08:50:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3beef4b0d41ec862fd89745bc9f496247af7bff7
X-Git-Newrev: 197be7ed872a5cd472f64096f34a7bf132274351
X-Patchwork-Hint: ignore
Message-Id: <20240529071943.CB54B87739@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: always disable developer
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=197be7ed872a5cd472f64096f34a7bf132274351
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccache/ccache.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 4a45ea12e4..0b2c02e8a7 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
