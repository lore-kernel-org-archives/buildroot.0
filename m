Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B43C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 21:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 890C084DC5;
	Tue, 21 Jan 2025 21:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bymw_CPoIZtc; Tue, 21 Jan 2025 21:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44CDE84F87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44CDE84F87;
	Tue, 21 Jan 2025 21:05:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB06D2FA0
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 21:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3AF0413CC
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 21:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3svtQQXskAw1 for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 21:05:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0601B417FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0601B417FF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0601B417FF
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 21:05:16 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D7E82B00585;
 Tue, 21 Jan 2025 22:05:12 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 21 Jan 2025 22:05:07 +0100
Message-ID: <20250121210507.661525-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737493514;
 bh=X8Jx8PbyFsa0uflD1qnxfcy04/+bx1j634i5lOLxZ7Y=;
 h=From:To:Cc:Subject:Date:From;
 b=iC9TfT7+95wMWlMob8s+iCu69idnAmTMnnybCT0dlxDUAHrOVk2g53j+9iF1AGVBG
 Yr1XsEGHMMVIxPKsbhDuaEZ2UoVIc9ghB0hi6J7AoO5zXFsS8Dd9pkGqRPRT/bmNon
 pcz0UncbINUlqVZkH+62rdaQX1tRtGT+NyyokrKccg1hnzXaFGjzHFp9MQ/vHTc6Vi
 Dgq9kjnjwbTPCHErhL3/Vf/QuDaxBRuxiKpI0e+F0Z9AoybRsLIPRRzMa2RP9gbLg/
 Dt0m/oMkkPXoNayO3xWo5tMf0OZ9wH/p/+KGsRaPYYue0IrLXwXkfgFxCzRkCzzgkb
 J2/Y+nNxnMdmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iC9TfT7+
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix libuuid build
 without pthread
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1], util-linux libuuid is failing to build
with uclibc toolchains, when there is no thread support
(that is, when BR2_PTHREADS_NONE=y).

Builds are failing with error:

    libuuid/src/gen_uuid.c:83:10: fatal error: pthread.h: No such file or directory
       83 | #include <pthread.h>
          |          ^~~~~~~~~~~

This failure is due to the upstream commit [2], which introduced the
pthread dependency.

This commit fixes the issue by adding a package patch, reimplementing
an equivalent behavior without using the pthread library.

Fixes:
https://autobuild.buildroot.org/results/e5856cf6f3b8512ededa17d20db2b330a478dd8e/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f14929c657a7b1794dcd39ac469d2ad826465d98
[2] https://github.com/util-linux/util-linux/commit/25bd5396ab700623134b491f42a3280556cb674c

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch (build) tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1634968321

Note: there was two build failures, unrelated to this patch.

The package patch was also tested at runtime, in qemu, with the code
reproducing the issue from:
https://github.com/util-linux/util-linux/issues/3009
util-linux 2.39.3 (previous Buildroot version) was compiling but could
generate duplicate uuids.
util-linux 2.40.2 with this patch is compiling, and does not generate
duplicate uuids.
---
 ...thread_atfork-usage-to-clear-uuidd-c.patch | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 package/util-linux/0002-libuuid-remove-pthread_atfork-usage-to-clear-uuidd-c.patch

