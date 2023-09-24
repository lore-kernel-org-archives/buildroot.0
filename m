Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC69CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B91E417E0;
	Sun, 24 Sep 2023 21:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B91E417E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AHs_RmhmNqq; Sun, 24 Sep 2023 21:22:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB8841833;
	Sun, 24 Sep 2023 21:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BB8841833
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6909B1BF947
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41CC541811
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41CC541811
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKiIZpjzmLz8 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37CB041803
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37CB041803
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2701387580; Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 21:36:08 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 4a8ac56ad3561069627df57f0884051337e2609e
X-Git-Newrev: e6140d2955fee8fbe622a6c2ddd299059509d672
X-Patchwork-Hint: ignore
Message-Id: <20230924212149.2701387580@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/stress-ng: link
 with -latomic when needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6140d2955fee8fbe622a6c2ddd299059509d672
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fix the following build failure raised since at least bump to version
0.15.04 in commit 00553ea186357fd3e2b3c89fa560e9711cc67472:

Fixes:
 - http://autobuild.buildroot.org/results/127ed4c110d99c6453a01ce221f628d40e566dc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 42f25180233df459cd2bfbc5b9ebf8b95c6b60cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/stress-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 0f204bcf79..a7b57459f1 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_PACKAGE_KEYUTILS),y)
 STRESS_NG_DEPENDENCIES += keyutils
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+STRESS_NG_MAKE_FLAGS += LDFLAGS_EXTRA=-latomic
+endif
+
 define STRESS_NG_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(STRESS_NG_MAKE_FLAGS)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
