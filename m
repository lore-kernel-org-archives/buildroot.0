Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA96C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:04:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68D3660F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68D3660F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FF4783ADD;
	Tue,  3 Aug 2021 23:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2srABeUiyvjM; Tue,  3 Aug 2021 23:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7365183A7F;
	Tue,  3 Aug 2021 23:04:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0681BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 578744063C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLGZtzIXJsRu for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44025404CE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8B79185C5F; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Jun 2021 11:47:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dbce7265515ab28b177e97fa655bd1f51eb1254e
X-Git-Newrev: a8c7e406f6d5a65d0e8f731f0c24ffebe0b18c16
X-Patchwork-Hint: ignore
Message-Id: <20210803210950.8B79185C5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/boost: upstream patch
 to re-enable logs with riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a8c7e406f6d5a65d0e8f731f0c24ffebe0b18c16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit d72350e62a0833e4d1527f4040da2063972bf9b3 disabled boost::logs on
riscv32 due to the use of SYS_futex, which doesn't exist on riscv32.

Revert "package/boost: disable logs with riscv32" and add an upstream
patch that uses SYS_futex_time64 instead.

This reverts commit d72350e62a0833e4d1527f4040da2063972bf9b3.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/azmq/Config.in                             |  3 --
 .../0002-src-event-cpp-fix-build-on-riscv32.patch  | 42 ++++++++++++++++++++++
 package/boost/Config.in                            |  3 --
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/package/azmq/Config.in b/package/azmq/Config.in
index 6751d533a4..37131a260a 100644
--- a/package/azmq/Config.in
+++ b/package/azmq/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_AZMQ
 	bool "azmq"
-	depends on !BR2_RISCV_32 # boost-log
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
@@ -23,11 +22,9 @@ config BR2_PACKAGE_AZMQ
 	  https://github.com/zeromq/azmq
 
 comment "azmq needs a toolchain w/ C++11, wchar and NPTL"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
 
 comment "azmq needs exception_ptr"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/boost/0002-src-event-cpp-fix-build-on-riscv32.patch b/package/boost/0002-src-event-cpp-fix-build-on-riscv32.patch
new file mode 100644
index 0000000000..f1b84284ee
--- /dev/null
+++ b/package/boost/0002-src-event-cpp-fix-build-on-riscv32.patch
@@ -0,0 +1,42 @@
+From d2061419501bdd6761e9380ed5b91233f6c4e67e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 21 May 2021 21:30:04 +0200
+Subject: [PATCH] src/event.cpp: fix build on riscv32
+
+riscv32 fails to build because __NR_futex is not defined on this
+architecture:
+
+libs/log/src/event.cpp: In member function 'void boost::log::v2_mt_posix::aux::futex_based_event::wait()':
+libs/log/src/event.cpp:38:29: error: '__NR_futex' was not declared in this scope
+   38 | #define BOOST_LOG_SYS_FUTEX __NR_futex
+      |                             ^~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8c8135fd7c0517c66c9b3975c494da6d7934cc1b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/boostorg/log/commit/d2061419501bdd6761e9380ed5b91233f6c4e67e]
+---
+ src/event.cpp | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libs/log/src/event.cpp b/libs/log/src/event.cpp
+index 5485154d7..f576648c6 100644
+--- a/libs/log/src/event.cpp
++++ b/libs/log/src/event.cpp
+@@ -34,8 +34,13 @@
+ // Some Android NDKs (Google NDK and older Crystax.NET NDK versions) don't define SYS_futex
+ #if defined(SYS_futex)
+ #define BOOST_LOG_SYS_FUTEX SYS_futex
+-#else
++#elif defined(__NR_futex)
+ #define BOOST_LOG_SYS_FUTEX __NR_futex
++// riscv32 defines a different system call instead of __NR_futex
++#elif defined(__NR_futex_time64)
++#define BOOST_LOG_SYS_FUTEX __NR_futex_time64
++#else
++#error "Unable to find a suitable futex"
+ #endif
+ 
+ #if defined(FUTEX_WAIT_PRIVATE)
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 81b2b2727a..9248c574f4 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -231,7 +231,6 @@ comment "boost-locale needs a toolchain not affected by GCC bug 64735"
 
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
@@ -245,12 +244,10 @@ config BR2_PACKAGE_BOOST_LOG
 	  Logging library.
 
 comment "boost-log needs a toolchain w/ NPTL"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 comment "boost-log needs a toolchain not affected by GCC bug 64735"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_MATH
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
