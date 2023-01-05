Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7192C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89FC74EE4F;
	Tue, 21 Feb 2023 00:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89FC74EE4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnajT9oleUXy; Tue, 21 Feb 2023 00:13:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 334C34EE6E;
	Tue, 21 Feb 2023 00:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 334C34EE6E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A67131BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5A396F9EC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5A396F9EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9UKgUUTWxVbu for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 125E26FAA8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 125E26FAA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 105058648F; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Jan 2023 08:47:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f8a2e1dc08a4de2db903a4a5a41c8541e6abfe81
X-Git-Newrev: 14956d8908776e52ea9ace2fbb3f41716ebb4262
X-Patchwork-Hint: ignore
Message-Id: <20230220205226.105058648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/checkpolicy: drop
 bogus CHECKPOLICY_STAGING_CMDS
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

commit: https://git.buildroot.net/buildroot/commit/?id=14956d8908776e52ea9ace2fbb3f41716ebb4262
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit "b06110621d checkpolicy: allow compiling for target" contains a
typo that prevents installing to staging. It also forgot to enable
CHECKPOLICY_INSTALL_STAGING.

But the package does not install headers or libraries, only ELF and
manual files.
So instead of fixing the install to staging, drop the bogus
CHECKPOLICY_STAGING_CMDS.

Cc: Clayton Shotwell <clayton.shotwell@collins.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/checkpolicy/checkpolicy.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index af9a58cee8..baf16fb802 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -20,11 +20,6 @@ define CHECKPOLICY_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
 endef
 
-define CHECKPOLICY_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
-
-endef
-
 define CHECKPOLICY_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
