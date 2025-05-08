Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8889AC3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 17:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C21941474;
	Thu,  8 May 2025 17:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bDi3U8wmMnA; Thu,  8 May 2025 17:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3C1A41465
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C1A41465;
	Thu,  8 May 2025 17:36:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C394A15A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A112B60EE4
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNLjdCihk6Oc for <buildroot@buildroot.org>;
 Thu,  8 May 2025 17:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA06A60AA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA06A60AA8
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:36:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4DC486619; Thu,  8 May 2025 17:36:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 8 May 2025 19:13:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e40bf89e40109f5469cf51abfce52e7c4f690965
X-Git-Newrev: 56c834400eefb25ed2ea9b49aaf8fd89efa5f617
X-Patchwork-Hint: ignore
Message-Id: <20250508173603.B4DC486619@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: add patches for GCC 15.x
 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=56c834400eefb25ed2ea9b49aaf8fd89efa5f617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit backports an upstream patch fixing the bundled readline
library so that it builds with GCC 15.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...eadline-tcap.h-Update-definitions-for-C23.patch | 52 ++++++++++++++++++++++
 ...eadline-tcap.h-Update-definitions-for-C23.patch | 52 ++++++++++++++++++++++
 ...eadline-tcap.h-Update-definitions-for-C23.patch | 52 ++++++++++++++++++++++
 3 files changed, 156 insertions(+)

diff --git a/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
new file mode 100644
index 0000000000..50100d8bfc
--- /dev/null
+++ b/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
@@ -0,0 +1,52 @@
+From 0f81e47dff4bddc6ba9c45402821f857251f2b0f Mon Sep 17 00:00:00 2001
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
diff --git a/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
new file mode 100644
index 0000000000..64f741fe75
--- /dev/null
+++ b/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
@@ -0,0 +1,52 @@
+From 130750cf9607fc1c4bcbead820a27bee6ee60f04 Mon Sep 17 00:00:00 2001
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
diff --git a/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch
new file mode 100644
index 0000000000..c9a34e9a89
--- /dev/null
+++ b/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch
@@ -0,0 +1,52 @@
+From f37d1bbe334c751b9bd77fa3a9d9accd93614677 Mon Sep 17 00:00:00 2001
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
