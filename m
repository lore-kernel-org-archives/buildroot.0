Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85890C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1912F40992;
	Sat, 22 Jan 2022 19:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1wCun8utJ-s; Sat, 22 Jan 2022 19:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E8A4095D;
	Sat, 22 Jan 2022 19:42:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D85C1BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8680C60BBC
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qR70qPlPwwJd for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:42:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A91860864
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:42:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 26CAD8294C; Sat, 22 Jan 2022 19:35:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 20:11:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e410b4a32c88ab8f0799c276fb02bc2698c8782
X-Git-Newrev: 5039c49d580eaaea493c28c707314a233e40c9fa
X-Patchwork-Hint: ignore
Message-Id: <20220122193531.26CAD8294C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 2.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5039c49d580eaaea493c28c707314a233e40c9fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version dropped support to NFSv2.

Drop patches backported from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0001-nfsdcltrack-sqlite-Fix-printf-format.patch | 52 -----------------
 ...sdcltrack-nfsdcltrack.c-Fix-printf-format.patch | 48 ----------------
 ...fsdcltrack-Use-uint64_t-instead-of-time_t.patch | 66 ----------------------
 package/nfs-utils/nfs-utils.hash                   |  4 +-
 package/nfs-utils/nfs-utils.mk                     |  2 +-
 5 files changed, 3 insertions(+), 169 deletions(-)

