Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C533EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 14:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C28613FB;
	Tue,  7 Jun 2022 14:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0x98ndKngPlu; Tue,  7 Jun 2022 14:07:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9665E613F8;
	Tue,  7 Jun 2022 14:07:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5597B1BF397
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5335A4249D
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diy0WZtTySDQ for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 14:05:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A999441C28
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 14:05:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1AA1686ABC; Tue,  7 Jun 2022 13:54:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 15:57:01 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2a1e735a39f89c08dc6e293906c95740e3a320c0
X-Git-Newrev: d36366cb36fef4706d2f85de3be35243b5fc977c
X-Patchwork-Hint: ignore
Message-Id: <20220607135403.1AA1686ABC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] toolchain/Config.in:
 sh4{eb, a, aeb} are affected by GCC bug 101737
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

commit: https://git.buildroot.net/buildroot/commit/?id=d36366cb36fef4706d2f85de3be35243b5fc977c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 1917fe29839c79f92e0a1e307768356c0076b62b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index d2c81217c8..0e9b2503c1 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -197,7 +197,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
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
