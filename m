Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0119EC77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 16:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6856B843FD;
	Mon,  8 May 2023 16:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6856B843FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5r4NxMZuok7; Mon,  8 May 2023 16:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A3B081E58;
	Mon,  8 May 2023 16:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A3B081E58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 707C01BF35B
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55A4A4087D
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55A4A4087D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZ7m2Zgk-fju for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 16:05:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60C1840894
 for <buildroot@buildroot.org>; Mon,  8 May 2023 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60C1840894
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E7BA86148; Mon,  8 May 2023 16:05:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 17:51:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05f9c34ad0b6bb3ef719db3df5fb44e3d6a5c2aa
X-Git-Newrev: d2f45dea4c4e3548c8938d69acb254c902bdd928
X-Patchwork-Hint: ignore
Message-Id: <20230508160516.4E7BA86148@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk3: fix update-icon-cache on
 empty directory
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2f45dea4c4e3548c8938d69acb254c902bdd928
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If both, hicolor-icon-theme (selected by libgtk3-demo) and
adwaita-icon-theme is not selected, then the /usr/share/icons
folder is empty, causing find to fail.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgtk3/libgtk3.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index d1840ef112..8291b8d356 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -146,8 +146,9 @@ endef
 # Create icon-theme.cache for each of the icon directories/themes
 # It's not strictly necessary but speeds up lookups
 define LIBGTK3_UPDATE_ICON_CACHE
-	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
-		-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
+	[ ! -d $(TARGET_DIR)/usr/share/icons ] || \
+		find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
+			-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
 endef
 LIBGTK3_TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
