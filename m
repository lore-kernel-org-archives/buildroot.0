Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9515C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 834DE818B5;
	Sun, 12 Dec 2021 12:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8X4eInwezfy; Sun, 12 Dec 2021 12:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC34F80F04;
	Sun, 12 Dec 2021 12:23:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4B31BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FA7541E40
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UVfP6POq5d1s for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69E2C42059
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C4A2882B70; Sun, 12 Dec 2021 12:17:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca2753fd47d47e5ad0eec16ea62f7b7f096331b6
X-Git-Newrev: 38c5068d10787addd5aea6f532b6abe825fe5e3d
X-Patchwork-Hint: ignore
Message-Id: <20211212121714.C4A2882B70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-trident:
 fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=38c5068d10787addd5aea6f532b6abe825fe5e3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of xserver_xorg-server
to version 21.1.1 in commit d9185c6ba38430a017ed996c4180e141881ba570:

In file included from trident_bank.c:37:
trident.h:41:10: fatal error: xf86RamDac.h: No such file or directory
   41 | #include "xf86RamDac.h"
      |          ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c81ac8075af257e8626d9d097270be7a7b4a1496

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Remove-ramdac.patch                       | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch b/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch
new file mode 100644
index 0000000000..38ca9afebf
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch
@@ -0,0 +1,56 @@
+From 07a5c4732f1c28ffcb873ee04500e3cb813c50b4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 7 Dec 2021 22:28:04 +0100
+Subject: [PATCH] Remove ramdac
+
+ramdac drivers have been removed from xserver since version 21.0.99.1
+and
+https://gitlab.freedesktop.org/xorg/xserver/-/commit/f0385fb420158ac3bc1c4c325431ffc5c62344bb
+resulting in the following build failure:
+
+In file included from trident_bank.c:37:
+trident.h:41:10: fatal error: xf86RamDac.h: No such file or directory
+   41 | #include "xf86RamDac.h"
+      |          ^~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c81ac8075af257e8626d9d097270be7a7b4a1496
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/xorg/driver/xf86-video-trident/-/merge_requests/1]
+---
+ src/trident.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/trident.h b/src/trident.h
+index 5cadf52..c82de4c 100644
+--- a/src/trident.h
++++ b/src/trident.h
+@@ -38,7 +38,6 @@
+ #include "xaa.h"
+ #endif
+ #include "xf86fbman.h"
+-#include "xf86RamDac.h"
+ #include "compiler.h"
+ #include "vgaHW.h"
+ #include "xf86i2c.h"
+@@ -103,7 +102,6 @@ typedef struct {
+     int			useEXA;
+     int			Chipset;
+     int			DACtype;
+-    int			RamDac;
+     int                 ChipRev;
+     int			HwBpp;
+     int			BppShift;
+@@ -169,7 +167,6 @@ typedef struct {
+     CARD32		BltScanDirection;
+     CARD32		DrawFlag;
+     CARD16		LinePattern;
+-    RamDacRecPtr	RamDacRec;
+     int			CursorOffset;
+     xf86CursorInfoPtr	CursorInfoRec;
+     xf86Int10InfoPtr	Int10;
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
