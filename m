Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A364C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:50:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA9796056B
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA9796056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D60F403FF;
	Tue,  3 Aug 2021 22:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fDoLocXdDg5; Tue,  3 Aug 2021 22:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A359404DE;
	Tue,  3 Aug 2021 22:50:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1344D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8371D405A3
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fj1bISX21_8s for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB4024054B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F0C3C843F5; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 27 May 2021 09:44:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 97b2511edb75ff885140f2ea3253d1a862c2cc58
X-Git-Newrev: d72350e62a0833e4d1527f4040da2063972bf9b3
X-Patchwork-Hint: ignore
Message-Id: <20210803210945.F0C3C843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/boost: disable logs
 with riscv32
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

commit: https://git.buildroot.net/buildroot/commit/?id=d72350e62a0833e4d1527f4040da2063972bf9b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

boost logs can't be built with riscv32 because it unconditionally uses
__NR_futex:

libs/log/src/event.cpp: In member function 'void boost::log::v2_mt_posix::aux::futex_based_event::wait()':
libs/log/src/event.cpp:38:29: error: '__NR_futex' was not declared in this scope
   38 | #define BOOST_LOG_SYS_FUTEX __NR_futex
      |                             ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8c8135fd7c0517c66c9b3975c494da6d7934cc1b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/azmq/Config.in  | 3 +++
 package/boost/Config.in | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/azmq/Config.in b/package/azmq/Config.in
index 37131a260a..6751d533a4 100644
--- a/package/azmq/Config.in
+++ b/package/azmq/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AZMQ
 	bool "azmq"
+	depends on !BR2_RISCV_32 # boost-log
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
@@ -22,9 +23,11 @@ config BR2_PACKAGE_AZMQ
 	  https://github.com/zeromq/azmq
 
 comment "azmq needs a toolchain w/ C++11, wchar and NPTL"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
 
 comment "azmq needs exception_ptr"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 9248c574f4..81b2b2727a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -231,6 +231,7 @@ comment "boost-locale needs a toolchain not affected by GCC bug 64735"
 
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
@@ -244,10 +245,12 @@ config BR2_PACKAGE_BOOST_LOG
 	  Logging library.
 
 comment "boost-log needs a toolchain w/ NPTL"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 comment "boost-log needs a toolchain not affected by GCC bug 64735"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_MATH
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
