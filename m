Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FECC3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 367CD845E9;
	Mon, 19 May 2025 10:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ht375jtRRdla; Mon, 19 May 2025 10:58:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C29A845CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C29A845CF;
	Mon, 19 May 2025 10:58:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E23AD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B365340C40
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zI9qWapohi2S for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28849410DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28849410DB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2495E82A2E; Mon, 19 May 2025 10:40:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 8 May 2025 21:31:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 56c834400eefb25ed2ea9b49aaf8fd89efa5f617
X-Git-Newrev: dc0691f038e4cefa1cef064d160dfe1421aa278f
X-Patchwork-Hint: ignore
Message-Id: <20250519104000.2495E82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdb: add patch to fix
 GCC 15.x build issue with ARC-specific gdb
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc0691f038e4cefa1cef064d160dfe1421aa278f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adds the same patch that was already added to GDB 14.x,
15.x and 16.x to fix a GCC 15.x build issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...eadline-tcap.h-Update-definitions-for-C23.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/gdb/arc-2023.09-release/0001-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/arc-2023.09-release/0001-readline-tcap.h-Update-definitions-for-C23.patch
new file mode 100644
index 0000000000..33c0ee95fc
--- /dev/null
+++ b/package/gdb/arc-2023.09-release/0001-readline-tcap.h-Update-definitions-for-C23.patch
@@ -0,0 +1,52 @@
+From 93f772832b96e0c48223c452324e9736d7de051e Mon Sep 17 00:00:00 2001
+From: Chris Packham <judge.packham@gmail.com>
+Date: Wed, 30 Apr 2025 16:49:44 +1200
+Subject: [PATCH] readline/tcap.h: Update definitions for C23
+
+C23 changes how function definitions like int `int tputs ()` are
+interpreted. In older standards this meant that the function arguments
+are unknown. In C23 this is interpreted as `int tputs (void)` so now
+when we compile with GCC15 (which defaults to -std=gnu23) we get an
+error such as
+
+  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
+
+Add the function arguments for tgetent(), tgetflag(), tgetnum(),
+tgetstr(), tputs() and tgoto().
+
+Signed-off-by: Chris Packham <judge.packham@gmail.com>
+Approved-By: Tom Tromey <tom@tromey.com>
+Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ readline/readline/tcap.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
+index 859e6eed5aa..9e2ed124e49 100644
+--- a/readline/readline/tcap.h
++++ b/readline/readline/tcap.h
+@@ -46,14 +46,14 @@ extern char *UP, *BC;
+ 
+ extern short ospeed;
+ 
+-extern int tgetent ();
+-extern int tgetflag ();
+-extern int tgetnum ();
+-extern char *tgetstr ();
++extern int tgetent (char *bp, const char *name);
++extern int tgetflag (char *id);
++extern int tgetnum (char *id);
++extern char *tgetstr (char *id, char **area);
+ 
+-extern int tputs ();
++extern int tputs (const char *str, int affcnt, int (*putc)(int));
+ 
+-extern char *tgoto ();
++extern char *tgoto (const char *cap, int col, int row);
+ 
+ #endif /* HAVE_TERMCAP_H */
+ 
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
