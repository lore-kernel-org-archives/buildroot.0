Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973BCC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:51:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5939060243
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5939060243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B40542484;
	Wed,  4 Aug 2021 00:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SVy7F6ajDTBN; Wed,  4 Aug 2021 00:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E22342485;
	Wed,  4 Aug 2021 00:51:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E2161BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95ED740E9C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fXGpnJMb1jvk for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3399340E5B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 86E4487044; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 22:00:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1b830de9bcdf138738c6364b764f1becf8c88618
X-Git-Newrev: daa5459b6aaa059ca16cb98a1cc16b6fb9964cc6
X-Patchwork-Hint: ignore
Message-Id: <20210803211022.86E4487044@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nfs-utils: fix printfs
 format build failure on 64-bits platforms
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

commit: https://git.buildroot.net/buildroot/commit/?id=daa5459b6aaa059ca16cb98a1cc16b6fb9964cc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add 2 upstream patches from nfs-utils that fix build failures on
64-bits where time_t is assumed to be a long long when passed to
printf("%ld"), but that is not always true, so in these patches the
author (Petr) uses PRIu64 tag.

Fixes:
http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-nfsdcltrack-sqlite-Fix-printf-format.patch | 52 ++++++++++++++++++++++
 ...sdcltrack-nfsdcltrack.c-Fix-printf-format.patch | 48 ++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/package/nfs-utils/0001-nfsdcltrack-sqlite-Fix-printf-format.patch b/package/nfs-utils/0001-nfsdcltrack-sqlite-Fix-printf-format.patch
new file mode 100644
index 0000000000..14894602c4
--- /dev/null
+++ b/package/nfs-utils/0001-nfsdcltrack-sqlite-Fix-printf-format.patch
@@ -0,0 +1,52 @@
+From d05ba5335e869bcd68c0def795c55fd5037914e3 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel () gmail ! com>
+Date: Thu, 22 Jul 2021 16:15:44 +0000
+Subject: [PATCH] nfsdcltrack/sqlite: Fix printf format
+
+sqlite.c: In function 'sqlite_remove_unreclaimed':
+sqlite.c:547:71: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'time_t' {aka 'long long int'} [-Werror=format=]
+  547 |  ret = snprintf(buf, sizeof(buf), "DELETE FROM clients WHERE time < %ld",
+      |                                                                     ~~^
+      |                                                                       |
+      |                                                                       long int
+      |                                                                     %lld
+  548 |    grace_start);
+      |    ~~~~~~~~~~~
+      |    |
+      |    time_t {aka long long int}
+
+Found in Buildroot riscv32 build.
+
+Link: http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9/build-end.log
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=4f2a5b64386600430ec6b71e57b88c5efaa70aed
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ utils/nfsdcltrack/sqlite.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/utils/nfsdcltrack/sqlite.c b/utils/nfsdcltrack/sqlite.c
+index f79aebb3..cea4a411 100644
+--- a/utils/nfsdcltrack/sqlite.c
++++ b/utils/nfsdcltrack/sqlite.c
+@@ -46,6 +46,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <fcntl.h>
++#include <inttypes.h>
+ #include <unistd.h>
+ #include <sqlite3.h>
+ #include <linux/limits.h>
+@@ -544,7 +545,7 @@ sqlite_remove_unreclaimed(time_t grace_start)
+ 	int ret;
+ 	char *err = NULL;
+ 
+-	ret = snprintf(buf, sizeof(buf), "DELETE FROM clients WHERE time < %ld",
++	ret = snprintf(buf, sizeof(buf), "DELETE FROM clients WHERE time < %"PRIu64,
+ 			grace_start);
+ 	if (ret < 0) {
+ 		return ret;
+-- 
+2.25.1
+
diff --git a/package/nfs-utils/0002-nfsdcltrack-nfsdcltrack.c-Fix-printf-format.patch b/package/nfs-utils/0002-nfsdcltrack-nfsdcltrack.c-Fix-printf-format.patch
new file mode 100644
index 0000000000..0893959460
--- /dev/null
+++ b/package/nfs-utils/0002-nfsdcltrack-nfsdcltrack.c-Fix-printf-format.patch
@@ -0,0 +1,48 @@
+From 14eb2cae4fca95609ae4efde2444fd0a5ddfca04 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel () gmail ! com>
+Date: Thu, 22 Jul 2021 16:15:45 +0000
+Subject: [PATCH] nfsdcltrack/nfsdcltrack.c: Fix printf format
+
+nfsdcltrack.c: In function 'cltrack_gracedone':
+nfsdcltrack.c:528:47: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'time_t' {aka 'long long int'} [-Werror=format=]
+  528 |  xlog(D_GENERAL, "%s: grace done. gracetime=%ld", __func__, gracetime);
+      |                                             ~~^             ~~~~~~~~~
+      |                                               |             |
+      |                                               long int      time_t {aka long long int}
+      |                                             %lld
+
+Found in Buildroot riscv32 build.
+
+Link: http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9/build-end.log
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=5a53426c0f4e84f6644c11e4f01015597d3bb82c
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ utils/nfsdcltrack/nfsdcltrack.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/utils/nfsdcltrack/nfsdcltrack.c b/utils/nfsdcltrack/nfsdcltrack.c
+index e926f1c0..0b37c094 100644
+--- a/utils/nfsdcltrack/nfsdcltrack.c
++++ b/utils/nfsdcltrack/nfsdcltrack.c
+@@ -33,6 +33,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <fcntl.h>
++#include <inttypes.h>
+ #include <unistd.h>
+ #include <libgen.h>
+ #include <sys/inotify.h>
+@@ -525,7 +526,7 @@ cltrack_gracedone(const char *timestr)
+ 	if (*tail)
+ 		return -EINVAL;
+ 
+-	xlog(D_GENERAL, "%s: grace done. gracetime=%ld", __func__, gracetime);
++	xlog(D_GENERAL, "%s: grace done. gracetime=%"PRIu64, __func__, gracetime);
+ 
+ 	ret = sqlite_remove_unreclaimed(gracetime);
+ 
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
