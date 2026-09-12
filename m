Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06473C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 07:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C26F8406FC;
	Sat, 12 Sep 2026 07:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfBzdNEun0mM; Sat, 12 Sep 2026 07:40:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8E4AF407BB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789198837;
	b=GuLycJXOpyCsxQLy8Ndd4vMMv64gAZVMQ30u0MiB1qZ9Cah+2+6r4v27I1WAaVscKiGS
	 plXiruwF/0rHQFPi+dgX6BfupH4PEfwS2aDrTG3AI+auTGPP9bk8tEzgiXSxT19Qni/8m
	 lb6sAIdxn6UwT1uEOq5/n5Fd4hn3ibADJ8OJyjptYpEJOxaN5U/aCHHlYCa3l+wSYVCye
	 OrDgUk1lWr2Bp5KRc8t6Ct+y2iOcFUQ+H6TRWPf/5L0MjQfuyQ569md057UkWh9bYeui2
	 EiXFpW1drhsOomVrjEJeHZADB9fBuf6Vv4rB57FyHgXPxGNFcYK1EoPH8Uet5gRDTYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789198837;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Errors-To:Sender;
	bh=b7v2cPWowBgoMGCkIS42TjVjMQObVhyYEOpkn/zgSnU=;
	b=tB7zg8vJ+dGkRsxgOTssz2Jplbto9mGWFs6j6C9tmlPTZuYxHhK0AWqpzLD/KxXrEiem
	 Z07zDOBc5MXYSSbZSb02eNJLYi44n0mbzLPPNLmFSiWcVcIG0nbgYpBgnHMrB4gvpzVM6
	 ioqfJcCC/j5uREmu9Kcf+Kx7mGpbb4m8He9CPRoHeiKrZizHDAfAMNo87dzq9AB/K2TWD
	 j0n8l7Yop3XI3lX6/SnatDnFCWVodZHSW9RKdDnoS/zNpf4ZGHrUIi5C7sMmqNN0KNEVJ
	 TkPIi6FuYBIdtd7E9/Lrc1qguo6fECIBGx1LMB47+y64BuVA80SjPlHegxdn9qBYWew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789198837;
	bh=b7v2cPWowBgoMGCkIS42TjVjMQObVhyYEOpkn/zgSnU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oozd11ukxv2qbnOukdDqjLm6nV9yMIvxjZYWuheWm0Rul/roFrCOiyu5n1A65kowV
	 N8WpVu9g4By4eyGzB6f/IWa846OFNCbgnAHSjLifSQm9ZrZZ45NReNjB1o1v7f4pY8
	 sR1Zr+fIH50WnyT9iMohyVVZC2gQxns0YxUTG3d5vVc6FH8qNx/Ph7qVPhygPWI4Md
	 3zlNUVqhEj8PSv3w0jD4P5lCvsJh5N/oyT58n2+wBH/hEpNykxq8U3i7VKr+7R4fIb
	 csFP+CzMjljnKkrhhPROxC52h3Ipw6jLDJf9mis5MPua9DU5oBzDjY0zpku/EVn68B
	 NKbm5gLGNlLQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4AF407BB;
	Sat, 12 Sep 2026 07:40:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 476B47AB
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3927680ECC
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojxNRLpY3DqQ for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4569580EC1
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789198830;
 b=OagROZ8i4aaNrlIAIIkCH+xSf66RaYMBar3/5K+kHy092cRFwBdF9Hy7i4jqIQy/tQ27
 H1oKksNs7E2zqzfav12Gg2egZRyBlHDdY/RhrqCo/joG6ixHaBZkORXtGg6cKRF93PzsV
 SIPLNfoulMKwSh+60VqOQ/1eAQ2hw984C9UVu44hk7dcqU0Hl7LTJPotW4aHrysf2SxQI
 OqndIh6wCKXQWICOQHvCh9AmfXpg/q2J1b/VISatA4WrIZl6OR2mXleoYQVit3lxMhpVU
 V+sEVZBeRVeNcVWvCdRE084Mluxe+wVuW7p8LASUkgDWOhgQSRw4ImR/tIEtWYYH7Iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789198830;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XUg+LBX6710hW+pBhKae8d/DS3fqO6g3HdHGanMfnhA=;
 b=CzF41cVYT9O6XP2zJW8MA1wMgdfiCSL5NFQAdnmDR+dGoNiGEi2rAqVv1zcrrGBHZGax
 xXWZLZJLudHRPfyvEMUD5p3CE0t7eodds4LWQUdCrX9+CGm1jtHCbKgmJmpvZpMqBQsVt
 22bjxmpaxHx71D6iBijTug8bX9SQ8In2rcnVBJ0+h4vFDdRozqfYJDtSfrPiN5jAJXYXe
 PIXeMcpXztMNvsV2toInzez6OrOgXAnbjs3ygVMdU7eIFitjp0HaU1PiQL0jm/ggQBKS4
 cUMobMoJembWvgh7iflkRhoALj7A+070UTtmJSDH4PDShSC4biz97oMK/znfWCgNdlA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4569580EC1
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8F0A8D275; Sat, 12 Sep 2026 07:39:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 09:38:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c9fbf7efe606d9c34533871d925fc0d16364e7a
X-Git-Newrev: 8af3e34fd4a085ea7c25291e50d81fa1a69d9eaf
X-Patchwork-Hint: ignore
Message-Id: <20260912073925.D8F0A8D275@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: bump version to
 3.2.10
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3388484590374255298=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3388484590374255298==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8af3e34fd4a085ea7c25291e50d81fa1a69d9eaf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Removed patch 0004 due to upstream commit:
https://github.com/FreeRADIUS/freeradius-server/commit/60d60eed118b3655aea1922b1442bcbe8c9b6270
which removes the patched code part.

