Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D6AC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 17:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C744400BB;
	Sun,  5 Feb 2023 17:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C744400BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zz-L3nFF0AXN; Sun,  5 Feb 2023 17:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA55340198;
	Sun,  5 Feb 2023 17:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA55340198
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 083271BF3EE
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 17:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3744416DC
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 17:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3744416DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSaA87pD0xY1 for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 17:09:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E63A7414C9
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 17:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E63A7414C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D23A2838DE; Sun,  5 Feb 2023 17:09:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 18:08:31 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 89c63ae8724354fada0894792b1bde0eb9e57759
X-Git-Newrev: 6b1a7b69abcc65517a443de986b5e249d30e9696
X-Patchwork-Hint: ignore
Message-Id: <20230205170914.D23A2838DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libgit2: link
 with -latomic if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b1a7b69abcc65517a443de986b5e249d30e9696
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

libgit2 is currently a library without any reverse dependencies so the
missing atomic symbols do not cause build failures yet.

libgit2 uses the atomics intrinsics on gcc >= 4.7 and the sync
intrinsics on previous gcc versions.  Since gcc 4.9 is the new
minimum, ignore the sync intrinsics requirements.

The next version of libgit2 will also build a binary, which will
expose the problem.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e992a3e7712f6f87fcbddb1844a5cbf51a1d82bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgit2/libgit2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 3f1e6e1593..9b5e2b897d 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -44,4 +44,9 @@ else
 LIBGIT2_CONF_OPTS += -DUSE_HTTPS=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBGIT2_CONF_OPTS += \
+	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
