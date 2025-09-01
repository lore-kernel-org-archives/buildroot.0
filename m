Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787E7CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 07:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33DBD83ED5;
	Mon,  1 Sep 2025 07:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9GDzWGy_w5S; Mon,  1 Sep 2025 07:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3906183D25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3906183D25;
	Mon,  1 Sep 2025 07:58:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DE72169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 07:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AFC1413DC
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 07:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7w4Ch2pkfQ2L for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 07:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88A2C413DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88A2C413DB
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 07:58:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82F5D87AFD; Mon,  1 Sep 2025 07:58:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 Sep 2025 09:58:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e91db90e28032548e46aec8490309bd56a4f7db
X-Git-Newrev: 17259a22353e7f46837a073805fd8fd4fc9b9831
X-Patchwork-Hint: ignore
Message-Id: <20250901075844.82F5D87AFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tstools: fix build w/ gcc-15
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
Content-Type: multipart/mixed; boundary="===============3928641190513434848=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3928641190513434848==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=17259a22353e7f46837a073805fd8fd4fc9b9831
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC-15 defaults to C23, which changes the meaning of an empty parameter
list:

https://gcc.gnu.org/gcc-15/porting_to.html#c23-fn-decls-without-parameters

Leading to a build failure:

tsserve.c: In function ‘set_child_exit_handler’:
tsserve.c:2988:21: error: assignment to ‘__sighandler_t’ {aka ‘void (*)(int)’} from incompatible pointer type ‘void (*)(void)’ [-Wincompatible-pointer-types]
 2988 |   action.sa_handler = on_child_exit;

Add a patch from an upstream PR to fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tstools/0002-fix-build-with-gcc-15.patch | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/tstools/0002-fix-build-with-gcc-15.patch b/package/tstools/0002-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..193bad43b8
--- /dev/null
+++ b/package/tstools/0002-fix-build-with-gcc-15.patch
@@ -0,0 +1,27 @@
+From a1f2a71b286135d89865bb0332cbe3db59cea300 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 9 Dec 2024 16:57:53 +1100
+Subject: [PATCH] fix build with gcc-15
+
+Upstream: https://github.com/kynesim/tstools/pull/44
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ tsserve.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tsserve.c b/tsserve.c
+index d81042e..253ba0c 100644
+--- a/tsserve.c
++++ b/tsserve.c
+@@ -2958,7 +2958,7 @@ static void set_child_exit_handler();
+ /*
+  * Signal handler - catch children and stop them becoming zombies
+  */
+-static void on_child_exit()
++static void on_child_exit(int signum)
+ {
+ #if 0
+   print_msg("sighandler: starting\n");
+-- 
+2.39.5
+

--===============3928641190513434848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3928641190513434848==--