diff --git a/package/util-linux/0002-libuuid-remove-pthread_atfork-usage-to-clear-uuidd-c.patch b/package/util-linux/0002-libuuid-remove-pthread_atfork-usage-to-clear-uuidd-c.patch
new file mode 100644
index 0000000000..068c1808d2
--- /dev/null
+++ b/package/util-linux/0002-libuuid-remove-pthread_atfork-usage-to-clear-uuidd-c.patch
@@ -0,0 +1,107 @@
+From ee06934d1819514ca2442054a47638ab9b190c44 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Tue, 21 Jan 2025 21:13:19 +0100
+Subject: [PATCH] libuuid: remove pthread_atfork() usage to clear uuidd cache
+ at fork()
+
+libuuid had an issue [1] in which it was returning duplicated
+(non-unique) uuids after a fork(). This was due to a reuse of cached
+values.
+
+The commit [2] fixed this issue by registering a cache reset function
+with pthread_atfork(), which is one of the rare possible standard call
+to do that.
+
+Before commit [2], libuuid was not depending on the pthread library.
+Many packages (also not strongly requiring a pthread library) are
+using libuuid. Example of those libuuid users still working without
+pthread are: e2fsprogs, erofs-utils, f2fs-tools, mtd, parted, ...
+Commit [2] is now propagating this dependency on all those packages.
+
+While this is not an issue on most mainstream Linux distributions
+(which are all including a pthread library), this introduced many
+failures in Buildroot Linux. See [3] and [4]. In this case, Buildroot
+Linux includes several configurations without pthread support. Those
+are based on the uClibc-ng. See [5]. Those configurations can still be
+useful in specific cases (very low resource systems, debug sessions,
+bring-ups, ...). Most of the packages using libuuid are low level
+system tools. Bringing a pthread requirement on them would reduce
+the number of cases in which they can be used.
+
+This commit proposes an alternate implementation of the uuidd cache
+cleanup, without relying on pthread_atfork(). Instead, it records the
+PID of the owner process which initialized the cache, and invalidate
+it if is about to be used by another PID. Since the pthread library
+is no longer needed, build system files are also updated accordingly.
+
+[1] https://github.com/util-linux/util-linux/issues/3009
+[2] https://github.com/t-8ch/util-linux/commit/25bd5396ab700623134b491f42a3280556cb674c
+[3] https://buildroot.org/
+[4] https://autobuild.buildroot.org/?reason=util-linux-2.40.2
+[5] https://uclibc-ng.org/
+
+Upstream: Proposed: https://github.com/util-linux/util-linux/pull/3375
+[Julien: rebased on v2.40.2]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ libuuid/src/Makemodule.am |  2 +-
+ libuuid/src/gen_uuid.c    | 11 +++++------
+ 2 files changed, 6 insertions(+), 7 deletions(-)
+
+diff --git a/libuuid/src/Makemodule.am b/libuuid/src/Makemodule.am
+index 867ad7be5..be2781123 100644
+--- a/libuuid/src/Makemodule.am
++++ b/libuuid/src/Makemodule.am
+@@ -31,7 +31,7 @@ libuuid_la_SOURCES = \
+ EXTRA_libuuid_la_DEPENDENCIES = \
+ 	libuuid/src/libuuid.sym
+ 
+-libuuid_la_LIBADD       = $(LDADD) $(SOCKET_LIBS) -lpthread
++libuuid_la_LIBADD       = $(LDADD) $(SOCKET_LIBS)
+ 
+ libuuid_la_CFLAGS = \
+ 	$(AM_CFLAGS) \
+diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
+index 3b76ddc9a..2482c4789 100644
+--- a/libuuid/src/gen_uuid.c
++++ b/libuuid/src/gen_uuid.c
+@@ -80,8 +80,6 @@
+ #if defined(__linux__) && defined(HAVE_SYS_SYSCALL_H)
+ #include <sys/syscall.h>
+ #endif
+-#include <pthread.h>
+-#include <signal.h>
+ 
+ #include "all-io.h"
+ #include "uuidP.h"
+@@ -589,6 +587,7 @@ THREAD_LOCAL struct {
+ 	int		last_used;
+ 	struct uuid	uu;
+ 	time_t		last_time;
++	pid_t		owner;
+ } uuidd_cache = {
+ 	.cache_size = CS_MIN,
+ };
+@@ -597,15 +596,15 @@ static void reset_uuidd_cache(void)
+ {
+ 	memset(&uuidd_cache, 0, sizeof(uuidd_cache));
+ 	uuidd_cache.cache_size = CS_MIN;
++	uuidd_cache.owner = getpid();
+ }
+ 
+ static int uuid_generate_time_generic(uuid_t out) {
+-	static volatile sig_atomic_t atfork_registered;
+ 	time_t	now;
+ 
+-	if (!atfork_registered) {
+-		pthread_atfork(NULL, NULL, reset_uuidd_cache);
+-		atfork_registered = 1;
++	/* avoid returning duplicate uuid from cache, in case of a fork() */
++	if (uuidd_cache.owner != getpid()) {
++		reset_uuidd_cache();
+ 	}
+ 
+ 	if (uuidd_cache.num > 0) { /* expire cache */
+-- 
+2.48.1
+
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
