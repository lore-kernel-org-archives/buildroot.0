Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5582CEFD15
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D50AA60C30;
	Tue,  6 Jan 2026 22:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcqxokuuHhle; Tue,  6 Jan 2026 22:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B245960C22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767737012;
	bh=MUj5F2XnK4w6dMo7vH5v2T3CxIdORHVLocMNzTAlbgc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bs+D16lac645G+TosNPU+IPrZnYSqWxQ/RfJkNOQ18DvuyQ/2/dQAXD9nalqWsdnz
	 4DV07X6fygSMOrChsAtAc53C65qUJtUlt2O4Y8buDDbVXBdBBuVtxdI3xUgnS5Ccam
	 r+N09wNa89t5sUccuUGaCfn6FWOA65kZyx5SMCCdL8VSQkzO34P9lIPhFnnQNzW7Gs
	 gF3S32ajOeMBpJn0ijdCT73tERL/xNtPHlpboOmTqSSDzEINNBsFOiQgXDIpjTT7rA
	 lqqwL0F2PygDjn+QIWywUoerlrRAzFlqruyIp9GMYRZT0xiP+8ES7n9D/PJ9A53T5p
	 aFsJubf9AYMxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B245960C22;
	Tue,  6 Jan 2026 22:03:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FC2B249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 170DE400E3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHhMU2udG34e for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9648D40107
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9648D40107
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 850FA88343; Tue,  6 Jan 2026 22:03:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 23:01:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fb684fd68dce4b16102baed6fc2578f35ff7959
X-Git-Newrev: 7b5735cc6914f694b2c3172244c5a925d55636fc
X-Patchwork-Hint: ignore
Message-Id: <20260106220328.850FA88343@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gvfs: remove schema compile and
 cleanup hook
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b5735cc6914f694b2c3172244c5a925d55636fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dropping the need for this package to compile any schemas as the
libglib2 package (a dependency) already handles this during target
finalization.

In addition, libglib2 already removes schemas from the target during
target finalization so the gvfs-specific cleanup can be dropped.

Signed-off-by: James Knight <git@jdknight.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gvfs/gvfs.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index b46b438dc6..6eff3bd859 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -157,16 +157,4 @@ GVFS_CONF_OPTS += \
 	-Dtmpfilesdir=no
 endif
 
-define GVFS_REMOVE_TARGET_SCHEMAS
-	rm $(TARGET_DIR)/usr/share/glib-2.0/schemas/*.xml
-endef
-
-define GVFS_COMPILE_SCHEMAS
-	$(HOST_DIR)/bin/glib-compile-schemas --targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas $(STAGING_DIR)/usr/share/glib-2.0/schemas
-endef
-
-GVFS_POST_INSTALL_TARGET_HOOKS += \
-	GVFS_REMOVE_TARGET_SCHEMAS \
-	GVFS_COMPILE_SCHEMAS
-
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
