Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B377EC4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 20:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6253741558;
	Tue, 30 Apr 2024 20:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHl7g5hOYNHg; Tue, 30 Apr 2024 20:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6339F409F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6339F409F3;
	Tue, 30 Apr 2024 20:51:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5567A1BF3E1
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EE3860B1F
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVEqNvtEgoUU for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 20:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4617260B19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4617260B19
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 20:51:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F85786320; Tue, 30 Apr 2024 20:51:56 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 22:50:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e126bd38d5eedb49cd29699c1afe8b53edd71e0
X-Git-Newrev: 23bbec827db6a0d9c8f8720891601857c14d3d77
X-Patchwork-Hint: ignore
Message-Id: <20240430205156.3F85786320@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project/compiler-rt: add
 libxcrypt dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=23bbec827db6a0d9c8f8720891601857c14d3d77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

But compiler-rt package still use crypt.h header and crypt() function
in the sanitizer code.

Use libxcrypt unconditionally since compiler-rt itself already depends
on glibc based toolchain.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222513

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/llvm-project/compiler-rt/Config.in      | 1 +
 package/llvm-project/compiler-rt/compiler-rt.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/llvm-project/compiler-rt/Config.in b/package/llvm-project/compiler-rt/Config.in
index e8f2ac4201..10f5d796b3 100644
--- a/package/llvm-project/compiler-rt/Config.in
+++ b/package/llvm-project/compiler-rt/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_COMPILER_RT
 	depends on BR2_PACKAGE_LLVM
 	depends on BR2_TOOLCHAIN_USES_GLIBC # asan lib requires
 	depends on BR2_HOST_GCC_AT_LEAST_7 # host-clang
+	select BR2_PACKAGE_LIBXCRYPT
 	help
 	  A collection of runtime libraries primarily used by clang and
 	  llvm to provide builtins, sanitizer runtimes, and profiling
diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index 5d9c3d8fa8..d4bc4d305b 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -10,7 +10,7 @@ COMPILER_RT_SITE = $(LLVM_PROJECT_SITE)
 COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
 COMPILER_RT_CPE_ID_VENDOR = llvm
-COMPILER_RT_DEPENDENCIES = host-clang llvm
+COMPILER_RT_DEPENDENCIES = host-clang libxcrypt llvm
 COMPILER_RT_SUPPORTS_IN_SOURCE_BUILD = NO
 
 COMPILER_RT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
