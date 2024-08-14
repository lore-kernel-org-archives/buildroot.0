Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE73EC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81810608F5;
	Wed, 14 Aug 2024 21:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKkalGRicLQe; Wed, 14 Aug 2024 21:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DF40608F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DF40608F6;
	Wed, 14 Aug 2024 21:44:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADDE21BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C25F80D78
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EMR3XtpzeMej for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08762808A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08762808A8
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9235813BB; Wed, 14 Aug 2024 21:44:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 23:44:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1feacea6675a28c4a3dc5e7a562b035468e3490a
X-Git-Newrev: 67e6d0a3f1a0893183885b947f4472ef4c04bfc4
X-Patchwork-Hint: ignore
Message-Id: <20240814214444.E9235813BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: add missing unbound user
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

commit: https://git.buildroot.net/buildroot/commit/?id=67e6d0a3f1a0893183885b947f4472ef4c04bfc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without the unbound user the daemon does not start on bootup.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unbound/unbound.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index ff0262bef1..6ce6f9a1ba 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -54,4 +54,8 @@ define UNBOUND_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S70unbound
 endef
 
+define UNBOUND_USERS
+	unbound -1 unbound -1 * /etc/unbound - - unbound daemon
+endef
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
