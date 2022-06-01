Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98301C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 12:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38E6B4089B;
	Wed,  1 Jun 2022 12:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LrPFrcydtyvK; Wed,  1 Jun 2022 12:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E214088E;
	Wed,  1 Jun 2022 12:43:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1EA11BF591
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0A1482B2F
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kR9aCKIKRdzh for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 12:43:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3104882B24
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 12:43:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 76624868A8; Wed,  1 Jun 2022 12:32:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 14:43:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea79360907ffd8fff11828a0fbda213979b15247
X-Git-Newrev: 1917fe29839c79f92e0a1e307768356c0076b62b
X-Patchwork-Hint: ignore
Message-Id: <20220601123208.76624868A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: sh4{eb, a,
 aeb} are affected by GCC bug 101737
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1917fe29839c79f92e0a1e307768356c0076b62b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pixman fails to build with BR2_OPTIMIZE_S on sh4{eb,a,aeb}:

In file included from pixman-fast-path.c:33:
pixman-fast-path.c: In function 'fast_composite_scaled_nearest_8888_565_normal_OVER':
pixman-inlines.h:586:1: internal compiler error: Segmentation fault
  586 | }
      | ^

Since all SuperH variants are affected, use BR2_sh instead of BR2_sh4.

Fixes:
 - http://autobuild.buildroot.org/results/c9d35d5975311a191dfbe12291398503987e804e
 - http://autobuild.buildroot.org/results/d34b8672f6211d60af4122bdd94fa8c2f4f4bf6a
 - http://autobuild.buildroot.org/results/933c4a2e73c987573ecc97172f442b78199462d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 73ea78624a..ea59ca2960 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -199,7 +199,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 # still exists in gcc = 11.1.0
 config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
 	bool
-	default y if BR2_sh4
+	default y if BR2_sh
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
 # ICE: in extract_insn, at recog.c:2294 on microblaze.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
