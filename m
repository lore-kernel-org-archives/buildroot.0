Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB39C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CACC4606C7;
	Wed, 10 Jul 2024 21:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zk0yc6fmH8S9; Wed, 10 Jul 2024 21:44:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E007860766
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E007860766;
	Wed, 10 Jul 2024 21:44:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA0BE1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D47AA80DEC
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uR7ubuJASgPS for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A5B380DCC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A5B380DCC
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02A9F84798; Wed, 10 Jul 2024 21:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:36:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5251865413c6a50759d6f48b3300dc1be6122fb
X-Git-Newrev: 1ceb7b971109f08ec2561d28172a37a61f7249f4
X-Patchwork-Hint: ignore
Message-Id: <20240710214403.02A9F84798@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbtools: install bash completion
 files and scripts
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ceb7b971109f08ec2561d28172a37a61f7249f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hooks to install the bash completion files and scripts provided by
the package.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tbtools/tbtools.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index 15766b67c7..baba0e8a3b 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -10,4 +10,16 @@ TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
 TBTOOLS_DEPENDENCIES = udev
 
+define TBTOOLS_INSTALL_SCRIPTS
+	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr install-scripts
+endef
+TBTOOLS_POST_INSTALL_TARGET_HOOKS += TBTOOLS_INSTALL_SCRIPTS
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+define TBTOOLS_INSTALL_COMPLETION
+	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr install-completion
+endef
+TBTOOLS_POST_INSTALL_TARGET_HOOKS += TBTOOLS_INSTALL_COMPLETION
+endif
+
 $(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
