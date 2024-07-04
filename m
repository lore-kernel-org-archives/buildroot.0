Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EE7C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 09:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15BCC413DC;
	Thu,  4 Jul 2024 09:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esQ2WGLM9pER; Thu,  4 Jul 2024 09:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F103B413DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F103B413DA;
	Thu,  4 Jul 2024 09:46:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC4E01BF319
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 09:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4D0840B94
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 09:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9b7xF8D3EVX for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 09:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3CA2F40151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CA2F40151
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CA2F40151
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 09:46:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 648BDB00579;
 Thu,  4 Jul 2024 11:45:58 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 11:45:49 +0200
Message-ID: <20240704094549.378433-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720086361;
 bh=pACa6sAjbtnxNJzgILYEuj9yYgRr9RonSRHq0jjuYKc=;
 h=From:To:Cc:Subject:Date:From;
 b=Hl2GTOBjIzFrHZPcfXjAiQY+fINDt70V2emhayWzesFmv4Z6TCrlPbU/jGDhbJk7J
 LYQ4P56gNq3k3aPbu2297xrnPuaChRGylB11hd+Day8q11rChew6I4YG2lXBox1xtB
 gWAZ8ywYCHHnNkMMzYcaH10WdLkB5yZnO1GMCrvfJ1TOgoOlPgka4Oxz/fUjzr5FnU
 I/aUi5Gjs2zjQBmPsQVBXf4yjquRRbao2xggO4asGHeNL8y8+GGXDanhBHwkoTezEo
 nhl5uYqjeLo1+pbjrfklVYRuy33L4u0HJpATdtZi7oSMpnXplQZEzBG1MTthGfJd2q
 GI3KkeYv4UbCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Hl2GTOBj
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: update the patches to be
 applied with fuzz 0
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, rdesktop fails to build with output:

    Applying 0001-8bit-colors.patch using patch:
    patching file xwin.c
    Hunk #1 succeeded at 1801 (offset 340 lines).
    Hunk #2 FAILED at 1568.
    1 out of 2 hunks FAILED -- saving rejects to file xwin.c.rej

This commit refreshes the package patches on the current package
version. The original patch was not generated with "git format-patch",
and had no information (no commit log, no author, no date, ...). Since
it was introduced in commit [1], the author and date is set to this
commit. The "Upstream:" tag is also added to the patch, mentioning
the upstream project is reported as unmaintained on its homepage (at
the time of this commit). Finally, the ".checkpackageignore" entry is
removed, since it is no longer needed.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/e2dde9c7cdc2f9ed851acfb7daa858ffa1744246

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                           |  1 -
 package/rdesktop/0001-8bit-colors.patch       | 21 ----------
 .../rdesktop/0001-Allow-8-bit-colors.patch    | 38 +++++++++++++++++++
 3 files changed, 38 insertions(+), 22 deletions(-)
 delete mode 100644 package/rdesktop/0001-8bit-colors.patch
 create mode 100644 package/rdesktop/0001-Allow-8-bit-colors.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a1d2627455..9f4f7e299a7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1293,7 +1293,6 @@ package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch lib_pat
 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch lib_patch.Upstream
 package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch lib_patch.Upstream
 package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch lib_patch.Upstream
-package/rdesktop/0001-8bit-colors.patch lib_patch.Sob lib_patch.Upstream
 package/read-edid/0001-Fix-install-file-list.patch lib_patch.Upstream
 package/read-edid/0002-Fix-compiler-check.patch lib_patch.Upstream
 package/read-edid/0003-fix-build-with-gcc-10.patch lib_patch.Upstream
diff --git a/package/rdesktop/0001-8bit-colors.patch b/package/rdesktop/0001-8bit-colors.patch
deleted file mode 100644
index 710f8debef2..00000000000
--- a/package/rdesktop/0001-8bit-colors.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -urpN rdesktop-1.5.0-orig/xwin.c rdesktop-1.5.0/xwin.c
---- rdesktop-1.5.0-orig/xwin.c	2007-01-17 12:01:18.000000000 +0100
-+++ rdesktop-1.5.0/xwin.c	2007-01-17 12:05:02.000000000 +0100
-@@ -1461,7 +1461,7 @@ select_visual(int screen_num)
- 		}
- 
- 		/* we use a colourmap, so the default visual should do */
--		g_owncolmap = True;
-+//		g_owncolmap = True;
- 		g_visual = vmatches[0].visual;
- 		g_depth = vmatches[0].depth;
- 	}
-@@ -1568,7 +1568,7 @@ ui_init(void)
- 	{
- 		g_xcolmap =
- 			XCreateColormap(g_display, RootWindowOfScreen(g_screen), g_visual,
--					AllocNone);
-+					(g_depth <= 8) ? AllocAll : AllocNone);
- 		if (g_depth <= 8)
- 			warning("Display colour depth is %d bit: you may want to use -C for a private colourmap.\n", g_depth);
- 	}
diff --git a/package/rdesktop/0001-Allow-8-bit-colors.patch b/package/rdesktop/0001-Allow-8-bit-colors.patch
new file mode 100644
index 00000000000..0c2b820a453
--- /dev/null
+++ b/package/rdesktop/0001-Allow-8-bit-colors.patch
@@ -0,0 +1,38 @@
+From 2159684f1287b6bca2bd74c129b752a636ee807f Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Wed, 17 Jan 2007 13:58:01 +0000
+Subject: [PATCH] Allow 8-bit colors
+
+Upstream: Reported as unmaintained on homepage http://www.rdesktop.org/
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Julien: refreshed the patch to be applied with fuzz factor 0]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ xwin.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xwin.c b/xwin.c
+index d96d0f4..d11f4a6 100644
+--- a/xwin.c
++++ b/xwin.c
+@@ -1801,7 +1801,7 @@ select_visual(int screen_num)
+ 		}
+ 
+ 		/* we use a colourmap, so the default visual should do */
+-		g_owncolmap = True;
++//		g_owncolmap = True;
+ 		g_visual = vmatches[0].visual;
+ 		g_depth = vmatches[0].depth;
+ 	}
+@@ -2010,7 +2010,7 @@ ui_init(void)
+ 	{
+ 		g_xcolmap =
+ 			XCreateColormap(g_display, RootWindowOfScreen(g_screen), g_visual,
+-					AllocNone);
++					(g_depth <= 8) ? AllocAll : AllocNone);
+ 		if (g_depth <= 8)
+ 			logger(GUI, Warning,
+ 			       "Display colour depth is %d bit: you may want to use -C for a private colourmap",
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
