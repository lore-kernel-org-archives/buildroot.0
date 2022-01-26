Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C097C2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 12:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB58D405AD;
	Wed, 26 Jan 2022 12:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Rn6mpGf4MOU; Wed, 26 Jan 2022 12:50:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD62840949;
	Wed, 26 Jan 2022 12:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04D881BF473
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 12:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01EDA81AF5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 12:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6Xv02zbJys1 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 12:50:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E6A681C81
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 12:50:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AD8B78257D; Wed, 26 Jan 2022 12:43:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 13:25:37 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c6e486cf1e815c50d6cac136296e08bbd0816062
X-Git-Newrev: 0990b46f521a778ea3064b0eef29adde6fe60d4c
X-Patchwork-Hint: ignore
Message-Id: <20220126124317.AD8B78257D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/font-awesome:
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

commit: https://git.buildroot.net/buildroot/commit/?id=0990b46f521a778ea3064b0eef29adde6fe60d4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
