Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7FDC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 18:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D320608B6;
	Fri, 19 Jul 2024 18:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uru2b2DWnIwK; Fri, 19 Jul 2024 18:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4C2B607D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C2B607D2;
	Fri, 19 Jul 2024 18:07:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A29271BF30E
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 18:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 907FE83EC4
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 18:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsC4CSuziR-8 for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 18:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99C1482126
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99C1482126
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 18:07:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8279486E56; Fri, 19 Jul 2024 18:07:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 20:03:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89e3b2fb846506217b4767fe9165f1641a407314
X-Git-Newrev: 27e7b0bf14cf2321e2aae64e490671f5cfa2281d
X-Patchwork-Hint: ignore
Message-Id: <20240719180702.8279486E56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tipidee: fix install without
 config file
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=27e7b0bf14cf2321e2aae64e490671f5cfa2281d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the tipidee package was added in commit
17deaf60f66fc08a796233920a104e5233b501e0, the committer refactored it so
no separate boolean option is required to enable the config file.
However, in doing so, the case where the config file is empty was not
correctly handled: BR2_PACKAGE_TIPIDEE_CONFIG_FILE is never empty
because even with the empty string it contains "".

Fox by qstrip'ing before checking for empty.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/tipidee/tipidee.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tipidee/tipidee.mk b/package/tipidee/tipidee.mk
index 1e15782aa4..915b4f84bd 100644
--- a/package/tipidee/tipidee.mk
+++ b/package/tipidee/tipidee.mk
@@ -33,12 +33,13 @@ define TIPIDEE_INSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/libexec/tipidee-config-preprocess
 endef
 
-ifneq ($(BR2_PACKAGE_TIPIDEE_CONFIG_FILE),)
+TIPIDEE_CONFIG_FILE = $(call qstrip, $(BR2_PACKAGE_TIPIDEE_CONFIG_FILE))
+ifneq ($(TIPIDEE_CONFIG_FILE),)
 TIPIDEE_DEPENDENCIES += host-tipidee
 
 define TIPIDEE_INSTALL_CONFIG
 	$(HOST_DIR)/bin/tipidee-config \
-		-i $(call qstrip, $(BR2_PACKAGE_TIPIDEE_CONFIG_FILE)) \
+		-i "$(TIPIDEE_CONFIG_FILE)" \
 		-o $(TARGET_DIR)/etc/tipidee.conf.cdb
 endef
 TIPIDEE_POST_INSTALL_TARGET_HOOKS += TIPIDEE_INSTALL_CONFIG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
