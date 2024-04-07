Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B79CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BB32414C0;
	Sun,  7 Apr 2024 16:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfvwqCCVkcr6; Sun,  7 Apr 2024 16:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F2F1414C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2F1414C9;
	Sun,  7 Apr 2024 16:05:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC1E1BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76CB340BC4
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uo0C9ID6Zid0 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6730040210
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6730040210
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BC0E85730; Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 18:04:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0af98ea2d889dd63bc6934236a625732ce28b059
X-Git-Newrev: dece32b6f3957320bcb689394164151dd8707f3b
X-Patchwork-Hint: ignore
Message-Id: <20240407160511.4BC0E85730@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtracefs: fix musl build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dece32b6f3957320bcb689394164151dd8707f3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since the addition of the
package in commit b1dbd3f679e6660325472e3fdca72127d74e6929 if cunit is
found:

../utest/tracefs-utest.c: In function 'test_uprobes_instance':
../utest/tracefs-utest.c:2492:19: error: 'PATH_MAX' undeclared (first use in this function)
 2492 |         char self[PATH_MAX] = { 0 };
      |                   ^~~~~~~~

Fixes: b1dbd3f679e6660325472e3fdca72127d74e6929
 - http://autobuild.buildroot.org/results/1a01883231dbc8a7688de26db9a08751165fe8fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...Add-PATH_MAX-if-it-is-not-already-defined.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch b/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch
new file mode 100644
index 0000000000..121fee5adf
--- /dev/null
+++ b/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch
@@ -0,0 +1,40 @@
+From ba750812f68f0f3314494558496c23f934f8faff Mon Sep 17 00:00:00 2001
+From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
+Date: Thu, 22 Feb 2024 11:02:46 -0500
+Subject: libtracefs utest: Add PATH_MAX if it is not already defined
+
+In some setups PATH_MAX may not be defined (it is usually defined in
+linux/limits.h), but we just use PATH_MAX as something to hold the paths
+to the tracing files. In that case, just define it to 1024 if it's not
+already defined.
+
+Link: https://lore.kernel.org/linux-trace-devel/20240222-utest-fixes-v2-1-7b8ee8dca0b7@gmail.com/
+
+Fixes: 845f16976929 ("libtracefs: Add unit tests")
+Reported-by: Miko Larsson <mikoxyzzz@gmail.com>
+Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
+
+Upstream: https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=ba750812f68f0f3314494558496c23f934f8faff
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ utest/tracefs-utest.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/utest/tracefs-utest.c b/utest/tracefs-utest.c
+index 963fac7..07ecd32 100644
+--- a/utest/tracefs-utest.c
++++ b/utest/tracefs-utest.c
+@@ -26,6 +26,10 @@
+ 
+ #define gettid() syscall(__NR_gettid)
+ 
++#ifndef PATH_MAX
++#define PATH_MAX 1024
++#endif
++
+ #define TRACEFS_SUITE		"tracefs library"
+ #define TEST_INSTANCE_NAME	"cunit_test_iter"
+ #define TEST_TRACE_DIR		"/tmp/trace_utest.XXXXXX"
+-- 
+cgit 1.2.3-korg
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
