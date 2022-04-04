Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C765EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71E6240A02;
	Mon,  4 Apr 2022 20:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4PuzB-hfJkq; Mon,  4 Apr 2022 20:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6FD0414C4;
	Mon,  4 Apr 2022 20:20:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35F4D1BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFB9840393
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 34Ad_It_DV1T for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:19:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E160640327
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:19:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 308AC82DF6; Mon,  4 Apr 2022 20:09:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:47:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee978e853a6a4c9bb5ed661c1ae704e79f155a35
X-Git-Newrev: 04e26cb7feb8681a07e72c96550972e9d938d1b2
X-Patchwork-Hint: ignore
Message-Id: <20220404200948.308AC82DF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: Backport patch to fix
 linking on powerpc
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

commit: https://git.buildroot.net/buildroot/commit/?id=04e26cb7feb8681a07e72c96550972e9d938d1b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 192dfc68c0e4 ("package/zlib-ng: fix build on powerpc") turned the
Power8 optimisations off to fix a build issue. Instead apply a patch
from the develop branch upstream to fix the issue.

This patch is not yet in a released version of zlib-ng.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...keyword-for-vec_sumsu-to-prevent-undefine.patch | 27 ++++++++++++++++++++++
 package/zlib-ng/zlib-ng.mk                         |  6 -----
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch b/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch
new file mode 100644
index 0000000000..cc103215de
--- /dev/null
+++ b/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch
@@ -0,0 +1,27 @@
+From 677f56825f7080403e18e57ffe8177f3df290f20 Mon Sep 17 00:00:00 2001
+From: Nathan Moinvaziri <nathan@nathanm.com>
+Date: Sun, 23 Jan 2022 12:59:01 -0800
+Subject: [PATCH] Use static keyword for vec_sumsu to prevent undefined
+ reference error when g++ linking.
+
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ arch/power/adler32_power8.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/power/adler32_power8.c b/arch/power/adler32_power8.c
+index 029aa3a84c57..fc4086322efc 100644
+--- a/arch/power/adler32_power8.c
++++ b/arch/power/adler32_power8.c
+@@ -44,7 +44,7 @@
+ #include "adler32_p.h"
+ 
+ /* Vector across sum unsigned int (saturate).  */
+-inline vector unsigned int vec_sumsu(vector unsigned int __a, vector unsigned int __b) {
++static inline vector unsigned int vec_sumsu(vector unsigned int __a, vector unsigned int __b) {
+     __b = vec_sld(__a, __a, 8);
+     __b = vec_add(__b, __a);
+     __a = vec_sld(__b, __b, 4);
+-- 
+2.35.1
+
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 938acd4181..fb497b8c11 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -23,10 +23,4 @@ ifeq ($(BR2_arm),y)
 ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
 endif
 
-ifeq ($(BR2_powerpc_power8),y)
-ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
-else
-ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
-endif
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
