Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E41C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2709605E0;
	Sun, 30 Jul 2023 10:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2709605E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQjBEVyoVLwB; Sun, 30 Jul 2023 10:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC75E60AFF;
	Sun, 30 Jul 2023 10:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC75E60AFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48AEA1BF8C7
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2275160644
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2275160644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LwUXasrhXDdM for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B24160615
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B24160615
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45A6D83C0A; Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:37:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2737af9cf9b490ffbd2a83d8897428a81a899d2e
X-Git-Newrev: 5a32daed296aa19813588438a732c50565960b26
X-Patchwork-Hint: ignore
Message-Id: <20230730103918.45A6D83C0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ssdp-responder: add /var/lib/misc
 for systemd builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a32daed296aa19813588438a732c50565960b26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to dnsmasq, ssdp-responder saves state data across reboots in
the /var/lib/misc/ directory.  In the case of ssdp-responder it is the
(per-device unique) UUID that is generated on first boot.

Workaround only needed for systemd builds, the sysv skeleton already has
the /var/lib/misc/ directory.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ssdp-responder/ssdp-responder.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index ddd87bc599..bb17641a9f 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -25,4 +25,8 @@ define SSDP_RESPONDER_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50ssdpd
 endef
 
+define SSDP_RESPONDER_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/var/lib/misc/
+endef
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
