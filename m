Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCC1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9865D4113B;
	Thu, 21 Apr 2022 21:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpwQZuEuKVhp; Thu, 21 Apr 2022 21:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A14B34106F;
	Thu, 21 Apr 2022 21:02:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9365B1C1189
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EF5D60FA7
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PormBDTdCFP for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC63460FA3
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A081184104; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:32:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b87bc7d3ad82f637bb8c9a00a1c433ab9135555c
X-Git-Newrev: 530c72ad7559e0bdafa86eb81dc1ff2444238e2c
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.A081184104@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnspr: fix build failure on mips
 with musl libc
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

commit: https://git.buildroot.net/buildroot/commit/?id=530c72ad7559e0bdafa86eb81dc1ff2444238e2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch that uses Linux <asm/sgidefs.h> instead of libc <sgidefs.h> since
musl doesn't provide it.

Patch is pending upstream here:
https://bugzilla.mozilla.org/show_bug.cgi?id=1765100

Fixes:
http://autobuild.buildroot.net/results/61743bf5ad9ddc69786ae854ed4ab58c59f64dd0/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...1-Bug-1765100-fix-build-on-mips-musl-libc.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch b/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch
new file mode 100644
index 0000000000..10bf74130c
--- /dev/null
+++ b/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch
@@ -0,0 +1,33 @@
+From 00e5b818f2d9f3264107801fc2fcff33a9355a78 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 17 Apr 2022 23:55:26 +0200
+Subject: [PATCH] Bug 1765100 - fix build on mips+musl libc
+
+This patch fix build failure on mips with musl libc by using Linux
+<asm/sgidefs.h> instead of the one provided by libc since musl doesn't
+provide <sgidefs.h>.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+This patch is pending upstream:
+https://bugzilla.mozilla.org/show_bug.cgi?id=1765100
+---
+ nspr/pr/include/md/_linux.cfg | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nspr/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
+index 23b160fd..dbc0d40e 100644
+--- a/nspr/pr/include/md/_linux.cfg
++++ b/nspr/pr/include/md/_linux.cfg
+@@ -499,7 +499,7 @@
+ #elif defined(__mips__)
+ 
+ /* For _ABI64 */
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ 
+ #ifdef __MIPSEB__
+ #define IS_BIG_ENDIAN 1
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
