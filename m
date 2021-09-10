Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34ABC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:13:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 715DF60FE3
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 715DF60FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F0D240615;
	Fri, 10 Sep 2021 11:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSA9d3OBpz4S; Fri, 10 Sep 2021 11:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50059405F4;
	Fri, 10 Sep 2021 11:13:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6439C1BF23C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D498405F4
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbd2hNgmufVW for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:13:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5872C400E4
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 11:13:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CEDDC88C83; Fri, 10 Sep 2021 11:11:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 13:09:06 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ad98d9b7712f97ecb656ad2020f4a34dc233c9e0
X-Git-Newrev: fc2d99b294612bd85f0b5080e7098cd57da16a94
X-Patchwork-Hint: ignore
Message-Id: <20210910111140.CEDDC88C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/qt5/qt5base: fix
 build on riscv32
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc2d99b294612bd85f0b5080e7098cd57da16a94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following build failure on riscv32:

In file included from thread/qmutex_linux.cpp:45,
                 from thread/qmutex.cpp:804:
thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
  116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
      |                              ^~~~~~~~~~
      |                              _q_futex

Fixes:
 - http://autobuild.buildroot.org/results/ffedfc000029072d5d724e98ab4551fe973658ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
(cherry picked from commit 050be3ad358b7824b3fe9f832bc1ee494edd37d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../qt5/qt5base/0009-Fix-build-on-riscv32.patch    | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/qt5/qt5base/0009-Fix-build-on-riscv32.patch b/package/qt5/qt5base/0009-Fix-build-on-riscv32.patch
new file mode 100644
index 0000000000..98c7210551
--- /dev/null
+++ b/package/qt5/qt5base/0009-Fix-build-on-riscv32.patch
@@ -0,0 +1,45 @@
+From 035dc537bee26e3b63a211b2835d8560439e161f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 Aug 2021 16:28:32 +0200
+Subject: Fix build on riscv32
+
+riscv32 fails to build because __NR_futex is not defined on this
+architecture:
+
+In file included from thread/qmutex_linux.cpp:45,
+                 from thread/qmutex.cpp:804:
+thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
+thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
+  116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
+      |                              ^~~~~~~~~~
+      |                              _q_futex
+
+Pick-to: 6.1 6.2
+Fixes: QTBUG-96067
+Change-Id: Ib6a9bcc496f37e69ac39362cb0a021fccaf311f5
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+[Retrieved from:
+https://code.qt.io/cgit/qt/qtbase.git/commit/?id=035dc537bee26e3b63a211b2835d8560439e161f]
+---
+ src/corelib/thread/qfutex_p.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/corelib/thread/qfutex_p.h b/src/corelib/thread/qfutex_p.h
+index 40482b6fc1..037207a5c0 100644
+--- a/src/corelib/thread/qfutex_p.h
++++ b/src/corelib/thread/qfutex_p.h
+@@ -103,6 +103,11 @@ QT_END_NAMESPACE
+ // if not defined in linux/futex.h
+ #  define FUTEX_PRIVATE_FLAG        128         // added in v2.6.22
+ 
++// RISC-V does not supply __NR_futex
++#  ifndef __NR_futex
++#    define __NR_futex __NR_futex_time64
++#  endif
++
+ QT_BEGIN_NAMESPACE
+ namespace QtLinuxFutex {
+     constexpr inline bool futexAvailable() { return true; }
+-- 
+cgit v1.2.1
+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
