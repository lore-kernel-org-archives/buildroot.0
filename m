Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE25C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15EE44151B;
	Thu, 30 Dec 2021 14:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aI_ZgchNUiWF; Thu, 30 Dec 2021 14:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FEF141521;
	Thu, 30 Dec 2021 14:20:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B633C1BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A506460BF9
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkqEWmN_G8f1 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:20:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C531607DE
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:20:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 212EC82AE0; Thu, 30 Dec 2021 14:14:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 15:19:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d12925603417c99bbeab693734b208a8dfbff26b
X-Git-Newrev: 0979a9e13c45afa20d60122747409cf82164147c
X-Patchwork-Hint: ignore
Message-Id: <20211230141415.212EC82AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/font-awesome: make it visible by
 fontconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=0979a9e13c45afa20d60122747409cf82164147c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit creates a symlink that ensures fontconfig will find the
fonts installed by the font-awesome package.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/font-awesome/font-awesome.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 666346be0e..5211ac22a5 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -13,6 +13,8 @@ define FONT_AWESOME_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
 	$(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
 		cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/font-awesome$(sep))
+	mkdir -p $(TARGET_DIR)/usr/share/fonts/
+	ln -sf ../font-awesome $(TARGET_DIR)/usr/share/fonts/font-awesome
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
