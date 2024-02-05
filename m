Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C23CC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B80B94010B;
	Mon,  5 Feb 2024 15:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B80B94010B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HtbUVNI_Ms3A; Mon,  5 Feb 2024 15:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9168415E9;
	Mon,  5 Feb 2024 15:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9168415E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BAA71BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30A38400D9
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30A38400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kVQQV0vroAVb for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:27:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C768540022
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C768540022
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B295586D2E; Mon,  5 Feb 2024 15:27:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 16:26:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fb52098859fa5cf7ecf4db30ff8e0276687832f
X-Git-Newrev: d5524c00656c314626862e54b2cd38865486cf55
X-Patchwork-Hint: ignore
Message-Id: <20240205152743.B295586D2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtracefs: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5524c00656c314626862e54b2cd38865486cf55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libtracefs needs threads resulting in the following build failure since
its addition in commit b1dbd3f679e6660325472e3fdca72127d74e6929:

In file included from /home/autobuild/autobuild/instance-2/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:27,
                 from ../src/tracefs-instance.c:10:
/home/autobuild/autobuild/instance-2/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/features.h:218:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]
  218 | #   warning requested reentrant code, but thread support was disabled
      |     ^~~~~~~
../src/tracefs-instance.c:20:10: fatal error: pthread.h: No such file or directory
   20 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e0a8dd0781a1d1824a4cb78f47dcff4055083959

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtracefs/Config.in  | 5 +++--
 package/linux-tools/Config.in | 5 +++--
 package/trace-cmd/Config.in   | 6 ++++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/libtracefs/Config.in b/package/libtracefs/Config.in
index bb0777b16c..a46bbe0bb1 100644
--- a/package/libtracefs/Config.in
+++ b/package/libtracefs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBTRACEFS
 	bool "libtracefs"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # libtraceevent
 	select BR2_PACKAGE_LIBTRACEEVENT
 	help
@@ -8,5 +9,5 @@ config BR2_PACKAGE_LIBTRACEFS
 
 	  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/
 
-comment "libtracefs needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "libtracefs needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index ce744663f1..fb158f84d4 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -104,6 +104,7 @@ endif
 
 config BR2_PACKAGE_LINUX_TOOLS_RTLA
 	bool "rtla"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libtracefs
 	depends on !BR2_STATIC_LIBS # libtracefs
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_LIBTRACEFS
@@ -124,8 +125,8 @@ config BR2_PACKAGE_LINUX_TOOLS_RTLA
 	  not available in Buildroot, so only rtla in kernels 5.19
 	  onwards is actually supported in Buildroot.
 
-comment "rtla needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "rtla needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
index 00b9ebbd9a..c47b1f57ca 100644
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_TRACE_CMD
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libtracefs
 	select BR2_PACKAGE_LIBTRACEEVENT
 	select BR2_PACKAGE_LIBTRACEFS
 	help
@@ -16,6 +17,7 @@ config BR2_PACKAGE_TRACE_CMD
 
 	  http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
 
-comment "trace-cmd needs a toolchain w/ NPTL, dynamic library"
+comment "trace-cmd needs a toolchain w/ threads, NPTL, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
