Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E69EC021B3
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 20:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC05460BB7;
	Sun, 23 Feb 2025 20:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6mIqFvYLPV8; Sun, 23 Feb 2025 20:27:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E157660BBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E157660BBB;
	Sun, 23 Feb 2025 20:27:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 686FAB88
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58AB960BBB
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZmjTKVshTaz for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 20:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A52360BB7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A52360BB7
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:27:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4519287A3D; Sun, 23 Feb 2025 20:27:13 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Feb 2025 21:17:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fefb6a6785ccc7fd2818158ba443bbce80628364
X-Git-Newrev: ac83fdcb29f64af79839bb8efffbaae71f0cc3cc
X-Patchwork-Hint: ignore
Message-Id: <20250223202713.4519287A3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/foot: support soft-float
 architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac83fdcb29f64af79839bb8efffbaae71f0cc3cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Architecture using soft float don't support the math FE_* exceptions.
This commit adds a patch to conditionnally build the FE_* exception
handling.

Fixes:
    https://autobuild.buildroot.org/results/88d/88d764dd12bdbdbe633ebc703c461ebe95b75693/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...wings-handle-architecture-with-soft-float.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch b/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
new file mode 100644
index 0000000000..1120fa44c1
--- /dev/null
+++ b/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
@@ -0,0 +1,42 @@
+From 9443ac7e2937bb4f26cf44c73bb8150860c5df45 Mon Sep 17 00:00:00 2001
+From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+Date: Tue, 4 Feb 2025 09:48:13 +0100
+Subject: [PATCH] box-drawings: handle architecture with soft-float
+
+Currently, architecture using soft-floats doesn't support instructions
+FE_INVALID, FE_DIVBYZERO, FE_OVERFLOW and FE_UNDERFLOW and so building
+on those architectures results with a build error.
+As the sqrt math function should set errno to EDOM if an error occurs,
+fetestexcept shouldn't be mandatory.
+
+This commit removes the float environment error handling.
+
+Upstream: https://codeberg.org/dnkl/foot/commit/9443ac7e2937bb4f26cf44c73bb8150860c5df45
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ box-drawing.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/box-drawing.c b/box-drawing.c
+index 1c613051..421ff54d 100644
+--- a/box-drawing.c
++++ b/box-drawing.c
+@@ -1462,14 +1462,12 @@ draw_box_drawings_light_arc(struct buf *buf, char32_t wc)
+      */
+     for (double i = y_min*16; i <= y_max*16; i++) {
+         errno = 0;
+-        feclearexcept(FE_ALL_EXCEPT);
+ 
+         double y = i / 16.;
+         double x = circle_hemisphere * sqrt(c_r2 - (y - c_y) * (y - c_y)) + c_x;
+ 
+         /* See math_error(7) */
+-        if (errno != 0 ||
+-            fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW))
++        if (errno != 0)
+         {
+             continue;
+         }
+-- 
+2.48.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
