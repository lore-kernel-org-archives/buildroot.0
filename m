Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3F7C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7B8460B13;
	Sun, 30 Jul 2023 10:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7B8460B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9A4Rgav5TQ9; Sun, 30 Jul 2023 10:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE346079B;
	Sun, 30 Jul 2023 10:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAE346079B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 991D91BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C2584091A
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C2584091A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2f9yl4POyT9r for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DD78409A7
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DD78409A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58BCE83C0D; Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:37:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 268db827a23cde6870edaa067955c0acc82a7686
X-Git-Newrev: 893d642a77c8e92bbc2349998950e2a784b5e5bf
X-Patchwork-Hint: ignore
Message-Id: <20230730103918.58BCE83C0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mrouted: add /var/lib/misc for
 systemd builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=893d642a77c8e92bbc2349998950e2a784b5e5bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to dnsmasq, mrouted saves state data across reboots in the
/var/lib/misc/ directory.  In the case of mrouted it is the unique
generation id (used by neighboring mrouted routers to identify any
router restarting).  This file is generated on first boot.

Workaround only needed for systemd builds, the sysv skeleton already
has the /var/lib/misc/ directory.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mrouted/mrouted.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 3e2f49dc10..0d2071c4f0 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -18,6 +18,7 @@ define MROUTED_INSTALL_INIT_SYSV
 endef
 
 define MROUTED_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/var/lib/misc/
 	$(INSTALL) -D -m 644 $(@D)/mrouted.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mrouted.service
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
