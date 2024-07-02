Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A391C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18E7B80DBF;
	Tue,  2 Jul 2024 07:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCj07ASXB5JO; Tue,  2 Jul 2024 07:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0726F8101C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0726F8101C;
	Tue,  2 Jul 2024 07:59:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13B551BF31C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F223A80C5F
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFMIMFG7ZNKr for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 118DC80C5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 118DC80C5A
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F30B983ACC; Tue,  2 Jul 2024 07:59:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 09:54:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e987d16478a87f9a7cd0c376b977459b28661486
X-Git-Newrev: 93a52a7410292148eda9e1dc6e700f3b0032fb76
X-Patchwork-Hint: ignore
Message-Id: <20240702075919.F30B983ACC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: update the patches to be
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=93a52a7410292148eda9e1dc6e700f3b0032fb76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, freerdp fails to build with output:

    Applying 0001-Fix-variable-declaration-in-loop.patch using patch:
    patching file client/X11/xf_graphics.c
    Hunk #1 FAILED at 386.
    Hunk #2 succeeded at 456 (offset 61 lines).
    1 out of 2 hunks FAILED -- saving rejects to file client/X11/xf_graphics.c.rej

    Applying 0002-Fixed-variable-declaration-in-loop.patch using patch:
    patching file client/X11/xf_graphics.c
    Hunk #1 succeeded at 246 (offset 6 lines).
    Hunk #2 FAILED at 255.
    1 out of 2 hunks FAILED -- saving rejects to file client/X11/xf_graphics.c.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../freerdp/0001-Fix-variable-declaration-in-loop.patch | 17 +++++++++++------
 .../0002-Fixed-variable-declaration-in-loop.patch       | 17 +++++++++++------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
index 799a92734b..ec1795364a 100644
--- a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
+++ b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
@@ -1,27 +1,29 @@
-From ddde652460350b962d32036981ff8ed77ed2f1ed Mon Sep 17 00:00:00 2001
+From 48f25939f4a48b01072f3cd2ece1e36a41c0ad44 Mon Sep 17 00:00:00 2001
 From: Armin Novak <armin.novak@thincast.com>
 Date: Wed, 16 Sep 2020 09:30:37 +0200
 Subject: [PATCH] Fix variable declaration in loop
 
 Upstream: https://github.com/FreeRDP/FreeRDP/commit/ddde652460350b962d32036981ff8ed77ed2f1ed
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  client/X11/xf_graphics.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
-index 76fbef5bd6..bf71b563c3 100644
+index 5aa1fd48b5a3..c8f24362aec7 100644
 --- a/client/X11/xf_graphics.c
 +++ b/client/X11/xf_graphics.c
-@@ -386,6 +386,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rdpPointer* pointer)
- static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
- {
+@@ -447,6 +447,7 @@ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
+ 	WLog_DBG(TAG, "%s: %p", __func__, pointer);
+ 
  #ifdef WITH_XCURSOR
 +	UINT32 i;
  	xfContext* xfc = (xfContext*)context;
  	xfPointer* xpointer = (xfPointer*)pointer;
  
-@@ -395,7 +396,7 @@ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
+@@ -456,7 +457,7 @@ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
  	free(xpointer->cursorWidths);
  	free(xpointer->cursorHeights);
  
@@ -30,3 +32,6 @@ index 76fbef5bd6..bf71b563c3 100644
  	{
  		XFreeCursor(xfc->display, xpointer->cursors[i]);
  	}
+-- 
+2.43.0
+
diff --git a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
index 1a4e899430..838844d635 100644
--- a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
+++ b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
@@ -1,19 +1,21 @@
-From 4f8a48d96e472e43a5f856c449f61669792ce9fa Mon Sep 17 00:00:00 2001
+From b0b856590b523869358875594841f3e6c2919569 Mon Sep 17 00:00:00 2001
 From: akallabeth <akallabeth@posteo.net>
 Date: Tue, 22 Sep 2020 07:43:56 +0200
 Subject: [PATCH] Fixed variable declaration in loop
 
 Upstream: https://github.com/FreeRDP/FreeRDP/commit/4f8a48d96e472e43a5f856c449f61669792ce9fa
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  client/X11/xf_graphics.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
-index bf71b563c3..c50726c8e4 100644
+index c8f24362aec7..c8b604cc6ad4 100644
 --- a/client/X11/xf_graphics.c
 +++ b/client/X11/xf_graphics.c
-@@ -240,7 +240,7 @@ static BOOL _xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpP
+@@ -246,7 +246,7 @@ static BOOL xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpPo
  	double xscale;
  	double yscale;
  	size_t size;
@@ -22,12 +24,15 @@ index bf71b563c3..c50726c8e4 100644
  
  	if (!context || !pointer || !context->gdi)
  		return FALSE;
-@@ -255,7 +255,7 @@ static BOOL _xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpP
- 	xTargetSize = pointer->width * xscale;
- 	yTargetSize = pointer->height * yscale;
+@@ -264,7 +264,7 @@ static BOOL xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpPo
+ 	WLog_DBG(TAG, "%s: scaled: %" PRIu32 "x%" PRIu32 ", desktop: %" PRIu32 "x%" PRIu32, __func__,
+ 	         xfc->scaledWidth, xfc->savedHeight, settings->DesktopWidth, settings->DesktopHeight);
  
 -	for (int i = 0; i < xpointer->nCursors; i++)
 +	for (i = 0; i < xpointer->nCursors; i++)
  	{
  		if (xpointer->cursorWidths[i] == xTargetSize && xpointer->cursorHeights[i] == yTargetSize)
  		{
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
