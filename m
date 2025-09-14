Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA01CA0EE8
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 22:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0330C41F1D;
	Sun, 14 Sep 2025 22:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEuaWeSd4ilW; Sun, 14 Sep 2025 22:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EC0A4121F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC0A4121F;
	Sun, 14 Sep 2025 22:21:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CF16255
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B5AE4121F
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKCaWxE8m-1k for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FAC8411A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FAC8411A3
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FBA4846E8; Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 23:45:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79031b79c273c9346487592ee1638bdd48ba7749
X-Git-Newrev: fc472cc8c75406ae10d2cbb3d0a8e10889f692a6
X-Patchwork-Hint: ignore
Message-Id: <20250914222137.6FBA4846E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/policycoreutils: fix build with
 musl due to getpass()
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc472cc8c75406ae10d2cbb3d0a8e10889f692a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

policycoreutils uses getpass(), which with musl is only defined with
some feature macro defined, such as _GNU_SOURCE. So let's pick-up an
upstream fix to address this issue.

There are no autobuilder failures, the issue was most likely hidden by
other failures with musl affecting the SELinux stack.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...licycoreutils-run_init-define-_GNU_SOURCE.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch b/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch
new file mode 100644
index 0000000000..bef6909b0a
--- /dev/null
+++ b/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch
@@ -0,0 +1,37 @@
+From f338b2e7d2bbf70cb811eb1331162e33deb4ce6c Mon Sep 17 00:00:00 2001
+From: Robert Marko <robimarko@gmail.com>
+Date: Thu, 1 May 2025 21:59:13 +0200
+Subject: [PATCH] policycoreutils: run_init: define _GNU_SOURCE
+
+Trying to compile run_init with musl will fail with:
+run_init.c: In function 'authenticate_via_shadow_passwd':
+run_init.c:206:40: error: implicit declaration of function 'getpass' [-Wimplicit-function-declaration]
+  206 |         if (!(unencrypted_password_s = getpass(PASSWORD_PROMPT))) {
+
+This is because getpass in musl is guarded only for _GNU_SOURCE, so
+define _GNU_SOURCE for run_init.
+
+Signed-off-by: Robert Marko <robimarko@gmail.com>
+Acked-by: James Carter <jwcart2@gmail.com>
+Upstream: 50bafc3d9c08cf26c3b0f61e29157a0ea8efbf4a
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ policycoreutils/run_init/run_init.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/policycoreutils/run_init/run_init.c b/policycoreutils/run_init/run_init.c
+index ce499781..4531a8ba 100644
+--- a/policycoreutils/run_init/run_init.c
++++ b/policycoreutils/run_init/run_init.c
+@@ -37,6 +37,8 @@
+  *
+  *************************************************************************/
+ 
++#define _GNU_SOURCE
++
+ #include <stdio.h>
+ #include <stdlib.h>		/* for malloc(), realloc(), free() */
+ #include <pwd.h>		/* for getpwuid() */
+-- 
+2.51.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
