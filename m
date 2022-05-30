Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A18C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BE0041910;
	Tue,  7 Jun 2022 19:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IR3kP3ceB21g; Tue,  7 Jun 2022 19:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 311F041932;
	Tue,  7 Jun 2022 19:19:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DFAB1BF9B6
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4DB760ED4
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hUpXmqbXrAf for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0562260F1E
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EC82B86E22; Tue,  7 Jun 2022 19:04:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:19:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53a23c3e5e286fb91ced437292792ecdd73a6324
X-Git-Newrev: 935617e016ab3fee14af2d515b598591f7798298
X-Patchwork-Hint: ignore
Message-Id: <20220607190455.EC82B86E22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xmrig: enable for avmv7a
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=935617e016ab3fee14af2d515b598591f7798298
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Available since 2017:
https://github.com/xmrig/xmrig/commit/aa4f8b6fa78eb8331b5927ba5315b926ac75ce9c

We noticed it since its addition to the readme:
https://github.com/xmrig/xmrig/commit/97869f3347a621d9dbf20210289ce10c68a5bd34

Added patch to fix build with gcc-4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-astrobwt-fix-build-with-gcc-4.8.patch     | 40 ++++++++++++++++++++++
 package/xmrig/Config.in                            |  4 +--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch b/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..694d7b203c
--- /dev/null
+++ b/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,40 @@
+From 72234ae73590fa93d837034a3fb48b71eb071a2a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 22 May 2022 20:24:14 +0200
+Subject: [PATCH] astrobwt: fix build with gcc-4.8
+
+Fixes build error:
+
+xmrig-6.17.0/src/crypto/astrobwt/sort_indices2.cpp:40:24: error: missing binary operator before token "("
+ #if __has_cpp_attribute(unlikely)
+
+found with the buildroot toolchain
+arm-none-linux-gnueabi-gcc (Sourcery CodeBench Lite 2014.05-29) 4.8.3 20140320 (prerelease)
+
+Inspired by
+https://reviews.llvm.org/rG91c32fd8c8fa395971a028f7091273fa2c8f44e6
+
+Patch sent upstream: https://github.com/xmrig/xmrig/pull/3057
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/crypto/astrobwt/sort_indices2.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/crypto/astrobwt/sort_indices2.cpp b/src/crypto/astrobwt/sort_indices2.cpp
+index 2d86d462..3a70f619 100644
+--- a/src/crypto/astrobwt/sort_indices2.cpp
++++ b/src/crypto/astrobwt/sort_indices2.cpp
+@@ -36,6 +36,9 @@
+ #define RESTRICT
+ #endif
+ 
++#ifndef __has_cpp_attribute
++#define __has_cpp_attribute(x) 0
++#endif
+ 
+ #if __has_cpp_attribute(unlikely)
+ #define UNLIKELY(X) (X) [[unlikely]]
+-- 
+2.30.2
+
diff --git a/package/xmrig/Config.in b/package/xmrig/Config.in
index c5c6b3e37b..4c70abec6f 100644
--- a/package/xmrig/Config.in
+++ b/package/xmrig/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XMRIG
 	bool "xmrig"
 	# archs officially supported by upstream
-	depends on BR2_aarch64 || BR2_x86_64 || BR2_i386
+	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_x86_64 || BR2_i386
 	depends on BR2_USE_MMU # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
@@ -16,7 +16,7 @@ config BR2_PACKAGE_XMRIG
 	  https://xmrig.com
 
 comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library, C++"
-	depends on BR2_aarch64 || BR2_x86_64 || BR2_i386
+	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_x86_64 || BR2_i386
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
