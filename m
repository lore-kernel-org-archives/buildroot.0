Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2065CC3DA6D
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8540811B1;
	Sun, 18 May 2025 14:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lmc0QnlWOoD4; Sun, 18 May 2025 14:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7AA281150
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7AA281150;
	Sun, 18 May 2025 14:47:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7D7DDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE75560D73
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRxL3tMYOrht for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:47:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E63136064D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E63136064D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA3E184AD1; Sun, 18 May 2025 14:47:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:43:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2bed8a0c21ff2a7c04db8b777200bfe413c628fe
X-Git-Newrev: 0e932eb6b5fa836a8d2ab66caced592503ddd2fd
X-Patchwork-Hint: ignore
Message-Id: <20250518144709.DA3E184AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/f2fs-tools: fix
 GCC 15 build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0e932eb6b5fa836a8d2ab66caced592503ddd2fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

f2fs-tools had its own "bool" typedef which now conflicts with the C23
keyword, causing build failures on GCC 15.

Import a patch from upstream that fixes this.

Fixes: https://autobuild.buildroot.org/results/d17641582d1beaec9dcca4dc48a68d713cecfdc8 (and others)
Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 598dfb7c1a10acad39d6d6aa943f3524f8dfbd3b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-f2fs-tools-use-stdbool.h-instead-of-bool.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/f2fs-tools/0002-f2fs-tools-use-stdbool.h-instead-of-bool.patch b/package/f2fs-tools/0002-f2fs-tools-use-stdbool.h-instead-of-bool.patch
new file mode 100644
index 0000000000..90dfdc209a
--- /dev/null
+++ b/package/f2fs-tools/0002-f2fs-tools-use-stdbool.h-instead-of-bool.patch
@@ -0,0 +1,41 @@
+From ec0f9d07792298f89e71cee1e692ad60bf6b8d5c Mon Sep 17 00:00:00 2001
+From: Jaegeuk Kim <jaegeuk@kernel.org>
+Date: Thu, 24 Oct 2024 20:33:38 +0000
+Subject: [PATCH] f2fs-tools: use stdbool.h instead of bool
+
+The existing bool definition is broken for c23, where bool is now a keyword.
+
+Signed-off-by: Elliott Hughes <enh@google.com>
+Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=6617d15a660becc23825007ab3fc2d270b5b250f
+[Florian: rebased to 1.16.0]
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ include/f2fs_fs.h | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
+index f890634..a968380 100644
+--- a/include/f2fs_fs.h
++++ b/include/f2fs_fs.h
+@@ -26,6 +26,7 @@
+ #include <stddef.h>
+ #include <string.h>
+ #include <time.h>
++#include <stdbool.h>
+ 
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+@@ -103,9 +104,6 @@ typedef uint16_t	u16;
+ typedef uint8_t		u8;
+ typedef u32		block_t;
+ typedef u32		nid_t;
+-#ifndef bool
+-typedef u8		bool;
+-#endif
+ typedef unsigned long	pgoff_t;
+ typedef unsigned short	umode_t;
+ 
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
