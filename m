Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644FEC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 12:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3485482003;
	Sun,  3 Mar 2024 12:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzjh1r-6sMNz; Sun,  3 Mar 2024 12:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5976981FFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5976981FFB;
	Sun,  3 Mar 2024 12:28:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 830811BF34A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 12:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70CD060874
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 12:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6FpSY-L4zCv for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 12:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B00DE60AE2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B00DE60AE2
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 12:28:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D85987F87; Sun,  3 Mar 2024 12:28:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 13:27:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe1b0818364be4742815f69a102ac2e676784136
X-Git-Newrev: 8077efb83769d43f976f7159f2c861e20163c96e
X-Patchwork-Hint: ignore
Message-Id: <20240303122810.7D85987F87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/conmon: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=8077efb83769d43f976f7159f2c861e20163c96e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since the addition
of the package in commit 06f50ff1bf066feb6cf6ed512113773f87c884fb:

src/conmon.c:5:2: error: #error conmon.c requires C99 or later
 #error conmon.c requires C99 or later
  ^

Fixes: 06f50ff1bf066feb6cf6ed512113773f87c884fb
 - http://autobuild.buildroot.org/results/b573aceefde04435ea13dfd2a48f9c2372bde4d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/conmon/conmon.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 214cb460a5..1e57786686 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -25,7 +25,8 @@ define CONMON_CONFIGURE_CMDS
 endef
 
 define CONMON_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -std=c99" \
 		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) bin/conmon
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