diff --git a/package/nfs-utils/0001-nfsdcltrack-sqlite-Fix-printf-format.patch b/package/nfs-utils/0001-nfsdcltrack-sqlite-Fix-printf-format.patch
deleted file mode 100644
index 14894602c4..0000000000
--- a/package/nfs-utils/0001-nfsdcltrack-sqlite-Fix-printf-format.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From d05ba5335e869bcd68c0def795c55fd5037914e3 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel () gmail ! com>
-Date: Thu, 22 Jul 2021 16:15:44 +0000
-Subject: [PATCH] nfsdcltrack/sqlite: Fix printf format
-
-sqlite.c: In function 'sqlite_remove_unreclaimed':
-sqlite.c:547:71: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'time_t' {aka 'long long int'} [-Werror=format=]
-  547 |  ret = snprintf(buf, sizeof(buf), "DELETE FROM clients WHERE time < %ld",
-      |                                                                     ~~^
-      |                                                                       |
-      |                                                                       long int
-      |                                                                     %lld
-  548 |    grace_start);
-      |    ~~~~~~~~~~~
-      |    |
-      |    time_t {aka long long int}
-
-Found in Buildroot riscv32 build.
-
-Link: http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9/build-end.log
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=4f2a5b64386600430ec6b71e57b88c5efaa70aed
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- utils/nfsdcltrack/sqlite.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/utils/nfsdcltrack/sqlite.c b/utils/nfsdcltrack/sqlite.c
-index f79aebb3..cea4a411 100644
---- a/utils/nfsdcltrack/sqlite.c
-+++ b/utils/nfsdcltrack/sqlite.c
-@@ -46,6 +46,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <fcntl.h>
-+#include <inttypes.h>
- #include <unistd.h>
- #include <sqlite3.h>
- #include <linux/limits.h>
-@@ -544,7 +545,7 @@ sqlite_remove_unreclaimed(time_t grace_start)
- 	int ret;
- 	char *err = NULL;
- 
--	ret = snprintf(buf, sizeof(buf), "DELETE FROM clients WHERE time < %ld",
-+	ret = snprintf(buf, sizeof(buf), "DELETE FROM clients WHERE time < %"PRIu64,
- 			grace_start);
- 	if (ret < 0) {
- 		return ret;
--- 
-2.25.1
-
diff --git a/package/nfs-utils/0002-nfsdcltrack-nfsdcltrack.c-Fix-printf-format.patch b/package/nfs-utils/0002-nfsdcltrack-nfsdcltrack.c-Fix-printf-format.patch
deleted file mode 100644
index 0893959460..0000000000
--- a/package/nfs-utils/0002-nfsdcltrack-nfsdcltrack.c-Fix-printf-format.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 14eb2cae4fca95609ae4efde2444fd0a5ddfca04 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel () gmail ! com>
-Date: Thu, 22 Jul 2021 16:15:45 +0000
-Subject: [PATCH] nfsdcltrack/nfsdcltrack.c: Fix printf format
-
-nfsdcltrack.c: In function 'cltrack_gracedone':
-nfsdcltrack.c:528:47: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'time_t' {aka 'long long int'} [-Werror=format=]
-  528 |  xlog(D_GENERAL, "%s: grace done. gracetime=%ld", __func__, gracetime);
-      |                                             ~~^             ~~~~~~~~~
-      |                                               |             |
-      |                                               long int      time_t {aka long long int}
-      |                                             %lld
-
-Found in Buildroot riscv32 build.
-
-Link: http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9/build-end.log
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=5a53426c0f4e84f6644c11e4f01015597d3bb82c
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- utils/nfsdcltrack/nfsdcltrack.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/utils/nfsdcltrack/nfsdcltrack.c b/utils/nfsdcltrack/nfsdcltrack.c
-index e926f1c0..0b37c094 100644
---- a/utils/nfsdcltrack/nfsdcltrack.c
-+++ b/utils/nfsdcltrack/nfsdcltrack.c
-@@ -33,6 +33,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <fcntl.h>
-+#include <inttypes.h>
- #include <unistd.h>
- #include <libgen.h>
- #include <sys/inotify.h>
-@@ -525,7 +526,7 @@ cltrack_gracedone(const char *timestr)
- 	if (*tail)
- 		return -EINVAL;
- 
--	xlog(D_GENERAL, "%s: grace done. gracetime=%ld", __func__, gracetime);
-+	xlog(D_GENERAL, "%s: grace done. gracetime=%"PRIu64, __func__, gracetime);
- 
- 	ret = sqlite_remove_unreclaimed(gracetime);
- 
--- 
-2.25.1
-
diff --git a/package/nfs-utils/0003-nfsdcltrack-Use-uint64_t-instead-of-time_t.patch b/package/nfs-utils/0003-nfsdcltrack-Use-uint64_t-instead-of-time_t.patch
deleted file mode 100644
index 384f4fd806..0000000000
--- a/package/nfs-utils/0003-nfsdcltrack-Use-uint64_t-instead-of-time_t.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 383d787d1b77f165da68495cb0363220b66935a4 Mon Sep 17 00:00:00 2001
-From: Steve Dickson <steved@redhat.com>
-Date: Tue, 27 Jul 2021 21:12:17 -0400
-Subject: [PATCH] nfsdcltrack: Use uint64_t instead of time_t
-
-With recent commits (4f2a5b64,5a53426c) that fixed
-compile errors on x86_64 machines, caused similar
-errors on i686 machines.
-
-The variable type that was being used was a time_t,
-which changes size between architects, which
-caused the compile error.
-
-Changing the variable to uint64_t fixed the issue.
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=383d787d1b77f165da68495cb0363220b66935a4
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- utils/nfsdcltrack/nfsdcltrack.c | 2 +-
- utils/nfsdcltrack/sqlite.c      | 2 +-
- utils/nfsdcltrack/sqlite.h      | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/utils/nfsdcltrack/nfsdcltrack.c b/utils/nfsdcltrack/nfsdcltrack.c
-index 0b37c094..7c1c4bcc 100644
---- a/utils/nfsdcltrack/nfsdcltrack.c
-+++ b/utils/nfsdcltrack/nfsdcltrack.c
-@@ -508,7 +508,7 @@ cltrack_gracedone(const char *timestr)
- {
- 	int ret;
- 	char *tail;
--	time_t gracetime;
-+	uint64_t gracetime;
- 
- 
- 	ret = sqlite_prepare_dbh(storagedir);
-diff --git a/utils/nfsdcltrack/sqlite.c b/utils/nfsdcltrack/sqlite.c
-index cea4a411..cf0c6a45 100644
---- a/utils/nfsdcltrack/sqlite.c
-+++ b/utils/nfsdcltrack/sqlite.c
-@@ -540,7 +540,7 @@ out_err:
-  * remove any client records that were not reclaimed since grace_start.
-  */
- int
--sqlite_remove_unreclaimed(time_t grace_start)
-+sqlite_remove_unreclaimed(uint64_t grace_start)
- {
- 	int ret;
- 	char *err = NULL;
-diff --git a/utils/nfsdcltrack/sqlite.h b/utils/nfsdcltrack/sqlite.h
-index 06e7c044..ba8cdfa8 100644
---- a/utils/nfsdcltrack/sqlite.h
-+++ b/utils/nfsdcltrack/sqlite.h
-@@ -26,7 +26,7 @@ int sqlite_insert_client(const unsigned char *clname, const size_t namelen,
- int sqlite_remove_client(const unsigned char *clname, const size_t namelen);
- int sqlite_check_client(const unsigned char *clname, const size_t namelen,
- 				const bool has_session);
--int sqlite_remove_unreclaimed(const time_t grace_start);
-+int sqlite_remove_unreclaimed(const uint64_t grace_start);
- int sqlite_query_reclaiming(const time_t grace_start);
- 
- #endif /* _SQLITE_H */
--- 
-2.32.0
-
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 2073bebd8a..a73bf80e70 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.5.4/sha256sums.asc
-sha256  51997d94e4c8bcef5456dd36a9ccc38e231207c4e9b6a9a2c108841e6aebe3dd  nfs-utils-2.5.4.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.1/sha256sums.asc
+sha256  60dfcd94a9f3d72a12bc7058d811787ec87a6d593d70da2123faf9aad3d7a1df  nfs-utils-2.6.1.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 07b44b5a93..6a3a801359 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.5.4
+NFS_UTILS_VERSION = 2.6.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
