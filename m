Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D65C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A2181CE9;
	Sun, 27 Feb 2022 19:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rygGDsnIxI29; Sun, 27 Feb 2022 19:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E94C78132F;
	Sun, 27 Feb 2022 19:47:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 792A61BF97C
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65CB1817E4
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSRsB_S-_jIc for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:45:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ACDD81770
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:45:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 21FFE83611; Sun, 27 Feb 2022 19:37:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 20:33:22 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b5db0f1921c6bd722e8ad0e66b050bedab7167c9
X-Git-Newrev: 757a02e0498f349f9bb5bd1be274c9599418c402
X-Patchwork-Hint: ignore
Message-Id: <20220227193728.21FFE83611@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/util-linux: fix
 libuuid build
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

commit: https://git.buildroot.net/buildroot/commit/?id=757a02e0498f349f9bb5bd1be274c9599418c402
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following build failure raised since bump to version 2.37.2 in
commit 27a46793b1a0c6c13c00b07d07bd5743e2c9c7b6 and
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=33b09aebf505acfbbb2137319093fbb9ed7eea7d

libuuid/src/unparse.c:42:73: error: expected ';', ',' or ')' before 'fmt'
 static void uuid_fmt(const uuid_t uuid, char *buf, char const *restrict fmt)
                                                                         ^

Fixes:
 - http://autobuild.buildroot.org/results/b931a34a47e5faf8ae48fce079747dea0db2563a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: use symlink for util-linux-libs patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1b4fc24d656e157b03bd9ef844320ea99494bafe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...uid-include-c-h-to-cover-restrict-keyword.patch | 30 ++++++++++++++++++++++
 ...uid-include-c-h-to-cover-restrict-keyword.patch |  1 +
 2 files changed, 31 insertions(+)

diff --git a/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch b/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
new file mode 100644
index 0000000000..3b4f510920
--- /dev/null
+++ b/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
@@ -0,0 +1,30 @@
+From 5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 5 Aug 2021 09:46:21 +0200
+Subject: libuuid: include c.h to cover restrict keyword
+
+References: https://github.com/karelzak/util-linux/issues/1405
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libuuid/src/unparse.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libuuid/src/unparse.c b/libuuid/src/unparse.c
+index f9a5e4315..ffeed2ed6 100644
+--- a/libuuid/src/unparse.c
++++ b/libuuid/src/unparse.c
+@@ -33,6 +33,7 @@
+  */
+ 
+ #include <stdio.h>
++#include "c.h"
+ 
+ #include "uuidP.h"
+ 
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch b/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
new file mode 120000
index 0000000000..beecc3a48f
--- /dev/null
+++ b/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
@@ -0,0 +1 @@
+../0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
