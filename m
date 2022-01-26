Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D375BC2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 12:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4560240949;
	Wed, 26 Jan 2022 12:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMJlYRBvPcFA; Wed, 26 Jan 2022 12:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ECB040132;
	Wed, 26 Jan 2022 12:50:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 798F21BF473
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 12:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F03740949
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 12:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2TF-hEa7hkQ for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 12:50:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B6A640546
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 12:50:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B73068257D; Wed, 26 Jan 2022 12:43:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 13:26:01 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: c27663d70b19d07edbe3a64e406e0ca7c8a8a802
X-Git-Newrev: 11fbee06c3bfa53f9194b7c115570ed3877e1565
X-Patchwork-Hint: ignore
Message-Id: <20220126124312.B73068257D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/font-awesome:
 make it visible by fontconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=11fbee06c3bfa53f9194b7c115570ed3877e1565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

This commit creates a symlink that ensures fontconfig will find the
fonts installed by the font-awesome package.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0979a9e13c45afa20d60122747409cf82164147c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
