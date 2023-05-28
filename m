Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DACC77B7E
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 19:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F47740C43;
	Sun, 28 May 2023 19:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F47740C43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WYNpCvAws5x; Sun, 28 May 2023 19:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5161B40641;
	Sun, 28 May 2023 19:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5161B40641
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CD4E1BF95C
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1695482005
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1695482005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXuGxAzlUFRt for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 19:42:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1933A80A66
 for <buildroot@buildroot.org>; Sun, 28 May 2023 19:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1933A80A66
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05836869F2; Sun, 28 May 2023 19:42:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 21:41:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 222d747effc286ac71d643077ab96cf7e2182c6d
X-Git-Newrev: b6ce18b5ac78474611cdea07b887f4f83bc78648
X-Patchwork-Hint: ignore
Message-Id: <20230528194213.05836869F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: fix busybox lineedit
 signal handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6ce18b5ac78474611cdea07b887f4f83bc78648
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the Busybox version bump to 1.36.0 the TestS6 fails during the
test teardown.

Backport an upstream patch fixing signal handling (SIGWINCH), see [1].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819388

[1] https://bugs.busybox.net/show_bug.cgi?id=15256

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Peter: use upstream commit as-is]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...IGWINCH-and-SIGCHLD-in-hush-interrupting-.patch | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch b/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
new file mode 100644
index 0000000000..8ebb487ec6
--- /dev/null
+++ b/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
@@ -0,0 +1,103 @@
+From 93e0898c663a533082b5f3c2e7dcce93ec47076d Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 26 Jan 2023 12:56:33 +0100
+Subject: [PATCH] shell: fix SIGWINCH and SIGCHLD (in hush) interrupting line
+ input, closes 15256
+
+function                                             old     new   delta
+record_pending_signo                                  32      63     +31
+lineedit_read_key                                    231     224      -7
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 1/1 up/down: 31/-7)              Total: 24 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Upstream: https://git.busybox.net/busybox/commit/?id=93e0898c663a533082b5f3c2e7dcce93ec47076d
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ libbb/lineedit.c | 17 ++++++++++-------
+ shell/ash.c      |  3 ++-
+ shell/hush.c     | 10 ++++++++--
+ 3 files changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/libbb/lineedit.c b/libbb/lineedit.c
+index d6b2e76ff..b942f540a 100644
+--- a/libbb/lineedit.c
++++ b/libbb/lineedit.c
+@@ -2180,7 +2180,8 @@ static int lineedit_read_key(char *read_key_buffer, int timeout)
+ 		 * "\xff\n",pause,"ls\n" invalid and thus won't lose "ls".
+ 		 *
+ 		 * If LI_INTERRUPTIBLE, return -1 if got EINTR in poll()
+-		 * inside read_key, or if bb_got_signal != 0 (IOW: if signal
++		 * inside read_key and bb_got_signal became != 0,
++		 * or if bb_got_signal != 0 (IOW: if signal
+ 		 * arrived before poll() is reached).
+ 		 *
+ 		 * Note: read_key sets errno to 0 on success.
+@@ -2197,14 +2198,16 @@ static int lineedit_read_key(char *read_key_buffer, int timeout)
+ 			IF_FEATURE_EDITING_WINCH(S.ok_to_redraw = 0;)
+ 			if (errno != EINTR)
+ 				break;
++			/* It was EINTR. Repeat read_key() unless... */
+ 			if (state->flags & LI_INTERRUPTIBLE) {
+-				/* LI_INTERRUPTIBLE bails out on EINTR,
+-				 * but nothing really guarantees that bb_got_signal
+-				 * is nonzero. Follow the least surprise principle:
++				/* LI_INTERRUPTIBLE bails out on EINTR
++				 * if bb_got_signal became nonzero.
++				 * (It may stay zero: for example, our SIGWINCH
++				 * handler does not set it. This is used for signals
++				 * which should not interrupt line editing).
+ 				 */
+-				if (bb_got_signal == 0)
+-					bb_got_signal = 255;
+-				goto ret;
++				if (bb_got_signal != 0)
++					goto ret; /* will return -1 */
+ 			}
+ 		}
+ 
+diff --git a/shell/ash.c b/shell/ash.c
+index 18ccc1329..5f8c8ea19 100644
+--- a/shell/ash.c
++++ b/shell/ash.c
+@@ -10821,7 +10821,8 @@ preadfd(void)
+  again:
+ 		/* For shell, LI_INTERRUPTIBLE is set:
+ 		 * read_line_input will abort on either
+-		 * getting EINTR in poll(), or if it sees bb_got_signal != 0
++		 * getting EINTR in poll() and bb_got_signal became != 0,
++		 * or if it sees bb_got_signal != 0
+ 		 * (IOW: if signal arrives before poll() is reached).
+ 		 * Interactive testcases:
+ 		 * (while kill -INT $$; do sleep 1; done) &
+diff --git a/shell/hush.c b/shell/hush.c
+index d111f0cc5..f064b8fd2 100644
+--- a/shell/hush.c
++++ b/shell/hush.c
+@@ -1946,7 +1946,12 @@ static void record_pending_signo(int sig)
+ {
+ 	sigaddset(&G.pending_set, sig);
+ #if ENABLE_FEATURE_EDITING
+-	bb_got_signal = sig; /* for read_line_input: "we got a signal" */
++	if (sig != SIGCHLD
++	 || (G_traps && G_traps[SIGCHLD] && G_traps[SIGCHLD][0])
++	 /* ^^^ if SIGCHLD, interrupt line reading only if it has a trap */
++	) {
++		bb_got_signal = sig; /* for read_line_input: "we got a signal" */
++	}
+ #endif
+ #if ENABLE_HUSH_FAST
+ 	if (sig == SIGCHLD) {
+@@ -2669,7 +2674,8 @@ static int get_user_input(struct in_str *i)
+ 		} else {
+ 			/* For shell, LI_INTERRUPTIBLE is set:
+ 			 * read_line_input will abort on either
+-			 * getting EINTR in poll(), or if it sees bb_got_signal != 0
++			 * getting EINTR in poll() and bb_got_signal became != 0,
++			 * or if it sees bb_got_signal != 0
+ 			 * (IOW: if signal arrives before poll() is reached).
+ 			 * Interactive testcases:
+ 			 * (while kill -INT $$; do sleep 1; done) &
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
