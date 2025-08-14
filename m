Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182B9CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEE8F80EB1;
	Thu, 14 Aug 2025 20:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2au-oaHNcH-h; Thu, 14 Aug 2025 20:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D655E80EA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D655E80EA4;
	Thu, 14 Aug 2025 20:06:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB4F7228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 386A6404AB
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7jU5iXnLesn for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DC7D404A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DC7D404A5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B9E887609; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:33:11 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 1bb79ed5c87e338e53a34b2a40216d4353e2caa0
X-Git-Newrev: 2d817766c344173cc401949aecc057c602a4c3e1
X-Patchwork-Hint: ignore
Message-Id: <20250814200605.0B9E887609@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/pthreadpool: fix
 thread dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2d817766c344173cc401949aecc057c602a4c3e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

On autobuilder config with BR2_TOOLCHAIN_HAS_THREADS not set the
following error happens when building the pthreadpool package:

```
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - not found
-- Check if compiler accepts -pthread
-- Check if compiler accepts -pthread - no
CMake Error at /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindPackageHandleStandardArgs.cmake:233 (message):
  Could NOT find Threads (missing: Threads_FOUND)
Call Stack (most recent call first):
  /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindPackageHandleStandardArgs.cmake:603 (_FPHSA_FAILURE_MESSAGE)
  /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindThreads.cmake:226 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
  CMakeLists.txt:143 (FIND_PACKAGE)

-- Configuring incomplete, errors occurred!
```

This can be reproduced with:

```
cat >.config <<EOF
BR2_armeb=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_PACKAGE_PTHREADPOOL=y
EOF
make olddefconfig
make pthreadpool
```

Since the introduction of this package in [1], the dependency was not
included. Since this package was part of the tensorflow-lite
dependencies that required thread it was not an issue.

This patch adds BR2_TOOLCHAIN_HAS_THREADS in the dependency to avoid
errors when built as a standalone package.

[1] f2486a6cf9 package/pthreadpool: new package

Fixes: https://autobuild.buildroot.org/results/35a/35aa100d72c6875350ad10c57f028f04052cbf79
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 627af87bda2f14e42b127bb749ddeb4fd4a4f6b2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pthreadpool/Config.in | 4 ++++
 package/xnnpack/Config.in     | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pthreadpool/Config.in b/package/pthreadpool/Config.in
index 194ae33f85..8d163b16de 100644
--- a/package/pthreadpool/Config.in
+++ b/package/pthreadpool/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PTHREADPOOL
 	bool "pthreadpool"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FXDIV
 	help
 	  Pthreadpool is a portable and efficient thread pool
 	  implementation.
 
 	  https://github.com/Maratyszcza/pthreadpool
+
+comment "pthreadpool needs a toolchain w/ threads"
+	  depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/xnnpack/Config.in b/package/xnnpack/Config.in
index e4b92f61e8..794c5c47d2 100644
--- a/package/xnnpack/Config.in
+++ b/package/xnnpack/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_XNNPACK
 	depends on BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
-	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo, pthreadpool
 	select BR2_PACKAGE_CPUINFO
 	select BR2_PACKAGE_FP16
 	select BR2_PACKAGE_FXDIV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
