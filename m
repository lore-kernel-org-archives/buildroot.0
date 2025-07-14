Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D30C83F21
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 10:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74BB881ED7;
	Mon, 14 Jul 2025 10:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PGxqXFXQ2YE; Mon, 14 Jul 2025 10:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C79981E46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C79981E46;
	Mon, 14 Jul 2025 10:09:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73312967
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 10:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 598986142C
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 10:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOvkOhkcTCl8 for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 10:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0128C61438
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0128C61438
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 10:09:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E658C86503; Mon, 14 Jul 2025 10:09:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 11:48:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 993c0ba4603fb86137effef288207a2acdcd7f01
X-Git-Newrev: abdc96eaf86b9691e37b2187e7b34a0c5c364952
X-Patchwork-Hint: ignore
Message-Id: <20250714100926.E658C86503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eudev: install hwdb.bin to
 libexecdir
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=abdc96eaf86b9691e37b2187e7b34a0c5c364952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hwdb sources are always deleted from the rootfs image (see commit
07aa585aa6517eeb7f805b4d84a9667be4b3e259), so the resulting hwdb.bin
is installed package data, not user configuration. The name of the
"--usr" flag to "udevadm hwdb" may be confusing, but it chooses the
libexecdir location, whether that is in /usr or not.

Eudev checks both locations and prefers the one in /etc if it exists,
so overriding the configuration in an installed system is possible as
before, with the advantage that /etc/udev/hwdb.bin (if any) can be
deleted to restore defaults.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/eudev/eudev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 99c9f0dcab..e9884f52d5 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -82,7 +82,7 @@ define HOST_EUDEV_INSTALL_CMDS
 endef
 
 define HOST_EUDEV_BUILD_HWDB
-	$(HOST_DIR)/bin/udevadm hwdb --update --root $(TARGET_DIR)
+	$(HOST_DIR)/bin/udevadm hwdb --update --usr --root $(TARGET_DIR)
 endef
 HOST_EUDEV_TARGET_FINALIZE_HOOKS += HOST_EUDEV_BUILD_HWDB
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
