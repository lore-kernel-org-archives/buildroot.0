Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC88C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 108E040327;
	Mon, 22 Jul 2024 08:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0XIw_QGnLyt; Mon, 22 Jul 2024 08:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E955E40294
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E955E40294;
	Mon, 22 Jul 2024 08:05:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 231661BF291
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BC624036E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqTJOc8Wco8j for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C1C40320
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08C1C40320
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 002AC86FC0; Mon, 22 Jul 2024 08:05:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 09:44:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5510d2890fc628bf08805f83e3430d759c15a8ec
X-Git-Newrev: a1bd5b31f255a8864a53a54de22a3b07fe799931
X-Patchwork-Hint: ignore
Message-Id: <20240722080537.002AC86FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vorbis-tools: fix build with gcc
 >= 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1bd5b31f255a8864a53a54de22a3b07fe799931
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 14:

codec_skeleton.c: In function 'skeleton_process_fisbone_message_header':
codec_skeleton.c:119:9: error: implicit declaration of function 'utf8_decode' [-Wimplicit-function-declaration]
  119 |     if (utf8_decode(header, &decoded) < 0) {
      |         ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../vorbis-tools/0001-fix-build-with-gcc-14.patch  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/vorbis-tools/0001-fix-build-with-gcc-14.patch b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..a05ce8a584
--- /dev/null
+++ b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
@@ -0,0 +1,51 @@
+From f4a31fe975ea37537f39ace4420aee893b7e0b1a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Jul 2024 21:57:38 +0200
+Subject: [PATCH] fix build with gcc >= 14
+
+Add missing includes to avoid the following build failure with gcc >=
+14:
+
+codec_skeleton.c: In function 'skeleton_process_fisbone_message_header':
+codec_skeleton.c:119:9: error: implicit declaration of function 'utf8_decode' [-Wimplicit-function-declaration]
+  119 |     if (utf8_decode(header, &decoded) < 0) {
+      |         ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/xiph/vorbis-tools/pull/48
+---
+ ogginfo/codec_skeleton.c | 2 ++
+ share/utf8.c             | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/ogginfo/codec_skeleton.c b/ogginfo/codec_skeleton.c
+index a27f8da..f906f8c 100644
+--- a/ogginfo/codec_skeleton.c
++++ b/ogginfo/codec_skeleton.c
+@@ -28,6 +28,8 @@
+ 
+ #include "private.h"
+ 
++#include "utf8.h"
++
+ typedef struct {
+     bool supported;
+     uint16_t version_major;
+diff --git a/share/utf8.c b/share/utf8.c
+index be378d1..e819b67 100644
+--- a/share/utf8.c
++++ b/share/utf8.c
+@@ -28,6 +28,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
++#include "charset.h"
+ #include "utf8.h"
+ 
+ 
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
