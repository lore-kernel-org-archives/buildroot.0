Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0430C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8F34436D7;
	Wed, 10 Jan 2024 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8F34436D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epmB24NR1G2F; Wed, 10 Jan 2024 20:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2A8F43727;
	Wed, 10 Jan 2024 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2A8F43727
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90A571BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A04842276
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A04842276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_Ecs9NYgVX4 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:52:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B90DD4226E
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B90DD4226E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A47B085DB2; Wed, 10 Jan 2024 20:52:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:13:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bf9cac489bfe313623d0382446a1504d4f75992
X-Git-Newrev: 7fe4e29b5ea2c129c123df2d847fc8e04f06e93e
X-Patchwork-Hint: ignore
Message-Id: <20240110205222.A47B085DB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qwt: reinstate mkspecs cleanup
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fe4e29b5ea2c129c123df2d847fc8e04f06e93e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The qwt package is a Qt5 package, not a Qt6 one, so it can't benefit
from the target-finalize hook that was introduced in e29fcde4ba70
(package/qt6base: remove $(TARGET_DIR)/usr/mkspecs in target-finalize).

Indeed, the original patch was hard-coding the mkspecs removal directly
in the target-finalize recipe, and that was made a hook as a last-minute
change when applying, without realising that qwt was qt5-based.

So, reinstate the mkspecs removal as an ad-hoc fixup in the qwt package.

This actually partially reverts commit e29fcde4ba70 (package/qt6base:
remove $(TARGET_DIR)/usr/mkspecs in target-finalize).

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qwt/qwt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index f344ca4e3a..9f0b78655f 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -58,6 +58,7 @@ endef
 
 define QWT_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
+	rm -Rf $(TARGET_DIR)/usr/mkspecs
 endef
 
 $(eval $(qmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