Added new patch 0004 to fix build errors resulting from the commit
mentioned above.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-error-for-expansion-of-macro-in-thread.h.patch | 66 ---------------------
 .../0004-fix-threads-h-pthread-fallback.patch      | 69 ++++++++++++++++++++++
 package/freeradius-server/freeradius-server.hash   |  4 +-
 package/freeradius-server/freeradius-server.mk     |  2 +-
 4 files changed, 72 insertions(+), 69 deletions(-)

diff --git a/package/freeradius-server/0004-fix-error-for-expansion-of-macro-in-thread.h.patch b/package/freeradius-server/0004-fix-error-for-expansion-of-macro-in-thread.h.patch
deleted file mode 100644
index 00eb63c0f2..0000000000
--- a/package/freeradius-server/0004-fix-error-for-expansion-of-macro-in-thread.h.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From dae3b7c53171dfeacce91e0da1c8bd4e4166352e Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Wed, 18 Jan 2017 14:59:39 +0800
-Subject: [PATCH] fix error for expansion of macro in thread.h
-
-The parameter declaration is missing in expansion of macro
-which cause the build error:
-| In file included from src/freeradius-devel/libradius.h:80:0,
-|                  from src/lib/log.c:26:
-| src/lib/log.c: In function '__fr_thread_local_destroy_fr_strerror_buffer':
-| src/lib/log.c:37:31: error: 'fr_strerror_buffer' undeclared (first use in this function)
-|  fr_thread_local_setup(char *, fr_strerror_buffer) /* macro */
-|                                ^
-
-Add the missing declaration in macro.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
-Fetch from: http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
-Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
-Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
-Upstream: N/A, code has changed
----
- src/include/threads.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/include/threads.h b/src/include/threads.h
-index e36d81dac0..2bcb6aadcb 100644
---- a/src/include/threads.h
-+++ b/src/include/threads.h
-@@ -89,7 +89,7 @@ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
- #  define fr_thread_local_get(_n) _n
- #elif defined(HAVE_PTHREAD_H)
- #  include <pthread.h>
--#  define fr_thread_local_setup(_t, _n) \
-+#  define fr_thread_local_setup(_t, _n) static __thread _t _n;\
- static pthread_key_t __fr_thread_local_key_##_n;\
- static pthread_once_t __fr_thread_local_once_##_n = PTHREAD_ONCE_INIT;\
- static pthread_destructor_t __fr_thread_local_destructor_##_n = NULL;\
-@@ -100,17 +100,17 @@ static void __fr_thread_local_destroy_##_n(UNUSED void *unused)\
- static void __fr_thread_local_key_init_##_n(void)\
- {\
- 	(void) pthread_key_create(&__fr_thread_local_key_##_n, __fr_thread_local_destroy_##_n);\
--	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
- }\
- static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
- {\
- 	__fr_thread_local_destructor_##_n = func;\
- 	if (_n) return _n; \
- 	(void) pthread_once(&__fr_thread_local_once_##_n, __fr_thread_local_key_init_##_n);\
-+	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
- 	return _n;\
- }
--#  define fr_thread_local_init(_n, _f)			__fr_thread_local_init_##_n(_f)
--#  define fr_thread_local_set(_n, _v)			__fr_thread_local_set_##_n(_v)
--#  define fr_thread_local_get(_n)			__fr_thread_local_get_##_n()
-+#  define fr_thread_local_init(_n, _f)	__fr_thread_local_init_##_n(_f)
-+#  define fr_thread_local_set(_n, _v) ((int)!((_n = _v) || 1))
-+#  define fr_thread_local_get(_n) _n
- #endif
- #endif
--- 
-2.17.1
-
diff --git a/package/freeradius-server/0004-fix-threads-h-pthread-fallback.patch b/package/freeradius-server/0004-fix-threads-h-pthread-fallback.patch
new file mode 100644
index 0000000000..f80dcbe997
--- /dev/null
+++ b/package/freeradius-server/0004-fix-threads-h-pthread-fallback.patch
@@ -0,0 +1,69 @@
+From: Josip Stjepanović <jstjep00@gmail.com>
+Subject: [PATCH] fix build failure in HAVE_PTHREAD_H fallback of threads.h
+
+Upstream 3.2.10 only implemented the `defined(__THREAD)` branch of the
+thread-local-storage macros (used when the compiler supports the
+`__thread` storage class, detected via TLS_STORAGE_CLASS). The
+remaining `defined(HAVE_PTHREAD_H)` fallback branch, taken when no
+compiler TLS support is detected but pthreads are available (as
+happens on some aarch64/musl toolchains), was left as `#error
+unsupported`, breaking the build.
+
+This mirrors the previously dropped
+003-freeradius-fix-error-for-expansion-of-macro.patch implementation
+for the `__THREAD` branch into the `HAVE_PTHREAD_H` branch, and adds
+the `if (_n) return _n;` early-return guard to both so
+`fr_thread_local_init()` does not re-run `pthread_once`/
+`pthread_setspecific` on every call.
+
+Reported-by: BKPepe <https://github.com/openwrt/packages/pull/29842#issuecomment-4859328263>
+Patch-by: vortexilation <https://github.com/openwrt/packages/pull/29842#issuecomment-4859798519>
+
+Upstream: https://github.com/FreeRADIUS/freeradius-server/issues/5890
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+
+--- a/src/include/threads.h
++++ b/src/include/threads.h
+@@ -82,7 +82,8 @@ static void __fr_thread_local_key_init_##_n(void)\
+ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
+ {\
+ 	__fr_thread_local_destructor_##_n = func;\
+-	(void) pthread_once(&__fr_thread_local_once_##_n, __fr_thread_local_key_init_##_n); \
++	if (_n) return _n; \
++	(void) pthread_once(&__fr_thread_local_once_##_n, __fr_thread_local_key_init_##_n);\
+ 	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
+ 	return _n;\
+ }
+@@ -90,6 +91,29 @@ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
+ #  define fr_thread_local_set(_n, _v) ((int)!((_n = _v) || 1))
+ #  define fr_thread_local_get(_n) _n
+ #elif defined(HAVE_PTHREAD_H)
+-#error unsupported
++#  include <pthread.h>
++#  define fr_thread_local_setup(_t, _n) static __thread _t _n;\
++static pthread_key_t __fr_thread_local_key_##_n;\
++static pthread_once_t __fr_thread_local_once_##_n = PTHREAD_ONCE_INIT;\
++static pthread_destructor_t __fr_thread_local_destructor_##_n = NULL;\
++static void __fr_thread_local_destroy_##_n(UNUSED void *unused)\
++{\
++	__fr_thread_local_destructor_##_n(_n);\
++}\
++static void __fr_thread_local_key_init_##_n(void)\
++{\
++	(void) pthread_key_create(&__fr_thread_local_key_##_n, __fr_thread_local_destroy_##_n);\
++}\
++static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
++{\
++	__fr_thread_local_destructor_##_n = func;\
++	if (_n) return _n; \
++	(void) pthread_once(&__fr_thread_local_once_##_n, __fr_thread_local_key_init_##_n);\
++	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
++	return _n;\
++}
++#  define fr_thread_local_init(_n, _f)	__fr_thread_local_init_##_n(_f)
++#  define fr_thread_local_set(_n, _v) ((int)!((_n = _v) || 1))
++#  define fr_thread_local_get(_n) _n
+ #endif
+ #endif
diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
index b90aa4b657..73c0180a2f 100644
--- a/package/freeradius-server/freeradius-server.hash
+++ b/package/freeradius-server/freeradius-server.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking
-# https://freeradius.org/ftp/pub/freeradius/freeradius-server-3.2.8.tar.bz2.sig
-sha256  2c6483baeba65f939734473fafa31c4f727e8e139dd884563121412b6aba681b  freeradius-server-3.2.8.tar.bz2
+# https://freeradius.org/ftp/pub/freeradius/freeradius-server-3.2.10.tar.bz2.sig
+sha256  e30ce4b071ad4b48e7eb0c34c66324a32c2548cfc067900941a90f017dc174e3  freeradius-server-3.2.10.tar.bz2
 sha256  0a0e46014fc2efd5144a30359c0e6e1ea9fa3dd407d3318204150efd7b4caf6a  COPYRIGHT
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 80ace1c130..2ac6480934 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERADIUS_SERVER_VERSION = 3.2.8
+FREERADIUS_SERVER_VERSION = 3.2.10
 FREERADIUS_SERVER_SOURCE = \
 	freeradius-server-$(FREERADIUS_SERVER_VERSION).tar.bz2
 FREERADIUS_SERVER_SITE = https://freeradius.org/ftp/pub/freeradius

--===============3388484590374255298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3388484590374255298==--
