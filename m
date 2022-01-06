Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C69C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 10:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8486382BED;
	Thu,  6 Jan 2022 10:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOyDGv9zCFBO; Thu,  6 Jan 2022 10:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D000482BE5;
	Thu,  6 Jan 2022 10:54:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 998D41BF47D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95F4F428A1
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVhz5NFdH3Xu for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 10:54:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB6F142868
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 10:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6020782AA2; Thu,  6 Jan 2022 10:48:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 11:43:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cff428fe313a9163098243789e2ac2bd7c20d447
X-Git-Newrev: 9b2a377edb9e566aded20a0d9a25200416d873c1
X-Patchwork-Hint: ignore
Message-Id: <20220106104801.6020782AA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system/Config.in: introduce pre-build
 script
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b2a377edb9e566aded20a0d9a25200416d873c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We introduce the concept of a pre-build script that works similar to
the already existing post-build and post-image scripts.

The pre-build script(s) are executed before the build commences. This
allows a user to run some preperatory tasks prior to the build.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile         |  3 +++
 system/Config.in | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Makefile b/Makefile
index ac98b84425..3099d35158 100644
--- a/Makefile
+++ b/Makefile
@@ -599,6 +599,9 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 .PHONY: prepare
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
+	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT)), \
+		$(call MESSAGE,"Executing pre-build script $(s)"); \
+		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 .PHONY: world
 world: target-post-image
diff --git a/system/Config.in b/system/Config.in
index b3abeddd68..8c66cad12a 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -533,6 +533,16 @@ config BR2_ROOTFS_OVERLAY
 	  They are copied as-is into the rootfs, excluding files ending
 	  with ~ and .git, .svn and .hg directories.
 
+config BR2_ROOTFS_PRE_BUILD_SCRIPT
+	string "Custom scripts to run before commencing the build"
+	default ""
+	help
+	  Specify a space-separated list of scripts to be run before the
+	  build commences.
+
+	  This gives users the opportunity to do board-specific
+	  preparations before starting the build.
+
 config BR2_ROOTFS_POST_BUILD_SCRIPT
 	string "Custom scripts to run before creating filesystem images"
 	default ""
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
