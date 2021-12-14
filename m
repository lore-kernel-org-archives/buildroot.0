Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB91C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C5A5409E3;
	Tue, 14 Dec 2021 20:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SAHEKy4iSQV; Tue, 14 Dec 2021 20:12:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF264409AA;
	Tue, 14 Dec 2021 20:12:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B2B61BF9B4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C260A60D5F
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YW2GXT0pIfvf for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 022A260C2D
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0CCEF81EB3; Tue, 14 Dec 2021 20:05:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:56:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: caa5a7ea073e71de3fa33a5cb8b6d46d69d4876c
X-Git-Newrev: 303f3e95d31440b401f95ca469ca8b110936f2be
X-Patchwork-Hint: ignore
Message-Id: <20211214200520.0CCEF81EB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xdriver_xf86-video-fbturbo: fix
 struct _Window::backStorage related compile failure
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
Content-Type: multipart/mixed; boundary="===============2134011794143320337=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2134011794143320337==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=303f3e95d31440b401f95ca469ca8b110936f2be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to fix struct _Window::backStorage related compile failure.

Since xserver commit 'dix: Remove WindowRec::backStorage ' ([1])
struct _Window::backStorage is gone, use struct _Window::backingStore instead.

Fixes:

  backing_store_tuner.c: In function 'xPostValidateTree':
  backing_store_tuner.c:112:48: error: 'struct _Window' has no member named 'backStorage'
    112 |     if (!private->ForceBackingStore && focusWin->backStorage) {
        |                                                ^~
  backing_store_tuner.c:128:20: error: 'struct _Window' has no member named 'backStorage'
    128 |         if (!curWin->backStorage && (private->ForceBackingStore ||
        |                    ^~
  backing_store_tuner.c: In function 'xReparentWindow':
  backing_store_tuner.c:161:46: error: 'struct _Window' has no member named 'backStorage'
    161 |     if (pPriorParent == pScreen->root && pWin->backStorage) {
        |                                              ^~

[1] https://gitlab.freedesktop.org/xorg/xserver/-/commit/6975807945d12c07f00e18df7fafeff43efa0267

Reported-by: Jürgen Wack <juergen.wack@gmx.de>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...re_tuner-struct-_Window-backStorage-is-go.patch | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/0005-backing_store_tuner-struct-_Window-backStorage-is-go.patch b/package/x11r7/xdriver_xf86-video-fbturbo/0005-backing_store_tuner-struct-_Window-backStorage-is-go.patch
new file mode 100644
index 0000000000..097868ea25
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/0005-backing_store_tuner-struct-_Window-backStorage-is-go.patch
@@ -0,0 +1,65 @@
+From 93631c1f68678bf3e860b1bbc6192c8b6ac4c563 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 13 Dec 2021 19:55:08 +0100
+Subject: [PATCH] backing_store_tuner: struct _Window::backStorage is gone
+
+Fix struct _Window::backStorage related compile failure.
+
+Since xserver commit 'dix: Remove WindowRec::backStorage ' ([1])
+struct _Window::backStorage is gone, use struct _Window::backingStore instead.
+
+Fixes:
+
+  backing_store_tuner.c: In function 'xPostValidateTree':
+  backing_store_tuner.c:112:48: error: 'struct _Window' has no member named 'backStorage'
+    112 |     if (!private->ForceBackingStore && focusWin->backStorage) {
+        |                                                ^~
+  backing_store_tuner.c:128:20: error: 'struct _Window' has no member named 'backStorage'
+    128 |         if (!curWin->backStorage && (private->ForceBackingStore ||
+        |                    ^~
+  backing_store_tuner.c: In function 'xReparentWindow':
+  backing_store_tuner.c:161:46: error: 'struct _Window' has no member named 'backStorage'
+    161 |     if (pPriorParent == pScreen->root && pWin->backStorage) {
+        |                                              ^~
+
+[1] https://gitlab.freedesktop.org/xorg/xserver/-/commit/6975807945d12c07f00e18df7fafeff43efa0267
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/backing_store_tuner.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/backing_store_tuner.c b/src/backing_store_tuner.c
+index 067c05f..13f7ec3 100644
+--- a/src/backing_store_tuner.c
++++ b/src/backing_store_tuner.c
+@@ -109,7 +109,7 @@ xPostValidateTree(WindowPtr pWin, WindowPtr pLayerWin, VTKind kind)
+     private->PostValidateTreeNestingLevel++;
+ 
+     /* Disable backing store for the focus window */
+-    if (!private->ForceBackingStore && focusWin->backStorage) {
++    if (!private->ForceBackingStore && (focusWin->backingStore != NotUseful)) {
+         DebugMsg("Disable backing store for the focus window 0x%x\n",
+                  (unsigned int)focusWin->drawable.id);
+         pScreen->backingStoreSupport = Always;
+@@ -125,7 +125,7 @@ xPostValidateTree(WindowPtr pWin, WindowPtr pLayerWin, VTKind kind)
+     /* And enable backing store for all the other children of root */
+     curWin = pScreen->root->firstChild;
+     while (curWin) {
+-        if (!curWin->backStorage && (private->ForceBackingStore ||
++        if ((curWin->backingStore == NotUseful) && (private->ForceBackingStore ||
+                                      curWin != focusWin)) {
+             DebugMsg("Enable backing store for window 0x%x\n",
+                      (unsigned int)curWin->drawable.id);
+@@ -158,7 +158,7 @@ xReparentWindow(WindowPtr pWin, WindowPtr pPriorParent)
+     }
+ 
+     /* We only want backing store set for direct children of root */
+-    if (pPriorParent == pScreen->root && pWin->backStorage) {
++    if (pPriorParent == pScreen->root && (pWin->backingStore != NotUseful)) {
+         DebugMsg("Reparent window 0x%x from root, disabling backing store\n",
+                  (unsigned int)pWin->drawable.id);
+         pScreen->backingStoreSupport = Always;
+-- 
+2.34.1
+

--===============2134011794143320337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2134011794143320337==--
