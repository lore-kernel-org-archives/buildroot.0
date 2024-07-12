Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62C7C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7795D80B96;
	Fri, 12 Jul 2024 19:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KuEsTmkSKSDc; Fri, 12 Jul 2024 19:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34CC5810D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34CC5810D4;
	Fri, 12 Jul 2024 19:48:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 562951BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43AE1605AD
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhLRMdoOSgav for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FC5060648
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FC5060648
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:48:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 567CE86170; Fri, 12 Jul 2024 19:48:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 21:47:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ede791756a9c7a24da2d88667d813a0dc2c43ff
X-Git-Newrev: 3149532ff14c6b5d4e00e9458a39daae60b07fca
X-Patchwork-Hint: ignore
Message-Id: <20240712194841.567CE86170@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rdesktop: update the patches to be
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3149532ff14c6b5d4e00e9458a39daae60b07fca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                            |  1 -
 package/rdesktop/0001-8bit-colors.patch        | 21 --------------
 package/rdesktop/0001-Allow-8-bit-colors.patch | 38 ++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 69b8dece38..63a27410ca 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1226,7 +1226,6 @@ package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch lib_pat
 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch lib_patch.Upstream
 package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch lib_patch.Upstream
 package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch lib_patch.Upstream
-package/rdesktop/0001-8bit-colors.patch lib_patch.Sob lib_patch.Upstream
 package/read-edid/0001-Fix-install-file-list.patch lib_patch.Upstream
 package/read-edid/0002-Fix-compiler-check.patch lib_patch.Upstream
 package/read-edid/0003-fix-build-with-gcc-10.patch lib_patch.Upstream
diff --git a/package/rdesktop/0001-8bit-colors.patch b/package/rdesktop/0001-8bit-colors.patch
deleted file mode 100644
index 710f8debef..0000000000
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
index 0000000000..0c2b820a45
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
