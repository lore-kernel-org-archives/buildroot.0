Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7D9C021B8
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 20:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 603FC608CE;
	Tue, 25 Feb 2025 20:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlUvDkRXEtYF; Tue, 25 Feb 2025 20:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 530C760A40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 530C760A40;
	Tue, 25 Feb 2025 20:31:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C053D2DF0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF4D160A88
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjiHzo8KSS6S for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 20:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD3760825
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBD3760825
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:31:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABA5987B3F; Tue, 25 Feb 2025 20:31:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Feb 2025 20:56:31 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5bf8e339bc77b56aa9f40dfc6af14e19df723237
X-Git-Newrev: 1e0d7b66f28421b40dc6c947abf2311df5978a81
X-Patchwork-Hint: ignore
Message-Id: <20250225203128.ABA5987B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/watchdogd: fix
 use of uninitialized exit status
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e0d7b66f28421b40dc6c947abf2311df5978a81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The bug could lead to incorrect "critical error" reports if that
uninitialized memory happened to contain a value that interpreted as
an int was above the critical threshold. It affected primarily scripts
running approximately one second or longer, because access happens by
timer.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bfb87bafdb817291a66cfb6050b78e31b02ceda4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-Fix-use-of-uninitialized-exit-status.patch | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch b/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch
new file mode 100644
index 0000000000..69e7b36ef4
--- /dev/null
+++ b/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch
@@ -0,0 +1,85 @@
+From f6d56c374723923e276ccfd442fdd0cabf23d095 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Fri, 14 Feb 2025 19:26:24 +0100
+Subject: [PATCH] Fix use of uninitialized exit status
+
+Depending on the timing between the SIGCHLD callback run and the first
+generic_cb() timer callback run, script_exit_status() sometimes
+returned uninitialized memory as the exit status of a script. This
+could lead to incorrect "critical error" reports if that uninitialized
+memory happened to contain a value that interpreted as an int was
+above the critical threshold.
+
+Additionally, script_exit_status() unconditionally removed the process
+information from the queue, meaning that if a process had not
+completed by the time its status was first probed, its status could
+never be updated or successfully probed again, leading to timeout. Fix
+this by removing the process only if the status indicates it has
+terminated (successful or not).
+
+The problems affected primarily scripts running approximately one
+second or longer, because very short running scripts will very likely
+have their exit status collected by the SIGCHLD callback before the
+first timer callback run.
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://github.com/troglobit/watchdogd/pull/52
+---
+ src/script.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/src/script.c b/src/script.c
+index 1220fb9..f6e0763 100644
+--- a/src/script.c
++++ b/src/script.c
+@@ -16,6 +16,7 @@
+  */
+ 
+ #include <errno.h>
++#include <stdbool.h>		/* bool type (before C23) */
+ #include <stdlib.h>		/* setenv() */
+ #include <sys/wait.h>		/* waitpid() */
+ #include <unistd.h>		/* execv(), _exit() */
+@@ -28,6 +29,7 @@
+ struct exec_info {
+ 	pid_t   pid;
+ 	int     exit_status;
++	bool    exited;
+ 	void  (*cb)(void *arg);
+ 	void   *arg;
+ 	LIST_ENTRY(exec_info) entry;
+@@ -64,6 +66,8 @@ static void add(pid_t pid, void (*cb)(void *), void *arg)
+ 	}
+ 
+ 	info->pid = pid;
++	info->exit_status = 0;
++	info->exited = false;
+ 	info->cb  = cb;
+ 	info->arg = arg;
+ 	LIST_INSERT_HEAD(&exec_info_head, info, entry);
+@@ -78,6 +82,7 @@ static int exec(pid_t pid, int status)
+ 			continue;
+ 
+ 		info->exit_status = status;
++		info->exited = true;
+ 		if (info->cb)
+ 			info->cb(info->arg);
+ 
+@@ -96,9 +101,11 @@ int script_exit_status(pid_t pid)
+ 		if (info->pid != pid)
+ 			continue;
+ 
+-		status = info->exit_status;
+-		LIST_REMOVE(info, entry);
+-		free(info);
++		if (info->exited) {
++			status = info->exit_status;
++			LIST_REMOVE(info, entry);
++			free(info);
++		}
+ 		break;
+ 	}
+ 
+-- 
+2.47.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
