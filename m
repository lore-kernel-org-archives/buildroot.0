Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EBAC3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 17:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6794383B5C;
	Thu,  8 May 2025 17:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 095UcH5ntzPB; Thu,  8 May 2025 17:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FA9C83B57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FA9C83B57;
	Thu,  8 May 2025 17:55:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAA2915A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A05BD41480
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5ya4e-bAiPJ for <buildroot@buildroot.org>;
 Thu,  8 May 2025 17:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2E7A4147F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2E7A4147F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2E7A4147F
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:55:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 084E443B30;
 Thu,  8 May 2025 17:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  8 May 2025 19:55:29 +0200
Message-ID: <20250508175530.90432-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledtgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeeivdfhveeitefgtefhgfeihfejveefffdthfdtvdffueeileduheefgeeugfenucfkphepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegpdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746726932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YsaYPcAoT5McDk+Rwezjv+1hT/PTwhh5oT9IctNJqXQ=;
 b=RmssGEeDNO43fZhS2OuGjYErZ+WB6i78qubRXbJlVVaDZFFjag4xBrgxoo0mtzBbYB9w0T
 UTAXFpHBMMORVMdZT6tBOcciWMl+1VGW/eN6hqZIY3IA+PzeIqcndTHt2EPca+mVyF4GSD
 tE9j+dT4miSb1g0zSk44WSCf5CuSBDzj6l4OqcEC9kQMou2qGMioqeIqn5jKpyTzyFwD27
 VWouQETD0htyE75c1Xs8NOLJeeNb49/B+WP2hqAeKKQshAzrqWLNwmAO5muYTbjYWYk6ri
 CU3Mx76SeLqfAPu2GgxDLN8n2xy61Hfzbs983MQstPHOkQDcGKSb08ot+k5yLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RmssGEeD
Subject: [Buildroot] [PATCH] package/gdb: add patch to fix GCC 15.x build
 issue with ARC-specific gdb
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the same patch that was already added to GDB 14.x,
15.x and 16.x to fix a GCC 15.x build issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/gdb/arc-2023.09-release/0001-readline-tcap.h-Update-definitions-for-C23.patch

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
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
