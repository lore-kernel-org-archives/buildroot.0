Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE73C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AC8C4053E;
	Sat,  5 Mar 2022 14:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-USek2HMJtT; Sat,  5 Mar 2022 14:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4321E403BE;
	Sat,  5 Mar 2022 14:55:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A6141BF957
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5713C80BD0
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKoJQQ_6k-ph for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:54:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8837081374
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:54:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E3D97826C4; Sat,  5 Mar 2022 14:46:36 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Mar 2022 15:19:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a586f0a283cd69f436bc6d0cff484460b412a1ce
X-Git-Newrev: ad25ca1c1f7a61a6cfaa1ef32c19f219fce82ff5
X-Patchwork-Hint: ignore
Message-Id: <20220305144636.E3D97826C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5base: put back riscv32 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad25ca1c1f7a61a6cfaa1ef32c19f219fce82ff5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e wrongly removed riscv32
patch resulting in the following build failure:

In file included from thread/qmutex_linux.cpp:45,
                 from thread/qmutex.cpp:806:
thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
  116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
      |                              ^~~~~~~~~~
      |                              _q_futex

Fixes:
 - http://autobuild.buildroot.org/results/ff90bc7680acf1487ed58e5e25cf1a5f13dfaedb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../qt5/qt5base/0007-Fix-build-on-riscv32.patch    | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch b/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch
new file mode 100644
index 0000000000..5561acb9ae
--- /dev/null
+++ b/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch
@@ -0,0 +1,46 @@
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
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
