Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAC7C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 11:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A573740119;
	Thu,  3 Feb 2022 11:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7R0dBYIazos; Thu,  3 Feb 2022 11:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8307E409F2;
	Thu,  3 Feb 2022 11:05:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 358141BF20F
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 11:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3167340544
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 11:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgfBcrOXp0Cz for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 11:05:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60554404CC
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 11:05:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ECE258275E; Thu,  3 Feb 2022 10:58:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Feb 2022 12:04:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d895bd973b35fde10d3dd7db530d9e4782926497
X-Git-Newrev: 72b4229cfce065d877168bf368081378d6c80a6e
X-Patchwork-Hint: ignore
Message-Id: <20220203105812.ECE258275E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libblockdev: fix build with
 libglib2 >= 2.69
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

commit: https://git.buildroot.net/buildroot/commit/?id=72b4229cfce065d877168bf368081378d6c80a6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of libglib2 to version
2.70 in commit 079923d5fabf4f887bb140808cb16067ca08b19b:

exec.c: In function 'bd_utils_exec_and_report_status_error':
exec.c:239:5: error: 'g_spawn_check_exit_status' is deprecated: Use 'g_spawn_check_wait_status' instead [-Werror=deprecated-declarations]
  239 |     if (!g_spawn_check_exit_status (exit_status, error)) {
      |     ^~

Fixes:
 - http://autobuild.buildroot.org/results/8f9ca895cb07014804130a7ccbcb758b1d519470

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...02-exec-Fix-deprecated-glib-function-call.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch b/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch
new file mode 100644
index 0000000000..2c370a133f
--- /dev/null
+++ b/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch
@@ -0,0 +1,32 @@
+From aad927a81fd9067865dc391c5bbff12ac51a0002 Mon Sep 17 00:00:00 2001
+From: Manuel Wassermann <manuel.wassermann97@gmail.com>
+Date: Thu, 1 Jul 2021 04:45:49 +0200
+Subject: [PATCH] exec: Fix deprecated glib function call Glib will rename
+ "g_spawn_check_exit_status()" to "g_spawn_check_wait_status()" in version
+ 2.69.
+
+[Retrieved from:
+https://github.com/storaged-project/libblockdev/commit/aad927a81fd9067865dc391c5bbff12ac51a0002]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/utils/exec.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/utils/exec.c b/src/utils/exec.c
+index 317fb5525..8faeb289c 100644
+--- a/src/utils/exec.c
++++ b/src/utils/exec.c
+@@ -236,7 +236,12 @@ gboolean bd_utils_exec_and_report_status_error (const gchar **argv, const BDExtr
+     /* g_spawn_sync set the status in the same way waitpid() does, we need
+        to get the process exit code manually (this is similar to calling
+        WEXITSTATUS but also sets the error for terminated processes */
+-    if (!g_spawn_check_exit_status (exit_status, error)) {
++
++    #if !GLIB_CHECK_VERSION(2, 69, 0)
++    #define g_spawn_check_wait_status(x,y) (g_spawn_check_exit_status (x,y))
++    #endif
++
++    if (!g_spawn_check_wait_status (exit_status, error)) {
+         if (g_error_matches (*error, G_SPAWN_ERROR, G_SPAWN_ERROR_FAILED)) {
+             /* process was terminated abnormally (e.g. using a signal) */
+             g_free (stdout_data);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
