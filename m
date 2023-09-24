Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DA7CE7A8F
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 735E5417B0;
	Sun, 24 Sep 2023 21:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 735E5417B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jELugPLiMh-W; Sun, 24 Sep 2023 21:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BDF841924;
	Sun, 24 Sep 2023 21:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BDF841924
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8911BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EBE681D47
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EBE681D47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ux4n15IhaD78 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E36B81D0C
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E36B81D0C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F0F684212; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 21:35:54 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 90df3c558b6a30a878197dbebd06fb4aff76412c
X-Git-Newrev: 934e95457d1126d5f8486f0d6089410923835d98
X-Patchwork-Hint: ignore
Message-Id: <20230924212150.4F0F684212@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/stress-ng: link
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

commit: https://git.buildroot.net/buildroot/commit/?id=934e95457d1126d5f8486f0d6089410923835d98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
