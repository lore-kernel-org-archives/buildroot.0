Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D6FCA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA1B3607D5;
	Thu, 14 Aug 2025 19:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4Oq5Q8FSi84; Thu, 14 Aug 2025 19:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3DD260788
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3DD260788;
	Thu, 14 Aug 2025 19:56:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03C991BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D55CC4046D
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwW5JnoxGCZW for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6B1C404A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6B1C404A7
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A452F875ED; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 334a02fb6afc4e764ba33dbecf9d6af91d02236b
X-Git-Newrev: 79a013c5eab26a0bbbaadc9c766b228804ecb3dc
X-Patchwork-Hint: ignore
Message-Id: <20250814195612.A452F875ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pthreadpool: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=79a013c5eab26a0bbbaadc9c766b228804ecb3dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
