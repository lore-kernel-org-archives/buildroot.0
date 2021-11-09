Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D298C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:20:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BF1A61A60
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BF1A61A60
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA9881865;
	Tue,  9 Nov 2021 22:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8RTmp7l00aGE; Tue,  9 Nov 2021 22:20:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F7ED817C3;
	Tue,  9 Nov 2021 22:20:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEE1A1BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B69DE40450
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SqLyc7vP4XDg for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C36DE40454
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2E9BF8B82C; Tue,  9 Nov 2021 22:15:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 23:02:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b658a44ab5f40f9e828e1bc3ca3e28620d6d9092
X-Git-Newrev: 828daae9085c94414170fa037ab6e6a224a4ea0c
X-Patchwork-Hint: ignore
Message-Id: <20211109221516.2E9BF8B82C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburcu: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=828daae9085c94414170fa037ab6e6a224a4ea0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following lttng-tools build failure raised since bump of liburcu
to version 0.13.0 in commit 9cedbcf494e647371f92368014d31091848772bb and
https://github.com/urcu/userspace-rcu/commit/109267f653502cf5ef5ada5d098167b9726daa2d:

In file included from ../../../src/common/error.h:16:0,
                 from directory-handle.c:9:
../../../src/common/error.h:44:25: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'struct'
 extern DECLARE_URCU_TLS(struct log_time, error_log_time);
                         ^
This is fixed by upstream
0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch.
Also include upstream 0002-fix-don-t-use-C-thread_local-on-MacOs.patch
to avoid conflicts.

Fixes:
 - http://autobuild.buildroot.org/results/70d645593c9e164d0d044da1b0128cda9c96e830

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...002-fix-don-t-use-C-thread_local-on-MacOs.patch | 41 +++++++++++++++++
 ...d-for-Thread-local-storage-except-on-MSVC.patch | 53 ++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch b/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch
new file mode 100644
index 0000000000..002df34d70
--- /dev/null
+++ b/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch
@@ -0,0 +1,41 @@
+From e915ab84fd0c02d37504f3eb1e1f3be93ea6dc37 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Thu, 9 Sep 2021 12:11:16 -0400
+Subject: [PATCH] fix: don't use C++ thread_local on MacOs
+
+Recent versions of Apple's clang++ do support 'thread_local' but the
+implementation generates additional helper symbols. This is a problem
+when accessing an extern TLS variable in a C++ compile unit that is
+provided by a C library that doesn't have those extra symbols.
+
+Fallback to using '__thread' on MacOs.
+
+Change-Id: I87cb5b3c9293f7bf66f7115f453b546dd793a449
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+[Retrieved from:
+https://github.com/urcu/userspace-rcu/commit/e915ab84fd0c02d37504f3eb1e1f3be93ea6dc37]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/urcu/tls-compat.h | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/include/urcu/tls-compat.h b/include/urcu/tls-compat.h
+index 24ef1b9a..25cf375a 100644
+--- a/include/urcu/tls-compat.h
++++ b/include/urcu/tls-compat.h
+@@ -34,7 +34,12 @@ extern "C" {
+ 
+ #ifdef CONFIG_RCU_TLS
+ 
+-#if defined (__cplusplus) && (__cplusplus >= 201103L)
++/*
++ * Don't use C++ 'thread_local' on MacOs, the implementation is incompatible
++ * with C and will result in a link error when accessing an extern variable
++ * provided by the C library from C++ code.
++ */
++#if defined (__cplusplus) && (__cplusplus >= 201103L) && !defined(__APPLE__)
+ # define URCU_TLS_STORAGE_CLASS	thread_local
+ #elif defined (__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)
+ # define URCU_TLS_STORAGE_CLASS	_Thread_local
diff --git a/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch b/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch
new file mode 100644
index 0000000000..aa71cf2f20
--- /dev/null
+++ b/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch
@@ -0,0 +1,53 @@
+From 2e359284497c361e3208501fc70d49b2c54dc4ef Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 14 Sep 2021 10:41:08 -0400
+Subject: [PATCH] Always use '__thread' for Thread local storage except on MSVC
+
+Use the GCC extension '__thread' [1] for Thread local storage on all C
+and C++ compilers except MSVC.
+
+While C11 and C++11 respectively offer '_Thread_local' and
+'thread_local' as potentialy faster implementations, they offer no
+guarantees of compatibility when used in a library interface which might
+be used by both C and C++ client code.
+
+[1] https://gcc.gnu.org/onlinedocs/gcc/Thread-Local.html
+
+Change-Id: If4fe8bcdbda24b21dedf382112bd5c5f836c00c8
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+[Retrieved from:
+https://github.com/urcu/userspace-rcu/commit/2e359284497c361e3208501fc70d49b2c54dc4ef]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/urcu/tls-compat.h | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/include/urcu/tls-compat.h b/include/urcu/tls-compat.h
+index 25cf375a..a2c94ded 100644
+--- a/include/urcu/tls-compat.h
++++ b/include/urcu/tls-compat.h
+@@ -35,15 +35,14 @@ extern "C" {
+ #ifdef CONFIG_RCU_TLS
+ 
+ /*
+- * Don't use C++ 'thread_local' on MacOs, the implementation is incompatible
+- * with C and will result in a link error when accessing an extern variable
+- * provided by the C library from C++ code.
++ * Default to '__thread' on all C and C++ compilers except MSVC. While C11 has
++ * '_Thread_local' and C++11 has 'thread_local', only '__thread' seems to have
++ * a compatible implementation when linking public extern symbols across
++ * language boundaries.
++ *
++ * For more details, see 'https://gcc.gnu.org/onlinedocs/gcc/Thread-Local.html'.
+  */
+-#if defined (__cplusplus) && (__cplusplus >= 201103L) && !defined(__APPLE__)
+-# define URCU_TLS_STORAGE_CLASS	thread_local
+-#elif defined (__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)
+-# define URCU_TLS_STORAGE_CLASS	_Thread_local
+-#elif defined (_MSC_VER)
++#if defined(_MSC_VER)
+ # define URCU_TLS_STORAGE_CLASS	__declspec(thread)
+ #else
+ # define URCU_TLS_STORAGE_CLASS	__thread
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
